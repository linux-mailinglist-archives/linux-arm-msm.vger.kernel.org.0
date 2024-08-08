Return-Path: <linux-arm-msm+bounces-28153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9DA94BCCB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 14:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19B18B2287F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 12:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5837218C32B;
	Thu,  8 Aug 2024 12:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oG4ktlny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C011A18B48A
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Aug 2024 12:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723118483; cv=none; b=e9Lgi4nhCicEDE3WGZfkX3LDnWKu4MIPS3ELXic819Yi6F4hfoMdhRnBJ9pGsgYaHX6pD9Q0x6YMfRXwvZ88FqRhH0BWuiYtGDUPPMVcx9Y0HMe4e7tnCofbtDATulG2gQVUQNhKMVDYLnB32zG5EaAedGl+LW8kcg2obotYZPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723118483; c=relaxed/simple;
	bh=v1/ezKij1Xb1/LM0FzxebKnX6GG097BFMwzk7oYzp/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjtDsYZk69QUZKwbdafhD0ZUQ1X414QNmEyMo0K3yjnkRHk+vHJDHvRuhMNmDCsvh4pZCrMffY3IhwMAy1jSxAXeag2PZHWb1sUWG8GVYQrerceazag99osOP568gTRWjrFV1KTjlTeHWwvTM/B+YUph3M/10bAa2ay5rL+SO2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oG4ktlny; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fda7fa60a9so8620485ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Aug 2024 05:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723118481; x=1723723281; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x56HaYfAguqXwkXH/W0VkzCpF6NMLJ6hsKX1WsF80Hc=;
        b=oG4ktlnyivgSythmARtVDS0DcvSmdkuwukckwShy20aF0fGS76+jy5OpA7uJUrvy3e
         KhpCdWg+kvqulKeRS+twAoDDrSROJmn2/5WiCavoXJRPi6C+RYPH3kdZocKInrIwp0/S
         clGJ9jZeHMXfCAriAE+sgRdN2+PQJM+NV+/brsYNT+RpoGQh8/isJ9cu/a1k/Pcn2Flf
         vVR1Yqf8as1rbta0++So2bXS1QGup015HSyXHzYKRDAS6gYs0GrXQ1fnVJ3AqAiy2iV1
         qTK4bZrmRoBASnuNCzjluyuEHIIyd0WfD6gLyxsZ3orAKczP4jpx1Qe1Rdhp2FZ4kkMf
         RiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723118481; x=1723723281;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x56HaYfAguqXwkXH/W0VkzCpF6NMLJ6hsKX1WsF80Hc=;
        b=tD5IwmQjHDpbulnNCB5dBRohhnJPDUpVZI8flyPxfP995ZhUjf/Vmr37Tmga8xscoQ
         eBxJQOQXd/8EB/yeBpGgVXUbyIbX6qW9ppQKYpjKxPpkutUegnNS5Y8FgLlV3Tz5dggy
         Ae275RN22brBOOq1lQAiHyzUq4tkDMCcgJNH6c00P3K2FT2Re/MiWfCrr+7irHHi572c
         s+tkaesU7mPguwNg746FOluSddtZ+O+YnzAe3PLEWo9BVdCh7vXJgpEvUmW9ZSBq+96i
         qNRt4OpIcmujLJNqlSe+kFAPIZHrCygwj4dO95NrQO45zUgf3NGq8wEOHZVOz56L+t45
         4oOg==
X-Forwarded-Encrypted: i=1; AJvYcCWG5/P+Kq4jAOvZ2kwfBXnSqNVEDmJ9IV4nu4Ey3uDJcwVP5yN2aB+seyg0vJb7K7Aos763PDTDVcD40ZZyWDlNjFD2FoEVnwtwXw8nMw==
X-Gm-Message-State: AOJu0YxtYRsp0tQfRv82JkIFoI8wEnMmk6IZb/SFrtSnUkDU1q93qfCo
	tueWizA0erCfBBJ/D5Z+febXhAHMIZjhR9IZz2FAKcrxEqKj5i15e9BNisf7wQ==
X-Google-Smtp-Source: AGHT+IHer9Cx3RKHDR+QrEa4bUNXipYY8dzX3QCoI0MnxJJA0/SxKpWCbY7pKxl6gWV8lep00FD9dg==
X-Received: by 2002:a17:902:f605:b0:1fd:6766:6877 with SMTP id d9443c01a7336-20095224b8dmr25116925ad.2.1723118480848;
        Thu, 08 Aug 2024 05:01:20 -0700 (PDT)
Received: from thinkpad ([120.60.136.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b3ad01d4sm3285656a91.23.2024.08.08.05.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 05:01:20 -0700 (PDT)
Date: Thu, 8 Aug 2024 17:31:09 +0530
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
Message-ID: <20240808120109.GA18983@thinkpad>
References: <20240803-qps615-v2-0-9560b7c71369@quicinc.com>
 <20240803-qps615-v2-1-9560b7c71369@quicinc.com>
 <5f65905c-f1e4-4f52-ba7c-10c1a4892e30@kernel.org>
 <f8985c98-82a5-08c3-7095-c864516b66b9@quicinc.com>
 <ZrEGypbL85buXEsO@hu-bjorande-lv.qualcomm.com>
 <90582c92-ca50-4776-918d-b7486cf942b0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90582c92-ca50-4776-918d-b7486cf942b0@kernel.org>

On Mon, Aug 05, 2024 at 07:18:04PM +0200, Krzysztof Kozlowski wrote:
> On 05/08/2024 19:07, Bjorn Andersson wrote:
> > On Mon, Aug 05, 2024 at 09:41:26AM +0530, Krishna Chaitanya Chundru wrote:
> >> On 8/4/2024 2:23 PM, Krzysztof Kozlowski wrote:
> >>> On 03/08/2024 05:22, Krishna chaitanya chundru wrote:
> >>>> diff --git a/Documentation/devicetree/bindings/pci/qcom,qps615.yaml b/Documentation/devicetree/bindings/pci/qcom,qps615.yaml
> > [..]
> >>>> +  qps615,axi-clk-freq-hz:
> >>>> +    description:
> >>>> +      AXI clock which internal bus of the switch.
> >>>
> >>> No need, use CCF.
> >>>
> >> ack
> > 
> > This is a clock that's internal to the QPS615, so there's no clock
> > controller involved and hence I don't think CCF is applicable.
> 
> AXI does not sound that internal.

Well, AXI is applicable to whatever entity that implements it. We mostly seen it
in ARM SoCs (host), but in this case the PCIe switch also has a microcontroller
/processor of some sort, so AXI is indeed relevant for it. The naming actually
comes from the switch's i2c register name that is being configured in the driver
based on this property value.

> DT rarely needs to specify internal
> clock rates. What if you want to define rates for 20 clocks? Even
> clock-frequency is deprecated, so why this would be allowed?
> bus-frequency is allowed for buses, but that's not the case here, I guess?
> 

This clock frequency is for the switch's internal AXI bus that runs at default
200MHz. And this property is used to specify a frequency that is configured over
the i2c interface so that the switch's AXI bus can operate in a low frequency
there by reducing the power consumption of the switch.

It is not strictly needed for the switch operation, but for power optimization.
So this property can also be dropped for the initial submission and added later
if you prefer.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

