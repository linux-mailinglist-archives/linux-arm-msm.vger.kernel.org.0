Return-Path: <linux-arm-msm+bounces-34321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 670C699C8B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 13:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 899EE1C245A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 11:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983131A3A9B;
	Mon, 14 Oct 2024 11:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LEP99TSz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8CE1A0701
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 11:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728904929; cv=none; b=T1h9/U3MFncy/dmbsEWq+W0LWACGAoNxG0+1PNkS7u63mzi4tmdT++/g3ZxPpuUvXOIHCNHKCYji7KPjlpMzFhTmdkKkSKfjfa8OvEPeIgPXPMjUvKfgmfrd8otBjGdUTpCYWwH8ZX0hMae2ZOdilq3phBryWwdHNhKCRjQ8Xs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728904929; c=relaxed/simple;
	bh=5j7RWbokREf3/yVv+64zXc+WC7gGHZ0KTGF/8hvreSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kSd8OtdrpOf1Kyg5inUzeirU884JOukmmlDOUPQNhz/juG59zX5XCMj6vqs+WBP6OXtoVM7bLVoqYw7xuxiorZJM4UKAAT7yZkBROR9dTplwyOS10qDk/1nYT1S+p6GWQxpLcCXQxafLxsupwxv4ZAZvRYxOxMgIGyPQYTQFV8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LEP99TSz; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d51055097so2390009f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 04:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728904926; x=1729509726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jV/pGOZ7jki2Dt++ge2j58v/V+/bbaCGx8cjzODRBdU=;
        b=LEP99TSz1xpEKoPTBCr3D/+LlrcJ1nnGruEP8Ktwip1C/9PBLD/7BjIhj83cCXk3hz
         GGV9D8ozQxCpXbB1y6fHefbcayXQHa8RnXAbpf7jBcjt0e4urNqOJR2TocePaBOfn0hC
         QZFQF4pdQr8J6P74atZ6oUk7z6kKDvBKaDlR3D8Ad41khr5CSeKcVAye9w5pRhILg0rf
         NSfsZBrT59XMmEUIR90FYz439Xf7VHHumhUfzCd4TAFh3oRTEAX2PsyEtXaVvkU5rFLb
         /9imRcsxUDYpJs2AtFhQv4ZzIo1etqA/6O7LITVDnggSsaMSC1In9FcdgtIqzQH340JR
         RjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728904926; x=1729509726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jV/pGOZ7jki2Dt++ge2j58v/V+/bbaCGx8cjzODRBdU=;
        b=kC9wFvLGzJZOr5ckopcJiHGJ4DAikgAK7LEWpChierlXeKzf/nVKXyOCzhofByBsB8
         qxGIriyw3h4QRvPX6gCmNcnt9GCJ0mDf/NjAc9XNUXeo8xPsQX6K+7wNcGVH5bLDzKkT
         F5EIC6UVQbrnAIVrwsQFilkWvgtJnCZ5tZf5zmGKsM0qV1XSh3Uk+G09IYDQVI12l6Ui
         aPOToEVbRfMRnKi6y3IEmE/oqwq6tMRh2X+F//NUq7POEkOVGFnMpkd5tT/XkH7zDSK4
         Ex6DxnoxvKJDNpduIRkiu2qjc4c1BjKtY2zvhpou4k2hxRHUo7Sltmb2EDLKu1lBFrPm
         o3Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXLZNAy5WAcAqwmqj4wJ1N6mPh7ZNw5vESbdsJ9SZDNm1pR9xSY/gCxf2DH+2PxKl8PwzvkwW34hCoKseyT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ieacwysghN2Pgtj3/yMbP1myxgv90hPFpu9P1yI3uhfp3hAk
	FeEJmN7ajf2pqpHARhPcdfA/koIV5WR//1GI3qWqYScOvh13Jk0RsE/HG1gxfWU=
X-Google-Smtp-Source: AGHT+IGfSE9dQTcADr9Wnv4UAhYoxwFIKKy8ClV/SB0O2U7/2LnGTJ6xYUNY+Iv4r50STsabEmDbng==
X-Received: by 2002:a5d:62cc:0:b0:37d:4c8f:2e1 with SMTP id ffacd0b85a97d-37d5ff2c395mr4827225f8f.22.1728904926082;
        Mon, 14 Oct 2024 04:22:06 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8666sm11098702f8f.22.2024.10.14.04.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 04:22:05 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 14 Oct 2024 14:21:49 +0300
Subject: [PATCH 2/2] arm64: dts: qcom: x1e80100-vivobook-s15: Drop
 orientation-switch from USB SS[0-1] QMP PHYs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-x1e80100-dts-drop-orientation-switch-v1-2-26afa6d4afd9@linaro.org>
References: <20241014-x1e80100-dts-drop-orientation-switch-v1-0-26afa6d4afd9@linaro.org>
In-Reply-To: <20241014-x1e80100-dts-drop-orientation-switch-v1-0-26afa6d4afd9@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1051; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=5j7RWbokREf3/yVv+64zXc+WC7gGHZ0KTGF/8hvreSM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnDP7ZDGL6UG+uoxoZGoo0NfoYAFiOwyo+YdNkc
 5kdtBG+pcOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZwz+2QAKCRAbX0TJAJUV
 VuptEADNoRbQrFkBrNYvH0t+n+KlGB1+WP066An+9VKvQmwI2W54Hms64DNQ5SxrvhGv42JIE2N
 yhDDjCJsFJuRmanHm3ZHAlZsJkfZhMf1uHeEGXOOkMOPWe56PNHhCjeKvsXb3GJGGCzsm7oTckJ
 stXMXe1iWeXc2nCPxOtltOoNQ8x82xd0Jouct32pFb4ynolVXDh76JQ9CAR/Qz+hl6RR2/GFVtF
 /qT0f8AX7IoZGhZnULGhrdUnFKhN46f/tUxnqxJotUb6po0/Dgi1zMCwP2RkGmDpSm0QN0UowWj
 3+WXoQeSG9dBorL4S+QKPm8QA1ere4YdN8nzN8udSGVVgSgaRYvaaBHUmzGhFZZIR2+G5Bwdggp
 w0EsEQX4tPaShuverd+SOh6h05zoqesdUlSY6602fcpvsuul+9xXMDIFSV/aJaqn7WkM/YBsM7f
 IoajM0NQVzBL2BlLNSi4xGTzp733lG7EAiQumCsIBy2hVlGeomrpciDr8f36EttBJYxv/YsWrLr
 MBTDehaiN7161uHV+sUVHu2KK+N4KmVruQs0R7JwbB6TXCEHFCMfNSpXh2nlBc6f1vH/U13+Q2b
 oES9TLAwppF99XAVfzAm6+rv7D6ZlHOI+FrbCWlprsVTOOo9Ux82pgj0jtsL8QdGG0u20ZfALPY
 2szirTUXFy31ITQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The orientation-switch is already set in the x1e80100 SoC dtsi,
so drop from Vivobook S15 dts.

Fixes: d0e2f8f62dff ("arm64: dts: qcom: Add device tree for ASUS Vivobook S 15")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index 20616bd4aa6c5c10ee989f1b98d22502b8834c0d..b54fe61002033188d0b95515a8cf19cdf9cdb11b 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -592,8 +592,6 @@ &usb_1_ss0_qmpphy {
 	vdda-phy-supply = <&vreg_l3e_1p2>;
 	vdda-pll-supply = <&vreg_l1j_0p8>;
 
-	orientation-switch;
-
 	status = "okay";
 };
 
@@ -626,8 +624,6 @@ &usb_1_ss1_qmpphy {
 	vdda-phy-supply = <&vreg_l3e_1p2>;
 	vdda-pll-supply = <&vreg_l2d_0p9>;
 
-	orientation-switch;
-
 	status = "okay";
 };
 

-- 
2.34.1


