Return-Path: <linux-arm-msm+bounces-3227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94988803120
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 12:00:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50497280EBA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 11:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621C61C6B6;
	Mon,  4 Dec 2023 11:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z8GxFUzr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138E8114
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 03:00:00 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a1b7b6bf098so104614166b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 02:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701687598; x=1702292398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0UZiTscdrvqfLrwy30AwVqngp6T7XzxdwFwSMft6nhU=;
        b=z8GxFUzrTjz/WjrEsC/J1q1fF8XtJah/s1bHBE5mfAvZPMRsgpB5cIafOe+/r9vxr0
         oz6ldwuoP5YaVpte6E7LI//dD/kRLOVDCFLbTHmTih1eH0ruIT33KYpeTKwDVCzZIzwh
         3cKb2jbACiqwTM5pFZUfanYMxF2Xw+0q3LqQjVEQgHZTMQX7T3MVOQ904HH5/E3yU4gV
         x/hHzKgEbUTocn4UdJcsYgyy6kJQY7Mr+dcMNJiKmIe+AuQg3R1QG7kQuzNtzYkKAAqO
         MV50GPZS1bnoAdTrZfx3TfI9eh0xNBXLEXNWAxpJvEhtAy4LFwj56/jpQ8zkPEfazzOE
         40DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701687598; x=1702292398;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0UZiTscdrvqfLrwy30AwVqngp6T7XzxdwFwSMft6nhU=;
        b=MglZIo4Yxm3s8tB1xAostZ9v+rTWYQI0uf46gxTuNS9hVMl90MXncoOPW8puCgOoZa
         mLguhSCnsZXzDih/Qeg60FR5p2zh8YpReMdi+AbJbbRkWuakParrdQJekOjnj2ziry7P
         CNLTv4jCzwLIM4ttK8tV3Jf0WuM3XTXNblQZRAXZLC1c2lml24yMX4KxLzGu0Vk2moRq
         W5WeF0W75V1tbydQaAYes9vqwKEkDP424ViAPhr3V/NqXTSh1u8MpTdMV3WObVI57N5c
         E0H3eBpwUvtOQG+F3djYL+saIUNheqpC04uEGremvve/FyF5Ww4BzZChtKxv6OzYEq68
         vIDA==
X-Gm-Message-State: AOJu0YyRUA4FGkE9Xd+j6j2bfWo/VWg5KDIwO+0DRNYA/8UipdarT+Yq
	CJRKvD/rZOeu3im+D5TKuaTu7esd+HJzBR2h2L42F1UW
X-Google-Smtp-Source: AGHT+IH6YNMJgPuilryBN3FihpD8caMksKHY0VPo7u2+B069qKRk7r4odWOBmch9unNmjJPoEsKOHg==
X-Received: by 2002:a17:906:24b:b0:9a5:dc2b:6a5 with SMTP id 11-20020a170906024b00b009a5dc2b06a5mr5354376ejl.35.1701687598414;
        Mon, 04 Dec 2023 02:59:58 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:366d:ca8f:f3af:381? (2001-1c06-2302-5600-366d-ca8f-f3af-0381.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:366d:ca8f:f3af:381])
        by smtp.gmail.com with ESMTPSA id jt14-20020a170906ca0e00b00a13f7286209sm5168944ejb.8.2023.12.04.02.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 02:59:57 -0800 (PST)
Message-ID: <cd8af752-34ec-4ac3-8713-08add7d29b32@linaro.org>
Date: Mon, 4 Dec 2023 11:59:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8939: Make blsp_dma
 controlled-remotely
Content-Language: en-US
To: Stephan Gerhold <stephan@gerhold.net>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20231204-msm8916-blsp-dma-remote-v1-0-3e49c8838c8d@gerhold.net>
 <20231204-msm8916-blsp-dma-remote-v1-2-3e49c8838c8d@gerhold.net>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231204-msm8916-blsp-dma-remote-v1-2-3e49c8838c8d@gerhold.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2023 11:21, Stephan Gerhold wrote:
> The blsp_dma controller is shared between the different subsystems,
> which is why it is already initialized by the firmware. We should not
> reinitialize it from Linux to avoid potential other users of the DMA
> engine to misbehave.
> 
> In mainline this can be described using the "qcom,controlled-remotely"
> property. In the downstream/vendor kernel from Qualcomm there is an
> opposite "qcom,managed-locally" property. This property is *not* set
> for the qcom,sps-dma@7884000 [1] so adding "qcom,controlled-remotely"
> upstream matches the behavior of the downstream/vendor kernel.
> 
> Adding this seems to fix some weird issues with UART where both
> input/output becomes garbled with certain obscure firmware versions on
> some devices.
> 
> [1]: https://git.codelinaro.org/clo/la/kernel/msm-3.10/-/blob/LA.BR.1.2.9.1-02310-8x16.0/arch/arm/boot/dts/qcom/msm8939-common.dtsi#L866-872
> 
> Cc: <stable@vger.kernel.org> # 6.5
> Fixes: 61550c6c156c ("arm64: dts: qcom: Add msm8939 SoC")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> This should only be backported to v6.5+ since it depends on commit
> 8975dd41a9db ("dmaengine: qcom: bam_dma: allow omitting
> num-{channels,ees}") which landed in v6.5.
> ---
>   arch/arm64/boot/dts/qcom/msm8939.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> index 95610a32750a..9eb8f1ceee99 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
> @@ -1761,6 +1761,7 @@ blsp_dma: dma-controller@7884000 {
>   			clock-names = "bam_clk";
>   			#dma-cells = <1>;
>   			qcom,ee = <0>;
> +			qcom,controlled-remotely;
>   		};
>   
>   		blsp_uart1: serial@78af000 {
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

