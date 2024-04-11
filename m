Return-Path: <linux-arm-msm+bounces-17143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C756E8A0566
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 03:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33D55B21427
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 01:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F1A060B9C;
	Thu, 11 Apr 2024 01:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dDGDkH12"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B7B60B95
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 01:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712798472; cv=none; b=M5kQmI3ijK+afSCLB72x5kQkLgju3dpHJzddJHB8ZthGmIhwB5z7+94qBuE1LKsxZJifSmrdjI5KuXl0kcaahZHRcr5qf7Z6z0mr4iRLyURSLv1SgzvkXGDMgicp4YT4osZhsEtwZaSeTbuXBNZwJDJrWQjVqfSTqB1PYIDRfp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712798472; c=relaxed/simple;
	bh=5B+9h39/1FA8o6HxgDqbrWDRNTFnfBM14D2RW1rFwe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZJN9u5WR9ZCTnATMty/okOApAE54wWxu8BywmLtLSMhdz59TZK4heD7swqtlW5gXXHJSEfODkdLK+JJwcwymWZohH2Uj5WjoZsCy8F2r9Z0xxAD7yfPj4jXX9D5cwAjoX+QcNb5n4e6Msw1DnvRtLzIBovcqZxCxphK5/38OHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dDGDkH12; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dbed0710c74so6479025276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 18:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712798469; x=1713403269; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K78Wb+5lPnl7lDBySF3XIyGuPisCXfXWqPX+4wqyBxE=;
        b=dDGDkH12wXsBDirlRFleSMKCtNAuvaYVgqj1M0oGbr3jkgcadTtxyYbbxSsP0l8/G2
         sJKd8Bn5EEa5P8RX/+diVNSIOMD8hyd7dV6djk04hAuTkPU8/SbLCuD5+o/L7QWmpSCN
         r7lOXqL80/23hfwYqPrrheAx9IKt5Z/HHms8cZ42psBMexCBtzME2MdAI881UB45/CBf
         urg/ivNsU+ldWWJVcvBLOBuZgcT1hMKtdwNEMzacchUdbqjvNFvNyJWfSm2uAsHlR8t9
         XgSZeQ6pm6YC35Ti+wACk3cbm1KsL70Zbiqc6anE5P/piykTG8jIUGMaGeZvo8Z7BfdW
         hkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712798469; x=1713403269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K78Wb+5lPnl7lDBySF3XIyGuPisCXfXWqPX+4wqyBxE=;
        b=UjgRZqYV5e9tFcdqSqMAkUUgHivJaBo+z46atTe7UZTl1G0eUOsF3ver0dL84suSsu
         vgy0/eeQEsox8l/Y2C4gvccjdS7Dcm1ajWzc7uUf34Rts2jLv5ehW9mi384XOp8LxKv2
         XnNYhP2eRfV0pVQoJO/1QF0NBnS42FD6a9mATluuAOruWJpeA1Vb2qP+wAnhml8XQzAq
         8VIAbnYu11p7C2KaUPP7erjUALAF5qaPVfyKULhJ1YXAwNcn3SGTsZebvGhQZaZ+lFlk
         wWvoHBLAgjj5XTe9jtjjIPbLA5TRu44eIpkg3HJx03yUwvHHhHWbFhBa6cymveo8tmy4
         g0ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYzN2AKfiptTOFhfvGVXRu4TawdnydFTc6HbHMHrg7REIMiHvaAquh2uMNZEgLthxcWyD46UF7gPMgA8ri5HAUP9Fccp4APRoGHAu8+g==
X-Gm-Message-State: AOJu0YwDO9C62sh4YS1IHoc5LMaRpPwjMb7P1XUpcgXFDVxEClhXydWT
	6WpCaUPR/7+Qbgiz2ONk6lFydjAYDvmFkobXRRvHzOe9sCyMm/2quOFwL8wnG6CRvmGTxxFuQzB
	1YN+F5d/Xsi5wRYeRglskVUUY7Tuve62ErMYCmw==
X-Google-Smtp-Source: AGHT+IECYTTuldk0RR57VK+SgkF41GoxYrDnN6w0HIGHHRJBHcFKg9PFCu5uNs9HXTZ79S73AY4eMD3N+bDcYc3xG1I=
X-Received: by 2002:a05:6902:20c1:b0:dc7:4c21:fbd5 with SMTP id
 dj1-20020a05690220c100b00dc74c21fbd5mr5044699ybb.0.1712798468822; Wed, 10 Apr
 2024 18:21:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-4-dmitry.baryshkov@linaro.org> <bb448864-b974-55ac-4709-ea89bbd2694f@quicinc.com>
 <CAA8EJpqnjY35RF52yJ8gFRKHoh1ArnnviacDtfntSYZdALD3bQ@mail.gmail.com>
 <83b45b20-fb7e-564b-4e32-2b6a12c4dc6d@quicinc.com> <uhyqwsevbgvayqf7ky2tasvutpqgvuaa5o7y7scqete3jueuhk@zgji4hgmh4lu>
 <c0274d67-ae15-8b08-a6af-bd1d77698ab9@quicinc.com>
In-Reply-To: <c0274d67-ae15-8b08-a6af-bd1d77698ab9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Apr 2024 04:20:57 +0300
Message-ID: <CAA8EJppSX=ccwXb2f2SYi9menXO6LLYwqEY5HaSR9K4dh3FRJg@mail.gmail.com>
Subject: Re: [PATCH 03/12] drm/msm/dpu: use format-related definitions from mdp_common.xml.h
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Apr 2024 at 02:54, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/10/2024 2:12 PM, Dmitry Baryshkov wrote:
> > On Wed, Apr 10, 2024 at 01:18:42PM -0700, Abhinav Kumar wrote:
> >>
> >>
> >> On 4/10/2024 1:16 PM, Dmitry Baryshkov wrote:
> >>> On Wed, 10 Apr 2024 at 23:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
> >>>>> Instead of having DPU-specific defines, switch to the definitions from
> >>>>> the mdp_common.xml.h file. This is the preparation for merged of DPU and
> >>>>> MDP format tables.
> >>>>>
> >>>>
> >>>> Adding MDP_***__ usages in DPU driver is quite confusing.
> >>>>
> >>>> Can we align to a common naming scheme such as DISP_***?
> >>>
> >>> No, it's not something display-generic. It is specific to MDP
> >>> platforms. In the end DPU is a continuation of the MDP lineup, isn't
> >>> it?
> >>>
> >>
> >> No some aspects of the hw are completely different as you already know
> >> between MDP4/MDP5 and DPU. Bringing back MDP usages into DPU does not seem
> >> right.
> >
> > MDP4 is different, it's true. But there is a lot of common between MDP5
> > and DPU. Frakly speaking, I don't see an issue with using the constant
> > that was defined for MDP5 for DPU layer. Especially since we are also
> > going to use mdp_ functions for format handling.
> >
>
> All the HW naming etc in the doc has migrated to DPU and in fact it only
> makes sense to start using DPU for MDP5 as we plan to move mdp5 targets
> to DPU anyway. Not the other way around.
>
> MDP4 remains different.
>
> How about MSM_DISP then? I dont get why this is MDP platform specific.

I expect MSM_DISP to be applicable to all MSM displays, even if e.g.
at some point DPU2 switches colour component encoding.

> Because the term MDP no longer holds true for DPU.

The XML is still called mdp_common. And the functions are in the mdp_
namespace. I don't think we should be changing them just because the
name has changed.
Likewise if MDP3 is not compatible with these definitions (to be
honest, I didn't check) I still don't think we should change these
names.

> I am even looking for future chipsets. We cannot live with MDP5 names.
> Have to think of generic names for formats.

Ok, I'm open for suggestions from your side.

-- 
With best wishes
Dmitry

