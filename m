Return-Path: <linux-arm-msm+bounces-22805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCEB90A6CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 09:17:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0B0B1F2550E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 07:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FDF5188CC9;
	Mon, 17 Jun 2024 07:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oGtE8xQz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5DF69D31
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 07:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718608632; cv=none; b=FvK88nE0dZPmGJnwfpAo88h+457t35d3GYO6unUlRR0jtiWsVF+PMBbWHEXXPdy6vgC8XoM4EMCjKPO+fDehEZgg8p1KLSnGt1xPNSm2rfnYWtoJsDJKROhoPkDkh+u4STZCAFYGhLP/fAfa9vVHHJLyISIJwy9QwQxjCXLIlQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718608632; c=relaxed/simple;
	bh=o+XHwU9Ia8s/07sziBXBllYYYQohLrKt+pSCzLXsNMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BnV5kdr3XYZAuhNKVBabUiHbfsUiIzB4LCQItmOJKeIRBZXLjYxBjMOFwwNQP4hSN41WON3d247x6NQnkWwQEFo162IFwVT1djAbqDg2L73AhEj+Z9OkTVCYMLPuuvBqGeirveuxhArO7TU/lT45+UjIRj5FDGbz0Sv3is+xARQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oGtE8xQz; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6f11a2d18aso524016866b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 00:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718608629; x=1719213429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TH4URYsxyi4XBw/ZuFT5IIkP8wEOdDP9rHLksPbeeBg=;
        b=oGtE8xQzT9EMyryW/3JpBCAmC7evfLTtF0BtXjL8FYtM01IM4UvqETmi8339XV/Sqh
         YO+mrj8T21jEI996h3/ktt/dWzn5aORipMb5Yze87TOcvu1BbPSlihExol/8KKFw3Zox
         m1dQOCzr8Nbe3J5LvrLzwYxGyOaJ6yLLM8DGjSsma9M0JgPYs+coaG9Z/LWzCMIgkq2O
         q9VOwTMz2WaNc/EujdBvDb494QwS8R6oke3KzXvw9FW1cDoOugJOfBmSbk5ZlGwhhfNV
         hhclDTdGjeLCQ9/F9sVGzuzUI+KuZtC3d9aWfinVyLl0dE6uYMgDUr1SBxd6e1lGni4e
         8oVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718608629; x=1719213429;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TH4URYsxyi4XBw/ZuFT5IIkP8wEOdDP9rHLksPbeeBg=;
        b=o/82fK+6JXPOxdJ45lqdbv4bRd5YxSZ/xVodQONL4T2yQUXCZ5N3ayLeqJ5DeZENg0
         TdFZRtrudhQgIPUO1shXTKVzfR1dvJUZFCvXzKFl33t18DerLX330kRlLJLzLTYF+e5G
         byaZfTBi6L7niq2WaXJgzUcX997bgfdhze+lQGAS3S09N3RzY3iDNB3W4eM/A0Ua8l3m
         wNhCgdHqrwVRlKxJjikziuIAUkwxAJ4j/OisnXSV+OU0nHfYJflGn3xAtQunzOvw0jkE
         Bs1LCT7XoV+xRvSKZjfx58dHIMgexDDiVwXnAvDCXniqks2X8EzNMDCkn8uHLncBQKp9
         8phg==
X-Forwarded-Encrypted: i=1; AJvYcCVQhLe6b6fa/e40ibZcfNkrREFpu0iSR8VA6Fmlrt3sCihN6eLDCFXoFYE7VK3MWGrJTlWtGLXc6ufGX247ntJMZxsbe5/dwP/LUm8uFQ==
X-Gm-Message-State: AOJu0Yz1/r2bhMyO0AVYXGgj9nteZV//vXQ3I5mH7t5eK9ipanuw8qTP
	b6HHLAa067dofT1tCIvl/BGG8VczhjHhfErVCb9oyow6cp5QmmzCYP0QutdItNo=
X-Google-Smtp-Source: AGHT+IGdukI2s05oJDZEKnlcG3/BHW5m/agSv7RDlr6s2QiHsZELrsLCWbtCQtg1w7qD+EIB3Pm5oQ==
X-Received: by 2002:a17:906:4a4f:b0:a6f:507a:b101 with SMTP id a640c23a62f3a-a6f60cefe44mr582715366b.6.1718608629211;
        Mon, 17 Jun 2024 00:17:09 -0700 (PDT)
Received: from [192.168.0.18] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f85352eabsm124715966b.54.2024.06.17.00.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 00:17:08 -0700 (PDT)
Message-ID: <8d34e05c-452b-4be6-9a13-df0b0aadb993@linaro.org>
Date: Mon, 17 Jun 2024 09:17:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/15] Hardware wrapped key support for qcom ice and
 ufs
To: Gaurav Kashyap <quic_gaurkash@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 andersson@kernel.org, ebiggers@google.com, neil.armstrong@linaro.org,
 srinivas.kandagatla@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 kernel@quicinc.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, quic_omprsing@quicinc.com,
 quic_nguyenb@quicinc.com, bartosz.golaszewski@linaro.org,
 konrad.dybcio@linaro.org, ulf.hansson@linaro.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, mani@kernel.org, davem@davemloft.net,
 herbert@gondor.apana.org.au, psodagud@quicinc.com, quic_apurupa@quicinc.com,
 sonalg@quicinc.com
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/06/2024 02:50, Gaurav Kashyap wrote:
> The fifth iteration of patches that add support to Qualcomm ICE (Inline Crypto Engine) for hardware wrapped keys using Qualcomm Hardware Key Manager (HWKM)
> 
> They patches do the following:
> - Address comments from previous versions (https://lore.kernel.org/all/20240127232436.2632187-1-quic_gaurkash@quicinc.com/)

First, that's not true. Second, that's way to vague.

Best regards,
Krzysztof


