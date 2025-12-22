Return-Path: <linux-arm-msm+bounces-86212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6FECD5B0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:59:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40AC13076E2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F9C33ADB1;
	Mon, 22 Dec 2025 10:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ex191p/q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pw4afSjz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2845E33A9E7
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766399124; cv=none; b=RfDt9stEO4b7vExzq3slTqAsgDDl20fyYX1bZ8M4WWQ3r0ZzDzWsNwpfyBhwN28V0+M5E+ju1fPb7n728cYTmIg/Y6WYpW7d8wcjQL03PXJNIemDE9g2mHXMPnq2OMg0MXn87XHCtjczLazm9zOeH9hAuwmjP2LTv+eTxacJRlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766399124; c=relaxed/simple;
	bh=s19WZGnVsjnU3CIa2pjMzvDcR1778Z6ip689C/D4ewo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rZUwiCpmjfr4jiDzFXuueQ1l6zd4dAcGRg3iu9bsopavzxq+rQ5xIU+NjUllkEtssYlRWl33Z9ua2gqyko6u8eO3SpFVwxnWnMwPn+jCJ1R034xhgLc6rwEsTdYiFVevqXAehkuFnuqtW0zs83V9vovFS4YKHa+SBVZw2teJrjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ex191p/q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pw4afSjz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM7p1qZ3517171
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I87OukHNOgS
	eTgoOXQALSi1N6P0XQunpMCBrwQ4g5NU=; b=Ex191p/ql16sewZtIMwT6/qtmAE
	SlWM3WJB+jiBt8d0ojnVDpYcUPrEcHAzCQOuwSwINV2BMyDNTnToHRlU/lT2ytnZ
	4L7SdLpUuuK6++6NKqoO+Q86YAkGK8zw08YK8HJ8/kUvZZk/6l3nVg3rwHDmXuWC
	cBW/xvaZY3KliFmW5F2k+x4IM2HEovCYIcznts9/KTETyOzEzB2pId26XJenQWcE
	eqc4t6CcjacN/hOS9GaPt5yvKzD0QVMPVfvfgOR3QxLVITOP0CklFlhYh9kIJkeA
	oSoh1o0fK/Ep+sFNiQMwIy4ggd7b+b53og5QUDr7KkB1v5iu3xZ1KPphGMw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b69ahjy5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:25:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed74ab4172so89000441cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766399121; x=1767003921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I87OukHNOgSeTgoOXQALSi1N6P0XQunpMCBrwQ4g5NU=;
        b=Pw4afSjzqUnZtE3Pyjlu7+sO6NpdsGvCddhSa3lRRfu/iJCBU9kO0QZ9cb9XWVfC2Z
         wilnW+kGS9drJKBMg36/sf90fyhbXQqA14UZpkOODI38s7WHEBMtXSeflcbbvnsBjedf
         OQkBIDC2KyGCqdGp0I2M0buErGbuSnmOxQ3BnyjVmXeudxq57PdDyIN/Q69HCFSzKRBl
         uQHLxDPMqVU2jMnSo3wv3Wl0Ot+JHKgiEXoXBfK0NbDe9rH+LiEjs+PmhvhoM4CMx5h3
         ionbAxg9LDx9JserlLXvVt3V7pAaYyiafJ6n0TumC1W90jdV8FjKJDOgKZg2Gp8vb5wa
         oOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766399121; x=1767003921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I87OukHNOgSeTgoOXQALSi1N6P0XQunpMCBrwQ4g5NU=;
        b=jySN4U5dl11/acsmuC5Eng0fR71+iW2OZbsziIO7d5ZkQ+Dwl09PMNFzwaNvrWxH1k
         MNV+yA5EjisWS3J6nPBwW3DxQWnVLGlIElK9OX2BINVOKGN0ACE9rub7ZXhtDSZAkSOY
         mH3hJ7wmwNtxaK0JwbhdN9yS/Ef1egN0LkQs4abquWRTdAU3K6qxsNgxTxLYYWmpQZR/
         aVGPn4WAPIHRI7/80oIcBIKu1Yew5Z5buamz3I+GitsxZ+ns7m+XTJzHIlqz7J8FgjRy
         6Sqr7dVd27N8Au+b34nGuPmqPdldq9L+02hMXtSHFM2E5nJnmEw49WuzJU52priM69qd
         XQSA==
X-Gm-Message-State: AOJu0Yy4cpxIQg5S8xMyBrGg6NsyonYM2zp5qqdXiYBmN9gq7tMokq+h
	2qunz7K5hxCDFJmlJQWMPeqdSnyDR6rr1RINC1DdX/bKl/FCNdCKztcHL7gxRJqXs5OXawbidnm
	cL2pShL9ocMfq4+F9ELbJLbSaJNWFg5VyRdm4IkgvUmePJDrTFta0/i25IBVKsgyVXGZu
X-Gm-Gg: AY/fxX4A40cqgnfZ0SqMs4T2JALyaDyHpvAJd8wr1uU8hRvRFVFUGE3+mr9T4hVJoyV
	JJoAUBI0sP1bpY2a68Du94tTXBScsz4KeF5RoZB6aeO6PJeKMuHkeWckR3WXPQaSWqgvC5vM3NH
	rfixb2RhePY3lPp3jPZAeYgVCA5ZRcguIVR8pA/vhwSyW1CIoPQsz7INlBwJJYP2iNJsg7Q/e7/
	dN079MnDbeiWgbz2AdcpUQVEidnjeHti99sha/bW7V8UiOkvzJIjL4JzOz+hsQW5M0oYwtDOUbW
	1+PfqSVqGVfCayfEBaFsV8jbhWPk2OfxnuzmHK8aiKk+EYzrnywfXwDvr8ZvvHLQk1m0JPdRDC8
	gr6iMO6Hhu+gR/F7c2/rSLv9doFSB2smMuSIl4mzlbRTzYp3217KkF+F6H3HWER1QmDg=
X-Received: by 2002:ac8:6edd:0:b0:4ee:4a3a:bd11 with SMTP id d75a77b69052e-4f4abdb8679mr122548241cf.64.1766399120766;
        Mon, 22 Dec 2025 02:25:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHv+prSihqvnWffihQ2+hcTUK9zU4sicwbepF1PbdZj8C/G0OYU4yxIBNqszK6WrFCBp1Z2gA==
X-Received: by 2002:ac8:6edd:0:b0:4ee:4a3a:bd11 with SMTP id d75a77b69052e-4f4abdb8679mr122548071cf.64.1766399120369;
        Mon, 22 Dec 2025 02:25:20 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac66a1aasm72500001cf.33.2025.12.22.02.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:25:20 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 08/11] drm/msm/dpu: Add interrupt registers for DPU 13.0.0
Date: Mon, 22 Dec 2025 18:23:57 +0800
Message-Id: <20251222102400.1109-9-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JuH8bc4C c=1 sm=1 tr=0 ts=69491c92 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RfJNy9JZAWTFlj1jTG0A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 4tHACAaS1bN8gPQWmF1uGrMvjHkW8Zw8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfX1BMwYkjR9syH
 kNYboPC0bVMR4Ei1sihl2nW54VvxDyaOyUczimJo69kFRNZNvp4OXICtpoTcEef3j0xKzEIHjzp
 VCPOCb6R7YtxBiP99roF/jUOB7HepjQY5liud1aUugSe/Syk1Z/aE469+jhKnc6jZ+AMx2ruMfs
 TY/35dk5N4P5x64S+8Yc0DZozSTS7OAD66t6AEfBL5tEXekP6NiLOaxzoN5qtEtJkKDCKyKDTvB
 3jSg0orr84XAo0GV49qlctUSTTz6NB4MByigtB3Tw0GEaSunXzTM1p1odOIdIiGhmTnkkYYRJiU
 sk4ChDZxR/z1wnpRmHGOVAZkyp+lwCjQaWQCcqycP//gOxnuGow0DGjGfkVxStPEQtUzz1TW+4D
 dL0yfeEPvEjDjSacgrV4UWvKA8dukfqi+g7MafpVnTWrsl29PrboPEmG5wX1Q6DgprBmhYpBSNM
 csdKgHx2qP62pC3q9lg==
X-Proofpoint-GUID: 4tHACAaS1bN8gPQWmF1uGrMvjHkW8Zw8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220094

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

DPU version 13.0.0 introduces changes to the interrupt register
layout. Update the driver to support these modifications for
proper interrupt handling.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
 1 file changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 49bd77a755aa..5b7cd5241f45 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -40,6 +40,15 @@
 #define MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x004)
 #define MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x008)
 
+#define MDP_INTF_REV_13xx_OFF(intf)			(0x18d000 + 0x1000 * (intf))
+#define MDP_INTF_REV_13xx_INTR_EN(intf)			(MDP_INTF_REV_13xx_OFF(intf) + 0x1c0)
+#define MDP_INTF_REV_13xx_INTR_STATUS(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c4)
+#define MDP_INTF_REV_13xx_INTR_CLEAR(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c8)
+#define MDP_INTF_REV_13xx_TEAR_OFF(intf)		(0x18d800 + 0x1000 * (intf))
+#define MDP_INTF_REV_13xx_INTR_TEAR_EN(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x000)
+#define MDP_INTF_REV_13xx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x004)
+#define MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x008)
+
 /**
  * struct dpu_intr_reg - array of DPU register sets
  * @clr_off:	offset to CLEAR reg
@@ -199,6 +208,82 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
 	},
 };
 
+/*
+ * dpu_intr_set_13xx -  List of DPU interrupt registers for DPU >= 13.0
+ */
+static const struct dpu_intr_reg dpu_intr_set_13xx[] = {
+	[MDP_SSPP_TOP0_INTR] = {
+		INTR_CLEAR,
+		INTR_EN,
+		INTR_STATUS
+	},
+	[MDP_SSPP_TOP0_INTR2] = {
+		INTR2_CLEAR,
+		INTR2_EN,
+		INTR2_STATUS
+	},
+	[MDP_SSPP_TOP0_HIST_INTR] = {
+		HIST_INTR_CLEAR,
+		HIST_INTR_EN,
+		HIST_INTR_STATUS
+	},
+	[MDP_INTF0_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(0),
+		MDP_INTF_REV_13xx_INTR_EN(0),
+		MDP_INTF_REV_13xx_INTR_STATUS(0)
+	},
+	[MDP_INTF1_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(1),
+		MDP_INTF_REV_13xx_INTR_EN(1),
+		MDP_INTF_REV_13xx_INTR_STATUS(1)
+	},
+	[MDP_INTF1_TEAR_INTR] = {
+		MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(1),
+		MDP_INTF_REV_13xx_INTR_TEAR_EN(1),
+		MDP_INTF_REV_13xx_INTR_TEAR_STATUS(1)
+	},
+	[MDP_INTF2_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(2),
+		MDP_INTF_REV_13xx_INTR_EN(2),
+		MDP_INTF_REV_13xx_INTR_STATUS(2)
+	},
+	[MDP_INTF2_TEAR_INTR] = {
+		MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(2),
+		MDP_INTF_REV_13xx_INTR_TEAR_EN(2),
+		MDP_INTF_REV_13xx_INTR_TEAR_STATUS(2)
+	},
+	[MDP_INTF3_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(3),
+		MDP_INTF_REV_13xx_INTR_EN(3),
+		MDP_INTF_REV_13xx_INTR_STATUS(3)
+	},
+	[MDP_INTF4_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(4),
+		MDP_INTF_REV_13xx_INTR_EN(4),
+		MDP_INTF_REV_13xx_INTR_STATUS(4)
+	},
+	[MDP_INTF5_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(5),
+		MDP_INTF_REV_13xx_INTR_EN(5),
+		MDP_INTF_REV_13xx_INTR_STATUS(5)
+	},
+	[MDP_INTF6_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(6),
+		MDP_INTF_REV_13xx_INTR_EN(6),
+		MDP_INTF_REV_13xx_INTR_STATUS(6)
+	},
+	[MDP_INTF7_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(7),
+		MDP_INTF_REV_13xx_INTR_EN(7),
+		MDP_INTF_REV_13xx_INTR_STATUS(7)
+	},
+	[MDP_INTF8_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(8),
+		MDP_INTF_REV_13xx_INTR_EN(8),
+		MDP_INTF_REV_13xx_INTR_STATUS(8)
+	},
+};
+
 #define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_BIT(irq_idx)))
 
 static inline bool dpu_core_irq_is_valid(unsigned int irq_idx)
@@ -507,7 +592,9 @@ struct dpu_hw_intr *dpu_hw_intr_init(struct drm_device *dev,
 	if (!intr)
 		return ERR_PTR(-ENOMEM);
 
-	if (m->mdss_ver->core_major_ver >= 7)
+	if (m->mdss_ver->core_major_ver >= 13)
+		intr->intr_set = dpu_intr_set_13xx;
+	else if (m->mdss_ver->core_major_ver >= 7)
 		intr->intr_set = dpu_intr_set_7xxx;
 	else
 		intr->intr_set = dpu_intr_set_legacy;
-- 
2.34.1


