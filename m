Return-Path: <linux-arm-msm+bounces-80544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C39C4C39BB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 10:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43C0D1A256C9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 09:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D83A309F04;
	Thu,  6 Nov 2025 09:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7FOAXT6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831E2309DDF
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 09:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762419798; cv=none; b=IAcK/bzZ3e5k1SdjKpj3TsQOHeUW2972tvX6IeqI+v+gxENX4mEk1CuFXHwShBRJdB9M4/JFJstyVK/azFYrBl4TVEimxU3+PJScxazq6IUWjmBEkLyYhILNpxB3Cc+BpsZL8HbElKS3CfXbjeQ4SUi8qZzxoRIDXmc8AY0aKoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762419798; c=relaxed/simple;
	bh=ja81m7q8vyfKq6+3MFF18Vx1X1P27i/NWaLR67piGHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=is5Xz7R2n9vCLampbD/weDZl8Mga/DyNU8EIkdi1oKOd5ljiU5YlNlRbOCp/tFfgzG0D6/zwy6pbg5aXXQoClii+q+QyFnLn+QierkjhwQaukTKgrRD81WFPl/FbfPMukirXyUhjxpx38sqlwxDUGO/Jtt5vV3MfleqWVDYpe+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7FOAXT6; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7a435a3fc57so858400b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 01:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762419796; x=1763024596; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iOsJQqZezQEXs0dR6uOOcyuQQaWOjfXrGp1DqpuI0JY=;
        b=L7FOAXT6WxpfP/gMqxuTq9zzZr9u+hrwkT05tdm/uRt6cH0gdGiJSmYKh/vwrBmPX+
         nBcGxKXAmEJG48c0lpZaYAZ6oZRt5mdgpt7Z/zJXvQawgp/3pqzvE+mhu05Z94DM2cL0
         4q5lk+WRK5yaSeBcdH0B8LZbnbsnQyZM2cBz4H2Q6LciLsK2XblI2PFIEhfxQIeSsx/P
         ecwngxBXPHawcqGLBs37ezlTUmWklDZtuHNqqFKMDbNs9mmb0s70UpNB/g0nXzwa4Wfy
         AmsGP6hwh15MwS+yZi+GO9KsVSo/fv2qR8dhACn6Fe4m2VfIeyBt6Owc7FH4NrTwuSXE
         DoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762419796; x=1763024596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iOsJQqZezQEXs0dR6uOOcyuQQaWOjfXrGp1DqpuI0JY=;
        b=ZpUOofuSF5Y2Q+SaYHQvTgzxxTGOHIonLPisF5MAi7fhBrEelVjhRBHz9gzrLV2mma
         40oSZ/xfU8+kfU48XIoQOs/idpxsoetmSfqkWpbND96fVQp+Ge/LEUIfzCwcbpOe/BL1
         UD8ueExwM1ThxfEgltCcBRRrewzs5tBzyiNr0EB8dJkpYB6vnFuqhqOC2vv7mXto0Gwv
         ltYch34sS7E1bX8RhAjQZEYf0WB1uOhUay+g66C9h/LL/11Ts4bamgV5ohPfGTQ/usZM
         AoxWmhWtfXnFLwF5+mIPl96XKe7J4lCaAcgpv76FlL+Js3mK31FukChAT2ZywFzpH1pb
         Z6UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUaOLcSEivSU0lthhbQQO8+LU+ZSVzKQvsTqK9opI3DRxlx0EXHs5k3hd2yKicHUsYF8qJD5dRTyp5+ZOj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwl489mJ3YlqCj1LwCMlPC5zF4wo13rMV0ei6ZLUgf+5onI3ox
	Q1JnkETgBwQtLCF+I6l9CBd+GFuwjpigTn4l4OdI5S0cMtZDpRC09Brd
X-Gm-Gg: ASbGncvkXnyFWXjgMu7zNTG7OhedTQhyaEedQuDKQjVffIV3zA1MN/gmPaWKAEsRPMm
	dZAWgiqP2bKA9pNicfRJ9sUW29cpw4e0ffalgPk8DxN1CearijAHJyET1CEMSx8Ub2RJ6CCIt0c
	FOGaEV+yyF/wyjElYmTG/JeriHq7w8EDawTl6EmMm3qEebfYdP/lYIIIM4dgsRW53bc7GzT22G3
	S+T/auHTCPdCn0/uAIHGAs7gs/J9+g0rBL6BBVJuEwOOY2JcTbn03+fSsew8juOpWuPsM3fVarx
	WF6TJvePtubchGILX8rzPQ6z71dM1t4afwG+fSFLfPV7ufuQlD/ki+iNk/1mPS+ahunpUz6aX1Y
	u0oWBEWJ+DmbHrmJVfuGeaMTMOxI7UH6hYEPjLO+JX63VBve+k9oldYj8jcHPWqgUhGAQo3k7Ve
	wfupSsKuFy6iA51drpe/kVImnudBiAHLYBFA==
X-Google-Smtp-Source: AGHT+IHIjWJT/zyHFnhWjCTLxPCrQKsHXCp6mnS25oro4Efn4jPDJwfI7GhdcHoHP/t0/INuNPFQJQ==
X-Received: by 2002:a05:6a20:12c3:b0:2e5:655c:7f86 with SMTP id adf61e73a8af0-34f8580ae0amr7986896637.39.1762419795545;
        Thu, 06 Nov 2025 01:03:15 -0800 (PST)
Received: from [172.17.49.162] ([103.218.174.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af7fd59f2asm2056124b3a.27.2025.11.06.01.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 01:03:15 -0800 (PST)
Message-ID: <9d5de3b8-29d0-4202-a361-4bcbfa166755@gmail.com>
Date: Thu, 6 Nov 2025 14:33:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Add Qualcomm Technologies, Inc. Talos EVK SMARC
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251104125126.1006400-1-tessolveupstream@gmail.com>
 <xq4jidiffovpg3armhlzrzxloug4irumlycyyvmfaugajbtq4t@cutuj5736ayo>
 <58afe57b-68e8-4de3-841a-df3dbf04ee64@gmail.com>
 <7tk2hd5qursarvomuwe7yt574vmjixh23zz3iw6nzpzm6x7jlj@7q2vlik3t2h6>
Content-Language: en-US
From: Tessolve Upstream <tessolveupstream@gmail.com>
In-Reply-To: <7tk2hd5qursarvomuwe7yt574vmjixh23zz3iw6nzpzm6x7jlj@7q2vlik3t2h6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 05/11/25 20:23, Dmitry Baryshkov wrote:
> On Wed, Nov 05, 2025 at 06:27:42PM +0530, Tessolve Upstream wrote:
>>
>>
>> On 05/11/25 06:35, Dmitry Baryshkov wrote:
>>> On Tue, Nov 04, 2025 at 06:21:24PM +0530, Sudarshan Shetty wrote:
>>>> Hi all,
>>>>
>>>> This patch series adds device tree binding and board support for the
>>>> Qualcomm Technologies, Inc. Talos EVK SMARC platform based on the
>>>> QCS615 SoC.
>>>>
>>>> The first patch introduces the DT binding entry for the Talos EVK
>>>> SMARC board, and the second patch adds the corresponding DTS
>>>> files for the platform.
>>>>
>>>> Note:
>>>> USB(usb_1_dwc3) supports host-only mode based on the switch SW1 on
>>>> the SoM, which is purely a hardware controlled as USB-ID and USB-VBUS
>>>> is not connected the switching cannot be handled from SW.
>>>> Hence from SW Host-only mode is supported on Linux boot up.
>>>>
>>>> Changes in v5:
>>>>  - Updated commit message. (suggested by Krzysztof)
>>>>  - Introduced generic node name for can, dp, hdmi-bridge. (suggested by
>>>>    Krzysztof)
>>>>  - Introduced talos-evk-cb.dtsi, which has common carrier board
>>>>    interfaces.
>>>
>>> Common between what?
>>
>> Introduced talos-evk-cb.dtsi to define carrier board–specific interfaces
>> common to both HDMI and LVDS top-level DTS variants.
> 
> Are those two different carrier boards? Is it a single carrier board
> with mezzanines? With extension boards? With a DIP switch?

It’s a single carrier board.
HDMI and LVDS share the same DSI interface, and only one can be active at
a time depending on a DIP switch.
> 


