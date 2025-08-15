Return-Path: <linux-arm-msm+bounces-69342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49098B27CB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 11:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86FD01D0284E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 09:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6062B2E611D;
	Fri, 15 Aug 2025 09:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="F8GGFahW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B342E266D
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 09:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248984; cv=none; b=cnTfUu/3hjp8zwoCchmbw0Lav/EtY2qV6BdMJudgpI72BQ3gcDAhZ/XouTQK4uFcCnhk3vMeAvGAnI2C48nftVJAp/0kj6EewEwhs5USbATAUdnxyyDLq6tg8BQ6VICy1xuCYMhZjWJ6a7f1XgSw0tlK/+O4AMM4EGtV39s+YOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248984; c=relaxed/simple;
	bh=+QvEm53FGBL8kbed9CrGkfR7JQ0mUkCssMIU9hMIktU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b67Nk0M1exYjDWYNQ21kpka2mjwq3RpiRcSLGW2VZz28GYAlpGLpgUZYAtllu72KhU5mR7i+RK5YvqsCgbLUxW5J4+oC3A1ukGADd5Iw9JC4l8FXIASWg8MGAK7m+FHxzyC6rC3umb1xtLWAt214yWwhRy2MMPdTeCnZOvj3qWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=F8GGFahW; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9170db547so1205706f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 02:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248975; x=1755853775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkIrT982nu0l7atioMtbVH3OTcGWcWH7NZxVXh73dLg=;
        b=F8GGFahWqgeYLoE3MMaBcgPi58mxSIweZA/ahN/bvTxjyzCAzA1igjZvAXct/fdSdm
         bfplKio4HXdQuBMpGmsgpA/uEovsjyApJIhIJi1ZJZGlaQxNHxzOVHlbZ95AVOYY7mNa
         yEEcVMsK5xZCdJWjRySBYXMiZoKvXmIr+Z353VPcUl7lu+XvDBmQjFibzvhBKgl+mOwM
         cuNokIVpnqLBCO6pEbd2mAdX1UmF+RzFWsIvNqf1SeVen9L1tCs/dLaUe+SD40gWsOTo
         dr92S1/bIQpSca5/Z8WV4weryYlTbAPmzRohlGEgVKL78p2O0X7MyqG0jjzw0PNYO3N6
         bARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248975; x=1755853775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkIrT982nu0l7atioMtbVH3OTcGWcWH7NZxVXh73dLg=;
        b=b8m7pvgZ6qBi7XbV0ku1xBBddHayUBUJ6hAK2VmKKsOkDFsVMwPXd6UZVrfz7P5C4D
         wZ4dhGQvFvMvmzhPZ/+KWaDcCRA+cnD9eXtwpBIZufEGIB3Do3qOEy29lhOO+bmHVrFq
         tFgyZIIrZex7H9ElIPn2VtFTM4NDWz46q7AfK8haBypfBDO7cZ3fKkd411aJnY1yMdP1
         2PloFUTkuyO/jbhViyJLhOiFo9g7TxWAUhQilYVBRi0bkofIzLGBB60QgyIf3+85uPdr
         vty5vpse0dsaLixerSXgB1jk3MzMZyzOe6hoQsJ+4sHhSP+6iLsuR9XXfg0sQaaBqr6d
         +oLg==
X-Forwarded-Encrypted: i=1; AJvYcCVvKB0mGiHvMQNCPYvQFUqsdrKjlbcu83gBywekCP3OlevXz/ilqeZuq53ty+T/R0YRGUK8GAgGHEosbxtg@vger.kernel.org
X-Gm-Message-State: AOJu0YyLbP77opVY2TOZGWdDBRW1uFBi/EUbWlBP2P/1TTTsWBQ2+ZN4
	n4adSydQlqjWQ2OZ8tK8WifmNsmLEhdCxo9X/34eMr0tzhnvZbZLRl2W7+Wi7GVu604=
X-Gm-Gg: ASbGncud14G+eEB0q6zZHsR2Z9AkZ0MjSMKGtYoHA8nvrbo5wmk8sR+9nETR0BWCQ4W
	tVFPXCoZeChDavYaCacTddgAFC37Rnq3CE177dWoTdMvdpr/JZ5lPzh7DSJCNjh6/kCvLJuo7P/
	ptrPlL7fpixpS4MT8DbCq/rl99ZqTuy+oSf4OA5+BHKGEqx5ZFm4UQQ1Mus/x/29kE3xEWZgiNF
	QWcQ63VXhe6MqbaOzYnkNxHKNbqG7r2I9yGCDXH1zLNIZhokzb57sINjDkHutpBoV8H7aueCKbC
	R6LHypsA6J6VDbxDmuiqcUKF9906Ia98ljYyrq4T9yWHzivWBopXXHNvaBNix8c1ZLbCXIDdyG6
	SfovMwca3reUn0DRPXQ==
X-Google-Smtp-Source: AGHT+IGsDrB/9NqsFs+GTJUXDyUWG89PIW79ggF9quCSnVgyfof3rlZDBIwDgG3UDAmjbKhep2/pmA==
X-Received: by 2002:a5d:5d0d:0:b0:3b9:13a4:722 with SMTP id ffacd0b85a97d-3bb4a1fa03cmr1100448f8f.6.1755248974639;
        Fri, 15 Aug 2025 02:09:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:13 +0200
Subject: [PATCH v5 11/15] pinctrl: qcom: use generic pin function helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-11-955de9fd91db@linaro.org>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
In-Reply-To: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3269;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=chxUZAtCU37mhXCr4qzhIIkekcZb+5ZpnLwzXbUTM0A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk5lnBQ3Etsml5iw/SH8qzvKnyGoC4Hly5o3
 tnIDLJk12OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75OQAKCRARpy6gFHHX
 csfPEADBEB0r5l4OpTTIJK9i5AuM4M/cyu/QvJFZPvHsnoQ9OThLsPCT7jshbC2wt9Pv2puSVX5
 T1Af8wLRGMDrEZDP79F4hdOml7iB4kmRVSgBGYOIXs9akwp0viAFXXfUTf0qk512LjP/Zeha8Qu
 2vBQJXCtlrnBVyrLAxCt7iywj/o0HrURUraqC1V/kL1ejTK5U51gBYfoAoeWQ5TUVJopb0tjbOA
 mkIQDFpPVtuvRc6JP3wWSfTDUEvSR/B8uIGUkyIDsqVTRzObzIFflNGPvWoIQj41zXagR0xgWTC
 tamCDJq4dBqsNR7YUMWTCgpLB9UMbZimR9r+Z5QhPEb1uEToQmLmIKQSH55KMosoRsheikmbyMj
 n/YfwJPK16Q1aEpo0CPIsJHHJDhsrEB4xWpq2w71ggoiJnPXLGtapH4altn+YIiCtNE2DsogjY4
 z1J5MTqicg8N2Wk959AZ2U0iqc7pHTgnC+caKBq76Wqv8S1/m+npVHP6elyJa3brBbDRDwVuFdr
 tJZsQOOHOmp0WRxh5N/07ZwrriHVtfhX1KD02OHuaiQrGtEyrp1/6LksZu/5fvUVpj92ttmQ1JL
 A+VFk+sgzNoH7ZCc3rGLtCq4/o+8RzkaRpoUSMtxA10w30Z31P8SZPwIDmMqECTzGYpEsEPiMNh
 4fdjFWUp2iXksfQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With the pinmux core no longer duplicating memory used to store the
struct pinfunction objects in .rodata, we can now use the existing
infrastructure for storing and looking up pin functions in qualcomm
drivers. Remove hand-crafted callbacks.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 43 ++++++++++++--------------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 83eb075b6bfa1728137e47741740fda78046514b..96e40c2342bdedb8857629e503897f171a80e579 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -31,6 +31,7 @@
 #include "../core.h"
 #include "../pinconf.h"
 #include "../pinctrl-utils.h"
+#include "../pinmux.h"
 
 #include "pinctrl-msm.h"
 
@@ -150,33 +151,6 @@ static int msm_pinmux_request(struct pinctrl_dev *pctldev, unsigned offset)
 	return gpiochip_line_is_valid(chip, offset) ? 0 : -EINVAL;
 }
 
-static int msm_get_functions_count(struct pinctrl_dev *pctldev)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	return pctrl->soc->nfunctions;
-}
-
-static const char *msm_get_function_name(struct pinctrl_dev *pctldev,
-					 unsigned function)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	return pctrl->soc->functions[function].name;
-}
-
-static int msm_get_function_groups(struct pinctrl_dev *pctldev,
-				   unsigned function,
-				   const char * const **groups,
-				   unsigned * const num_groups)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	*groups = pctrl->soc->functions[function].groups;
-	*num_groups = pctrl->soc->functions[function].ngroups;
-	return 0;
-}
-
 static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 			      unsigned function,
 			      unsigned group)
@@ -288,9 +262,9 @@ static int msm_pinmux_request_gpio(struct pinctrl_dev *pctldev,
 
 static const struct pinmux_ops msm_pinmux_ops = {
 	.request		= msm_pinmux_request,
-	.get_functions_count	= msm_get_functions_count,
-	.get_function_name	= msm_get_function_name,
-	.get_function_groups	= msm_get_function_groups,
+	.get_functions_count	= pinmux_generic_get_function_count,
+	.get_function_name	= pinmux_generic_get_function_name,
+	.get_function_groups	= pinmux_generic_get_function_groups,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
 };
@@ -1552,6 +1526,7 @@ EXPORT_SYMBOL(msm_pinctrl_dev_pm_ops);
 int msm_pinctrl_probe(struct platform_device *pdev,
 		      const struct msm_pinctrl_soc_data *soc_data)
 {
+	const struct pinfunction *func;
 	struct msm_pinctrl *pctrl;
 	struct resource *res;
 	int ret;
@@ -1606,6 +1581,14 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 		return PTR_ERR(pctrl->pctrl);
 	}
 
+	for (i = 0; i < soc_data->nfunctions; i++) {
+		func = &soc_data->functions[i];
+
+		ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
+		if (ret < 0)
+			return ret;
+	}
+
 	ret = msm_gpio_init(pctrl);
 	if (ret)
 		return ret;

-- 
2.48.1


