Return-Path: <linux-arm-msm+bounces-34305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8E399C731
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 12:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB3BB1C22A99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 10:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C084156C5F;
	Mon, 14 Oct 2024 10:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fLxbFT5s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74D31527BB
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 10:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728901813; cv=none; b=Z50DoAc4/8WJA5pqmWl8Ilscz6sOq2HX3xW5S4s0YUePiuLcx97N9/SuCp2UUl3X20uonzDrCm6Z5NDy7vzk2iWM0/AFFHO9o35qI5kFl3aZDmMrX09s01k7ADhRi/bo+2Q9JIc1z2J8eUxIduIsMnFBiOig95iFaz5mywmTXNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728901813; c=relaxed/simple;
	bh=tz2LqPHuWMHh/NwMMdHPCGmudZGhiu7Rh1gcC1Ub3A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgV/IEb/Ranopu1U86SMuS5Qgas60spa/KQYKdyBdZIKwHYCRDZTzrRLBNcSKsvJAJZ99rZv3XqhG+9pvIla86tWO7aIlvxi11z4ntFKBucU19HeK50jig9QhJTSpay9GI0HPDGwEvwJ3oNZp0wr2tWsNVPYh/UwN6qWWvmcyrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fLxbFT5s; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e8586b53so1300112e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 03:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728901810; x=1729506610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2R9sH+nvSjX+IXd5b0gVjziMnmRwq2EeQWQKDtToq3I=;
        b=fLxbFT5s1UBTjijn8IyOk2oxZiRblszywShMbSklzQKl52vgHbzhek024iCCiwPZYN
         oG2xlkDkGM6dUvaRmE0IuhvUgVCCbT8AaJw5CkAi2NvytQ7CxjPogjWdjQbryoXqWF9a
         SExEXSz53hRFBKSox9OAs5vvNIX43s1qs3jMB6SZPXlRXcDJKUE5E/m8k49S86NTUlFH
         YIgXhs0XNdEJMR5EQVqHAueJmaepAtAyrID0jta77gvGA4/zPXdSyts73t2G8ZUFjjIJ
         hPp6V9z1vBC8Qb+Ywhu3es2tG5Hao8ngJyQtkg1j7HSFtQOm72KD0LsxdnwP7mmI++n+
         oAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728901810; x=1729506610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2R9sH+nvSjX+IXd5b0gVjziMnmRwq2EeQWQKDtToq3I=;
        b=Uo+ac3uoj0oq5E2L8U2iDPmeLzHNJMxLs2PEPxE98zp+fKj42U3HCQNIo5WYshwGfS
         GMSliTU+6MJtQbcon8vbe1j3KEQvvLH+7TbvTJba3Jn3yWdKJZHqyFDttnDbups6kS/l
         SV16974AzY+37ojEZZP692qPFHDQBUnpyxwvujcFmz8FaoMPItgOlqxLaLM+lwJeMRQj
         BPIu89GQ7Ql/cmsFNEJUNjB6Y/DkiV57VWVRIuVBLYXpW6heiFRyBiElzU0fFqigchzV
         IDjnSsx9W0xs+dvl4kn2S/dZAQqRHsy4EEgVwEKQlb3uATDbpfqqW3FRbSYBToHeu/38
         eEXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzKNr9vY4yvtGw4KWE32tfk0n+nhPawtSaME9kNhm45Sg8pzJfUFHwj/5qAgHKsZWs7Z35n3vAUFqGPG2c@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmv5fE67YYKSQbC1bZAQJ4Y/KuGpksk81Vdu2ZpthK+stK/shU
	cNbq5mf10Y5fSUisk1qudDHkDzAtvUk9f7vwvUM53hm2krxMWdRyryGu6MG6bEI=
X-Google-Smtp-Source: AGHT+IE2gzHtSR8kqB1Rqt7Z7/00UrmB0FciQn0UQureMPDe4MXR8IcMv1dYY0kS6M8oBpdbQilNHA==
X-Received: by 2002:a05:6512:3c99:b0:539:ea18:437d with SMTP id 2adb3069b0e04-539ea1845ecmr1507195e87.25.1728901809774;
        Mon, 14 Oct 2024 03:30:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539f1077ef7sm540370e87.15.2024.10.14.03.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 03:30:08 -0700 (PDT)
Date: Mon, 14 Oct 2024 13:30:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: quic_fangez@quicinc.com
Cc: kernel@quicinc.com, quic_lliu6@quicinc.com, quic_xiangxuy@quicinc.com, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: display/msm: Add QCS615 DSI phy
Message-ID: <34jwvxxycm2mi3tqndhuoapth4u5nbn4omsiaxxrh2iapwuky6@f7xttrmt7w2c>
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
 <20241014-add_display_support_for_qcs615-v1-4-4efa191dbdd4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014-add_display_support_for_qcs615-v1-4-4efa191dbdd4@quicinc.com>

On Mon, Oct 14, 2024 at 05:47:30PM +0800, fangez via B4 Relay wrote:
> From: lliu6 <quic_lliu6@quicinc.com>
> 
> QCS615 platform uses the 14nm DSI PHY driver.

- bindings describe the hardware, not the drivers.
- other platforms also have 14nm DSI PHY. Why do you need a separate
  compatible?

> 
> Signed-off-by: lliu6 <quic_lliu6@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> index 52bbe132e6dae57246200757767edcd1c8ec2d77..029606d9e87e3b184bd10bd4a5076d6923d60e9e 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> @@ -20,6 +20,7 @@ properties:
>        - qcom,dsi-phy-14nm-660
>        - qcom,dsi-phy-14nm-8953
>        - qcom,sm6125-dsi-phy-14nm
> +      - qcom,qcs615-dsi-phy-14nm
>  
>    reg:
>      items:
> 
> -- 
> 2.25.1
> 
> 

-- 
With best wishes
Dmitry

