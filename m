Return-Path: <linux-arm-msm+bounces-3451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E48A8053D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 13:07:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAB9A2817D2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 12:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA7D59E4D;
	Tue,  5 Dec 2023 12:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ox7KS79q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99F74B9
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Dec 2023 04:07:32 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-77f04969d2eso178125885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Dec 2023 04:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701778051; x=1702382851; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fzzss/3oc7wEg7L1wA9iFADpFSvhD8QNQvMXGtF4oXc=;
        b=Ox7KS79qlUvfkW4ogM7M+Kosv/o62NMH4dmPzTafqoK8YC3ynwwdkU0lBAUBcYHXGO
         WvVmt8Zt3TCi1VK8S5OLWUUK622HGR/hcjch4rQAF0/AeTTHBwGu7IWZoaQ6jzo/H7WX
         TIVxhTXgEId4KHwDH9+xT+DWSaJw1FhNc9M5Tuuw4uBfh/ah64mRDsf4EqBqSu3YKNzC
         HeWaGkNe+DZ64MjsAri6J4yuk6rGHz1TPfNGGAcsXoPJK7W4bS4pUqWP5dCzUOFm94nf
         AIGKSVM/hinzL6MPb0SAj6O3Lx9udn/USDHSYd32diirThTMP54zTrIFlLwtBExTAP2s
         Ss6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701778051; x=1702382851;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fzzss/3oc7wEg7L1wA9iFADpFSvhD8QNQvMXGtF4oXc=;
        b=PKTj3InTgLoqdDc+VYvksLL3ZwOjokZuxA2c2hSO1rIHJEwxkLvBg5e3/MkrAFE4Ps
         1B2RLVdFfHpJI7cTEgmIrqG2HOCQPOJLwxUcqS0UrxA0tMn2CGaf/3KwY2w5YWNbScY7
         X5OvaP8dLZZW+jIviWvanjwYtBl6uxONwOjfeafuD2ZGlD0abQ49jM07BLBYhOU24U6D
         yYVWrmJ186TdSImVtxYcGwwDJN2LmbKUXXG1a/rpiLQEtOUw46Idy0/R89wEqTSryCMe
         2E6Ek775PQMc+6dpXqAttnDrzGdKB92lsPToczhmdeABo39yqFnyBpVTZvx+DqqYkEJD
         douA==
X-Gm-Message-State: AOJu0YzPXJRpUukEknG7g6QGP3hnCAkC7wjy3WDoyYuHT7UwxzI3MGh5
	7TrT+kdrAp2XMAEtoewoGmE94vv2G0JXxGIw15q3Wg==
X-Google-Smtp-Source: AGHT+IEQ/fwXPYm/SKTmDVSPGaitnffnHXzR6LAxf7KIzfoLTCFxCaGIqthZPP3RG1C1BnV2D3zrLg==
X-Received: by 2002:a05:620a:8883:b0:77e:fba3:938f with SMTP id qk3-20020a05620a888300b0077efba3938fmr931908qkn.113.1701778051719;
        Tue, 05 Dec 2023 04:07:31 -0800 (PST)
Received: from [172.30.204.197] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id dx9-20020a05620a608900b0077d9fdde1dcsm5045144qkb.42.2023.12.05.04.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 04:07:31 -0800 (PST)
Message-ID: <95d47311-f25d-4594-b59d-bd389e39100c@linaro.org>
Date: Tue, 5 Dec 2023 13:07:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qrb5165-rb5: add a pin function for
 BT enable GPIO
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alex Elder <elder@linaro.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20231205112311.16391-1-brgl@bgdev.pl>
 <20231205112311.16391-2-brgl@bgdev.pl>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231205112311.16391-2-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 12/5/23 12:23, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Set up the pin function for the Bluetooth enable GPIO.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index ce6ae0771d34..ead0c45ba60c 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -1264,6 +1264,17 @@ &tlmm {
>   		"HST_WLAN_UART_TX",
>   		"HST_WLAN_UART_RX";
>   
> +	bt_en_state: bt-default-state {
> +		bt-en {
> +			pins = "gpio21";
If it's the only GPIO expected to be here, you may drop the
extra bt-en level, like the entry below

Konrad

