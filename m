Return-Path: <linux-arm-msm+bounces-88556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAA8D12760
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 13:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFA213038068
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 12:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693F03570D4;
	Mon, 12 Jan 2026 12:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rbZ4bA3Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC49352C33
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 12:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768219645; cv=none; b=BZBIciGCBuHmVFIT/30l1DJaICfMwCXYqheIuBDVKJcmM+ctNf54h2fIWaMM6UOF2cRNoAJGml+G71tWJvWKHEXEOFxHrm3pep+8am4YE4EuIEA2PJEF5praCTsGM5f1XXQcMGV350xEc4jc6qJyXYvRIJNIrpUXinP1lfhiaS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768219645; c=relaxed/simple;
	bh=bmEIvyVsr6DVsM5nUAfh2W2TpABYdDSi08tkrELKVNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gl+uVO4tx7/CIGR+osJMgTTO6CKCN4PFNjlEBtG+wxxDTG70kcawa0J6cn+mTPHakVUENs8Vb7mXLNe+vcieXXKx8VQ3Sm+fPRssOUVgunbRjgs4ZOYwDIWHZYVqKNLbLvixYt6QiysHEpRlX49SueZdywjEXqnJnjREdVxreOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rbZ4bA3Q; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47796a837c7so43640875e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 04:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768219642; x=1768824442; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cyFmiTOwx9WydPZqcUGcsWNSpaGu3ePZ7mQ4/4dnfXw=;
        b=rbZ4bA3Quywl2lJ4jnkrGU6zeJ/jZIlvpYC22sC5cvlExxfGTfZnWupLynd3ce0dWs
         +Zx+DxzJiUt2kGMxm21U08EloLvh7o+RDhdJhDYzqKnO1vuWv/r/2U+FPuNQ+iB+dD+l
         V8SoDHWPTiTYriIVKd7wn0cAIok1KI1Ge7uNsuxXbxUzKx4lTVzAKnOki615tBX3Q3vB
         dQW2RWeyQsaJJZ9Fic8HMju3Q6WJh+QKGiAR+diBPh2w+3Pk1CnYKmKFg66JslKvE3NT
         991IwReeC8pKGDroEzjVzpiK0LcnC6kpSHPA/eMVNK9OLg36aNa43SzjL5dfs6qVo/HK
         2AKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768219642; x=1768824442;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cyFmiTOwx9WydPZqcUGcsWNSpaGu3ePZ7mQ4/4dnfXw=;
        b=ZPcG9gnIv9QPBuGnutTcGavhHh2Mz8y6A1WOOnVu+fyBdOH3EimwXWbVPhnJYu0aGa
         norrbH/3YIrwLezfnFzdbPla6szdabt9Mrod6MN3PAUYraTybyf6zyDip5mJ3gW5dkBg
         EzCyKan5lT2GqSDD3zTLBPfOU7jbDyIvvXQx7Loii8PBXWI1nC0v0vjNXokPjppT2njd
         3EjMeWrSiFWmr8YsiTZJ0TfConeHffCCys89fLZhqrTPnFgnPrGGfLVas6CLCZnBQj6u
         kUEChnpsZC/0PXHoDKdjLhgl4Adk1Za0h4okvD4q+XT30FPuTugcx/D/7nRxoZIJfUmw
         Mouw==
X-Forwarded-Encrypted: i=1; AJvYcCUDWiopZAYhqJqSnLPBky7S1Lxj1nnUAxqqMRfoVLqYyPoJqFvbgTYU5EmGnfDotN/snDX4Kx5s7daGpjaA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx+XeMFPdJNyQx8uIdsWhLKJYvuJxWfm2pkavz7r13O7hZl1gK
	SocZuuhGZw1gi6rY8+JYjUB7l18BRffqmESo3/MBBjDsPErAE/RJrdBBlTbn1lEqyu4=
X-Gm-Gg: AY/fxX65Zsf9/Gr5+/M0UMuBN7l8JRw2zji7zWns/XwV+WPoV7rv1/nsvO4Jd7G7Z//
	wuBQkG9UHV21kZSliEaP2ZnUD1FjwMVIhN8KCtYxbc8MZgQXwXRiOlKsZe4zvm0Xs5UOPF3LHpX
	L1TfwwqT+5AZwgV9wJNJYt2w+2FFqkOMhQu14a4ldBkl2qVekogvcRQ37Pnyez6pDGpN0pgxIMp
	sneL6Idb6/0kmByB5oVpgS0A4GQgIQvIazY//22snWLWsYHqm0qhkgHFporzSYdrgmoGSJKI4pm
	/GEp55buicjwBMknVJc+N0d84i1lGhyzP1TkXeeBTyC2UlKa0oSKFLmENXRcKDyoBI5JqiA1TPc
	ajWZl/j7Ji9PQVMZOsgaJJ70iSqEn5v/4MYXk4+UE3O6hD4V5rS8pejivGOg40Y+nonUy1zVnv/
	EqYSHCyLcENzLryejj0JGl0i6A/LOY+tw398/1C4IrZcxf+7AP3KWK
X-Google-Smtp-Source: AGHT+IGRc0EV50kscbKyU9XViNWiLVNiv77Je1cCMktwdnW0YTBJo1cj4/Vq0LD/5Xpo0+DbEm8dbg==
X-Received: by 2002:a05:600c:3112:b0:477:7f4a:44b4 with SMTP id 5b1f17b1804b1-47d84b26d08mr189479945e9.1.1768219642142;
        Mon, 12 Jan 2026 04:07:22 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f41f5e0sm344704455e9.8.2026.01.12.04.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 04:07:21 -0800 (PST)
Message-ID: <f574665b-48e9-4bb1-8c8c-95ff0f7449f7@linaro.org>
Date: Mon, 12 Jan 2026 12:07:20 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/5] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260112-kaanapali-camss-v11-0-81e4f59a5d08@oss.qualcomm.com>
 <20260112-kaanapali-camss-v11-3-81e4f59a5d08@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260112-kaanapali-camss-v11-3-81e4f59a5d08@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/01/2026 09:02, Hangxiang Ma wrote:
> Add more detailed resource information for CSIPHY devices in the camss
> driver along with the support for v2.4.0 in the 2 phase CSIPHY driver
> that is responsible for the PHY lane register configuration, module
> reset and interrupt handling.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---


> +static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = { "vdd-csiphy0-0p8", "vdd-csiphy0-1p2" },

Please sync up with Wenmeng's patch:

https://lore.kernel.org/linux-arm-msm/20251114082649.4240-1-wenmeng.liu@oss.qualcomm.com/

---
bod

