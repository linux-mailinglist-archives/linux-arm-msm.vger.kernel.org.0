Return-Path: <linux-arm-msm+bounces-8578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC4B83E9B2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jan 2024 03:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47BC51C225A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jan 2024 02:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D1533F6;
	Sat, 27 Jan 2024 02:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PIo0uXn9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E92B2F30
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jan 2024 02:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706322409; cv=none; b=anZ4TrQoQwqjKuYkMQVu9ZU8N91ecRsfNJ7TuhnHGBftp9ap7IQ/ZRUkxFRIb9bzrh/2paile0C6XNYVFRIahLv7SvexvZ2HlShz0r+t7c9Xavsxw02RcpnSS5tJOS8rLiK9fxnVkWHNJbcZgN7WFRG/XzBNxbNAAc+bEKOS/7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706322409; c=relaxed/simple;
	bh=b3z+MqbVrqazCfq/PX+AzHQNyshmb1dj5fhrVqezPDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iBla4ztbyafyqK4WuiXy2xBIaEL24b7GzBHk+CusDN6lWfOts4SmzuD4yccJ1Ia+DrKf8bhTQS0u/ViH7KOIV9C9yMdWqC94rivesrttWafY5e13guRpwdfE4xRN2UXbsSKtezJMihtbOClXt3cQB71QK2FhmQW3VKgwBHOVpyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PIo0uXn9; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5ffe7e7b7b3so9990247b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 18:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706322406; x=1706927206; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PmD0X57CBkOq/PnKV2CMVVT58JH+EItJHOHqPK4CG34=;
        b=PIo0uXn90juhPhtPz8yh1rUMLMXL63BDf1NXbH395hSs4sEAQ8OasNmpYuFP3V5sav
         kBartQw8PYbMkDFTkSHvrqYlPt0WxH1g+XXBKUHQtkXaQDtnc4knU8pgGyJHxnyWJMv2
         ZhI9QIU7pSuoeFPaqiOzdi/bcelLOj1fbzeneol2knmrPqNCjBI47v6lXt9phLIiezbM
         VpDXdUstH3OfT+JSkEYmsJVPI5sxcoRt1Og0NE5Ae9umyWLx0fvhFUYUasfgssZm1hzp
         CSAU1P3EPmS5kUaSAIDwrX848HSLmE66tDeV5hfUdy8Fc9zLly9ttasyiSt9dZUzeVX7
         RKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706322406; x=1706927206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PmD0X57CBkOq/PnKV2CMVVT58JH+EItJHOHqPK4CG34=;
        b=iw2jZ4t8/ESK2Ea3hpfsqvzC/fD8DLSlLzqzu7CO368luQp6taprhS5FUVR1jne2rX
         Im0WNRp5gx+LSI94aQHlY/mbzPvAC2DZe8weX03lFN7MGHCXiKIwvap9VkY6M6J1JXNV
         H2y98Q5SsysZXTFpMB2JVdwRyZr44O1mRYdulU8t2KHA2cqNgVpckJrDmI/x5fW8oF1d
         kHk86i+MqjLO1jehKS6Z+CmquPPXfM5drrvR//gWBccVCIFUmS0qgfFdlxMdRNoBsLPd
         NCgwVa7aFPtr70hdgSTV+mokCaRhS7HGyWmhygKCQ8lAb48QeW6U5I4YBpRUySrWPoyZ
         PtFQ==
X-Gm-Message-State: AOJu0YzkTsSNJsJETI9UqmJIeiv35qhbpGayUIXquSxOO8kIHeTHz7RS
	s6PzWBrYGuHvMN/JqRxKMm25kZRmzWd8ZLpcjgM3hSECMuxGPYn1U0SA2rO+a0cYAYwiMQ10k6y
	myl4d9kkzHC2B+lXTm+mIqzZd0AS907cqmTgj/7gXVSRUFAsD
X-Google-Smtp-Source: AGHT+IFCsLON6Jdu5eEiLpsO0NWcRtQO8eIKqPlmdt4XTl7lsF7Hd1eYuqT5luTIzXi5AQLRYtYd/PSi7R+VWs8Gn+w=
X-Received: by 2002:a81:b60c:0:b0:5f6:d2ee:2686 with SMTP id
 u12-20020a81b60c000000b005f6d2ee2686mr853287ywh.2.1706322406174; Fri, 26 Jan
 2024 18:26:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-3-quic_parellan@quicinc.com> <53356805-21f4-4329-bff0-82d266ab9399@linaro.org>
 <674c5e5c-29e9-ef4a-5c5d-a24bdab27059@quicinc.com>
In-Reply-To: <674c5e5c-29e9-ef4a-5c5d-a24bdab27059@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 27 Jan 2024 04:26:34 +0200
Message-ID: <CAA8EJpo+AB3q+TRYMXDJqfk3p=L-EQEdS5mjkWOw9Mfcn5kFpQ@mail.gmail.com>
Subject: Re: [PATCH 02/17] drm/msm/dpu: move dpu_encoder_helper_phys_setup_cdm
 to dpu_encoder
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 27 Jan 2024 at 02:44, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
>
> On 1/25/2024 1:16 PM, Dmitry Baryshkov wrote:
> > On 25/01/2024 21:38, Paloma Arellano wrote:
> >> Move dpu_encoder_helper_phys_setup_cdm to dpu_encoder in preparation for
> >> implementing CDM compatibility for DP.
> >
> > Nit: s/CDM compatibility/YUV support/. It might make sense to spell it
> > out that YUV over DP requires CDM.
> Ack
> >
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 78 +++++++++++++++++
> >>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  9 ++
> >>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 84 -------------------
> >>   3 files changed, 87 insertions(+), 84 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> index 83380bc92a00a..6cef98f046ea6 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >> @@ -2114,6 +2114,84 @@ void dpu_encoder_helper_phys_cleanup(struct
> >> dpu_encoder_phys *phys_enc)
> >>       ctl->ops.clear_pending_flush(ctl);
> >>   }
> >>   +void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys
> >> *phys_enc,
> >> +                       const struct dpu_format *dpu_fmt,
> >> +                       u32 output_type)
> >
> > My email client suggests that the parameters are not idented properly
> > anymore.
> On my editor it appears to be aligned correctly. Running checkpatch.pl
> doesn't give any warnings either. So perhaps it's the email client.

Checked, you are correct here.

> >

[skipped]

> >>    * dpu_encoder_phys_wb_atomic_check - verify and fixup given atomic
> >> states
> >>    * @phys_enc:    Pointer to physical encoder
> >> @@ -399,7 +316,6 @@ static int dpu_encoder_phys_wb_atomic_check(
> >>       return
> >> drm_atomic_helper_check_wb_connector_state(conn_state->connector,
> >> conn_state->state);
> >>   }
> >>   -
> >
> > irrelevant, please drop.
> Ack

With this fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> >
> >>   /**
> >>    * _dpu_encoder_phys_wb_update_flush - flush hardware update
> >>    * @phys_enc:    Pointer to physical encoder
> >



-- 
With best wishes
Dmitry

