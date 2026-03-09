Return-Path: <linux-arm-msm+bounces-96128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GID7EQFvrmn8EAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:56:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FA523488B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:56:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB6FB3070164
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 06:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D82B366560;
	Mon,  9 Mar 2026 06:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XakMq7Bq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d5NszAVx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02464365A0A
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 06:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039117; cv=none; b=XpHoY2xn/Q/GMAdkGACFDYH3OmWJzll4gocG7vSJ4boRDh/T3wUsjUd3Ur8c86eBunT1KJ7JFm7Kz9LwqpG6qYlf28pjLxdhwY6jYjBAc1hF7C8RPtJVDVSYXS6Y9qJ7Ol2m9tzhv3ZNiEMg3W12FPBNwjUaVKjP5GnmN+LYKP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039117; c=relaxed/simple;
	bh=CrLGv5edH+UZPIk9+prSCn/qT8iVjWiDSBnsGzRqcxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+Wu28EMY5ADOG6/r9s9DsbwTHwszlzGGDrXkN4/sSwtJpkzmBT7NzudOeIJrepl2z3vvKeg0DmgqNV8XP+TtEQ4vo+AR6dIgjXqYrf/aFoEhRqr47VYOY86/bk2zw4fjADCzFOmYZAYifDVKdu7G+bT1crVBZXrXIjghb0UWxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XakMq7Bq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d5NszAVx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62963euI2200772
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 06:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aiejSc4X5A/
	gorkmczOj6dnKqerAsQHN9lH+LChbOlI=; b=XakMq7BqCmC1gZPEOQ7zm7b79F/
	2VrsLN27za8MrpO7f83tVypuG/BBYQj8akbSGCXvfQH1VIjwe4cob2itf6hr52WV
	zZu4u0dNA5rcEs+x2i9O9sb9ezIrFqpkodyJnIZMJamSkkPvxz74053g5yNnT3lI
	qXkN5jmXGXe8huhPcn5vzAYNXWGmkZezB3UUrOwL8ZlLuhURXlVAuZgUZd6qCgOP
	gi+w82RKvz3tKKthOX8ZGRaQR2jqeGcnWEYf6W8Sohd1KYEx1EyF1JECk0HRoJ6W
	WkGMZzV2IiAqqRMz2vPtUZ8P47oPXaotjmh+slQ6HnrfGkvUf+j4gK7f1rg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcd8c4cj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 06:51:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd84943c76so583935385a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 23:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039114; x=1773643914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiejSc4X5A/gorkmczOj6dnKqerAsQHN9lH+LChbOlI=;
        b=d5NszAVxs0IWtEik9sP+g+EI9nwy64XB+7P0xnt4tTeaa8L27Ylq5votEIAAiqE2TA
         v1majHdpO8iKNRK3bvyU520F0iXebqSw3r8oNfXyUVd3AvbEnbq1vIJvnoojwV2eDTPO
         rggxyU7+9ww3Yi9a1pRMpwki/MRm1fwSIt/4jKNnPhQKP/0m4VIvDRwv0S2LsUmezle7
         m9qTf8vVK6FBN+5AXNgqx4akqj3JI1wyMGkciTwdzAO8Aig8dw87dhEYWGIdV4lWsfkp
         mMzpOzmJJulXTeP8iQbBBUIGLwPX/ydjDOMpXULQEyje2iFdWjc7Q2g055Tq9fxtA2z0
         4KQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039114; x=1773643914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aiejSc4X5A/gorkmczOj6dnKqerAsQHN9lH+LChbOlI=;
        b=c5gWg/ql5+FHMqjEDkD9itsrqIMS4KWPgeYYR7ThTezZB8UAcljqVzkXlWScrFVmQc
         q4NqH5EAX2UnGUnpPCKCGn3oGxezsaqcThDfSTB6l3JBs5fj0gw1xWNQjXT8KCtWpFXc
         xSfOT3dqYPLeJWRjmgmQOZC955kn0S344dFRgmjSG9HoAAXgUhi77J/wKB00yANqLC6a
         br+LuTqRnToe/EUce9IkZ0rTYU1IOCABvvkYNE/tgEo9UKHIyKxYd9SgW9+NDtY0h/Q8
         vQyk5lhjrV6gSpE11JWnkpnCSTVbSzD5B3vHx7Apxm/XzV55OIgKcHve5mbSUYhJ3kkI
         P1/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXA4qkzUCu5MkEwXIUStGDuzYDbJdtUJC9dTCy5f1zECHcRoyIoaO8D6OVc7IncoBLiq/75n4XaH5jrezrh@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkt9GcZOgwtXT+W6JqoEmwQ7mDcCFbqnC1Upwkna+lkszPJRjG
	Zu5FDu11aMmsyWxO54c1/izuMNYrpLOC8buH51spjxUBWbHtMZiFdcH5anGfvy0C3Gcu8uFYLPG
	oYdvoxd1GUaYHBQgrUoCSffWByDB7shjm0NvgzNkJdqK8O8Ge3MmJQnxNQCbcUMiKMkBj
X-Gm-Gg: ATEYQzz4juDhzM9lmjxi4gcHCUVkLxdD1lDFGIPnUBpmr+AEzGWt0/LTXJd5rDlI5gB
	L3rX3QMbrbOiDEIqOZeDwp7PoBT9R1zfPHjtp90HyyE6HxCghUMcwtK8No6rDTARulLQJ17XWYI
	nUOFq6LmcIS/iLkD1/MP81U1p5KKZ2M7i5oRHCfhyUb2k8Ga32SJX5zUwglbk47iILuLVDBdBIF
	17NRktiMVWK5pn6qykMOgjk6XHvFo1CpcKCnkocHCXC/8ef8Egjev6D0Bo6FOs5ucrtJ4LfPaH+
	ZohdUlPfDFFhk//sJfBn0Mmbkj8kwf0gW6l/i5enfuwdC2r2lVr7Q65Zu6ogF6WuAi9sZRfSeNW
	Rx2ag4DhlNm4PYKBRPmaWh05N6fBlRcbHU3N73JqAZ84DtD7yCsY5730=
X-Received: by 2002:a05:620a:4408:b0:8b2:e3c1:24b7 with SMTP id af79cd13be357-8cd634e8fe6mr1713297385a.29.1773039114477;
        Sun, 08 Mar 2026 23:51:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:8b2:e3c1:24b7 with SMTP id af79cd13be357-8cd634e8fe6mr1713295285a.29.1773039113964;
        Sun, 08 Mar 2026 23:51:53 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm80449975e9.14.2026.03.08.23.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:51:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 09/13] ASoC: qcom: common: validate cpu dai id during parsing
Date: Mon,  9 Mar 2026 06:51:33 +0000
Message-ID: <20260309065137.949053-10-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xDq6Nd2wbRoYI7VsKz5TghBManHIH6e-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MSBTYWx0ZWRfX+MvuVMeZBuSK
 TFZ/mYPpuT+NaPglE50jdjWEm+FaBK/ELWsKYyp9F6b7hTKqSwtj9ngvv9fniqcShoH/xWQMkzb
 Mg+XhdHPyM84SOARhP3Spy11chT7aK/WA7w8QZxC6EJ598UwzT74ejNhf+JTlypp1EDUmDuhhcd
 Dk+DVQ8ilk7tO50cloUSDoCE07msBZQ8YebjqUJHMndvQwYZ97MkTzXSGELDQ4iY0UpfWRzX6nC
 pNy5OYVe/Vxncl/ZYfekV+8aUMvkW9RCu98PnDLxbwJSXIHCVANxnOgACieSUUWYXTb7m63d84i
 MGwSut9iTGcvErYIGUHAT9CcEpTaMJUYBX9VrSx5mteFzjssZsrk8VpwA0xp1wh5ALGiw7QHZ9B
 7k0H22B+gtoaZMmZeQkRq8VKCPqlVpydlJcKEsSuCI+vUmZ9B+I0t15VbeSOPbCCSyweOdxU3FK
 qQTKmL2iZ7DG7efys4A==
X-Authority-Analysis: v=2.4 cv=O/w0fR9W c=1 sm=1 tr=0 ts=69ae6e0b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=FTFSxu1yF2iZ1NjiFwcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: xDq6Nd2wbRoYI7VsKz5TghBManHIH6e-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090061
X-Rspamd-Queue-Id: D3FA523488B
X-Rspamd-Server: lfdr
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96128-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.997];
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


