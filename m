Return-Path: <linux-arm-msm+bounces-110781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBA1Hu6iHmq3IwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:31:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D092862B9A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DC5A314F376
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14D53CFF5E;
	Tue,  2 Jun 2026 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRB5h+VL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JFUlGSPt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E0C3D47A3
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391512; cv=none; b=deR9229gBRJeqyjot0ISbPNZdYEBwr4xqoWcRDv1WxMMsLsIjQL6z0P29yWDHBeBvO3+jlyS66N2e/2CFeCnd9fl4m3zhKWHanlhMHYER6WkLAaZBfwk37L1Y5R/ozlN+WFwoezt9IXucx4gpAyHJO26CrUuD1YNwJ4FchU/+KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391512; c=relaxed/simple;
	bh=ixgmYJIVCgIesw8IPUX+/UcnW6cdOBjM+XPZmes1+Eo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gdgZ1KwZNZwbMQVqagyowU71tFmmrIE/qtHhyOszlOc9GwdsbS08jtOzMR00qzC9Kd32A3HX4i0c4nX6qA2n3A0CjONw07NoWrJ86FiYWTSYhJ/EZeWCqMQVqsk5et7M/C3N/EVyPuBhKSC2MBPIbm1L+dRAFoyKfv80uuQ53lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRB5h+VL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JFUlGSPt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6528KKQC3429870
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IovUpKpDFwGWZaF4DLWER239PrNpT7oEBKFqXm1bx5A=; b=nRB5h+VLOnyb7b5H
	MzBxDkXq2aDo6Ver+IH7SW1QClrIB3SACFd4T9J+1+TZtZasYhREa4K7kS8OXacF
	/JiRFxZUq35P3Q/xIiEw5JQjAsZo/lyW28OL4eU0kxYyYfJMVQZOb3pgyEMAMuPu
	nK5NzkXQPz2SjTPsnZGXRrJSfrXFAx2F7VE5O6SLYd/r6Lnbk8caXOws+JYOH8ze
	x/H8u7QvIUWGcNDxXqnfzLqLf5v4S2JK+7FFImBMsMV3afIzbGbQTFlZTVts+m7l
	7oc/6bxsubZ6Nw9d/3JGxxPrt7GyRT1hL2Yl5clhtIKAdx561giMHGbIZAb3i5/K
	FW5xLA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehn8mhq2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:11:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51771d41426so4624031cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780391510; x=1780996310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IovUpKpDFwGWZaF4DLWER239PrNpT7oEBKFqXm1bx5A=;
        b=JFUlGSPtLDYE3RmjVCtEqRUNo+GNA/PkhlGFI47t+JIfmVHcRPp3jtm/c+XZB8wX5Q
         HFXxBqA+y3jpghNcjOgcI0Dw083JAl3QExdZIUrl4ESOnyR3JpExZpQDvCYXlmMMBhHt
         Du8J7yZJRMR5tJ6Wq5ShPfKSsJQZG/Noj9Bm7l9+6ki2aSAmlib61x6Vd4EVAuvbOKet
         yBxPx2QKk8UWpKRfzJvN2C0PplBiUulq+rAtiaxEztW5JFe8KiWbEhuwXYpw+b9kay7v
         QJXn4eR1Be03zff1Kt68hBx/NeQ++qF5aCp93tImifrTHR6M+f1DCjS6Ll6xLFfU9rCM
         vU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780391510; x=1780996310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IovUpKpDFwGWZaF4DLWER239PrNpT7oEBKFqXm1bx5A=;
        b=mkAQsJxxVKGSAES5r30CbSpOufGB/z8dKz5/eIYgVDoFpHbkfSc7QdF4Wq/x5NiuCo
         qgCrSckvoPMAtYeXiOVfR/hvrH/TRqGINTdwrB5btlvh4zuc9hvauhy3XmKJUVO9WIb8
         ore8uSDwwx+I1X72m2/7WwZNGDEaX402pgno0+mstMjjKR0UKRMxRI7qtPb9WQ/CZU/G
         40h2DchUC0a8X0nF6aHwP8ui+dHQV/dMd3p6UwqRBbOTTSKM3KzccoFjJqYQXrdWHfxc
         IZQvZ+2/I8AoB2d3BeaYZSlHKEv3fkKBr53QfV4OtPy7tZGV5P3RiiABenJQN/I8ay2c
         WavQ==
X-Gm-Message-State: AOJu0Yw1GdlSRO3aQbff04iGEMt6qOdqlgU4W/R5nkFAPiXVy3Lx1s9q
	wm9vuaydJy6OEXs0Ud4wKKBEUaUvzjUjElmbPAy6OmbgHzEuZWljWEqVc7Sz7oF2T/8t5fbQlf/
	W55xhC41rBEVgQWwQ1dpuIey+SWDNpkQMPCqtFz3Cw44FkH6hU/QfxbAOykXe3/eQXF8+
X-Gm-Gg: Acq92OG1FTQ6DNcYnxywE8WimiREJwbWUoJ9bjxZSaYTSXjmn9aIN584EBV59S1T6LO
	YRUOXzqP6S6jM3vd4pjaYI68W1D9y02QUrQCTVENth0cL7nptzm96DRW9uxKtR3Owk1KoRWL6ip
	BMhd1KYkBdTv87NQN4o6z05pt9cPPLFgWLklExSYr1iINGbsZ501pns8CeEt6pUWBCRnz7Bb1Yw
	XEIQkhtqrpV3XD8NiCyyRmPcmfDdkbr3m1QpC2IMCyEi8pZUG6GgtY27LIqga9z2zKo+lzmOTrH
	MkJ3StL2XqEHwooxO02xsm9+Pp5yoUt3eDdjjv5qQ7XKT8Rv311+oFPScbSKai0zC+NUiGhiqYB
	zejgrPFoeh/+Z526OP996mdrszLAjzZVJa7L6Ir9ELTeJZ+JY9JIzwgK72AZBq4P1w6Tw20SxE7
	UWHt04B10G3C3zR80phQ==
X-Received: by 2002:a05:622a:5588:b0:516:d4b1:48cc with SMTP id d75a77b69052e-5173a5b4efbmr215685751cf.8.1780391509707;
        Tue, 02 Jun 2026 02:11:49 -0700 (PDT)
X-Received: by 2002:a05:622a:5588:b0:516:d4b1:48cc with SMTP id d75a77b69052e-5173a5b4efbmr215685341cf.8.1780391509319;
        Tue, 02 Jun 2026 02:11:49 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51768c76e53sm12480851cf.4.2026.06.02.02.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:11:49 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 17:11:18 +0800
Subject: [PATCH v6 06/15] drm/msm/dp: split link setup from source params
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dp_mstclean-v6-6-2c17ff40a9b2@oss.qualcomm.com>
References: <20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com>
In-Reply-To: <20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780391476; l=1402;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=ixgmYJIVCgIesw8IPUX+/UcnW6cdOBjM+XPZmes1+Eo=;
 b=wQzA1NrqLbrqIbng1TSRR2q9hmwp+iEZEBvdcs8FrTVsSEdAZMPKBB4tatmzXucFn4wiG3Qc6
 4279BVHj7IKCpFz2/1YLNZLLtl56qWVDUllMS4Cim1r5nPqnBWg2OO6
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NiBTYWx0ZWRfXz/1qljzQKH7p
 YwFy+oLFc18xO7H1t0HXMwrZTsxPo+U146KWHhF8NOtBX3SV7COHylGJC6iL5Ezp2AhMEzbUgz8
 mLc6GOLFXIeU2xYvQbipDcvivrOibtpT/s4tG3swget/t1gThpSt6SuZ9nRNywmzHLb54vOSFwP
 yFJUVE0R15YDRMEL2hCN2DAuoJU2NnD2+DlBbCvaLIC8aaSCxLt72TnZP2qlkdvS3ESLZEdwrNp
 ar7pg75ShmRratYqhiN9U1IEj9MU5aHijK51rHmLAh0+2On2X/6OqXTC6DISdXcTREmNolas5bO
 zSXVRyIf3lkyTWmi/Dk7l+ltJFxYAz5yng4vWi8el8hpiDR25/+2fS0nW+z9jWH7zkGJVZIWeJ5
 3M9apLWkxaKDAbxDtwas9TJllM8ecvMcPjAa9C8/M57WpcLhWMopOCU4Z0fcAEg6Ghnwqkl5Xty
 Maotvhw89pvmvSGKU5Q==
X-Authority-Analysis: v=2.4 cv=d5nFDxjE c=1 sm=1 tr=0 ts=6a1e9e56 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=saXSvH3Ee-fMY4W8qR0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: KqYuY8h-oqfK49XwRcSm8eEJHblphG-Z
X-Proofpoint-GUID: KqYuY8h-oqfK49XwRcSm8eEJHblphG-Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020086
X-Rspamd-Queue-Id: D092862B9A7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110781-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

msm_dp_ctrl_configure_source_params() should only handle stream-related
configuration. Move the link setup out of it so MST can program link and
stream settings separately.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 71d45b2c4daf..1c2eccec6ec6 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -482,10 +482,6 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 
 static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
 {
-	msm_dp_ctrl_lane_mapping(ctrl);
-	msm_dp_setup_peripheral_flush(ctrl);
-
-	msm_dp_ctrl_config_ctrl_link(ctrl);
 	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
 
 	msm_dp_ctrl_config_misc1_misc0(ctrl, ctrl->panel);
@@ -2551,6 +2547,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 	 */
 	reinit_completion(&ctrl->video_comp);
 
+	msm_dp_ctrl_lane_mapping(ctrl);
+	msm_dp_setup_peripheral_flush(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
+
 	msm_dp_ctrl_configure_source_params(ctrl);
 
 	msm_dp_ctrl_config_msa(ctrl,

-- 
2.43.0


