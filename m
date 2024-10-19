Return-Path: <linux-arm-msm+bounces-35063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E779A4AB3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 02:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1D961F22F72
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 00:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA71192593;
	Sat, 19 Oct 2024 00:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u2Se86gg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ED029CF6
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 00:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729298337; cv=none; b=QN6/jlyOygC18J+5CkCIG/T0eVGafg/Vt/9oSAWx9/dD+QBFirpkCpgz3BTGSMo1RmFermx85UT4PEuxQX9r+XI41MTH9HtUCpNUgm6/FPTN9Xn7dfKOlcCRWv3vW0uZzotJ5CpqeAPfFwMJrKrb+A50Mi1doceSSbfPaMj54n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729298337; c=relaxed/simple;
	bh=Mewcl59dRlGPPCpRuSRwPywr6ycIDIWaUH/SfdWIQ8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=omID6e3kTkr+bblO+UgKsTNORUg0/vVl8Ssnl/CLC+lP+056xBHkNOc9fZ+eh3k37EEQIUKo6bAoXeMRwpMClIaOSKczho5AyatQ23BNVrSzSzTYsxDHMkWn408Icz1Y/iRXUqBNKUBF4wuVPISjB9Svyb/zGbfT962dpiZPG48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u2Se86gg; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f1292a9bso3456611e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 17:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729298333; x=1729903133; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0M41lobMzDtVDXSER1bmN9AsQKoidShYGX+Z+FE6IRg=;
        b=u2Se86ggxXhSy3+mSEOGZxWNPamUQzT3i6si7Xi+iBE6XsK1OlkAoS8qvkiBybH5fg
         rB/wEn+Q1KalHsEHGQPAJX+LcR38Wqcp8jor1kRV4/8ZhzIa7n5Bdae6mKFeVblPD7zL
         6fs2jb98Rcjnyxmgwz4eMK0I4gPvILYgD9U0eW81HDkVzIB7P9PHAAWX7l6adRATkaOf
         c/cjJ2VCZlU2VYEAKiunx/Taf8g62Kgod9fME1P92PuyTiCmh2Ftk3Y0iKrV/6DKsn9U
         OCM4Q2Qgw/gVkIwwyqQXi0NEmpW9zSLgAMuL7qH39bWwCjHNjvrSjYxPKetTd2TLh7Iy
         VHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729298333; x=1729903133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0M41lobMzDtVDXSER1bmN9AsQKoidShYGX+Z+FE6IRg=;
        b=HRtDpNGxvlnKk4mjnU4q6OPn2yzvrxxmcuWn2xTxtih6wWyI9/hPZRekJYmHl9h5ea
         RJQksDNWHeQVBLBKcT5XYcQE7HyCBOUqXUPCLUfakPzSYsvfOdiS88Iz1Tq2p+TgJXeK
         YRtF4SgGq6L5VYlD2aPjpl4RwTq6JvZsBiliQzze2JbMjhNddcPel2tIAqnz1Cryeo6b
         /G+U8HcMj8wBSWlOPq6+q2DRHzCLkBwLMAKp/0XzpVvzaGVak4hIU0H6qDTphXzleUKC
         33us6BS7YmjaTBB57AZdFLKTWUpq2mpfC3rKeJ+CFTeKM/YUVNeJXKkS8wBTXAWqD6ES
         SXYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ/K5m3UtkkRQLoEKbzenI8un7x8UnJvXlUNTGjZ8PovZOTw8uQZVieiPMZmnMc7RETq4wRFLZn6IssGCB@vger.kernel.org
X-Gm-Message-State: AOJu0Yze4ei1ziXsK0shcHti9YbuIodvYZxhL/TPwTfD7O+ZG5g7ySMt
	unNfLcbvEigGnvUyWHh4vURGMPg2fraPRbmn9lLLNLhMI0vCzFQC1om5G/UqPJQ=
X-Google-Smtp-Source: AGHT+IF7fBEeWmNkccNzd31LUcjDvOyf3yMzraYUGO6AugKRPwkcFosfUe4YdEuEFjihSL5BW7Y+2g==
X-Received: by 2002:a05:6512:4009:b0:52c:fd46:bf07 with SMTP id 2adb3069b0e04-53a154ce86amr3097967e87.49.1729298333228;
        Fri, 18 Oct 2024 17:38:53 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ca0b076d0asm1272577a12.16.2024.10.18.17.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 17:38:52 -0700 (PDT)
Message-ID: <d3658f34-c24a-47c4-a8fc-989de009b4fb@linaro.org>
Date: Sat, 19 Oct 2024 01:38:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] clk: qcom: camcc-qcs615: Add QCS615 camera clock
 controller driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, Stephen Boyd
 <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-4-4cfb96d779ae@quicinc.com>
 <f5exjvacw4gz7s7byxz6aux7jt3kczn5waio3f3dukpdvzmkvi@c65xjssv4aqy>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f5exjvacw4gz7s7byxz6aux7jt3kczn5waio3f3dukpdvzmkvi@c65xjssv4aqy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/10/2024 21:22, Dmitry Baryshkov wrote:
>> +static struct gdsc ife_1_gdsc = {
>> +	.gdscr = 0xa004,
>> +	.en_rest_wait_val = 0x2,
>> +	.en_few_wait_val = 0x2,
>> +	.clk_dis_wait_val = 0xf,
>> +	.pd = {
>> +		.name = "ife_1_gdsc",
>> +	},
>> +	.pwrsts = PWRSTS_OFF_ON,
>> +	.flags = POLL_CFG_GDSCR,
>> +};
> Shouldn't IFE GDSCs have titan_top as a parent?

Ack, usually, this looks wrong.

---
bod

