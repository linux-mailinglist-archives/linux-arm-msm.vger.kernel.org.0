Return-Path: <linux-arm-msm+bounces-32083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA5597D5F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 15:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F002D1F22E04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 13:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E589155330;
	Fri, 20 Sep 2024 13:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uoOJ5z01"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA94E1514EF
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2024 13:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726837526; cv=none; b=BDUD6AqLxLM3fuYgwadxYOQu0X20xpIOVfijvdjEK/7G6F/rCkQYXWnzn3ChwhaWZyQjkNakffi2ziXWF/TygkB7hRCnLcInTM41MMwzg7hV2OGk/CPquCuCPyj2kQXt/E8XwTOK3qvWZvESdeowVzrJ5XmOVOWo3OdxFLe/pxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726837526; c=relaxed/simple;
	bh=MhKUXU8aVOz6mueF2hWqTdMNAcMdiaMDtIq3mhIYgXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q619IBRAADx2kiXkvrZ1N/Y8XSRZyWd+uU6hwL4RGFygtVrWtbN3Dsqw33QKMF/sJ1hMS+v/pnhbyYCQkzD00Lr0yyeqBcw9VeJx4da05+9A+nU4Y8JgwjaDi+MDLMIM2nWHg5gI98YMwhhFEq0/ETeBBihOq/whktFw71JG8/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uoOJ5z01; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6c49c9018ebso19166127b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2024 06:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726837524; x=1727442324; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6YEquTrr3D4weJB4MW0VXORo9GFIbDg2nyF/E+4fEXo=;
        b=uoOJ5z01wkXZYhLA/6cKPkDzB4pOx4LKefchP0r+UfKGXiTtj5H/gYQ55VVDcL6yrX
         DV+BBWA8Y0E7UIPfnvUhEu11oVO0a4HPZHQyx3Ubtj+kVbmisItEjF2GAdSTFp/qv1/9
         0bsgmnZcW9K6rh6Zc7VboGsjy9K1jFXZ2lqtQv3VBp4MZnBbF7UmE8FJbRRIZVPfWq3g
         b4X6fvczRsUHArauHWJjOxK3ayjP/nzEj4bGvHuMvpSBwcAxGU1RCUof6Woit3CeMy66
         k0rctf+oqf3F5AMPs7WzTAn6b2foVUcmoy6u9o5qMjXAo5n4rEtKRgholoObdaGAqlET
         bQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726837524; x=1727442324;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6YEquTrr3D4weJB4MW0VXORo9GFIbDg2nyF/E+4fEXo=;
        b=XTPss8z6v5GfXioCDL9clWmJ76wON9tiMrRko6QL8WrpR95K77v7sYbhZg4VtYLfa0
         M8i8DgK/aMDKl2zGQcMG4s3LdbiobzGANo2bHI7ppGfgcc9mlaURxnpus5NbH61Y3eII
         Iws/pSMAxCKXUrKqTfWpDzhUGkbrRt71VWyzUeO8LhnIYH4SOO0hFNUHeMHt2om9kR2c
         +4ThtIaIyTOhxBtW07fZjDwuLiVv0EXwA2H2RQTGvPzsxbrT8qP89rShefgaNb8wzNI2
         24uYFtXbszN+AJgXzVG9QDrbkkeTiz0bnIhV7Dc5HO6hBhC1gIi1jOEzWTqqZ9goCF7/
         cMXw==
X-Forwarded-Encrypted: i=1; AJvYcCUBCcIhFs1B5bANHu1FV1qEZ4Ez2KVxmOY2ZRzTnFIHzVhAK2tM+p0BwHCyDu+A+V5Q0nMd/KUfpNSUTdzM@vger.kernel.org
X-Gm-Message-State: AOJu0Yzprr2qSaSOYIAt8qcilmu58j00pHCvx6OqEYZHgZ418lbnA8f3
	9MxbFeps1of3H7ZamM9/FSyxQvUPApl8+RE7CHl5X3g6ZrPfPOLWRXMrEMRfhCZAWNpGxrjUoxH
	WD7Z+qA7x9MIWhZo6eXnA5nC++bwPipZtdEHmtQ==
X-Google-Smtp-Source: AGHT+IFKCbJqg1izBLWVia90Fy4fDkzUjWsyKtPze4G1zkwbYRTbTYX0+4jTS47kKvWv19AI0ordJdlpG17IMFA2chE=
X-Received: by 2002:a05:690c:10c:b0:664:4b9c:3de with SMTP id
 00721157ae682-6dff282211fmr18456407b3.13.1726837523708; Fri, 20 Sep 2024
 06:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240920100711.2744120-1-ruanjinjie@huawei.com>
 <lqj3jfaelgeecf5yynpjxza6h4eblhzumx6rif3lgivfqhb4nk@xeft7zplc2xb> <Zu1uKR6v0pI5p01R@linaro.org>
In-Reply-To: <Zu1uKR6v0pI5p01R@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Sep 2024 15:05:13 +0200
Message-ID: <CAA8EJprysL1Tn_SzyKaDgzSxzwDTdJo5Zx4jUEmE88qJ66vdFg@mail.gmail.com>
Subject: Re: [PATCH] net: wwan: qcom_bam_dmux: Fix missing pm_runtime_disable()
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, stephan@gerhold.net, loic.poulain@linaro.org, 
	ryazanov.s.a@gmail.com, johannes@sipsolutions.net, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Sept 2024 at 14:44, Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> On Fri, Sep 20, 2024 at 01:48:15PM +0300, Dmitry Baryshkov wrote:
> > On Fri, Sep 20, 2024 at 06:07:11PM GMT, Jinjie Ruan wrote:
> > > It's important to undo pm_runtime_use_autosuspend() with
> > > pm_runtime_dont_use_autosuspend() at driver exit time.
> > >
> > > But the pm_runtime_disable() and pm_runtime_dont_use_autosuspend()
> > > is missing in the error path for bam_dmux_probe(). So add it.
> >
> > Please use devm_pm_runtime_enable(), which handles autosuspend.
> >
>
> This would conflict with the existing cleanup in bam_dmux_remove(),
> which probably needs to stay manually managed since the tear down order
> is quite important there.

Hmm, the setup and teardown code makes me wonder now. Are we
guaranteed that the IRQs can not be delivered after suspending the
device?
Also is there a race between IRQs being enabled, manual check of the
IRQ state and the pc_ack / power_off calls?

>
> I think this looks reasonable, except that pm_runtime_set_suspended()
> should be redundant since it's the default runtime PM state.
>
> Thanks,
> Stephan



-- 
With best wishes
Dmitry

