Return-Path: <linux-arm-msm+bounces-25133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F8C925EC2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 13:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54DEB1F277C3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59307174EF7;
	Wed,  3 Jul 2024 11:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PCxMCuvc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F911741D8
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 11:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720006618; cv=none; b=BDr/1rZoT4R8lAmP2hpz/bv2LIB9hJpGMYEIIMOUbVMt8KrH+sBCfjdAny98lmQOQuiDU0DOP1TPLakLCO4B+CqZbkEsVDjZ79FFQrFVKMW1Vm0Ub1B7UK/fg+tTwu7N2hgAisSHVeWg2nlG1XCgzc9iZr9CE+fCW1KMHQwEclA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720006618; c=relaxed/simple;
	bh=IDGRN2PvO7yqS0Y2VVRQOM2z4DsQkqAtSopvE1ya4YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jslIsG9ol3d0LqhqyOe6yRCA77BSk1OhpaRJtTasWyN/BC8075HQj5OpM/ZcoUD63o6KIJolOBRdGINRh342ZGpnuYwNjS4Jmy574w/CiGsmq1S71QN+WZdtcy1oN4C00GIA5dJcUClS6aVWfrpHJROO+I161t86hCLMUXqJlgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PCxMCuvc; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52cf4ca8904so8628252e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 04:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720006614; x=1720611414; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a9lv0dNph4VIX6fjDIPL0Am9pZ9pFj6rkqPcBPNXsWI=;
        b=PCxMCuvcdO3IkJNH8SEOCusbvG9RfU1NIvqAVdozqHsRSmCXWRDcgh/7NYRhbzqisv
         myfYyUppUrykbfDi+kPR3q+1fSsxk45TGeqjT/qpJcBuaGOI9JYfMvhMQOxKd4sKOhR7
         YNizw62qr8HC1VuqSRgqBq7Qk6fjhMZc/qsipYrewnAKnGZdaaBCIfXcVEi0zrsDh3L5
         EADb9RJ7syB0WE6NxAdvd0cZR1qAFTYnAMlu3MkuZHLWUltHMzGJW9FRDva1+GWeDfBE
         qLLGVuLHMQaQH6c5ChbsMGkm3jF1EFVSKc4eGOOtN3xaF/n11nlb+PkxCwVTDxStpS7k
         jQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720006614; x=1720611414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9lv0dNph4VIX6fjDIPL0Am9pZ9pFj6rkqPcBPNXsWI=;
        b=jce7Mq+XKVRQ3QHY1ZeMVuMZQ6pwkkDS1pqgpJEbIZTooBLjVn9JTDJY5QuLifmkMp
         mM9nqpC3C0SR1R+QjDCch/7AbfFYnF6PLZ+K6Zn4XOKpZlz3NGI0iJKPVJ8jTbiJ36hK
         BR/jcway6dkWU97j1yFZvt25zX8AAyv++skYrNABnb5AD4jbqZP3M0tGKbG1gzHHv7O8
         lrM8rnbYw9487OLQQEVAdGSjmF74pRAYRJCGGJTTw6aUZkMtiiw+NjCJm3vh7ZV3SZ+Q
         dM45kaDF0bvU3BGfsAXIwRO9GDAPuvtrJLB8QK9wXXjtXvlMW4/YX9Looni5QtzcbbmG
         EU7A==
X-Forwarded-Encrypted: i=1; AJvYcCV91clKiQBlGGLyLxJopsiMoAFaF7V7cQ7ficgRyr9ht/U0mNNkuUE/MDA6MvI6UmQw4qGjT5TVdIMErrYBtmjKkYAHANv5DNa8Ik4D+g==
X-Gm-Message-State: AOJu0YxyM3ZaUcOGZFTgn09MjSbCkSZ2SYYoeA2eM7ldH0Acvj09tR0R
	B3f/k746kcf1DXuEqRHW27FjWbpjXexDbqy7mfPY5alGEtq775Tfn+aV3NQk4eY=
X-Google-Smtp-Source: AGHT+IHq5miROCNaH4d32J0OpMAkkQ6y4cLs6SwoFlGLh4VJCgygoze+j6b1zp7HswtTjkNXT++ySg==
X-Received: by 2002:a05:6512:3f5:b0:52e:8018:279b with SMTP id 2adb3069b0e04-52e82747e45mr4620335e87.69.1720006614203;
        Wed, 03 Jul 2024 04:36:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e96d6be30sm207314e87.306.2024.07.03.04.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 04:36:53 -0700 (PDT)
Date: Wed, 3 Jul 2024 14:36:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH RFC 0/3] Implement Qualcomm TEE IPC and ioctl calls
Message-ID: <umwai5fxohuz6apprv6ouhdrnomal4a7cmyhmzpf6dnamnvti2@un4hxx52hkge>
References: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>

On Tue, Jul 02, 2024 at 10:57:35PM GMT, Amirreza Zarrabi wrote:
> Qualcomm TEE hosts Trusted Applications (TAs) and services that run in
> the secure world. Access to these resources is provided using MinkIPC.
> MinkIPC is a capability-based synchronous message passing facility. It
> allows code executing in one domain to invoke objects running in other
> domains. When a process holds a reference to an object that lives in
> another domain, that object reference is a capability. Capabilities
> allow us to separate implementation of policies from implementation of
> the transport.
> 
> As part of the upstreaming of the object invoke driver (called SMC-Invoke
> driver), we need to provide a reasonable kernel API and UAPI. The clear
> option is to use TEE subsystem and write a back-end driver, however the
> TEE subsystem doesn't fit with the design of Qualcomm TEE.
> 
> Does TEE subsystem fit requirements of a capability based system?
> -----------------------------------------------------------------
> In TEE subsystem, to invoke a function:
>    - client should open a device file "/dev/teeX",
>    - create a session with a TA, and
>    - invoke the functions in that session.
> 
> 1. The privilege to invoke a function is determined by a session. If a
>    client has a session, it cannot share it with other clients. Even if
> it does, it is not fine-grained enough, i.e. either all accessible
> functions/resources in a session or none. Assume a scenario when a client
> wants to grant a permission to invoke just a function that it has the rights,
> to another client.
> 
> The "all or nothing" for sharing sessions is not in line with our
> capability system: "if you own a capability, you should be able to grant
> or share it".

Can you please be more specific here? What kind of sharing is expected
on the user side of it?

> 2. In TEE subsystem, resources are managed in a context. Every time a
>    client opens "/dev/teeX", a new context is created to keep track of
> the allocated resources, including opened sessions and remote objects. Any
> effort for sharing resources between two independent clients requires
> involvement of context manager, i.e. the back-end driver. This requires
> implementing some form of policy in the back-end driver.

What kind of resource sharing?

> 3. The TEE subsystem supports two type of memory sharing:
>    - per-device memory pools, and
>    - user defined memory references.
> User defined memory references are private to the application and cannot
> be shared. Memory allocated from per-device "shared" pools are accessible
> using a file descriptor. It can be mapped by any process if it has
> access to it. This means, we cannot provide the resource isolation
> between two clients. Assume a scenario when a client wants to allocate a
> memory (which is shared with TEE) from an "isolated" pool and share it
> with another client, without the right to access the contents of memory.

This doesn't explain, why would it want to share such memory with
another client.

> 4. The kernel API provided by TEE subsystem does not support a kernel
>    supplicant. Adding support requires an execution context (e.g. a
> kernel thread) due to the TEE subsystem design. tee_driver_ops supports
> only "send" and "receive" callbacks and to deliver a request, someone
> should wait on "receive".

There is nothing wrong here, but maybe I'm misunderstanding something.

> We need a callback to "dispatch" or "handle" a request in the context of
> the client thread. It should redirect a request to a kernel service or
> a user supplicant. In TEE subsystem such requirement should be implemented
> in TEE back-end driver, independent from the TEE subsystem.
> 
> 5. The UAPI provided by TEE subsystem is similar to the GPTEE Client
>    interface. This interface is not suitable for a capability system.
> For instance, there is no session in a capability system which means
> either its should not be used, or we should overload its definition.

General comment: maybe adding more detailed explanation of how the
capabilities are aquired and how they can be used might make sense.

BTW. It might be my imperfect English, but each time I see the word
'capability' I'm thinking that some is capable of doing something. I
find it hard to use 'capability' for the reference to another object.

> 
> Can we use TEE subsystem?
> -------------------------
> There are workarounds for some of the issues above. The question is if we
> should define our own UAPI or try to use a hack-y way of fitting into
> the TEE subsystem. I am using word hack-y, as most of the workaround
> involves:
> 
> - "diverging from the definition". For instance, ignoring the session
>   open and close ioctl calls or use file descriptors for all remote
> resources (as, fd is the closet to capability) which undermines the
> isolation provided by the contexts,
> 
> - "overloading the variables". For instance, passing object ID as file
>   descriptors in a place of session ID, or
> 
> - "bypass TEE subsystem". For instance, extensively rely on meta
>   parameters or push everything (e.g. kernel services) to the back-end
> driver, which means leaving almost all TEE subsystem unused.
> 
> We cannot take the full benefits of TEE subsystem and may need to
> implement most of the requirements in the back-end driver. Also, as
> discussed above, the UAPI is not suitable for capability-based use cases.
> We proposed a new set of ioctl calls for SMC-Invoke driver.
> 
> In this series we posted three patches. We implemented a transport
> driver that provides qcom_tee_object. Any object on secure side is
> represented with an instance of qcom_tee_object and any struct exposed
> to TEE should embed an instance of qcom_tee_object. Any, support for new
> services, e.g. memory object, RPMB, userspace clients or supplicants are
> implemented independently from the driver.
> 
> We have a simple memory object and a user driver that uses
> qcom_tee_object.

Could you please point out any user for the uAPI? I'd like to understand
how does it from from the userspace point of view.

> 
> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> ---
> Amirreza Zarrabi (3):
>       firmware: qcom: implement object invoke support
>       firmware: qcom: implement memory object support for TEE
>       firmware: qcom: implement ioctl for TEE object invocation
> 
>  drivers/firmware/qcom/Kconfig                      |   36 +
>  drivers/firmware/qcom/Makefile                     |    2 +
>  drivers/firmware/qcom/qcom_object_invoke/Makefile  |   12 +
>  drivers/firmware/qcom/qcom_object_invoke/async.c   |  142 +++
>  drivers/firmware/qcom/qcom_object_invoke/core.c    | 1139 ++++++++++++++++++
>  drivers/firmware/qcom/qcom_object_invoke/core.h    |  186 +++
>  .../qcom/qcom_object_invoke/qcom_scm_invoke.c      |   22 +
>  .../firmware/qcom/qcom_object_invoke/release_wq.c  |   90 ++
>  .../qcom/qcom_object_invoke/xts/mem_object.c       |  406 +++++++
>  .../qcom_object_invoke/xts/object_invoke_uapi.c    | 1231 ++++++++++++++++++++
>  include/linux/firmware/qcom/qcom_object_invoke.h   |  233 ++++
>  include/uapi/misc/qcom_tee.h                       |  117 ++
>  12 files changed, 3616 insertions(+)
> ---
> base-commit: 74564adfd3521d9e322cfc345fdc132df80f3c79
> change-id: 20240702-qcom-tee-object-and-ioctls-6f52fde03485
> 
> Best regards,
> -- 
> Amirreza Zarrabi <quic_azarrabi@quicinc.com>
> 

-- 
With best wishes
Dmitry

