Return-Path: <linux-arm-msm+bounces-5684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E736981AB8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 01:10:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B6F4B23FB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 00:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38E5801;
	Thu, 21 Dec 2023 00:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SzcsQQGq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A80635
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 00:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a2335397e64so23543366b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 16:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703117441; x=1703722241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nx51Lf1EjqWvC8rwAJ0h4wGEFzTa9kT6CKikSA5ehKQ=;
        b=SzcsQQGqdYukzPoSaijoG0zHMpBJaB0aLYnA92/fBYoIkkLgEfnTY7Vd30WbCbos9A
         uHq6lKeIjV4ffCJoJb1QAjd0Ewskug9Onyq3TxIqWciR50+QLa7E6HX1rE+Q55gIYnVP
         lRo6VsvFanjMbHVxSUtMwikCW0jNzasEI+PE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703117441; x=1703722241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nx51Lf1EjqWvC8rwAJ0h4wGEFzTa9kT6CKikSA5ehKQ=;
        b=QO9u+YUvd0/lQkpFEngCOp0WZrPLU6qUjTSXQv16RsdEwZ15++yeU+OgFqrLHuzfsG
         pnrkHTX+sbdFQT5u5/SRm79k3DeiCl9DQfY/H9o98mguPWHdILL+Qz6NfFNX2uey/dWu
         vtYvVk7VIkMfjIqLuTbhoAqiWptUKCGq6KfYecXeYb21nZRHPqidCjPUXk9twXhVJt7c
         JMxXrCpPHL1Q3y0pvq6nI0gzujWwfLpvTR74lIuWiLgUTRBIHKwS0Fnuz9GOCJVNaEpV
         UHjJI8KpLdd+LyyIHRfTNQIiftmz88d0AAhH56VxmM0q1EAqiKbxj7YI+D1pXCoDC21Z
         QGgQ==
X-Gm-Message-State: AOJu0Yw1YZHS0NM7WZoRjNPovbmvS3Bs5d4OB6OllTs9Ap8on+ECa+m5
	IhSQ5KJGk+xSEWYtI5XUbmb+zCeG+CWP0ry+oTbgk1Jl
X-Google-Smtp-Source: AGHT+IFNVd+eTbQLcDkBDtp+UN4rLZwgkWq7lHOQq2vcOoDfmE2hI6+0xrGL4AoWq4TMPbwcMxQAYg==
X-Received: by 2002:a17:906:3f4b:b0:a1e:ef3d:7b63 with SMTP id f11-20020a1709063f4b00b00a1eef3d7b63mr10715402ejj.0.1703117441233;
        Wed, 20 Dec 2023 16:10:41 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id zz14-20020a170907350e00b00a268f27eba7sm345492ejb.48.2023.12.20.16.10.40
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 16:10:40 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-548ae9a5eeaso1861a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 16:10:40 -0800 (PST)
X-Received: by 2002:a50:d69c:0:b0:553:d734:3f5a with SMTP id
 r28-20020a50d69c000000b00553d7343f5amr2325edi.4.1703117439793; Wed, 20 Dec
 2023 16:10:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220235459.2965548-1-markhas@chromium.org> <20231220165423.v2.13.I2ee94aede9e25932f656c2bdb832be3199fa1291@changeid>
In-Reply-To: <20231220165423.v2.13.I2ee94aede9e25932f656c2bdb832be3199fa1291@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 20 Dec 2023 16:10:27 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vv450bQ+GrUh9Gr1nRcg5K0t-J_eoPpxJ=GmqOQavGYw@mail.gmail.com>
Message-ID: <CAD=FV=Vv450bQ+GrUh9Gr1nRcg5K0t-J_eoPpxJ=GmqOQavGYw@mail.gmail.com>
Subject: Re: [PATCH v2 13/22] arm64: dts: qcom: sc7180: Enable cros-ec-spi as
 wake source
To: Mark Hasemeyer <markhas@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Raul Rangel <rrangel@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 20, 2023 at 3:55=E2=80=AFPM Mark Hasemeyer <markhas@chromium.or=
g> wrote:
>
> The cros_ec driver currently assumes that cros-ec-spi compatible device
> nodes are a wakeup-source even though the wakeup-source property is not
> defined.
>
> Add the wakeup-source property to all cros-ec-spi compatible device
> nodes to match expected behavior.
>
> Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
> ---
>
> Changes in v2:
> -Split by arch/soc
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 1 +
>  1 file changed, 1 insertion(+)

It's hard to get context with just the dts patches, but digging up the
cover letter and other patches from lore I see you point at
`Documentation/devicetree/bindings/power/wakeup-source.txt` which says
that devices that can wakeup should have this property. ...and our EC
can wake us up, so this looks right from that point of view.

Also the yaml file for cros-ec says it's fine to have this property. I
think it was used when things were connected via i2c since the i2c
subsystem needed it. ...so from a bindings perspective it also seems
fine to me.

...and looking at the code in Linux, I guess things work today because
cros_ec_spi_probe() unconditionally calls device_init_wakeup(). ...but
even with the code today I believe it should be fine to add this
property.

So with all that, this patch looks fine to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

