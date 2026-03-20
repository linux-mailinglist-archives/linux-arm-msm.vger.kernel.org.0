Return-Path: <linux-arm-msm+bounces-98946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CetKnBivWlF9gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 16:06:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E35F2DC4AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 16:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5D0030CA82E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 14:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25033CCFAE;
	Fri, 20 Mar 2026 14:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ex6PhGk+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Io7oFoAK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135D43CBE7C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018181; cv=none; b=N2p4R6e7z+azhcWFm34F74q19ZBBuIqbleGoeyAEQayVXFyUDfAz3s/K6DC41s0/yk3bnOa8T5ZiHuAmwWORrSze/Jidu/pms1umr7DAy8tN9Hd2tT/pHB5jufJtcnm1/vLEED8bAlm9fuO+kE0skoCtKq6BIQAQDw3HORNE71Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018181; c=relaxed/simple;
	bh=CrLGv5edH+UZPIk9+prSCn/qT8iVjWiDSBnsGzRqcxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=llqTYZ//cCNNJLNwYeKm/jus2AbicYHuFXc7mQ0XankzaUsrXmmKrQeOB74vXibg6rb5VLLWjn77VJlSQw/FDO2SNsBJpTJxXQOYToX1P7BsDn0cmSthV9tECF7D9EbXs2cGvvwWmKrB3wgsnzpbJUYb9Ka/ULGknfKbqKE9l5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ex6PhGk+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Io7oFoAK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KDF5473557545
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aiejSc4X5A/
	gorkmczOj6dnKqerAsQHN9lH+LChbOlI=; b=ex6PhGk+hwkp+aQgRMUmR5edSIB
	o8qn7Gs3qrueSo5JgvUnRz2j2EDDPyX3BE0mw4RYEA2WuboBHzAZxnRNH8kEQOzJ
	n5Z5+jO+bRGylLE/T0WqAxKZIoPH6ZUcfp6annnBc8NrI9WpHiNSzgHQae0I33+6
	8LJgu0PBwiwB56goJ60GKOcVIXHWQa7tRLVFhAKN4khOL9QAslNEMgyq7F555zHG
	buofdsGRAAEsm2GROmCoOWOcxhMkqVu7dDGcUtpYSMJ94Q/kuhwSbYIN8quYJgp9
	jT2aeuATUnmv6/Kw22rdmlTym++RsboAiDneha1yJSKHGffRlB42YYwwe0Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0r1gtfp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091a96f0bcso23282161cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774018178; x=1774622978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiejSc4X5A/gorkmczOj6dnKqerAsQHN9lH+LChbOlI=;
        b=Io7oFoAKu7Y6dwrMzHPKnd+EEjgpoPhGOyDBahhiZK4xzBId/IbFa6SIEdi5YvYy//
         4Zo4xeGeHt+2Ci8YIRE7Und7+sXbSr+FZkHFpjRApLG+kbf0XZdXUJ1zDFjln4Eu5aqk
         ly3zZeDftFyO3Vi59R5krKI4lGWY1f6nEMsB+K29npNc/pO3mW2zcDTedgLpGJjDCrQ5
         xpwT4AQLHpkopiUUeFWoeRCb1ZsowbWeogkeSSHdytYbCEj1bFLe/p2XtcpKEuemB5hs
         p2ti1QeADz4lTDS3rb0lEUp586E1tYpOYSJqvvk0bXRJymxxQGuv0tU76xioe51yHgCp
         yj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018178; x=1774622978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aiejSc4X5A/gorkmczOj6dnKqerAsQHN9lH+LChbOlI=;
        b=GlPj0SnSbEChNUtbFHnEJnKftCbtpATITJYXAjIVQVKk7jq+o7JIFFTx1aPTrz5neP
         wHHezBnmndfabCQsfQ35O4g7od7wpVW8WRTwhwzaMLGx1Eh9MOBNn1IvMqGR1DWEKj6g
         582HIRb9tiaEIb/Yff3eiGwAbbBS5iFhVTq1VZUgqHdCf91GPQosJzW1jbCbem1ib+Kg
         MpjasqswC5eSRvD0gYqf+G6q2bzEg5GzM5RXT5VVr90T9ZAYyAWnsZvMdwRx276yl4iO
         /Mf/h5gZYA1e+BqdaUM/o43qT3+XrAW2jbp2d/3Mh2FgheUJCDAsSUQt0xGCnJyvIoxe
         OT/A==
X-Forwarded-Encrypted: i=1; AJvYcCWU4ozeJwsBVdXGI2KYhcmVAEUbAGzx62BJF5gmb7gW9G6ai6+VS46PeTD0j5pS4HeWOW5oddaV6foDsFue@vger.kernel.org
X-Gm-Message-State: AOJu0YwlORwUAmyDKMfU+VNBwKuH5npSij95iXVEKdAH2CNnDKlG2qrc
	tOzVm+Q+ltlskeG/UKYq3SlaxyKdjZ80dLHwXWZrOr26AZkCTbhcUsWTS38roa4GUoOpmEO4G3i
	7AsLNwDcyuIOz+NnQy0RZqY0Ycal7wfmNQCr9/0I01WZcxx235jysTA+W4BB5Qh/g1abJ
X-Gm-Gg: ATEYQzzE1Q7dKpt2g5M3iwSdWwct3bLSIY/k+GEJBkEZKTaX1cQTZJxJjcixG9TMFpN
	l0/XG5p3zvAXIoG+BWPtHgPynnbg/EIbulPFOgotjSNivblclnlAkmpM0x9IH4/RngZtZCsEz96
	WC0G5FJAAcmc7+GJG9saXQ/yqAQi6hFwxfz3OYWIJIqh8ijYkLmtECC7Ww1CaDKuN0w6oxkJpR+
	TzI2KJLR/hQjAEplqOkADYn/g6Kg/hHqp/kjZxCN2OtGo4TdEzXk2NPHbWPZ9/jZdKXxDBmoJdz
	lZ9HiIbBqa3Owo4GRWb+AIkK1q9/8zquw4OTRUFITf7ZhMSCZOhzmoYhQGxjBqis4xdGYCikXkY
	rt4X/AncX+QjL3Lzo1giMf6AS16sQ73n/Qm0tfzmsLHdygIkn5wuZo24=
X-Received: by 2002:a05:622a:2c1:b0:509:1568:1f16 with SMTP id d75a77b69052e-50b375d4d49mr45800751cf.71.1774018178281;
        Fri, 20 Mar 2026 07:49:38 -0700 (PDT)
X-Received: by 2002:a05:622a:2c1:b0:509:1568:1f16 with SMTP id d75a77b69052e-50b375d4d49mr45800131cf.71.1774018177827;
        Fri, 20 Mar 2026 07:49:37 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm47906825e9.1.2026.03.20.07.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:49:37 -0700 (PDT)
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
Subject: [PATCH v6 09/13] ASoC: qcom: common: validate cpu dai id during parsing
Date: Fri, 20 Mar 2026 14:49:14 +0000
Message-ID: <20260320144918.1685838-10-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDExOCBTYWx0ZWRfXyZuRs0HyClKT
 2jQlv4jAwTDTx2vHlb2QC5nLRKLMw7X6e2wEgCeinNvVslGAI1vbBr/MLzdMvlHqhCZseV1HWOk
 gQkeY1+v/jQLgRCQOCUP01Xi/EHEtak04E12Uyd2BhkG+TgNqgE8ZsA8PIEySgnRUijBhR7euZs
 vSdB+wdMGYZKxJ9rVVUTB2lnJcRrCaRfs8/Lg6QcalaM5/2mtwVPDcRX9ZgoSaCmOuX7kaXy5te
 J1KzrehwivhLJvcSpfZC7IVc/QDKxRtAR9N/lByAF6u747gMHce0pMWDErzn6wF7sIh2ihbAYAE
 cLJAt9G7L0gVgA7JCF6Bk+PFACt7a4Bk3qpgaOCRnoKRK6wu5hcpJN2fW43xsuiPdKiM/GZuX0R
 lnxka2G2paBfLiF5IbZ5r1JFos26E8poiEYU/n4q8TuZPikIBRx0+bFpiKFtBWUeBG+pPYqIQq7
 ktz+Jg1cPY3WIArPCFQ==
X-Proofpoint-GUID: LOhDFUNhWBtG2YRzjten6nJhDlB6f9hH
X-Proofpoint-ORIG-GUID: LOhDFUNhWBtG2YRzjten6nJhDlB6f9hH
X-Authority-Analysis: v=2.4 cv=Y/D1cxeN c=1 sm=1 tr=0 ts=69bd5e83 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=FTFSxu1yF2iZ1NjiFwcA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200118
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98946-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.968];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E35F2DC4AA
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


