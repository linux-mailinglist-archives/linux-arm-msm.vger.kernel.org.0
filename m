Return-Path: <linux-arm-msm+bounces-35266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BBD9A7118
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 19:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73A821C228D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 17:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214911EABC4;
	Mon, 21 Oct 2024 17:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+fx71Ln"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0869B191F8A;
	Mon, 21 Oct 2024 17:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729532002; cv=none; b=o1EksC/btnpHOlNhmWKw8pIgTjFwWP3iGNlIs8IDuYo+yLzQGj2wAWieqBU1vFgxacP5OZefS7a93q04OJJ4id89DeUqhRmnDTjh9+aBrdADrm8poa2kiaHB1DnhXqRdx/YkeKM0+aGifkdMuBdEBYha1rXmpfApjidVaBnLdLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729532002; c=relaxed/simple;
	bh=OfO5TkIeLtro3wIfUq87IH8nuVAYq2iLa58LnRZAI7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iWktF4lk4LS6jjtnmZT2K85/orfd8n59FJa9q7hO5UMv25Rh3QpN0rqb/hPzJ3hmIzD7WElvB0kug+eE5O6bjA94UjbnZ4gsVroBS8sYOmYdJZFa0DueyU+/Fzhjs9mN5cEQ454clDAueP4DJwvT0NDNJiEmet+vgBxbVaCmqSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+fx71Ln; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a850270e2so383919166b.0;
        Mon, 21 Oct 2024 10:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729531998; x=1730136798; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Uchf4DfqOWZdv07WmnBWftx6/6zS08AXtERn4+sfpY=;
        b=F+fx71LndRbu3FzRTq328t3D7kuXxvWswDDWCo4ZG5QcYFImeEYTMknoe/92dVeIU0
         IQb/XLDKHYc6Dk0p2M5kR/Y06Nswst2bnD93XRgKVFe88KGcDUdg1A5wGIJkCIkM66Tg
         +dbcBtb58f1ex5PF0KO1rdncBGNEylrNQIjRm2j9v0mP51Xs3SHpUM/6JSaV3+wFImdi
         j2u7bCRoGgLiS7HFp49vE7ZCDW10CyVrpVhI+qZf7PDUVbHb/9LqMFl6ccEMqBdh3bMa
         p1vedIDytPHws4Mxnz5+nBgUJHmg5FWMmywEunTNsO45R2xy6f2Ix8vVwRpbqKgmTxnz
         jpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729531998; x=1730136798;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Uchf4DfqOWZdv07WmnBWftx6/6zS08AXtERn4+sfpY=;
        b=JzNI9gpQFdOFeH/FzXUqCRtrneYlZuMwrfNwo0PAkRsjIRo9MuX8GbPyVvU+VycGFX
         xNYeYLpmpqgUQSFQ81JUwKlwfL45zUCehc9Z3ShB+K9HwHx40QC2FPbtk8BPn4QxTmZ8
         j+NeRrvQKJij4qML8ZG9JPyRL8odBKJgf0WuNfH4TqJWysOtzbI3AOczwKCixBoPirPi
         2PFc6/QIrmEdxUmNBm+Dx4YTQlhijCbExHlUfJh6Zz9x89XTia7X/toB2GBXd+9fwzEE
         GfwMe85h87CFmFHJqQjwFqjdY81UMCwRjUrv76NLi7USq01gixSa5J+tAb4azQ4KCITN
         9V7w==
X-Forwarded-Encrypted: i=1; AJvYcCUDGavvLk8FR+b9PcguO3Ry9ifgRPKFbnV9oncjK+c097haam30f5TK/peBPhgo38xxnqq/EKSua2A=@vger.kernel.org, AJvYcCUMxeTEQWwxyidf7uKnb1rKvnamEQD/3XKalgmMi4qrdHG2bjSu5/5vzX91gvL6OYksOqe9Qh7D@vger.kernel.org, AJvYcCW2Bao+i4WXVnct+U3MwC7Kfp1yhQy0P3mQ9TVZ6wuJfXPuoNg+r4OE9e+mH3ILCA5ORnkwnqGL0h3aoZGo@vger.kernel.org
X-Gm-Message-State: AOJu0YwPzUuiEU6g7fdHuqhz3EwGzogUHwu0Qfa2Ov974WegqnVZdJ/2
	A+Ma3EMfhf0sJxZ8vZccQeMblindvh6rAyViBnfk6FHbrZCMveuM
X-Google-Smtp-Source: AGHT+IFQ1IzKK6SAnz3zq0W+v5pEYQErKRtAU0i5dQMvUcq6gcCgEUhTxp+dH7LG0yZFb7r9vJpjLg==
X-Received: by 2002:a17:907:940b:b0:a90:df6f:f086 with SMTP id a640c23a62f3a-a9a69a64d51mr1264849566b.11.1729531997886;
        Mon, 21 Oct 2024 10:33:17 -0700 (PDT)
Received: from redchief.lan (5D59A6C7.catv.pool.telekom.hu. [93.89.166.199])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9a913706d3sm232561166b.134.2024.10.21.10.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 10:33:17 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 21 Oct 2024 19:32:48 +0200
Subject: [PATCH] clk: qcom: clk-alpha-pll: fix alpha mode configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-fix-alpha-mode-config-v1-1-f32c254e02bc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAD+QFmcC/x2MWwqAIBAArxL73UI+Aukq0YfoWgulohBBePekz
 4GZeaFSYaqwDC8Uurlyih3EOIA7bNwJ2XcGOUktJikw8IP2zIfFK3lCl2LgHY0ySipjtZk19DY
 X6uL/XbfWPsumAQ5nAAAA
X-Change-ID: 20241021-fix-alpha-mode-config-8383238a4854
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

Commit c45ae598fc16 ("clk: qcom: support for alpha mode configuration")
added support for configuring alpha mode, but it seems that the feature
was never working in practice.

The value of the alpha_{en,mode}_mask members of the configuration gets
added to the value parameter passed to the regmap_update_bits() function,
however the same values are not getting applied to the bitmask. As the
result, the respective bits in the USER_CTL register are never modifed
which leads to improper configuration of several PLLs.

The following table shows the PLL configurations where the 'alpha_en_mask'
member is set and which are passed as a parameter for the
clk_alpha_pll_configure() function. In the table the 'expected rate' column
shows the rate the PLL should run at with the given configuration, and
the 'real rate' column shows the rate the PLL runs at actually. The real
rates has been verified on hardwareOn IPQ* platforms, on other platforms,
those are computed values only.

      file                 pll         expected rate   real rate
  dispcc-qcm2290.c     disp_cc_pll0      768.0 MHz     768.0 MHz
  dispcc-sm6115.c      disp_cc_pll0      768.0 MHz     768.0 MHz
  gcc-ipq5018.c        ubi32_pll        1000.0 MHz !=  984.0 MHz
  gcc-ipq6018.c        nss_crypto_pll   1200.0 MHz    1200.0 MHz
  gcc-ipq6018.c        ubi32_pll        1497.6 MHz != 1488.0 MHz
  gcc-ipq8074.c        nss_crypto_pll   1200.0 MHz != 1190.4 MHz
  gcc-qcm2290.c        gpll11            532.0 MHz !=  518.4 MHz
  gcc-qcm2290.c        gpll8             533.2 MHz !=  518.4 MHz
  gcc-qcs404.c         gpll3             921.6 MHz     921.6 MHz
  gcc-sm6115.c         gpll11            600.0 MHz !=  595.2 MHz
  gcc-sm6115.c         gpll8             800.0 MHz !=  787.2 MHz
  gpucc-sdm660.c       gpu_cc_pll0       800.0 MHz !=  787.2 MHz
  gpucc-sdm660.c       gpu_cc_pll1       740.0 MHz !=  729.6 MHz
  gpucc-sm6115.c       gpu_cc_pll0      1200.0 MHz != 1190.4 MHz
  gpucc-sm6115.c       gpu_cc_pll1       640.0 MHz !=  633.6 MHz
  gpucc-sm6125.c       gpu_pll0         1020.0 MHz != 1017.6 MHz
  gpucc-sm6125.c       gpu_pll1          930.0 MHz !=  921.6 MHz
  mmcc-sdm660.c        mmpll8            930.0 MHz !=  921.6 MHz
  mmcc-sdm660.c        mmpll5            825.0 MHz !=  806.4 MHz

As it can be seen from the above, there are several PLLs which are
configured incorrectly.

Change the code to apply both 'alpha_en_mask' and 'alpha_mode_mask'
values to the bitmask in order to configure the alpha mode correctly.

Applying the 'alpha_en_mask' fixes the initial rate of the PLLs showed
in the table above. Since the 'alpha_mode_mask' is not used by any driver
currently, that part of the change causes no functional changes.

Cc: stable@vger.kernel.org
Fixes: c45ae598fc16 ("clk: qcom: support for alpha mode configuration")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index f9105443d7dbb104e3cb091e59f43df25999f8b3..03cc7aa092480bfdd9eaa986d44f0545944b3b89 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -421,6 +421,8 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 	mask |= config->pre_div_mask;
 	mask |= config->post_div_mask;
 	mask |= config->vco_mask;
+	mask |= config->alpha_en_mask;
+	mask |= config->alpha_mode_mask;
 
 	regmap_update_bits(regmap, PLL_USER_CTL(pll), mask, val);
 

---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241021-fix-alpha-mode-config-8383238a4854

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


