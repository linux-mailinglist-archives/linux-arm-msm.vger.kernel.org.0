Return-Path: <linux-arm-msm+bounces-74642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E22B9B787
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 20:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C133619C28EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 18:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC9831281C;
	Wed, 24 Sep 2025 18:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bvtOKgXl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FD9239E9D
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758738319; cv=none; b=WpFSYUCWOq+NfHmqvyF+N20U0FPOxyrEToMUZIv0MZCV03/O1ym4mLIKACVQN1Y1HSVwJ5O9UbRakWXEUGGdQ7UwFK94tkORUCPa2pM0bucfdH7rBw4KuqCI7ONNvVsT8AjV+sKLUIrIs2BMYQx2JZ/b20ZiEUj16DZjfBhBB80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758738319; c=relaxed/simple;
	bh=g97455aHztfid/mxTIWRxfLc4DSmVKssfpZqo3D8+SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnFgPDs61WspAWZv0fVEEd8WGYNQ8TsuU+aSNCc7fX/sAu7rWYPBbQw97P2otZDbK5G2QgMeicRb5dMaLUC5FinMgGHWOkhZ+kdc1TpmfKw47pT5ByfqlCAUsCiBrhSE58o8uXoiikFmajMvIyjjduIY/0z+WJjHCOWwJazBz3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bvtOKgXl; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7761b83fd01so147705b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 11:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758738316; x=1759343116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6YgjPyD/CCV5XJY8PLF8Hf+Jbbmg9hnJHEyTuJhhjQc=;
        b=bvtOKgXl3shv4YjcgA06OXdHR968qVWEkukCgTBFU5ZT3pYPZrVx9FeOFVpQn7GZK8
         Y/v6S4dn/MCA5Zq9aM7uLLa4jv36KPZkUfuyfW6W1WY/wO6yS9JHlA+RUyO4s5hzbTQ2
         0h951+EoGtpYK3+oadW+a0AlkpDcCaoGTvITkxkfxCSi4ChmmG3ecwIiLzfWcBVNBE4h
         2KUz5spEy7Nj2SmogiXX3zbKvIYLFeQa+x5RwqGd6YWgyM0Xdc9eRlpvdPy4g4hcfnND
         r30Xv0QUFePiTmrt0bQCksav4PkWHuFj+9U9WNac3sEl6Q/zZD6QJl7EYb4ly6gi0I2/
         mE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758738316; x=1759343116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YgjPyD/CCV5XJY8PLF8Hf+Jbbmg9hnJHEyTuJhhjQc=;
        b=olbgN7z/nz2dWTkyZ3rRhsUF3ga7pf7aVzg+VBomunMlBCbopuYP12UY+SyIGQP+nW
         HKWI8oPLXpb7nrpBjN+YAg04b6f5wcbpe1gYwE1h7oJ5Nn5r4Fb6AeHSkWe97yasXXoz
         vyAPmnEJMOy9tal5ifyXHNnbuaTI3vqRUr4NivSuxrS4qOrbYIeHYdBtUCIHPzZnG+2o
         E9ZXRLL0i3D9dZJl7DLu9Z1Th8n9vqmw0cPCxoaq2O1V9hvjh1thcNr5qFd/XV5Ppokb
         3eXUBp4HwDZ5QrbYHuEP6QakdLUAhMHOIWd0/K/4zJIwTklpKuKY2q5GgraeI1qRltFs
         k56w==
X-Forwarded-Encrypted: i=1; AJvYcCXbeudli7WWsFZJE9VrdfsYgpkgtOcduiz9PXFV5cCSfKfDip6/HNtLA0S8WoDTEHdI/7PYdgrxZYHliONf@vger.kernel.org
X-Gm-Message-State: AOJu0Yye/10af2vxAyaYroxc2uEYhPc+uKoZqzsBxq2Y+iJ6ETB5mm+3
	1RFQFSajMrp8X0+ReALqKfWkPTM7JBC7L1UAX/j3V18rQ18pKex9LXBx
X-Gm-Gg: ASbGncvttA6/KcXzlo1nPhWzWHGeSGnP+iGp5xRxBS8IJ0d+xneZC2AvlhL1iCc7BU1
	/x3NqIeiXOa+D6TeyXx465Xuy+mOCflDIrZ+fU3WG2lBL150bTs2QCruRaCiSR/o3QpboDOXs37
	kgr9VpO4xsF2UEEwlCHvj2LCxS+pPEYSHZ6mw0s4BVzq9hUJsrxsqVq4+Pm+IKezwssEOSVS9iv
	V3XkRrPvI6eBETi+gpTZUSeWkP3FuhS38wqneQNFptDzYEhVCbEbzL0RrCjGOAldDMSHvwqYmvJ
	p7dmFTVxjyuoe1StE5wRP8yaudLzoXHE6fFQPRlE1IMUjszDGuZj6oWJjQ90RDjH7F/r5ISXVB/
	jmEzrrK5ARz/oXxbIQemHnflidPJXzPMzyQ==
X-Google-Smtp-Source: AGHT+IEpqtHdu0dI46MtGn1c8K5pz/tU5t+99UVSknOsKwdK2FcxqnWLxMvVRgkYkwlIxwrVnQBnnA==
X-Received: by 2002:a05:6a20:918e:b0:24c:f8f:2b95 with SMTP id adf61e73a8af0-2e7d0ad11ddmr748774637.40.1758738315675;
        Wed, 24 Sep 2025 11:25:15 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f4c4:bad6:f33e:ddc9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b5510fd4872sm16344912a12.32.2025.09.24.11.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 11:25:15 -0700 (PDT)
Date: Wed, 24 Sep 2025 11:25:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
Message-ID: <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>

Hi Bartosz,

On Wed, Sep 24, 2025 at 04:51:28PM +0200, Bartosz Golaszewski wrote:
> Here's a functional RFC for improving the handling of shared GPIOs in
> linux.
> 
> Problem statement: GPIOs are implemented as a strictly exclusive
> resource in the kernel but there are lots of platforms on which single
> pin is shared by multiple devices which don't communicate so need some
> way of properly sharing access to a GPIO. What we have now is the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> doesn't do any locking or arbitration of access - it literally just hand
> the same GPIO descriptor to all interested users.
> 
> The proposed solution is composed of three major parts: the high-level,
> shared GPIO proxy driver that arbitrates access to the shared pin and
> exposes a regular GPIO chip interface to consumers, a low-level shared
> GPIOLIB module that scans firmware nodes and creates auxiliary devices
> that attach to the proxy driver and finally a set of core GPIOLIB
> changes that plug the former into the GPIO lookup path.
> 
> The changes are implemented in a way that allows to seamlessly compile
> out any code related to sharing GPIOs for systems that don't need it.
> 
> The practical use-case for this are the powerdown GPIOs shared by
> speakers on Qualcomm db845c platform, however I have also extensively
> tested it using gpio-virtuser on arm64 qemu with various DT
> configurations.

How is this different from the existing gpio-backed regulator/supply?
IMO GPIOs are naturally exclusive-use resources (in cases when you need
to control them, not simply read their state), and when there is a need
to share them there are more appropriate abstractions that are built on
top of GPIOs...

Thanks.

-- 
Dmitry

