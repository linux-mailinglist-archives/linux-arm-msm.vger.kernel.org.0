Return-Path: <linux-arm-msm+bounces-95804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLxSCLjHqmlTXAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 13:25:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB042208D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 13:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE6963094F84
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 12:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F395B3947B1;
	Fri,  6 Mar 2026 12:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8aKK6/Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kezEdVVZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0861D392814
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799742; cv=none; b=CwulzyinR/oshoMe9QO5HYFsjFfLwbroP/KDQxutHBJ+DjSBzw0oM6hsUuAEmQbKOIr5d5le8aGpvcdHrk97sIoF/7T5dkw6FSFpYKSyjcGBDlHgrCEvXH7lJWlCSIJ9Y+GDbdqjHXGKXIEX3su5B64fTT41vCANaMxP1dzAwp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799742; c=relaxed/simple;
	bh=sljgOhpaU8wHMtLfJBiR4fUV3hNt3/HmvH6kZPwy9as=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pHyE4yBz4l/bcXE6f1jilYf83qHM/QP24kVFfqAY8prozyi+yqpdRgW94pmiTHEsvEsheHuNrFDdJ+PgZuclAk+TkXrf8kiBLqepbtcDrOthDohmVLTc4hFbodOZZWrFfDAy3XLnbZjlgnbK2Qvb/QCJdziH9qHKWckgmFSK3xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8aKK6/Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kezEdVVZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbPxL630109
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 12:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=79Hssidv5J9
	yhS1Hc5RwtLaxh/YVdwsl6nwkjjN6Bow=; b=M8aKK6/YM+T+Yq/STX4au9lSml/
	0yZRAh5L+EUHlUqbf0Byg+i8n5tElz3k4BibRqYcxV85ORR0rK0/Yt9HIgPvyF1U
	zhVfzWZgF+b5h+URskJm+u/0qKTLhV+nItkMLwZQJ+yQ5oLW+nM4QRIynu7pi41S
	AEEB3nf6rn1UvB/vq9aKvzwyF4RJKpJKxjFtyB9Cc9VZs/P6qW0BIhroZwlbITjC
	B/KziA+l42IFclh1VbnszhtkU8N4Hr+j3Gn8E/9Ubp8ih742m3Szb35/DfXBpVNr
	GcSkmD8Bimq9awTII0OxJYYBcKDqs0vS84Vn1y97Y1FyyQd59c4D2d5gFDw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqj4sam6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 12:22:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3b0d938dso5840569785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 04:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772799732; x=1773404532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79Hssidv5J9yhS1Hc5RwtLaxh/YVdwsl6nwkjjN6Bow=;
        b=kezEdVVZ2Tl5Fil7UPcvBqE1olnSlaNN6Sr1tc9/uZ6K+8cNRKb8L+y8P1IOql7ci2
         r8EhP96o6jroW1+dbOlpDYJpgQyPNx72w+SJp3Ez8MqfEuPJbu10gsZwr3nSdLh4qPf8
         hc03Q5/FJQY6tIPHjcSEsSeVjOowwLNhj/E5l96XDtzUjyULiZNQFJ74odTGdiwvAdwF
         BP9X+CgCiZmkVibxg9Z5EPJkAQiG81CQXsH2vSOUqdCmqQ5f2eMBejw7ofnOhdufI/Db
         iXKyMlRfXDRykY5YVeag7dnrkKKx2XJPsBA6ZWt8D/9wRV46gcnawpH6BsbAa+NztNnu
         fReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799732; x=1773404532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=79Hssidv5J9yhS1Hc5RwtLaxh/YVdwsl6nwkjjN6Bow=;
        b=iUSRyjWrkkO7HXhxGrAli5uaoUc77tLxv58pcTQxb8M3eMLFkHpoorCRhEWJo9Ha5u
         0+3imZNcf6EelACofM4CYvvrF1ILU2g6jnuzGyk+I6pruh6mOvBSP91oHAyRiL+Tngmd
         tlW1eopGvdsn3FgBhH8tKcFniARS2lQobI57YxoZTgNbnAnvRnIqEvM9evaJWAPLcFPT
         zzQhDedmu5cbrd0HgN3uD/e5LXu8b8Hv3sZdM2ThiIHiswZzjzUPsOeOg5hupxbJF7r5
         RVh4oHjgoGnvRqzh7dZ/YHU/LgYpwnutr3rxY4CMGyaw+24S1ypJwAgMHw2A4DE6Xayw
         uM8w==
X-Forwarded-Encrypted: i=1; AJvYcCVUSWPvhEKtr0vvVnGiDJQ2RgNtaLD8ecCj6n21rQUo1WvyJHHOz2pnX0CpvJnjbGshyc2iRqIkHZrd8ytU@vger.kernel.org
X-Gm-Message-State: AOJu0YyoD94zk6MVShWflkjVoIe875qTOhls7pB1KDb0FKrfp/RCxUSg
	AvCef7ZZRWz+/t+ol12Gz+ypgQlA8R8VlK4o9VRWRI/sEwP3BCiC8eRhEXMOXAj6SoUSVyMflSe
	ABgdeVgmI3oCThi7IHPQPOci2k+rGAt7O+VG+BmOpid1QxZCpUOBVzQjZpLYBb11/vDRa
X-Gm-Gg: ATEYQzy9GNXnDwI3rZ3ysMhig2H/jYT6pXfc/8CTe0fsjoUmm0k9k0+G70yFP9pkaLo
	dEQo+G+1cPSmXnhfCCdqhLKfG7DPzkYbA+vAorE0Jjhxww4EFgfb13Sg6qTiijlC5zvUgmrOwwM
	5uvMjz98xT0iX0ZfZ5dsBdSwKRVCwML2mh20ddz3PEVfs3TV8ILMpwAGQkeLC3aMwMdE7Qp1URP
	ZS/R89JP4WM8W09Qprs05upm92CrK5UYUaT+LnYH/X82DQnX9+aSqe0N7FDlvYzvdY8JAPis2EE
	Jw/JaH4eNx5bRGygr3RgZnrvn3tV2ms/OO/B8Vee1w7jjpGeGutYF0SSlZwiY7989llyeUB2jpX
	epHSSN7BK8TSOiRm47jYK9LLJcupgf/xlALucrBJGRsDzV+NVdgmOMuc=
X-Received: by 2002:a05:620a:711a:b0:8c6:ab8b:29e3 with SMTP id af79cd13be357-8cd6d4a5208mr228840385a.44.1772799731948;
        Fri, 06 Mar 2026 04:22:11 -0800 (PST)
X-Received: by 2002:a05:620a:711a:b0:8c6:ab8b:29e3 with SMTP id af79cd13be357-8cd6d4a5208mr228836185a.44.1772799731366;
        Fri, 06 Mar 2026 04:22:11 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fa87e56sm111972395e9.0.2026.03.06.04.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:22:10 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 09/13] ASoC: qcom: common: validate cpu dai id during parsing
Date: Fri,  6 Mar 2026 12:21:11 +0000
Message-ID: <20260306122115.509705-10-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNyBTYWx0ZWRfX8Kq4ikP0gsWM
 pJU4kE3zKshsc0PA2Gq4Iv14WVRZSGF8N+EvCUNQbA58Z/zDGI43Cp+8cTCBQ2Q7OZkWOB+usMF
 8olRZVoGQjomSSO6oN1gxXF/TjoeUGgxwPN/Gi+Hs0pneHZDhvXa/1FeL2pQMh/P2sNcEXnNC2J
 IQVkFnetbOMdbFXLM1IZVqSkZH3CvVpztAG8sOXLa3UxcqbgniprzyjPI7qcVE/ukmGBc0FN/P1
 qDkW/eLTVwC0yrnLtu4Z5NzTMgJuOkVS/oyY/VuryqPW0w5PM2v1awdNPzwUA3D5cPo6xbRZWAp
 C+AXUSLh2mod/ngzpRaigRw2NqppxfhhcZUkWuXlfugBglFsUR6zze6OiPLDUPXTG+r732rKEkc
 9hvyHo1ej2S/S5Doq3ZpwmJwrPQACWtL/ds91fvmcGzPjZQDLlenA5oc+woWc4vwFzwZdO1phrQ
 pnLig8mRbCIoiKcFpLA==
X-Proofpoint-ORIG-GUID: Vbmu5ZuPjRZuxrg6YK4G8BTHegAgGWh0
X-Proofpoint-GUID: Vbmu5ZuPjRZuxrg6YK4G8BTHegAgGWh0
X-Authority-Analysis: v=2.4 cv=T8uBjvKQ c=1 sm=1 tr=0 ts=69aac6f5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=FTFSxu1yF2iZ1NjiFwcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060117
X-Rspamd-Queue-Id: AAB042208D4
X-Rspamd-Server: lfdr
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95804-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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
index 7ee60a58a336..878b42babcc3 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -120,6 +120,12 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 		link->id = args.args[0];
 
+		if (link->id > LPASS_MAX_PORT) {
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


