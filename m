Return-Path: <linux-arm-msm+bounces-2334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF4D7FC58E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 21:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1BF21C20F70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 20:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B82F5C08D;
	Tue, 28 Nov 2023 20:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OZo70hHW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E90DC
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 12:36:02 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-58d12b53293so3333205eaf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 12:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701203761; x=1701808561; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8QlqPdsqaKfOX4ybpeoxfRZcdk2EJ2CcgPBS+ybUncU=;
        b=OZo70hHWiTTFFoNK/myvRMKlNndV5GgTqTBj7uIQhy8oyN4WgomPZMPm7k21r2PJV2
         Siv8v78XFghK3IYVj8ah0Nos6L7hfS4zO2+mYubq9Hst5wTOjQnNBkj2v+RdSd23SlYW
         oxpBSp92bCszoWbYMob3cpV+H46wO6Q73xw8vOGZLcTKYQOPhDQpWZZhZP+Lp9SEO78a
         680geMRkI6YKOC90jr82eBA878lf6CJQnypyAQfpw/s0I0cUFYZRVft45W2oa8u72fuk
         PVLU1AWmiHSmCMZBUFDbK2jz0hV2H2TkfAP01IsxF9UY/3FDsVpx33KwajyGwyMflJd2
         eUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701203761; x=1701808561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8QlqPdsqaKfOX4ybpeoxfRZcdk2EJ2CcgPBS+ybUncU=;
        b=uhNpnuvBjEXFFMFuAQE4awES3NBNkpJhYi2N2qay+v1MeB6DjAzS6d79zn2hi6Gop0
         aI4N9O0BGCDqlBRhmmT43MNrFt1G+XsAVQJsIcVvIdlqeQliKfh4UlG89sEWrQfSgUhq
         byja0E01n5wuC0pfbrlW0yymbfybk+28o5N9vM2q7DYk67B7gzHj8c21aBRbdKIZZQyL
         sSETaV8oxfC6yEVpRWP22M14TATUlHAK4L88fwtDGH21QRH7NKVOwLltPDmZEEfTriH9
         NkzW/bSaLNRYVG67u06s3naEGd6Y3w/d9KXsFxr75oLdytGb+DBBKaztreS10x2hC8hy
         fo5g==
X-Gm-Message-State: AOJu0YwCmQVJRrXqCDv2+GXr6RDrUpIUhEZtEod/n8uRmxLHn5E8hPWu
	k86dL5Um+Jng46RtxqIummA/REB/8b2Atv/+8pGlHPxkyrHUmC5a
X-Google-Smtp-Source: AGHT+IFzsmlB/1Q5gxxim4y4vmRNi1YzA551Xf7Btg7SG2Mt7yLBRFaDXl11rOlT2eb6ssG2GPUC+ENHaKVHfploOV4=
X-Received: by 2002:a05:6358:60cd:b0:16b:c249:9b97 with SMTP id
 i13-20020a05635860cd00b0016bc2499b97mr20105639rwi.18.1701203761477; Tue, 28
 Nov 2023 12:36:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230607152427.108607-1-manivannan.sadhasivam@linaro.org>
 <20230607094922.43106896@kernel.org> <20230607171153.GA109456@thinkpad>
 <20230607104350.03a51711@kernel.org> <20230608123720.GC5672@thinkpad>
 <20231117070602.GA10361@thinkpad> <20231117162638.7cdb3e7d@kernel.org>
 <20231127060439.GA2505@thinkpad> <20231127084639.6be47207@kernel.org>
In-Reply-To: <20231127084639.6be47207@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 Nov 2023 22:35:50 +0200
Message-ID: <CAA8EJppL0YHHjHj=teCnAwPDkNhwR1EWYuLPnDue1QdfZ3RS_w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add MHI Endpoint network driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loic.poulain@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Nov 2023 at 18:46, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Mon, 27 Nov 2023 11:34:39 +0530 Manivannan Sadhasivam wrote:
> > I think you made up your mind that this driver is exposing the network interface
> > to the firmware on the device. I ought to clearify that the device running this
> > driver doesn't necessarily be a modem but a PCIe endpoint instance that uses the
> > netdev exposed by this driver to share data connectivity with another device.
>
> Doesn't matter how many legit use cases you can come up with.
> Using netdev as a device comm channel is something I am
> fundamentally opposed to.
>
> > This concept is not new and being supported by other protocols such as Virtio
> > etc...
>
> Yes. Use virtio, please.

We can try using virtio if we control both sides of the link. However
there are usecases of the upstream Linux running on the modem (PCIe
EP) side and other systems (Win, Android) running on the RC side. In
such cases we have to provide the interface that is expected by the
host driver, which unfortunately is MHI. Not to mention that one of
the PCIe EP regions contains registers which are targeting the MHI
protocol. I am not sure how hardware will react if we bypass this
completely and implement VirtIIO or NTB instead.

Also, please excuse me if this was already answered, just for my understanding:
- If we limit functionality to just networking channels which are used
to pass IP data between host and EP, will that be accepted?

- If we were to implement the PCIe networking card running Linux (e.g.
using Freescale PowerQUICC or Cavium Octeon chips), would you also be
opposed to implementing the EP side of the link as the netdev?

-- 
With best wishes
Dmitry

