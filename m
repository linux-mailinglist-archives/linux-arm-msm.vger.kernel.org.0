Return-Path: <linux-arm-msm+bounces-115654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RPl5IF/vRGow3goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:43:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A0D6EC503
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:43:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Qc5TLfBA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="XSAutUG/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115654-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115654-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B97E302E726
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A740428485;
	Wed,  1 Jul 2026 10:38:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05264421F12
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 10:38:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902294; cv=none; b=gjt1sRnklruec3arO2LkLX+q9Cn1FWsvA4fAZUJAuvEAMC6+vw+4O/YbTLwAEds0PJk/mnoCbA0gUBZDSNMaQ61SzUmVtUnW9qxSC+oYbLRoCfe+CqbfXUbyu2P3lAKZ88RGQZ7WS1d705UF7foRdppxZd8xm5SNW7ugZlGgcYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902294; c=relaxed/simple;
	bh=Ai7Oj6HYo2DVpdnuStjVjQuKPI6ELc1HNULGnu45Dq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ctBcRwuezxEB/P61PATXh7+sl1U/v2Y5WDlc0HFMPlDOGTUweBqjLpLZyZAgVPXxvWvZFrHZMqXeOkHh1frNE5j8/irr4uJLYcvaAHOR6AW4jFrIlSBaFQ2xWXgomPqThrxpgHl2moIM+Ec5SyaeHQWoNiPwO3tJHHRs1KWdGdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qc5TLfBA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XSAutUG/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A9CkT763554
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 10:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ILMb+mV5AdAqlIxF1QaEkI31w6HYyIF9XcVFgHuAyCo=; b=Qc5TLfBAKJlWNBp9
	mU7w21Let2SxOXIDqvqX0LyDjJBsjPt2m9fp6yWijD5zg51WM3dAZz6iuZ1Ls94M
	vc4T0ErUVLN6KmCcCo+/zeVWvFjNxQldU8t0USPe2dkLLFsMGI03FipSF5btPFO3
	i2A8Frk+oQDtyDcfWBKVGfWvwWWTKT/gwgpEljRZCU74Jh5lYd5KfBHxsWokPlm5
	lsRSerEp0KB2LGINEsGouaqg40s4XVBuzBg7bOUP75g92E0Rrwi/LHkYLxdaWAo/
	UCBmbkSPrlRVm5Q8xyELPaEBkm3ztQ9nsEy4r42Hc0lg1/oUP36o3DWNoZP7Gg3W
	QX82DA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktbp7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 10:38:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37e17ec1940so553012a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 03:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902291; x=1783507091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILMb+mV5AdAqlIxF1QaEkI31w6HYyIF9XcVFgHuAyCo=;
        b=XSAutUG/7GO8v2e6bu1zxc2ubgPjoK0d5gP46P6fil3isNYh2wopY6NtebdS0gdNIN
         +txwJw+4Po9ONyKDYgGTyul/0teLYo33jtMekRSUIpit9Lnsjrpg/lOaYxecw+K7dYO7
         SpmCaka2ixrs4iGa+FSetfEhUaQFv8su0ScoAtFKtaLrYcFa2ggn5zZvpRTVoAP4oTSR
         R+cCdKnu/V6QYhev8sMDETBeT7tt80eMzOeCuevVXrTVFy4Pvebv6EehyPn58xGGAUJU
         Sj5qI6B57mKOYVO1jwwgf06ey657IKwcZDMRZDNBL2+/kDZOyz+KdKZcRHYtI9T2u8Rt
         M3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902291; x=1783507091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ILMb+mV5AdAqlIxF1QaEkI31w6HYyIF9XcVFgHuAyCo=;
        b=hu8w/cEaZE57K8w5NT5vyeEsAU69eEMMf4o71ma9xZbn+zNKocD3SS46rJmoyfOEgG
         beCKTKqpseDA0D0FIwN7BWlJuuOsp7r99GTHRdPWvHreDnb2wRL/zandiR5MGr4MBF1y
         yuw+v6OMm7vOjAYwCAnBtTarwPBQHppv82uPXj1/kvYgUPit0TCjwwncJmzxCL4FND1Y
         bZRlrcReHrCUee1l0FPsAxpuwNa8ClyLtWKts0F1rEzXtVxexEw+4XqTIkFZmofAZzqV
         JIkEyTOj41ZKKRopndHToemBE7Kqme6qBAY0hG2P/rCE2SF1le+/jaU8eVGD+fdVJmeh
         okYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpsjR2a6sbTQR+F4nfvIQN5zXyX73QrSPyGrWUZTURBLoRon9X/WrYTBNy8dGFwkedupbxgXpjpW/HfJUd0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Ju3ilzwW1Y0xX2U6XON+1q9d31LtMst2ap5BquBQ/HmvUa/d
	gpdFFknSArWk8/lGlrfqq14gKseGN+e2qYIEoIV5CiPAXVmy4lIhwnxsiDxgK06VQUwSpKaKXry
	VKu+su10BMgNyZBRERrbt61OisdEs8OnDPnluP2atSUnq3X/0EQeDW9wSRWrTQdkRrqhO
X-Gm-Gg: AfdE7cnqJqQ9nXYgNvywPWwDOx4Ct9NJeXDuzhpCP8iIuhDVekHmV/CjuAs0t47cuF+
	g67Y4O/uW3fnhe91cDtqti6Hp/ADGgA5syZSXj2FFX4oiB81zTCJCxR94TlUBocFEAwLl+m1p7V
	p9ERcVylqlWJIP4bwwsoJhYsaz0pTB9AsOjWXQI7Ga7XgL/zi8TY6J/IVAzV4yZj0NvJKwYqeE4
	e9NleZBPGekF97yi97DWrYvcFeK2wcZpkCDGI+LdMI3PUtqeW+vpAU9n7acsqFAVZShyx+7uzwQ
	AcsqGZXA1KXXsUNlmA0ixIND17Qw9pPFdY+N/h5Sg4eh/VzuA/zdIK4nlqhgPvn4rt1zCXZON/m
	KCVZgaVD4vqcEgE9cxGF2t8FoDTxAZyDeswVGopgx
X-Received: by 2002:a17:90b:4acb:b0:37f:d6f3:450d with SMTP id 98e67ed59e1d1-380aa1313ecmr1126581a91.14.1782902290402;
        Wed, 01 Jul 2026 03:38:10 -0700 (PDT)
X-Received: by 2002:a17:90b:4acb:b0:37f:d6f3:450d with SMTP id 98e67ed59e1d1-380aa1313ecmr1126551a91.14.1782902289832;
        Wed, 01 Jul 2026 03:38:09 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095bc8a2asm765251a91.0.2026.07.01.03.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:38:09 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 16:07:39 +0530
Subject: [PATCH v6 5/7] bus: mhi: Load DDR training data using device
 serial number
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-sahara_protocol_new_v2-v6-5-3a78362c4741@oss.qualcomm.com>
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
In-Reply-To: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782902263; l=2770;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=Ai7Oj6HYo2DVpdnuStjVjQuKPI6ELc1HNULGnu45Dq0=;
 b=BKtlMZwrym34uRRohN8XfpdmrzJadvkke8EGBNPb2CtSD/iNT9JzObFZ63p+0UdfBGN2gBcjg
 vZCSL+IrFqhDaUq39Jju8Jp2hy+XGAwYBbHnN7Czqme0mSNZ0EQ3f31
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfXygzyusDbna36
 WBoKR0SGlmYdDZo3e8jm6WMh08QHpX0M+/eashSxdYsYPIYQ9rCfRAFaLj61RbJezJLhXDI2X6k
 pTsOHgs9O1iG/ns5WMH3lFIEdY4ZnYQ=
X-Proofpoint-GUID: VjULaaXVSUWWZtjFAfG5fek-efxF1UNl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfX31HroWG/jDim
 kyZdKUvaoO4JQ5A4gJ4KXU/Y1DI5QboLKBzhNnSMyB0MyxV3onzEEZEhVly8pLizLpngduWn2Io
 CCDkJvGovtGq77d8Jqcu9gDoK/r08eN1FuTh9QS/I+MWOpgtBJZOOilxGMywrZvNeyCVcQfI810
 5+IXMRCDGgK1rOLcW6g13PjX2N/QkGQXBUVOH8ZCnv7ViQLCJFgx2N+ztJpn/3X+/46aeWzQmNy
 PTzEQwsnGPQuaVJ3fej2Lfjpec+pByYfMMslQMAoKExUjfEi933sVEmiJDqiSiG4fDQgSH7M68/
 bUDk3qJ9TIa12QkZMkz3d1aq8obUYi4P7nYPP+Koo4B5q+fb5W6qBgc5J7vk4ZVGj7F8DE2n9CQ
 5N8f30kmRKCstoZpUJyedAkMS53mFZ8NtEjNFJfBo5zHbaioA1PAgXh8n8Ju6zsEy8ea1TwzmJE
 ot3LVadjpNqmoCT2UfQ==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44ee13 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ICgrKnnyuXbdZ-Zkjz4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: VjULaaXVSUWWZtjFAfG5fek-efxF1UNl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115654-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:mani@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:mhi@lists.linux.dev,m:kishore.batta@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70A0D6EC503

Devices may provide device specific DDR training data that can be reused
across boot to avoid retraining and reduce boot time. The Sahara driver
currently always falls back to the default DDR training image, even when
serial specific training data is available.

Extend the firmware loading logic for the DDR training image to first
attempt loading a per-device image dervied from the device serial number.
If the serial-specific image is not present, fall back to the existing
default image, preserving current behavior.

This allows reuse of previously generated DDR training data when available,
while keeping the existing training flow unchanged for devices without
saved data or for all other firmware images.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/host/clients/sahara/sahara.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index 9adbd84859073d8024ba2a5fcfa33897439d6759..b5ca6353540dc3815db6539e7424afdb749fd3f6 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -59,6 +59,7 @@
 #define SAHARA_RESET_LENGTH		0x8
 #define SAHARA_MEM_DEBUG64_LENGTH	0x18
 #define SAHARA_MEM_READ64_LENGTH	0x18
+#define SAHARA_DDR_TRAINING_IMG_ID	34
 
 struct sahara_packet {
 	__le32 cmd;
@@ -226,6 +227,27 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 		return 0;
 	}
 
+	/* DDR training special case: Try per-serial number file first */
+	if (image_id == SAHARA_DDR_TRAINING_IMG_ID && context->fw_folder) {
+		u32 serial_num = context->mhi_dev->mhi_cntrl->serial_number;
+
+		fw_path = kasprintf(GFP_KERNEL,
+				    "qcom/%s/mdmddr_0x%x.mbn",
+				    context->fw_folder, serial_num);
+		if (!fw_path)
+			return -ENOMEM;
+
+		ret = firmware_request_nowarn(&context->firmware,
+					      fw_path,
+					      &context->mhi_dev->dev);
+		kfree(fw_path);
+
+		if (!ret) {
+			context->active_image_id = image_id;
+			return 0;
+		}
+	}
+
 	/*
 	 * This image might be optional. The device may continue without it.
 	 * Only the device knows. Suppress error messages that could suggest an
@@ -235,7 +257,8 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 				      context->image_table[image_id],
 				      &context->mhi_dev->dev);
 	if (ret) {
-		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
+		dev_dbg(&context->mhi_dev->dev,
+			"request for image id %d / file %s failed %d\n",
 			image_id, context->image_table[image_id], ret);
 		return ret;
 	}

-- 
2.34.1


