Return-Path: <linux-arm-msm+bounces-28157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C46A94BDB3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 14:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EF961C2011E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 12:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0547F18C925;
	Thu,  8 Aug 2024 12:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xq9yiwAV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E07E18C911
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Aug 2024 12:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723120900; cv=none; b=AwMKZm0bPSs8HBpZBA+pXwdN4Qpy8GAJgCV4qTZxQgMolKM6/gMzSyFZPRrBAoBuSj+EMeoGppJKeuWSNzjnZkHWRwwIT6JgkYNm/p1yj+zmNIfCcp/Z70l1jLYvyoTvkHmVmUToMkNRa4N0p8+tcXM5F08vEs7DE3nHWZ2sqhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723120900; c=relaxed/simple;
	bh=hkr9WGJyGQYdEgES+RHkmsEEcDQ7Ewuv/VkdQZ3r+oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAvxweMw+4TJMHRI7tkJSGOVZlrUNQw7XY0Sc/4haWeokuYyOdJTtMlEdIKNXDYFk8WOI589m6p0DsxhxDoxRjHmzZ3mvbQHlX3pu4+CxwTRH4s5Qk1rKfawB5k5HkrdEmC+tDi+b2gCs6NKQJjd9owvMrV6+LGBwRGD62ARIos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xq9yiwAV; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-656d8b346d2so615253a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Aug 2024 05:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723120899; x=1723725699; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JDkeMjSSE/q2/D8tDcbbL2oQ2eQNUSlKo6jAVgmOk6M=;
        b=xq9yiwAVNUmug7tzVNyD33SU45x0/3u8ee3a+Sib94iycdgFESyDcRX3OhtlXJRA+v
         05eSprXbrC9JwbK7TUfl3TvEoqmHRxpuhdEIAwk7PHL+tDUrH9Ht8Fhzn6asggZMF/ZW
         +yvrOrODoOyzlHfudj3tg4vw0jKgZDLvBQ4EXNomCmKlFUiadNrDw2oE+Rz5d6mTuyXt
         2nbLNcN+PpKm+5VYpatYYNXsClOTRwJ2VcuX1dg9CP3PzVGVt1nXniZwK45Ikpq7wNkx
         lrT1URgIc/MfjZnjhx27IeX+zp+u7QTVdM5Ly50VX1MyAGax7m9JiVrKxUr46gRiaJSW
         hzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723120899; x=1723725699;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JDkeMjSSE/q2/D8tDcbbL2oQ2eQNUSlKo6jAVgmOk6M=;
        b=rRpOfYMltHMpzyEKQtm0Jy5Hl9ICD+gvK3l5clO0duOIhYkeSz+TfeH70Ev5gvNDSq
         CruIRoXz0XWsukvn43o/ZvtuNUFO/YXQbQMhIM9WyqXa7NH5t01YrGMlmXahWY2LK4Ky
         R7Q7yP0yDEZrPSHilNuORHVVgj+2p1pjdVV54XORTQ9V8rChNcbDXwg/cLlCltbKJGKs
         oSWJ5901W8vxn/EZ9fLnJhVEENn5Me2Oi3Fbxra02Ii/d/2rGAw2Dbi4p86uRts6v9A8
         82fN0517Z29ABLWyqSyw1sL71fEOzOfuxyQJtcqqtEJPhpRuzU7GSE8NKCMuEYKJxvym
         X6sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiKkRAtI0irrtF2kFt7RDK65B4Lj3pZ/OD1urrIQtx0qBFlU6gwPlgKkdE0yAhad3/v0VDrqCst6OkojO2VRNykjbHfT7VKn2nOF2ypg==
X-Gm-Message-State: AOJu0YxKEtLLFs0vvzODombQg6HHkiuabJ3xy07yY8VOhb/FZicSM427
	FGqMztR7KdoAbiQAmDkJcwmqkF5A/tvyYuFsQHDo3P73v4zfcQLv8ex99VBLQQ==
X-Google-Smtp-Source: AGHT+IHhEQXIaC4hSwtqImtR0VaMhf/q4UqBwMBcF5Q5CSvQc/aZj4QJVZX5anT30C7V8NQ1r/Dw/A==
X-Received: by 2002:a17:90a:17e2:b0:2cb:4c06:8f11 with SMTP id 98e67ed59e1d1-2d1c33f070fmr2059832a91.22.1723120898644;
        Thu, 08 Aug 2024 05:41:38 -0700 (PDT)
Received: from thinkpad ([120.60.136.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b3ab9b3fsm3391453a91.20.2024.08.08.05.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 05:41:38 -0700 (PDT)
Date: Thu, 8 Aug 2024 18:11:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>,
	Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	cros-qcom-dts-watchers@chromium.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jingoo Han <jingoohan1@gmail.com>, andersson@kernel.org,
	quic_vbadigan@quicinc.com, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: PCI: Add binding for qps615
Message-ID: <20240808124121.GB18983@thinkpad>
References: <20240803-qps615-v2-0-9560b7c71369@quicinc.com>
 <20240803-qps615-v2-1-9560b7c71369@quicinc.com>
 <5f65905c-f1e4-4f52-ba7c-10c1a4892e30@kernel.org>
 <f8985c98-82a5-08c3-7095-c864516b66b9@quicinc.com>
 <ZrEGypbL85buXEsO@hu-bjorande-lv.qualcomm.com>
 <90582c92-ca50-4776-918d-b7486cf942b0@kernel.org>
 <20240808120109.GA18983@thinkpad>
 <cb69c01b-08d0-40a1-9ea2-215979fb98c8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb69c01b-08d0-40a1-9ea2-215979fb98c8@kernel.org>

On Thu, Aug 08, 2024 at 02:13:01PM +0200, Krzysztof Kozlowski wrote:
> On 08/08/2024 14:01, Manivannan Sadhasivam wrote:
> > On Mon, Aug 05, 2024 at 07:18:04PM +0200, Krzysztof Kozlowski wrote:
> >> On 05/08/2024 19:07, Bjorn Andersson wrote:
> >>> On Mon, Aug 05, 2024 at 09:41:26AM +0530, Krishna Chaitanya Chundru wrote:
> >>>> On 8/4/2024 2:23 PM, Krzysztof Kozlowski wrote:
> >>>>> On 03/08/2024 05:22, Krishna chaitanya chundru wrote:
> >>>>>> diff --git a/Documentation/devicetree/bindings/pci/qcom,qps615.yaml b/Documentation/devicetree/bindings/pci/qcom,qps615.yaml
> >>> [..]
> >>>>>> +  qps615,axi-clk-freq-hz:
> >>>>>> +    description:
> >>>>>> +      AXI clock which internal bus of the switch.
> >>>>>
> >>>>> No need, use CCF.
> >>>>>
> >>>> ack
> >>>
> >>> This is a clock that's internal to the QPS615, so there's no clock
> >>> controller involved and hence I don't think CCF is applicable.
> >>
> >> AXI does not sound that internal.
> > 
> > Well, AXI is applicable to whatever entity that implements it. We mostly seen it
> > in ARM SoCs (host), but in this case the PCIe switch also has a microcontroller
> > /processor of some sort, so AXI is indeed relevant for it. The naming actually
> > comes from the switch's i2c register name that is being configured in the driver
> > based on this property value.
> > 
> >> DT rarely needs to specify internal
> >> clock rates. What if you want to define rates for 20 clocks? Even
> >> clock-frequency is deprecated, so why this would be allowed?
> >> bus-frequency is allowed for buses, but that's not the case here, I guess?
> >>
> > 
> > This clock frequency is for the switch's internal AXI bus that runs at default
> > 200MHz. And this property is used to specify a frequency that is configured over
> > the i2c interface so that the switch's AXI bus can operate in a low frequency
> > there by reducing the power consumption of the switch.
> > 
> > It is not strictly needed for the switch operation, but for power optimization.
> > So this property can also be dropped for the initial submission and added later
> > if you prefer.
> 
> So if the clock rate can change, why this is static in DTB? Or why this
> is configurable per-board?
> 

Because, board manufacturers can change the frequency depending on the switch
configuration (enablement of DSP's etc...)

> There is a reason why clock-frequency property is not welcomed and you
> are re-implementing it.
> 

Hmm, I'm not aware that 'clock-frequency' is not encouraged these days. So you
are suggesting to change the rate in the driver itself based on the switch
configuration? If so, what difference does it make?

And no more *-freq properties are allowed?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

