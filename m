Return-Path: <linux-arm-msm+bounces-29635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEFF960B8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 15:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EA501C22E68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 13:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B48919E825;
	Tue, 27 Aug 2024 13:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NhcDaTK9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA7B1BD01C
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2024 13:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724764418; cv=none; b=rjaaXb+CblMCtMtjBWFfEBzJ+o3Q+e05J2lizsx9+yAXXzGekPSVWa/5BfZ63KndnWJG56QSDBNNnb1YnAqYedZ14hidb2P7lssneLE/uDjvHUUtu1uAXvurK7rX8GYgjCvn2KEhWycTj64IsKc7cFIM2JYHY1mpWWfhSljhmsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724764418; c=relaxed/simple;
	bh=AsE2cQXjHRE2DxI/XQtaPRzwG7nRcAMfnjdoARd5SkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=svn/warPjKEYGN5TE0uRm7TJ1sSC6WggIxTi+7MksjKZeDGlfgOgLrXsM4+nUYwqhomWQlh2tjCB/7YtT5S1AMYyjIdrspUyhrEB+1kOgCB2qnLVM5tL5ZQPhoF+pUAiTJej2CKNrBWZbPWZyelwF8MRrSZGlladY8HdIB1w74c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NhcDaTK9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-429da8b5feaso60955515e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2024 06:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724764415; x=1725369215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xeuE13/7vbNdFThwAEiu12EGxIgMIw579eVWJrBDrS8=;
        b=NhcDaTK9kqeCeWTX4L2H5uE32TyGWfuUl4YHLxUgJDCET/ryPigAPXMzIgiih5781b
         d4DepFnGppbsVoOuVugz1AA+XRPexwPX2hxSFViu3dalS/PbUcBJeeoDvhZSxq/uty+e
         CXjLrENvTPFLpquR6W4KcKyvrD9P4/lemb6mgylb1RSEX9CZQSFcvNWu9GJo/Avh+TJg
         zrXOpRSxTNN2x2NSoOr1sSJocVkLHN31gPEqWjBOEvhxV5U3jraWT9FycTzFbIytIhpS
         AJNapEQlJLGz+Cn2nAhSp6X6WJ21wgcM4MaFaNMM1rZTrUpFP8u4csAiq5QbB0xoVm8s
         QMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724764415; x=1725369215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xeuE13/7vbNdFThwAEiu12EGxIgMIw579eVWJrBDrS8=;
        b=NOvDvx5d4VMbX4E2fQJBXzRheDJqlv/OJP3iR6Ad653TOZFz99IhY7sw1nC7wjp7Ea
         xLy45sldO21nxDaEGJjp8mDTm2RdlXXcUeZMRZBFFwFvCNHj0qLG1zY6JoPhofjVPjna
         O7BV6BEy5LhRt22DGKWwzia5KYedGs5HKiUPAtCjeZ+Iimx0B7zwksKaM1JfGe7OJRyJ
         dqZI6HtkPu7j8dVWkJfobYLCggTbT6gq7osmpDzzkOo7uVelBaEphhX2b42lxVP7Xb8z
         3vKXxUMDCsxyyYtuIK/7THsBh81Lyheunl1u6V9AEshKBubS7wS0VnJtr+2ofiEz4Bd0
         4vSQ==
X-Gm-Message-State: AOJu0Yzv0GkPWFPY57YVshUjGWy2TVfmAnO8tbPlamBWl7ZqItAZzOAZ
	/d1MrtZXingGUuSL/N3ao48VNC2XXK8KxXQOqlvlqcKXOSwNrM8twxLOffjUtDyAB+NymQxnfFn
	j
X-Google-Smtp-Source: AGHT+IHdsyhSLBjiurVvaE79aFCz+ddRrXoXvKxH/wwYSLEfj/5MHZEUqYeob8Osk05sYIoi0UFnqA==
X-Received: by 2002:a5d:67cc:0:b0:371:8283:94c1 with SMTP id ffacd0b85a97d-373117be78bmr10635617f8f.0.1724764415477;
        Tue, 27 Aug 2024 06:13:35 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e549df50sm109365166b.53.2024.08.27.06.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 06:13:34 -0700 (PDT)
Message-ID: <9a1ca52b-6eae-4897-891e-6fad3d981c6e@linaro.org>
Date: Tue, 27 Aug 2024 14:13:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Don't use parking clk_ops for
 QUPs
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>,
 Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
References: <20240823-x1e80100-clk-fix-v1-1-0b1b4f5a96e8@linaro.org>
 <df107382-5c9b-4568-b9e3-5a893070fad7@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <df107382-5c9b-4568-b9e3-5a893070fad7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/08/2024 14:44, Konrad Dybcio wrote:
> On 23.08.2024 2:58 PM, Bryan O'Donoghue wrote:
>> Per Stephen Boyd's explanation in the link below, QUP RCG clocks do not
>> need to be parked when switching frequency. A side-effect in parking to a
>> lower frequency can be a momentary invalid clock driven on an in-use serial
>> peripheral.
>>
>> This can cause "junk" to spewed out of a UART as a low-impact example. On
>> the x1e80100-crd this serial port junk can be observed on linux-next.
>>
>> Apply a similar fix to the x1e80100 Global Clock controller to remediate.
>>
>> Link: https://lore.kernel.org/all/20240819233628.2074654-3-swboyd@chromium.org/
>> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
>> Fixes: 929c75d57566 ("clk: qcom: gcc-sm8550: Mark RCGs shared where applicable")
>> Suggested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>> I ran into some junk on the x1e80100 serial port and asked around to see if
>> someone had already found and fixed.
>>
>> Neil pointed me at Stephen's fix for sm8550 which I found is also required
>> to fix the same thing x1e80100.
>> ---
> 
> Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>
> 
> Mind also fixing up 8650 that seems to have this issue?
> 
> Konrad

np

