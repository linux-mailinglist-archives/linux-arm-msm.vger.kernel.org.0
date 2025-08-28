Return-Path: <linux-arm-msm+bounces-71163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DACAB3A579
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 18:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53C651C8651D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 16:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB6329ACD8;
	Thu, 28 Aug 2025 16:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lj6cDzLy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F069286428
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 16:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756396851; cv=none; b=n2yC+4m6PlE32FVrc2HbnZZpBAFN4kBwYEcpSHnn7ELRJ4v38u/gDur6C8NSwqgGjLo88O1IrNgOk30sXEJjxFWqKSoNnvtAh78rdPWi/OE8vid2i5i1pcI79IQBNuupMpa9UWul+RpIQ+O4QUWQsmHFm4G3sQq3WUW30zEAn60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756396851; c=relaxed/simple;
	bh=RFujl0Cr/YaORxwURfe0zTKDzCwOsKiOevFTrddSrvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n9OOXMtCFmp8A7D0PXz6eh6E+lEyYY83Z7+faKIrpTCKjwSpeEEJCKFToYjVdUSzqWno1P9dxg8B2FLuegtTBbyNoaIhfDBWdvNSLUZN16GfkspuNRR9i0RwiRmaEoRxa48am39Z9t8htjXYQcQtr47r+1BVweibiAa3PhHTrIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lj6cDzLy; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45b7c01a8c1so6240835e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 09:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396845; x=1757001645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAO2WeXDFkbtwkjKyd1xrqU98u0EGyjojmTyXcAuE7w=;
        b=lj6cDzLyrRNsEyMJagBiifpMvsKgMTOdkDj9GZcnDUdSWk8ufFShfmn6oRBNCPJlYN
         wwlx/jCcxGFh6khQcBnZbVSSt9/FpDiM/wFcShxZ5HeSfuytoJ4T1tp9FKUK/l1m0BFu
         q2+YD88pNd3Pjy1l3WbdlWvJLqTuZNOe9qKuITPjHqN7g5HTb3jYgLLbrOJwQYHyRSBU
         zQyAVA77lFidrn70OCC+dt71w5oI+PcHzWsVqDJZTpHp4uRShQNIGsG5yO2u0wzoFhxT
         RNCoJOYHz+2KB202CXeBStzNzhhnqRlD/jatRgXT5zbTFhBq1hCXi34hUK8POyu4/k0H
         1Pmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396845; x=1757001645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAO2WeXDFkbtwkjKyd1xrqU98u0EGyjojmTyXcAuE7w=;
        b=tbD/PbsWoCMcNR/RZiYqsd0bplSPCGsJMEntDaxgQqrk+VZv1y+XDwWqoGZPU0V0Wz
         Sp9Qby4KZNQ04qglvy2Gju1b+brpzvflhH9h34R2yGpy/zwnavA7YeM86gHHJbQY21RN
         zSTDiBXjYI5y9QeMmQMtYZHeunyjBHwQrDcSeeM9nZtELvB2yzEfA3gvcc4Krmcfhuj8
         BVu0bNIxnLQfmLqf+N8jwkX4scf7OA4/fBLGHq1/Q/Icbw9Yz0WAYYI893Y1UOHXJTkt
         2y0G2l6VHYYgI1Kv7S+UBGNO8j3NlZDfi9K41keHIZ8ZefP0GXfc1NNi5HebhPtMoAlV
         Evhg==
X-Forwarded-Encrypted: i=1; AJvYcCVt1sLZluqRZSKLBugZObpsb+c1vcQ41ndmiP9XFdPTpZ3+jWjLkY704wNWOIoN1tb4Lf+FCIBvT7dVn1xl@vger.kernel.org
X-Gm-Message-State: AOJu0YzYgytfQ0aMlWgNPskx4hy+zRwb7kvLihSiLcyiPBSaIPUi+H6i
	ga3TiCoDBPSpt3Qwl9lE+IG9lgmEl8rCsNS31faPnY5u3uNNSvTOyKIG15xIzPHyJzk=
X-Gm-Gg: ASbGncv/LGAlp8MdtVPFvr4uTcTrMWrl3XA+efw3gwPBD0ytHB+xsS2OvKKwQGBrCy7
	D/QlBsLuDw4WoL7+CqPd3Nlyl6b22sXNVpcXwwzshMlWMf0TpwFOnQIe54PpABETfHMVRSEaImF
	tC2D6cB4TmkaTZi1TSvAb7ZVE1gahiyF8TukpaSc2Cy1XEPIFqHWJci6NKJ2E47+hTTPPK7ZMhS
	3uM10bFYoIzWJRhhLe/ggldWEUpy7QaXJaop2We6fgHoO5sK1jg+165Kz3rTtd4HF7cFB1FZWzY
	+UDSIadGlLvo9N2/hBkIZNWgwxJ0ObERBvPCxQ8Vuze07GuD/bhKeBvKmQqdrHHcdtN9tAE6vpv
	UYz8or3LSnUT6dyWKuQ==
X-Google-Smtp-Source: AGHT+IH9eqAsu0mBkmZO1sLp4iQB82doTTOSGeYtxhUeFPIbPn5xY/WnY8KAWmQi9Jdt7MPymPYo1A==
X-Received: by 2002:a05:600c:4f05:b0:45b:5f5e:f1e4 with SMTP id 5b1f17b1804b1-45b648111dfmr100878215e9.27.1756396845191;
        Thu, 28 Aug 2025 09:00:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:23 +0200
Subject: [PATCH v6 15/15] pinctrl: qcom: make the pinmuxing strict
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-15-c9abb6bdb689@linaro.org>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=M6AAfE1ZYIqFZsBoDZ4O1bJllvK/6bMXFJ6Zryc+i/E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0PX+ObgCFGCgqoUrUjW902keUOxgLE8EUsB
 XcES2lA2qmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DwAKCRARpy6gFHHX
 ctL5D/9vpjY2JraOKI6xQLDzt9TXljIFuNDozQLvzOHyC9MgvKOWbsLqyOrunHPfrNqqKOFBK3T
 KwmfdS1uCAhkPVJFu9+QIjoLLd5p693JFSuHkObJvgCet04MNbRQLB5JHqL6iuH+bu9MyubXgwJ
 krZwBmRMnrDWPenruj6k4hAA2ihAQlUx9GOdKpiLfvYH8b6RAkHtDQPWjO21WqCLg4XFku4EESO
 5IruyaJkV3MTpbYIobh2C/a6mUW8SqezSSh1LG4Bd1XobET0b8+hWmght65TmOvonC+GLe5r2Wh
 pLFBhM0QRVLHeqtJgYx4uIqUU9M0k9AXIOR9238ttf3Ct3ldZ9ZfTONb3jNBXOp9939T7h4ZLpx
 SUaPlc2TzAFEbRUJNonPEbxaaa0+qbqTjF9ltT5tZC1Mlqr8pyzA1YH8BN9wyrbK4N6qH1ty3MJ
 6emE/yXMZFLsGd8hOSA+egnDYIO5BK1s91hpGWU/ZY/fadrMn6UtPYHf85JlfFzmhIlsS9nHjfY
 oLMcdYawGwDD/MdG1Dt9y2yWY+0T4iNxJoUqYKmpisWrARyHw/iR5VjqJFS50k88+CJMB1H36z0
 letY3JTa4NNIETPLbq0dvyWaZmnqCNmCzEgKPyWyC7sxmk66PTtyQoJj32nMAH62uZVZ+A6DZeE
 zit65McHjdrqSGA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The strict flag in struct pinmux_ops disallows the usage of the same pin
as a GPIO and for another function. Without it, a rouge user-space
process with enough privileges (or even a buggy driver) can request a
used pin as GPIO and drive it, potentially confusing devices or even
crashing the system. Set it globally for all pinctrl-msm users.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


