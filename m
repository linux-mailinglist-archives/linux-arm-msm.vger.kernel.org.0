Return-Path: <linux-arm-msm+bounces-34782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AD99A2A12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 19:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECD6F1F219CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 17:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22721EF083;
	Thu, 17 Oct 2024 16:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M6EmAd2w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307BE1F9ABE
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729184247; cv=none; b=UtZN7v3w/Hj9VPUhtm3FhnFZGMzThApGcpw0n7EGN2i55LszNOgpJQTUd1PY561C3UJzlVkEzmQWKU/tzuNgYFk8i41UoBwXRYadtGoage3v98aJD1SL5bcRNTWgsNl2W1Prh3VW8E+WXcjuJnDMlcm+m8c07mtm6mALa14YtwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729184247; c=relaxed/simple;
	bh=DWgkCUleQv61cF52XKRC6NW3EAFyFKJ2O9J1+CznBwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tJNMEi6EGzII40/RCgfRamv1AY8NDQKyitUPhzZygxAQJUyhCjwcU5jDYl5mVwGhU8RGJ2T9p/RTLK+j3gdnJW+0yU44o8i37zxivIoAb4TOxCDR6rwAzO0kzcQnhSn76Y7mRBkG1GwbdGBsce2gwQ3SoNP2pSrDQmKeQGOqW2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M6EmAd2w; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e8586b53so1937376e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 09:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729184240; x=1729789040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWbqeFeatJwTSwfIbMsvs+JYctmC6KE3I7fU3fJLjdw=;
        b=M6EmAd2wNvUBe8KYycaPhH9kPXYhOgKXeHD088KGMjKShdAhynudCwE6pyG2Hh9fdT
         SfLVk20lS65tjFyUAxbZP2ByKscevee4TE7uO7HHpilipL3qNXAoZjg5yswoRSVOH6Kd
         z9UQa860Cd2UlhqXGjfHfhISiWHqhOE3U4SjdT+KyJogEGIl66jgWYZBw7jnLAmkLw6j
         Ch5b56AmVIHmonZcIjK2vMhtkjpdZjIIzpXwcY8d0uLTI54T6RjgZ4NYIdM5yfSL9nS7
         +CnqiQcBZGBBhUyaqfKFqecmH6T88l4XbY7zUyS31sbPjrV1dBjUjj8L80fYVv1ObMgx
         fBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729184240; x=1729789040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWbqeFeatJwTSwfIbMsvs+JYctmC6KE3I7fU3fJLjdw=;
        b=aRGu1pIzE1P4gbTgFmNuuMXE4BVcDHFDpyv6+kYiQLUJeJMnW4Q3fGhavuNN6PwFHS
         n6hLJhU2p9hltsYYkPe9c/CMNoPBplRuEZXwJMcHCIAZN3Z6JLIgahkVR3IDvu25R/ku
         00+JsFQt6NPDmf/m3rrgkCu94KVSbc7++lrmwVXPkRkfcSPbHkzxJx4CWWshjdzUHMLs
         4q6+vjP8pcTtX3pp/vCM6RstLXiViIMl0/KCLutFSnTCsM189yvl0QhP0tkIC6kjJzYd
         IniAauy7Aljj79ib7QFWEdiyxB5p1YIgGWyvROdjeGofS/ovUHwDRIGpUVHwNg7fc3+q
         M0mw==
X-Gm-Message-State: AOJu0Yyuw33npY/UPMYbznXwljckwC77nadGaCKKAny64+K/A9FoqXHz
	ModoTWu/65DcBAHvNhhmakzNquDlAR6WyWI0wltHQrqDdVLNTfk7UPfk8mRiIQcWnys2xUu/kjK
	A2IA=
X-Google-Smtp-Source: AGHT+IGxKNgW78V4/jw1NTqOI/gZR0plM/q+kJuyEsjUR9CsyY1Rs53uGm7TIFzBR9iXm9H02rhg1g==
X-Received: by 2002:ac2:4c4b:0:b0:52f:27e:a82e with SMTP id 2adb3069b0e04-53a0c6ed399mr1370635e87.21.1729184240139;
        Thu, 17 Oct 2024 09:57:20 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a00007078sm821563e87.212.2024.10.17.09.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 09:57:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Oct 2024 19:56:58 +0300
Subject: [PATCH 08/14] clk: qcom: rcg2: add clk_rcg2_shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-sar2130p-clocks-v1-8-f75e740f0a8d@linaro.org>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
In-Reply-To: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3985;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=DWgkCUleQv61cF52XKRC6NW3EAFyFKJ2O9J1+CznBwg=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEUHczhpTOf53LYV5SDha75prcKl2X1W/hweSK
 zv6JzKCUsSJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxFB3AAKCRAU23LtvoBl
 uF9UEACMyFWB9P8EUEzVHU6jn4Wybqzh9NVupDBitQmdS5eDK0meIWeJ62FdlZ5D8sS+lUkydag
 q53LgSYngJEXVPoab8UxJRuY9GcIEVQmZlFiy/kISZj1WQxezBg57gFsmgbP8SUsXkUhyaJjP36
 k7UJkNGN9IM0D4svSvfbalBFLn62IqFrXvT3wNLFOiGsQ0ZDakth9a5lRQl2tl+YSWE+0WRPWSB
 e+7/NqRU0/Q5qMCzEQCiml0iTXQA57euike/UXoIZUQ2vAkao8aXgMh8qUkPsmk0/4WNWXZZQmJ
 Qay4mW5LMKyEMG15jeRtB5y75RCrLJEP5xuL0HLKqqBCldWtQH56+PmfL0c5YD6V/g0M/EH1zrF
 OXBPuH7B6UhaylU3+Zh1R6QIMzKMhe6PcLCMddbX7isuS0h5ARGjrrllqicwwmDh48nnPU8WG5o
 xs9/1jCFSbYo/vbILA69q4DYs1C07+GKWy9EIC0BqdSGJKoDxiDlMhFtk4AK+RDKPv6br71MWsy
 QNH0ibn4OO6H/N37iFUqAj3q+qLe7Tyo2cPAyMnDkkdl5bQp2Wpc03GejNQXaxS7r2XUnXezKUd
 c5EbU9WwZCEA0nzu104of6HK11aAuXaDsS6/8PRR3ZmeZ0mB+/Hb7rIhkcTfkt907tYqtPLkn+e
 jE5dYFbZFjpVs5g==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Generally SDCC clocks use clk_rcg2_floor_ops, however on SAR2130P
platform it's recommended to use rcg2_shared_ops for all Root Clock
Generators to park them instead of disabling. Implement a mix of those,
clk_rcg2_shared_floor_ops.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rcg.h  |  1 +
 drivers/clk/qcom/clk-rcg2.c | 48 ++++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index 8e0f3372dc7a8373d405ef38e3d5c747a6d51383..80f1f4fcd52a68d8da15e3e1405703b6ddc23421 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -198,6 +198,7 @@ extern const struct clk_ops clk_byte2_ops;
 extern const struct clk_ops clk_pixel_ops;
 extern const struct clk_ops clk_gfx3d_ops;
 extern const struct clk_ops clk_rcg2_shared_ops;
+extern const struct clk_ops clk_rcg2_shared_floor_ops;
 extern const struct clk_ops clk_rcg2_shared_no_init_park_ops;
 extern const struct clk_ops clk_dp_ops;
 
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index bf26c5448f006724b447bb0d9b11889d316cb6d0..bf6406f5279a4c75c0a42534c15e9884e4965c00 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1186,15 +1186,23 @@ clk_rcg2_shared_force_enable_clear(struct clk_hw *hw, const struct freq_tbl *f)
 	return clk_rcg2_clear_force_enable(hw);
 }
 
-static int clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long parent_rate)
+static int __clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
+				      unsigned long parent_rate,
+				      enum freq_policy policy)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
 	const struct freq_tbl *f;
 
-	f = qcom_find_freq(rcg->freq_tbl, rate);
-	if (!f)
+	switch (policy) {
+	case FLOOR:
+		f = qcom_find_freq_floor(rcg->freq_tbl, rate);
+		break;
+	case CEIL:
+		f = qcom_find_freq(rcg->freq_tbl, rate);
+		break;
+	default:
 		return -EINVAL;
+	}
 
 	/*
 	 * In case clock is disabled, update the M, N and D registers, cache
@@ -1207,10 +1215,28 @@ static int clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
 	return clk_rcg2_shared_force_enable_clear(hw, f);
 }
 
+static int clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long parent_rate)
+{
+	return __clk_rcg2_shared_set_rate(hw, rate, parent_rate, CEIL);
+}
+
 static int clk_rcg2_shared_set_rate_and_parent(struct clk_hw *hw,
 		unsigned long rate, unsigned long parent_rate, u8 index)
 {
-	return clk_rcg2_shared_set_rate(hw, rate, parent_rate);
+	return __clk_rcg2_shared_set_rate(hw, rate, parent_rate, CEIL);
+}
+
+static int clk_rcg2_shared_set_floor_rate(struct clk_hw *hw, unsigned long rate,
+					  unsigned long parent_rate)
+{
+	return __clk_rcg2_shared_set_rate(hw, rate, parent_rate, FLOOR);
+}
+
+static int clk_rcg2_shared_set_floor_rate_and_parent(struct clk_hw *hw,
+		unsigned long rate, unsigned long parent_rate, u8 index)
+{
+	return __clk_rcg2_shared_set_rate(hw, rate, parent_rate, FLOOR);
 }
 
 static int clk_rcg2_shared_enable(struct clk_hw *hw)
@@ -1348,6 +1374,18 @@ const struct clk_ops clk_rcg2_shared_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
 
+const struct clk_ops clk_rcg2_shared_floor_ops = {
+	.enable = clk_rcg2_shared_enable,
+	.disable = clk_rcg2_shared_disable,
+	.get_parent = clk_rcg2_shared_get_parent,
+	.set_parent = clk_rcg2_shared_set_parent,
+	.recalc_rate = clk_rcg2_shared_recalc_rate,
+	.determine_rate = clk_rcg2_determine_floor_rate,
+	.set_rate = clk_rcg2_shared_set_floor_rate,
+	.set_rate_and_parent = clk_rcg2_shared_set_floor_rate_and_parent,
+};
+EXPORT_SYMBOL_GPL(clk_rcg2_shared_floor_ops);
+
 static int clk_rcg2_shared_no_init_park(struct clk_hw *hw)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);

-- 
2.39.5


