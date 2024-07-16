Return-Path: <linux-arm-msm+bounces-26333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBD1932630
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 14:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E615CB216F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 12:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B8D1993B8;
	Tue, 16 Jul 2024 12:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cOnxYQGD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FCD1CA9F
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 12:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721131641; cv=none; b=BU/lPqxpNwsXjq51hL/tJDy7FW6FFC/tdPPtHYoLtjJkjVHuhCFnMHPIPSM9y4uxwFT2WNRer7jkrRSwgcEKJLL4XOR0C3+lVWY/s3K3btkA81PMV8Jjxp8FKzP9tREJQhrtr8HiSAXzHfboC7DRQbbbQ334KLvefnXUxttDAZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721131641; c=relaxed/simple;
	bh=ooHPNdSX10YK8g++HA/Wk1VhEtfHnP2xmnmulMeYjxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZIRXq8cKU2SLEung1pNrRpS2vpT1Q7S5zIuTJ4Y2qcZ9fh1Qba4SuLumst0YkSs4wpRtUhoKqjYMMEHIDizxO6sER0IRTVjxxdPK2AG2vxPOl5sODlRaF645fS9NN0YIYVNkeK0gdfgkyAq2yZM0zXzVbL0Uajq0Lrb0FCxl2yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cOnxYQGD; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-58b447c519eso7243246a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 05:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721131639; x=1721736439; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OitAEpQqJBIlmDOIGTj4gJsZSFyCWFUbY46ZEpYoa+4=;
        b=cOnxYQGDiCPxID7hztarsd5BZmPgMuYKBl2ujzA/eLcyhN6wtpoV80u6Dmn/TUZ5ys
         Jse43iVW3UEcENKg7uXcYUdmsDEvZeEVJLprMFy6UOUaezBhuz1n87qhsD6/PSwDsrMj
         5mGd9VZzw4F7EX3n1rFAvLu5uSZdC4N3M0ASRwfNqUGI4mnPH/0K5O0vc57uN4JmXxrg
         KV11EcUAbCo5njSVffjkiePuTYBWIlHU3dS6QEv16llUG0SAk6EEYMkO5QWFnDxZ3Ptr
         pZ+iNojeGdIrK8ZFXL6/a9jx7xbXm62ejy24kx4dqOLdVn5Qqg5sAOIqME2mZdDFzsBU
         ucQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721131639; x=1721736439;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OitAEpQqJBIlmDOIGTj4gJsZSFyCWFUbY46ZEpYoa+4=;
        b=ponnQm1U1YKA9cA++BU+RUZnOocNRAvJcVS08zytDVzzQdPjYajCpGn1nGBxoTYHNK
         /BAEjCiUp0goORV+Rwnl3opYkR1X++zYiRN7eKB+TpeBtpmh15KRvZnVPnyUlepE16qm
         yAgxxanamOh8HY1WcfjhYZamLAQah/Td0F0Ws0ln/SNPA3LIUhyrYjB+UWARZBWyKBjR
         pKXWuD8uOsOg8enDHQLiLpDUUpsgsaXtAaO2UFPeB3FonwZFILhUU1IgWoLvSWfwPM0O
         uT2COvLSuWNDKFTbhSB7Z6pBMWH0CR412NGaVKahe3IB5j2KxEW8f4DF/uQSQCRR8PMQ
         XGMQ==
X-Gm-Message-State: AOJu0YyfDhUKoZD0b+xDzbSO36FExQW0MazBG9MP+chj1F3fnPN3Uhzb
	XFopj0HuNlKhz+ndE8GmEbUKaZovkHJ5kNDjFDtuFUcHiE848b2u3XRgSDCC+eQ=
X-Google-Smtp-Source: AGHT+IFRxckN/LaVLeOedvoFoHuOf2HGAk055qS35Yqh8wYVv7r+i7UMnc+WVbdPJ9UqvvlobIlHpA==
X-Received: by 2002:a17:906:af0e:b0:a77:cbe5:413f with SMTP id a640c23a62f3a-a79ea3ec461mr115457566b.4.1721131638520;
        Tue, 16 Jul 2024 05:07:18 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5a38cesm307296766b.9.2024.07.16.05.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 05:07:18 -0700 (PDT)
Message-ID: <c3126e10-05f9-43a6-aa9d-d96354e27382@linaro.org>
Date: Tue, 16 Jul 2024 14:07:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] clk: qcom: Add support for Camera Clock Controller
 on SA8775P
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_imrashai@quicinc.com, quic_jkona@quicinc.com
References: <20240715-sa8775p-mm-v3-v1-0-badaf35ed670@quicinc.com>
 <20240715-sa8775p-mm-v3-v1-4-badaf35ed670@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240715-sa8775p-mm-v3-v1-4-badaf35ed670@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2024 10:23 AM, Taniya Das wrote:
> Add support for Camera Clock Controller on SA8755P platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

[...]

> +
> +static struct gdsc cam_cc_titan_top_gdsc = {
> +	.gdscr = 0x131bc,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,

Shouldn't this also have a .cxcs relating to GCC_CAMERA_AHB_CLK?

Konrad

