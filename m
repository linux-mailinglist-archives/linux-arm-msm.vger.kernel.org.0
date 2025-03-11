Return-Path: <linux-arm-msm+bounces-50938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B27A5BD6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 11:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A84A170F07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 10:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9BC0234984;
	Tue, 11 Mar 2025 10:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Be+vbEiM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB1122F395
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 10:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741687949; cv=none; b=g/hCH3bmJ9o4YDgucmYuY2/0XKseAePOBvEsDjI8+xd8K9Ec/KnOnxK+WLgiAOnYrGu7YGy4pgp0aggEzA216o3e9Ifrliu1B1Hxhp+R+1ddDj4BfM78Ti2DESjeWvbrMvHRhypJbmaCQsgaE5SNBrwckSdFbkLa8iS4DeYyfpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741687949; c=relaxed/simple;
	bh=+3yq1s96UJR2X/8rxc0GrcD75DfM7d3VNeS5ZzC5agU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Me1KL1HxlmRxF+NmCzRlLHXo8msn577cwWloJe6pB+AdusPwNaM39do77/KWqpyK/wgOEYBABxcJvX3GBfLGDonxy3xMqBlT2Zn9CYLA6ZIVAKXToKlrF3JHKfGR2oP6F0TgNmFPFj3YEgq/imZx7DEmvVl1qlsbN4kbSdEA04A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Be+vbEiM; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5499cca5ddbso402211e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 03:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741687945; x=1742292745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M0Ue4Q4qIT2SkgukgvQkQoV58AEl4Qx/JQQFOU8HKzc=;
        b=Be+vbEiMYeyOEhWZc2tx9xaa0o21RFpqTNwCkJ4EE2iyCqmv4GqtReV+D1ZlTAStoF
         9k2ZsMhaYQmPDGF2lgY143CTeQZl3IX9QDgfCjKsnITf/2cRBfLx/r+DByyZrIJ2rG1k
         DkpKw+Ckmv3kLxPBWfHlkNAvHUpEVaGmzgIgk2N13OXZ3gjSGeeTnbYoA1evjrVfLTYD
         FgZ1q5WVEIggr03LoEhULaaWa8bOOjeQHun3Zv1ib7faD+ZPH+rwqDFqoNp+QNzI93Ew
         wPW6u3gTAi1D3OOJhg5pk3dm40NfM4Rbd6N1UFRUofeB37el5iyS7v8EfQ8OsxTacK7H
         Q9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741687945; x=1742292745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M0Ue4Q4qIT2SkgukgvQkQoV58AEl4Qx/JQQFOU8HKzc=;
        b=V2XQ5BpAj1uCNlMY1esj6l+8PaetV5BcpVlUl+hoejrHIIlPyuNAptRrvTaQhkyBTB
         KgnxryB4aJnEfVW/+yZOHV0ONAbwJeu7sO0jMIVFnLGkFFaXJBh3kZ029fDYrdsdHp6f
         YDtfT6c2NQWXZP1NhBtZUCmj44Kd7iie5kC1HPbnyDXlYcVeMWfr5PHiZK6nEZH6FF8x
         JBwjsZ2ua9y+Bx9R2SDoE+5FJnqbf3gdxyPwcjH5mEvrekS6Yc2+jeMZQlYySZjlGUJ6
         k8g1jT+GevBjVRe3bWzO/mkGUac91EtaKYvIC1fEFp0fi0BUhhiqggUrLVCZH0T3yveD
         mLRg==
X-Forwarded-Encrypted: i=1; AJvYcCUoWMLJ/nof0A/klaQQq5G48YO5dA9Wu0FGsld4zZ7R+B0Kwj4tg/sFgT1Hjbc4ZTLjyEeiMSiqCUpS+WhQ@vger.kernel.org
X-Gm-Message-State: AOJu0YznwzP623igKE+ECGzkvOrBLo4uK6whQ0UJz5p9RxTIAaXTVXOg
	GlUmN1051N4hBtaA+V7oqxsSjrOqwPoIi8ylpDusXGW6DQx9KsQj2I/entoTNTo=
X-Gm-Gg: ASbGncvplfJyFi5pngivFwfUAlGQOE1DWkbVy47vK+IFSVtRQ63Cos2bOBARBPFyPYz
	mOrmlBz/aam0sHzCbO2jxgYzbwTSzc4KunfdHkoxpgFmdW0sOmmF/kfGnPUHJjef38HL9ZTBKpv
	JTv/TUXrR6ZKY6EbYUUbUDO83Qu/DpAm6JvQ5BvFql/t1Uui83nE//BXWJIHEWAe8KVR2ZI5Pc2
	BvARJKtw+Lpe6LRTtBdLsgwAuYS9JUyf2zLfL9Vgn78VGEDhnbSUnN1jUhcNs1WfUyCk/qdW0+8
	5Ou7wXSjXg7hnKPDdTQgEncB/xa09zj48LCu1D1tO6sAF65sUuJ5h2fupCPD8RIoTLlNVvNg44u
	w9CoTmq+Y7CQ+N4rBFw0hHjM=
X-Google-Smtp-Source: AGHT+IGIs8Uu4dRag/V9E+dTalU6U6PS8Xj1gzq2Dg/DyTe7dnw6wtEZjbZZzgP2hxww523Rqg5BKg==
X-Received: by 2002:a05:6512:3b0c:b0:549:732d:e2d1 with SMTP id 2adb3069b0e04-549abaf1056mr371507e87.11.1741687944758;
        Tue, 11 Mar 2025 03:12:24 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b0bd0b6sm1735773e87.109.2025.03.11.03.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 03:12:23 -0700 (PDT)
Message-ID: <46d4f090-3e31-414f-abfc-3d1018913c56@linaro.org>
Date: Tue, 11 Mar 2025 12:12:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] clk: qcom: Add support to attach multiple power
 domains in cc probe
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <CMTYKKilQJYeHUYYKvlqnwv4Q2P-58Ic1v1ndS9HQ8Yhq2xpHuNThibFDjXDEQ1PyNbx__f9BVBr0peoTUdvPg==@protonmail.internalid>
 <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
 <5a45fd25-74ed-46e3-b0e3-5adf92b5e9f7@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <5a45fd25-74ed-46e3-b0e3-5adf92b5e9f7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/11/25 11:52, Bryan O'Donoghue wrote:
> On 06/03/2025 08:55, Jagadeesh Kona wrote:
>> In some of the recent chipsets, PLLs require more than one power domain
>> to be kept ON to configure the PLL. But the current code doesn't enable
>> all the required power domains while configuring the PLLs, this leads
>> to functional issues due to suboptimal settings of PLLs.
>>
>> To address this, add support for handling runtime power management,
>> configuring plls and enabling critical clocks from qcom_cc_really_probe.
>> The clock controller can specify PLLs, critical clocks, and runtime PM
>> requirements in the descriptor data. The code in qcom_cc_really_probe()
>> ensures all necessary power domains are enabled before configuring PLLs
>> or critical clocks.
>>
>> This series updates SM8450 & SM8550 videocc drivers to handle rpm,
>> configure PLLs and enable critical clocks from within qcom_cc_really_probe()
>> using above support, so video PLLs are configured properly.
>>
>> This series fixes the below warning reported in SM8550 venus testing due
>> to video_cc_pll0 not properly getting configured during videocc probe
>>
>> [   46.535132] Lucid PLL latch failed. Output may be unstable!
>>
>> The patch adding support to configure the PLLs from common code is
>> picked from below series and updated it.
>> https://lore.kernel.org/all/20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com/
>>
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> ---
>> Changes in v2:
>>    - Added support to handle rpm, PLL configuration and enable critical
>>      clocks from qcom_cc_really_probe() in common code as per v1 commments
>>      from Bryan, Konrad and Dmitry
>>    - Added patches to configure PLLs from common code
>>    - Updated the SM8450, SM8550 videocc patches to use the newly
>>      added support to handle rpm, configure PLLs from common code
>>    - Split the DT change for each target separately as per
>>      Dmitry comments
>>    - Added R-By and A-By tags received on v1
>> - Link to v1: https://lore.kernel.org/r/20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com
>>
>> ---
>> Jagadeesh Kona (7):
>>         dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain
>>         clk: qcom: common: Manage rpm, configure PLLs & AON clks in really probe
>>         clk: qcom: videocc-sm8450: Move PLL & clk configuration to really probe
>>         clk: qcom: videocc-sm8550: Move PLL & clk configuration to really probe
>>         arm64: dts: qcom: Add MXC power domain to videocc node on SM8450
>>         arm64: dts: qcom: Add MXC power domain to videocc node on SM8550
>>         arm64: dts: qcom: Add MXC power domain to videocc node on SM8650
>>
> This list looks sparse.
> 
> - camcc is missing
> - x1e is missing
> - sm8650 and sm8750 and both also missing
> 

Since there are concerns about DT bindings ABI change of CAMCC given by
Krzysztof, likely CAMCC changes shall not be inserted into this series.

--
Best wishes,
Vladimir

