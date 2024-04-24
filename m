Return-Path: <linux-arm-msm+bounces-18375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 309E88AFDED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 03:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCB0E285D24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 01:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79AEF4FB;
	Wed, 24 Apr 2024 01:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bc8BRe6j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5912BE4D
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 01:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713922775; cv=none; b=PkxLtatd2IEpxbNgtMr+9bPZ+ZWnDe2bZSA1GR1fiIUIx0k+7zLsLTruKAahZGHXyerhmuSM+eKuQPEelDFJYTZZIaOSKUSyVf3GIaY5g4lDzDfbaBk/TC5b6bKAfPLnfjP1ohHdLBxek8CdPv8T4PpvmdUf9BGT1W8fRpvwhz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713922775; c=relaxed/simple;
	bh=mmpz/wbHDRDW8GXi4f/Kh4tJEWD2H5kJEpj0vD29QCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=azNyYz6F9VIK1y5tlutOTGOZe+hDg4tOrgmJudbfHMOZcg0JhPh7MenqpUYL8MeA8GRUq89Eap5Dpd7fuDe2uW6MCLHC29MiYnPDpi7iKSx3q89UC0+loAf9J3Q3qIA67vUlbY9mKDnMLIjv/Y/7qn3+nvA3dR55V4rd/EMeKUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bc8BRe6j; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-516d6c1e238so7980843e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 18:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713922772; x=1714527572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O0gU/NWfwRkEOZNKhr+BK9ugofjdDYkGwMawolvk4RI=;
        b=bc8BRe6jbsEGGn2p4nNfmpW8SzfgREPf32qM0jBrjNkZGfA/p0L3cvPZ6ya7bqPXOd
         e1fftUbLdyYWIztjU6uBkupiP6NWpzTyoZEdqdcT0RFx/tj4eijWJqeqK1/Zkh9Y/wGc
         USj+2MEg/TUVYeDW46ySGB2ymTAC23HmLhdVb2XMy0O5E0gUUha8ERFbINZ1iOAQ2+sG
         7sOESKAH3eekmui5uDfEA3/Qbt+CGAcW72pRcAh1xAVILqJ3Iqco6UP/rLAwY3W1hp32
         UTRtB6dwqXeXCYCQNrAPf+Amqm7yPILSGaPClGvAj+qOH/h+QTYgEAvNyhfNm00wffxU
         5x3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713922772; x=1714527572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O0gU/NWfwRkEOZNKhr+BK9ugofjdDYkGwMawolvk4RI=;
        b=kxHREu8Dl1uZNI+zULz77ryrrwzZZpizMfAnfLBKymfLEoTagNf11mVq1jW7/iAXfq
         MpJ9n0jc4M4u4GDJsTaXNsrzGqf9eNJtPYuV5KE2PCWVhknMyhmAfF2tHVtHqvbXgr/H
         JkKsC+YYlQIBrTE8npnPuqHonsJivofpq0+P8PouGS7kCq0eOqNQdurpQydUCQTeoKck
         /slXGplMrzqnt8uKcdImI0+3y3XP7C8zJviK6cG4MwVg5bMOXLdI3bmcys4Qu/G4ffdO
         O9suLSFTyZW9wWB7VBgI38t9P4Zs4JIcS+TPMCjsZa+B/QM9GAif9+eIvj5jtlfCd7I3
         yH+w==
X-Gm-Message-State: AOJu0YxUFmeuFH4ZhAT9lMpsMV5JRm/WgZliIBrsKtntOLANkeA8VGkb
	DHbdKctCJJpap6FKgWZ8siUhXP88Q1O2fpbe8Hbu9ZVGQUwJ90X0P+fy4Y/qfjM=
X-Google-Smtp-Source: AGHT+IHssxT9a4TQxoRvOW9saq3mUk+fPKrGmejqpchwQcWickC/qj7UsGh6hmnVqlJw5urFCcgvLA==
X-Received: by 2002:ac2:593c:0:b0:51b:bdb1:e658 with SMTP id v28-20020ac2593c000000b0051bbdb1e658mr622916lfi.55.1713922772109;
        Tue, 23 Apr 2024 18:39:32 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g12-20020a19ac0c000000b0051bb40c7ee7sm308220lfc.185.2024.04.23.18.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 18:39:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Apr 2024 04:39:30 +0300
Subject: [PATCH v2 2/4] clk: qcom: dispcc-sm6350: fix DisplayPort clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-dispcc-dp-clocks-v2-2-b44038f3fa96@linaro.org>
References: <20240424-dispcc-dp-clocks-v2-0-b44038f3fa96@linaro.org>
In-Reply-To: <20240424-dispcc-dp-clocks-v2-0-b44038f3fa96@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1973;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mmpz/wbHDRDW8GXi4f/Kh4tJEWD2H5kJEpj0vD29QCA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmKGLRxO41CkbrfP/anarHJu9uaguFaqMi0IZTA
 PU2km/d/seJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZihi0QAKCRCLPIo+Aiko
 1aVdB/96X0iiZjshy2kzTustfxyKgqGNazxxs9Q/tAO5uZOnN/lXtDx+GoVk4LCnLmzrB42z9DE
 prWUP6PlrjinsLM7xgBd0iVjYPD7p+olHm+n3pXcfY3TYryrDl0s2cLTqKFdRGYT3ACXp1kNUU/
 8QvcmdJGiIGm15pYUnxdw+thJWztkbNz66QnL5EWmFQUEfA9av5PUE0W+hN8j8RUfqP/rSD5bUE
 iV4fWhYHbRKMaFiLf83FX5IVSGoHcA9b6sdxndsK3tr7dekdUGcoAyj7Zmr7ap/lAtUciZEuAhU
 NK/sHPL1Srqgm6jnyCYHEMH6chokj+O0Ue8+17KP53xP6wsj
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On SM6350 DisplayPort link clocks use frequency tables inherited from
the vendor kernel, it is not applicable in the upstream kernel. Drop
frequency tables and use clk_byte2_ops for those clocks.

This fixes frequency selection in the OPP core (which otherwise attempts
to use invalid 810 KHz as DP link rate), also fixing the following
message:
msm-dp-display ae90000.displayport-controller: _opp_config_clk_single: failed to set clock rate: -22

Fixes: 837519775f1d ("clk: qcom: Add display clock controller driver for SM6350")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Luca Weiss <luca.weiss@fairphone.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm6350.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm6350.c b/drivers/clk/qcom/dispcc-sm6350.c
index 839435362010..e4b7464c4d0e 100644
--- a/drivers/clk/qcom/dispcc-sm6350.c
+++ b/drivers/clk/qcom/dispcc-sm6350.c
@@ -221,26 +221,17 @@ static struct clk_rcg2 disp_cc_mdss_dp_crypto_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_disp_cc_mdss_dp_link_clk_src[] = {
-	F(162000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
-	F(270000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
-	F(540000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
-	F(810000, P_DP_PHY_PLL_LINK_CLK, 1, 0, 0),
-	{ }
-};
-
 static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
 	.cmd_rcgr = 0x10f8,
 	.mnd_width = 0,
 	.hid_width = 5,
 	.parent_map = disp_cc_parent_map_0,
-	.freq_tbl = ftbl_disp_cc_mdss_dp_link_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_link_clk_src",
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_byte2_ops,
 	},
 };
 

-- 
2.39.2


