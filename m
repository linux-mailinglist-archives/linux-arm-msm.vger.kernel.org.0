Return-Path: <linux-arm-msm+bounces-67183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71823B1646F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 18:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1928D17D9EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 16:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4372DCF63;
	Wed, 30 Jul 2025 16:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kM/rN6Yg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E7D2DE6F7
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 16:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753891897; cv=none; b=cB1MI5qFMYRbDYouzBGj5cqOpC4XwdowgvmNdAUocjGXpEnDAVaHpnaZjANYn1+t/jrD3n4BbsAXYZ8K+vDe6eFmzUxu/NcUWlXEwk3UVDgHaUQq1PbqhJ0//f9eaUoIxC30NluhIHlLWoM1CV6NYNSm12wKS2ONPf7/QBqhh2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753891897; c=relaxed/simple;
	bh=Fd6r5ej70Gx78OKCjT5dW6+hePHwHbsPkXWk9c0URgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UAewaguNclghORx/+qKjVX/Oao1a9vPPHefvkhx4y5fwuzvHUXQKSvI29cDonI9A8Z75xrHiL6rEznKi2vburVdjLhl+MMPQCQz3dUmO86N2m7HphBG052diBH4QRWDrux0/aUXzjO7WqmWjlUOHryBE4ubmGzdta3nO0vqofNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kM/rN6Yg; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b78bca0890so1993139f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 09:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753891893; x=1754496693; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UqOwZkurxN6DP6mkxJOVh++qBYZQgQgS3fnY4YseNNE=;
        b=kM/rN6Ygq+MbGLfNlLSfID9cDiMBbXUl7HwR821U5p2PPPqDzdx5yM59aZ2Wbk7GMx
         JB+BlZXR2w9fJJuT4y06UbbaPpRkJY36DapfqAb5Eujh+8sTgxgDN/VCLu5CHaohyaDS
         aruFlH7L94VUUD1YNg0RD6A501uPDqWaSXavh+3gQ+XVpOkSm7J3Y6zk9D1XFx4ZPTOR
         f3X0iGU/WZZJW3OcbMl+dIAkLtaB/8lFGP24X/yBMpfKlk32Nt725UBYrptuQT6OWeoJ
         dSgqKnTui95Ro4rL0B8myL264+jxYPKGLfkz+nkbLpM0g6vbZZ8NJAs/sHThGzbLeeGW
         fy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753891893; x=1754496693;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqOwZkurxN6DP6mkxJOVh++qBYZQgQgS3fnY4YseNNE=;
        b=SxRbJYZOp+XZZ4ze1hZOUVrIBImLb3qv5oB12BtUSr8ZQmPWRyM9tZUsxKlb1PdX20
         tTgHnJ2slwDjlo9w6FccQ4hb7MEJVfmud4qPa61tdXl3Zn9NnI5MxzlM30KASXwv/rmk
         JEQ4ZJBJFGRyvEBkZEBadkhvU396OEGTCscR3qW3VMDB/VCcW/cPIJpm8+OvjrriUs1L
         KU/Gu+odBxVH3ADmv3Bo6Z4d+QCTyuPtvzSv2aVyV2u34GuD0J2cvWb5mFMyK7cf6UHi
         OK7hIEy4+pK3/cN/StPNmwI8UmuXrByaxj/tJqeF7KbDvzd/4t0d9617B98Edj3qz645
         xGlw==
X-Forwarded-Encrypted: i=1; AJvYcCXEYe+xL4Pz1ICEOgMiQlZVsRimxEdDiTk+JV1EehmilimYD9N0Eu5w/aPCjwV5OxgRCHiafBPjDjNO5xkB@vger.kernel.org
X-Gm-Message-State: AOJu0YwipTBKFLep0jBRSzF0PytGM2n/A+KQxTbluj5LHBM9wXaGNCyL
	LbMi1ENeSnaUIEYfLj3JcIq8GnjVQzlHk2Ldowc+HM40PJwfZgKZ8OO5n7CWZZIZw1FF6DWvX7J
	o2EntLKA=
X-Gm-Gg: ASbGnct+NCfiXBLEJ3If5CcWFxgmSRfcQbt4hQ373dAFx0dkg4nRapPxCOxyIRnSjz7
	L8wZAzQTpc5d2Oc98EeDSPmHKfFLtmZq+eBcqZK+gvVom77d+sO13yKSrdiufSrmN5oL+tmyVVX
	9fzz4qhoWwYl5LaouXedDOlyIGZ49gJqZPtJ/uuzB2cSqLh0qv6fStqD0DWUdRQa4K8tbLFUyhb
	8XZt4PRMGWiwdwZMXyE763k+G7BN+8TFQTHP2PMwdi1R7kjnnHxBSlAZdpbgfR+yh0VwWyQVBUp
	4H0Q6Ri4ncfLSxKQyFFwBx5eGUW72iyNfgnCDbLYUdR83wDGYPOblIUhCx9Jr1xtYlPxGjUnods
	eOI8G/kzTEenLbY4DYKJm
X-Google-Smtp-Source: AGHT+IE35Ywlzmt6bKCd2ef14MK+xws1qwAv8vwYO/BNrAHqXdxEW1CdRvYO8omT7ooIKsh8esKQuA==
X-Received: by 2002:a05:6000:1a8d:b0:3b7:8d0b:3282 with SMTP id ffacd0b85a97d-3b794fe90damr2754479f8f.31.1753891893243;
        Wed, 30 Jul 2025 09:11:33 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78acd884dsm9164564f8f.33.2025.07.30.09.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 09:11:32 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 30 Jul 2025 19:11:12 +0300
Subject: [PATCH] clk: qcom: tcsrcc-x1e80100: Set the bi_tcxo as parent to
 eDP refclk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-clk-qcom-tcsrcc-x1e80100-parent-edp-refclk-v1-1-7a36ef06e045@linaro.org>
X-B4-Tracking: v=1; b=H4sIAB9EimgC/x2N0QqDMAxFf0XyvECqdMp+ZeyhxqhhW+1SEUH89
 3V7PJfDPQdkMZUMt+oAk02zLrGAu1TAc4iToA6FoabaU9sQ8uuJH17euHI2ZtyddOSIMAWTuKI
 MCU3Gn9b1rg3+OpKnAOUwlV33f+z+OM8v1KcEPXwAAAA=
X-Change-ID: 20250730-clk-qcom-tcsrcc-x1e80100-parent-edp-refclk-8b17a56f050a
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Fd6r5ej70Gx78OKCjT5dW6+hePHwHbsPkXWk9c0URgA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBoikQn1mpNTbomnI6wjUQllPAQi1cNsItik0+LO
 NhyFErPoFqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaIpEJwAKCRAbX0TJAJUV
 VqdED/9TUcuk43y0Rv60rmuHzWZ8ypABjV0pMT0RaclplWU0Wdlf1KPt4twokPE4hWzS4QO1oB0
 Q3XhvFPTgYWujJfcQnJxWKwCnJbFfmpJCDga5f5ODbrv1BDvxEJCGB6vPiYO30xLlRx113JqZhW
 GhKSbCuo7ofu6otLGjpkPYGGe68rbK/Pb1ePYqUOqp4/mgJSo8Rgqg6+h67oUV5207B8fn9K+c0
 ln1th174V9uipBKGSRYpSkrx5cfNIaIujPc/LQT4s8ynjy66RpbIe6Xkgilnons33PbCIawGeGE
 BVZY5YYLinXYl1D5H/VHm0xGVHz1eE27Ch4Vx6fy+fx719fXDCRHlFI5U9D/xyp+E0OmykfPZ2d
 q57P28jFeJntrmDz28Lp1mB3TWMN8QpbUMIUOUz+3ip2mKYkytplWY7sG2UNS8MZY2jhptZfF02
 F2ABNDdc9kY2+VHanWGWwtYh0puF/NDYyfeUAAJhw0fRbbet+ab7wT1GdYnEbsufh5hjXnVirIk
 CFur6uOQ439azeVH1zxRTkFAeXguQg/3rpxJU8KAhHpatXZHz+INKc/Cg1QxOMXACW+kbZcwHOS
 JbN3W49T3M8ziNDM5Z+1uStqzEc1dHNFgKmZIkjvyfznBuKEqg2dkTr4eyFHnghbZYR+hLmD7L0
 XjCZTSzqC+I01zQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

All the other ref clocks provided by this driver have the bi_tcxo
as parent. The eDP refclk is the only one without a parent, leading
to reporting its rate as 0. So set its parent to bi_tcxo, just like
the rest of the refclks.

Cc: stable@vger.kernel.org # v6.9
Fixes: 06aff116199c ("clk: qcom: Add TCSR clock driver for x1e80100")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/tcsrcc-x1e80100.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/tcsrcc-x1e80100.c b/drivers/clk/qcom/tcsrcc-x1e80100.c
index ff61769a08077e916157a03c789ab3d5b0c090f6..a367e1f55622d990929984facb62185b551d6c50 100644
--- a/drivers/clk/qcom/tcsrcc-x1e80100.c
+++ b/drivers/clk/qcom/tcsrcc-x1e80100.c
@@ -29,6 +29,10 @@ static struct clk_branch tcsr_edp_clkref_en = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "tcsr_edp_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_BI_TCXO_PAD,
+			},
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},

---
base-commit: 79fb37f39b77bbf9a56304e9af843cd93a7a1916
change-id: 20250730-clk-qcom-tcsrcc-x1e80100-parent-edp-refclk-8b17a56f050a

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


