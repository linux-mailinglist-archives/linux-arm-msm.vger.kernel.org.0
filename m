Return-Path: <linux-arm-msm+bounces-73555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FE1B57778
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 13:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96467162AF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 11:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C152FF153;
	Mon, 15 Sep 2025 11:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cUpx8rxT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB8627817F
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 11:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757934041; cv=none; b=SbFQHGPwVJAZNjfQxuzOnw4o+Cioni+doKT7auGo95jZVMp0AWGaYnf7Bsni76DNmFUkla75UQ7sLxoWmtzwNOtQjRvmwQKFwQUHdCkrG+JAaxgO2kyPMylvrquVwxpbfgDE9GslxLRFc2/RnFN96YGnXL+kstj2dJdEtX+Ghg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757934041; c=relaxed/simple;
	bh=i5sgCc01vK4RPSfrnI/Y9ovkRzVT0szN5lG4kf9sjlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DvU8Inxt7yeGAS6S0tSThbyB5U8CYVaL89FZDI0gQ6sMHIsSEaZkxKul9/Ggq9FHKZuiHW/XJ4Ly6Lv2iFsddlaUrtoA2j076cJegBIBzDs2uv+clAxXr2PRmlwVKwyeX9YKYgS/R++k+HxI3q4ODBUNMcpet6Pe5CA2m4yvurQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cUpx8rxT; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3dae49b1293so2277955f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 04:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757934038; x=1758538838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XE7Xq4L1Dtfsz8f3IxnHKAOzDG+X/UjcqwyZapiSDj8=;
        b=cUpx8rxTrGfAhAUS02BT9pVpnxnIYzcbsXcry34hkSeZmwMLAcCj0nDPx2W2hGBiih
         vSk6a98fkN2/VOOzFzZ7eBqCqUaOJScX7+AKFlcgEi7SSevUvKZwvmUF2g9sVEOlcbqw
         XFmW+n/uhJ/ndzvhqB0umij2Oinq80pSqwxhtkRl4UrPpmULchBSchLFyrWzU8XQ6k7G
         sZSr2y44ALdMuSNe8If7jKjFIu6Nc4UFa6YTa9mVzVBr8XuEYEI5o7nGyOI02l1VhNKq
         NlfETCAnyeuULza+MILfbbuABtYdgw0HnFyGw6Mfly0S0YaWwvtyplXUXasCH4sN8Rsv
         JyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757934038; x=1758538838;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XE7Xq4L1Dtfsz8f3IxnHKAOzDG+X/UjcqwyZapiSDj8=;
        b=i693cNE1xzZGx4S6N8gepO4JCsDmocXlstmitgZa7fZ1+ORNQ60mobMW7xWKld6U/P
         SLzIGgsn4CMKCj2IdzngYNMS6L/wa7eor6GHcqg5+HjNCOmAzCA4odRxK5/BCTjxoYdY
         OkORJGTtNO4Cm0WgS8kZEm0R1+RA0gJh5L8UKtPlYd218AnDO2oNEywK2EH024BHIgCh
         uFGrvViQ3NsXAsydCwunA4kcQxbc+eya9bUEFka8pV5lglJSJQVTeRAsM4VxYCF+F22g
         rJ0rMjT2OoiVecofdseQbnknJFBNAFdkYjx5BgHaxIQEsVqd8AwUJOAMFoqQK7tqcvOy
         4weQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYkpY6rOrNhYL02b3dABFEbrPwnrSE8ZIOnvr+CocCZmccKOG4cBvOcpm+i7+0O3S7iQr5FaP16WLEGk5x@vger.kernel.org
X-Gm-Message-State: AOJu0YxsfWbO0/QyiOTNwNL8GYHPlN4AZGouo9JHU2M3eyKt+OAXEuaN
	tY4LmGbDjVswoXZUdKonD6otGWpEyxpop0b6TvO6AteUc9ZQFJNvq8ob/kA/V8PsrtI=
X-Gm-Gg: ASbGncuiM25xatdJtr+irWPOBvM7DhjTu0NP9XiWV/eUHjTFbqvkf8nRXcOoKzujTXn
	TL3H3lZKzZDCiHonuPNEPn6s3VAfymSrxEj98hoAXMqzjsSHgvM1FFh+cQGkShfmy54tdovDwAZ
	crigDb9xxzIsMdiVXHJ5yGYhtimnA+9u+MdFuYLB8Wn8xZ8UMZPofaFRzUqBuENIpbvXBdSUBHE
	wKPKh0a+99mqZmgdKt6YZmO9uO9nKi3WjRJ35h5sCHOfBmsLBd0owjxc8TYSVQM0883nId3hApw
	NOa/vefQQw76W7dXbYzUnriQMNvB0IJoCrNXiWgUy42Vvo0F/efXUe6tgnR6j1xC+VaBvEzmhsd
	yEEyN5RMU4Wm48itacxjKNo5DlZsBa/tUt8kHXbsQlogJmnKTWJimsn6cUo3D3CNlrKJhrbNTu8
	6VOKef/cIsxAk+qW8q08M=
X-Google-Smtp-Source: AGHT+IEWJRcQLHslpmLibsz3O85acgnTfdDU/E/N80/0EiGbiQC80sxLfM3h7gRZBVAU0IOwhNxuQg==
X-Received: by 2002:a5d:5f82:0:b0:3e5:a68:bdd0 with SMTP id ffacd0b85a97d-3e765a26bdemr11811776f8f.52.1757934038000;
        Mon, 15 Sep 2025 04:00:38 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b4222sm175270115e9.20.2025.09.15.04.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 04:00:37 -0700 (PDT)
Message-ID: <9a91fb03-ee63-49e6-b554-aecdbdc20014@linaro.org>
Date: Mon, 15 Sep 2025 12:00:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Enable IRIS
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Anthony Ruhier <aruhier@mailbox.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>
References: <20250915-x1e-iris-dt-v2-0-1f928de08fd4@linaro.org>
 <20250915-x1e-iris-dt-v2-6-1f928de08fd4@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250915-x1e-iris-dt-v2-6-1f928de08fd4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/09/2025 11:06, Stephan Gerhold wrote:
> IRIS firmware for the Lenovo Yoga Slim 7x is already upstream in
> linux-firmware at qcom/x1e80100/LENOVO/83ED/qcvss8380.mbn, so enable IRIS
> for the Slim 7x with the corresponding firmware-name property.
> 
> Tested-by: Anthony Ruhier <aruhier@mailbox.org>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index dae616cd93bdf54bf2d3a3d4d0848e7289a78845..e0642fe8343f6818e1e10656a1d8fec8fb09e7e2 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -1026,6 +1026,11 @@ touchscreen@14 {
>   	};
>   };
>   
> +&iris {
> +	firmware-name = "qcom/x1e80100/LENOVO/83ED/qcvss8380.mbn";
> +	status = "okay";
> +};
> +
>   &lpass_tlmm {
>   	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
>   		pins = "gpio12";
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

