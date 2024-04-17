Return-Path: <linux-arm-msm+bounces-17654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C108A7CD5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 09:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71B671C203B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 07:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 309326A332;
	Wed, 17 Apr 2024 07:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FP9x86cC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8B56A333
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 07:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713337819; cv=none; b=K3VQo+wRFN2YHdByUtPAC4pNHjfJQGPbeK88z5bz+kSZKiNQgzhAndh87F/dY9GZNkefXFRpjNztxVd3qYKKkTtesT+XA4MJXPx9QkOE90fFbeurcJhN5Ct0DlYm4Jk45gwZZRAYONUNaL3wwl9AwYC6YPlekiMuN/C4i2VP2r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713337819; c=relaxed/simple;
	bh=+Y0iqR7HFf4hB2KOGcDJrRl/HNxYW1gDznkvy2V9TSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eDA94gty9oxGjNlBkLD7aC7hgUR53gZSnqL4yEyJecN9thXdl9hQCHTGg8hDnnfnV0FfM4z0cQrmWP6dat5wswABj2DNgZDZ+bKJCBRacHAPy3MPM+ZI3IfzL4g+QwBBl6KFEZ5DH32Sw4EBc6h5COg5dPibIyrCpB/1jVuJ4Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FP9x86cC; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso4702378276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 00:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713337817; x=1713942617; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9J09KpeDgDjyH9FWWr8U1Cn4ABTaxhVMMwzeJXwwtEs=;
        b=FP9x86cCJbBYDScAbGunz5/WrSUbJZZZ627tDCZmWM9kGB4hloXOLBcxHVFLddJbr3
         ECf+Cnv/1sjuLVqaciywrrKBP3crl8rGu4+NDqKWeovHSOLvz8TrLkUPl9v6ZoHZC++3
         PUNF8UV+cmrm03moMw+2nAdhZUNksTDVTaCeQQzWs2BE0vCN56LWIW1bA49cTTNsLuop
         UvUft8VwRZru6fU5DQEmZFymbA34g1Hl6ZCu4fJCTXkfwCoy2QHvksV72emZY8WkFUdv
         zcicTSn6OVRoQVMT7vy0O+ro2irDpS1EtmUWhB+pxaRwvz1tElpV87Zy465RgdywqdMK
         2iYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713337817; x=1713942617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9J09KpeDgDjyH9FWWr8U1Cn4ABTaxhVMMwzeJXwwtEs=;
        b=uPrIPlg8snH+kOBFMCHANjJm8h5GnjYtReztJ6Tf2cMVul4Idc0pIF0SjZflEGcAS0
         dpultrqAUClA3skLrQsCTVp8HP3L+At3QCkPDj1H1qaRsQvhVn2UZLd+5evPn9ns+TpR
         k2l6meHZL75DCWZB7w0H/iqREw3SkdO2jQBunWw1vPXtCmtRNKb/CXD1sGrm7skqbY7v
         zpDtPfSl3hUj/RexT0gHv3RgB5S4w4fRM7J27iYdpZUxi6r/xPb9xB3exNyoW0OX5LTR
         0ZrsCCMQGWjFzA3TDu7/1HQnh7+xxGFpyxq3D0AbBmsjmdv2sn39x7PsTX2n3B/Vgzez
         bxiA==
X-Forwarded-Encrypted: i=1; AJvYcCWVHhX+Q2IDQgzmqI4ORH4jG9AIExeMop4efl8oq9Q3ubhiZQ6NzOE7NviBKQfdFOV6Yz/rmBD8ey0LyhdHPMxrLcHsbK/qAxci6EpIOw==
X-Gm-Message-State: AOJu0Ywf1d7NegXhx0Vm3eERQvoB9/J7eDq5Je4CcOU6+RmKp3/A6/Wk
	ZlFQI4iv13Nxg7Ks1xFpdd1GbQETMZvLDKh/9iYMzMDO0c99Lb2+kxoPHdbUJNlu6HCo3CrYUNC
	5qsJ8PNY3C0+YfR6wYRIhyDjVhHKWiMadTaqzKg==
X-Google-Smtp-Source: AGHT+IEZv5YSqx+LImrF2h7ffWPm89GX1T6+xT+mi9Bj8gAZG/QNBtQXHiaYMKy5GPgTNcymEmNVCDMVhh0WM5BEwQo=
X-Received: by 2002:a25:ae1f:0:b0:dcc:57ff:fb70 with SMTP id
 a31-20020a25ae1f000000b00dcc57fffb70mr14735096ybj.60.1713337816685; Wed, 17
 Apr 2024 00:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415123941.1527938-1-github.com@herrie.org> <1158f240-ea6b-4ac7-9697-a30d27311c50@linaro.org>
In-Reply-To: <1158f240-ea6b-4ac7-9697-a30d27311c50@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 10:10:05 +0300
Message-ID: <CAA8EJpoAawTDCED3A4mNj0FkyQddxvaiUeY8R4KXmPQncufUOQ@mail.gmail.com>
Subject: Re: [PATCH] mfd: pm8xxx: add support for PM8901
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Herman van Hazendonk <github.com@herrie.org>, andersson@kernel.org, benwolsieffer@gmail.com, 
	chris.chapuis@gmail.com, Lee Jones <lee@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Apr 2024 at 22:31, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 4/15/24 14:39, Herman van Hazendonk wrote:
> > Add support for the pm8901 PMIC used by msm8660.
> >
> > Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> > ---
> >   drivers/mfd/qcom-pm8xxx.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
> > index 8b6285f687da..9cca14d54d8d 100644
> > --- a/drivers/mfd/qcom-pm8xxx.c
> > +++ b/drivers/mfd/qcom-pm8xxx.c
> > @@ -501,6 +501,7 @@ static const struct pm_irq_data pm8821_data = {
> >   static const struct of_device_id pm8xxx_id_table[] = {
> >       { .compatible = "qcom,pm8058", .data = &pm8xxx_data},
> >       { .compatible = "qcom,pm8821", .data = &pm8821_data},
> > +     { .compatible = "qcom,pm8901", .data = &pm8xxx_data},
> >       { .compatible = "qcom,pm8921", .data = &pm8xxx_data},
>
> Please refrain from adding this new compatible, instead add a new,
> generic one and modify the dt-bindings such that we go like:
>
> compatible = "qcom,pm8901", "qcom,pm8xxx-ssbi-pmic"

I'd suggest against this. These PMICs were similar by nature, but not
fully compatible. Also we should not be using wildcards in compatible
strings.
I think the proposed string is fine.

Herman, I see that these patches are not properly threaded. Please
consider using the 'b4' tool for preparing and sending patches.
See https://b4.docs.kernel.org/en/latest/contributor/prep.html and
https://b4.docs.kernel.org/en/latest/contributor/send.html


-- 
With best wishes
Dmitry

