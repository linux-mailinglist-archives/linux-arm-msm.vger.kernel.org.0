Return-Path: <linux-arm-msm+bounces-1033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F56E7EFCD4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 02:06:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 353231C2085A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 01:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88E9EC8;
	Sat, 18 Nov 2023 01:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dufXGQ2X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F0A610C6
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 17:06:23 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9fa45e75ed9so24579466b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 17:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700269582; x=1700874382; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4O9Y1/hJUXa+2KCBVAziPC7SkkcerSExCPCyWU7zFNI=;
        b=dufXGQ2XX84Lb//713+FThDcSRDpD+bfZpmjyGfDaLOxOp/jHe6CvegA5qLbcblWPj
         H3ktJ5aBWNu435Jzyibi67qABfkrdHOQuEoPIbLmn3wgAVaukq46047yHjWQy5vTzoB6
         0N7oOIKPvIt6CBn7COio8vgjU4bV1hTA6D3PAHVaMe8XrFTPLhFeD1vxhvfyhmi6x68z
         Pp2C5KjF1YJdqauFrQUsU/O27N7pYnX4pG2fLsCmq50QZPDEUP8qmoftk9Vo06ZyTp/8
         YKzy5+lNV5vmpGh8zx+c0ifOrx0AiUYJrPQbRBRHQNUggk8nS/+67W5xq6uGhph28h1p
         CigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700269582; x=1700874382;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4O9Y1/hJUXa+2KCBVAziPC7SkkcerSExCPCyWU7zFNI=;
        b=IzrgoERIUIX7ofmtYPhnvZHfr8nhtBD+Gc5QYF5OY08kHjoyG22CfIgNvq6F3CR6oS
         5fR0mqYgItUIrE7vCc5ZY35NPIy59Tl84/7Jobvrh+wfHeVBT2pSx7WoqkGDo1bIBrb5
         f6X8HF0OZObWZAKqqD4jFoI5dtXTVIKSSivK6S6ywyuK5V4iAGl4oSOgjFKhsi3oZAWu
         m57IV4gDqrEVAySKs4IyzZ8qv+mTusOV8HEosI7LG5ReJMd/8MABB/md74CbQdKcAdy/
         w8EXKVvQjPo1upRnAWZdq/tkRh8lmfZ8GLbk35JrBM+ZmoKXmdfdBQHHrEAnMt8LiVNs
         uaqQ==
X-Gm-Message-State: AOJu0YzlPGCt8SJRKKQwRFE3EsfjZ4krh2XXPeTZEcWfyN6RkI9Wa3K1
	xShRDXHgIenmqIqnQyxN1elfsA==
X-Google-Smtp-Source: AGHT+IGD5VqU/VikH08bv6P2ZemTESCQQPO/BcUy7UKQJCy4Lh6+IFe/6TG47Ps/J21C1Xmse/dYOw==
X-Received: by 2002:a17:906:5357:b0:9bf:20e0:bfe9 with SMTP id j23-20020a170906535700b009bf20e0bfe9mr701024ejo.15.1700269581768;
        Fri, 17 Nov 2023 17:06:21 -0800 (PST)
Received: from [192.168.201.100] (178235187040.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.40])
        by smtp.gmail.com with ESMTPSA id v12-20020a1709060b4c00b009b928eb8dd3sm1327704ejg.163.2023.11.17.17.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 17:06:21 -0800 (PST)
Message-ID: <918ff1f5-ce01-43ea-b034-e69fbb31f495@linaro.org>
Date: Sat, 18 Nov 2023 02:06:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/5] arm64: dts: qcom: Add base X1E80100 dtsi and the
 QCP dts
Content-Language: en-US
To: Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 catalin.marinas@arm.com, ulf.hansson@linaro.org
Cc: agross@kernel.org, conor+dt@kernel.org, ayan.kumar.halder@amd.com,
 j@jannau.net, dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
 m.szyprowski@samsung.com, u-kumar1@ti.com, peng.fan@nxp.com,
 lpieralisi@kernel.org, quic_rjendra@quicinc.com, abel.vesa@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 quic_tsoni@quicinc.com, neil.armstrong@linaro.org
References: <20231117113931.26660-1-quic_sibis@quicinc.com>
 <20231117113931.26660-4-quic_sibis@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231117113931.26660-4-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.11.2023 12:39, Sibi Sankar wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> Add base dtsi and QCP board (Qualcomm Compute Platform) dts file for
> X1E80100 SoC, describing the CPUs, GCC and RPMHCC clock controllers,
> geni UART, interrupt controller, TLMM, reserved memory, interconnects,
> SMMU and LLCC nodes.
> 
> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
[...]

> +&tlmm {
> +	gpio-reserved-ranges = <33 3>, <44 4>, /* SPI (TPM) */
Surely SPI doesn't use 7 wires! :D

[...]

> +			L2_0: l2-cache-0 {
the cache device is distinguishable by its parent, so "l2-cache" is enough


> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-unified;
> +			};
> +		};
> +
[...]

> +		idle-states {
> +			entry-method = "psci";
> +
> +			CLUSTER_C4: cpu-sleep-0 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "ret";
> +				arm,psci-suspend-param = <0x00000004>;
These suspend parameters look funky.. is this just a PSCI sleep
implementation that strays far away from Arm's suggested guidelines?

[...]


> +		CPU_PD11: power-domain-cpu11 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&CLUSTER_PD>;
> +		};
> +
> +		CLUSTER_PD: power-domain-cpu-cluster {
> +			#power-domain-cells = <0>;
> +			domain-idle-states = <&CLUSTER_CL4>, <&CLUSTER_CL5>;
> +		};
So, can the 3 clusters not shut down their L2 and PLLs (if separate?)
on their own?

> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		gunyah_hyp_mem: gunyah-hyp@80000000 {
> +			reg = <0x0 0x80000000 0x0 0x800000>;
> +			no-map;
> +		};
> +
> +		hyp_elf_package_mem: hyp-elf_package@80800000 {
no underscores in node names, use hyphens

The rest looks OK I think

Konrad

