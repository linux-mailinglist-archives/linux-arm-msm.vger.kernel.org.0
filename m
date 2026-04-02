Return-Path: <linux-arm-msm+bounces-101471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAdGA3AlzmnElAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:14:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E034385BCD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:14:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 34163309EF50
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 08:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F14F3A6B67;
	Thu,  2 Apr 2026 08:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nu/TB7aM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Es4JROTC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561313A5E73
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 08:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117518; cv=none; b=ZJEjzl3Nzmb3VkcfgNN50g4Nez7PaePTkF8ZDSDYb1+pw2s1BjRJegW16i8cPJBdW687hkJ7HBs1TMzMWiPtREnXrDp1ycPN0lH2/R0B1afLEruPGV1n0K83JThtJ3G/+R/ubJpA9hw/V1LgHoEvrGedc73Mk69ip0VlLFOIKZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117518; c=relaxed/simple;
	bh=CrLGv5edH+UZPIk9+prSCn/qT8iVjWiDSBnsGzRqcxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W/MHcuZSI+wn9ThouEg+g1KjFc1Rc0Mj9vaa9ceg3tZ7yMOt8FrstBsznVD1T+U1PoIrJreIT8rIA8Vm/crgSwLhJU4NAKuV0WLmGI8uWSf4G9p9ubTBzQQodyZanpMHDoMh8r32jRp3d2aiXMRuWHCNBIIdN3d3ZhQx/hdrzvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nu/TB7aM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Es4JROTC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326R3ZT1964806
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 08:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aiejSc4X5A/
	gorkmczOj6dnKqerAsQHN9lH+LChbOlI=; b=Nu/TB7aMzjP/3OXLNrNULeF2mnT
	v+eTUU8pyh3TRGll0uqoY4XQdDMFoGT30QROIauWhhxVVMU1vUcYNNOlMCumf3JP
	sI7F3dqQkluY7eGKMG3nbuHGpormtghUWH3xRTNrWLc7ElxXYsqWF8A3WrQiQ+5h
	zopFFwREfl6TlQW+qxbFeKVwJRkofz1v3tk46FWCzdxzrg6vNUVMKPCvGLlZd/2U
	C64f9lcUkCdmU5lB4nlLc7d3h/EREq2tmcaxA/ZZtkGmgZHR6+yy5vjULROASM9i
	j+LTTOxFOJd/0gNxezd7n6H1GuquveRGvuq09H0YLpwxRsUbRPd+u1aJquA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9b9h238e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 08:11:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4b81c632so16937311cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 01:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117499; x=1775722299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiejSc4X5A/gorkmczOj6dnKqerAsQHN9lH+LChbOlI=;
        b=Es4JROTCG9IuwrflzNkGMB9QO+ZMJmYj/tzI0tZf16wPC3j89qDaX9PmS+CfzFbTVH
         SP+qiSNoafS5RUKtoOSVHH/68IWDMcjBK/k1jWxqmg8KwJKDBEUgXWjWGPYHjA2JNMpc
         VT7d092tye9pUaay4LXOFVk0EpoEdtp0QdARMzI0NOr9lCcesw7MpqNbChiVZkOOYf6+
         pEOTt060jGvF64z+bBfIaHkGPQFZg19vEKhmwywscUo05nrYFHAKlIJTXI8oRJu/1wBa
         aWs0tdoQDmR3eUNEuvL0uxVE+d4yUmL+H225il16qT6RPmrDJoUQ5uS9ckBXTLf4afci
         1IkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117499; x=1775722299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aiejSc4X5A/gorkmczOj6dnKqerAsQHN9lH+LChbOlI=;
        b=FPr4qWS8+Mtzpy/XD/9VPbbxMCg9GM5Thvd3nOP6kLsEAgF+Kl/RG8wXGAvJBP1Re7
         BhMmuZtFFkWzEpmOdJE5Z9y0tlwkugaCsNZUSzsVfoNC59ecMv+BVARORBsP1Ev+nYmF
         b+0RDiC0oBNdGY+i1yysITEKkxJKd7Obu1puIAjlG1tXvlIavI1aFdpO0tFGzadpM78f
         QhjcevoOIlnXITBiqObCCQbWV55sN0qQUKKjBfneOaHrvwFsixixuXc9pEyzp20dOGMA
         VC8IryxvDHoTUcdVGXc2VI8ey9znHAqCkVNULYWC4fEPF8ldlvlGWdzZZSiVgPChiRbd
         uRbA==
X-Forwarded-Encrypted: i=1; AJvYcCUhgn8+B5bSTVfHrXBmtOTSUanOqpwg0h4nN5QkXPdjI0IbC7hsxZ6RaNsYi7r7V2qw8/deYb7NwM5aNWID@vger.kernel.org
X-Gm-Message-State: AOJu0YwodmgksMS0H8YXJLb/mVoqDONW3RHHFhnKVjNyLORucI2+joaH
	4dhmOsC+ZXBrRL+GH0gChEqeIxUdJR0o1y/WK9GX48YaL7Mn2VoeAs34CoxfZzs791Ff6m5OfOj
	9hQ0kJT17d8YdMxpXKY60UePnqVdU4evUFPtazWfLMbdj+9Ge14BpK4spL/o2FKMzt0iU
X-Gm-Gg: ATEYQzxJV4PiueUuguIHgFlBW/Hj6qi/EV7n9msJmyHWsFQcMjgIqKl6zU/xi30xpl6
	sJpsHKfflG6v6yedqFB+trYKUEBBYLYemEfdEt/O9Wkv4+H8fg7B//jCp/vZ81P99xGJ2ibZIMT
	UexvmRWsuEkkvG65B+xtRfO2hclDquwFVMPQdyePIS0ckbwCKp38nZbsfcPIo1on/qCPWBaAgv5
	dWF9RSBUcU3+XLFowhEmUuo0cEXyZVaw7+uUUPrXsjunS7u/j3OzC6CvHx6VgNKbCJoEr8L2Eun
	22HiQWj1uTaRLfnAA8eG9qv3xsfnHt+NvgGQyqsggjEv0ZDkZnmPS9KFLnZs6PCaDu1Nbp41Zqw
	uULAVr0YmRlFTCVNvcjMHrcJtZnVCIGeMsD02fm00WB7NbhtMy/h1TWQ=
X-Received: by 2002:a05:622a:259a:b0:509:379b:d4e with SMTP id d75a77b69052e-50d3bcd2630mr104809111cf.32.1775117498925;
        Thu, 02 Apr 2026 01:11:38 -0700 (PDT)
X-Received: by 2002:a05:622a:259a:b0:509:379b:d4e with SMTP id d75a77b69052e-50d3bcd2630mr104808901cf.32.1775117498517;
        Thu, 02 Apr 2026 01:11:38 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:37 -0700 (PDT)
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
Subject: [PATCH v9 07/13] ASoC: qcom: common: validate cpu dai id during parsing
Date: Thu,  2 Apr 2026 08:11:12 +0000
Message-ID: <20260402081118.348071-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TqLrRTXh c=1 sm=1 tr=0 ts=69ce24bb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=FTFSxu1yF2iZ1NjiFwcA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: kz4cQ6_U4d_pwnKjxKytMYOzr-mu1Ms1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfX9P8hsN0Aov0N
 cu39meDO5KHMfqp0SC0YcfsdYP7EWKaBFU1hf1KwgVICF+p5v/dJU0k+/WpX0WFlYm4MoSsbtR5
 rMs1PngMkBEJig3+Ve7W2AXDMEYKQ4E2P1e0yl2vQHrwlH/t5MvZXkSY0DdNie0rfEHg5l7zEAB
 UhsvxA4LgXuoHCfhbpZF75FK5IPm1P9f0nn4ZvK2waQ1KrroAV54WTQj5BsXgnVbLvWBemL/rwf
 I2RVI+/8kFJrBRKsnD6mlJx0GC+SF1c1XpZnp5HI/yGpkvo4QuMy6O28N9c4pX1+dfN6awjzgQv
 O9kGhIYT9fb6glldd2dXAbKqfivhOwfSXNrec8AbUP1bayR+2/vUVTpqR2prG7/JU+aMD7ZSaC9
 BCxvimax2spr4KCiWiNhpYC0hPiYaTDNQKD7ApUz7qXPC7nn9MiUmRq5zof0O/ojiJsIZmwM1pL
 9xbn2RvvHjBfdxpw6yQ==
X-Proofpoint-GUID: kz4cQ6_U4d_pwnKjxKytMYOzr-mu1Ms1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020072
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101471-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E034385BCD
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


