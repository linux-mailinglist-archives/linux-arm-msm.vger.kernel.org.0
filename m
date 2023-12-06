Return-Path: <linux-arm-msm+bounces-3554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C3C807088
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 14:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 503BE1F215EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 13:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68BC73716A;
	Wed,  6 Dec 2023 13:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n9XrYmdi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2A61BD
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 05:07:59 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-67ac4fc7217so21724286d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 05:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701868079; x=1702472879; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gQpMmP2wZ3s7+6OFWhnGzvX5dkNxaHbZY8w8mGlHd4A=;
        b=n9XrYmdikcSiMDq+clvLq94LurfaElV2iJOIY1Mq4XH0ZudVXzvel9XIlIMSo+TZE8
         lK0BOHq+bQtfD9a5qiP/kkJYWoqpVCZ5RroUMxCbeA7/agZOXTP4tdDFQymDbQ0bxKt3
         b3D5DJHfYLiLNZtnECGAzITGmcVEarKUL1KlWyiZnc0Gb3hZh5GV3plIMs16qWqHa+ie
         crmizJb+9C4Y+K2SkThjF3QJf3g/r68MeBYA4nei1lalC7jXQTEG284f9yTrHNRLWnhl
         4ku/jiaZxFqUc7Ndk020aDebT3yJWGKQ9Bh6B0RIw+hKVBrWY0M1/UvODXLshsp1MzBS
         J2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701868079; x=1702472879;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQpMmP2wZ3s7+6OFWhnGzvX5dkNxaHbZY8w8mGlHd4A=;
        b=v4DZHP6H9J+tZMRmrDQg5BjUBV6FWxkSx1d11pJmtL6dds/cbzFGGoJvmFn0i4tquu
         hc0DtQ4mInhlnklLApejA5LUxZqT0qjQpFvbxUZo3nET1qcOBM83sH4wj+ihzfYkAuj8
         SKvD67x1S4+/8Uck+bubXQj1GRXprmnP7RwYf5NmrGB8zLuW4pIjO/v1rQBJviVRuzSL
         HNV+WC/UZ3G9VXOtKNbP0tkpUjJggmKj0erYoy3PjCxoGmoxMZaRgNSHFvfNZRDGu8ev
         /y0PjVc/il1hJZzpga48jNr7NODBgCZmY4WtOCE/jj0HsPxwAQYqh/a4eLqkRiU6qDdc
         4HCg==
X-Gm-Message-State: AOJu0Yyv+J6SzVRKwKs2YS6tqFe37BDcK2VwdV+lMR0sJ4/gUH5Qa+Qf
	CDKbtNEfWgT85N+BW2sFr9tX
X-Google-Smtp-Source: AGHT+IGMvRlyL7C2KEwGemUA9/VVD3S4C+nqnZP0ubycEacEFHKerwgVJe6trkCFC+NxpJq1nwVcHg==
X-Received: by 2002:a05:6214:d8d:b0:67a:ad52:1f9f with SMTP id e13-20020a0562140d8d00b0067aad521f9fmr862119qve.67.1701868078903;
        Wed, 06 Dec 2023 05:07:58 -0800 (PST)
Received: from thinkpad ([117.202.188.104])
        by smtp.gmail.com with ESMTPSA id y15-20020a0c8ecf000000b0067ac2490d95sm2832957qvb.136.2023.12.06.05.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:07:57 -0800 (PST)
Date: Wed, 6 Dec 2023 18:37:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
	quic_skananth@quicinc.com, quic_vpernami@quicinc.com,
	quic_parass@quicinc.com
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: qcom,qmp: Add PCIe
 qcom,refclk-always-on property
Message-ID: <20231206130746.GC12802@thinkpad>
References: <20231127-refclk_always_on-v3-1-26d969fa8f1d@quicinc.com>
 <78815f1b-7390-40de-8afd-ac71806f4051@linaro.org>
 <24fae40a-453b-b14c-923f-88758a246aa7@quicinc.com>
 <20231201060716.GJ4009@thinkpad>
 <166d307e-7d1b-48b5-90db-9b6df01d87c2@linaro.org>
 <20231201111033.GL4009@thinkpad>
 <f844cd1e-7e4f-4836-bc9a-2e1ed13f064f@linaro.org>
 <20231201123054.GM4009@thinkpad>
 <3a7376aa-18a2-41cb-a4c9-680e735ce75b@linaro.org>
 <c66a93fb-2729-4a86-a2db-f4692f6d0857@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c66a93fb-2729-4a86-a2db-f4692f6d0857@linaro.org>

On Fri, Dec 01, 2023 at 10:29:11PM +0100, Konrad Dybcio wrote:
> On 1.12.2023 14:25, Krzysztof Kozlowski wrote:
> > On 01/12/2023 13:30, Manivannan Sadhasivam wrote:
> >>> What I said before:
> >>> "Again, third time (once from Bjorn, once from Dmitry), rephrase
> >>> property name and description to describe the hardware issue. I see
> >>> description improved, but not the property name. Again in the end of
> >>> description you say what Linux should do. Bindings do not describe Linux
> >>> OS."
> >>>
> >>
> >> You didn't answer my question:
> >>
> >> "I see a plenty of properties similar to this one instructing the OS to keep some
> >> resource ON to workaround hardware issues. So they are all wrong?"
> > 
> > They are not the best, but it all depends on the individual case.
> > 
> >>
> >> If you say they are wrong, why are they approved in the first place?
> > Because we don't have time to keep digging what the driver is doing and
> > what is claimed in DT. Some people don't even CC us on the driver.
> Not sure if I asked this before, but can this not be set in the config
> struct inside the driver?
> 

This cannot be the default config for any platform as keeping refclk always on
will have some power penalty. Only if the hardware (EP or board design) has any
issue, we can turn on this option.

- Mani

> Konrad

-- 
மணிவண்ணன் சதாசிவம்

