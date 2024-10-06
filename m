Return-Path: <linux-arm-msm+bounces-33283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 544B4992135
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 22:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06B0B281A39
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 20:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F60D16E863;
	Sun,  6 Oct 2024 20:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="po0HuaPA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BED16F265
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 20:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728247048; cv=none; b=FnQzkIF7LcdFM3NMX3we1e8wzb0U4GXtj+fd1+5sghXzO0gXteB5h8ANmncgWVpc9rle/9Riy3Qa/8csJGRkEXhwdmKZ30Ewo/e3iuiL4dKRsUE4ofH6xsWJMM0uiPqyfvDkMFgRn2UdmP3yuxWma6fJ4wvVDfehVpaT13aB1iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728247048; c=relaxed/simple;
	bh=M8XFZ+XZu6P9eWWlD53BLavuApuWrkIDcfjsGz1vIG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHqKxO1CvrDq0U8XN31IhqKSg3YEhEyhFrZI3YUEVHEDw0i739R0WDSCKagBJ+VcKD9SdH1CxOxhEsaRBtGjenOHjhHbNjgtjBZv8HGwINx+M6kusDL+gkahSVUUJviS+4q2uJWBuv9Kb5+iptJAkgUp0EURCKn0Ev+H9dOy3sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=po0HuaPA; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fabfc06de3so39719361fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 13:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728247044; x=1728851844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0KcY2mGkv8zON8tiPzPr+aw+bAMCypp/7m9sSR46t+M=;
        b=po0HuaPAlK01i/UHiyzWRdyQvGuCISqw6fUlrbfW5kUS3SoNIAkEenDHcOdHoPzhve
         +/54kAu36sNYkPsh7Y+9fq3IZ6kdF6pQk7C+/vmkR5CJRQ7wl9H2S4NU8/OIRbRo7C4d
         3rS+VnMulZkUSMPaoTqXz1LC5FT2vlHgQiCmHhMO+0FThDNMxB0kl7rVhDI/QBL1T0Hd
         iU51ny6SBkYf5brSNeVIfhErsVEhbERR8TeMzNhIy0ibu/oMnzeyepbKVn992d0MgTvl
         tPWPbFnvWuc8pBy/OaUqRdsypaJDpz8VIcDRMwXdovYd721NZeF23tT04Qt5iSAE12V4
         tLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728247044; x=1728851844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KcY2mGkv8zON8tiPzPr+aw+bAMCypp/7m9sSR46t+M=;
        b=U9qHBcZe0chJI6dAMQtwUXMEcT+pvCCwrmhWaH4U98t98P+1pUj9P7nig8FLscsxsJ
         x38eamn1RH0R18GR5R8DsHe0Pfc42E8Z1IBmGzk0NqSI4fzEuaX4KjWrSXVoMTQJOnq/
         ptrIUWI/X8STmKKuVNKYiJv7NJf43586LRn1mMIftJ6CHwK/VRyLOWxI2oZxCjCAFF7b
         /aPm2XFxL8cqS4PnJlN5Y+pnKYylVpu6wg0aeL46CfV65Mx5PlUzlsh1qrcrK+Ng/zrk
         VsA9gAnQnhiBDbDxPxng3XxElcJS1eaTAO3HRcYwwaeUJ7hQRXt2oTEykQeLD6wOJ2Bu
         QSaw==
X-Forwarded-Encrypted: i=1; AJvYcCX3XpPvtm9S8x0MtOJqvJ8ZeQtspJt7HyEi/5dTVuGY5owpbtVsBn2qzJSCZoN1nB0seOhERrtbHCOfk+4+@vger.kernel.org
X-Gm-Message-State: AOJu0YzS17t3ZcK9HEl0mhYlsiAgj3i9gCjwLYscGYA5QiLbGti4bYHL
	kfZAqVo7dToFevsibw3JT8ntHM3oaB8x8cwlyTCcQjl9PsFLEQM/9rgNL/4nxRg=
X-Google-Smtp-Source: AGHT+IHDxJfaAaiHj0TzwVkamnlQWohsnVF+S0nchkFV9KcYV06WShhTWAJdWVE2OCF/8RaOR/iHew==
X-Received: by 2002:a2e:be20:0:b0:2fa:e4ae:3362 with SMTP id 38308e7fff4ca-2faf3c1403fmr36583341fa.6.1728247044068;
        Sun, 06 Oct 2024 13:37:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9ab19desm6156211fa.24.2024.10.06.13.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:37:22 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:37:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org, 
	bgoswami@quicinc.com, lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org, 
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org, elder@linaro.org, 
	krzysztof.kozlowski@linaro.org, caleb.connolly@linaro.org, linux-kernel@vger.kernel.org, 
	a39.skl@gmail.com
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: qrb4210-rb2: add HDMI audio
 playback support
Message-ID: <a3y3glcauxhsbpwzbglbrtr4khnyueoxvf6kitxn46zzpy3css@qmaircmfrlqd>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
 <20241002022015.867031-8-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002022015.867031-8-alexey.klimov@linaro.org>

On Wed, Oct 02, 2024 at 03:20:15AM GMT, Alexey Klimov wrote:
> Add sound node and dsp-related piece to enable HDMI audio
> playback support on Qualcomm QRB4210 RB2 board. That is the
> only sound output supported for now.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 55 ++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 

[...]
> @@ -318,6 +365,14 @@ &pon_resin {
>  	status = "okay";
>  };
>  
> +/* SECONDARY I2S Uses 1 I2S SD Lines for audio on LT9611 HDMI Bridge */

Nit: LT9611UXC

Nevertheless,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +&q6afedai {
> +	dai@20 {
> +		reg = <SECONDARY_MI2S_RX>;
> +		qcom,sd-lines = <0>;
> +	};
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

