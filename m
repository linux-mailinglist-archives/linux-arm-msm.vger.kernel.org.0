Return-Path: <linux-arm-msm+bounces-64258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E97AFEC32
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 16:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CD851768FD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D182E6D13;
	Wed,  9 Jul 2025 14:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BcaLtgSK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0083A2E5421
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 14:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071951; cv=none; b=sh2uzxZk4UlcPfjaEC00WvAPDRGFgI2dwVdHtmP/WtQjGIKNUa/tNvB9rTHwpqGvqQ07HRQR5EWOYdcRu2+gSqb+M2K+CD09cJjXeIqaz8CERh9I1/Xv7W+gB0cRZTTjLddDFINYGxkjMq67Y14Ed5BO0QVYE+kj3yw0305NTqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071951; c=relaxed/simple;
	bh=YU96noccr+Pkr/3ojK5mbBvESMGpB63SYl8ohE9H85s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ijY62uruRW08btddErcXBS10JfSS2mH/XTGKIZ+oYEOAmH38x2dqsY3awKoPIJXowYkpVRpQFGR50+FYAHGdwWbBdiXGRM4dY15MXVAR9mvBjgAjnso1kt9WE7kdISk+TK51sjpw1ntw3pdCcK6XJJHS5XtPLXJ//TAVj4++zeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BcaLtgSK; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso6532f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 07:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071948; x=1752676748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxpOHy8IwZabJSI9Yo0OtEtvTBr2VaAlbxuciXaWN/E=;
        b=BcaLtgSKNq75NqDB0yhoeDT/f2tIif6ug53QTYPGc1617mbBN7w9guwG3Ad9qqAMSu
         w69vFsIa9T1ai7VbysDJ7CNH5A+/ZYD/x+U7mp7X6stwbwZ2K3H8pn9bghKVVxsPcKBd
         H6JsP45UQXYdkslmzlN0OfRMiOXeMSA806qJqoRHwsqEGkZrJE+1zFkZg+rjUAywlJVI
         QHjNBnidgcwg9Ooer3GBhZSKUK+RsZG8e+hmRtvYG+w+/3r5qd6PGhjwAS5XC8Elfyf+
         EtsgiPOH/yfDtrlEDzqXPJBC+N2Q12kRsshIUT1h+icN3B8icgpDeBxs+8cyCsBziZm5
         A6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071948; x=1752676748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxpOHy8IwZabJSI9Yo0OtEtvTBr2VaAlbxuciXaWN/E=;
        b=pDyl6ar6Ha+KzLEELfPbrTuZy3VCg0x0vfCN+jPB4qbDfoEaojWMCW7uTDqAZmc2Aj
         tvzCWADbmTJFtxSHEAZJi83OQ3YMFrEyNsDUx1Y9L08smK4VDQ9kTNORjgkYSPrv3vW2
         O/4C33inuJ0AFQRoChCKFLR4iBVi6LPMnIKfJYsTj4kxeQZ4ZS+Fut+2fgDsoEjFBtQD
         16wkg4VlAYfjupT7aiwEdIOmuq0GUaRxEtLK3zgw0zNd0dPkXxTmAfN3TcmNqiorkVYk
         fyKBakjQNq8CI69zh3t1wlzse7gCEQ2d+uZqeb85H3clgDRpEd+/0SM4/7m3xPqIe5lc
         AP1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMvj+jDj+ffdYr961s5oxk4OB1j/siuxtrXGnfDk6AAHV8SIW/HfLBS5elQ19UXf3l/5d0fj+68lOJ1I8q@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+H/Ymv82uip4p2mjaSbfp/60z/zcBA45CSsLyQiE4RM0Mmaau
	tXh+FUQRXaVQCcXVP+VOe8VqsvlPBP252bWBTtZaw8GQUdnCZinpWmLZDgNj1jehKck=
X-Gm-Gg: ASbGncseAlo282leLibkfeUW7IdupIb4JFdr+xclJylU2vwRSpUtJZn+hfMAMFNRZ4y
	hD9qJ0mgkyjSMjmKf2U3F6AeBQRaTfEOjQ/CvVSH579/A/ZRO1TVTIvCfI4gv5q8F5kAL8pwsrh
	QSOIeAxBB5G3o8pScXvva5oFo1iuIiqS0FzQmk9+RQHGFDzw+TCja/6tY3Ix0jt9UQCgwA8bBTf
	Vf+xRwuj0EhIvXbvwofbsd1VrcXpfagWPb58YXJX3k0g0cnX7sIm/VU3pd+TgpJ5+tA+48U6aOs
	vHGWL3Vv2fy7CWFrPEjXnNkZGrLNUACGlyBv8BsU78r/TDGlVKtYDCsjI+r+w6e+ZQ==
X-Google-Smtp-Source: AGHT+IFEibdkioVzNOuoSWG/K6hY+8pugjo2P4TOU047si8DoKyy092CWV0oJfwFHRe0nnQ03dyytA==
X-Received: by 2002:a05:6000:1e4c:b0:3a4:f644:95f0 with SMTP id ffacd0b85a97d-3b5e78ffb54mr139106f8f.54.1752071948244;
        Wed, 09 Jul 2025 07:39:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:38:59 +0200
Subject: [PATCH v2 03/12] pinctrl: equilibrium: use
 pinmux_generic_add_pinfunction()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-3-b6135149c0d9@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4MVQFwNoIRV/Ud/LLyOAZ+93HlIl7udseweMC7bu/h8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8Fa4XZ2ghW/kayIDfPhlXAL3YlqwU6Ngi2v
 IjwAbZzzbKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BQAKCRARpy6gFHHX
 ciikEACCh0LQNciBTYPnmuwa2YZbkQokhjIrOxRr1owGq03CeZiPYL7+ysx6BmRb3t3mKykP7Bl
 WfzTGgSSZeDscfRF9rqRRxKymVUakctYhZNhqABFOeSqnK0w8mrnv7+1cRHSt6Dwg22rPuBknF4
 XaVVUG8i9wnEqaVUEXD09i6hE2kGV+ssquoodS0BvjBJar9+ul1V6vALqdLckIArGjCowy80OQq
 SpXXbbDfMJX1K33wbDYk5z/uyvbn/GVYEGF48CNNV2lV9U0F2BiD6hArqBSnBseWrd2ms61sPkt
 +Nk9r4zgJgQ6KT8pfN617hro/Wx3Lii1FIAYx6C41Foj6mKN8bYikDM4nDUSsUSFX2b4i7U8Vx0
 mRGG6OkZ+5NKLe0K7eQpMqk196ijN+RgyYDmDW29P+NAHTGVPaEzxMQQURYvhJ5Qh3wnBk8V2p6
 DRH2sqA5yI+y7VXTY7nJu9FayLkT4zpGkHj0YeN/uQ+w+CC+lBFPC6ouebiniuiHiTRc+vM9oLq
 eNED6Gu3+VQKpwaeJbAw7ZFJDnn9m++413EQZxdxfmy28IAgFw+6qxZbYVMvU7jXxBp2G53lwg6
 PYD57psiOtuhbkv5gqv3X5suK9nDqLGTmuUIuhiODlJVV+IEW/7cLD6poLY7OQAU+bxmLmd8HC7
 hb1bpmiIszOUvng==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Instead of passing individual fields of struct pinfunction to
pinmux_generic_add_function(), use pinmux_generic_add_pinfunction() and
pass the entire structure directly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 128b7efb110a55066a21afa7bd0744a5fc6332ed..fce804d42e7d7f9233b2da0fb26e482170629424 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -687,11 +687,8 @@ static int eqbr_build_functions(struct eqbr_pinctrl_drv_data *drvdata)
 		if (funcs[i].name == NULL)
 			continue;
 
-		ret = pinmux_generic_add_function(drvdata->pctl_dev,
-						  funcs[i].name,
-						  funcs[i].groups,
-						  funcs[i].ngroups,
-						  drvdata);
+		ret = pinmux_generic_add_pinfunction(drvdata->pctl_dev,
+						     &funcs[i], drvdata);
 		if (ret < 0) {
 			dev_err(dev, "Failed to register function %s\n",
 				funcs[i].name);

-- 
2.48.1


