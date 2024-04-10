Return-Path: <linux-arm-msm+bounces-17132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F778A01C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 23:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 524161F241B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 21:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73BA15AAD6;
	Wed, 10 Apr 2024 21:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xE0Xkfhp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AE7184103
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 21:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712783533; cv=none; b=aA+AKKfBzjd/2o6XbsvhOrJFJXY9W5ZfIGCnqIjZxnxF1ZtcRN0oNbqKpFIBNpoQjdB3RybxiOhB0SCfQmHIUEC5EHuHUUVRc3V/mkqSC0xMzlQves8QTsAy+e/nG395+pRnP2a8Z6NkrBWkKWCSHheSm9EF9kVg7Lj0rQZbnpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712783533; c=relaxed/simple;
	bh=g2/A3JDLbLyuZSDEU/o5J/+m0G5LhuRgWZq/iq2coVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJFNOVjvKd2A1d57MX66jlFR9QrRWCN5x/3aGOw9YeuxrZtUZc21rN/K4/rYT4mhz8eFtf28URfADmAYNHjwVPqT+TZGmV1Tli34ZVMxwfOL0rbI2lcgVxtt93TJ2OOfrDZkYOu/KTr/BaKxy060bzszUy4Xi0VGxSkwHmYsVeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xE0Xkfhp; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-516b6e75dc3so9201631e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 14:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712783530; x=1713388330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OZwBCycYY1wJMLbUlMdwvYrZmhATN/7bkb8wxUzPusE=;
        b=xE0XkfhpLkgpB+V02JGq8p9q5aw28KqnwVEx3mQNUTr/MpfmpZcDYAdxMn1yxHNvjI
         KFUBWed2SuV1nAPP2sKPcTK2aU0+coc6S0dc9+FaQUxfBYgyyMpuDf2aErSqTk10Eeuy
         fyASvwQrmh9yGxQpRN4rLPrUF4fom5dkdNUVgppHdIycu8mXGDpr450cUUrIsRtomI1W
         p6qP0LofvrMECdb1xBAgdqm0Q2Fs9a5fX5EIi6s5Az2ylPrV8uRxQfvxytI/Yz3A55xW
         u1SilXBSILWNEG2l1WccRNPNDeg2vmvJih1GiwjFFPFdVlgNREAMmx4N1vXVxgZNMCDb
         0ppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712783530; x=1713388330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZwBCycYY1wJMLbUlMdwvYrZmhATN/7bkb8wxUzPusE=;
        b=BZAuX43dIxMMIU/GcJIcPJrPHu8fDEpXT6v6ltxcjqoFqSxYA3t0+iH1W2C4yqoKZ5
         hGTMtnrC9GgNgZfP58XnqU4e2QKn7oRbi3HsiYnHvUt8TqTJFRQIHM88pg3HEOaRaVi0
         LlJODyg7NHmfxDCRbhNJ24PM0Cat08Y50eMwV9WcvbejLM1n1s230rj+q3vyZ8a0zlvZ
         VkyHiHippX/BYGAhNbsZwneXcZMhkj/u3fTuZiZAIZtJGP7ACnr0mAipzMLPKOAWuyG1
         PivlwmN75DWiN8yW96yirx9X4OEud3fBLmFudQdI6cqxeWOPYrhzRkFF8/x6c/Muk1Qr
         rdPg==
X-Forwarded-Encrypted: i=1; AJvYcCVvIbIPsQgqn49FSjd66k3JkK2uc3vqgkec7zIyJ4mXCul3uSJYjJYqF+UoZ4Z0W2OnfzPfjG2zFhp++IuBSMryut6Hox3w5LPgyx2exw==
X-Gm-Message-State: AOJu0Yy27G98pN3nLlS2DBK70kcG3zjBXCwi59VoVwtuNJC3vExLDuoe
	Ul/lNU3b4SUwxXiWVypDWMaFN2OGDd5QjaNXMrx01Xtoe0+TBve5psUa/SqSk0o=
X-Google-Smtp-Source: AGHT+IEv0hIWdS315GVXqNlHspgdO9aknWPbaAxmVCl0KLCNKAOV5VVBeSrBTsG/U7qRHbDAMlS2DQ==
X-Received: by 2002:a05:6512:481d:b0:515:d326:9e0c with SMTP id eo29-20020a056512481d00b00515d3269e0cmr2098229lfb.3.1712783529985;
        Wed, 10 Apr 2024 14:12:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id i26-20020ac25b5a000000b00516d05bb083sm15550lfp.206.2024.04.10.14.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 14:12:09 -0700 (PDT)
Date: Thu, 11 Apr 2024 00:12:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH 03/12] drm/msm/dpu: use format-related definitions from
 mdp_common.xml.h
Message-ID: <uhyqwsevbgvayqf7ky2tasvutpqgvuaa5o7y7scqete3jueuhk@zgji4hgmh4lu>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-4-dmitry.baryshkov@linaro.org>
 <bb448864-b974-55ac-4709-ea89bbd2694f@quicinc.com>
 <CAA8EJpqnjY35RF52yJ8gFRKHoh1ArnnviacDtfntSYZdALD3bQ@mail.gmail.com>
 <83b45b20-fb7e-564b-4e32-2b6a12c4dc6d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83b45b20-fb7e-564b-4e32-2b6a12c4dc6d@quicinc.com>

On Wed, Apr 10, 2024 at 01:18:42PM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/10/2024 1:16 PM, Dmitry Baryshkov wrote:
> > On Wed, 10 Apr 2024 at 23:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> > > > Instead of having DPU-specific defines, switch to the definitions from
> > > > the mdp_common.xml.h file. This is the preparation for merged of DPU and
> > > > MDP format tables.
> > > > 
> > > 
> > > Adding MDP_***__ usages in DPU driver is quite confusing.
> > > 
> > > Can we align to a common naming scheme such as DISP_***?
> > 
> > No, it's not something display-generic. It is specific to MDP
> > platforms. In the end DPU is a continuation of the MDP lineup, isn't
> > it?
> > 
> 
> No some aspects of the hw are completely different as you already know
> between MDP4/MDP5 and DPU. Bringing back MDP usages into DPU does not seem
> right.

MDP4 is different, it's true. But there is a lot of common between MDP5
and DPU. Frakly speaking, I don't see an issue with using the constant
that was defined for MDP5 for DPU layer. Especially since we are also
going to use mdp_ functions for format handling.

-- 
With best wishes
Dmitry

