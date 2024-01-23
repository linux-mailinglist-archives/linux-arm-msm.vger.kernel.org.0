Return-Path: <linux-arm-msm+bounces-8003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DB883970E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 18:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81E1928555A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 17:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4FA81AA3;
	Tue, 23 Jan 2024 17:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dHYPbyaz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB9C8120B
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 17:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706032569; cv=none; b=ehBeacXEWSnFlUpEtCqyX+q0qlM/8V4mceihA78gzKssf9GTVuyuXQe7hqHvUH0Uf3N+A/W2GTSLC0C9bRowkjX5SsZ4ie+nTz5maoYBvCjCqdK4w2k15sARBr5z8um7SwShGvQcmFueTJNkNMxgmi0YZ7bFEOUa63j64LqFjqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706032569; c=relaxed/simple;
	bh=Kr7w+SGEwqQihNACAI+flJSJVscpWWcaaMGKuGdc9I4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X7HOASi/dW6M/wTzpoJHLkyytxRyiUZklcvGxezSgCajtKLfbqUQo5lMbr1ViT9qlu07BgTS8snTzUB1v4sNklES4LrE5LaIzkN0OOJI3H5bUvNgqaVumpvUXZmTKFORL+gyDJRzGfyoMG+Vu7h1hMsQqmXlWWLbaE9sTQk1378=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dHYPbyaz; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e7ddd999bso5221022e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 09:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706032565; x=1706637365; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WsZ4KlUHiglOsCzCfXatA2rETh1XN4ZPTM126THuUHg=;
        b=dHYPbyaziPPSWKqT5rWuOtoNXKtw3ZOQj1AVUwhhT9ddAk2OMQq/JQUZMOhpcWKCJW
         9vD3cHW8opbTSRbAhxJi2rS5ErzLPab2/JS4pBtxZ7IoaGkFlpRYNEQ0dTU+810V3TlA
         eEfBVJz+2R7kd1b3CtYize6ct9ZhryKlf8JCrar9bBw9N/iJ3ZNQOX8YaJTjdUBnbiMD
         L5zkIjX4HAG40A5TdZlFsNyO1iVpH/dk8foT02RiU4ZuSJvdhh4XpOMR04eMt8b9TGnK
         5eXnAvmGAbRVRVV1Et1Eg9V7UvSuxx3+9Xr1y1+VTPZvUrDcBFO229ENnX7FDA+tKWrQ
         smyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706032565; x=1706637365;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WsZ4KlUHiglOsCzCfXatA2rETh1XN4ZPTM126THuUHg=;
        b=jj6rmJW4J8XjzS3UKnXfawkCLunVTZ6l9KADXKtv5hawECNYUreAv7henlyVf6OkWw
         uBkF8gdMYIVBEHCGto5pEdzixEnzufTWpN0ADDTc9XtqtGMRRFvbOpxLtqFRe8IUCLLJ
         EpImgBZZjzui8p1+4zCJG231aKFoJzKxh10Aszi37OWkFptqlAeNSyQvwvKewq1pSQNG
         UwHqhsHftQx2/lH18jo37mKOrBCOJSaYxvRHJtU1OyE2pR1xbY1lifqSQv0pp16KZBUZ
         T7FOsb0kmqXtrRPZIvPukafmDKPKkGBnfH2dQhU4hPrYRYL3deiyQ73VwQM9ArPv5dMn
         yuzA==
X-Gm-Message-State: AOJu0YxzEd0j71ZHMaiNNMA5H7eh0pdi3e715ZYGBpifdYlrKd6Zm9Zi
	3J8gjs248FR8ggUhcSdDPx9kBPf+hb2E0+6cQzpXTDLqQbS2ztedaLhrNIXfop4=
X-Google-Smtp-Source: AGHT+IFmCLYzgjjZPiLgBJlOLM29I1/FO8zGdLnpI82VdMTXlCFvm48M4Uuf3x4GeJBr2Vn8ojX7mg==
X-Received: by 2002:a05:6512:33c3:b0:50e:9a0d:d402 with SMTP id d3-20020a05651233c300b0050e9a0dd402mr3678975lfg.105.1706032565599;
        Tue, 23 Jan 2024 09:56:05 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id o9-20020a056512050900b0050ef7f44884sm2335262lfb.199.2024.01.23.09.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 09:56:05 -0800 (PST)
Message-ID: <f5784838-0386-4ef8-bc3b-195a0132a29d@linaro.org>
Date: Tue, 23 Jan 2024 18:56:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] clk: qcom: Add camcc clock driver for x1e80100
Content-Language: en-US
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 Rajendra Nayak <quic_rjendra@quicinc.com>
References: <20231214-x1e80100-clock-controllers-v2-0-2b0739bebd27@linaro.org>
 <20231214-x1e80100-clock-controllers-v2-10-2b0739bebd27@linaro.org>
 <624956b6-d7ea-43da-bb8d-32d9166a0272@linaro.org>
 <Za+n4zfzoZFhhLIa@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <Za+n4zfzoZFhhLIa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/23/24 12:49, Abel Vesa wrote:
> On 23-12-16 14:39:48, Konrad Dybcio wrote:
>> On 14.12.2023 17:49, Abel Vesa wrote:
>>> From: Rajendra Nayak <quic_rjendra@quicinc.com>
>>>
>>> Add the camcc clock driver for x1e80100
>>>
>>> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>> ---
>> [...]
>>
>>> +enum {
>>> +	DT_BI_TCXO,
>>> +	DT_BI_TCXO_AO,
>>> +	DT_SLEEP_CLK,
>>> +};
>>> +
>>> +enum {
>>> +	P_BI_TCXO,
>> Please don't overload this define with DT_BI_TCXO_AO, add a new one
>> for the active-only clock. Please also do this in other drivers in
>> this series.
> 
> Nope, that needs to stay if we want to align the dt bindings between
> SM8550, SM8650 and this. At least for dispcc. But I would like to have
> the same dt schema for the rest of the clock controller drivers between
> platforms that share basically the same ip block.

No, you're confusing the dt ordering enum (the first one) with the
parent list enum (the one below that I'm commenting on).

Konrad

