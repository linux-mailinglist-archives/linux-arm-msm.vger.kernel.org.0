Return-Path: <linux-arm-msm+bounces-3458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFEC805731
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 15:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76ACB1F21614
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 14:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5899565EAB;
	Tue,  5 Dec 2023 14:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GgmZ7moS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D0A18B
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Dec 2023 06:22:57 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5d3c7ef7b31so50141427b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Dec 2023 06:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701786176; x=1702390976; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G/Frwe5NoLiVErGGo0J2Fc9HYe79JYyuyxPi79nNvzQ=;
        b=GgmZ7moSb2Ls8Jzwp9GUedkL79ChZbe5Vn57Lcos0mXNbLufzaVZ/GoPFho+EEK//6
         r2/nmV9N6nmQH3TXCoCMSbI36hqlB1Z1WjMrcXj09US4WQwitsx6oqyl8KQ4m91RyXKr
         DistxXkG+oxDmdXjHcaLgY5nGPARlIhChV2ExZyhsvU/SiaWNCsMJB0qPzZjp9slVSmz
         boRTL/NHScMihGZzq0OU0MnoIll09LmammOAcC9PB2TbahTX3TBoHQuWpsWvH9Z3bkeM
         JnD2SdmkPIS8M6D3zLa1/tgKj9RQuIjcz7XF4+ieYf7ZijxhaqAb6R6TqfY39RIBAGW2
         awMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701786176; x=1702390976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/Frwe5NoLiVErGGo0J2Fc9HYe79JYyuyxPi79nNvzQ=;
        b=tWJQWRU+r1nvcUsV2lXSEGdluwWkPuhN/vcQJ+2lYFatv7ZWXQoFXpJyD0cYpaHqe2
         Xpd3t8nyVFy7z7VCk+94A+eDwo1X4e0CzWcgpZD3golla4sQvK76HRm6y0GlrwY+w2Ry
         WoEk+EbA1UUrjj2rKaOlzIqqI5/v/mnk1QsqIKM0bGURCAsX/EUvGG9muehNnt7x1pGB
         jQPbOQNSuS28O0iP6FpMBIbwGk6HwQbp+3l9cgV0ZS/OZ64DwXrV1lQPjorFXHJc8k+W
         tfqAV6jZ43H9rGsIv76wJMdK/JVx95TH3Ry3/MYgtz9SvmdIBhBTw90YWbR66BElTvF4
         TSbA==
X-Gm-Message-State: AOJu0Yw+LEB8vQdENaj3i1W9ob4d225Z4XtGD/WbmQVmi5BcWUCeM4zg
	38iusK6ZhSVcw5CtnJS5FL62cEFXTFmIFcdFGSIzfg==
X-Google-Smtp-Source: AGHT+IGyrKcpMlCc6HKeOLyBPWiYuASZdAWLwG2aWAnGxzTUHOjqtc2yXhgIigkdzOlV5dwo5Ofz4JjxN6ezYXE4viE=
X-Received: by 2002:a05:6902:248:b0:db7:dad0:76b5 with SMTP id
 k8-20020a056902024800b00db7dad076b5mr3673602ybs.81.1701786176179; Tue, 05 Dec
 2023 06:22:56 -0800 (PST)
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
 <CAA8EJppL0YHHjHj=teCnAwPDkNhwR1EWYuLPnDue1QdfZ3RS_w@mail.gmail.com>
 <20231128125808.7a5f0028@kernel.org> <CAA8EJpqGAK-7be1v8VktFRPpBHhUTwKJ=6JTTrFaWh341JAQEQ@mail.gmail.com>
 <20231204081222.31bb980a@kernel.org>
In-Reply-To: <20231204081222.31bb980a@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Dec 2023 16:22:45 +0200
Message-ID: <CAA8EJprrcH3T8_aA7bZhZXKiWMXjUTZkvLkQzteHUG4_7e4i8w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add MHI Endpoint network driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loic.poulain@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Dec 2023 at 18:12, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Mon, 4 Dec 2023 14:12:12 +0200 Dmitry Baryshkov wrote:
> > Ok, here you are talking about the control path. I can then assume
> > that you consider it to be fine to use netdev for the EP data path, if
> > the control path is kept separate and those two can not be mixed. Does
> > that sound correct?
>
> If datapath == traffic which is intended to leave the card via
> the external port, then yes.

Then I think I understand what causes the confusion.

The MHI netdev is used to deliver network traffic to the modem CPU,
but it is not the controlpath.
For the control path we have non-IP MHI channels (QMI, IPCR, etc).
This can be the traffic targeting e.g. SSH or HTTP server running on
the EP side of the link.

I probably fail to see the difference between this scenario and the
proper virtio netdev which also allows us to send the same IPv4/v6
traffic to the CPU on the EP side.

-- 
With best wishes
Dmitry

