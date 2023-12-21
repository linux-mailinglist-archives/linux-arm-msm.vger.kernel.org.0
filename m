Return-Path: <linux-arm-msm+bounces-5686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A30B81AB90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 01:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FEB31F2230D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Dec 2023 00:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90EF522D;
	Thu, 21 Dec 2023 00:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hUPSVvmz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F63F4A18
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Dec 2023 00:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a2335d81693so43785466b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 16:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703117489; x=1703722289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mYEduXCSX53GxkPa+3HzLZx264zuWEFs+pArKbO8ws=;
        b=hUPSVvmzb1+/bAanusHAmMeqR7eIcpU7PL6u30fPIjIp4EvhwkE4j1yYxKcJ8f+MvZ
         qEOIzUCBJrMoa6/PHW8L/r0BvqFsCRC9nCh8ZwSxBiIyYsyPvjlysnEAOSnq3tDdZrXx
         AB5TXz4XfP9C8Pdzxe86BNe2ZHe4G2QHJkwnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703117489; x=1703722289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/mYEduXCSX53GxkPa+3HzLZx264zuWEFs+pArKbO8ws=;
        b=HBhgJUGL0PfK38yMcSWaqr1Jx0zd5bqrn3E9Rjq0aVxt4aiyrrruu5RsMjwtCw+vzJ
         zalAN8/2EirnubnK54T1/Sf0mBVjdT0xtqDeDXuGAHR05k3ufBXCijZTPtrIrU53ylgb
         BvsIOSgM/Zon3C91Ccazzh4kGhQRtsrtNtwZVR2sdGMTiYpVxglLgB3xc8/3eDB+BBpg
         Mfnjrnkt8pRJ63hxOEOv6+PKX3t1B2cMRpv5xsw+sDXVdiLXelaSI5kdPe2kZckapsHq
         yukoQgKgR++lE6Uw/KunFXeSMjhKmPnrHfCLUw7GLeYv/OUWeThP296qHAyANITeSOYq
         iUXQ==
X-Gm-Message-State: AOJu0Ywrdd2dxdHVecmBhRWGphcedB9qj14ckDBftF9OVA153Cumw3xs
	o1Qjz+Aj6nsbvcxciQBhbspDsMvR8FQqZzeUz+z3lcq8
X-Google-Smtp-Source: AGHT+IHWxQQlw1ABzrJMujvOx/vU7uilH/4QqFxvsGCWFaYtdCCDyth0sdpbfCRWqI1YUKdiETb4ew==
X-Received: by 2002:a17:906:73cf:b0:a23:3653:832a with SMTP id n15-20020a17090673cf00b00a233653832amr3550126ejl.17.1703117489496;
        Wed, 20 Dec 2023 16:11:29 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id gi20-20020a1709070c9400b00a26a25d9205sm202208ejc.16.2023.12.20.16.11.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 16:11:28 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-548ae9a5eeaso1874a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 16:11:28 -0800 (PST)
X-Received: by 2002:a50:c316:0:b0:553:773b:b7b2 with SMTP id
 a22-20020a50c316000000b00553773bb7b2mr3837edb.6.1703117488506; Wed, 20 Dec
 2023 16:11:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220235459.2965548-1-markhas@chromium.org> <20231220165423.v2.15.I870e2c3490e7fc27a8f6bc41dba23b3dfacd2d13@changeid>
In-Reply-To: <20231220165423.v2.15.I870e2c3490e7fc27a8f6bc41dba23b3dfacd2d13@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 20 Dec 2023 16:11:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XwT62H+eBH-PRfQPH-X17_BmWQd5wrHTj6o8Zxkf72sQ@mail.gmail.com>
Message-ID: <CAD=FV=XwT62H+eBH-PRfQPH-X17_BmWQd5wrHTj6o8Zxkf72sQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/22] arm64: dts: qcom: sdm845: Enable cros-ec-spi as
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
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

