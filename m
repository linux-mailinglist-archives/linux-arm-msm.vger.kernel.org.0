Return-Path: <linux-arm-msm+bounces-20744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D23E8D1B58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 14:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18487B212E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 12:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9F316727D;
	Tue, 28 May 2024 12:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b5AxwQd2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3251A130482
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 12:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716899524; cv=none; b=T+pvb5LRKBp3Nsd+LufNv4B0SH5z+wdCwgIPWiKtXOtNeZXPiDjFojlStgPb/EoqheLtLsucOGsrML00OAxGu9rkOfBPGmx2B9cevYF593i14uVd29OniO+Q0HheqLFpCR5w0DI0Iv1avqKoqT3LsJfouUkPBA3E7umqol48x/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716899524; c=relaxed/simple;
	bh=KiqVR5A7afC0yC25lzwE3V12yYzsy9gKTVKR1n3uWcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eD6P8ibFXz86ICukc9EYAxWhhgjRcxC3AuvdbDrRUchWQy4bHexjPZxUG+cSV1BWA6mjA4p8zYuukqYISnm6xiSAOxeEZJJeEzL+p/mW44ld8SNNcWicdjKCBdTAFNk0bJDYc/fg9feLOmJl0toV5buxs4+sLMsonFV8N3lDYpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b5AxwQd2; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e95a1f9c53so9437791fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 05:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716899521; x=1717504321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RJz0ZlzWAoX1DsekGPlBTARTw94E21rzFJ4WFq7Pqbc=;
        b=b5AxwQd2DpVcmJPZLobr4cFu2W7XjvYeDu4mNSQ+zfY9F5NmfTLXgv6pfye2QIizA6
         RUMiBQ+N6aDJKlCLT+ycWRbWKeNRBRcWf66ALyTwbkGlm9wDqQIoa0wifoU7+XOdcMGr
         KR/U+ODpgno+tTwial0n4nJUZua6ER9XvxGzKnUMkI/iip18cwyu5Hvzk+zNhKnRrvXh
         RaItNtJltvz9olQarDGMP5laCSH/+dPKSH7xscKhHoy1RubA9ycWcMUJLyMWUsTUgh8Y
         gxkCjPlPWErB6QwiQ0+/IWaa236L/Kb7zF4nLeEAAOxQ9GuC6eKS8AHSjCXLbJnd37JY
         HloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716899521; x=1717504321;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RJz0ZlzWAoX1DsekGPlBTARTw94E21rzFJ4WFq7Pqbc=;
        b=sQDn7bVZw4/8ESfct7Fp90d1CM+Om/d8u1qdYmPGA/f5EBHVzrHZGyveje0kUf3jn0
         semYDJS6h2HflzWgRP6IbovhjOw+Zr9gbmvLKdiQCHZ+Ll//aElIJhM7wQKd20PUK+za
         9w1rpaqaKDCiK1RGJTLQSPDrTRia1AW4F4kwrxmsLq6K1Gi7La8b6KQu8KZSXbXOJn+l
         ef+U8HcYTD5tEZj4Ni3B3U+UEmJV6CQ+QQ0EXHmojBD0xz1IJh5xEAEeAPUNziuz4Uin
         koj9hckUiY6DP5kU/29/ZsU6hler+pueZ42GWlJwayYdOIMeRW75Dp+rDpTKi9cbvqef
         vyCQ==
X-Gm-Message-State: AOJu0YyXcbhUMbMJqfaLh0+DJFneklaW/QBpt/FI1e0XqSsDvFptv1AQ
	cAdm5HegMqWmdGgr2QYGYAn3bPae2Pk0b5iNxyvXjXdf/4Zg1VNLExKSC05X5qM=
X-Google-Smtp-Source: AGHT+IGCVSDUDni7R8/hFHGkj4WdV8NjIh01e0oRCX7em4jaFWxs4+Z1xS7i0vRkAhtdpH+EgweCAA==
X-Received: by 2002:a2e:83d6:0:b0:2e7:1b8:7b77 with SMTP id 38308e7fff4ca-2e95b0c163cmr77435761fa.22.1716899521303;
        Tue, 28 May 2024 05:32:01 -0700 (PDT)
Received: from ?IPV6:2a00:f41:c97:23a9:35bc:df2e:d894:2c76? ([2a00:f41:c97:23a9:35bc:df2e:d894:2c76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bd0dc78sm22371461fa.71.2024.05.28.05.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 05:32:00 -0700 (PDT)
Message-ID: <36f22383-79a3-427e-bf17-35ce2e1dd620@linaro.org>
Date: Tue, 28 May 2024 14:31:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8998: add HDMI GPIOs
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
References: <8cc61db5-2920-4dd1-8132-5af434fb05b1@freebox.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <8cc61db5-2920-4dd1-8132-5af434fb05b1@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

[...]

> +			hdmi_cec_default: hdmi-cec-default-state {
> +				pins = "gpio31";
> +				function = "hdmi_cec";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			hdmi_cec_sleep: hdmi-cec-sleep-state {
> +				pins = "gpio31";
> +				function = "hdmi_cec";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};

It's super strange that both states are identical. Usually, the pull-up
is disabled and the GPIO is unmuxed (i.e. function = "gpio"). If that's
not the case for whatever reason, you can drop the sleep variants and
simply reference the leftover one from both pinctrl-0 and pinctrl-1.

Konrad

