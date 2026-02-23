Return-Path: <linux-arm-msm+bounces-93755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEJLBLqXnGluJgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:08:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E292C17B466
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4B3DA3021960
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 18:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1357C33E346;
	Mon, 23 Feb 2026 18:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W7VvNPEc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BDT1VdHw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6824B33CE88
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870087; cv=none; b=XymwJsp1H/TVzHl0iAQIb6GekHQQfWC6x1srKE10vcJlyLhgJLD8smYjuiNL2pTHafWYQrBPCGe8rg2ckYOPzCgl/exsRowUbYs2hD5/Xy3On2T9bzJnJeqVKh3E1bRYLkodAFIT3r4Tf4AhEGq9ePw/e/Fb5SKi+1bPgw42Tb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870087; c=relaxed/simple;
	bh=VNHduoXGqlVxdzBtpgR9jvDgv6WgWm5Ys+b36xvTjTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EkT7VLoDsXfYNw5sSeS0Hz5WqVBcBRGnYnVoK2fPN5xKCk5QYadhg0de1JUooCtMVDW0QTXHdEy9HzOly9m1WHck5pdBvQBSwZIMJ29Vww/UHGXPuOCFKSSBv9XLMYLZ57TBRYo3UOPMcj9cq3q1836K5kRatUMs2AJX4WE5jtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W7VvNPEc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BDT1VdHw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGRPOr1640686
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UDRf/+L305X
	Zc8ITbEbLHZrwiYXIk2guFDOZXnVMNE8=; b=W7VvNPEcpUGweUd04xr3LE/x4lX
	WPUywO+xtxf5tGbPnef+/PWJ4tZAyiT0zF0twZ2It4L7igg77pp1vyyQI/Oj8D5l
	+qBaqFQ9/ipoarwzwQhyxQkkAYy9VGCgWuWoziJ2bNUclS3wC3p+c99NDvtU+pDT
	LbOPMKgSQLMKVt3azO5loWp2+W2soTO8REQHi6o6IG7JV3/bb8kYD8jTPcGJsfJt
	4/arXYV2oxFnd3i4+XfTO2D0WJrYYYNbArczkeDEij3usfrF8u+QotRh/KrlrnEL
	6etbYEA7L66/VhygXRqYp+uQAPrgFaUXn4z7eyhArBUxIneMiRK07M14LSQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8rb3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:08:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb0595def4so5666463685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 10:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771870083; x=1772474883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDRf/+L305XZc8ITbEbLHZrwiYXIk2guFDOZXnVMNE8=;
        b=BDT1VdHwpqPt3Ezx4uIhMwa4QIIUBtOT14QkdJ8oTaP/A/8tNE8I7UNnix9JBHNi1E
         YqeybRarpD/0HY921kSLPlmLWS8GNlpRv+ntTprOH+e+q9ihbxNHXrhQUfuLkIlR8Y8B
         jn+KnTtQL7znSIW2SOYfCiKlWhIlbjRj9acZYXAL+TSItyN0se48vZi+CvPfO1Xazwe3
         gn746aDd6QfZOZv5Bd+qMfnjnLhdZOOu1hgvCDKF9hb2rsjPMFUwSfSCEZ+dccQ2OaMt
         a++9voDov9N40kzbgYY2uMPSfouMhDvwicjBv2KDOJsqz+JkrWKy2XZRIlrWNs/WrTWV
         PgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870083; x=1772474883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UDRf/+L305XZc8ITbEbLHZrwiYXIk2guFDOZXnVMNE8=;
        b=cxo1fSPN6T2dqTEy5PAfwclP8vMqqL5MZeIbPyIv30Y+CP8nHufq0QUYinK5kNEZXs
         N/BXaDmWMkk1IwRgaqrHJqCPdK3y549xXD3N7oXfKLEjQjOj1jC1stoobDFxjhIxoiyT
         n2geu8ckktt/ghwYk93HcUQ0KN1MzuFUBzQi+61DWy/JeB/JXihfjEv87dc5t44LXdWe
         GCFjbxdNxy0sCFxk1zxQsnImI6R94n14F/ylR1XIWmxdcGVbgOzSWu/X/OPz6kUAalF3
         E0PEKCP4brBhUePH+6N9dIrLMJKNOqzm7kfAt4r0fNmXklf+4zE1eorBHp5QWHYkIcMH
         oaow==
X-Forwarded-Encrypted: i=1; AJvYcCV+KrFvW42fmnyaBxxrWB4OPzz1VMlk4HLDu5zj1/o1HGesARkIhsdAAJDX/SXDAa6RBgsOUcaCkAP3XyOQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzrAXIGc2kH85Kqjq5UUcgZzQoW18myso96e7gCOwELs5YqnFKv
	4MsARSe8YUpkcAjQcwLNY+d238c9yAxlDG/5fqgpmKZSvWaVK/8/zJklJGdGOAGaiarGAYKxIq8
	u8gF48U7YM8V4EZzWTDxoTUT8Ozjs3k5k4jWNfufg5xQ7LpRog5lE787gEB5EYnvAiFxP
X-Gm-Gg: AZuq6aKNZpS3b7Fa9nyOZvjjeVzjosGyzyJ2bnD6EMVSIRz5Umcl8UyrZvB+1X94SHX
	n7jf8evFNYaYBv/d3Mh7DrsF/0lnAfJYqoyF1x8GapuMUflPvbxRm2vDLZYrj7fEoxf40l+q5MV
	UiVobJDI/vMvoZBUAB6jZTaAJDMtiL9hbg9Z0c6sMhZ1nVpxYnwa3hSSXx7j/88ePT2fW3RDPBc
	7MmWO+jptl7L+pD48VWnjoUcMlkpxx70VbAoYP/PJ1gtc/rwbexuPh4ezpIElwHD8MgfeYwfQg+
	3+XDjE2+5M4hxbZtH0ruZf8M0vM3EVRaGmeTaiMvTlAN47+H6BzWzlF54mYVAgmukaATpPIKVfU
	Pj56PscgOFb3QmzcW+LvPjf2sHzuYGyB/eqsl2lejNPjLzGuxYyTpJpI=
X-Received: by 2002:a05:620a:4484:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cb7be731d4mr1789941685a.15.1771870082752;
        Mon, 23 Feb 2026 10:08:02 -0800 (PST)
X-Received: by 2002:a05:620a:4484:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cb7be731d4mr1789934885a.15.1771870082116;
        Mon, 23 Feb 2026 10:08:02 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm20458574f8f.23.2026.02.23.10.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:08:01 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 06/14] ASoC: qcom: common: validate cpu dai id during parsing
Date: Mon, 23 Feb 2026 18:07:32 +0000
Message-ID: <20260223180740.444311-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3UyhnFl6tIcsdw6AdubG_yE9TTCwEYdy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE1NiBTYWx0ZWRfX0ynk4rr2fAek
 4Yh8M4e47wZStiO5o3vZzN1UlG0Fwybk9Xj9cjgzLbRfz3XoQ4Ef+p8lk4YrkzzMufYcMmJptzm
 JcY0NColymaHgokaFMSn64BMl5TCL0PR4YlcfE0wihIg7KcqiEH8pT371hMCYa3XMWa2HnCWv4L
 jZw8qyRm91BHTiii9QMZoPbARvUINPt9y8Mh+b5qNfwn/s5CA7gGs4WaXla44To/WiThG0mN7ZV
 EZg2L2Rwf7BWn0d34ZPSAtdkQRqEoysTDkSg5rjq8fZyJBk1XwHOx4pNWf2SGa4rocsQ6BQlQEB
 2CqOAN84TP85qPR3kgJ3kYvk/uZ49gtio+SASgZ2+yRJ+7mZk1st5TDyRP6SZ7YxA+auWnoyU3D
 Dd5oKFj+YMFz8PTuJNviAnrMrlQ+8IBgv9zTlJDyXRufdwbLPfXBxY28LpNfdMprDEtJhGN77nE
 Me42Sgw9LcpWNzKMbIg==
X-Proofpoint-GUID: 3UyhnFl6tIcsdw6AdubG_yE9TTCwEYdy
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699c9783 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=FTFSxu1yF2iZ1NjiFwcA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230156
X-Rspamd-Server: lfdr
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93755-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E292C17B466
X-Rspamd-Action: no action

lpass ports numbers have been added but the afe/apm driver never got updated
with new max port value that it uses to store dai specific data. There
are more than one places these values are cached and always become out
of sync.

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
index 7ee60a58a336..2f5d3ab1a353 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -120,6 +120,12 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 		link->id = args.args[0];
 
+		if (link->id > LPASS_MAX_PORT) {
+			dev_err(dev, "%s: Invalid cpu dai id %d \n", link->name, link->id);
+			ret = -EINVAL;
+			goto err;
+		}
+
 		if (platform) {
 			link->platforms->of_node = of_parse_phandle(platform,
 					"sound-dai",
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index 1b8d3f90bffa..ab8061049375 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -4,8 +4,11 @@
 #ifndef __QCOM_SND_COMMON_H__
 #define __QCOM_SND_COMMON_H__
 
+#include <dt-bindings/sound/qcom,q6afe.h>
 #include <sound/soc.h>
 
+#define LPASS_MAX_PORT			(USB_RX + 1)
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


