Return-Path: <linux-arm-msm+bounces-27009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CB793BBC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 06:33:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F405B22030
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 04:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC391C694;
	Thu, 25 Jul 2024 04:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p+wOKq8U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106EC1C683
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 04:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721881983; cv=none; b=CLLoAVMCB9FYJrf6rPAhBOm0w6q9buE26DvOGFZ7ttU+9ehRjrLD62GY9o1Tzt8YOn6j7UGnPkjQbYGO3AVSBE44FLAuPQj6crt89yvuBPjeCBC+Uz0GMMGg6Xe/GwRJalGEQ+lJCIID9Eog6t5ZhUtiiDBod18YBAxgUh3aBOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721881983; c=relaxed/simple;
	bh=9PUDpDX3YVNuKkUqONsTAeenTRx75NVihwe7qXjgTvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5Z/QZ4gtEStWZUuofm33UCKtmJuiO9clRTGTh2oQczAr73FmoA0i3NJ9t41mYXjwuhxHiziHeqecyifsgYun8ekOgWZTfYszJEpGOR69VV+RAaRu0PNhKk06l+KbgGXLcs8FnPlRjf1mTfRiZrWA2cSqEDg+2hVFvyTyYXhP3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p+wOKq8U; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-663dd13c0bbso5215337b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jul 2024 21:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721881981; x=1722486781; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rDFqw6oHHPxpfXtOUHUn1IVLUDP2YjdBprOP06yJvHQ=;
        b=p+wOKq8UFkzZntssawnaETB7+9V4o3x7q6aHPWa/rwUv9OzNPcOFkh9McJeJE0fQb0
         QoU3DsT8nJ4s3mkcupW88zf2yzAq9aEEthQJH15UwrbYq9tvrBqDJsZGVMBaKhZ7shv5
         xO2nmHqOh2MaZKSngMEapCmom8y54yk2v1x9sgerz3jamiFgZ48Iwhw+o5M7Dy7H0GVJ
         PJ331rVDelA5A/AsI0h+CX68lKOthMvk8ms72pCGQh4lV82OyVGS3doXXxQkQnxgZdA8
         9coGfyDPrf8IYzIFUbLKzs2oJLfWkzFKCKTedijsDlHtstVlsta8a8R0nVNKhTVhYdXn
         ElQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721881981; x=1722486781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDFqw6oHHPxpfXtOUHUn1IVLUDP2YjdBprOP06yJvHQ=;
        b=oeq7xuW99hPwY4B5t/f4ZX77APNITSeGXSy03RPEFo5lKHRmZhNgI7S7rV4HYhzwyk
         DMB5v+ymu+JJJdCoNoSrTB5rgprq5M1HWrNtdJLSFkdolAD0uUEpTWaL9cew4H7e12cc
         caPuCIzyQm7EOOW+i7QQOCvL+RycJQCFnZgJ6B+dXGsqjE+AEVx8LVRMWG+KrqxN3qEO
         lpup4NSfWIL3L4ipoyViIPjU8UPxLMQ1qL1j75N1rAxRKVSlRFzdKQz95Kee72sQwiBn
         5EN/q2/FelZeBckrN3js8GhHcz+F4XsxOVoE60b8z0Fi9xQGfMb/T7mvB2F0PmS/IaIg
         /sVA==
X-Forwarded-Encrypted: i=1; AJvYcCVEF7EYUGwK+cBjh81X/xfWUdP/s399894PghB++uTJ3qcuq3Rdr4OaJipsne5TFXfEsHH85PcickwEFLH4MIIXR1mHPtKL/lmHa5z6jw==
X-Gm-Message-State: AOJu0YxoBIc+ziPFJ+KTzn9wCD3mwDGj4RQQkHnBh4Gk9DCMT77Ep9OE
	+Q2UXJLclE+wERmzlI9P2mHlQYGvtZl1RHHHcmJlTbBZcFGS+Suf7M7qyVVXwiPL+OQZmgvlzEy
	TGs3L1oNUnTmYbKCfD7kPEK1Wcqjp1k/9+9mV3Q==
X-Google-Smtp-Source: AGHT+IHUKsyqw7tG3OOmxBx8cB5eWQECQmicrTjKE/6hNnrXGqghpEGBVp8H937CrHq2VeWgvBoopVddULDaspRFEXw=
X-Received: by 2002:a0d:e701:0:b0:669:e266:2c55 with SMTP id
 00721157ae682-6751082c4e4mr17035787b3.5.1721881980943; Wed, 24 Jul 2024
 21:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
 <20240702-qcom-tee-object-and-ioctls-v1-1-633c3ddf57ee@quicinc.com>
 <ink4tq3wk2jkpybiisaudkun3g2x2drfogrdw43zdpi6yh2u5g@yrvrxzxsi46g>
 <836dab13-9c59-4d87-a600-a0be6506deb2@quicinc.com> <CAA8EJprp2veCaQq8GsYv4Mu1HQbx8nWv0XWtxcE4cu5kxkA16w@mail.gmail.com>
 <f9e5ef49-754c-4d97-8186-634674151b2f@quicinc.com> <gtdr5s7yih7pjuhpfkjmlu2lflya4heiph4wi446rlbxduqlya@5xfix7dyocli>
 <a1f4457a-2313-4d75-9857-0d82cd502343@quicinc.com>
In-Reply-To: <a1f4457a-2313-4d75-9857-0d82cd502343@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 Jul 2024 07:32:49 +0300
Message-ID: <CAA8EJpojNj0wB1aG3JWBc3AVGAUH7foShiWsX4MYdkYJLWRn8Q@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] firmware: qcom: implement object invoke support
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jul 2024 at 07:15, Amirreza Zarrabi
<quic_azarrabi@quicinc.com> wrote:
>
>
>
> On 7/25/2024 2:09 PM, Dmitry Baryshkov wrote:
> > On Thu, Jul 25, 2024 at 01:19:07PM GMT, Amirreza Zarrabi wrote:
> >>
> >>
> >> On 7/4/2024 5:34 PM, Dmitry Baryshkov wrote:
> >>> On Thu, 4 Jul 2024 at 00:40, Amirreza Zarrabi <quic_azarrabi@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 7/3/2024 10:13 PM, Dmitry Baryshkov wrote:
> >>>>> On Tue, Jul 02, 2024 at 10:57:36PM GMT, Amirreza Zarrabi wrote:
> >>>>>> Qualcomm TEE hosts Trusted Applications and Services that run in the
> >>>>>> secure world. Access to these resources is provided using object
> >>>>>> capabilities. A TEE client with access to the capability can invoke
> >>>>>> the object and request a service. Similarly, TEE can request a service
> >>>>>> from nonsecure world with object capabilities that are exported to secure
> >>>>>> world.
> >>>>>>
> >>>>>> We provide qcom_tee_object which represents an object in both secure
> >>>>>> and nonsecure world. TEE clients can invoke an instance of qcom_tee_object
> >>>>>> to access TEE. TEE can issue a callback request to nonsecure world
> >>>>>> by invoking an instance of qcom_tee_object in nonsecure world.
> >>>>>
> >>>>> Please see Documentation/process/submitting-patches.rst on how to write
> >>>>> commit messages.
> >>>>
> >>>> Ack.
> >>>>
> >>>>>
> >>>>>>
> >>>>>> Any driver in nonsecure world that is interested to export a struct (or a
> >>>>>> service object) to TEE, requires to embed an instance of qcom_tee_object in
> >>>>>> the relevant struct and implements the dispatcher function which is called
> >>>>>> when TEE invoked the service object.
> >>>>>>
> >>>>>> We also provids simplified API which implements the Qualcomm TEE transport
> >>>>>> protocol. The implementation is independent from any services that may
> >>>>>> reside in nonsecure world.
> >>>>>
> >>>>> "also" usually means that it should go to a separate commit.
> >>>>
> >>>> I will split this patch to multiple smaller ones.
> >>>>
> >>>
> >>> [...]
> >>>
> >>>>>
> >>>>>> +    } in, out;
> >>>>>> +};
> >>>>>> +
> >>>>>> +int qcom_tee_object_do_invoke(struct qcom_tee_object_invoke_ctx *oic,
> >>>>>> +    struct qcom_tee_object *object, unsigned long op, struct qcom_tee_arg u[], int *result);
> >>>>>
> >>>>> What's the difference between a result that gets returned by the
> >>>>> function and the result that gets retuned via the pointer?
> >>>>
> >>>> The function result, is local to kernel, for instance memory allocation failure,
> >>>> or failure to issue the smc call. The result in pointer, is the remote result,
> >>>> for instance return value from TA, or the TEE itself.
> >>>>
> >>>> I'll use better name, e.g. 'remote_result'?
> >>>
> >>> See how this is handled by other parties. For example, PSCI. If you
> >>> have a standard set of return codes, translate them to -ESOMETHING in
> >>> your framework and let everybody else see only the standard errors.
> >>>
> >>>
> >>
> >> I can not hide this return value, they are TA dependent. The client to a TA
> >> needs to see it, just knowing that something has failed is not enough in
> >> case they need to do something based on that. I can not even translate them
> >> as they are TA related so the range is unknown.
> >
> > I'd say it a sad design. At least error values should be standard.
> >
>
> Sure. But it is normal. If we finally move to TEE subsystem, this is the value that
> would be copied to struct tee_ioctl_invoke_arg.ret to pass to the caller of
> TEE_IOC_INVOKE.

Ack

-- 
With best wishes
Dmitry

