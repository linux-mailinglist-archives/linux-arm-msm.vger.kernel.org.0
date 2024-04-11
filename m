Return-Path: <linux-arm-msm+bounces-17146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C738A0607
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 04:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20A7B28396B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 02:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF11813AD21;
	Thu, 11 Apr 2024 02:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E9xq7WBn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1018B86256
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 02:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712803105; cv=none; b=PAp4rSm7WrYwJy7sNF+5o7Uel459cjzAQ7KGbhdwk9ENYe6pK/f1KqHD4jMoDwpDW0XjsM8+vnggk3eVQ4Y5cGOPhGYpEOwF4VS0M4mTpiHZGVO3KFZOf5vUTacIb7K7rHdY4npKM6pOUcbbTapnaczkFa2VX5x/SSMjhrHg/+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712803105; c=relaxed/simple;
	bh=lwHFdTjw8cUcQImvLPAXnLG1rIBtnZQ3zlRRIOlmSzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eixMtMFKdhTGop3R5id1wOvhyS2XX8K6e3SKQUDrRlHJF2smaY2S3p6OL36pElbOiyQtQGARrOjf2H8M+8YdhLA/QKOaAN5TGOj9TWzqxxRRaicAPEg3bMhwyKoIyiMJ8GhAmbc7Cm7JkvtXmiYwyluM64ACGb5B+VTGbrCriVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E9xq7WBn; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso6653339276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 19:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712803103; x=1713407903; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h93OoPo3UL03Kq4q6u54g7RNND5keWjPBsuarAYZLLg=;
        b=E9xq7WBnTBarMJkvQPeqxGUUt8VXhPh/xCyGJmrpI9lXmNmP9BfnnNJ8FmLw465US+
         jn6qaSMRnppmoW3hoY8IVE5VzrvpSW4oB+SAuJbuixTseF/oGO9FFrDHb+9bOnfvAErP
         C/K3VzNMy2myyn7qwbQ2CcAFo2be1Bk5yqsBgnvp2C95lXQ6m3ir0UY2B4HGht9l0QRU
         kCTatRn3rk8OOMJb2CQCQlUBdFXhqcjIVuq9IQLsnQlIvvXSif4t4PE6NYNAYJSSB7/K
         5u0BP4F0DZsBbQXB3rkLxSgjhnTnFBmSHjnuLaG8Ybl2AqXzs8VDn2uaRdmL49MHnZog
         irEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712803103; x=1713407903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h93OoPo3UL03Kq4q6u54g7RNND5keWjPBsuarAYZLLg=;
        b=T0CnhBrvVEvjyH56eRE4eo/9YhYmMbvGAcgs/OpOuRlpu1HH5M39pK/iye9+6GWCIV
         XcaVAI7/jzLS10w6z8KJ6qP0CSVnJVA2AD1IFD4UgxB2aRzoZP0hr+ECpuI8uaXPhklk
         bZvdJjdHhsswpzfsvz/9rwi/USZWYoN9TdcP5MggdcZrTDcZWHHNMAAOJLVhr7WJmPJ7
         b9uSO/SqxMNSMLjW2dN/KeKvu/0q4FLakxRyepPjiOZjpPLkA3OwCYcFLensUr8wQoBu
         bAQJuAS53bBH55eo97VKob6BLHwe8GcnAkbmzgSZwBAFOMymWDnc/cgZ7x9PfOdvu+sd
         hR1g==
X-Forwarded-Encrypted: i=1; AJvYcCVpTkluU4uwflRb3v+1Jr0+Nd9Bz8wWMacXqYYEM0UdGQEj1lWBIRehGtmolK9pKZ+ZpcN/8/S92ANXl3jaDvmV68+0TBkysR2bbkXx9A==
X-Gm-Message-State: AOJu0YwuiNukExKdEmZ+8gQOl+j6lUxzimzhBxpgzVlo3uqzBe+mRCH5
	GBHni7G6kLFXbYPftU4rFVw/MD+YvEU6IpinCFTDijT/HziQyVHmbzTP5BnGiqquke2WgiA5zgJ
	Di+G5MyAnQhnbWlDYQol00v+KIHsNUfOE0kvzEQ==
X-Google-Smtp-Source: AGHT+IGP2sQ+K4ZsCv7qDmaRap/BzFNEjUp/j+e152KeOUhVKcONvxn9nBq+rcTw5Wla3KyabJs1x5aa6IXmpGAfzUw=
X-Received: by 2002:a25:33c1:0:b0:dc6:c2b2:c039 with SMTP id
 z184-20020a2533c1000000b00dc6c2b2c039mr4289918ybz.41.1712803102886; Wed, 10
 Apr 2024 19:38:22 -0700 (PDT)
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
Date: Thu, 11 Apr 2024 05:38:11 +0300
Message-ID: <CAA8EJppmyU246kFE3Xk7SLG9GDgfhfT4ONCu8ZzQg3ssx+njbQ@mail.gmail.com>
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
> Because the term MDP no longer holds true for DPU.
>
> I am even looking for future chipsets. We cannot live with MDP5 names.
> Have to think of generic names for formats.

Another point: MDP_ is still frequently used in the DPU driver. See
dpu_hwio.h, dpu_hw_catalog.h or dpu_hw_interrupts.c

-- 
With best wishes
Dmitry

