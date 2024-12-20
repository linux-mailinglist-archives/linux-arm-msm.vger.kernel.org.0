Return-Path: <linux-arm-msm+bounces-43017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 379559F99E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 20:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3A90165A07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 19:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FB32206BB;
	Fri, 20 Dec 2024 19:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H1bUwt+3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB6621E087
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 19:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734721293; cv=none; b=iyb5VHMBDOfi386HizJotxkX0FZee9rdiZxTNvETrn19ixcZxat3Rqdw1PeWmozEy+YqIedrQDPs8mnqwImjEKoYE/5zzy8ksCmI9QXF8Ashv34veFA2JzaE/FRqEkhNKV0FayS0RhTsb0dhPC7W2vi1GcebJjiaf22gCM08Cx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734721293; c=relaxed/simple;
	bh=bJ99ctceFQMXhuc/y2nK1macMD1Urlhqn6kEECv4WsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXDOS3aQYrYMf/XWOEZB5RPAAoo6O09Fu0zhyvQTD39LIA6785qme4OjsoXCfO/m0/0NPtgJVsZOQVeS03/1bW30Tr2FEEjSALTewJxCTv0MDo26zddLZ7llfMmE7p97dChGvtjy8GvPMeMWwVMwDwrG/wdCVLNgqtyo2yN3v+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H1bUwt+3; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385e2880606so1767970f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 11:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734721289; x=1735326089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uhuhIUiUc+ih+ObJB65Wa1LyJGtdk6WtmRLAQJOkSCk=;
        b=H1bUwt+333KKce8xzH66vupJPQRijJnHnR85TK6+QZdiGiHDDvkBrul1JqPdArnXi7
         NnBGM9wwGnKFT/eI5D1c7X4a2Eniu7ROePW57ciFOwRb+6BSfREye7sdxCkZ/zu2+Mty
         FFRNmiPlqm64HoQR16tTPXEAN2Cx4nX7ZKwN1QHGSL2GOkwpdfTDqO1J+hxjlz/I9Qun
         O75fo1w5DGEsw3ZC1b+Mkud2AfKLNEfNuj49vVzX6+2/WterjBDFcqUW11AMmLP1TIj8
         5D4d7HcjBngDGkOqZ0QnAdNlLnkawzb9OzN+XvjxJ21h/LyMAEnN2amHosCydEIYmVDI
         WGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734721289; x=1735326089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhuhIUiUc+ih+ObJB65Wa1LyJGtdk6WtmRLAQJOkSCk=;
        b=koxN3hlP4DO6vufVXUUEUE01ru8XOZaFv+bpxXlyTHpXcupD2rERY0sLT14t33p7eh
         tlDS+F668ZNGq1z/WFjTvsnbY6cNvwdEZsGllzUG5EuU6U39z2C9ahSvBus0algFke6R
         6yHCdXe9KttqPPD7zvakaAn17R1dH3YAJLoO7viQQkwV5ylLrVhBxG2yM1LgA9xM6nxk
         jxeUbHcrAYpNXplBYBHOVdXdqkNJz3SniognuhEFVbcAUmOS1Q0q0XkJmDCiD693PVyr
         vkPPAgu7vjta7bXt4xFgX+9F0epK5D05Tk3OsEXr0jJQgNWRUBHFUe4/ZRiCsRqEgb8n
         kRgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVzJCdexm4FS5jATxt/U6vdmaD6bBDrASs5/vdrVTDi4OAtk4Hi7dazrFcj6ZILDroJAGrOD2kLHtK8IGs@vger.kernel.org
X-Gm-Message-State: AOJu0Yznv6FurEg6F9pP5/sfFtOsHpzgIsM3PnjbMzcBftq5EE5cTAqt
	eOjEVsiB7agLRBL7xZ924p1oP4cTdKefrNStlKlqLJWPR71y49qqFd3B2BTw3Co=
X-Gm-Gg: ASbGncuUmO/l4X0ufcUGXwLnmF9CeYczGWmiDXE22LY38+LFLVONGLwCSxjj9+6nCnN
	/rkelHK/dKhyZso9f2jaACOURV/bDRq0TAYnQBq8b/ThAsWjEwqr8ztLr4VP+CkQiCvHEVh3sj7
	Ua9rNbMiaAApR09rkKTarHnH+jw/WGZlDAYUFk5qBeFKPZAGIPXHBieTtbqnlXjbGD7DNAiVW9p
	mDsN/xgQQe3EKFHtAuyRFZOf2WNgTWaTxrNqVMXOkQz9Dre9MZlNx1vVT0QQ4/M+smx
X-Google-Smtp-Source: AGHT+IG0qFwzLLOsrueCE01V3g7mpKhsWQgso8opRJRVgnEQfgK5BXDApeSiQ4xcURlGl0hmWZlhVg==
X-Received: by 2002:a05:6000:4715:b0:385:f560:7916 with SMTP id ffacd0b85a97d-38a221fae73mr4668110f8f.35.1734721288774;
        Fri, 20 Dec 2024 11:01:28 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef80:6d2c:6f87:64ef:2237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06542fsm201454966b.176.2024.12.20.11.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 11:01:28 -0800 (PST)
Date: Fri, 20 Dec 2024 20:01:23 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/3] platform: arm64: Add driver for EC found in most
 X1E laptops
Message-ID: <Z2W_A5xewTC2ZJFs@linaro.org>
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
 <20241219200821.8328-2-maccraft123mc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219200821.8328-2-maccraft123mc@gmail.com>

On Thu, Dec 19, 2024 at 09:08:19PM +0100, Maya Matuszczyk wrote:
> Currently it features only reporting that the AP is going to suspend,
> which results in keyboard backlight turning off and the power LED
> slowly blinking on the Lenovo Yoga Slim 7x.
> 
> Honor Magicbook Art 14 and Lenovo Yoga Slim 7x are known to have
> firmware with extensions which would need appropriate handling.
> For reverse engineering the firmware on them I have written a Rust
> utility:
> 
> https://github.com/Maccraft123/it8987-qcom-tool.git
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>

Thanks a lot for working on this!

> ---
>  MAINTAINERS                              |   6 +
>  drivers/platform/arm64/Kconfig           |   8 ++
>  drivers/platform/arm64/Makefile          |   1 +
>  drivers/platform/arm64/qcom-x1e-it8987.c | 158 +++++++++++++++++++++++
>  4 files changed, 173 insertions(+)
>  create mode 100644 drivers/platform/arm64/qcom-x1e-it8987.c
> 
> [...]
> diff --git a/drivers/platform/arm64/qcom-x1e-it8987.c b/drivers/platform/arm64/qcom-x1e-it8987.c
> new file mode 100644
> index 000000000000..d27067d6326a
> --- /dev/null
> +++ b/drivers/platform/arm64/qcom-x1e-it8987.c
> @@ -0,0 +1,158 @@
> [...]
> +#define EC_NOTIFY_SCREEN_OFF 0x03
> +#define EC_NOTIFY_SCREEN_ON 0x04

I think these two are specific to the Yoga EC. The 0x03/0x04 value is in
the DSDT of Yoga, but I don't see it for the devkit for example.

We should probably only send these commands for the
"lenovo,yoga-slim7x-ec" compatible? What happens if you just send
EC_NOTIFY_SUSPEND_ENTER and skip sending the screen ones? Keyboard
backlight stays on?

> [...]
> +static const struct of_device_id qcom_x1e_it8987_ec_of_match[] = {
> +	{ .compatible = "lenovo,yoga-slim7x-ec" },

If you're not assigning any special data to this compatible, you can
just drop this line, since it will still probe based on the fallback
compatible below. Or you add some .data here to make the
EC_NOTIFY_SCREEN_ON/OFF conditional to the Yoga compatible. :-)

> +	{ .compatible = "qcom,x1e-it9897-ec" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, qcom_x1e_it8987_ec_of_match);
> +

Thanks,
Stephan

