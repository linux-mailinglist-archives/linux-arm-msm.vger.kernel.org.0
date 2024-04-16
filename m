Return-Path: <linux-arm-msm+bounces-17604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D92AC8A6FAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 17:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EEFC1F2211C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 15:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF79131733;
	Tue, 16 Apr 2024 15:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dCxYMOWZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037BD13048E
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 15:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713280825; cv=none; b=ol/ymhpas7ns3IGSWh0fnvMJYtCJJHB6H5o18Cxo6N0iXiGxa8QKjCoNlvQGsHI+iFnFSh1feV6mckTLstbY6j4uxT4+PU0owU9an+sdUpizhFcQoTPVaR8jlxIXny9BYA4nQXbWJu0eCLCT0DJl+5tl0PUQZWd1CZmzRvYcxZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713280825; c=relaxed/simple;
	bh=ogk92evleqkPuUaIzhiJjs+SO3WbwlZaxhfQYNosFdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RgX4y4s9kKI6l5CqGz7jlKSHsbMrGEfwFGeQWj9RvtZAKi1CEAsyO6FP199d3mktSrBIUfOEhVmnHNGne5Bg1ToYVtDu8vQZd0uobZNdqRos1MLjqVp+hr9ZvbivyvvCQywY4ohMlLVnyEvpwclXctst5t+oXtq9vpZh+hdadcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dCxYMOWZ; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so4501661276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 08:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713280822; x=1713885622; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mMO3J/koq2VtvnAEkr+zbw/DfMlDxsEOqsgIHHsF7Fg=;
        b=dCxYMOWZLpi9SzxL82oYeoszXPlVu2T7t8nrGA8nYJLxiZHGfcZeqUGW2N2Nc0bm3a
         bk2ap5DaEJrk81YgtZYVM9Ac+yo0XyNNW5Q86MnbkgwgklZYx32jhLM2rCKZ9n5isACl
         TAjmyPrGUqhxvR5T1EhysxYFqE4nMnUpQkbL1dDgicmAq/BS2UuVSCjtUePDkT+vEkhy
         zun6F2bxPh6b08BHa/HixWddN7DXmNt6A+4HxKn5B5OwY2pFsr6c2b63JpirD1A209YS
         gz5RmufOo6AOOalk3LE0+AQVGLcgU+0SR7eeGb+j5cwGwpLWbKbx/jI8bOXaLefjRJIF
         NMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713280822; x=1713885622;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMO3J/koq2VtvnAEkr+zbw/DfMlDxsEOqsgIHHsF7Fg=;
        b=dCaRCIOTS8h5iaUSqAyl92wX5kPbH5HKjS4xmxU+wge7Yd+Wsji1tmFHEuBk+H6TTM
         Kd0LqKDm/sEvAG6CVTYRPO5uB6HWVk//AFvK0EfNEz0rd/MZlYEdcjlKp8RgODjhH0DB
         lzn7XeXcs7zhaqq7XCTWG8Zp4bvKgo6C+mgMQp7AiSIlFlOkmEzU4/lKvv4Wr5QnAvla
         rEfZ7d3E9D0qNA+sghFZLAuu314qz6wx1ofRAWF/bYEwomgXZ7RMS7fMxXoM/05chz3w
         RIn9C5xU9q3x5GYio0TYsFcsegLThzDVJE/rJesi+qlmgscrmLd6DspaoDaRPWLZ83l4
         5LiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhx5s/qq2xvTNK75ErPyXsDoN6AGAiP0csH2K6NtAzahsdLYn7JHvkdjHDTg9tncEwXo2VEnOGz8a0ZwZvqlAmX/lPlkCOMafQVad96Q==
X-Gm-Message-State: AOJu0Ywd1/EM5dqxZKm8nGuGJRYEHI/P80AFUb9eT9zDPdzAWhPjXYug
	qtB7X4VYa8Ezm1i6QYaHM2pNK1CdsCFQSR4gHnNXobBqDtPFpwOUcJBJkI7I2iKwmLAAjwQ9M1u
	Wg7Pmw4BND42mkBSA3Eq+ZQcNJKDDYxeNN6cOWA==
X-Google-Smtp-Source: AGHT+IEtsDJfZJ76KZn5Td8LpcHSFPRQ3TKmnwcVPVblLvXhJ7AGte9txzMCMRd181hjAL5xfz3A+oms+boqL8Xkn4s=
X-Received: by 2002:a25:8449:0:b0:dcf:b5b7:c72 with SMTP id
 r9-20020a258449000000b00dcfb5b70c72mr11140317ybm.0.1713280822073; Tue, 16 Apr
 2024 08:20:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
 <20240416-ucsi-glink-altmode-v1-2-890db00877ac@linaro.org>
 <c129b349-dfaa-4b10-9b8c-6098d04b9373@linaro.org> <CAA8EJpqH2_ENE6am=m9dtwk_+_Vbc4pZG9=Y_4-b-p0fKQ4sBg@mail.gmail.com>
 <66cd0d96-7576-4f70-b4da-b8d518253763@linaro.org>
In-Reply-To: <66cd0d96-7576-4f70-b4da-b8d518253763@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Apr 2024 18:20:11 +0300
Message-ID: <CAA8EJppf9z+q4_xjQE62Vi-2BiHJpUi7mS0EMSRV_XxbGH==qg@mail.gmail.com>
Subject: Re: [PATCH 2/8] usb: typec: altmode: add low level altmode
 configuration helper
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Apr 2024 at 17:57, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 4/16/24 16:48, Dmitry Baryshkov wrote:
> > On Tue, 16 Apr 2024 at 17:32, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >>
> >>
> >>
> >> On 4/16/24 04:20, Dmitry Baryshkov wrote:
> >>> In some obscure cases (Qualcomm PMIC Glink) altmode is completely
> >>> handled by the firmware. Linux does not get proper partner altmode info.
> >>> Instead we get the notification once the altmode is negotiated and
> >>> entered (or left). However even in such a case the driver has to switch
> >>> board components (muxes, switches and retimers) according to the altmode
> >>> selected by the hardware.
> >>>
> >>> We can not use existing typec_altmode_enter() / typec_altmode_exit() /
> >>> typec_altmode_notify() functions in such a case, since there is no
> >>> corresponding partner's altmode instance.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>
> >> Should this now be called from e.g. typec_almode_notify to limit
> >> duplication?
> >
> > typec_altmode_notify works only if there is an altmode->partner (which
> > we don't have with pmic-glink).
>
> Yes and this seems to be an excerpt from these functions, should they
> now drop that code and call this function instead, so as not to have
> it in the tree twice?

I thought about it, but then I abandoned this idea. The
typec_altmode_notify() has its own use case, normal altmode drivers.
It is an error to call it if there is no partner registered, etc. So I
wanted to preserve error checks in that function instead of dropping
them. The significant part of the code is shared anyway thanks to
typec_altmode_set_switches().

-- 
With best wishes
Dmitry

