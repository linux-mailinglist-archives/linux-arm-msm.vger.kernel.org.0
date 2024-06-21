Return-Path: <linux-arm-msm+bounces-23664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F241912FB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 23:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFD7DB21325
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 21:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6291F17C231;
	Fri, 21 Jun 2024 21:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="asvAsQ/M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB17B208C4
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 21:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719006071; cv=none; b=g5Id6BH7KKZ2DgWgVMloneatlpgCsL2cjpKe0X0LgHItS8EMGc+odbCNDIsGRU60c91pwxycjkR+LeZWAlynoGvdEEonIK2jOcDJT4V6WFXV4mzSGcFXNZzp+cwtQWoaKVNHDRSqKJMrOKUMALhF/wmBqdnuuROuDtSiYqExx2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719006071; c=relaxed/simple;
	bh=8HrUb5me26sutWrvy5wgx4sSSVH7TI1dQ/80vVNZ/B4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCx3lH3Gcg9zyHRjYUKsYo8xdmOEBgPhN9dXY2/CS6eXs7NX0ZCt9iwI+WeT0txSwpf0R8WBWo3jcqGvIyLPNthebTrkgXdUI/heKUyy0eUL5BOf10jJrpUKGbeToMAzAjV9nsl73IU0bvXcKPP1GVAc1n4ZnGdK1kkFkdL0MBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=asvAsQ/M; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52c819f6146so3087347e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 14:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719006067; x=1719610867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hROpKLiZGwmIxWRNshgfEi2QRxXPG8amGi59yvS8gTQ=;
        b=asvAsQ/MtLx8z0fK5iyXkPbj8c9WbteWmwOFDDXGLaJTD36ZrpHd8sPoCVrIHHa1aP
         oCifICWVytrsvUbc+WaSwtIXksn9vEU9updAdXZspwSYf6zX9y6/Ry8Sx0SKzKYkmsUV
         MPLZog4A0MVtGgHf5Ur7D8dbGL4bJMOEHsuWVi13daynmbe2SayeHluVbgCqERKwalS2
         4BCZcIQjdWWZtue7GIIDtjtPkxVq/IBRV+pLgyYqVm9zl1PFcqTLJl82v6JJ3B1U+KRl
         4AS+zcq7h+1f8BxQEcX3MbJ6bgfAWk5IpJtNnHkoqCBeJb5GGVVLCQtAaVZxSs69I6zy
         Z0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719006067; x=1719610867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hROpKLiZGwmIxWRNshgfEi2QRxXPG8amGi59yvS8gTQ=;
        b=mquozfLWSXqDJ/xXovbf93ojJlwut0k4zrTFCtQ0l59eJ4g+RoDWBDw9Jx/XY4CyMp
         nFxuC+IUAoHarlcZxuvMioWHKvS6S79tn8Ne0zmy1v/k/Sg04T8PqQYN3D9VdlJ4nza2
         Le9SWizoZODVtVOQKgu1Z2WxQw8b0o1SJ89R55QUkD6zM0oaHm8XWpT1GjYd2DbBWklu
         AtGHVtagnqYUHWI6OYCm+2v650GQ4haOGU6LQLxfUHF3iUPkXDJIG++t0tVfFpfvgdA+
         cCAEMIrlekdqcpU43Z5LF+I1TTtoUe2ej0xQswmzB29KOo3YsYl7aAV9Oo1HjQU8Bqd5
         oNxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTWj05fckPra1zvDFHyn1jHRWx1N+YaM8cjodSLm7zmRdd1XeskzPLQ+wNXASVxAemguOHHwCekMQD82+WBTCkEgsScE8d4MSJR7UMow==
X-Gm-Message-State: AOJu0YyRqFZXutEsf9/pR0clsPdhfoDnKqEM05tq4AZipjoXpU6FEoSV
	MK7HB5/Npx2/I7Ki4DBdSj4dap09KnTPLO65kC0yPyqtW8y78BfaginvXJvERQ0=
X-Google-Smtp-Source: AGHT+IGZu5mpssPZ3r4bG4g5/RYkWfsJ/FKimhProEYhh7Vb8Kd9qOKiyGVurRnVfvriUHagrgoIYA==
X-Received: by 2002:ac2:4e0b:0:b0:52c:90aa:444c with SMTP id 2adb3069b0e04-52ccaa5f1a7mr7414029e87.28.1719006067210;
        Fri, 21 Jun 2024 14:41:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cdbdfbba3sm149508e87.137.2024.06.21.14.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 14:41:06 -0700 (PDT)
Date: Sat, 22 Jun 2024 00:41:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Valeriy Klimin <vdos63@gmail.com>
Cc: ~postmarketos/upstreaming <~postmarketos/upstreaming@lists.sr.ht>, 
	phone-devel <phone-devel@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Add Sony Xperia Z3 Compact smartphone
Message-ID: <otccxn3xdhoihuvleoofjptnq3jfwj6tdqu55n3tlg6xzrrp3p@x3sin3ebqozk>
References: <20240621-sony-aries-v2-0-dddf10722522@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621-sony-aries-v2-0-dddf10722522@gmail.com>

On Fri, Jun 21, 2024 at 05:26:41PM GMT, Valeriy Klimin wrote:
> This is almost the same as the dts of the Xperia Z3, except for the
> battery charge limits. 
> 
> The current on the l21 regulator for shinano is also bumped up
> to stop SD card errors.
> 
> Signed-off-by: Valeriy Klimin <vdos63@gmail.com>
> ---
> Changes in v2:
> - Reordered dt-bindings and dts commits
> - Link to v1: https://lore.kernel.org/r/20240621-sony-aries-v1-0-bcf96876980e@gmail.com

Please let reviewers finish their job first. It's recommended to post
once in 24 hours timeframe. Otherwise you end up getting feedback and
tags for v1, while you have already posted v2.

> 
> ---
> Valeriy Klimin (3):
>       dt-bindings: arm: qcom: Add Sony Xperia Z3 Compact
>       ARM: dts: qcom: Add Sony Xperia Z3 Compact smartphone
>       ARM: dts: qcom: msm8974-sony-shinano: increase load on l21 for sdhc2
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |  1 +
>  arch/arm/boot/dts/qcom/Makefile                    |  1 +
>  .../qcom-msm8974pro-sony-xperia-shinano-aries.dts  | 44 ++++++++++++++++++++++
>  ...qcom-msm8974pro-sony-xperia-shinano-common.dtsi |  2 +
>  4 files changed, 48 insertions(+)
> ---
> base-commit: cd214efd16e30bf1aa40ccfaaf9177f47dd21fd5
> change-id: 20240620-sony-aries-4a5bce06c91d
> 
> Best regards,
> -- 
> Valeriy Klimin <vdos63@gmail.com>
> 

-- 
With best wishes
Dmitry

