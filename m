Return-Path: <linux-arm-msm+bounces-40216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5085F9E3828
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 12:02:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 361E5161BEB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 11:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999151B393E;
	Wed,  4 Dec 2024 11:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tCPj1Nc1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E2E1B3920
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 11:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310104; cv=none; b=WZvRROQ9zgyjnYLSQzaUcvXIFC1vKR1L1471A+72uYZ57Z5t8MoDwpqHVq1INSme8y9Gku2XnVzKK9PdefThj6K+UGceKIhBktH52cpd43dodQz09/JwxxdN9X5/QlSvD9SzQNU9+DDTKAAUJbEUDsVH+TJC2hTEdHEjGY2F/EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310104; c=relaxed/simple;
	bh=ccqc+Ze9+qmkyBvf6ra1e4vxsoQ7jIJam/V6QbyKci0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWC9MAAWFHecCk9kyQjA7PzkgC65aQjXslMY1hJFMjeawBTHSW5vwgNN1qK9JSxsNJcMpqek1v/KtSCbRzeOg5mimbV8QjgGdql3HHRyho6zAES+pEXbcSDw8n5mvSbqZGr56TcxFcVvcQcRMzRAQeqHRh3/+ElQ0HV7+UwmRAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tCPj1Nc1; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53de79c2be4so7985405e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 03:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733310100; x=1733914900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fw93oX49gMMEDlFVw9bAOV4wOGh1pqOG8Ei8VVa+TEA=;
        b=tCPj1Nc10uv0XAie/MBqzuuk1zeW63KXHicYhnF8iQVPeWdh7ZFyGZmAdkcyLpxX2e
         NPdV9UOIT7TB+IJei9HIokCBIN4Gox8UXAJyF2ocJNor1r7gzHRfeI2TXj8ahd0K/C/V
         8awx9rIjX370Ia42f1ghXcHBgmBHe+zQVwFsVZy2olDhaoJbg4nNkzob05/DQXNw2sob
         nAlpdOtvUcEUDp9gHQXgh/i/2I9oBvctbV2wVI1ta9awIoxXQP+4gsXeidh1ypO/JAzD
         uWw/v7k5yTlGZ/yH3az0/902h+fzXKGDKl9iQ4K9BXj/ApG1TeOiI3JuxX/jlmLcSSoo
         ioyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733310100; x=1733914900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fw93oX49gMMEDlFVw9bAOV4wOGh1pqOG8Ei8VVa+TEA=;
        b=LjhaZW7vIN/og85vF9ned8jKfqQ/CcngHOJCs3lfExKeb1CO5dEeCEBI88fYJrN9Ov
         D9/ag6Zx4OFf/hy/OGbHdbJpMYS+00/IDVZ4vgfReWoaRZlgUYbTcHQITr35Lx6s/C2z
         xX93g5Yp6BaeWE/JcQnOtFS8gTppsmcmN5wDVFtegEYxcNFJ9d4gZCkWpu5WhrnTsKub
         xfQDffcmUNonjjyThT6pdD0DRV/RTls7wZdWeFEiFWAzj5ryKeV+tww0Wt3lzShRdMBc
         75SM1UaIGaeQ/Z+7XItqxRD8agLlXLtuLe4D2iw4MoZig5i74b25aBlhuiXK4LoLIKL1
         ZjdA==
X-Forwarded-Encrypted: i=1; AJvYcCX+RhQ/895If9Cp2YO/DzcQU+yQpCyohaUpCEero5+md7rgL98i6ABKfZ5rmU15nNsF54TTvEI9RRebTObA@vger.kernel.org
X-Gm-Message-State: AOJu0YwGyn5X2gl2yD25hdqlhPGl4zrwigMdW8oLXzc3e06cBYtOBZfH
	LeZAm+3M2kYC/0CAIwxvHZkUdPf6RDVygF1az8E5VdgQl9fNJ3aF7Ca27akiyY4=
X-Gm-Gg: ASbGncsyM16GKpKZ1612St2gC3ypnIsq5wLxkfJFOmb7MBm5WNA2jD5TXw0+MUrE3Hq
	18Oeam4E6IEMCg0AvZijyxypj8aweS6XmDn0hCPpdxLJJ+vqvVis8ds5kIBA9yxvxnSzcVfTBW9
	QvQ8M4c520tMwfHGskdrM7LHFxv9R2ggO+ZY7s4VkfrjbFa+J249UoE/ze2buOndxw/CPwsF/d6
	H2WLGhLLWzpRQp1/zhG+vwYMewY2KzRz8A3AdYzOSR0yAdtSQQlLGhsvgUm0olZqVNNiK6PPm/3
	iQoOCA9llztLD4PjMYQrQdyhwgd3pQ==
X-Google-Smtp-Source: AGHT+IHXZUMXi1zd9eHxyOwY1U4Jc7Xk4uPxg84MZMiLNKxWD9azrbXOzcfpS+KjwK592lxt/bVSpg==
X-Received: by 2002:a05:6512:3053:b0:53d:de1b:f961 with SMTP id 2adb3069b0e04-53e129ed30emr3418458e87.7.1733310100403;
        Wed, 04 Dec 2024 03:01:40 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649687csm2123316e87.209.2024.12.04.03.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 03:01:39 -0800 (PST)
Date: Wed, 4 Dec 2024 13:01:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: qcm6490-shift-otter: remove
 invalid orientation-switch
Message-ID: <gw3cex4hfdkio3slle6iipod3hwrvo7ju2o2kotkbrf632c3za@cvc42mgvkync>
References: <20241204-topic-misc-dt-fixes-v1-0-6d320b6454e6@linaro.org>
 <20241204-topic-misc-dt-fixes-v1-1-6d320b6454e6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-topic-misc-dt-fixes-v1-1-6d320b6454e6@linaro.org>

On Wed, Dec 04, 2024 at 11:56:53AM +0100, Neil Armstrong wrote:
> The orientation-switch property is not documented in the PHY bindings,
> remove it.
> 
> This fixes:
> qcm6490-shift-otter.dts: phy@88e3000: 'orientation-switch' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/phy/qcom,usb-snps-femto-v2.yaml#
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

