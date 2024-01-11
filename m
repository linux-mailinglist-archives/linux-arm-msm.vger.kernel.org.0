Return-Path: <linux-arm-msm+bounces-7052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6BB82B387
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 18:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8D6F28D2B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 17:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE57151C5E;
	Thu, 11 Jan 2024 17:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y91CnuyM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC32524A9
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 17:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50e759ece35so6265337e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 09:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704992400; x=1705597200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l8IcJn882ZENlg2qEEENksJucf6hT6H3VJSc8mUcJzI=;
        b=Y91CnuyM7pTmak8Bsgv0srfWAxL0t4NSJDrxAVMQyuTkjjkdyTaQ0IZEg8Wzucs0rR
         DzvAoJD7yqjY5/WAM354mfj986ZKjCoGY/rS2V9RfOX0xRdT1gILAA7mlhYp/6gSxadh
         xhorNfo0R6rYRjeon4fOhzPN+pEzCLJibwHeg/H3CEhbpoiba1w19m8s5AM0fVUJTT1x
         mjLzieIMRQm5GnbY2ap5y/PLfTC4XqCXfDLNJo6aPDc+sdPCj2G0QhRvkSHw6ki52AMQ
         vRcWGlCh5ZG1CR7nzl/wyxy49AvhREC8OOmL2GE4z8iC/kPBygbkuTdRSg3LSo2jan93
         nyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704992400; x=1705597200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l8IcJn882ZENlg2qEEENksJucf6hT6H3VJSc8mUcJzI=;
        b=bSebSPxSA2bmuIzA6Im6b4gt5LjJbPw+nz7zM8/cZrEuGxZ6bA3WM7wV7rYduZXTr3
         i9JYzVAdIWTVAFlfSflQJUqDwVZeMWKWazyE4zuQNsNEgxHJZoEq/DYAsvIwK9fCFA9d
         /17JBqi7qRI0M3piSHLxKu+83dCBGaxs6k1DjOG6T7aVyfecoWbiSBUAnNWlI1Jp8EE3
         oSrh4Am8DG4QHcPm3OJNt9D71SS3qJhdT4zz0Q8qE08x9GWCY+uksM3dJTNCpQ6igAcV
         DF2PeX/UB2fMMqb9TQpoL/BrTpsIMeGqjEyyXZIKpjmO6vH3h3P4QEuFRsmKTJrncMfw
         /h3g==
X-Gm-Message-State: AOJu0YzD/HRzo//4jVmpCsohLrDfNNeQVorXDcuLMo8bmZ1KpSvd+WP8
	7glYuhfloVYYl4xIxEJIBiEAw94piYqUCQ==
X-Google-Smtp-Source: AGHT+IEVXqMFZz3mSFHYrFcrvpVDnPktf3QK2oTY1tJI9wlboM5Q4HyQe6EBmHDj4bRkh1S5bZ5C+Q==
X-Received: by 2002:a05:6512:33c2:b0:50e:c8ec:8c42 with SMTP id d2-20020a05651233c200b0050ec8ec8c42mr862048lfg.130.1704992400254;
        Thu, 11 Jan 2024 09:00:00 -0800 (PST)
Received: from [172.30.204.205] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u12-20020a196a0c000000b0050e64b558fbsm242640lfu.79.2024.01.11.08.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 08:59:59 -0800 (PST)
Message-ID: <384635f4-e4e8-4a84-82be-dca71b06a9ff@linaro.org>
Date: Thu, 11 Jan 2024 17:59:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8650-qrd: add gpio74 as reserved
 gpio
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Georgi Djakov <djakov@kernel.org>
References: <20240111-topic-sm8650-upstream-qrd-fix-gpio-reserved-v1-0-fad39b4c5def@linaro.org>
 <20240111-topic-sm8650-upstream-qrd-fix-gpio-reserved-v1-1-fad39b4c5def@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240111-topic-sm8650-upstream-qrd-fix-gpio-reserved-v1-1-fad39b4c5def@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/11/24 17:58, Neil Armstrong wrote:
> The TLMM gpio74 is also used to communicate with the secure NFC
> on-board module, some variants of the SM8650-QRD board requires
> this GPIO to be dedicated to the secure firmware and set reserved
> in order to successfully initialize the TLMM GPIOs from HLOS (Linux).
> On the other boards this GPIO is unused so it's still safe to mark
> the GPIO as reserved.
> 
> Fixes: a834911d50c1 ("arm64: dts: qcom: sm8650: add initial SM8650 QRD dts")
> Reported-by: Georgi Djakov <djakov@kernel.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

