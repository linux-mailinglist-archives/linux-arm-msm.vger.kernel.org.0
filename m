Return-Path: <linux-arm-msm+bounces-30207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52497965D02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 11:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C054C1F25B9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 09:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0777E178CEA;
	Fri, 30 Aug 2024 09:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hcyBQB5G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D63913A261
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 09:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725010440; cv=none; b=W9p8h5TkQBHpu8oq8zMIyrLIDndyZEFIE7mV4qrzqPXORSZTLBnRprkAkMekEZuvqXntIEx+Qq9CVYwHByw1Ga9q/eppr/Kc0I+YAI7ACMWENROGZAgWYrn0tcaB1d7nzj9DlRfj7o1rQSvXuQB47hHOxwsWkWwE/uFDCmg6Ai8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725010440; c=relaxed/simple;
	bh=5yslXqhvWQX9TnBSismjUh88BdfvlGVmkN25fRbxHH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e7xC6KqW8vCmGkTcOD+gVVheS3GqmY4YP2PIuF5QijgvZ64Q1nnIsmGwuexsWu3XP2435eeCshojMf3LVW5HV7emZMpwh8Rs5GJTBKQTd4n9rvfGPb3uLWRIvd2EUyRIQ4gKcIWrUYwrRDTwuletJBsBtCLDg6iJ2PfmlzCV8JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hcyBQB5G; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42bbaf45044so775945e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 02:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725010437; x=1725615237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pGZek37s7JUS9g9ervJ2hRM13bZo2pmesux2WExpQN8=;
        b=hcyBQB5GftII3BLkLnFzIcMznhMJV3Wp5Ue4LD0/Uvo3sVvsRFf6pI/lSlWXuemLnh
         Rw9JAYfRxDIyvwHb+8DNM+ovCyN4qUIYqXWk7kD3w4HezEO257LJGb/1pzvE933cpd0r
         nwt4MR59ob9nx2qRTRFktcseiE4i+oWdcUkOUbIh700kj7FTlDm/fKW3Wb5U18x/glC+
         9oCGtMvdZbDpcdVtZ2PJO1oxRwz4FC20txv5zOKlhugHe8JDwXE+ltIQ/wwB7T6SC0+E
         yORAmT04xmvxw7IF45v8JWzgfVjiKVzhEbagoI4O3mj5B5t8I59uv5IEvZJrBXoE3G7d
         c7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725010437; x=1725615237;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGZek37s7JUS9g9ervJ2hRM13bZo2pmesux2WExpQN8=;
        b=qwJADO8IVWy/NGngO0rmRRnmbD89RvcD0N80Gxno9UJ6Tt0RfETLHQOFqyqXhwmtc4
         YHSy5Gz1vL0zZvlVBSXu72Qkzeewg9ZRCwVpd6V31jsC8jJFQ91EpC46ZjUbp989thJQ
         NGXUSEdEDcCoeUvFg8Rm60zIdQ3rtql/Ur02crNJ0U18nuFeRjOxTqgQGG/sSkNDOyLH
         BTd34T0d9BsCW5cuuX3vx2B3PvxqnBfS3WuB1umLPvZ5GQCKFLNY/5bU/3+Tc2YgSxLB
         BvMVn7p24qCAWBU+qjh0Kd+U+bThiNtT3Xmf0jvOZRH4aTO/WAbv2MyvDekji6WEfr/L
         Jvuw==
X-Gm-Message-State: AOJu0YwyyN8UJHpmLrlA1OvPy/JFC71oJJb5qs57Sg2g2qshz4fovbje
	hhYZQ1ZEFEYFhjPnAyawnPZlLEYYTxKqd1oirWZLoxoJJK/iJ2ZX7d9aD/b90Ag=
X-Google-Smtp-Source: AGHT+IE+rnx/YrsfDOYvW2dfT+oacSiNX/1n93tiIETgoAZ48JpJutDBDzth7kSn1IPt8lBVd3JHmQ==
X-Received: by 2002:a05:600c:a49:b0:426:6cd1:d104 with SMTP id 5b1f17b1804b1-42bbb43a575mr7096425e9.4.1725010437310;
        Fri, 30 Aug 2024 02:33:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bba3f2875sm18328365e9.41.2024.08.30.02.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 02:33:56 -0700 (PDT)
Message-ID: <54632ada-d657-4c73-a88c-469eb6066608@linaro.org>
Date: Fri, 30 Aug 2024 11:33:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/17] arm64: dts: qcom: msm: change labels to
 lower-case
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240829-dts-qcom-label-v2-0-5deaada3e6b2@linaro.org>
 <20240829-dts-qcom-label-v2-2-5deaada3e6b2@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240829-dts-qcom-label-v2-2-5deaada3e6b2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/08/2024 14:34, Krzysztof Kozlowski wrote:
> DTS coding style expects labels to be lowercase.  No functional impact.
> Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi           | 100 ++++++++++-----------
>  arch/arm64/boot/dts/qcom/msm8939.dtsi           | 110 ++++++++++++------------
>  arch/arm64/boot/dts/qcom/msm8953.dtsi           |  68 +++++++--------
>  arch/arm64/boot/dts/qcom/msm8976.dtsi           |  32 +++----
>  arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts    |  12 +--
>  arch/arm64/boot/dts/qcom/msm8992.dtsi           |   4 +-
>  arch/arm64/boot/dts/qcom/msm8994.dtsi           |  52 +++++------
>  arch/arm64/boot/dts/qcom/msm8996.dtsi           |  54 ++++++------
>  arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi |  32 +++----
>  arch/arm64/boot/dts/qcom/msm8998.dtsi           |  92 ++++++++++----------
>  arch/arm64/boot/dts/qcom/sdm632.dtsi            |  26 +++---
>  11 files changed, 291 insertions(+), 291 deletions(-)
> 

v3 will be needed, I forgot to update arm32.

Best regards,
Krzysztof


