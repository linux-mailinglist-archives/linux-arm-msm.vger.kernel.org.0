Return-Path: <linux-arm-msm+bounces-105156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IILkHgXO8WlrkgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:23:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7864491CFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DEDE530C02D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D373C278F;
	Wed, 29 Apr 2026 09:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9C3ic/B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BdfpNIxF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1A327E049
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777454222; cv=none; b=IVa6cFHNs/lTK/9n9r6E7hzxZHsLW5ie1Pjh/w0DUysmmPsDeUoXbGQkwGG8gAxCeKrGyEZojpPgTdkSsJBAa6Zb6TwmduD/8QlMVTV2hSkJilIW1CpGb8X3YmjD1nKgAKtOGTMiTkGFRDRANl0TJBrMPzA6f00ldNH7lIS7Ego=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777454222; c=relaxed/simple;
	bh=1SuR6UH2DsN7PTT/NUCgzSGsYpfp8unFOGhnizEc+WA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jJIup6iodkcwfOwEZK/FaaPfB8HKBWhfSxxJsg0Cz12CpOchWCb3NxTu0ZY0n1HXjmf4qZhA9DyvbkFKG+oXoKChjN4kyZKmc1X950/d8Vs0MrfoJ1LxQZNDZIRDZMRlsKq98RiHiJPeyARFpVxM+34akbckMHkR5R01BbVjNCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9C3ic/B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BdfpNIxF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pps72094110
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aHuTkaAZtY5ZkKn7XTvSxnz29uYRoxbW0NTxEIzBxS4=; b=n9C3ic/Bv5HcPC3Y
	tMICNSpH66R+6cuMAxdyoddld3fN3zFgfydWns2/OeLFpktmyXisxWb0FM9dtY1A
	pd1cUOTE8ukuXEcweUvaWlVobHganl70swB1PDly7ewCzTA6uyA6XKa5GUPxotAB
	fpPfiwK4NRSp2SQbj82VlpIaycDtFoS3X8IBHO2jBUzJYO240k2ySzElNUt7vbac
	VqNhN10oZIttmL2leHeFWwKwB1M5iiJ2Kr0T6y1GRzm5Ks5bO+Qdz5X2kioG/rP3
	B+SNNmPi7zvcVg04gPgiZWy9jG47XFn3UYDxGGtCJzSiJtDIwdlU0Ez7BorjRHZ0
	2rfLJw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3rhyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:17:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82d40278103so8144295b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 02:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777454219; x=1778059019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHuTkaAZtY5ZkKn7XTvSxnz29uYRoxbW0NTxEIzBxS4=;
        b=BdfpNIxF3Sz/FKm3jJINYqiKkOPH18cCRkIHXmgRfjsrs5/+0SlI2yOKE0Nyh//Oxo
         9diMtnahjDsj6VSA7wQwJcPP+MzbmGgmg0ecYXZ9rVm1NaDEs7TI94Ye0s0O2NIU3r2+
         QfoRD2b8fZ/xEMSwrUrZaywvUHuxMfP5VK175Ke2d1NxVOk74v7gs4XiLw4JjrqeOkPD
         /WzzcRG2rgVfxU7Y0YGaH8yu4JVG1lAElMCOFORbtUpMPxHfJzT9dTzWTkw7faXp4+KT
         fO8B+W9QvgfWoNBs68GiZ9eOU368hZrb+K8rMEmSJ6duEehi81X3GmRojCQOiUICMAyJ
         8EyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777454219; x=1778059019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aHuTkaAZtY5ZkKn7XTvSxnz29uYRoxbW0NTxEIzBxS4=;
        b=iVwJ5UIEuxznY7oyah1oQcHYWVKAY1mK/+TB8zYZI+O/U1Gq8y4UmqTRRHbevb6zI9
         xtGAuW2t+pri7QUlO/ZeT8r7iF5ua/htMFWkQUSn63eMiaXCavixeJ1pa88M7P5c1quk
         611+YYvg8BctbogGIwhxznnEE2Nk6nBfHvbNp790H6skGnYXakQnpzhkWyM9R1XOxZ9L
         wbTQvKLqmWt/8z8c+FLOHXmFXV8KPgf0ViXzs7ObrcZdCdG5a45DurTD9gfrVv0ry6HD
         RpI8xRyWCEP3cqVtjTFZtj9RgtLZTiQ9rScH8mlyqjEhoyvgfKUKULvWqdcTGd/L2CZ7
         e0kw==
X-Forwarded-Encrypted: i=1; AFNElJ+03a7VAjL4hbw6FMyxch0T2q1vxZI8kzhwaWvP+meml4rVnIioe7UjjFiJ5v6THX1BBt5kBSEwmB8X1KgR@vger.kernel.org
X-Gm-Message-State: AOJu0YwW8WebH3WtB9kcdW7MPYXBoXiuUbalDe2VJlkcZJwAOx0mCP6h
	zGkUnZ2bV19ietOHIvLjuncLRdh++bUXBySQ4ODn56xBDjqizbgEguni3KbvXC5dfuSeuyCjSKg
	DLHawGyRTT7kOXDSg1PhcNsRnzMGwcxKlzeBDVyH9M3F+klmgGDW/VRn2nYn91wilZ9fO
X-Gm-Gg: AeBDiesTneScHYr0XqCkcs2yNIuVd7j1R72apbsFWk43Gc09jv2FxMRIKrUS6t2zrNG
	y0YWVCVfs9sSNca+GGYwTd0bGYQpHg5jP2dR1iEeLb7oqpE5nKAsJgJ56iYHPjOAf4gzgXA1zqJ
	WHDVBFTkLHv7WA8/uZ7tsU9LlKIG5PQOFSwH0XRMTS0BS0pNffrZY2C7rrkwRzoRxW6rXp1ir/I
	HWUY3Bis3b5ku16k5fP/4dLG2etCS6Fv/X4Ho4/y/s9bH11Kc9TXB6IVVxtKi622nujtjKBNmOd
	WvzTJEghveJHkgYR/B2ua5XNo5Ir1NO3h9uU4xS+exC/p2Aio5ScxTNfzHg+dG7eZWeqKp+PvVt
	wsxEmQ3Mo3zQt2eOPdnPU7GvIyl01aPXpcnd2XDJS7JOzrZBAMGX1CDbwa6OcoOkGNjm/vytWSe
	CxTugzW48aTgosMYhCUfa63DtnVRZs+/M=
X-Received: by 2002:a05:6a00:cc7:b0:82f:8b84:50c0 with SMTP id d2e1a72fcca58-834ddc8af4emr6280191b3a.45.1777454219206;
        Wed, 29 Apr 2026 02:16:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:cc7:b0:82f:8b84:50c0 with SMTP id d2e1a72fcca58-834ddc8af4emr6280164b3a.45.1777454218693;
        Wed, 29 Apr 2026 02:16:58 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed80dfa6sm1496340b3a.57.2026.04.29.02.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 02:16:58 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 17:16:48 +0800
Subject: [PATCH 1/2] media: qcom: iris: improve gop size support for gen1
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-dynamic_encode-v1-1-c9fb691d8b3a@oss.qualcomm.com>
References: <20260429-dynamic_encode-v1-0-c9fb691d8b3a@oss.qualcomm.com>
In-Reply-To: <20260429-dynamic_encode-v1-0-c9fb691d8b3a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777454211; l=3022;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=1SuR6UH2DsN7PTT/NUCgzSGsYpfp8unFOGhnizEc+WA=;
 b=bDgr0ClfssHc7JudQ1BZLoZxKlcJPCvhZddeJP8cso7nLCPANcctGSJMXGhfYDM41uSI9PaDm
 RpyEtTLP7zvCL7rBESoF6X4apgi5QoLxTWgr3eBbvomwJEXEy4Rk3Ps
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: 5pE5ogfOKccOG4FHcIzfFDqBT5c4N128
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f1cc8c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=J-oyWT7ATPDHrUoQIokA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 5pE5ogfOKccOG4FHcIzfFDqBT5c4N128
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5MiBTYWx0ZWRfX0UwY5qdrz15s
 KGpPwEZXn1O4cq5tzlGaxbbsn8pAWxV48WqvnAcFQQ1PdS32DacL29vy6vPFLem9MExZxU7WF82
 1wPxJHiZKqhexMYhazhr176/h7+YzifKsHs1HZO30Q1ht50quXfAZEmAVqS0eVoNxBoXjX0/lTZ
 2MimWqiWyz/T+LjHk7lQanl5XTu4AqsApwHp9yT9KdiLLRE52qx2/DKciobFsUhfCDZ3xT2FmW+
 P5iFMKLTt9wlXl2NxXosFBeSaIaBIGJCqnl5+DMkvLtOZj1zTkImEfyVVOy0l6g/lD62RTGxgHc
 TDU5w5dCGJ2cfnNKlUDs4z7iFP8BwEZ5THYnL9/tZqrJ8cDKPw45jyFvi3EihbWrN2zwU/Eaj5/
 ZE0v5IemENjOnWyiyhKc/GqIBc1kcrvCJuV5HErkUbIHr3/O+bZ6RVO3mPEc+VdvcxNfR2EbxTX
 ycBa8lGR+VEvNk51AIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290092
X-Rspamd-Queue-Id: E7864491CFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105156-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

The GOP_SIZE cap was missing an hfi_id, so it would not interact with the
firmware but could still save the parameter passed by the client.
INTRA_PERIOD was acting as GOP_SIZE here. The code was redundant, so the
two caps have been merged.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c           |  2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h |  1 -
 drivers/media/platform/qcom/iris/iris_platform_gen1.c   | 14 +++-----------
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 2ae0d1aa11f8a529b8916ae0ac96e3298e250355..51eb644f2f1aba95b72a6cc8706beb3d2d67451a 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -1293,7 +1293,7 @@ int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_
 int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
-	u32 gop_size = inst->fw_caps[GOP_SIZE].value;
+	u32 gop_size = inst->fw_caps[cap_id].value;
 	u32 b_frame = inst->fw_caps[B_FRAME].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	struct hfi_intra_period intra_period;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 3efe3121459c610af55ad2f930b21c376f0a085b..e1e8cff01f5be2554ce4704f74bcd76d2477a413 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -172,7 +172,6 @@ enum platform_inst_fw_cap_type {
 	USE_LTR,
 	MARK_LTR,
 	B_FRAME,
-	INTRA_PERIOD,
 	LAYER_ENABLE,
 	LAYER_TYPE_H264,
 	LAYER_TYPE_HEVC,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 65156584326a1a83588e8055f1318ba1b62e6510..a1988f22f8aac72eb64f944f0d341a49e8b8ee5c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -193,7 +193,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.max = (1 << 16) - 1,
 		.step_or_mask = 1,
 		.value = 30,
-		.set = iris_set_u32
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_intra_period,
 	},
 	{
 		.cap_id = ENTROPY_MODE,
@@ -303,16 +305,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = 0,
 		.flags = CAP_FLAG_OUTPUT_PORT,
 	},
-	{
-		.cap_id = INTRA_PERIOD,
-		.min = 0,
-		.max = 1,
-		.step_or_mask = 1,
-		.value = 0,
-		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
-		.flags = CAP_FLAG_OUTPUT_PORT,
-		.set = iris_set_intra_period,
-	},
 	{
 		.cap_id = LAYER_ENABLE,
 		.min = 0,

-- 
2.43.0


