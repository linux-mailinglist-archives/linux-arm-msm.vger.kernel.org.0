Return-Path: <linux-arm-msm+bounces-71578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D968CB3FFA8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DA085E06FD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14DDD324B0C;
	Tue,  2 Sep 2025 11:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="INgqUkgY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B933218A7
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 11:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814394; cv=none; b=HZD57e5NdB2RDHHWZ70GhZfMgdh9R+zbGzjByFHLje9dB0XCKaNtkPj8dCpaJpiXorVwM5kEOiAc11/1jTLPtMGlMN5lvC7PYu4hKN9d0lv+5ZxBbR597ftCC08Sdn8w5fE1KdTXPT0I54P8FZgL1Ah4YuEmhwonQ/m9KWk2Hh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814394; c=relaxed/simple;
	bh=pmPGULb1s5aSI6ClYNDWVTQCSeoNAD27M4PgucF3E4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G4ypC8rBgO3BasNIIyJu39rfMORGJWKqKQWM5UK7gCkJVS2UBcwnlJ9eEtsgPJd2T30fkr+zaydJk5cCxfrFmd1YSGT961Cw8ILapQQoFrmyTMZU4172SBO8fbjADjW0RrFhGhaRL5T2vGIUdjO7idYStbgpI0qPC3CGYJzli5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=INgqUkgY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b8e28b3c5so11371325e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 04:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814386; x=1757419186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1JFPtEwOFWxLJ4pevnsYlgpYZW/QvB5ELLnfLsEVFI=;
        b=INgqUkgYx6BaU4rM8Ajotj3byE7tPUqBhDjs6SD5bCcu/ifV2R+tDUzZot6iIrFZrj
         ZiMDaKmtdgcGkjB2UAOkLbkf9/l7A+XVEe19G6JtCwjWodYGnoFs3DW2p+OsTfNWI1kc
         eFQ2CnTMRlL2SlYz72RXnLmjKCxXdhkjkcPg9aOzU1SHL3OTrS+oZ+6uveI8BL48y9U9
         aO801ACYArNz/8ztCxOLsodof2CUi0+Gu8V8hCZT2G03dHwCVqaaqrZcTYx0bHLclll2
         +3nSbVKWXWF8uQocF9I4Zcxl+gLmb2Bw4SxXG05e9uBuVT5fPTPg3jZr5cud/OGNgkgH
         gofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814386; x=1757419186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1JFPtEwOFWxLJ4pevnsYlgpYZW/QvB5ELLnfLsEVFI=;
        b=UkPmmZ/fmiOmOUWsruTk8rHNr1s88YBFmWwRwoXd4T4vODka9Dip/xZJA5rQ704qZE
         nVqzq5zGsa0NFHLK059ZDWx6aTesV2aB+pjQi+04H8Rd3RGIuHqXF7Z66jdO0FIeGpOL
         sEuwTu3bnRRcMJ8GkKi6e0M3gYeq1TiWCd1uNC9Z1PJE5Q2iLWGEJdJQCJs8P11GPmDf
         759kYSGBXfLenFTMmPcLO1YVvvWvrIQQGH2v2EcWxDAmpcvu+ORKeO6SwxyAtRIOFA+j
         3PhzWQ6LdeyyynrCneCi+jNTwTQDWe47AMZv6lgY1HMaDJaweJsGSGrOAWWerpos6KHJ
         sLrg==
X-Forwarded-Encrypted: i=1; AJvYcCU5VndTRlPgF9sdfBednEZzrYS+XemNkuRSHoUWVW1LfJN9ZKP3Mbgm1rN/Nsn56DziU/gMl7aOe4HEqN87@vger.kernel.org
X-Gm-Message-State: AOJu0YxPGWETKW2QqhUi+AIMJP3+SJh+4vaR2MX5/SZP83zuY85K50k0
	zichEW+YlQoUHUnKTX2R+mx10rKDsYyt5m/rMbm+njle+I+YwGYjiMtOQrC0TFk2RRM=
X-Gm-Gg: ASbGnctrd+iasmFzuZPa+DaYzf2MaXeSiYdYL/nqRbaSgtTowED3ABjMk9oMZ4UNq1k
	Fei08KjKrXDLczL/yQeydS6ZpPtGAlhOYwANNPRBChk+bR6xtyBBH6G6cnn71RhJtoBrqCzByj+
	6O3zg/MmQBRLfV9c9v8Gfy2GDl5uvKKn6lG88jkW5WdqewNkRWFjJ3rlQsezZURCQu+ztq3rHdq
	vJnWz0mDHEhAusdWXsamJUAt3iC0WYVHAmYKKh8WREN4yWaps5eqmgjd3pb99xkrrAOqIc/WzRW
	92mwFoQSCZ8FMkXjIST5OwhALHXmWZolV89hTevPwhe1nOIEYaE1sYqwt9GwE4Zas0h/xdWs1HA
	3MifebG0dEfQDWDP8
X-Google-Smtp-Source: AGHT+IERkhZoQX1HV3fDYiEzCgaqV6JXpD5DtzyBRIwQQg9LLBsXxUh/GkJb42UUw5J8EFKuniHI6w==
X-Received: by 2002:a05:600c:4f83:b0:45b:7deb:3f0f with SMTP id 5b1f17b1804b1-45b84c2256bmr102158145e9.2.1756814386175;
        Tue, 02 Sep 2025 04:59:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:25 +0200
Subject: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=bNcWH7RYmKxieWZj+11TmEo7Y2F52BicXtYvQjacVVo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwVYBNAIqxX+GTdprLN1KmCRP+T0cr4zPnb7
 WAB05uVr4mJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcFQAKCRARpy6gFHHX
 cm3gD/4gfdNCgi/L1crd3spjH2BfsVhCz8jK0iuHKflwRrBglJW+yuaaNcsIES0+sEg4mbRdkvB
 1Ww04kOvSuLFZauF0IjgNjcsXM9Y4+a0omjT6JjzrxF4wH11ZUipW6gaRbg5cWC5eo3rgddQEsn
 kwbd/DgAjJie0IMEsgOrpRxSoSPgtiB28j56D9mQlqkaav0Un0XGqHAf52wzHJKASG5FIcLEqk3
 qIM2zlotBfSbMMrimUgMUuracaiWXAgUZEUnTEvPcEqzGxwmGN7aUT3In4gU+ZIAMIA66uGPNE+
 irYNdb4rfWdNdq7+XjiId4yoaKduyzu5Qc/jnjzOGWFHMO2C/qillgL5/et3jIT1GjeUzbUIINn
 CxvwKST8T1S2cPmHe4pwcwmXVDVTneQtdl42O5qh3vP+1L2/R2k4qf2Nl2kX0gqEEV3lZZo9eki
 Ft8oIUThEPJqYpsD0+9gXrBi9I1lYZsOnzBK7tbaaPfJb/rpibcVpT+BJ76HUywsb2N5YPPscbC
 s7dzSCMl03nWf/7ur92d3WElyVXj0DwD7mA0bhE7Qm+yF5en8ldGU3WMcg9FbVS9+hCDk4xtc+s
 aMN2oTM1Lo+DyGbfSI+GpIAarry7nR5402siiOB0KaRWE+zrsWXHk9HH0n2Vu1wv5iSFoFplf5q
 nx4+sTuoQi8FoEg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The strict flag in struct pinmux_ops disallows the usage of the same pin
as a GPIO and for another function. Without it, a rouge user-space
process with enough privileges (or even a buggy driver) can request a
used pin as GPIO and drive it, potentially confusing devices or even
crashing the system. Set it globally for all pinctrl-msm users.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index a5f69464827119dfe2a7781b558094b283fca215..1751d838ce95d6138c824b90098f74891dec7656 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -268,6 +268,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.function_is_gpio	= pinmux_generic_function_is_gpio,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
+	.strict			= true,
 };
 
 static int msm_config_reg(struct msm_pinctrl *pctrl,

-- 
2.48.1


