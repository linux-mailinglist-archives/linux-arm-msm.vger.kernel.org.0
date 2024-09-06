Return-Path: <linux-arm-msm+bounces-31184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CB096FD78
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 23:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABD1CB20804
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 21:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B4C159571;
	Fri,  6 Sep 2024 21:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NCOPJwq+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56FD14883B
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 21:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725658628; cv=none; b=G1HcGmfRuEFaJ30/JorJrCFnciJlSr++9lqO31iFPybZD1J7G1d84X1L0GQk508OBiB2R/52wsHVA2rvYO1JooiGbgk05o57k9peB+wK1ju3MSrCfNFVVpnjs5YK9+AnJ59715vAHRfRCoEpHZ0OjNBQGWt2gl0aCVNZwEKIzfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725658628; c=relaxed/simple;
	bh=0ZgKZs4rF3oVvAvJx+D4IPYRW/9ekQuSaC/jCDWEZ98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aaR2g4HU7/S9uRik0rR6/keEaq3G5An6njabBO84tLp/8l6puVq4/N+9vVGuRfLG/+obdXNw4F00RuIS30u9U5OU/NS9fPDCrXWJTVevWxF1Snt6iWWScIgdU3NAHTA/qi0uFH1bNTkW7WSXD7Xl4fraGfEDZed+/M9YqEuGkQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NCOPJwq+; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5334b0e1a8eso3008363e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2024 14:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725658625; x=1726263425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xqhH3BWBw+AefsrmQfYYHhnyb9JUlap6lKEip60G6ow=;
        b=NCOPJwq+EpsQgtmQsqFsuVdlQuRq0YcemJBwtF2OV/8Yc89v7T2SY1nr846Nfemhmw
         zs5rlKUk9VPlCi2FWdTqt6oG1nkgmQiEbleHlJroUkaG693VL0hZq8MlMHb/YISfF9JW
         xWx+PKpUlROlrJNYEe5EWsKmMZYm05CHxUS0pXZYD0qkO7oojX815gNhJKsac21KZthE
         9NWTgpnVq+/8oScLyhrhia7HIak2/pk+rToBTe98PHROY2AHoWm+U6sv4szqm8M5tmrf
         TyvYdBTh9v3zPyrg3QPCUk4JOyfQgo86CkZJNPUWtnktSzGvL476di3UCeEthJgqJuVa
         Ki+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725658625; x=1726263425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqhH3BWBw+AefsrmQfYYHhnyb9JUlap6lKEip60G6ow=;
        b=TzSddn+OzJyE/K6bdJts9+UWxJFHInONzNu4Ab6OwKw4esb27c/aTwYj5lUFRVr3oD
         YE3l1PSfTDRCXApUHpek+RUv6KIROHcVAh2RBxyrnaCxBdQhbbBphfS5RuMu7Yyo5PAE
         QIqGxHM53ir+sYBagUdA+rcHe3ubz2arX2lmVFjLbZZNYD8VT1/B1EBvijA2/fmDD2S/
         DKlW0hzAwuqHCLcJmbbIgn1kEElN8tg7feGen0g15l8L07PKjH3ElVxijrHW8Jjt0c6R
         wpkm0T6GsTp0RXOAQ/eDtl6U9tDv9gZFHp4CsqDE3MYXmqFYqwt40ORTpl5tj0+hVZtT
         tOlg==
X-Forwarded-Encrypted: i=1; AJvYcCVeMwj2BhyuoowhXTMlJJxX1wfhApLMXUa5+wqG9rSBq2jhmnzfNT5XXnJJdaqGpqcNWbm1hyKpdt0zDglT@vger.kernel.org
X-Gm-Message-State: AOJu0YzhcXX/KhDss9RyCpMmegRBJtW65n09fzNwjF0buzASUKvE8iuo
	mlhx8igANcXXFQLYth9n6IBE6RM2diWCZYV0W5QZczjZVdAx3UaOp0vGwD0bAsM=
X-Google-Smtp-Source: AGHT+IH+baugswl99mWw7eWQU7vn2q3bbqccxjOLIAxP3wxeEVM1/WxhpuQF6wNva2ks7ePoVer43Q==
X-Received: by 2002:a05:6512:124e:b0:533:3268:b959 with SMTP id 2adb3069b0e04-53658805f76mr2485245e87.53.1725658624038;
        Fri, 06 Sep 2024 14:37:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53654e344e1sm435576e87.232.2024.09.06.14.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 14:37:03 -0700 (PDT)
Date: Sat, 7 Sep 2024 00:37:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Dmitry Baryshkov <dbaryshkov@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, ath11k@lists.infradead.org
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sc8280xp-crd: model the PMU of
 the on-board wcn6855
Message-ID: <on6dwkh3mjbc7dmz2ackkgqcmxpntr62aoduhkd5ue34y4vjhn@hscbtjerfhge>
References: <20240905122023.47251-1-brgl@bgdev.pl>
 <20240905122023.47251-2-brgl@bgdev.pl>
 <6vikrqhdnkefzpahhhtz2hpi62jvcwnzclm7touwtnpxdzvgrf@uc7r6a7bbjek>
 <CAMRc=MeijX2by+MS_vq_OVx25JO6z=zNfymta35h11mbm=vmtQ@mail.gmail.com>
 <CALT56yOP+un5nkxuirJVg=gr7fo4Hqjt1ew3z-=F2J_Y_RcTqg@mail.gmail.com>
 <CAMRc=Mci-8R1Oe3Fe+1E+K-7khzwBPgn_8SQSUPXthpE4032Pw@mail.gmail.com>
 <d6d5a943-ab29-4034-b465-b62d9d1efa61@kernel.org>
 <87v7zagcyf.fsf@kernel.org>
 <ywn7bq6j6jgokwmm3vsumkuwijplezmery5tr6z5yeblnpyjh7@djkwdbt4sl3q>
 <ZtsXUyBRV9yDeq1P@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtsXUyBRV9yDeq1P@hovoldconsulting.com>

On Fri, Sep 06, 2024 at 04:53:07PM GMT, Johan Hovold wrote:
> On Thu, Sep 05, 2024 at 10:26:04PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Sep 05, 2024 at 09:41:44PM GMT, Kalle Valo wrote:
> 
> > > There have not been really any naming rules for the variant string, it
> > > just needs to be unique so that it doesn't conflict with other variant
> > > strings. What have you been thinking?
> > 
> > QC_8380_CRD (following DMI / Windows name) or QC_X1E80100_CRD (following
> > marketing name). Or maybe QTI_ instead of QC_. WDYT?
> 
> The x1e80100 uses ath12k and the calibration data was recently pushed to
> linux firmware (and does not use a calibration variant).
> 
> This thread is about sc8280xp and ath11k as I guess you've noticed by
> now.

Yes, I'm sorry for the possible confusion caused.

-- 
With best wishes
Dmitry

