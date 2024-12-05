Return-Path: <linux-arm-msm+bounces-40520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 684D79E5935
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9545A16CAF4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 15:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B101222144E;
	Thu,  5 Dec 2024 15:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V6qWLzIl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F7221D591
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 15:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733410886; cv=none; b=VHzmScyPnnjbiY8fWS1vSP4LKZrGv05sjx6iwaZMeAZIUbbv6iHq+SJUCJQbUu9CZb6Csp7ICiSw6T0Reou+zgXFVsT8j2dOJDjLXaxzBIsRPwZI77ghU+gst/lcyC0OC1lHZaV0OpYfsDjpCeBSNzZYflLAPep4VvrNCenIC6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733410886; c=relaxed/simple;
	bh=xjNH0ZqzPNeRyAGL1QAVeh9hZcwP2oOm7fBqheYEiRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uux6t5xDyAX1CaQ7EsX8K+zc/iDVPDYETIZkSdEwB76pFxfI5vDhkbTu0GgXIyhCof4OdGDj04rN8QABLCFPcpnidOTGBzvc1q6wt3DuOL0R+fsrK8no0mMglKcnSLczvp6by6XTNwhYncaH7M+JEOV+e5jwTwSy1STkY39jK5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V6qWLzIl; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43497839b80so7009665e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 07:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733410883; x=1734015683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pVmiCOyrS2ecuSLMnmZgZ6KHsHdqqKLAjno5SAELDnw=;
        b=V6qWLzIldJNkGhPdS9/LZVUgCDLErzm2l+n6kdkiAR6HX3MILXsmwd9Hn5SdJSdd+B
         tOI4K2CFNbrolW3+M8simKsu6EdTzbmXSdFvMcl1E+44w9fmQwoU6sT6pwtI24EAJjBd
         R8TJWbZJiXR8vuiTR+ASta0mnDaB7o1M8WW//+9kbkIyfN8jUfzKf+v4gm9/yKzwwGxq
         CtlckjwzWYbWSbCj69k2drtR86Nbh5eU0mv2SV2sgAN2Lacb8hM0Afv3oDI97RcJW0nW
         OmAccun3qy228xowvUkoYpAuTNeW0m2AyUCHbF5QUtIPuW3CkTh21XcJUbrFiF9hL2o3
         9Opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733410883; x=1734015683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVmiCOyrS2ecuSLMnmZgZ6KHsHdqqKLAjno5SAELDnw=;
        b=TL4SBkl4S89wIv67g+DusyEMg2Vs9dKnkGX49PVKYw8Qkhk8RCCnQvwbtNE5ZoFvDU
         VNdbKhB7ovnkKkwHPQOrfpoulFD1aWTSkMvHmMgwKWJzw2MxLqMeCwgEK5OmCd5gerdI
         MfbPe4kwJ7ivVfccD9LJA3IBKNDTtYGt1GnhbCmukIRRS56sVNonHslZW8kkCozENCPz
         uzaJp28RgeeRKXivM6sWPXyxgW2H3j9NALRZtyCqv0unCdvroU0yRM10LMSHiAcOhOk5
         a2TrZOSRBVV+iHpQNfqxFQv1SqMOJAdA3RRjPtYx8Is4xagzb+sFhOo/Fhm/lXCAd2mY
         HA+Q==
X-Gm-Message-State: AOJu0YyvdRyE1oKWLQg8ymf8e8ET0mM0oorMK3OgZy9csI7CY/aSeqY5
	YCNrzIMLM3sXJ5jvYR49ofE96qckq8MKT068JgH8LNYAD0RMIB9zoK+RCqQGV1I=
X-Gm-Gg: ASbGncsEX0ditLQpb1AY8vV19C5sb+/Hd7XY6jxb/RimnW3crj2vnvOl1Q+x2dFs19w
	yqr71xt9vgJ+B88Ip27j4ZZliZI/FIYXX5S0ouKUThCJA3UDZ/lzmZLpH7v+UzrlkVTxnUoVtOS
	OUaM4yaQyb6MdwFCm8YFeMdllURgW4WF/slFoG8Z/HnUkLBR9JB20fftsA3PtAoaUYrKoAx7wQt
	h50eMEN79cHHxfqHItVgovfWuUC2KclMTPcr8VybrZElZPC06RYuLpMStLHCEJpOzbeUNE=
X-Google-Smtp-Source: AGHT+IF+fI+rBDjJrU+kXFKlTf8czZ3q3nJgnXFs4n0YVqpgD8vtKzBieMa6idDq1qW4Q72VL2TB+g==
X-Received: by 2002:a05:600c:4ed0:b0:434:a929:42bb with SMTP id 5b1f17b1804b1-434d3fae263mr79609215e9.18.1733410882347;
        Thu, 05 Dec 2024 07:01:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52c0bc7sm62830795e9.35.2024.12.05.07.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 07:01:21 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 05 Dec 2024 16:01:09 +0100
Subject: [PATCH v4 5/7] drm/msm: adreno: enable GMU bandwidth for A740 and
 A750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-topic-sm8x50-gpu-bw-vote-v4-5-9650d15dd435@linaro.org>
References: <20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org>
In-Reply-To: <20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1797;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xjNH0ZqzPNeRyAGL1QAVeh9hZcwP2oOm7fBqheYEiRE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUcA5gbDK8obKvAzOZxReVLFxhmvbSIw3RBNwoTYb
 eBXV/3aJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1HAOQAKCRB33NvayMhJ0eGJD/
 0Ynhh+/HQyy6sZPO3LnIuwJeGY8Y9+4S/9eTmNUJg8YyWb1a7x2k+zPRMNePAZ+vh7K3ZMgpUCv466
 phicYP82gtIjbUWAExMW6zvz8s4p2I8B9+Kz/HKP7yNmLRcvuv+RIPvQv0R7uG0bE8+iJzqTwJmZi+
 ihWfnRAWR14OlgLlIGBsdl6gm1yugEwVciJb/07uqykcCjWyC9Yz1m9S9D6F4QbTBoV9bhftD+Jlth
 PfMixhetpukrzlqJHJEo7HncfbRBErWSM5sE4ZbXsHwJ4BK1rXWvcv0sOJGcU5OB6cNywp07XQqiX+
 R3x+PIPZ8iHwM2VJ+u/4PjsXI0hO2ghoCId5VX99LkiPjsfHbjNw9p6toXfcbW8PwA+hjjE8rxtr8G
 pWlqAD/5pVobtJ12Wg1htaG8w9iN/ooTpKPnGuodATyDRsj4mOIvd5ku+ixCqpmY3hTLG4+Ca4Vh5B
 JvYQVXl/nlDZLraEQ5SJVg4JJv7uICi2XLJTgxDe6PGfpawpOWC8JWSq8UsTuL7BErY/ZYzzFqDGtf
 7Q8n3hQnvcTBuK8AjzaiaNO+IC/YodtKY5NczOnSpZb7V6V8lzcexDZJfDp/2nv4rFERjNFdvbwnDb
 B6cuycE0gxG5Cjltc2Sjljy7eaQATxwtbzJia0u9Ywx3tfSqdHl9q3kWPolg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
is in place, declare the Bus Control Modules (BCMs) and the
corresponding parameters in the GPU info struct.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..edffb7737a97b268bb2986d557969e651988a344 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1388,6 +1388,17 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7020100,
 			.gmu_cgc_mode = 0x00020202,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(3),
+					.perfmode_bw = 16500000,
+				},
+				{ /* sentinel */ },
+			},
 		},
 		.address_space_size = SZ_16G,
 		.preempt_record_size = 4192 * SZ_1K,
@@ -1432,6 +1443,17 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7090100,
 			.gmu_cgc_mode = 0x00020202,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 10687500,
+				},
+				{ /* sentinel */ },
+			},
 		},
 		.address_space_size = SZ_16G,
 		.preempt_record_size = 3572 * SZ_1K,

-- 
2.34.1


