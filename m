Return-Path: <linux-arm-msm+bounces-849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4463C7EEC74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 08:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AC8A2811EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 07:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72172B663;
	Fri, 17 Nov 2023 07:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rk/Ufp4i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B19129
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 23:06:08 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6b2018a11efso1738194b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 23:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700204768; x=1700809568; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BFhGxb0d8TVHFbBvoHAaCR3/jKcNUFSpf4eO7oktV0o=;
        b=Rk/Ufp4id45FS1KHVTcsmp8qVJOK0u75InRd9TU06rhk27DweuT3NdJKbhmciYNAi5
         AYTYzw1pX2svy2/V8mnzV2872pW/i7RlV0OV4J+VWi3UTxfUrioqteRAbpKz3uBXWgQS
         nJsIn29P/C65JSPJvrBJMEW97pFrD/HEApoQW9VoqmrP1SJeYayDyt+UKp0IcggEcV8Y
         WNvzC5Zr6UAm23MKpq+P1N+E/U52qjWpQfJ3dIEZzhqMNaPQgrTIduYcZrrs1hD+vaYT
         IOsHUT/1BEKQUtRyqtt5avbhmZjwwoRZ+Jc+GHdGP6Gk2hpH/SPUAKx5AdddW3XK+1Zg
         A+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700204768; x=1700809568;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BFhGxb0d8TVHFbBvoHAaCR3/jKcNUFSpf4eO7oktV0o=;
        b=hS5vXCmwvuxzO+KHDFeZpfxZw787a5+dL5Gf/Xws8kQaIx7cOQJaXMTdx3QpkBCxYa
         sJitvJ0QHgMcrQfFMQzGblzPTNl+vxxMu4eIEzh+Gq7Awr5NR30gDVszbctzN0tKbCPj
         MQYaoh5V1sIjFdcRQd9LWbpKSOQ11QaqA0PlQLeS2bTBh9hfh27wNIMqqO2IZ+cfdUax
         lBp6+iykSZHbB/ykgr3NdnT1qUp5mMyrV7jc/NTS57kIEoGo2SXz8WCBM8t0Sb7O0G+O
         QLPuLDgEXpN+9hqe8TsTBO3ONAH22Z85USwlHsc3YEQgKNGwNDsQIvfIgtku+cl1CcTt
         1WAA==
X-Gm-Message-State: AOJu0YwxzfjSWtlgutrR38vmbsyPILEJPl7GS8KEW4LfnQW+W0pZHgnk
	fS2HxmMnvlfzg2DaUpTjpGaG
X-Google-Smtp-Source: AGHT+IGfIVkXhPOQhA7r6TpFkqTZFEQ5G2MrI3+aG3pqqr9Ey+8Q4SuY6v/Fxjje7LBfSrP37jc2EQ==
X-Received: by 2002:a05:6a21:6d96:b0:186:4430:5d16 with SMTP id wl22-20020a056a216d9600b0018644305d16mr19580645pzb.61.1700204768220;
        Thu, 16 Nov 2023 23:06:08 -0800 (PST)
Received: from thinkpad ([103.28.246.177])
        by smtp.gmail.com with ESMTPSA id z13-20020a056a00240d00b006c320b9897fsm785013pfh.126.2023.11.16.23.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 23:06:07 -0800 (PST)
Date: Fri, 17 Nov 2023 12:36:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	loic.poulain@linaro.org
Subject: Re: [PATCH v2 0/2] Add MHI Endpoint network driver
Message-ID: <20231117070602.GA10361@thinkpad>
References: <20230607152427.108607-1-manivannan.sadhasivam@linaro.org>
 <20230607094922.43106896@kernel.org>
 <20230607171153.GA109456@thinkpad>
 <20230607104350.03a51711@kernel.org>
 <20230608123720.GC5672@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230608123720.GC5672@thinkpad>

Hi Jakub,

On Thu, Jun 08, 2023 at 06:07:20PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Jun 07, 2023 at 10:43:50AM -0700, Jakub Kicinski wrote:
> > On Wed, 7 Jun 2023 22:41:53 +0530 Manivannan Sadhasivam wrote:
> > > > In any case, I'm opposed to reuse of the networking stack to talk
> > > > to firmware. It's a local device. The networking subsystem doesn't
> > > > have to cater to fake networks. Please carry:
> > > > 
> > > > Nacked-by: Jakub Kicinski <kuba@kernel.org>
> > > > 
> > > > if there are future submissions.  
> > > 
> > > Why shouldn't it be? With this kind of setup one could share the data connectivity
> > > available in the device with the host over IP tunneling. If the IP source in the
> > > device (like modem DSP) has no way to be shared with the host, then those IP
> > > packets could be tunneled through this interface for providing connectivity to
> > > the host.
> > > 
> > > I believe this is a common usecase among the PCIe based wireless endpoint
> > > devices.
> > 
> > We can handwave our way into many scenarios and terrible architectures.
> > I don't see any compelling reason to merge this.
> 
> These kind of usecases exist in the products out there in the market. Regarding
> your comment on "opposed to reuse of the network stack to talk to firmware", it
> not the just the firmware, it is the device in general that is talking to the
> host over this interface. And I don't see how different it is from the host
> perspective.
> 
> And these kind of scenarios exist with all types of interfaces like usb-gadget,
> virtio etc... So not sure why the rule is different for networking subsystem.
> 

Sorry to revive this old thread, this discussion seems to have fell through the
cracks...

As I explained above, other interfaces also expose this kind of functionality
between host and the device. One of the credible usecase with this driver is
sharing the network connectivity available in either host or the device with the
other end.

To make it clear, we have 2 kind of channels exposed by MHI for networking.

1. IP_SW0
2. IP_HW0

IP_SW0 is useful in scenarios I explained above and IP_HW0 is purely used to
provide data connectivity to the host machines with the help of modem IP in the
device. And the host side stack is already well supported in mainline. With the
proposed driver, Linux can run on the device itself and it will give Qcom a
chance to get rid of their proprietary firmware used on the PCIe endpoint
devices like modems, etc...

- Mani

> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்

