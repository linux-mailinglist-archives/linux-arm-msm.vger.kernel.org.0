Return-Path: <linux-arm-msm+bounces-37246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A0A9C072A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 14:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBC3DB21D2A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 13:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F3020FAA8;
	Thu,  7 Nov 2024 13:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FLRNk7Rt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529F220F5A5
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Nov 2024 13:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730985743; cv=none; b=FOMpGNR/e54QG3tLBXV2rri48JfLtbNlRGlXB3KV586stRmDrhseld/1KQqkxPfc/DMQoNM1KqW8017/744SnB7ACtCP3UM8Wx1WUIol61XaxN8WiYfacQ7blkCZVD5Qlpv/yaajJ7YnOr+k5VdvUXJWdznRgLzpIeK414N5Zl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730985743; c=relaxed/simple;
	bh=tafXy6T8mvGXw1f1p//OoV2OKeMhQpmhKK+Y05sbk70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BoYThDHA0JBGVU+SKIjyb2KaP1RQBz1SjufNP27B+Vsmw4sbtcMuDqh6KEV6a4gUsPGy0WxQAErlDoAvwiB2er4OKucnyUdYh//r1vvFEktJYaUlSSZuA4zuoaJZvORDS9r9deWLrY+OaRaKi8HHY7LbJuM9EBnPXRHQ6T/k6V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FLRNk7Rt; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so1190054e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2024 05:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730985739; x=1731590539; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O78jUSo2VAB2jjaBqcpu1sFn5+Qacu329/7bBRcH7BY=;
        b=FLRNk7RtRik1FSeRpfxV5jPbKsShu0GFrIE/FKEo6HUKyFcYKNmMYTPLYN5V80wO2p
         vBCXF5Fta7yIQ6aUv2VEHYsyGwOepiaW3LsleMNmQfOFde5gbo9uZBj3UUnaPN6svRk7
         eVtg6gpODJOcCjIl3IWX+6+LSiGGdheSY8yFtoSiFpGPb0AnjqgeCrSIf5XDNyegsnjy
         qgqHL3vW0Z7YxpoKzguUW1xZDfFVboF62QoOOpZjmJITr9F7MNmWqXPitvBZlwl8Ha5O
         EH/fpKbfNJK2JMHnRFfWCO4S8XXhGqOH7FEzRjbQy4JRRI48MFNPa8n7G0CPeLURnF9h
         N+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730985739; x=1731590539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O78jUSo2VAB2jjaBqcpu1sFn5+Qacu329/7bBRcH7BY=;
        b=TWlCCdc8Tjf9V7tqunIRXJW4TdtfSJunORIKiSm4m+VeAadHQx6V98wXZL7p5RzS7E
         UrAaNslPC3gQJdqse/N9Hjel381o19i4BQ/CHp4BL/XDLx/X/8FQ5j/ziXhh9gkpB3Nl
         WjcJbrN7k9hzme2pwtr7XZBzBwvnNBTRJWLUDOkLzGLA6ur/wKu21hdqXT0LSYRWL4sS
         t4TnLUodFVUN7gIxMIRqhDOMCYrmmorUcei8Oq/M6LX6AzDoQu3ddCRBs4MVtpkxYYTy
         5Dz11QGqdE1Ug4arylkcXFBYdVSMihwNCiedPR+98k7nndyS2NMCyhV+2EBBQp3NQ7jk
         oBBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6UaNTbNePou+uBqJHB9F3L+BKEvIfYhaEAr8IMs0qCQK/L0jYH/UO7eP9I1Frdyqhu93PUBp6UtMuB0WK@vger.kernel.org
X-Gm-Message-State: AOJu0YxzZSXzv5D9/5EbAuh2vzquuZUUohpINHc5s2iFWdAkqfUJp3NE
	CfvfowuPc0hANJNm9L6KygUrqJyu+UZaP9kdsJNpyVbPKDak4fYeINMbWs3XdLs=
X-Google-Smtp-Source: AGHT+IE7iCnTN6cJcxYydY0LNjIyPayqcFupD1/fQ2SNQljIoWv7ce8HamPJfCQEBawmCBwWNzoUXQ==
X-Received: by 2002:a05:6512:3981:b0:539:eb2f:a026 with SMTP id 2adb3069b0e04-53b34921a44mr22822155e87.33.1730985739182;
        Thu, 07 Nov 2024 05:22:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d82686327sm215610e87.102.2024.11.07.05.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 05:22:17 -0800 (PST)
Date: Thu, 7 Nov 2024 15:22:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 1/4] media: venus: hfi_parser: add check to avoid out of
 bound access
Message-ID: <ql6hftuo7udkqachofws6lcpwx7sbjakonoehm7zsh43kqndsf@rwmiwqngldn2>
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-1-8d4feedfe2bb@quicinc.com>
 <b2yvyaycylsxo2bmynlrqp3pzhge2tjvtvzhmpvon2lzyx3bb4@747g3erapcro>
 <81d6a054-e02a-7c98-0479-0e17076fabd7@quicinc.com>
 <ndlf4bsijb723cctkvd7hkwmo7plbzr3q2dhqc3tpyujbfcr3z@g4rvg5p7vhfs>
 <975f4ecd-2029-469a-8ecf-fbd6397547d4@linaro.org>
 <57544d01-a7c6-1ea6-d408-ffe1678e0b5e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57544d01-a7c6-1ea6-d408-ffe1678e0b5e@quicinc.com>

On Thu, Nov 07, 2024 at 06:32:33PM +0530, Vikash Garodia wrote:
> 
> On 11/7/2024 5:37 PM, Bryan O'Donoghue wrote:
> > On 07/11/2024 10:41, Dmitry Baryshkov wrote:
> >>> init_codecs() parses the payload received from firmware and . I don't think we
> >>> can control this part when we have something like this from a malicious firmware
> >>> payload
> >>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
> >>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
> >>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED
> >>> ...
> >>> Limiting it to second iteration would restrict the functionality when property
> >>> HFI_PROPERTY_PARAM_CODEC_SUPPORTED is sent for supported number of codecs.
> >> If you can have a malicious firmware (which is owned and signed by
> >> Qualcomm / OEM), then you have to be careful and skip duplicates. So
> >> instead of just adding new cap to core->caps, you have to go through
> >> that array, check that you are not adding a duplicate (and report a
> >> [Firmware Bug] for duplicates), check that there is an empty slot, etc.
> >>
> >> Just ignoring the "extra" entries is not enough.
> Thinking of something like this
> 
> for_each_set_bit(bit, &core->dec_codecs, MAX_CODEC_NUM) {
>     if (core->codecs_count >= MAX_CODEC_NUM)
>         return;
>     cap = &caps[core->codecs_count++];
>     if (cap->codec == BIT(bit)) --> each code would have unique bitfield
>         return;

This won't work and it's pretty obvious why.

> > +1
> > 
> > This is a more rational argument. If you get a second message, you should surely
> > reinit the whole array i.e. update the array with the new list, as opposed to
> > throwing away the second message because it over-indexes your local storage..
> That would be incorrect to overwrite the array with new list, whenever new
> payload is received.

I'd say, don't overwrite the array. Instead the driver should extend it
with the new information.

> 
> Regards,
> Vikash

-- 
With best wishes
Dmitry

