Return-Path: <linux-arm-msm+bounces-27263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0851493F5EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 14:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AF721F22027
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64FEF148FE1;
	Mon, 29 Jul 2024 12:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="K3eQqE0J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276761442FB
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 12:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722257647; cv=none; b=KahUTsHtKCgUd7sUU/01jewJDxJRfJFMTsGEY4faoyotPEkW/dQk6XFjHDc2lLg8BOugen+yI2dFjGyyDbEJ5kB8Z6XJTS2o+eBcjxRaWBKf+2iRWgS2Re8/hbqrkYneym6J5y3Zzq9J2Z3WdrAIP6CnApc9kKEDbvZbc0FBL1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722257647; c=relaxed/simple;
	bh=ZyK8lBnv7aPT0UGg2fcGb5SoYz2sKUKEENHPf6Yf+yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=af8iarQyckCjts8YbHKN1Om0v4preTbsBado/qoyEZiCJSfCoh+7T1SGc7lFPMNDzJ4+1n5VAHx5YZohfq/owNAoq7CtMwT9HZ6hGX4Dy+gcatfCE/QzwyXQLIKSyeE0bjSiC1PMV1aFMkjGyb42v+iXTzBISIyGdZ+wYTF/iGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=K3eQqE0J; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4281e3b2f72so6220645e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 05:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1722257643; x=1722862443; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d8CWPRtMQ6i+SW6jqovkol7RV6B7Kvi8g7hg+UsVQpk=;
        b=K3eQqE0JtfwlK9ZL13gxqEovm5N+RSRc6rasFrxhpItBuKHWm9JW5kMK5G3TxOpZcF
         fLcFARR7Us5c5cJVcezkO9n8ir5ameOe5bhrDBxQe6rtWrllyZ1+A5evdeB9OzhMRMfH
         neYPyHmKb2jbwPxo6OcrX56ykeJUcFYJb8yMy7Xbwk9n1zjOo51cJlTtmXAC9S5ipK/J
         O2ipPMLufsdkUNUjciRMB177kzu4LtxBQaIE58bpfEwdOD38Q1TN73y3iCfseqieWCma
         BKwpJIbR4cSiloAQzYAMIGKXdo6j/foUuGdNV/lVfa0euH6LfzgTyqIhH57nJaF0gsPX
         TzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722257643; x=1722862443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d8CWPRtMQ6i+SW6jqovkol7RV6B7Kvi8g7hg+UsVQpk=;
        b=XOsfaPh4RdT5yBt2e/ZMISB2v8++TVd3rg4zxD9zf+BCrP4thxuKm5AgxmQjTudB2f
         cfbGWmN42uz/UUvGgu+l3pTx+4aSlIuK9XVL8VY9K/p7gvStvgk1KpTeHH1t6Sm5trvM
         TBDMl6v1qZiBY9xTnBwTKznHKCGd9TobVaUJ+Bk7OEyV91KqYStDGJQDoFwbbqmQz7MY
         +t/JH7mCS32NndYbhx1Eec1+435XZ7QFGapjixLhBja7o9wGjsPa1yGHtKfp1Be3EQQi
         gp+8jKKIgSoOMrE+rFm+cdtRpsQMCGjuljmOWOHPFkT7WQuoQ4tDocrl561tAX4EEIdx
         0Yaw==
X-Forwarded-Encrypted: i=1; AJvYcCXZRTbze5J4rZ9ox1DcCzBfKeHikjWkN+YDdXAZT2/AmP9kzMk5D5r9e0/r5z6ZjFlAHFjNYmTft/qwF+A3r5MTB6HUhUD8hcR2u7Ul5w==
X-Gm-Message-State: AOJu0Yy8/yeztGQfq6LwCzOOLpBg27BDSBPqan5fCRVUVSgEmwIluKZ+
	79oarV8lfj2kf0qX6pHLXjel0Oiq/fFOvskod4OYxZ9VnBa7X8i08ZcVbspXwHI=
X-Google-Smtp-Source: AGHT+IFAprFQeursk+pLM9WBhRQ6uq4d9IDvkkDE0E5tziAxefBSTePjFLPqqskNa+VnTiufDe0B7Q==
X-Received: by 2002:a05:600c:474f:b0:426:6696:9e50 with SMTP id 5b1f17b1804b1-42811d8a81dmr56313735e9.14.1722257643238;
        Mon, 29 Jul 2024 05:54:03 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428057a6283sm176878745e9.32.2024.07.29.05.54.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 05:54:02 -0700 (PDT)
Message-ID: <e137bbaa-65b8-4bf0-86ee-ab1d6efb8ede@freebox.fr>
Date: Mon, 29 Jul 2024 14:54:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Basic support for TI TDP158
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/06/2024 13:13, Marc Gonzalez wrote:

> Changes in v3:
> - Add 'select DRM_PANEL_BRIDGE' in driver Kconfig
> - Fix checkpatch errors
> - log errors using dev_err (so save dev pointer)
> - expand a few error messages
> - expand commit messages with info from the datasheet
> - mark regulators as required in the DT binding
> - Link to v2: https://lore.kernel.org/r/20240625-tdp158-v2-0-a3b344707fa7@freebox.fr

Series has been rebased on top of v6.11-rc1

Current changelog is:

Changes in v4:
- Add blurb about I2C vs pin strap mode in cover letter
- Add blurb about I2C vs pin strap mode in binding commit message
- Add blurb about I2C mode in driver commit message
- Add comment in binding explaining when reg is required
- Add comment in binding describing Operation Enable / Reset Pin
- Link to v3: https://lore.kernel.org/r/20240627-tdp158-v3-0-fb2fbc808346@freebox.fr


For reference, binding commit message blurb:

    Like the TFP410, the TDP158 can be set up in 2 different ways:
    1) hard-coding its configuration settings using pin-strapping resistors
    2) placing it on an I2C bus, and defer set-up until run-time
    
    The mode is selected via pin 8 = I2C_EN
    I2C_EN high = I2C Control Mode
    I2C_EN low  = Pin Strap Mode
    
    On our board, I2C_EN is pulled high.


driver commit message blurb:

    On our board, I2C_EN is pulled high.
    Thus, this code defines a module_i2c_driver.
    
    The default settings work fine for our use-case.
    So this basic driver doesn't need to tweak any I2C registers.


binding comments:

+# The reg property is required if and only if the device is connected
+# to an I2C bus. In pin strap mode, reg must not be specified.
+  reg:
+    description: I2C address of the device
+
+# Pin 36 = Operation Enable / Reset Pin
+# OE = L: Power Down Mode
+# OE = H: Normal Operation
+# Internal weak pullup: device resets on H to L transitions
+  enable-gpios:
+    description: GPIO controlling bridge enable


I plan to send a formal v4 in a few hours.

Regards


