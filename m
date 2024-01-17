Return-Path: <linux-arm-msm+bounces-7517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F22E830E1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 21:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C79CB281B51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 20:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C82250EF;
	Wed, 17 Jan 2024 20:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jHP26o5W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A650D250EC
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 20:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705523944; cv=none; b=ut6VC11s08GNFkqPm5nsJ++ZupLnMuLfxF9IELXWSaqOA9uhf4jlcXkrhlNk2eWHT6Lf2x8o6wbFRbuD/1oKMitZ0PZZLkASTOhoagq0EDLxl1/fqQ5JtV9LUAoeicgHIsVHxfVYt2PG44K3YKUSL70sthGGuU88TgaUdKEiRjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705523944; c=relaxed/simple;
	bh=8mQrGiJSycupzR9LCfp2y/hXC4hOoN/BwZCVy0ud0Qw=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=l8a0SzepBR2VSjsLMsaoLLO84QOpwR7OuRJaQyucZhYvXWMZUvDBdTtIoWSi/f4CqDmUes1xchABfMkhbmD+lPCsjtewBIuvqvFcpHFpwa45VQ0D07fUcxyMkR3/s5PvojAjLOJeYqlGNBSfOs5Fkgsgjf/Bgg6EUlGaN8UrBlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jHP26o5W; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50f11e3ba3aso106623e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 12:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705523941; x=1706128741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GgXkc5sUxUIkETjKviniRFVlsVpLigaLq/cF1b+TQF8=;
        b=jHP26o5WrV6KCT2wZb64mCG8efGy9DKuuCRK/hWMhId5ZE+/ZBUeu4hr+3VXQBH6/6
         oKxwFErWEWlphNkDmdFIf53Wpi/qEzkgqNLdW5+/aQAHXEXmEW9QMd09bov93nyF9WbP
         KO1l9F/mANimDw6iC0vvKkufVaIS/usMfD7mHuK8dfCWg+CWmD3bY+woC4Zf0zeU4YTo
         hWMWARgQhbri/h+e0K/pGLcYp1flTprI7Bf8lVqJpGbtNuPffX4oDgcy0loGbHil6Mxu
         VNMEUsqFtgzGC1bVDnGrK69MnYRgP9VBDR+Ia5/ajrTcT2zLgyoVuvi9QcI46+gEDbyp
         mPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705523941; x=1706128741;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GgXkc5sUxUIkETjKviniRFVlsVpLigaLq/cF1b+TQF8=;
        b=PQWNWcTObM7mBuwxEPicki/N/tNOfOdYNbstw4rERIWDOlSSWiSLHbrNl6Cb31CK8e
         o3Mpe5+lOT0QCDhpRc8w1hfw6IA3pn9XEEDZHNISQ4LxEe+CljUdyBmWXON9z8Wt2SO0
         Fzi9jkT5q/gXKbg7q7jlvTT4538WBBEsf0TxF3dn+yZjty+8DdscNLsz+oUJBx4Kt2ku
         Wn7I8zdT2wyWjvXbprk5Y1NU8FV2vddEMZLyGnCsii6azc7zOHkIMbLAZsMrYE9Zinfj
         apk+cRls7KRsda7Cga918YWkPTGFteIFdyFky63hSVtJb5/cO42tQcXBSv3h2rz8rKku
         YluQ==
X-Gm-Message-State: AOJu0Yz5hX6+rZuaWhO8ylaCMSwoBBC8W4WKXsGFXSNQdju1Om45s/C5
	SkWhoSyG4J2HE95fQ0Y/2VHe/ZomLbRjEg==
X-Google-Smtp-Source: AGHT+IH4ipoxHkKQNJEd0DPLD6yKVnjy+SJgqD2yxB7AlMPeI7nOM+GXKDnx8Avc8zhm56zqNkkWWg==
X-Received: by 2002:a05:6512:3a94:b0:50e:7dd5:e5f0 with SMTP id q20-20020a0565123a9400b0050e7dd5e5f0mr6168847lfu.12.1705523940588;
        Wed, 17 Jan 2024 12:39:00 -0800 (PST)
Received: from [172.30.204.151] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id r26-20020ac252ba000000b0050e87c5b837sm363612lfm.263.2024.01.17.12.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 12:39:00 -0800 (PST)
Message-ID: <2cbdbe92-ce36-4147-a64f-7f86ee3761bc@linaro.org>
Date: Wed, 17 Jan 2024 21:38:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 7/7] arm64: dts: qcom: x1e80100: Enable LLCC/DDR dvfs
Content-Language: en-US
To: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
 cristian.marussi@arm.com, andersson@kernel.org, jassisinghbrar@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, quic_rgottimu@quicinc.com,
 quic_kshivnan@quicinc.com, conor+dt@kernel.org
References: <20240117173458.2312669-1-quic_sibis@quicinc.com>
 <20240117173458.2312669-8-quic_sibis@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240117173458.2312669-8-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/17/24 18:34, Sibi Sankar wrote:
> Enable LLCC/DDR dvfs through the Qualcomm's SCMI vendor protocol.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 48 ++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 6856a206f7fc..3dc6f32fbb4c 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -329,6 +329,54 @@ scmi_dvfs: protocol@13 {
>   				reg = <0x13>;
>   				#clock-cells = <1>;
>   			};
> +
> +			scmi_vendor: protocol@80 {
> +				reg = <0x80>;
> +
> +				memlat {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					memory@0 {
> +						reg = <0x0>; /* Memory Type DDR */

I'm not sure reg is the best property to (ab)use..

You could very well define a new one, like qcom,memory type,
then the subnodes could look like:

memory-0 {
	qcom,memory-type = <QCOM_MEM_TYPE_DDR>;
	[...]
};

> +						freq-table-khz = <200000 4224000>;
> +
> +						monitor-0 {
> +							qcom,cpulist = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7 &CPU8 &CPU9 &CPU10 &CPU11>;

I fail to see the usefulness in checking which CPUs make use of
the same DRAM or LLC pool. If that's something that may not be
obvious in future designs like on dual-socket x86 servers,
I think it can be deferred until then and for now, AFAIU you
can just unconditionally assume all CPUs count.

> +							qcom,cpufreq-memfreq-tbl = < 999000 547000 >,
> +										   < 1440000 768000 >,
> +										   < 1671000 1555000 >,
> +										   < 2189000 2092000 >,
> +										   < 2156000 3187000 >,
> +										   < 3860000 4224000 >;

I.. can't seem to think of a future where this doesn't explode.

When you release a different bin/SKU/fuse config of this SoC where
the CPU frequencies are different, this will likely also need to be
updated. We don't want that manual cruft in the devicetree.

Since both previously cpufreq-hw and now cpufreq-scmi generally
operate on levels that map to some frequencies in the firmware,
could it be bound to that instead?

Konrad

