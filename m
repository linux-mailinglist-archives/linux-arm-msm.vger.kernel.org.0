Return-Path: <linux-arm-msm+bounces-64170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E468AFE560
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 12:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C33F188C9C9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 10:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0981328C84C;
	Wed,  9 Jul 2025 10:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F3GGNCFy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A12C28B510
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752055799; cv=none; b=Jv+wIWFnbfv0l7LK3kOlAYIKbPFNmxhWs+NiCfror3XMtCHRDOoQYXQtRrd1CXm++xYlD+BeG4mdmxuGNxj3OuSPYHlzi3vdZrPRdEP7WGt/smaTuXYPeWUiGo2+d3X2LWjI6g8aoOQ04pye8G0LEyonRWyxPdpXeYfoyMn+G4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752055799; c=relaxed/simple;
	bh=BtljJoJu29he5h3E1fMJpoxReanEYHNeB8iJaVXCAtw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uMhIZT//vgylcr0PKugaz5/BOlOlkZggf2WoM3xh8xhyRr2DvoreTZKSlmUQczmgevi/BeoAGkilVlXHmTWx4rRNeG8OWj1vRyGxQS3nv9krp1JgAm1ka1diANSlbGEA0XUYRWG8GUX/pNevxzaLXYPCceclyW/DeT9R1iSy/To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F3GGNCFy; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso2905734f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 03:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752055795; x=1752660595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cqgIfbUcailCPKp6TXnf2r6fZEj8c+V9PAnko/MkSqA=;
        b=F3GGNCFydH8nAyZAUz62L0GYK+E0E113B9lAmFB3dQreIF6CN/kVmGOqbgYI96f+d5
         HGZmQW4r2Z8hpDmPGtytPziPWHDrollHp66c2Bmgy2XYuvfbVxOxgN7or2Ijp4SyxhLR
         cufeOylEGPXWy6cfpxLCnMg6x5AnJIAT4VGvARCr07P9zVAPWlp7iepvK8bSd95mL2rp
         5Lnzj1ftoufwFxPveubaMqmo4ntsFIcljw27PBSz4D4a3hElAgmgmL4BPSCs1AJZH43G
         ugqCrqLhTaO2zoglNxFt/pwamiocs4vijK4f7Bsx2MgkT4nzxyOjAHisMOvRdb9ekKwF
         j+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752055795; x=1752660595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqgIfbUcailCPKp6TXnf2r6fZEj8c+V9PAnko/MkSqA=;
        b=iZHU5sAPTWcElrkVhftbOnhfMgt4jdO9KgOE+sEvdW2RrgjqZeAMUKoCh337SEK0U4
         OySrxu4A6ztMVLcBkMagicSLn80Oj20pvQrU0Bi/Lw78cV/jD0BfaZyaiOmfvD0DyE+V
         ab769Kx7PvHVA5wfcNB/fZX7mPIH1ejOXeDH+OWDDedo+jYkjKpNC+B1cxEHJoL54hzI
         MLw5DbTypRMxSbu33OSiEtc4bgYHaIPPubDNYNSPmGuRhiGBvlhFLyzU6D2g6o/djkfh
         114bspU2VAGzlP4WvhIKPTp8tzOm9iYnM0BfXkRF/QNzPDoL3YeVs2dCvlRL3HB28FuU
         Q9Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXQO9ec62h0ri7UCKQmbqlj1gkAETaleaaYJ/gXCIT3bpfMKId8O14nkOr0d55fQtE1wAZMqx//NI0GYQrM@vger.kernel.org
X-Gm-Message-State: AOJu0YyYsR2dUOuLoh7b74uXS0Tytw0idebZ55gOiZa9ecsJGaqHMovf
	kB54wM/xun+V8saHoYcdou06Fca6jdbz/2B0klt25KI8is0tmCKIB+5+BnKaDERga2c=
X-Gm-Gg: ASbGncvoPVW209mG1YGdNfWkEGgurxxvTYFFUaUC8J9zl5WGTvag0/RkP6n1uUKH96Q
	0EIUvULKktVf1JoeEhMdSkK+xlhLWk1i4NZpoNeiVbX55gobq5NIbPMBdFuhtRIbySqWQFe2fvd
	v2+j2GNFSWcjJNDq4mCzbDvyCvdnCBJN1DpWqOyU8E5F+0GtNeaozorkgoK09G9xut6Md9kOKxT
	NDTT8iv3S4czbtBYmDwyMKmf5LXwUx9osBesVnWZcKkehYq29p+3DP7BkiCnvjkKew654A8u9s9
	GY6PAxIG7+ZNxH89t/nxk+hTMSYPZHnXA3lvdMUS5b+3jUxvVg0g9Y0kOA+qOjTGD84rJU2iYs5
	1sjWzrSE1KTCd
X-Google-Smtp-Source: AGHT+IH+kX8gb16vc2IqysKW8WfIZF3xM6sEokJKtIyslzmvhXUij9HEIcvjHcBwVbgQKslIh5YFWA==
X-Received: by 2002:a05:6000:41e5:b0:3a4:dcfb:3118 with SMTP id ffacd0b85a97d-3b5e44e3ccemr1447480f8f.10.1752055794558;
        Wed, 09 Jul 2025 03:09:54 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:d3be:a88a:dbb9:f905])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5032997sm18342105e9.7.2025.07.09.03.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 03:09:54 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 09 Jul 2025 12:08:57 +0200
Subject: [PATCH v2 5/6] clk: qcom: gcc-x1e80100: Add missing video resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-x1e-videocc-v2-5-ad1acf5674b4@linaro.org>
References: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
In-Reply-To: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add the missing video resets that are needed for the iris video codec.
Copied from gcc-sm8550.c.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/gcc-x1e80100.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 3e44757e25d3245e455918e9474c978c8dacaa5e..301fc9fc32d8e6e1ddf59c1d3350d84f6c06e4b6 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -6674,6 +6674,8 @@ static const struct qcom_reset_map gcc_x1e80100_resets[] = {
 	[GCC_USB_1_PHY_BCR] = { 0x2a020 },
 	[GCC_USB_2_PHY_BCR] = { 0xa3020 },
 	[GCC_VIDEO_BCR] = { 0x32000 },
+	[GCC_VIDEO_AXI0_CLK_ARES] = { .reg = 0x32018, .bit = 2, .udelay = 1000 },
+	[GCC_VIDEO_AXI1_CLK_ARES] = { .reg = 0x32024, .bit = 2, .udelay = 1000 },
 };
 
 static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {

-- 
2.49.0


