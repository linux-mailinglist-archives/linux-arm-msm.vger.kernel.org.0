Return-Path: <linux-arm-msm+bounces-104085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIxEB1av6GlDOwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:21:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE727445345
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1673330AAFA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334A13CF68E;
	Wed, 22 Apr 2026 11:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aefHxqmC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IsjRgdtD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3C032F76D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856631; cv=none; b=TAwA52sTAjUH2E56Jdz5vyffR6MXkcy4vAiuCFXvd43fS8AhlTXFrmF1u+/M9WD2Z7X19ZWrsLnK+adC3ChOAIekfOaXZJW/Yw2h7dWmSF/5NEKvbJUr0BZJ7q4dmKp1ajC6Urt0ClDD4ycnYAJintR0Gz/mjcaBVqSX/p3B480=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856631; c=relaxed/simple;
	bh=wXJ29qJ9nlNpNzyVwmliOL00C7sS3Qrpz+U+LvAc1vg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q9yIb7afRhMtENZ0wl3NEJLhpxyYLGxcTl0bE37w/XM1B0XscItAERYUa6orPf1is5eAp/+RNWGGGDuoBZekYeTXZp5HVKN4k9km5o8KMLL0x/Y9dg0pvfoEkXqc7QSsZHP66SodONNSdTU/UArUu3cgYVt+UIW8AVPT77OJMHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aefHxqmC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IsjRgdtD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5WE0L3730717
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xs04e26vQV7jGpkvJ0zKvXqEfdEH1nMhkt/hhhJhtxo=; b=aefHxqmCZzs77ksX
	1mf6Ed4UoPmmpl7U5DHc2OMIC4cc/5FKfXxK791YNq2j/a0F8jBetoiOdmb0DxfM
	schCHQKPpzQtVgceEIQpFk95y6+UIiFNbNCLPBz5Opy47N6ozzoQchczYloaelCu
	uuqML/EO3OE1ZOl4XyW7lXMdH5i1llz6lhgyy0GaclEZ4yXNKNj6JKBeOsvZs6H5
	3Pts69et3Xc1MkzShP12dZ5i5LX1eEHtaZL0xrPOBNCUm0RFDDll0pGR4WTVvrga
	n+q6VHj/cV1K7Ni4SPr5Hhn1TKeqV0VDYpDPXw1GnA6MsDmfIve9m2scAqhgmbgq
	6uwpKw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfu17g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:17:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f9aa52c92so5409457b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 04:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776856628; x=1777461428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xs04e26vQV7jGpkvJ0zKvXqEfdEH1nMhkt/hhhJhtxo=;
        b=IsjRgdtDq+mYrErGJHQjYkQwSMAmWsh0UKXFrx3sNbcQNTj0Gt/2qt1F3R5TpaVgUP
         07g4deUaFBjqRgIWA2oSwDz1GQJl3oxmeZ6hC+lm0OZ63DFgf9IVvYRWiVNh8kE9AR+c
         OBad7rCF5oe9DMTcVv+mheu5aUtUzJ65BmWxa108wmkZv5RUL/2JBD/6NG50mmULcxXH
         DUvEvnTCbB4mZIEXXWTLYt/lrRHhbHw4PRa64N+HoQ4c5qULmFzmHg4+n0agOeRzyX8p
         sHpuhoqcZErXLmgCxd2F78kIh0fT7hSrZSdfz0uDprKfugz6zyc5UCZ6S/LYYk3NJYev
         6RUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856628; x=1777461428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xs04e26vQV7jGpkvJ0zKvXqEfdEH1nMhkt/hhhJhtxo=;
        b=WHtj9jDQ2Lyr+T8KbYA9NhvCumiCPY18Oj/SdiHqAOb2CFetjsAAjA9rDlw31jc+sf
         FwbI07fbmg0N6m2/nYIEBIaGabrsVyV7iA9AVJdDQNExPujtv8kLxDF/KPtnQ4FKjLph
         HGUDWYW7xPYx177MMToqh7FpVtoZkk3EXu+CJaYfBDrZLWxiGkOu7AT0vqJlaoLerwTu
         ZDXXfOKXHSbM7scrlnsF9pkpjXCi8Rk/UcQnAlu/hXFWkBg2AUN4tqN8Z3JvMB3EesR5
         G/DZXOcu8MxUY2KV8X/E2T8m33ET982Qd1k0J3fcMlAZaUJCg6Xv88dAEcUxCSPqAvpF
         sbyg==
X-Forwarded-Encrypted: i=1; AFNElJ9S9UI0fBWdP6ImgRDQUyNBFTsdY8ZktY7X9oGZjJLcmWCA2cgAsPQqHIQshWWIMDlkzLBD+GS1jJA8Vf++@vger.kernel.org
X-Gm-Message-State: AOJu0YzPGhf9eueTX5wpeWzj3PvvcJMelW2kQNjzkOBvuSzEpG/Q2YHL
	Qrd5nXMcSgBc7Hgc/4joFi7IKmkRmQAw8Bbgu9+0euRJTWNbTV5rNqLQD+Wosg/oM42g/6ZvzEC
	pzrL7XGexe0SMHxvOJUZHy0lB64mPsYLULku1roRflMvep2F9eR4wFg4QsPQnWBEWCiVg
X-Gm-Gg: AeBDievV+X7GEpGGgbjmHrnoiCOIrNN819Nb3GZ6s8cRyNF8ELRNDMHTlfZ/r6HCS1Y
	xrWWyVgpP0GxixMMj4oh+1KbN+41dG4Sluq/YobMOQ8sAXMiABfu2VfccekfsLxVBtTQFyY3f3t
	4xDS3hLpWQVUpKWlynr3aw8Thm8TeqBNp+rLxIJMRq1+T582QHHYRR6LkQE+/BuF1hxOeZsqBu/
	OJhliDW7KTnxeU5oAtZDryXokPaQ9JwFC+hDSJGnZzYAaVRYSagdliIkYKoIvukWUtCIP5+kmmD
	a43G+c62jTdGkZr1dxZLqzmDOYBJsSr5zw52ZbG7iImCA1cVbW5vqvVZbaqgZ67cLlOIypaGAqC
	ebclADZnFj+o7EhgZ2+6iepfEWOsGwATwUATbCzYflObleMFiVk8/n6/n3eM7SnHUGlD3qA==
X-Received: by 2002:a05:6a00:418b:b0:82c:7383:3745 with SMTP id d2e1a72fcca58-82f8c834458mr24017241b3a.19.1776856627674;
        Wed, 22 Apr 2026 04:17:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:418b:b0:82c:7383:3745 with SMTP id d2e1a72fcca58-82f8c834458mr24017201b3a.19.1776856627215;
        Wed, 22 Apr 2026 04:17:07 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe901csm21100782b3a.48.2026.04.22.04.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:17:06 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 16:46:37 +0530
Subject: [PATCH 4/7] media: qcom: iris: Remove dead assignment in
 iris_hfi_gen2_set_tier()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-iris-code-improvement-v1-4-8e150482212d@oss.qualcomm.com>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
In-Reply-To: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776856606; l=1385;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=wXJ29qJ9nlNpNzyVwmliOL00C7sS3Qrpz+U+LvAc1vg=;
 b=HEE9b1ozEQ5M3v70/DrPcmLmew3bbzldxzNVN4qPr5xTc6TuKxySSJy59Uj9Ipc1K8v24GIxd
 WTMlfSpg62wCT0RBX8rTG6OxqfoUkt1OYpT329WLi1s4IZu8bfM/GUZ
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: 5aIAM8v-15FU3UxyjgaYXJZBi5pYAhNX
X-Authority-Analysis: v=2.4 cv=YJuvDxGx c=1 sm=1 tr=0 ts=69e8ae34 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=baIckf8PCApkX7IVpfsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwOCBTYWx0ZWRfXznmeXWT+w0CQ
 DUFUbxI6/6e/LbgyoVMeOC3lW1DTVTHjwRNTK40O6K3KdZUtegkzPzYLLJyfsEdsaFJlGNHBRuN
 38Q8+hso7PtxPWj7S076Rx+Kj4j3C1oDNMa1g3AzcPkTt93q7kSKtjpQXa3OKTk+5RTe4y6wOuk
 vLsJ4Sqda1uqdBzrhR+8WMBm6CkoBvPlwgsxh9eQwVak0/5/91yFguX6ymR3jl5c9seHwM5NOMW
 DrIotS2ETaAFjB9Kq33h1/oYrZN+sbwHfM+6sp+XolLKmh2F16mBT/wiSS/nXfXQ7HElTpUHRQe
 nQXp5Bv4Q9xL+bs9MSTbknDOY3dVAMBSxbwgmbVfD0hcE6Cvro9fJ0s2NPxMtZY8RXrLiYbB4MV
 vIdbLsAqFfF+HJkVGL3tPdrFXHDsYRJQd/Wtdm/i8bMB+IuYjES3KNkyA9nagmAP9VqxWws/4kC
 kAcfUcl2oKdbrdKiWDw==
X-Proofpoint-ORIG-GUID: 5aIAM8v-15FU3UxyjgaYXJZBi5pYAhNX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220108
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104085-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AE727445345
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fold the ternary initialiser directly into the variable declaration,
removing the dead store that was immediately overwritten.

Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 30bfd90d423ba024caf6ececc827f7102e8f3324..06698fde639ec654ff9ec78a178271ab2284f5f0 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -536,10 +536,9 @@ static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
 {
 	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 tier = inst->fw_caps[TIER].value;
-
-	tier = (inst->codec == V4L2_PIX_FMT_AV1) ? inst->fw_caps[TIER_AV1].value :
+	u32 tier = (inst->codec == V4L2_PIX_FMT_AV1) ? inst->fw_caps[TIER_AV1].value :
 							inst->fw_caps[TIER].value;
+
 	inst_hfi_gen2->src_subcr_params.tier = tier;
 
 	return iris_hfi_gen2_session_set_property(inst,

-- 
2.34.1


