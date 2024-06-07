Return-Path: <linux-arm-msm+bounces-22034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0A18FFF9A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 11:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D43C01F249A6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 09:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2430978C9A;
	Fri,  7 Jun 2024 09:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NyinHndA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E0D155324
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 09:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717752849; cv=none; b=gBnqJ+Tr80GJiRiNgnkLD9KyeLzfBk4Zdk9A40W7LilBHVtYVzPghXUei7NMxl1X7f/Zg3kTQh6+Nv2//lYoMcty2sCsxAy/6DJ8wjjorSVvHSrnkpIOhm6AoqJrUKDn3MxTUpHiaTPGnGJz+zZ7GKANQp1KqDUoIPbiBxfxoOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717752849; c=relaxed/simple;
	bh=Mkj3XT9ut46CEFNKsKvkQbdS1PkbvW9WWDHM9Wt8rkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uRzKtkk7Q2ND+EuAm3AF0Inaiii+uaQiAWlnxdutJqLrmDUgaW6l8Rs8k1c4EMAsuomhdktaMAVtxRcaQkac/I29PNGVp+IA6uxUtMpXlckCTnx4ftWtosaLZqv60DLAkhI0DqCpENdRILMNaxjKPhQ9npNl1HZxk6innBEHKEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NyinHndA; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-35e4d6f7c5cso1847868f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 02:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717752846; x=1718357646; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F1hHYZcjLgSGH8Bo1cMx5LiBf6CRFSTGZkRvw9Ksdw4=;
        b=NyinHndAq+x4YPlpdtKR4nmNrBNpszzMLDUvKvcZanbkiE8oCAQg1DduQEYU7Ls60i
         ugRFez4k7PTpsGEE6jXMIrBQtaWkPGSzNDdu9EYS6qwDIVaj4x5ZZUmy8qnU8yOn03NE
         WFDhtdVF3KUHVZosCV6y3a42uhyuQXjX9UleFB84K/n+IZqbqC6nybPjHS+gnzysgFH2
         /Tx/puDxzpu7NSttaeli+b6vtR092a7k0xtrekx/Z66Y/Qa3P7VoiQCAb3+dXfbBM79J
         D2VUlN3CDdhl18gHf3eOc+jPSheya/lgtk4wT1snDtvReqB2am4g4Pp9y8JS0bxnpyiC
         uWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717752846; x=1718357646;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1hHYZcjLgSGH8Bo1cMx5LiBf6CRFSTGZkRvw9Ksdw4=;
        b=CN9I3nBsONExBpSdPftuMF+9MAC2JZnjpfEkDaNHUT6RL+LOrjOlj0NnTg1wpzoSAS
         Mr+EWJ2I1F68Y/btigsXL2eDvF8VdUxshii/UeydinQCh+vhI8BurSqAeFJAJpoGpyTt
         aFD/Frb4DBjca4S0tB0kaozg4UvvbG2LZfAFl+6AKGelSSPhZ5K9N4xEXHdFNqezH07G
         jjJkNPpGFYrkYMETwwv59mOiGB7td/qGo5fjUStaFsWrUSK/WK/q4NEAEkYP2wHFL//+
         oPNgpvKyRwZ0CYaWKd2NAekmEWxM7bGNOH8aok7JeQ4eZ5iH/MVlVATzJRO4tycAjm1T
         8iRA==
X-Gm-Message-State: AOJu0Yz+2fnBsxBVt53HLkRdTSb5KqV2YE3lq75ECnJgtqHlUtxDf9/m
	ZQQkgrdecdjCwoZxGu+4SwxEAF0IBB66kOxaFsJ6A+9gQ86VgeGxO2Vwaj+AGMo=
X-Google-Smtp-Source: AGHT+IFNNnZHH4kN7xvK0Gl1oFDuJAhYAu++rJbQ7uphPduCYgm5TWYo1rOwC90eb6eUEVeAnd2HiQ==
X-Received: by 2002:a5d:40c6:0:b0:35f:d4a:ae34 with SMTP id ffacd0b85a97d-35f0d4aaf5fmr137022f8f.17.1717752845768;
        Fri, 07 Jun 2024 02:34:05 -0700 (PDT)
Received: from [192.168.2.24] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35efa97b15dsm2569514f8f.81.2024.06.07.02.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 02:34:05 -0700 (PDT)
Message-ID: <22becbf9-a663-4f25-aee5-8fd195e6fa55@linaro.org>
Date: Fri, 7 Jun 2024 11:34:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: lpassaudiocc-sc7280: Add support for LPASS
 resets for QCM6490
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 quic_jkona@quicinc.com, quic_imrashai@quicinc.com, devicetree@vger.kernel.org
References: <20240531102252.26061-1-quic_tdas@quicinc.com>
 <20240531102252.26061-3-quic_tdas@quicinc.com>
 <6aad6a71-dd2f-4682-91ea-835357342ba1@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <6aad6a71-dd2f-4682-91ea-835357342ba1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/06/2024 11:30, Konrad Dybcio wrote:
> On 31.05.2024 12:22 PM, Taniya Das wrote:
>> On the QCM6490 boards the LPASS firmware controls the complete clock
>> controller functionalities. But the LPASS resets are required to be
>> controlled from the high level OS. The Audio SW driver should be able to
>> assert/deassert the audio resets as required. Thus in clock driver add
>> support for the same.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
> 
> Please stop ignoring my comments without responding.
> 
> https://lore.kernel.org/all/c1d07eff-4832-47d9-8598-aa6709b465ff@linaro.org/

So this was already sent, feedback ignored and now we have again "v1"
skipping previous talks?

Best regards,
Krzysztof


