Return-Path: <linux-arm-msm+bounces-99425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKc6E0TCwWkHWQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:44:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E350A2FE705
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED34A30EC975
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52EAD38423D;
	Mon, 23 Mar 2026 22:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJ2kD7eZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e1/1+YHI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BF0383C71
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305556; cv=none; b=bzPK+YrGD+JRBWvJk//iZXPDu08hBxAxrNBv13gzhy5Bp4yl25dA8zaE4zbwCp1KgvY+VS121/Kj7jKzPnurlr8uU7T571yb0nQqWCYybGB9a9U6bb5gHPfx4S7niyIk2xYiRqUw+UAZJgemHhvc8LEABHW931kMYIMfhotHDYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305556; c=relaxed/simple;
	bh=CrLGv5edH+UZPIk9+prSCn/qT8iVjWiDSBnsGzRqcxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CLPw22mkUfb1M7+maHsY8jnLt7pO0hAkTszeEFAPBkbmQXb0EzsyHfy31jGOFBjnKE/BJ4DK7XbphKMRyju/ZAJeZVv67xACjoyEGhMUav+R1KmQW12HDXnbIYfZYzpWgI38XnO81AHVBpR9wMqYZlma1f9ZOMK2WBibPnvP7SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJ2kD7eZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e1/1+YHI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqu5O3934989
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aiejSc4X5A/
	gorkmczOj6dnKqerAsQHN9lH+LChbOlI=; b=QJ2kD7eZ+YvhmGGDHuQEChlMndd
	qZF3loald53N2NcXT6vW9/EIvM7p/kO+WVi7L7bbIlBje0U/MvBy51rvZM5Bselm
	FIxmGe7iJhc4GXI8TO2KhtCNVtDrDyGWZO6eEfnsyEF1eUiZRUUPu9W4OgL9OAVZ
	4cfSPa1+isqeLKsNTavLPjXt4lPWpE8yn/s66vUJQadXAIhFIXHdfOwahAchGEnK
	ZDulcbFK/SRhEHyMIlaefS0IwlbUg5r4VriDvXoZl3Zaep/W1Ntnjie0FjNWjc9w
	EdP6/iDYsz8kK8Tp6CYEgSh1ISU3gl6OYcUFR2K36ezP5zoSGDkCBbtlAWw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0hkch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso200307501cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305551; x=1774910351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiejSc4X5A/gorkmczOj6dnKqerAsQHN9lH+LChbOlI=;
        b=e1/1+YHItIeN0aQZU4D+BMxMGmcEdlfIVO8++/21OhE3VslO0B0IxzYF/UiBdaY9c3
         taY2rH9sVlanD0OcoG3JV9wNkUIPQzVMr81RFzYLTIMU0jmqvSqIbSRU16fK9qnvL1Qs
         C/sWcVG3LkxoWSwAbT9xHtd2GH6BwdkH7eNcjNAKcTFziTT5emBsc/w8BlWgcq89r/RW
         aUZBJ9WhjEzWTBi1DEvlSXp9cPacDZYBV6bb5GI9iWMQuVqs/iCldhfgInRi8UnPp+01
         WsWdpGijmSSLq/QlBx5oJbTQh9adpfzZyYZdJzyeaZF/YIfMJoBl5YspFp2Zcp/wrKk4
         ZR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305551; x=1774910351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aiejSc4X5A/gorkmczOj6dnKqerAsQHN9lH+LChbOlI=;
        b=M7UVhEzNbQjC1rDeb0WgP0Q/YsiDPKxhAGL6Psx9K6SYWrVCOUxjwAUFeBcXvV5I+W
         +SXNinS9gx5JIECIMtzyw8sFgDSS08nYLiKkuZKy7YDjAt7hBd1AMiCrutiPJWou0SNS
         TXNZYBufxCl1UHsKVCFWtWPu8CGJkTX+QLssvSXYpY2W/X2cV6Q7Uuu33t6TvDmT1RoZ
         /TZBSkwTcMJwBmYU9SqTnp2C2Nr4UnH5aSqx4hdPf+tdjbzrSwVjyTvrvbW4jog/uHOT
         qj7IdhdxWfSV14BPkDP3P5L8rcwqzS1yKWPUpKukqDcKT2pZ1EyCwbfk2aBdrA58kAYL
         +NLA==
X-Forwarded-Encrypted: i=1; AJvYcCWfOSKJUz81Z/Wy1lMoJG0P9IsNP7AGMYZKfc6GsdoJ/SEJBQpyajGl9GPNrD3DQidGsoa3E+XyV3ca1Mkp@vger.kernel.org
X-Gm-Message-State: AOJu0YyIBc5RO0Hb9Cgjjk63GgsyOJH9gwBh2ksR7CS3uRaGQSGNL1br
	sYBaL5EfLnmZJqZmcQuwp16Pq3tPtj7nGJalmboUNRD9LSThH9lVb8D4Tsi9+Q1v89kxlFs+geL
	IvYkjBOGE5GRJyAdZ6ajrVX4Xr8FWUh42yg0G9AMg+tY+hnIxGK4XVfFzIqVXIZOOO6N7
X-Gm-Gg: ATEYQzzwPh6+r77OZ/ndRmvPQt0lORaIBU9i3IQfgcdualXpzfzcXOSLo0VSEXCudNz
	AkB97acrcdNUWrndrF/M2r3u2cszjzXEZIKcBIcwQa8shskV/tMVb2SdAI1pg3uMqDEQpb6L8wz
	QYW2XW86qDvBorFT3akPLj+pqBTYCnWUM9ryKqSm++Nq64LRafROpSSONsInvqCdQ+r+N0KVWWp
	DA+nY63p+tfzXsm5LnDJgQGtsYAjb/x1YdztiTwhBbfd4rrcegbPfRmmq1TU3hTzY9QcgxFF9vD
	lLgubmXNJYLAIwoC1gjAvMVCDGENRbijhZhIlWZWlG3ZzQuKtSd1LcwLh2nI8h2DbJW9TcsFXQ7
	3/e4YLvlBhiSLtVbYyBYEIGw4ZyTvz6WA7lFDi3i9MLkdaz7igeigLSY=
X-Received: by 2002:ac8:714b:0:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50b6ee5ccc1mr16161671cf.23.1774305551442;
        Mon, 23 Mar 2026 15:39:11 -0700 (PDT)
X-Received: by 2002:ac8:714b:0:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50b6ee5ccc1mr16161301cf.23.1774305550963;
        Mon, 23 Mar 2026 15:39:10 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:39:10 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v7 09/13] ASoC: qcom: common: validate cpu dai id during parsing
Date: Mon, 23 Mar 2026 22:38:41 +0000
Message-ID: <20260323223845.2126142-10-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c1c110 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=FTFSxu1yF2iZ1NjiFwcA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX0jkDSnkmbnXf
 nOf2dzT+5qa5EuXUUklrysbXTcp+Nyyyj5yAbzPtCO7f4IO3IWTnoPboSC0IbO+4Lf2r4Ra+Khr
 ZkzkVmVyPtl9m6k3WPdt7Nrc4z8wVz9QEZAK6AIHbx3DVkAxYIRGzC4hnU8zInlp2/FVm7NLVdD
 Q10CW1lh9Pc0b+tXpTdnD1lI9oZrKS52qjQrJ6VeTd/9GEca94/AqmZ0QK7Fp+IaE6SCqbCh6m8
 3WxWXISCujhHu3Do+He0tjvhtIFDdK5Yc0fnCfZ1A/ps2mvQZnbOIy2NoBGxC7qKWpWxuyCOgS3
 qBGBQvL2n0+ILVfVgDLdpV7FN4qL9EQWPC5uS0ojBDu76qguo0DJfEjPzcfVHvpxTua/5tc70eM
 mE8xOJ8+FbnsrlBCkgevwmEv9jUy64F6Qp1rBFc8GrjGGTiC5Asyp6+AQM/vZeyWJwhE8TgLy2e
 Yk17OAVcGIG2fIZ3Pag==
X-Proofpoint-GUID: SZXb6hyogy37nQLM6ftUB3nWoI13Hb6Q
X-Proofpoint-ORIG-GUID: SZXb6hyogy37nQLM6ftUB3nWoI13Hb6Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99425-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E350A2FE705
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

lpass ports numbers have been added but the afe/apm driver never got
updated with new max port value that it uses to store dai specific data.
There are more than one places these values are cached and always become
out of sync.

This will result in array out of bounds and weird driver behaviour.

To catch such issues, first add a single place where we can define max
port and second add a check in common parsing code which can error
out before corrupting the memory with out of bounds array access.

This should help both avoid and catch these type of mistakes in future.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/common.c      | 6 ++++++
 sound/soc/qcom/common.h      | 3 +++
 sound/soc/qcom/lpass.h       | 3 ++-
 sound/soc/qcom/qdsp6/q6afe.h | 3 ++-
 sound/soc/qcom/qdsp6/q6apm.h | 3 ++-
 5 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 7ee60a58a336..cf1f3a767cee 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -120,6 +120,12 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 		link->id = args.args[0];
 
+		if (link->id >= LPASS_MAX_PORT) {
+			dev_err(dev, "%s: Invalid cpu dai id %d\n", link->name, link->id);
+			ret = -EINVAL;
+			goto err;
+		}
+
 		if (platform) {
 			link->platforms->of_node = of_parse_phandle(platform,
 					"sound-dai",
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index 1b8d3f90bffa..ee6662885593 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -4,8 +4,11 @@
 #ifndef __QCOM_SND_COMMON_H__
 #define __QCOM_SND_COMMON_H__
 
+#include <dt-bindings/sound/qcom,q6afe.h>
 #include <sound/soc.h>
 
+#define LPASS_MAX_PORT			(SENARY_MI2S_TX + 1)
+
 int qcom_snd_parse_of(struct snd_soc_card *card);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index de3ec6f594c1..68b71039b981 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -14,10 +14,11 @@
 #include <linux/regmap.h>
 #include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
+#include "common.h"
 #include "lpass-hdmi.h"
 
 #define LPASS_AHBIX_CLOCK_FREQUENCY		131072000
-#define LPASS_MAX_PORTS			(DISPLAY_PORT_RX_7 + 1)
+#define LPASS_MAX_PORTS			(LPASS_MAX_PORT)
 #define LPASS_MAX_MI2S_PORTS			(8)
 #define LPASS_MAX_DMA_CHANNELS			(8)
 #define LPASS_MAX_HDMI_DMA_CHANNELS		(4)
diff --git a/sound/soc/qcom/qdsp6/q6afe.h b/sound/soc/qcom/qdsp6/q6afe.h
index a29abe4ce436..0b8c3ec1315c 100644
--- a/sound/soc/qcom/qdsp6/q6afe.h
+++ b/sound/soc/qcom/qdsp6/q6afe.h
@@ -2,8 +2,9 @@
 
 #ifndef __Q6AFE_H__
 #define __Q6AFE_H__
+#include "../common.h"
 
-#define AFE_PORT_MAX		137
+#define AFE_PORT_MAX		(LPASS_MAX_PORT)
 
 #define MSM_AFE_PORT_TYPE_RX 0
 #define MSM_AFE_PORT_TYPE_TX 1
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 7ce08b401e31..5cf538397841 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -14,9 +14,10 @@
 #include <linux/of_platform.h>
 #include <linux/jiffies.h>
 #include <linux/soc/qcom/apr.h>
+#include "../common.h"
 #include "audioreach.h"
 
-#define APM_PORT_MAX		127
+#define APM_PORT_MAX		LPASS_MAX_PORT
 #define APM_PORT_MAX_AUDIO_CHAN_CNT 8
 #define PCM_CHANNEL_NULL 0
 #define PCM_CHANNEL_FL    1	/* Front left channel. */
-- 
2.47.3


