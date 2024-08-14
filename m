Return-Path: <linux-arm-msm+bounces-28499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 487C5951AFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 14:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74C851C20B22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 12:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F921B140B;
	Wed, 14 Aug 2024 12:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GXVqUyLM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163D01B013E
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 12:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723639143; cv=none; b=RHdmW4CpxeGs14Df3eSXxFggo7vKQahMAXSVxPl1Urkb2ldfVjZsC/W8aC1LCjA+SZ/bNGkMBdeKwxnWEcsjDTtZ/ZlexZPyVoaAwipBp5Dqmn8bcw/V97lpQ/9uChWG2jvXX4cp5i38h1nwkqK7z5IRKhrxAJofilyd2nuIgig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723639143; c=relaxed/simple;
	bh=z6829gbtT4yJLMB/tAU+iKzRD0DX8KmC7O9nErKM1Fo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gc/+hJ8hYCOTSTErQgeY+aOTc+ZgJFax6cwsG4hsZx2OxFOEO/NO+F/dW9bEGJ1QiTaF2OHIWULXOpw4lomrFx936RW3LQP3pTIgNMJbRrH5DEIXAOBlHSIhoXNDGGuomCMdT0x8gRIp+QFBLEaigxcXxH7mJP/AYlf9ei72fRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GXVqUyLM; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e04196b7603so6643921276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 05:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723639141; x=1724243941; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z6829gbtT4yJLMB/tAU+iKzRD0DX8KmC7O9nErKM1Fo=;
        b=GXVqUyLMNTDiXRus4Oqn0XENhSqiCDwBpDaTia5EjykecDlXYt4xTFuNg+XQ1KoqHC
         +ivceXJgOCvZlQZPdRuaUpxwIg+giqJmmfY6cTqPL04RbRkwhGwV0Wo8JDylhgFHRNId
         EPxGR0CYNiQM9Y8wRO96Cxwy3e5pg382eUGH3rYLro3WuvadLqGoPMIbqafw0sojYUuC
         VzHrd5h/WoK7k345eTXJdqaOVFHS17bWxMcuYlSNwwY8IrhgRUdwljAlSyBpX9Mu3xWR
         3P3DBsIxsPwHq6YYOV5V/l4BlRtJpIpF0D7FZE/NTOidBc6HcuCg2n0zYmbUEE78qIck
         elBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723639141; x=1724243941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z6829gbtT4yJLMB/tAU+iKzRD0DX8KmC7O9nErKM1Fo=;
        b=BAaK22vvBNZ76e8rHC2FJKir7NG+qfwNTsEvsCLYoYcBXKp3lLvtN/VeOxJVDqzJBD
         /9r0JKNLr1YZO4rryee95Y5J8eT6RBxV4TqH/btPc1JfRNLLEjomGkM41b3X/Qpw+md9
         EttkU3uFwQa5xDHDBkly31NLKEui1t5agrdpZB0Vlk5IxumV07QqG4x2Dj9cGMTZAXfa
         eEObGeBYIC3VdS35soGNw+1MFYo9tDZEVDVjC7L/DsI7mdMQtL0pPy6r1KiInqPoDu5z
         duxDIVd/aLAfFc4RUDUg9zcy99xJgQZKxGAlYivl/wRLoL6h4dYuTdztT+vIXUgUiTrw
         /c2w==
X-Forwarded-Encrypted: i=1; AJvYcCVyiUaI+rAnPO6RA/g2y5SFBzYmUvVoolpqXyw9J+vyP4GMBX/Z3ecVyzVxgbhq9LLH/mYbGzKbQ/OsaFXurfdd+eTIzuILb2J2nSsq9Q==
X-Gm-Message-State: AOJu0YyhNkz9IislkyDCUj3+uuZM0nPFJlhmb1Ivz7afZJLwPUwxDTn6
	Q/NQh3LeRAmsYUtUH7DfvQJWshUdNrqcVJi9HmjhyfNyLkwPIhWVGzcE5U4DkMya3VmM0MneMfg
	mTk/rX5If5O/CdiJWmWm6ie4cJdxuWj4FwFuspQ==
X-Google-Smtp-Source: AGHT+IHkkRHVllAhB6FNadDbkbuoZnwmtVCgnklRd2o5H5jpRCX2OPGaEKLjzxOhtnG8i+L32f1vuXQ+Vt3WAf/9toQ=
X-Received: by 2002:a05:6902:84a:b0:e05:fea8:4c77 with SMTP id
 3f1490d57ef6-e1155aa39b7mr3207999276.14.1723639141116; Wed, 14 Aug 2024
 05:39:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240703110741.2668800-1-quic_sibis@quicinc.com>
 <ZoZ6Pk7NSUNDB74i@bogus> <064274c4-3783-c59e-e293-dd53a8595d8e@quicinc.com> <Zofvc31pPU23mjnp@bogus>
In-Reply-To: <Zofvc31pPU23mjnp@bogus>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 14 Aug 2024 14:38:24 +0200
Message-ID: <CAPDyKFrESupeNS4BO8TPHPGpXFLsNqLPrUEw3xzr8oh8FsLHeA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: arm: Fix debugfs node creation failure
To: Sudeep Holla <sudeep.holla@arm.com>, Sibi Sankar <quic_sibis@quicinc.com>
Cc: cristian.marussi@arm.com, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, johan@kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

+ Peng

On Fri, 5 Jul 2024 at 15:04, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Fri, Jul 05, 2024 at 09:16:29AM +0530, Sibi Sankar wrote:
> >
> > On 7/4/24 16:02, Sudeep Holla wrote:
> > >
> > > If there are 2 perf domains for a device or group of devices, there must
> > > be something unique about each of these domains. Why can't the firmware
> > > specify the uniqueness or the difference via the name?
> > >
> > > The example above seems firmware is being just lazy to update it. Also
> > > for the user/developer/debugger, the unique name might be more useful
> > > than just this number.
> > >
> > > So please use the name(we must now have extended name if 16bytes are less)
> > > to provide unique names. Please stop working around such silly firmware
> > > bugs like this, it just makes using debugfs for anything useful harder.
> >
> > This is just meant to address firmware that are already out in the wild.
> > That being said I don't necessarily agree with the patch either since
> > it's penalizing firmware that actually uses a proper name by appending
> > something inherently less useful to it. Since, the using of an unique
> > domain name isn't required by the spec, the need for it goes under the radar
> > for vendors. Mandating it might be the right thing to do since
> > the kernel seems inherently expect that.
> >
>
> Well I would love if spec authors can agree and mandate this. But this is
> one of those things I can't argue as I don't necessarily agree with the
> argument. There are 2 distinct/unique domains but firmware authors ran out
> of unique names for them or just can't be bothered to care about it.
>
> They can't run out of characters as well in above examples, firmware can
> add some useless domain ID in the name if they can't be bothered or creative.
>
> So I must admit I can't be bothered as well with that honestly.

Sudeep, while I understand your point and I agree with it, it's really
a simple fix that $subject patch is proposing. As the unique name
isn't mandated by the SCMI spec, it looks to me that we should make a
fix for it on the Linux side.

I have therefore decided to queue up $subject patch for fixes. Please
let me know if you have any other proposals/objections moving forward.

Kind regards
Uffe

