Return-Path: <linux-arm-msm+bounces-31017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B11B96E321
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 21:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A91841C22C17
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 19:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6392618D650;
	Thu,  5 Sep 2024 19:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ED/2RzV/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97BC158DC0
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 19:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725564450; cv=none; b=u7PPmnqD9cBKLAl6lIMd7Nzu2zggE93s0qpOzgMduEnmZIQUHki4UHbP8Vq5WjuQmTk2892DqKL6294TJ9RJriqeJpzzCjRqtteUjh+xgLmco/elkaWBW8CqZ6yclNJeYrCNpy0VFBgscH5EYZiAo00vr4dyShiuAkeFIgKCRmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725564450; c=relaxed/simple;
	bh=EqWO0LoKQ7fCk+H/1iilVvMhp1VzsyT7U/OqZudzFPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mBP2wS94QA+fvqIZhrNzpHy96F83L8DBXDQ+CBWA9JGUFhr/zxTA6ZSlbvy83IytJ2cYZfi+GUHmssaX+Q69G4ZegU5MU4LWIE8DvHkUsPxSRR+Oh++z+wHrTEeNsXFBYJP/JNKWbVWk79oQY8QEr+HZNVY93qk3xnA+x2hESTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ED/2RzV/; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f74e468aa8so10354291fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 12:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725564447; x=1726169247; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5EIjhQdsXuElGujdT/fGQkycfsGKTi0ULqGbScXRLkg=;
        b=ED/2RzV/usiVzUCqi0DujtF2Y1mT4TmX96u/TK9y/kAutqqojCVqrRzVB5Y070Thni
         msWLmZHNF+Xboas5lnHv6Mtk4oBrphN/NFHmkqP1+8pV8dzGs3s0SDA7T6Z4Ee5U/VXr
         ALOagy8I++zii28fSELKNCZS3c60vVvlYQhV6DN/9vtrQwAf3cV24EwR1HI2cwe/LUT5
         0/LSNN7yoQx40S4pMfMVqy7YDs2QUdo2mBBq5uSZaTwDxFXMxick8AsC2+slX4mRG78S
         A/hT2wvrCZFWw3UxFZCp6Faya17mN1a1vNZlx3R752SFSLQDB2STw0QmPeJooK28diGM
         KnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725564447; x=1726169247;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5EIjhQdsXuElGujdT/fGQkycfsGKTi0ULqGbScXRLkg=;
        b=lB6nc4E5f4T3Okq+dhbkmDe6SRF1CCghxK0MnBoz5/5G8O4Nv/1ihVRZMFffVd/AC5
         zkcPXN7QkAr0/HxLMJX9Oc6o3wL5JkL+mtUnWSFTY+8Cqec9w/ebizSKck7X3wzg8Jdx
         VIzk3o1PqrZBmZ86LliUahXkd9PANfJOtoZMpd3PXX0B6a/gu+WS7HH7vMcONbrodBBG
         FG2n9U1+5ynHEl1kBOj4KHTVPS1IROO5OCjUTcyJsar4dPnYOKRyItcyubdwP5GaDvgj
         107HAP3/psaD6SDQ8fNKHD5aOciOqKhFhYopYlqK/mMytk0o5uduQVUxejyZBam4fuLS
         qRjA==
X-Forwarded-Encrypted: i=1; AJvYcCVGUtMm96W49XRDjNBeaLP5CIqmx05c/ttCuJi7G+uXn0mS+OuFqstRF4G7AMbhekI01MjpCzC1wlv14hDH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1EjFtc9Uu5IOASg9C9fQ7Vz4Um7rUM03vJVikmgq9erLgQRoN
	iq7hKJqvgNdUlbtMUF6ImT9lPcd2aTyLvXITKK2fwkpQgKq6bynGKsVf0gbxeLL/0WqtLkYBDs1
	Z
X-Google-Smtp-Source: AGHT+IGQ+cRNJ0xKiU2z0Dr9zj0XzfGZObu/j9nNfYcNhOYCXStDcXnxSVIM6qPrJFjzbrQW0OFitg==
X-Received: by 2002:a2e:bc0c:0:b0:2ef:2b06:b686 with SMTP id 38308e7fff4ca-2f75230ccffmr847021fa.17.1725564446500;
        Thu, 05 Sep 2024 12:27:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f66455d67fsm3381831fa.99.2024.09.05.12.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 12:27:25 -0700 (PDT)
Date: Thu, 5 Sep 2024 22:27:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Johan Hovold <johan@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sc8280xp-x13s: keep less
 regulators always-on
Message-ID: <n7scbcdbse4m4rilkegqsinallgkryayjzqojnxtr7qozgxwp7@7mgropizypbz>
References: <20240905122023.47251-1-brgl@bgdev.pl>
 <20240905122023.47251-5-brgl@bgdev.pl>
 <Ztm6fzmoeWcCpqvi@hovoldconsulting.com>
 <CAMRc=McDHi5EVpBjsuFE+JHgBhh84tsT6xr5PWO5yeU8zbS99Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McDHi5EVpBjsuFE+JHgBhh84tsT6xr5PWO5yeU8zbS99Q@mail.gmail.com>

On Thu, Sep 05, 2024 at 08:23:39PM GMT, Bartosz Golaszewski wrote:
> On Thu, Sep 5, 2024 at 4:04 PM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Thu, Sep 05, 2024 at 02:20:22PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Remove the regulator-always-on property from the ones that used to be
> > > implicitly needed by the on-board WCN6855 now that its PMU is modeled in
> > > device-tree.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 4 ----
> > >  1 file changed, 4 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > > index 88b31550f9df..1a9dac16c952 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > > +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > > @@ -479,7 +479,6 @@ vreg_s10b: smps10 {
> > >                       regulator-min-microvolt = <1800000>;
> > >                       regulator-max-microvolt = <1800000>;
> > >                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > > -                     regulator-always-on;
> > >               };
> >
> > What makes you think s10b is only used by wcn6855?
> >
> 
> I didn't say that. It's used by many components but they seem to be
> all described in DT. But I get it, the schematics show it in so many
> places, it would be risky to not keep it on.

Well, that depends on the consumers. If all consumers are good and
voting, then it should be safe.

> > You clearly did not check the schematics so make sure you verify the
> > rest as well before resending.
> >
> > And if any of these are valid, I think this should be part of the
> > previous patch.
> >
> 
> At least vreg_s11b and vreg_s12b should be fine. I'm not sure when
> I'll respin the series though, we need to first figure out whether to
> upstream the calibration variant property and what its name should be.

-- 
With best wishes
Dmitry

