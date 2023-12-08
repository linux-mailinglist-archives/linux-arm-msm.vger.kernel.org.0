Return-Path: <linux-arm-msm+bounces-3949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C8B80A32D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 13:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B12EA1C20959
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D7619BB9;
	Fri,  8 Dec 2023 12:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="csCsJbiW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7846198D
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 04:27:36 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6d9dc789f23so950339a34.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 04:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702038456; x=1702643256; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d5GaRohf0h1IWsuY7RB86dh4ed8My3jkzq5ac8cnOms=;
        b=csCsJbiW6S5jflHS3gbgE7KV6NAfO5Bvi0MFEB+ilLFspbdHgBn4cK1MjvRmE4pxZh
         29EYLQXyjlDdoXOlrOEggfK8sY1Mq0nVPWVLkrXKj40w1H+c0PcQQV9BKEIF4S2WLu6V
         SYvDWc3tonto2pKN9iFBBY55ODbqdDyFFWZTx5y5E86f2qFv3gignU7sHbimRrqghnH8
         0cU7XYixtYumxuddb0nMa8PLiwFdKAV4BVdareUueG1Chao221CUwP37r6wb+7ykHGBL
         EGAsSMkuE0B07EV1dPzi+DS59W9wAWvQ5woYjy/krxy785G//Z6nRnYVKtw2JA+aDd6i
         Cjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702038456; x=1702643256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5GaRohf0h1IWsuY7RB86dh4ed8My3jkzq5ac8cnOms=;
        b=g6vSlKYED6Oph+wlX6je9Zk8Z7ctVCJAGdnZqKYNVw0r10oZzBUYCK+hDls3+uJ5Xa
         rgLXhRbi+W97dRKmX7Ouyj6085iWB0a7CHW+vX3sqphOoEkQMHIJEKekQx/UMprqq542
         k0AkhP+20UzjGnyob1vwVUwazH7YxVH2hy5gPK0wyoRhYnFMyVc8WQfRlqQDTrWQzwZN
         OJAzreXO1+dpx7xmC0UgXVQjBr5pfRmxaCT71SmjkdKDsUPceJuPNAxQmbP0AFBmBp4K
         Z+oKUZOPLXkAkYkhV/3SBfr8tou9m4c+lQzHzqT3heKNidF9Ujbklnx+bCYnric4oroU
         F3+A==
X-Gm-Message-State: AOJu0YyQoIYcfmE+NV52fz3ETZCcASZK0rbU2IsBNw1oSQJcLD7w5dyl
	Q9KBNRc7W7+V8itx796XUJYc3Vr9IuF/v7wVxZBXNMrFX1t1taty
X-Google-Smtp-Source: AGHT+IH6BV7F+PEhv3epJTH3OpR8RboufeN98w7EXEgzK/7izhoEJn84Qn84Gh9eLbwet2KUB3ixLXbDe2X493oqJpc=
X-Received: by 2002:a9d:7f9a:0:b0:6d9:e454:4e88 with SMTP id
 t26-20020a9d7f9a000000b006d9e4544e88mr1531445otp.63.1702038455897; Fri, 08
 Dec 2023 04:27:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231025115620.905538-1-dmitry.baryshkov@linaro.org>
 <ZXLWiVJYWdlwOBou@hovoldconsulting.com> <CAA8EJpp-BsabZB3FXnFsWZBNbF7keCrOKPPg3Qb7MzE3puMFeg@mail.gmail.com>
 <ZXL5jvDHr-MuxMoz@hovoldconsulting.com> <CAA8EJpoG-qg24wV953Xd9KQ957gpJVHc20Te2cYQWfs9imC63w@mail.gmail.com>
 <ZXMCgVWNCfwmY8oS@hovoldconsulting.com> <CAA8EJpqqekmGrHt11czTTfdM1DVtY5g3j3k-0aM8u1PDQUDHRw@mail.gmail.com>
 <ZXMLhau7pZPv2ftk@hovoldconsulting.com>
In-Reply-To: <ZXMLhau7pZPv2ftk@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 14:27:25 +0200
Message-ID: <CAA8EJpqJwn_13pt8oG38sYbM-Opp6kVhZoXE=6eBWP-=RoXvsg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] usb: typec: ucsi: add workaround for several
 Qualcomm platforms
To: Johan Hovold <johan@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Dec 2023 at 14:25, Johan Hovold <johan@kernel.org> wrote:
>
> On Fri, Dec 08, 2023 at 02:16:27PM +0200, Dmitry Baryshkov wrote:
> > On Fri, 8 Dec 2023 at 13:47, Johan Hovold <johan@kernel.org> wrote:
> > > On Fri, Dec 08, 2023 at 01:10:59PM +0200, Dmitry Baryshkov wrote:
> > > > On Fri, 8 Dec 2023 at 13:09, Johan Hovold <johan@kernel.org> wrote:
>
> > > > > The first error is sometimes GET_CONNECTOR_STATUS failed (-95) instead:
> > > >
> > > > Ack, thank you. This is pending on my side together with the UCSI
> > > > glink / altmode rework. I hope to have patches for that closer to the
> > > > NY.
> > >
> > > What does that mean? That we shall revert these patches until that work
> > > is finished? I don't want to have these errors littering the logs,
> > > scaring users and possibly slowing down boot (those are five second
> > > timeouts).
> >
> > Just send a patch disabling ucsi for sc8280xp.
>
> Ok, will do.
>
> Looks like that is indeed the only platform besides sc8180x which had
> not yet been tested.

And it has its own peculiarities which I didn't observe on other platforms.

>
> > > Also, if this was known issue, why wasn't it mentioned the cover letter
> > > or commit messages?
> >
> > Surely it was not the known issue, otherwise I would not have sent the series.
>
> Ah, sorry, I misunderstood you then.

No problem :-)

-- 
With best wishes
Dmitry

