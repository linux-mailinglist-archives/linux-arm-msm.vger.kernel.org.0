Return-Path: <linux-arm-msm+bounces-48345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90963A39B3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 12:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87CD13A1C52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 11:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429B1234973;
	Tue, 18 Feb 2025 11:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GB+XRPh/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589CE23C8AA
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 11:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739879019; cv=none; b=cqg1HkQMFj7vWa6GCMDH6Z8HoCgO8zOZ+GcG3y/mz/29GwTrDGUDWz2L1Q50ddFGNWbBxUS5jq/hqAvzfadK8/WarQhzp2QYJYllBWKHIYEO/ZdhdgKGZwx0mWbL4YIN7mLAmduCnxeR8FQmAYBQyOJBhvjMWUIIbrq87LtC3mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739879019; c=relaxed/simple;
	bh=1mN+xNgaFFvNE9UYqlV3tBQki4fbSbB7xoygLiCSzbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7uC1zLSbCkN1wZBCPBFGVuXPqwT68YXnI6u4RFrqnPV++tMbmh2PmsYgqBviZxZ3LmY4djIYcp49LKEA6ryexOeMnO0rE0xNduEzu85Z6mbWkxMkhSYeLca6GTvMqYEC/LvfMRRBEmCA8K7BQyI6Z8BVa4eGIf5E5RB9Q2K1Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GB+XRPh/; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-543cc81ddebso5700905e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 03:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739879015; x=1740483815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TDh3LF7I2VAOvbuYPKV/iG9cnLKgilP672D2NsUsYOM=;
        b=GB+XRPh/KuwVxzzVET95bIwFd4RYRV4299ywjOQ62fWhQ2s1zEw2PK2sxauNE7PyCq
         bpE2Ikmlfh7PhWNZGmxbc0YEKnTT3WddQFILl9YsRLM1nT1165fTx4nBXN1E1pgytwLU
         jBSJqUamdr/mx9Ht9+Tdz5i8uUsPGT9Yfm9FugiIghlX/fHD46P87TnGjeHZyStoaCsO
         g8EJFU/jTONwe4CAqPycMGjBqKmbtkzgD0B0mAcSQN5trbIy34irUD3NjYv19ygurvQI
         lQqskxo8v0YRus/BuyB0nkOXUgQ9EsvKv5s9mTR4g16M5g5mRwNJmdd0pkP8AFFjMaL0
         0MFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739879015; x=1740483815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDh3LF7I2VAOvbuYPKV/iG9cnLKgilP672D2NsUsYOM=;
        b=VGarwrpcCepfbMwSTI7dxmrLBFzN1xOQB7nROivGn/SDAv+hh5q3kYVcqI5XNm4vYR
         zqL4Efg1lXigg+zT9lSiW7tRFPZtEJTiDafrgcB7F64plMQRbqGE0gaGgnqUQBHPD6Co
         0f5lcTDg7yqgq9w6sVq3BYV8s/Yq6W8XUlvo85m9JREl22nGw2l4XxFePNEZuHSitXLE
         S3AfakXSLd7n0WMsQ2/PeKEOrrOcGwRikWcbc3SiBqfhzVDPcJFn6Y5trz9427q2hb09
         xA7Q7+30qHz6XI2hlPQUR41IiPHd9SM6dt7ZznPQPAR0yAoer4XWIC1I+F1fbDK3Dufs
         wrZA==
X-Forwarded-Encrypted: i=1; AJvYcCWbFgog95uyhD4Qq4PPDoiCXEwO+JpkTwwNWBRlbv2Alzp3jvovzkHj9pUsepe426vKAAuNeXnQfWtcKx7c@vger.kernel.org
X-Gm-Message-State: AOJu0Yw67o2bofzZNZ5ooQxUvtZL/J9PH/a/brft3OalnL+VfmwxnmqZ
	Jx66Ca2UftQ8RYCI3KPtUy2gAWaLJgIChXOImVhS5oSFG7Fy3rc+DmNcPZ1ptx4=
X-Gm-Gg: ASbGncu4ENUCAADwQ8gs6zP/PQDXd50tuUPwXZVDjWeFu2KAKbgGzZ/IQVYuwTic7/x
	C24rzL+82xW2f804EXcA9BfnA2/JQ2aYvE7cBtsI7QCaVUejFhf7On1J6CDmB3uo+Sfoc1Dl6IV
	HT6ijjZX2h4nykEPXNF1v5PLKmeniBImOm4yMYTq+ULHoOqpg0uNJUVaR7OB9BIVJR2w8pR7P89
	HPe1YDpmv9651EtXlj8obevvGKaX770Z3SwTvW2WgSnS5zXBGKMXcI0FCrmZMIcxauT2DDNPBUC
	al39uerKS1EZXpSAvvKtDlo8K/pOMTNzdq0C3ecX7u5rLroDUlPbzwNiEmOHShChh+rOJlY=
X-Google-Smtp-Source: AGHT+IHO9NwIK+TdHNEcDP9zUALpP+YltWjVqof/wrSV+s+68TLTGCq/F5NabaF825FmYPwW4CFqtA==
X-Received: by 2002:a05:6512:ea5:b0:545:6cf:6f3e with SMTP id 2adb3069b0e04-5452fea6e3fmr4013685e87.49.1739879015479;
        Tue, 18 Feb 2025 03:43:35 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461a6efd88sm980973e87.69.2025.02.18.03.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 03:43:35 -0800 (PST)
Date: Tue, 18 Feb 2025 13:43:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] clk: qcom: lpassaudiocc-sc7280: Add support for
 LPASS resets for QCM6490
Message-ID: <jxhkddeu32v5fg6avsa7pnzicreisrlzpws2nixaie2znn3eei@mstncyeqqfgg>
References: <20250212-lpass_qcm6490_resets-v3-0-0b1cfb35b38e@quicinc.com>
 <20250212-lpass_qcm6490_resets-v3-2-0b1cfb35b38e@quicinc.com>
 <exyxni7td5vow2n6jarav5euje6dnbue5f5yxzu6az554dthfe@zn5yd2byvkoj>
 <ccc87c55-d157-4ffc-8081-1a5900752931@quicinc.com>
 <CAA8EJpp7e5q36jGmB-TZX5A=XVGKsDtmBF8kJmxoga8NqGZP1A@mail.gmail.com>
 <c820c697-c3ec-4ae3-9720-fb80cb3a0450@quicinc.com>
 <CAA8EJpon5+R5s0HXUmoikjtuyEf3sQUqBVYvWrxuh14h2DvjQg@mail.gmail.com>
 <30e84d27-6047-492a-8602-8822b5d492fe@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30e84d27-6047-492a-8602-8822b5d492fe@quicinc.com>

On Tue, Feb 18, 2025 at 10:53:05AM +0530, Taniya Das wrote:
> 
> 
> On 2/13/2025 7:58 PM, Dmitry Baryshkov wrote:
> >>>>>>  static const struct qcom_cc_desc lpass_audio_cc_reset_sc7280_desc = {
> >>>>>> -    .config = &lpass_audio_cc_sc7280_regmap_config,
> >>>>>> +    .config = &lpass_audio_cc_sc7280_reset_regmap_config,
> >>>>>>      .resets = lpass_audio_cc_sc7280_resets,
> >>>>>>      .num_resets = ARRAY_SIZE(lpass_audio_cc_sc7280_resets),
> >>>>>>  };
> >>>>>>
> >>>>>>  static const struct of_device_id lpass_audio_cc_sc7280_match_table[] = {
> >>>>>> -    { .compatible = "qcom,sc7280-lpassaudiocc" },
> >>>>>> +    { .compatible = "qcom,qcm6490-lpassaudiocc", .data = &lpass_audio_cc_reset_sc7280_desc },
> >>>>>> +    { .compatible = "qcom,sc7280-lpassaudiocc", .data = &lpass_audio_cc_sc7280_desc },
> >>>>>>      { }
> >>>>>>  };
> >>>>>>  MODULE_DEVICE_TABLE(of, lpass_audio_cc_sc7280_match_table);
> >>>>>> @@ -752,13 +763,17 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
> >>>>>>      struct regmap *regmap;
> >>>>>>      int ret;
> >>>>>>
> >>>>>> +    desc = device_get_match_data(&pdev->dev);
> >>>>>> +
> >>>>>> +    if (desc->num_resets)
> >>>>>> +            return qcom_cc_probe_by_index(pdev, 1, desc);
> >>>>> Won't this break SC7280 support by causing an early return?
> >>>>>
> >>>> The resets are not defined for SC7280.
> >>>> static const struct qcom_cc_desc lpass_audio_cc_sc7280_desc = {
> >>>>         .config = &lpass_audio_cc_sc7280_regmap_config,
> >>>>         .clks = lpass_audio_cc_sc7280_clocks,
> >>>>         .num_clks = ARRAY_SIZE(lpass_audio_cc_sc7280_clocks),
> >>>> };
> >>>>
> >>>> The reset get registered for SC7280 after the clocks are registered.
> >>>> qcom_cc_probe_by_index(pdev, 1,  &lpass_audio_cc_reset_sc7280_desc);
> >>> Could you please make this condition more obvious and error-prone
> >>> rather than checking one particular non-obvious property?
> >>>
> >> Dmitry, we had earlier tried [1], but seems like we could not align on
> >> this patchset.
> >>
> >> If you are aligned, please let me know I can fall back on the approach.
> > You have been using of_device_is_compatible(). Krzysztof suggested
> > using mach data. Both approaches are fine with me (I'm sorry,
> > Krzysztof, this is a clock driver for a single platform, it doesn't
> > need to scale).
> > 
> > You've settled on the second one. So far so good.
> 
> Sure, I will go ahead with the existing approach, but ensure I replace
> the num_resets check with the of_device_is_compatible(), so it is more
> readable. Hope this aligns with your thoughts as well.

Ack, thanks.

> 
> > 
> > But! The problem is in readability. Checking for desc->num_resets is a
> > _hidden_ or cryptic way of checking whether to register only a first
> > controller or both.
> > 
> > BTW: the commit message also tells nothing about the dropped power
> > domain and skipped PM code. Is it not required anymore? Is it handled
> > automatically by the firmware? But I see that audio codecs still use
> > that power domain.
> Yes, it will be taken care in the firmware and I will update in the
> commit text.

Ack, thanks.

> 
> 
> Thanks,
> Taniya.

-- 
With best wishes
Dmitry

