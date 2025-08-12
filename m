Return-Path: <linux-arm-msm+bounces-68821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B060BB22B62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 17:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45DDB188ADBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 15:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E91E2F4A0F;
	Tue, 12 Aug 2025 15:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zl8YIv+N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560022EFD94
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 15:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755011143; cv=none; b=sg+9llgYtZuZNpZwARW4Py/J41WdGYTyznoQ/bEt0KSvN0mRpfL6lWJtKAHT8CuoWhB7AAL3PdepXjHd+60BQycWxY6MFv4w+ZI/+OfsD3/pzwg2H5YNsekKSse95I3nlwmHAvRAq2qK4EAyHf7R5+p+DUQW9e78Cd63HJuU2AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755011143; c=relaxed/simple;
	bh=13LJJo6dqvQkGASUem9OaXV1fYDIMnu0t4nIeHZzuOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O8fGSqK9ekGYxU4wo57KnWba65N6tyGNxB9AHgNXfCEexETUTprwLYtOqgMSp4KTPtpaNIR7+/j2uZxbEbIH6CZhJyO4OSsuV9Djx/Pqgcn7Rdl2PmeYWoc/HlGhfo99N+qLcsArIfScHLl8Aa+Z9/anfPw8BkAHy+y7tcdt4CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zl8YIv+N; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-459e39ee7ccso54621135e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755011140; x=1755615940; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iFiyXHmzPTJSM/FpIqJQMHXEodXhM8NURp+djBOJcws=;
        b=Zl8YIv+NHaeknxTmX9VUlwVpvAn5dSqHUWM8OFlo/p0kE/AHP4jeEIkRAg62ZMW8hk
         HUTFYHU2v1m+1z2CSX+6p+9lixrqccZUN1fj3vr0lml6gcaka6RNVvE7yWIXgfmWFgJH
         pDmwocEuHB0NtVj9tuQw6ZTHKuq6euv2SR3yoI1DTUImknQ6WYTf0ob6r1J+eJpKccC9
         gPpSeNYmNHF0JI2M3o5DRSqn8STh818a8DqW89rWT57rwnOewHTbI5V3xtXqik6UxYnr
         j0hqrTIcv70LSYTRe5jQKT5FtTgIoVOamlzO1y6hVpX8766HXsgNKrRJLVuTB1ycYaXr
         KWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755011140; x=1755615940;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iFiyXHmzPTJSM/FpIqJQMHXEodXhM8NURp+djBOJcws=;
        b=vFxsYas08jtpUyq0EuVtMKy5hjFpn48NIsiAQ0XTAVeckB3/tRcRzBh0iL8UjwhhbM
         oqrhScfLSuq9YHPMXhUsdosyzBiJs6xgVIlDvin0p7BafAKvJ8VLKISlCYy3/oRDo1Vj
         XeTYzDoL8VF8AhjiFbDDrz1Nnw/7hiuGM5n5+jw7BHO3FtGHh3TsMrkb8ZDpKRfyDQCs
         7SlNNnPMplAV0a5uUTPogRoeYnvRbxRqskWvhhm8wpA/o6Zxbz7KFFoxSfC4G2Rdi23F
         Ik5WoBqXrsuDEx//ACcSCFn6lZcDlLcJ0aIs7Y8WbttZ9ZQfN8aKDf8+RhSY+xLmKf3H
         wHoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHGpQq3p1HQo8v1LGAePG217cC7gRAVs9WAzIlccNmMYXBIlNr5mt4S4Llc5Slfz7eVXqHfmjCnt10CZ9Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzHvVlqe4KAl6CX88bOrhyT7wTze4pMFZbcoFBPkcHYPvNYvpl0
	u6Sypl6iaD2l3mfSkWYjHq82U7JVPnfkVSS1kpCQdaMRIgFaBbTM3vfVUzYJcvpDr6Q=
X-Gm-Gg: ASbGncv2CA7GBzc+p7jf+UBOTVPFZjk+4nm+5OrE8R50YhvhqcUttPBboPUb5E48QLA
	HmetxyQF9M/EHed2vTQYrtgMQDXS2a81DLhTWc7u2K3Ae51/vJoUDEEf3YfJnK5PkUm32MPt/ny
	fs66tyo6VxYonUnNqYD9Rev1pBWFhroT+S4f+Qc2OMa8YSYFDXLrFhbBaxcXHw5gPS9JGsN/avM
	IKHaPYh6gpESVSZAfVnnv1zxAd8tgRzg2ZdUvOotTtqrGAVYqsV6wLXW3C7y6OTYRyLg7tF9Mgu
	otKDG9/anFaQ1oAA4OlUi3yXMipjPElR6yD5oFQI79zzK/+8LoHfTwrmXyMAJ4DNJPO2xS+MKPS
	p63b+bx9J9nQ6M0il6OleIXAKSHHRWR+HHFqy2lNeI1nc47/cqv9c2tJ8v7UYho8=
X-Google-Smtp-Source: AGHT+IFaF18WlpXLiOPapLF9skeq6bos29ChTJTlyHVAm8O0Lnm+tnZQv8MZbqesSAf81giG9PV3vg==
X-Received: by 2002:a05:600c:474c:b0:456:1923:7549 with SMTP id 5b1f17b1804b1-45a15b555demr1276015e9.26.1755011139689;
        Tue, 12 Aug 2025 08:05:39 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5873c43sm327424985e9.22.2025.08.12.08.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 08:05:39 -0700 (PDT)
Message-ID: <16e4883a-a056-46c3-a7c7-a87ff5da89a1@linaro.org>
Date: Tue, 12 Aug 2025 16:05:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <d7949778-73c4-4575-8db3-a3724f75eb38@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <d7949778-73c4-4575-8db3-a3724f75eb38@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/08/2025 14:39, neil.armstrong@linaro.org wrote:
>> +    .clk_freq = {
>> +        zero,
> 
> It seems clang doesn't like this at all:
> drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c:486:3: error: 
> initializer element is not a compile-time constant
>                  zero,
>                  ^~~~
> 1 error generated.

Weirdly I compile with clang..

thx though

---
bod

