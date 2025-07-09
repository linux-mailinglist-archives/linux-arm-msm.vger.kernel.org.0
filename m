Return-Path: <linux-arm-msm+bounces-64255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54974AFEC27
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 16:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84651171296
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3741DFCE;
	Wed,  9 Jul 2025 14:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="W1cEVoUz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB93C2E4252
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 14:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071949; cv=none; b=ita1IxMBZjDX1McWt3UOPEvO/PujAbLl9vQxUPm+LTmF7DnZo+Rit1tjqFf8umTPyqw8KA1MBwyKCozYEFtSm0I/clTJKLEe4UXL3krebEQtrcHr/7qNnuxLPp4OWNzTSmBP29SMl+yzewyBKbjLJjwa6i5uwDNr0hEPFgWFQqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071949; c=relaxed/simple;
	bh=NP0djhxvz+fYNorZ8vTH2HEIGitCEWutbL88AJyvdI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XtFcT1BnKiDMH89pCcxaXuAvQQcK7S9JIiwPwjZ6IoJvyDM9ZKfVBHPxXii0BPdeglraCbkel4uGpRT1Mik0vGAnVPS5qRX6WvymhmnEsJTOHmlkgpBUVeLaEzXVfys7X2AOKnGwKdGskHPy2sJjj4sMPBbJJLSzK2IhWsm5nTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=W1cEVoUz; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso8764f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 07:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071946; x=1752676746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NgqgvxwCqFfnj3D+ZyyXgE4JDdDG2zRHT6bfz+Oub50=;
        b=W1cEVoUzuA+uIBzk7eHue+tloHqJ0Y/nKYxgdxQcsYNuf0e5bPMUbUvu22ekYohV6F
         GUMC3TJCqcOnkc7vvaX0/zGEKsc14ZWwPNAMtszxe9pXf34A3u7YWZHFEnz1wE7fOP8T
         k8jQ+Go22g0ztQs2hG+G+uTjnAGJRHNY2jJsyuFTQufYZaoFubuUNPG9NPZ7xgq6Jraj
         2VYanxupGB2l8tcEm8MMePpmzgR4q5nFmA/CwAM3O2yMJEenZiK3MR1LMrbvh+NmHhVi
         InlwFBbBnyFu8WLzagUlrVKUTHpHjEaeSoQyileQY1rs55gTxoOPOJH2FZdCg5fKs7Nm
         xu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071946; x=1752676746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NgqgvxwCqFfnj3D+ZyyXgE4JDdDG2zRHT6bfz+Oub50=;
        b=wlsjh8AYbDnCkrSOJ4BUyALnv4lNW8BhUw9ILI9uyzHHkawfN9wsvHYlsTwwfMZ89Y
         zd/75xz7gD/kzgQqBqXSL9TnpX7iBZcyJBtTVxXhIgNbTpHkC+2biKnGS5CQ2i2arFqF
         zE0zLgjfrmvlX+Bttnk6In1Ur+WR5lGebUtCYi7wwDYTvojapYf0664BTGa34hn5OoK7
         ipXyVb/BF/4z9TM9r4hblztpw1eCrjK3UWvvRG3/oigT3jbn1a+B9usmJVFhILvxQnX/
         BiUcLAyz5nUj0WF0MKhgL0gENoSAgYS7wwaZtweuRjd3v35J+1xv164Cq/8Lg3uwlbxM
         Y93Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0IlY9DqnA5lx/82M1TXDxNcTuOS1fVAEbobHbxwin2nfTdKPEpsi+qwjpvF3uwGP6tKV9rl/MzemGGKPy@vger.kernel.org
X-Gm-Message-State: AOJu0YxsZ61XCuZ0tQ54bW2QGiRc1TVfIJg/iPHfyu8UvtRmxHLG+IEI
	JT/7b7l/0SqAvkWTkBx+EAGT4KuDrrL5Miix/QDEseZcnVEU/uK5mpShWRl4yy40NTE=
X-Gm-Gg: ASbGnctkVnnzrSs0kEeEQGc2oIANPyJQuiklW2dcXjAQg3xRfJDWVkW/52agJ2ijwiN
	2F1+zbiIiEVfXXjQXRq6zVNMstsOwnsN9xo8KQyeUGGzh5arI3UC+frka9LmzKF5ZJADOWgXcO6
	mu8kQVTzhEXpS4n8t1gXiRI0ynTOdf2uMuNL6hJPIc98wq5dMu/RjeSgKN3Dl4Q23Te+lTGWlWL
	4KzvW9lbgyDlgxwvpAK8yVpL8w8v/fOBcYuNPTXqkmClbXAyQtfvEy24b5BNoXx2OIMZrvrzrSr
	Fpt3bKfGRF9OwBYe3ydLTadt8yJsltDVGlViQAdj3pVu6FZQRnSy5L0=
X-Google-Smtp-Source: AGHT+IFCxWrONhSHA0cousnCUUTqf0HNUo6HXPenRsFNCAgJUX4vg4QvqspTli9NjL302vwuxtMC7Q==
X-Received: by 2002:a05:6000:2410:b0:3a5:26fd:d450 with SMTP id ffacd0b85a97d-3b5e45291a1mr2441471f8f.47.1752071946002;
        Wed, 09 Jul 2025 07:39:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:38:57 +0200
Subject: [PATCH v2 01/12] pinctrl: pinmux: open-code
 PINCTRL_FUNCTION_DESC()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-1-b6135149c0d9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1679;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=SCktDGdssWrdS3fPrm13PpkBLbdVvTkxfS6ntdt/GdA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8Fn5vbkSWEZGQidWF/DLtAdBGAPpe0LBr6s
 hA7h1HUlj+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BQAKCRARpy6gFHHX
 ct/ZEADXo1zYj3JGoOxHCAszamqrd3iGcngdepn9Nn73ljY3c9cLbxU9cu2jwSNgPpAh7Dh5iGm
 KfJ7vvZaC6SCUUj8UHwIOJl8W6uiYdJh8DdR+amPrvf7vp+XSV5xzj0Oiy4B7AZ3k9zfdi5Zqd9
 6rXUNWprQ35uNz4SZ3ZlC+nR1GeZwh440KfN5xaRc0I2NP2oqZNgwZdjI48LZsVuPYKIV3LiuDv
 30/FkUZSjr6uL4Y3htJwW3bvYZSamBDzPkpUtLmEnoHDwLUOjL056vSIFTB3arspJp2hE4MNKKf
 E2ZSHXcN7V8hxQblKeqwX4hKEPKOLksyRqCcQYIhjnQGTF1OOQdJAtpW/liqQstCHd+t3hEYySj
 1TWsXiFMF2GmwMrOQkI3hZIVMLVU/bwFerouobUyraWcNiqQbDDlr+NED63W0FnLgn58M0aHrH9
 lrwr/As429fr7Z+NKMjcMIaD67YQnESCyufKQxHBaOlJbaFGq9qOq8gPrUH+C8DQtQLIPBaifyF
 bRmK+g5Yjkkb6ZePxJWYpEasghmbbEip1pzjgL4oQaw33MXgGLLA91yvu11b034rbgjUuwVLYZR
 TQJQihYTxefGANWzFUr2rHEC9UfEan9NXcptfoMn6+Hz5LEkfeTmhiIHY4+8Xx0BzbHqNIxoaKR
 jFu1SE0AegXKSbw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This macro is only used in one place and pin function descriptors should
only be created by pinmux core so there's no point in exposing it to
other pinctrl users. Remove the macro and hand-code its functionality.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinmux.c | 3 ++-
 drivers/pinctrl/pinmux.h | 7 -------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 0743190da59e819d1c72c1ed1ece72f206d60d65..daa7a11adabf672f802a8e9577c14e4da56b8678 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -893,7 +893,8 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 	if (!function)
 		return -ENOMEM;
 
-	*function = PINCTRL_FUNCTION_DESC(name, groups, ngroups, data);
+	function->func = PINCTRL_PINFUNCTION(name, groups, ngroups);
+	function->data = data;
 
 	error = radix_tree_insert(&pctldev->pin_function_tree, selector, function);
 	if (error)
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 2965ec20b77fb360ca244800e30f1eafa988a2b1..5c039fd09f7474b4c104d3c36e0e8b8dc73a2ddd 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -141,13 +141,6 @@ struct function_desc {
 	void *data;
 };
 
-/* Convenient macro to define a generic pin function descriptor */
-#define PINCTRL_FUNCTION_DESC(_name, _grps, _num_grps, _data)	\
-(struct function_desc) {					\
-	.func = PINCTRL_PINFUNCTION(_name, _grps, _num_grps),	\
-	.data = _data,						\
-}
-
 int pinmux_generic_get_function_count(struct pinctrl_dev *pctldev);
 
 const char *

-- 
2.48.1


