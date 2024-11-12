Return-Path: <linux-arm-msm+bounces-37564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2099C5070
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 09:22:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 884BA1F228D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 08:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C970120CCDD;
	Tue, 12 Nov 2024 08:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0v5PZOew"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA0779C4
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731399690; cv=none; b=W9h/VOjvOf9Tv0uUgofa+CHj+qluFPjMnIRj8cfPdiGZsGaFcX0t8IWZDABAtLK9c2MXsjXuwNzri9gtEs9v9tcR27mVvMQBFncqoV3NoAIQaow827X4pizUrcux2B0+dSf5K0pswQssWhgfxacIKXwuZgtkVjh6xBsMsHkkLug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731399690; c=relaxed/simple;
	bh=Uxzxm5ea5xyHccq62Yr8rtYysd3AkZ+x2y27FL++Qw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OnnOs1ccCUCEQsaNQYf+YJHWHubRjatJ6MRLxG/UjRTTnEM+Y1B5RLlV7NTABKWT2nLVpZariJGjCgLiEAHb+RL9NPkCt3ulN3Irbv7KeV4Qd9f5ozCY80pX4AAnMB9SuITFbocGqF5QHbJWD4wZtjadQHiMAykU+5sQJRM6tC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0v5PZOew; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb518014b9so44015521fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 00:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731399687; x=1732004487; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uxzxm5ea5xyHccq62Yr8rtYysd3AkZ+x2y27FL++Qw4=;
        b=0v5PZOewnXNMIdupPz+O1NmLMT+kOh55EY7kqbY8UxxOOViMlNzZF7NSjaHlbcJCCk
         yRY+8Y7tz3V0PiVhVizAesF7nT0RMNw4fnKBn7or2ol75REiFLQTGzS84W9hIhaztz13
         5q6+najOuboE+nlpxgvlifMvcYzaQx50kMKJP265PVot0qBragZD8LHioxL+VVMSd44a
         6pu35zDBbvCBNla29XnRInO+AgVT2CPIvxXnSbNkDLDvuUkeg8hrbviRJLDP5XMVPGa2
         avvwbNTPYa2huqbTf2o7RW0pd4q29i8m38X2Tdz5z2JUFw1Ua5UrlzMty0H3pHBACRoX
         G4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731399687; x=1732004487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uxzxm5ea5xyHccq62Yr8rtYysd3AkZ+x2y27FL++Qw4=;
        b=Ly40CVDwe/qcPiFbxoYpHwQipcprH/ZywHJP9VhAsYK5hOKvUruBnlmexvft/MI/l+
         CGS5Ji5sgwStPGMKHw9FKJr3KRwNFN7VMEM7X7/B6OOuzTKSBnQ06Ff2OFL3mvIQf4Hq
         5EmDPpR+oQiXwBCJe1uAgMWXEEanbuVSn4vhPwCiqWMrLxb7KdGj7pac64Ga1M9E4lfd
         nLyCkN1AEj5tGbazf38pzXh8+vlUtpm33ON3M/lft4nrvW+fqLv5JrINYV6Yug++ssFZ
         yyUyovTAODp7ic148zI6ssbp2vvqqktdHOBePCD2wgirfyp1ec081hmpinEdfR+dWVGh
         QX8Q==
X-Gm-Message-State: AOJu0Ywu5S6Ujk8lLNXwDA3zX86oqAIhEJOzjzJycXU9MmIpFVU1liel
	jVuYheWr9WiMp66pjORO6nMYVbxPO04GUQrPLz39EMZVTGGoERl6+AO8mV/zFcLtx2fWlIzL7/X
	+DAQImplXbkhnMOcLVA0rvnU1CTqz1vHRrICBFg==
X-Google-Smtp-Source: AGHT+IFVGYhhtVdJltvrb5Q3HzqGHbeIDyhkfpyNVBE5lnUQtDNCEzpgZ2uC+RjR4w6nR+0eNq+zBdPYraWQBKs5YAQ=
X-Received: by 2002:a2e:a9a4:0:b0:2fb:4abb:6fe1 with SMTP id
 38308e7fff4ca-2ff2015279fmr68829801fa.4.1731399686821; Tue, 12 Nov 2024
 00:21:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008160947.81045-1-brgl@bgdev.pl> <55ecee09-196a-4c7a-b7cf-61c19737735b@linaro.org>
 <CAMRc=MeTgFaySBFya2e=CYnrXL6R7s9D1DRq+RxKcsf56xMc+g@mail.gmail.com> <CAMRc=MdVUtff7wLV7mxsoXEBY7pUvULuJH1GvJCJgCRj0OpCBg@mail.gmail.com>
In-Reply-To: <CAMRc=MdVUtff7wLV7mxsoXEBY7pUvULuJH1GvJCJgCRj0OpCBg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Nov 2024 09:21:15 +0100
Message-ID: <CAMRc=McMA_iN4QH006-kBEpAwMUKa5=ke+iYpmJJvtihWLQAVQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: qup: use generic device property accessors
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 3:20=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> On Fri, Oct 25, 2024 at 10:04=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > On Tue, Oct 22, 2024 at 2:05=E2=80=AFPM <neil.armstrong@linaro.org> wro=
te:
> > >
> > > On 08/10/2024 18:09, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > There's no reason for this driver to use OF-specific property helpe=
rs.
> > > > Drop the last one in favor of the generic variant and no longer inc=
lude
> > > > of.h.
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > LGTM
> > >
> > > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> >
> > Andi, can you pick this up, please?
> >
> > Bart
>
> Any reason why this simple change cannot be picked up?
>
> Bartosz

I'll take it through my tree for v6.13 if there's no response in the
following days.

Bart

