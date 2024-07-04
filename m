Return-Path: <linux-arm-msm+bounces-25241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CBF9270B3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 09:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58D621C220AA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 07:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783BA16F29C;
	Thu,  4 Jul 2024 07:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TLCg/vkR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E6814A0A8
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jul 2024 07:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720078482; cv=none; b=XmF4IKElj5EV2JfvTuDT6XDDfRG/S7zvPHu3AE08NcWttW+5KKvTguVLggIaOXjoa9FhyGJmfcgx77ubyniRu99380LEpXbiHga4yhp77UXxbWny1ZAzjOcSZel8YsUvA+uBvHUq0TpKRMinfbOVjD3y/Z/IXZJXpWM6ntQ2E3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720078482; c=relaxed/simple;
	bh=VpoVS15y2XzQcFZvsnd8dfEx4qTU+ufCG2U//TBJJec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tjugrvl8LRzc6fA1e+R4ZVn7KmlAUUw72ty8AI8s7sqlcOfhcfZHYq3xhFKXMx7JbDWLxdusl+aPOnt3CNrOPCHjlrgGiZPCCyxnaxBetrRoo7wkF8stH3dY23VED67iYH3WmEsPlZrtv0TjG4yf5pRVTERh5WxHbnp3b9w2wk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TLCg/vkR; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-64789495923so2949857b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jul 2024 00:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720078480; x=1720683280; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSJbA3DiJ1YzPD3LPw7LD0YqK/n1egS96uxWCsi6+XA=;
        b=TLCg/vkRTTtUFKkKRTeCs2qyoehhCLmiONSC1OzuwdGy4Qr4e3K2l30r/vLYIo7i27
         XybKLsFJOwtb0xTeS5Eg3jsmZu5B3xPjv0Bdi2/QO6CQXVl3A6Hrpr+89qIV5+a4R/ZF
         M1da+vDW9IdmDjVjrKP77AvvlF4k065yib33dym6lhGQr/lgi53yhK+tZ7T3V/7vna1Q
         RKfl436r5r4HTrevjLzJJgK44NX1uYNfx8WRtToYdLrkPRTKl1UchnWUnajYGDMUE9TH
         Bs2h9INYwRS7vceQ9ZELNM/bziuk4+pfXhcZAITYfvcelvFLOzSpG2OnAYYIwQJLdIpF
         UrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720078480; x=1720683280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZSJbA3DiJ1YzPD3LPw7LD0YqK/n1egS96uxWCsi6+XA=;
        b=PwCEUw9CbO2ykGtyRrcKB2QwusxEH/xOT9LL6MhxzyHC7HviMAq8UIIGqITcRD8Spa
         EelmG9Y/WWpkrXVUFJ9N1jKkE105HrSzYO17R2L8AHOIo1+RZY6nECd2UwpIi4WhUnl/
         U76WA4vV7d9prISEYgG/T9y8ifiW+WN8o1POCZTYYMwHwfbfoWImxKIQFxQt4DufPQyF
         pM2waqdlsJqYAEdr6PSj419vOJRv6hzF4LJiGDbjAPZY+3Ul1n90hTpOe+oBKlj0lOae
         YVXIDpyH94m8O38z/RkhUobFnjRGMrCXNhxKGX0VP2BouYy4PvgiKJkV6Kh28BI8gWdv
         xv3A==
X-Forwarded-Encrypted: i=1; AJvYcCWNrddy8mssD3ZIA8Xi6D6hehfBDGiJ0P/osd4m+GtwQO/XjLbzzP5PeY0uSza0HM/eJAJ2oO34cFbcvOP0uV2/oXc5Zcq1z9MfgEh6zQ==
X-Gm-Message-State: AOJu0Yx4ZWeAHqnG21zAtnHBCzv0SUn+vGD8n6SiWa1uKN3owmfucKmV
	GIdJ2XOKENRjvNzLA71XX6I8Z72cKuJLpdpV8/hs2I0cAcDTcIW75C74s780OG4HJRkycOGVOuv
	w+/JUY3d/pCJGub+vB+E0Fs/q97qxc4C/0+wS4A==
X-Google-Smtp-Source: AGHT+IHhzigWq58lUOH6s/Jt2RBqXA0UUUMkvO30rPZCplWLfh0mEABxieG1yDWZSLhKM2T0i2/FZBaIpwaJfjilpU0=
X-Received: by 2002:a05:690c:7483:b0:631:2ebf:b8dc with SMTP id
 00721157ae682-652d5333721mr10121657b3.4.1720078479809; Thu, 04 Jul 2024
 00:34:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com>
 <20240702-qcom-tee-object-and-ioctls-v1-1-633c3ddf57ee@quicinc.com>
 <ink4tq3wk2jkpybiisaudkun3g2x2drfogrdw43zdpi6yh2u5g@yrvrxzxsi46g> <836dab13-9c59-4d87-a600-a0be6506deb2@quicinc.com>
In-Reply-To: <836dab13-9c59-4d87-a600-a0be6506deb2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 4 Jul 2024 10:34:28 +0300
Message-ID: <CAA8EJprp2veCaQq8GsYv4Mu1HQbx8nWv0XWtxcE4cu5kxkA16w@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] firmware: qcom: implement object invoke support
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jul 2024 at 00:40, Amirreza Zarrabi <quic_azarrabi@quicinc.com> wrote:
>
>
>
> On 7/3/2024 10:13 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 02, 2024 at 10:57:36PM GMT, Amirreza Zarrabi wrote:
> >> Qualcomm TEE hosts Trusted Applications and Services that run in the
> >> secure world. Access to these resources is provided using object
> >> capabilities. A TEE client with access to the capability can invoke
> >> the object and request a service. Similarly, TEE can request a service
> >> from nonsecure world with object capabilities that are exported to secure
> >> world.
> >>
> >> We provide qcom_tee_object which represents an object in both secure
> >> and nonsecure world. TEE clients can invoke an instance of qcom_tee_object
> >> to access TEE. TEE can issue a callback request to nonsecure world
> >> by invoking an instance of qcom_tee_object in nonsecure world.
> >
> > Please see Documentation/process/submitting-patches.rst on how to write
> > commit messages.
>
> Ack.
>
> >
> >>
> >> Any driver in nonsecure world that is interested to export a struct (or a
> >> service object) to TEE, requires to embed an instance of qcom_tee_object in
> >> the relevant struct and implements the dispatcher function which is called
> >> when TEE invoked the service object.
> >>
> >> We also provids simplified API which implements the Qualcomm TEE transport
> >> protocol. The implementation is independent from any services that may
> >> reside in nonsecure world.
> >
> > "also" usually means that it should go to a separate commit.
>
> I will split this patch to multiple smaller ones.
>

[...]

> >
> >> +    } in, out;
> >> +};
> >> +
> >> +int qcom_tee_object_do_invoke(struct qcom_tee_object_invoke_ctx *oic,
> >> +    struct qcom_tee_object *object, unsigned long op, struct qcom_tee_arg u[], int *result);
> >
> > What's the difference between a result that gets returned by the
> > function and the result that gets retuned via the pointer?
>
> The function result, is local to kernel, for instance memory allocation failure,
> or failure to issue the smc call. The result in pointer, is the remote result,
> for instance return value from TA, or the TEE itself.
>
> I'll use better name, e.g. 'remote_result'?

See how this is handled by other parties. For example, PSCI. If you
have a standard set of return codes, translate them to -ESOMETHING in
your framework and let everybody else see only the standard errors.


-- 
With best wishes
Dmitry

