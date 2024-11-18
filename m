Return-Path: <linux-arm-msm+bounces-38240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1B39D1270
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 14:48:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD9AE1F2364E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 13:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D369192B79;
	Mon, 18 Nov 2024 13:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fDHEkSQq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A861991C6
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 13:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731937640; cv=none; b=IsuYUh/aw0ZCuzbN0w4Da8Dt/Pm9NiD3Hq06IghthjZiAuYsvZ43mEUmPvoWXt58+DxYCOPCcp2v4HTs+TQ20k+2fjrLPBXy4dBsLdUPyR7PeD8dZGBKyLV61yYEVjEBCXCKfgf9s6Qy+Yf23VZ0F9/yarlPLNbYL6/G436ONgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731937640; c=relaxed/simple;
	bh=pJxl4rQZejyfJm+QNm/dBeQozxmiMKPzYEx1qY12VVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tt3Zdh5mIDp0TYAK6f4LiU4IkTAvYk/fQNOZdvYXtm3jVcTW8kpsvuFlajb8SNRd8IFygcWgHlkrpeMMlxesNa39XImy5VOIOxDYrBVNfeytOA7oUCzxfL/dXZ5iTCHH+KMWnY/SgYC9IG7z7BbG26oyo4S1T1vvaSHNvUzynSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fDHEkSQq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so36802185e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 05:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731937636; x=1732542436; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s8NgQOCCqPqf7FHd7BM4LXvTtZURwEU3Cj8EytucMjA=;
        b=fDHEkSQqen5NcYUF5LL0TKURcC/drB2TuJlKJg5wMhCqe/ETcTc4NSA+NC96J3h9xJ
         A5y16q1MAnXTnGRGaDeDB+BdEWBrpvtZkrR/Il9WbJGOQXa/BrWL3obbRAraFlP1vrJ9
         N03K5G2Cy+BgdVevNEfQY8oXGSj7w1/+0cFBvNuz5yVANwSIgr5Si1v872nD8pCojKFT
         nPpFVzykUOmtIizIQUMee3+ODvQA36ADxpBtwU2/u9bSwkI8dMZXj+r499zIJccpjisN
         MeriaipxNx+4ey20pXv6roAt+H7fogpb0pTEtOrXWY9Ay9zh7aCRkEE4jd169+zgFxNI
         mO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731937636; x=1732542436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s8NgQOCCqPqf7FHd7BM4LXvTtZURwEU3Cj8EytucMjA=;
        b=Fxd9GRGDRtrofxQpodqwHeutu32l/DLNHUU3O0Pzq/R95gBmZanfkBC3YlUv2RAsaZ
         0IrDlGCVkwvOK8rrK0WnrGCz57TOaBxp/kcYXQAz+0KBV3EzHLo4WrnGZNRS5zlrTdik
         eUVfx46rHc/TL2xjTUi6rTGFd2vVnmk1Ug6ofFszZdYeLpybVnnY/AQwWl6SLuwmElrx
         QarQnwkVHZ6ZRNDbDRzS5qBtAwp7YCZ58sRg9nX0q1rzKXkOmK7CfUPOxt5SDC6TZ9bE
         8aDC7voyZQDrb5J80l+DfpfHFWOyIO5lkqnnOoS9O9iOoNX1HpTlebSWH5BiGm/Og71q
         a/jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqVNVvlqBCLVULDjIt9hkAD8G6qxMuUgqkpFeevSqGMY1aw1DLFn1yw5o+idYvimG0ugPloetLTdXlroQj@vger.kernel.org
X-Gm-Message-State: AOJu0YwxuLpJPh4znrb5eXvZpJGIOgb87emQdeqRWRrVRxgD6XtCAzwk
	JApIst4Gcp7QBSOck78ODE+Yvmg28VxOsh7R/+CYULvgrqSWylWJcxEVEDNSIXpa2zOk5nWvTGy
	2vwg=
X-Google-Smtp-Source: AGHT+IGkNPMfEbTsWdumFk18TzboywRqef3yKH0bCK2BXh5ptB4CLaWCTXz64qGRHLnn74CknlpZng==
X-Received: by 2002:a05:600c:1387:b0:42c:b45d:4a7b with SMTP id 5b1f17b1804b1-432df78a971mr103770975e9.25.1731937636216;
        Mon, 18 Nov 2024 05:47:16 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab80ad9sm154398355e9.25.2024.11.18.05.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 05:47:15 -0800 (PST)
Message-ID: <d80e23bf-3e13-43af-9bc8-fa6bd4a86248@linaro.org>
Date: Mon, 18 Nov 2024 13:47:15 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gdsc: Add pm_runtime hooks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-2-b7a2bd82ba37@linaro.org>
 <atg6yw64f4aojcbjyarljb57cejqk56g2qnddrloa3smmupm6d@fk3oyiycnuco>
 <45c0950a-0cde-4bb9-9e3d-7f25b8a3da31@linaro.org>
 <5lg7rsndxrcogrwywlciek4fdfejnpmvuibpwhh33whg2ebtlt@jli5g3qliota>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <5lg7rsndxrcogrwywlciek4fdfejnpmvuibpwhh33whg2ebtlt@jli5g3qliota>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2024 13:39, Dmitry Baryshkov wrote:
>> It brings up every PM domain in the list
>>
>> clock_cc {
>>      power-domains = <somedomain0>, <another-domain>;
>> };
>>
>> No different to what the core code does for a single domain - except we can
>> actually turn the PDs off with the pm_runtime_put().
> I see. I missed the device link part of the dev_pm_domain_attach_list().
> 
> Just to check, have you checked that this provides no splats in
> lockdep-enabled kernels?

No, I haven't.

I'll have a look at that now. I did test on sc8280xp though.

I'll get back to you on lockdep.

---
bod

