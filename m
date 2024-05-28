Return-Path: <linux-arm-msm+bounces-20746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8AC8D1B5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 14:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A621B2276D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 12:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727D9130482;
	Tue, 28 May 2024 12:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YQJNdWDD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7772502B9
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 12:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716899732; cv=none; b=nwLFoei2OSQ8Ks9CTnASQ2GRbr6AWdkmz1Ar7aTHlnVx9JvVyeuDpGdoNTGdsC7jCZQQFrpbPK/TfDzO4w571rV8vbKNRnpl6UFeEJBYV+VrGgvPqxaczgppuy32+fPubGtZm3Qh93wVHWG2/o8qECU63Ia7u8+j30IP6CNxoyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716899732; c=relaxed/simple;
	bh=3v1uBBjooEdyYDyoX1l+q9hwfK+UTKUfPSA7u5ofWpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMGYudr7cjbOa50H8icRZSFqUkbS2ia8vKYLp/o9TkNcOEshBuMKVjCzNiagURU+yRcnR3gl1FPKJZRwNOOtDkMvcGsQ3zd3DO2iqBSnpW+7hwO+orWunmJFoYA4BU/dTw+PfBWLXUclqdRPZ+7aou+ZzdVqdIwHY+zwvhs+OLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YQJNdWDD; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e6f33150bcso7859411fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 05:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716899729; x=1717504529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n4yeI+hiJZtf8nSaCr8pjgpkOFaZnhw+Y9CcAkyaECY=;
        b=YQJNdWDD0eAi1zv0uYXjwyCVFc+OQ7bqFbvcf/y38BY36qTZ8M8xpYuEG4OnTjBUh6
         zonGG2n5h0UIfEI9K/VYYqrCYZSvGBUHhzEdoWJbXXkcQ0AHxIJe/tOMlNnHrDPEXkX+
         1AkxRGqliQ6bCSnOX2gwhbb0vdiOpAMWc/rftUTmia59a/6zz1A2ysCXuMz/xIdcckkW
         xjthFq0INPd79U0fHWwY0yp1QvpR+AtXP2RyKE9w7HVftIprijvR2iKo26wfMEjLHnI6
         IetnWmXSe7vo9eLnEvhw0aAKpX8VeeOEbCgXeC9BUOhPek7sAdSZ60hl+jD7jh/7qWsw
         +w3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716899729; x=1717504529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4yeI+hiJZtf8nSaCr8pjgpkOFaZnhw+Y9CcAkyaECY=;
        b=RhjtX0IhxgTWldSU7mgsaA6rlbLs8XR62LIriCXjpha8TsY2Ou9XEyL/1laVcY8eGJ
         nkvTzk34fbBX9mFLfl++gojwwAIuci7uFLbfUSUI2Ino8TihR2Yb5nYfNZLPi6RUlvqr
         yXrNP9/C2x4A7KYrl/SCTmSs3ad6TnDxVqGkLqt6KNh4vM1qm53KC8XTJ2SFc788YppP
         ucHfzYs1sBjKWRMf/dgVvjHtbiqHknWQ2eOxlR3rp0GhVuLMn6vGWOYorn87Cp9EZxsk
         fFUrfzWX2HT8VoZYPx8uCsFxBMyLG8qwujFcFN17fIoTxuYpjIKQbULh72GLG2BGYSRg
         Ah1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgeSCRDMSpj0vivtbw3d48dAn4yXLY0zLrfPFtfhlkTodFkYVq0vrXLQhF7YDQOQlBfGPBW/5JWpiOmtYgouD8qVZv6oR43WREGxfKzw==
X-Gm-Message-State: AOJu0YxjHkxVUOzWH+Df7TqWUNSWAzhEfwrm4g1PWZHzmPMTefAqYYf0
	uldpcDPDJqGBz/+cKnmmf156swFZh6Qd1gWiBxiJ9gBCj5bias4+ytodDso3dyQQguOfwjmKlRn
	A
X-Google-Smtp-Source: AGHT+IGZLrg+HKp0k86HZKCf/NS5ffJjw/FyxYg3/CBLQoLNaKl3qjUbz3O0CChbdOjdbfdldpprBw==
X-Received: by 2002:a2e:88c9:0:b0:2e9:5689:6fde with SMTP id 38308e7fff4ca-2e95b099be2mr74576741fa.14.1716899728811;
        Tue, 28 May 2024 05:35:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bf276f9sm22565901fa.138.2024.05.28.05.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 05:35:28 -0700 (PDT)
Date: Tue, 28 May 2024 15:35:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com
Subject: Re: [PATCH v2 5/8] misc: fastrpc: Redesign remote heap management
Message-ID: <wfyiq6ova27t46cjvfgp6unxxo4xnlvsqwfg2z46r3k6y6ab2j@cpi73aresacu>
References: <20240528112956.5979-1-quic_ekangupt@quicinc.com>
 <20240528112956.5979-6-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528112956.5979-6-quic_ekangupt@quicinc.com>

On Tue, May 28, 2024 at 04:59:51PM +0530, Ekansh Gupta wrote:
> Current remote heap design comes with problems where all types
> of buffers are getting added to interrupted list and also user
> unmap request is not handled properly. Add changes to maintain
> list in a way that it can be properly managed and used at different
> audio PD specific scenarios.

This description doesn't tell me what was wrong. "not handled properly"
doesn't describe the problem. "properly managed" also isn't a great
description.

> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 221 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 175 insertions(+), 46 deletions(-)


-- 
With best wishes
Dmitry

