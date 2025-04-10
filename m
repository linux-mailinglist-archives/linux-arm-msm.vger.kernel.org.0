Return-Path: <linux-arm-msm+bounces-53803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0C1A83EF8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 11:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71F651B61196
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 09:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C0926A1C5;
	Thu, 10 Apr 2025 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Zaa6PS6d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4593F2686AB
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277708; cv=none; b=ETpA7lGnLGE2SRUVRS83YtWM/SL5TzkRPCziZqAyiZdMUKfSYtGdGytRVo+pd13yEKWQqNCrVsGkY8WAonrTPdOaxsChPX9HUKPL93TmZdtT1QJZB1wfTCp+kwLTcPKznUwtDoyTbshkkLV1kk1VKRLcYRdEkMFCDBOx0rcWDCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277708; c=relaxed/simple;
	bh=DoFdNFWoCcdwBqgFx7axqjS23MMKsUrQ/U/HOonOanY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKOr5uMmyJ+JZqcZm2MIAryyJ18R/eyMGT4I8RZumQknJmbg8D9g1gFY/6V2+iPDkdLtpEzJ/GKgFZN6qZ336DEa3uA0U4stEe0jeTyrDzH+bzRXibfCWv4SgkYyz+P9sgGzovo9vqbP1esHxNuha6ySs4h3Q4kBub4qwLVT2pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Zaa6PS6d; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso6877645e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 02:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744277703; x=1744882503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8Y49U7vyylV9HBlgThwXQyGyZVwK1RahyBl6+GUslY=;
        b=Zaa6PS6dNq8J8uH6qJYt4wIAT6ofYXV7gX/A1Yc20ga7kfOqRsALlQGRi49/1idFnF
         hILVamUUo7JkFwlkeiPlgpvGE00nSlRzX+05XzvYTP9G+TxRNmMKQ0nEeNvALBSI3IhZ
         4l8p5uXcV37p8C67gadzYQFIvYEbLawMxfmwx00+p8EC6KHk3+sO4RPDFeiEeu8s170E
         3HfEhGKjlYFYeqAue6iw7jaRNROWFUfPfAMn4CcuqNIDzxM74hzia/U+JLv1qk4SlWYX
         3PaQj1prWSBHrj/JWyo/zkKODnN8Lq2LlXrCr0+oEN6NstQSpSnD8JDNpU3JwSEB54V9
         WIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277703; x=1744882503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8Y49U7vyylV9HBlgThwXQyGyZVwK1RahyBl6+GUslY=;
        b=UvJchsX1YAsiC2WziIdDS3k0myXQOwGvQxrhd1/AYGNICQ2r896EDVW92UyhcUisWV
         Xb0Pajc0ZCQJa8zGnjkYH4LoZx8aeNjtDxa7LPLZwUqKL6E76Mso3bY5CWolHHg/ZVg3
         nLwXUxW1OnwtioQqokSSjQnqRSGQuxvbugRylN0/7u3wxuaTwajRpQ36xMmCE7VQNxvu
         RFDWZX+HcpUXEPS67ufIRuPddUnWhC1EnCM8B2k4zlCmUH3ok+BoU/RqpEq8DelruWPV
         7f39kmoO6rwRSGSMxz234/t4iFjeENyrOgsUF/u9Hx9L0uOiDX/15gF8rqo9GoNuyWHx
         dN6A==
X-Gm-Message-State: AOJu0Yw+6A/ilH0jH78OGaLI82Srpol273Ce6dXekf5SFhQ3fm5jf7KT
	swOdDDQ3LYbU360f+l6bUVxbbK/xP+09erxiCCv6Xt2gV91/ET4iqqjarcATBBIKEF9AX69f/uE
	7N4g=
X-Gm-Gg: ASbGnctKugZ6eyBvS5gJhcZpF6EF84CnX07Y7JTEaUVtat7TIeVh7VzmS5FbYjiJ91l
	rn7TPNT9AhrCr3a6P9+m63K7BbQ2L6ddy3fwh1NMyjyf6k6ZDjzIVAiZJUrvAzasOVKCxaP7+Rf
	MjIvszKFhg192jrdtYvGEzrvv+17GVlMG8E/IhoiZLBtRSEVDDnMMYXtDYtk5uxi4bcVjsBEl5j
	wP2pg2qmOdpJvUkYZ12YNn0qoXBv/dbzkIzYV3SSQ6400N//wsxcW7gsQ0mT5JDiuLrMwUpww+f
	YdKklZH7GWCMqyoYWmrKkYabSAeTGJSItw==
X-Google-Smtp-Source: AGHT+IFO/7yb5gwVk+EjcAiXS674jHL4dkOWAIJi2cH5g/WNiQpu8cbZDAfyXKFMDWcxeA32KO35qg==
X-Received: by 2002:a05:600c:a05:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-43f2fd29c65mr18806345e9.0.1744277703398;
        Thu, 10 Apr 2025 02:35:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7c4f:f9d1:94e0:53f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206264a1sm49698435e9.9.2025.04.10.02.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:35:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 10 Apr 2025 11:34:44 +0200
Subject: [PATCH 2/6] pinctrl: qcom: msm: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-2-6a6891338aae@linaro.org>
References: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
In-Reply-To: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1588;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=usX00XKi8pnUCUTjAeiAi0APuP7ga/Kkn40N9cscMzg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn95DDa/89BnXHtA4+4Ni8Mh9nKIEx8RLUu6TiL
 7c/JWsquH+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/eQwwAKCRARpy6gFHHX
 csL2D/9v1+J7NExhtOLP7S+W7lAyKvwFupRyUslizgwMatXixYiYi+QieSXSPPKQPM4VTj1KIWN
 n0FBazRjFNa3MaBdENT984m9UNUnwFOhviyywDuswR1ZU9fE/qZG73efOY2xo2gc9Ddb/kzDdHd
 9Y0W2naMHv+Mw7/A77hWpAHVpNq3DzKfqGiZXHZxCWrU0bISk2Yov9g9IlHzpIGHhglJKT9ujAn
 uDnf0lhqQhtHIFvojPpLEwzKQ0KztXkUu6+EuL3bThCO7oy01OeGDO5XnwiKm52aHPYqki3+Gy0
 P4I7OyFoVEgx4cW0RtMHLezTk0WekAwzt/xLjkhKeG3b74ceX11Cloa5fJofuwkA4ylLgBqwrv1
 59QxWmyWLxGR5ctwp3mdTdjpz0EJn9wWGQAdzhG5jM2iV9bPosMsKZm0u0TOUzJ9+6KnTf7GEBk
 NTJ6tMYgmFIEmF060FKrEsnjnt17Dc44lVjY2BHZqo4WHcTKycJzZrlh1M2QoD+Tu5zQ+BpAeV8
 uTsy7DQ3Zx7tbNX3DG6pW4NvOuxLS3l9pddMEgJI+p/zCsUXeQgSmgDNoom09iBJ7bvF7OUUO6H
 Cs6ZlNM1tb5SvmhkROfMQAkSPC7k0MmRkKbAqhaKMFxf2QP1kuZRNsL6pjELKXiQDbzjNUVFfvZ
 0relZsbl8+PJkAw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 82f0cc43bbf4..9ec15ae4a104 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -637,7 +637,7 @@ static int msm_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(val & BIT(g->in_bit));
 }
 
-static void msm_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int msm_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	const struct msm_pingroup *g;
 	struct msm_pinctrl *pctrl = gpiochip_get_data(chip);
@@ -656,6 +656,8 @@ static void msm_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	msm_writel_io(val, pctrl, g);
 
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return 0;
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -792,7 +794,7 @@ static const struct gpio_chip msm_gpio_template = {
 	.direction_output = msm_gpio_direction_output,
 	.get_direction    = msm_gpio_get_direction,
 	.get              = msm_gpio_get,
-	.set              = msm_gpio_set,
+	.set_rv           = msm_gpio_set,
 	.request          = gpiochip_generic_request,
 	.free             = gpiochip_generic_free,
 	.dbg_show         = msm_gpio_dbg_show,

-- 
2.45.2


