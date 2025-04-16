Return-Path: <linux-arm-msm+bounces-54528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2CDA90740
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 17:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC32C1899EEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 15:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02F91FBCAD;
	Wed, 16 Apr 2025 15:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eqB8TPaV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7E01A0BD6
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 15:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744815813; cv=none; b=g7GPsT4V285oqxccTYZ5UqQd50vOsnzu8pHWQsWKvRRlRhNJP5mFndS2qZwPj6s2bJHXWjEZsUSpgUbPFAFFya0PL3x6daIt7YWiwrJGWd/VjSI/Z84235j4RIO3t6eXH8ns1Xx0pnPVTXjg7bfXBjX1/Ztt0E+F3XxSfNLubjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744815813; c=relaxed/simple;
	bh=kHSfPEdOAablu2/umHYs7gUz3zVv4oy4q52ZGY3brag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ys+nk/CkPcDairCtk8QofdUZm6EWGOdQ5mH0JzmQHv2TbIudmcnV82DN5B3MtNR3X7Fn+mZvuix61i3ilIcXySay/re/ZhSAsUkDaOZCEaZ+kii2P13EF/3BNQ3AcuD0lnM8iD6dQROkPPz8mBzTGwhLukvSc88rs+s1joyQ0S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eqB8TPaV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so6194445e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 08:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744815810; x=1745420610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ssHY3+dEnlsEExNuhQ9HefHsurneHKSySj1u60YgUXQ=;
        b=eqB8TPaVjtXsQeJ5F1AOjcfXgwN2pXCt2PpFfN7UJJMWiwgVjNgGsv6JYRqqAN13KF
         5z7b4LvBMzgsCPWbiN6qPNMMJzIFbwCY8WclZ0d93zwZiRYIzfEp5tmlhBI7GPNkXcC3
         w6F0H1uJHDnxLrUEBgqxICaIWuZOAnQ/eRTG30RvbXglx3GSCUMrS4nnYIbUXvPuII+d
         vg6ansSjdJV3etUOopge97JTe+MvCn7BfIm8Qh2VkTNEoKCgQR6PuMSrJIt/VIa5j2Vu
         ADU10jEkeEr/hulrOhFh5aHpGcQGyVkMMv3U5ZVC/T4DIKuKDVwyjrtK/AKFfEYHGHw4
         YYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744815810; x=1745420610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ssHY3+dEnlsEExNuhQ9HefHsurneHKSySj1u60YgUXQ=;
        b=apTuHcbAxQaifXuEaE0ST8AKYWSLyKQlkgBTx6jkXD1t3hekZzSGrSTisso+P7A9zO
         y9OudJCmYQrX5CGPSdKa1bY7M0a2peDxtKZm8N//NXQFZA3aoZ+By6dZGTEGV15oYNHt
         t9cDSHYTMcAsJYa+L6hLvIW1be5fYmj4zYInx0UD6U7n4Nc/gF9YO8Q8Cn65WFKQfsBR
         nb/j8A5HM6OoJGoP15ZeiI6QrbOdj/a0wWqKIBUPZqgyLeAOXfgBtf5++VfN701TidYn
         nzzGlGmLMFVrPHjO1moe6fHH4pepG+ZM1HLWh1uh63V2j1y+EnDeLHc/BepdC+sHHEOH
         2Q5w==
X-Forwarded-Encrypted: i=1; AJvYcCWlnHM0tRDE9iKw47nxeLAe/uuKzO670iR3VWNR93Ho6WEaIeiK7YQCreZLusQg9RXgCYNAwOxgahSaObxK@vger.kernel.org
X-Gm-Message-State: AOJu0YzpgJOXmZTpMMymRi848QOOuxg78wjeUBeYa2WDdsJ4Yx4HMdFj
	QtQDWGuWZT9b9GpXkZHF0bnKNFToi/sOPz+COd5oezh0bPv+ypcuISJNZgb63Ko=
X-Gm-Gg: ASbGncu7wFbJa7tbFgSOiHN+z/9D3/qa3WsgEXWevVQMN1bS/f5v6zB7r+LbhoIqKY+
	4sYNpJXbk9x5t/75gmyppIuGuxzFFT0alRQMd9YwwV9njpb2rKvxYnjAquzSeEO0LES7gmIfpUn
	e+njxygsMg5UCKRwt0xKfHy8DMxDRoFWW/ztBJ6y3wxYSxzIhbee9OnjWIBkbQXGQtPJYyA7Yt6
	F7qMinU7+vNiBBWzhayT6MXxnUF9mKukvSnuJE+QtnPiLceuxq0BFA0zNf5pEC8S+ns6psWmTKr
	FyI72mI1lVTnRP/YIL7u1HdOFj9xvBBpEqcG6B8qTvLIEXUvUABRx5sZt/xvv6hEbCQNb6/b//w
	Xy3sS2Q==
X-Google-Smtp-Source: AGHT+IE3cwf5hpOj2aPXcTsIAKSRPhYCx8GnqPD2BU0dBf37NTxtHVMsyy+iGKWeeJ/KQXpH2Fj4aw==
X-Received: by 2002:a05:600c:1910:b0:43c:f680:5c2e with SMTP id 5b1f17b1804b1-4405d7d31a2mr24342655e9.13.1744815808120;
        Wed, 16 Apr 2025 08:03:28 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4f2b72sm23291795e9.19.2025.04.16.08.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 08:03:27 -0700 (PDT)
Message-ID: <80a994f6-c46d-40c2-aaec-33d960cd0dac@linaro.org>
Date: Wed, 16 Apr 2025 16:03:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qcm2290: Add CAMSS node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: rfoss@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
 <20250416120908.206873-6-loic.poulain@oss.qualcomm.com>
 <c57084c4-189a-484f-af2f-8e4181f547fb@oss.qualcomm.com>
 <CAFEp6-0tZQowmDrEsHgU1Ncx6jR2f=Lp259vaj3mefc-9BfUbg@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAFEp6-0tZQowmDrEsHgU1Ncx6jR2f=Lp259vaj3mefc-9BfUbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/04/2025 16:01, Loic Poulain wrote:
>> @5c6e000
>> (first reg entry)
> Ah right, I reordered reg to be aligned with other camss drivers.
> Should I keep that order (and update node name) or reorder with phy
> lower addresses first (PHYs)?
> 
>>> +                     compatible = "qcom,qcm2290-camss";
>>> +
>>> +                     reg = <0 0x5c6e000 0 0x1000>,
>>> +                           <0 0x5c75000 0 0x1000>,
>>> +                           <0 0x5c52000 0 0x1000>,
>>> +                           <0 0x5c53000 0 0x1000>,
>>> +                           <0 0x5c6f000 0 0x4000>,
>>> +                           <0 0x5c76000 0 0x4000>;
>>> +                     reg-names = "csid0",
>>> +                                 "csid1",
>>> +                                 "csiphy0",
>>> +                                 "csiphy1",
>>> +                                 "vfe0",
>>> +                                 "vfe1";

Please keep consistent with the last committed yaml for CAMSS.

---
bod

