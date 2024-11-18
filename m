Return-Path: <linux-arm-msm+bounces-38216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4089D0F0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 11:56:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 587981F22DAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 10:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71029194A49;
	Mon, 18 Nov 2024 10:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VTUWO2c0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA09719415E
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 10:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731927356; cv=none; b=G4qpBQrLz79ihBS2qChr8UK6bJ7nnsSNMPbJjGJ/BUE1NYn4/lnnhd2bvq7+pEVKeNjGhWIc/opfXe6QL8o5/aKxuOtOBxQmi2bRx/mUxatt4O9SUg0YvDswcwjtkgl2/wwLQID4wIa1O0AUnGPoW068p2fsNMmLIUN+CDXgv7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731927356; c=relaxed/simple;
	bh=JMk00ZUShWUA6YW8c3Vmielw0R0TBr1C6BVe9eWaoXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQI6xnLfSiI+88te0rCLijiqQRs1qMYWjmhLj8LLv6TM7FJWgp4wmzjlGn6mK2O21MqUlfTUr+4zEaCMGqY4vyQO0JOXPEs8e3hCKvoLSZSyuk3f1Or2Ww+2X6/rrwzu5kQBoXM5rsCCFypg9OyVIoSCQsJLqkPtEUxxahhQU/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VTUWO2c0; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e388c3b0b76so1041190276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 02:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731927353; x=1732532153; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w+gcUkWqnUWeIRim5K0WJ1xhryXQa0s5F2M+SzqP9T0=;
        b=VTUWO2c0oHgL8R/jm+UFRiAWBXYexybp+KiFdzBMGULursSdVf7/nI6XYjIzzRQynO
         cMWfXfqauyjqoXNtIyYHS4ysNy67ekkrKjTlEx+Ptw3nt669ER8Y2CDNilGtK77wafLT
         hdU8y32Te0DPDQrExy3wJBE19ERUU8j7LkSI65jNJJhn1pUIohwwWWtBdBpIXtGIDgOR
         lu3y+pskdDE4LGREx3uALb4y9/TahXyz3OTzTmEzKerJVQX1N8yjFVzaW6+Jf+HWGDAi
         MmM2udrWV/9CspCrxHM/1qm/gaqGDNTmMMaGazqys8XBSbfe0GUt1cCXwr8YoeCI+k3e
         QHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731927353; x=1732532153;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+gcUkWqnUWeIRim5K0WJ1xhryXQa0s5F2M+SzqP9T0=;
        b=f3l2GQUk7iwmjG4Q8oeDLh2JsQH19Q3A22mwn3jCiWEfDsgkY9Ihbn+vDANqmyY1Av
         +tyA9G6JNmDCrfW1cGTfwNcVZLqBrLoNIGaaqFIS6rWfIacq+FMJyV6JAuTriFcuUfAY
         20hV/yU/8CDIo5U8sjHC7DImVp9dpQGVIVefFeTL2s3dsexxvqKML/486m7KYABwoB+t
         xH0TEXPb7W6hLBDJgL/TEfGsv0ddZvQm053JDntLMw7iZLa+UG01g3pbchXgZtlHfCFY
         tSkaUCyp9u1KuUEskg6oMpr3wYs9EE9+ez/oRQ4vrN5YiVtzGVmOAMjdGR5IfG1+SnsM
         /EKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiChyIEjWN9pjJAICmix8aqKCHGTs55sKlfDmypjK+VVLHF02oMHwcCkeztO1VDKlA5DrQNB3/IGEoaqW3@vger.kernel.org
X-Gm-Message-State: AOJu0YzR1it3RwKFBap7XzeshHPoTcDIfochykfDYusY4r5KYYBYHAbq
	sBAWV/8zvsnmIQI7dcW8R0VHjyifq7yZemB2pogRUZPQnBjAPkQoXqR2egEMkgYRUlIzUUFgta8
	C6Y6SZLr2nokD/YDC3vxbp8GEriMf1l3RU2rYKQ==
X-Google-Smtp-Source: AGHT+IEZOTjDuL3cIVoz5nWKJEyF0aeG0f0EW0hxHhqnUOdR0gWvnJmj3XkdmwRkLDiSkWF+WjV4mqMsgEuaQp8rlbo=
X-Received: by 2002:a05:6902:2b86:b0:e30:e1f3:2aab with SMTP id
 3f1490d57ef6-e38263a1b87mr8182648276.39.1731927353566; Mon, 18 Nov 2024
 02:55:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
 <20241014-add_display_support_for_qcs615-v1-3-4efa191dbdd4@quicinc.com>
 <ezatn7e5sm74dd4xs4r4qnkcwouu3cu72vlvbbsrj42eca3dyo@xfmga7rpzspl> <ccfed778-6257-4da1-90af-c5d8ca5a98f7@quicinc.com>
In-Reply-To: <ccfed778-6257-4da1-90af-c5d8ca5a98f7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 18 Nov 2024 12:55:42 +0200
Message-ID: <CAA8EJpotZ8giXYY=1EjyKa1oHz=aEHecZPi4G4CfNNqSQ8jW4g@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/msm/dpu: Add QCS615 support
To: fange zhang <quic_fangez@quicinc.com>
Cc: kernel@quicinc.com, quic_lliu6@quicinc.com, quic_xiangxuy@quicinc.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Nov 2024 at 10:52, fange zhang <quic_fangez@quicinc.com> wrote:
>
>
>
> On 2024/10/14 18:47, Dmitry Baryshkov wrote:
> > On Mon, Oct 14, 2024 at 05:47:29PM +0800, fangez via B4 Relay wrote:
> >> From: lliu6 <quic_lliu6@quicinc.com>
> >>
> >> Add support for the display hardware used on the Qualcomm QCS615 platform.
> >
> > Not all hardware is described here, comment regarding the DP, etc.
> >
> >>
> >> Signed-off-by: lliu6 <quic_lliu6@quicinc.com>
> >> ---
> >>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_qcs615.h | 268 +++++++++++++++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
> >
> >>   drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  17 ++
> >>   drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
> >
> > These changes are not related to the DPU, which you listed as a prefix
> > in the commit message
> ok will split it to these four parts.
> 1. dpu hw catalog
> 2. mdss
> 3. dsi phy
> 4. dsi
> sorry, one more question about it.
> is the driver patch order correct?

Usually MDSS comes before DPU

> >
> >>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
> >>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
> >>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  21 ++
> >
> > These changes are not related to the DPU
> >
> >>   drivers/gpu/drm/msm/msm_mdss.c                     |   7 +
> >
> > These changes are not related to the DPU
> >
> > For the whole patch: s/qcs615/sm6150/g
> >
> >>   10 files changed, 320 insertions(+)
> >>


-- 
With best wishes
Dmitry

