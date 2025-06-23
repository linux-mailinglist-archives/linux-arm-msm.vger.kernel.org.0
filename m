Return-Path: <linux-arm-msm+bounces-62059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7356AE3ED5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 14:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CD313B78B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 12:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396CE246BB6;
	Mon, 23 Jun 2025 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r+G6Jus5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DC0243369
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 12:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680029; cv=none; b=tptHseMoBUwomN62CoXU7ARFUQgGBqQCoXGbDO9DFIzW+xMw98+uq/PFRcmTCCeBSrYNHngQrVQeSaOtNOa/zUtlOnhJn/+dscicQGXPBHWQBWQA5oKPEwxnts6EW69Rif+29QyNIdsvWG+KclqMlPfBVix+PGorSLR9de2nLeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680029; c=relaxed/simple;
	bh=9AVM/WcfGAXb2jXKPXSmnU+MPuytzkKUS7VdlPBrkYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DR/8p12RW94tBa3I6WYdpzkimEtee0qsbhgh623WwkszyA2y1WA6FIl6EGrTEjR6Qq/qsObgE77oJ49dsGYaaTzbARLAnP2CY2Cb2BFfmGljxlJnnzo6rFChVmq2kDw5gTnk1UKZ7SpKppXE/M7mAMjSbRy7qzUI9efA0dSZ+yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r+G6Jus5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-453398e90e9so26911425e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 05:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750680026; x=1751284826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X56zb7wq5BXdd0ZdmI2KEfFF5TzzFXQroLEo90/IQmA=;
        b=r+G6Jus5uKWN4PZxrcCn4T6zyQtisqPvflNfxwcbRMXfMGFPfTK9uwmXDCqBDyJUrp
         luG5NCxC1f3EvbJsvdFY0ZljDNCVhg8nQsH4z16Xew4IUH7pHbvwlJk1m2654FkkiE/7
         QNsgEcOBmVX8RebfZDrpqIwKpGd/QXjB6/7+oIj2I/6rahaZAecRkaDWo5styIFu7Yal
         Js0IEjLIFNdgKM5hVxsQXKAmTOWrk1ekvXVqpn3JM2XgKLB9DWY3QZhwnGPY0oHe/cRq
         FwHBm7LncnUeloq6rfRvMUtVMWhVD9Leupn/CzeUaMkBWobY36aEeOi7RPb6ul+YBVCg
         86Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750680026; x=1751284826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X56zb7wq5BXdd0ZdmI2KEfFF5TzzFXQroLEo90/IQmA=;
        b=QgniFH0OY8APvgQLSXCf3BIZvfZmBnOB2j7dHCYHvhAMSjasUiewd4by1ZXY9yst4V
         +4ce7QwRIba8Uzwb+cNaLXbsd05NiWwJdY/dpwtqrRHPExom7wFODRjMk12e7aOxRUUJ
         mQLG6nJzV01eSPWgLxtvKu1Par/I3LDtQrh9mKUbrXH420Ov+05VxeHWvhcN92k4Otmv
         zCNsfxn7xmTa0Ai/XvvfrNVfDqIXceCpWCNR/YGuUKW+tuYY+IIQT8D2xhT4onYC/46A
         J6XxhmTCjw0aXdrHiHkif4UrJ/4VfTWFUG1REFFANKpQRPOlExZALTyRMtjE8cCY+UVh
         ceTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRBnTIC1L3vUHTtqFXtT+XzJHv9UMwgtp4BJTNSsTf00xxQQ+irBf736Li5DkpWvqWe8AR/aFsByYfdZ1N@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0vyZopVnGxGvP3UxAGJdvBAuXJQz/e7t6IT1n64tn3elpjqUN
	zy/fJFKDuWq4T9A/lDzXbTvml7gMhaMOdstR+hUSnjMTAhaGZXnpPC2tyw82Bv8pYzc=
X-Gm-Gg: ASbGncs7nrH1s8pFvvNQ8ODzE+VV06jyi4lqKFLulKor5loi1/qB2Ouelrh664EUPBP
	wsrvABa1sYLnRfRWYNWcj1px/SiKj2UOyGr9XMlr9Y5C3rkofz4YiX7dtIx+0bRQKV24Q5A5WPo
	wJ7CZUSk4vOfbjFNGB6Dg6degKtw5IGELbLa1e0CekyiwHvsT5Va8lbJmnpP88UnMpQ2o3tzvst
	FzO6kJwgRrz12Xde3KPiGEItInht1+xZ8xiQRjcSeTeSFB2YGvNiTe2NfFvifCK1bWZc5La43+1
	L/SF+kQigesKWPLpXfp12JB1s5+oib6MXJPP/AdUhzjYXWGL0av/FRfvsg+jXDo14obobO39gg=
	=
X-Google-Smtp-Source: AGHT+IE8eEz4YX2pbEuLSpbBhCa03WIl1GDVOGO4rzNJG+/ebJsxYE3HJyTVgaO5O4s9i3NglkcOqA==
X-Received: by 2002:a05:6000:3103:b0:3a4:f7af:b41 with SMTP id ffacd0b85a97d-3a6d128db06mr9661784f8f.15.1750680025428;
        Mon, 23 Jun 2025 05:00:25 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:b3ca:db17:bc4f:ae5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117c3f7sm9472262f8f.63.2025.06.23.05.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 05:00:24 -0700 (PDT)
Date: Mon, 23 Jun 2025 14:00:20 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Add missing OPP tables for Venus on qcom/arm64
Message-ID: <aFlB1Ae6ZRPX_TM5@linaro.org>
References: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
 <aD1cUF56-IX_tSpp@linaro.org>
 <a47842eb-6d65-4928-8226-461ee36b480b@oss.qualcomm.com>
 <4b3cd0a9-ef63-4adc-b2c2-52fde30fed83@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b3cd0a9-ef63-4adc-b2c2-52fde30fed83@oss.qualcomm.com>

On Wed, Jun 11, 2025 at 10:46:17PM +0200, Konrad Dybcio wrote:
> On 6/11/25 10:43 PM, Konrad Dybcio wrote:
> > On 6/2/25 10:09 AM, Stephan Gerhold wrote:
> >> On Sat, May 31, 2025 at 02:27:18PM +0200, Konrad Dybcio wrote:
> >>> Sparked by <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
> >>>
> >>> No external dependencies
> >>>
> >>
> >> Are you sure?
> >>
> >>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>> ---
> >>> Konrad Dybcio (5):
> >>>       arm64: dts: qcom: msm8916: Add Venus OPP table
> >>>       arm64: dts: qcom: msm8996: Add Venus OPP table
> >>>       arm64: dts: qcom: msm8998: Add Venus OPP table
> >>>       arm64: dts: qcom: sdm630: Add Venus OPP table
> >>
> >> None of these platforms has a power domain that supports performance
> >> states specified in the venus node of the DT, and the venus GDSC does
> >> not have any parent either. I think you will need to update the venus
> >> bindings and add
> >>
> >> 	.opp_pmdomain = (const char *[]) { "cx" /*???*/ },
> >>
> >> for all these in the venus driver (plus backwards compat if not already
> >> there). And then add that power domain additionally in the DT.
> > 
> > Making use of these tables would certainly be welcome.. This patchset
> > was aimed at pushing them to fdt, so that we can debate dropping the
> > hardcoded values in the driver in the future.
> 
> I don't think we can just plug them in to the driver right now, as
> it would also happen to break backwards compat (since
> devm_pm_domain_attach_list() seems to not be particularly happy about
> missing resources) - though arguments can be made both ways: "it
> could have never *really* worked" vs "don't poke at the old driver for
> old hardware too much, as it's gonna break"
> 

You could just make it ignore the returned error for the call to

	ret = devm_pm_domain_attach_list(dev, &opp_pd_data, &core->opp_pmdomain);

? Perhaps with some extra flag that only enables that for the older
platforms.

I suppose having the DT complete is also helpful, even without the
driver changes. But at the end this would be untested "dead" properties
that may turn out being subtly wrong when someone tries to actually
enable it. So having it properly enabled and tested would be good,
especially since the required changes don't sound too massive and
intrusive to me.

Thanks,
Stephan

