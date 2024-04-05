Return-Path: <linux-arm-msm+bounces-16526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 776C5899D16
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 14:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 036101F2351B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 12:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E147C16D304;
	Fri,  5 Apr 2024 12:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BTSfYwsW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7509313C686
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 12:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712320483; cv=none; b=RMiMWGUi75JjU5sbyhEwsZetqwPI0r8bE0OzYBs7ewzfK4ZqpAj01L7PDGkoIFuogkqE4gKhP5/jXlcePIhECUdqba7hZARvd/xvlPJlyvDJpr0UvBK6Mh+FO2o6FNsrUwz5ILvpGW9ts4i69kpP5wz74rDlkSj5BJrsNKi5ang=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712320483; c=relaxed/simple;
	bh=BWbY/KZqhbCE40wnvC4PrO70/N6mw5Yg/TSOavfYMW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BXtEHOz4bq+1iMeuMGlALDfViFNyrJBkPuLrAe2lu+wGFs5KoG9VyrEqWhQG7o/+Vn/5KyOgaQWu2t5lBVeTUSn5o7IdInGjR6vb1RmR2gz81X2lp0b73CoTP0T1a4sz+aod407N7vrOtOLuRRZ7d5DbJ8qozxP3h0I1fOt73OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BTSfYwsW; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso2060994276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 05:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712320480; x=1712925280; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2N0mn42V43jKjndtGzZY3LzMYKGKo3zYQTHJIkNMpNM=;
        b=BTSfYwsWCoqZZH32oDYnrXtrdpOCurlcDMXRZE91dYNqKJ2/h86iTFn3+45swiUc1Z
         Ymbduk/5zJCypoowvSasv2ji8qGvJCoM8YVpNu89B8Dgr0GtEsPqtbeEdBKpzd/znF4q
         AAL5VQBFjpD6ihZn0PN3S27TreJeJCYfdwVi89vdgqMofSnq5H/aG+zf5E2opDKG9zVc
         h9gybZkMkr9dRC3jzSVl8MwxubWxdlgnV008LdN+7uzMO4HMxVH3msmv38awTOzRM3LR
         p+Q7Tx8cDtST79ze0KYAnrwKZUsX8UMOfKQUag2GyAuqKFhdlK5XIWYbYEYh2/3XX8Up
         d6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712320480; x=1712925280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2N0mn42V43jKjndtGzZY3LzMYKGKo3zYQTHJIkNMpNM=;
        b=h+TQItRcFJAzB/ArfbxfZuc3CtXz8rfc//fD0KTr+yUy1fXK50lHF+256AM2fSe4y8
         CaC5I4XtLAvy3XhirKxaQ99AP6cV1BwRD+X4Jr2Z657T+i9kJ0cfSlJib2aX25/IygZf
         jUNhoqJdPn6JE8DqO6ShQMTGNgBQD6Uyiq1dY/TSi473+HJiRMHzN7jIv/pd9Og/i+6b
         UO+H2ZaXU6NKd0SwL3BUsnKIcJWwdI+61BU90D8wWVKLXSOgNn00e6iXZPa8bhcVykPx
         CQOqqgaXqtd0wrl3+fikVMN97jzt8imbiEck344nPML50JJ8NxQQFWYy7ZnY39nZevTx
         BvXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3w7tq1rmco63ADgv7kEZ1wa+11R2uEnxgfzNPzGfovmDi/mapX+jWjxbUAUKzPLOg1b46zf7zwM/+gkw6X5reCm1UOTv+N/pK+ryjCQ==
X-Gm-Message-State: AOJu0YwPZaVTMoVkyb9g/l+xHnasssjZxWoCcz/C2pd58O0IbVvLebA+
	UEn6Odlf6nUBrDwpLKvYmKVZS/rGI7uSKroaRJk5Hl1VGkfQJmjw+A9tBLaVyLMbONJ2MHrY+Fg
	AdMBReJjuTpsRF1ymvnPnBaL2lI4eg3qjkbyEJg==
X-Google-Smtp-Source: AGHT+IE9DTe1wMuQT2hdnEiCQgQhxlwsyKj6itvCyFDOKo18zC+YU88RGgr44hqjEdcdyfD3OgM/EC6WOGEFKxTjcZ0=
X-Received: by 2002:a25:800c:0:b0:dc7:4367:2527 with SMTP id
 m12-20020a25800c000000b00dc743672527mr1236431ybk.49.1712320480356; Fri, 05
 Apr 2024 05:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
 <87plw7hgt4.fsf@kernel.org> <CAA8EJpr6fRfY5pNz6cXVTaNashqffy5_qLv9c35nkgjaDuSgyQ@mail.gmail.com>
 <87cys7hard.fsf@kernel.org> <CAA8EJpowyEEbXQ4YK-GQ63wZSkJDy04qJsC2uuYCXt+aJ1HSOQ@mail.gmail.com>
 <87v85wg39y.fsf@kernel.org> <CAA8EJpq_XLUEMC67ck2tZRjqS0PazCkQWWMGmwydeWxTETHwcg@mail.gmail.com>
 <871q7k3tnq.fsf@kernel.org>
In-Reply-To: <871q7k3tnq.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 15:34:29 +0300
Message-ID: <CAA8EJppASEmj6-Jt7OCABAeqr8umSgXaDDha9nn2nRafuZ-Gvw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/4] wifi: ath10k: support board-specific firmware overrides
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Apr 2024 at 15:01, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > On Fri, 8 Mar 2024 at 17:19, Kalle Valo <kvalo@kernel.org> wrote:
> >>
> >> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> >>
> >> >> To be on the safe side using 'qcom-rb1' makes sense but on the other
> >> >> hand that means we need to update linux-firmware (basically add a new
> >> >> symlink) everytime a new product is added. But are there going to be
> >> >> that many new ath10k based products?
> >> >>
> >> >> Using 'qcm2290' is easier because for a new product then there only
> >> >> needs to be a change in DTS and no need to change anything
> >> >> linux-firmware. But here the risk is that if there's actually two
> >> >> different ath10k firmware branches for 'qcm2290'. If that ever happens
> >> >> (I hope not) I guess we could solve that by adding new 'qcm2290-foo'
> >> >> directory?
> >> >>
> >> >> But I don't really know, thoughts?
> >> >
> >> > After some thought, I'd suggest to follow approach taken by the rest
> >> > of qcom firmware:
> >>
> >> Can you provide pointers to those cases?
> >
> > https://gitlab.com/kernel-firmware/linux-firmware/-/tree/main/qcom/sc8280xp/LENOVO/21BX
> >
> >>
> >> > put a default (accepted by non-secured hardware) firmware to SoC dir
> >> > and then put a vendor-specific firmware into subdir. If any of such
> >> > vendors appear, we might even implement structural fallback: first
> >> > look into sdm845/Google/blueline, then in sdm845/Google, sdm845/ and
> >> > finally just under hw1.0.
> >>
> >> Honestly that looks quite compilicated compared to having just one
> >> sub-directory. How will ath10k find the directory names (or I vendor and
> >> model names) like 'Google' or 'blueline' in this example?
> >
> > I was thinking about the firmware-name = "sdm845/Google/blueline". But
> > this can be really simpler, firmware-name = "blueline" or
> > "sdm845/blueline" with no need for fallbacks.
>
> I have been also thinking about this and I would prefer not to have the
> fallbacks. But good if you agree with that.
>
> IMHO just "sdm845-blueline" would be the most simple. I don't see the
> point of having a directory structure when there are not that many
> directories really. But this is just cosmetics.

It is "not many directories" if we are thinking about the
linux-firmware or open devices. But once embedded distros start
picking this up for the supported devices, this can quickly become a
nuisance. We have been there for Qualcomm DSP firmware and we ended up
adopting the SoC/vendor/device structure, because otherwise it becomes
a bedlam.

> > My point is that the firmware-name provides the possibility to handle
> > that in different ways.
>
> Very good, thanks.

Thanks for your suggestions and for picking the patches.

Bjorn, could you please pick up the DT patches now?

-- 
With best wishes
Dmitry

