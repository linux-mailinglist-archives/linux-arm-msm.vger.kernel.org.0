Return-Path: <linux-arm-msm+bounces-4773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 437F6813272
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 15:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 007B0281618
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 14:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0354C59523;
	Thu, 14 Dec 2023 14:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uyq0eYU9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA1B5CF
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 06:05:01 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5e36848f6c6so8610677b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 06:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702562701; x=1703167501; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jg6+o4DsrIVctuKLZzquDKxy0KIWyG3DEzWy+09p0D0=;
        b=uyq0eYU9IWy2ggdlD4vf1zWL3eeyWfOLsX1HYfBsyCYyOCrK7msrXoowDoRelnKutJ
         V6fk1v7RbwVfvxO6kQewyYlvODda7cOjJ87vOsZCJXKoa4H6c42ZD7ZzeeGoF3yONd2y
         CMyF/E6/PcCRv2sLuJ5uMFopZLmbgYYR6Vo88ybZo6ARlYe/lE+bZss/liqjaXZVrszT
         s3iCQbYXB0wloBUBI17/BLh9TFhBeRI+vxCAHOXPHsTJIVOhNhTZEJGHXeklUsOLzahC
         7zKnIvkj/4GWQkXm3hJLrIybelEwlHEMKbEgELFNTOI5cFVPxncFtutkGbAiOPd0wNj/
         ZFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702562701; x=1703167501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jg6+o4DsrIVctuKLZzquDKxy0KIWyG3DEzWy+09p0D0=;
        b=PpniRyuOrwUl9TWSHgyOU7dFrb6SermfzBsOTiShpSruDzieG4gTZ4K7qM706eiLZ9
         5Q/a0lNNxQHlCJYdZTRXJJir8T97gcDul+avQi09v+KSPd0dVEAebqynsOiedLP/ehzR
         k0FaNIhgZxQfwDl9TJM4BaTFir2bRPVc1X/7uEC9ni7AUiMFyLpQf+O5CgCv21oUNyw3
         nuVMHkykDwdyfuGrmQ6q8t+8sNGvA0Q+HiGGQPhvQm1eiHOVfn703C+d2JBuPwkyUvPk
         cof/crT7GUisvsyRkm75iyPsfbK0W3gLHFYzcYRDn/M2E/Ag7vCoEjNVDq69BZiU/EoN
         Il8Q==
X-Gm-Message-State: AOJu0Ywjy2AloZ9Gpt/tHk7Yh6j8RU/zMuR/6jo0aIyBnSlA9HgQFhGa
	oWl3LOp2HxRT4ndKT2a57Lk7UtY3Ip5YQ7mvqSUXDSvSNEapcQ43vfA=
X-Google-Smtp-Source: AGHT+IGpSmmLZXuBKl2fQ0FWNs06IBa00iIeuRgq5oPka6QFw5K9uddDc0PULJ5XWAfqwwY1mcHg+Pel1zShEfFWfA8=
X-Received: by 2002:a0d:d701:0:b0:5d7:1941:3582 with SMTP id
 z1-20020a0dd701000000b005d719413582mr1996340ywd.105.1702562700940; Thu, 14
 Dec 2023 06:05:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213210644.8702-1-robdclark@gmail.com> <ZXqr0RFw9KsP876v@hovoldconsulting.com>
 <CAA8EJpoSvaq9imP-dT4p=4jveZyFmh=OoWOP7jWGo4OYkHQDTA@mail.gmail.com> <ZXsKzsij3Xb50Ap9@hovoldconsulting.com>
In-Reply-To: <ZXsKzsij3Xb50Ap9@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Dec 2023 16:04:49 +0200
Message-ID: <CAA8EJpqBstKyAfUcBPzoF2CitTwWBZ9Xhd28Y+FCo14OoBqkxw@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: pmic_glink: Fix boot when QRTR=m
To: Johan Hovold <johan@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Dec 2023 at 16:01, Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Dec 14, 2023 at 01:04:43PM +0200, Dmitry Baryshkov wrote:
> > On Thu, 14 Dec 2023 at 09:16, Johan Hovold <johan@kernel.org> wrote:
> > >
> > > On Wed, Dec 13, 2023 at 01:06:43PM -0800, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > We need to bail out before adding/removing devices, if we are going
> > > > to -EPROBE_DEFER.  Otherwise boot will get stuck forever at
> > > > deferred_probe_initcall().
> > >
> > > Can please you expand on why this is a problem here in the commit
> > > message?
> > >
> > > The aux devices appear to be tore down correctly in the probe error
> > > paths so how exactly does that lead to deferred_probe_initcall() being
> > > stuck? This sounds like we may have a problem elsewhere which this patch
> > > is papering over.
> >
> > This is a known problem. Successful probes during the probe deferral
> > loop causes the whole loop to be reiterated. Creating child devices
> > usually results in  a successful probe. Aso I thought that just
> > creating new device also causes a reprobe, but I can not find any
> > evidence now.
>
> This still needs to be described in the commit message.
>
> Only a successful probe should trigger a reprobe, and when the child
> devices are registered the parent is not yet on the deferred probe list.
> So something is not right or missing here.

Child devices can be successfully probed, then the parent gets
-EPROBE_DEFER, removes children and then it goes on and on.

-- 
With best wishes
Dmitry

