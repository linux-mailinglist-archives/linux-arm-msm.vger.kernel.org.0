Return-Path: <linux-arm-msm+bounces-14011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF11C87A804
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 14:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E6281F24546
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 13:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AC33F9E8;
	Wed, 13 Mar 2024 13:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fz23TvUh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11D23B798
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 13:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710335093; cv=none; b=UXvrLE3miowRG1MA5MoXX/J6quDOaqJdoYNpmPjid0wIXmcHweLZLrL6j1yis1Uvb1SzqlC0osgJwGzjDmDtpbWFyC/9JrEz2BcW6S9PAfmFpvgDpNqY6ER3YToNtwpgtwhDp/RGWUtkkvnpKP1wH7IfFQCbXGfOfYHcXZ1ggqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710335093; c=relaxed/simple;
	bh=cPb6aWHRDkLi3pF34FYMNCWWbW/mtHb5wfMHj72JXjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XzYwjyVQ9bmuUq2P9LmLJkLBpuDxkVc8MDJ2NZboxq9CiD//Nn0imH0i5b3suwV+voGLHRKwgUKYlTJLHwiJ8Wuau5M1ZVP6m5L2tJAhOItnp7GbF+LFQwZRWFdHWuwYbV3YFjArNo+iV6uZt6jxWwrstBbwGO67MNhdiboto20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fz23TvUh; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-513173e8191so7160219e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 06:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710335090; x=1710939890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9FU5agIWz15a0TJSBH1eaNDyAuqkkAX4jU+14eaehE4=;
        b=fz23TvUhZ9/TSufQMJDsdsuHA9OnoiyHnNlrjKsofaEcwstkn7oMe/v+y1VeVd46gn
         irxeekTJRzoRJB05UjSpCV4E97YsKiAo64mRgHdBjwvrrtKRFIEfi/UvGZp/v4eCiR9p
         /Yb1afGkBzuqp3LUmBrmyqB92E2wsfvehvSVueqHurmLv4BZC+X2Ask6okPiO8bhK1mL
         8neLye0+1LtKUXMc7/A+pncV9Hi5jCbr9jQxlMUj9GBu7xT+E6jH7zhnRHDBO17FRUXZ
         ptMi+dIcnf4Cy3D9KZDdpZHajCWWNLiL88FelmXZAk/+YFbjj3HZJVxuSzqfn4wfbFpI
         olUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710335090; x=1710939890;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9FU5agIWz15a0TJSBH1eaNDyAuqkkAX4jU+14eaehE4=;
        b=MIufLrCAMRfGjNMYK2kRD/RSXX6OCuSBQB4p4kuMz/lwwX4//C1RGmnB3nJsH49GI4
         aKysbGcON0tdiNDcdzY4lOjirzGyQXr7LzrgH2vi+ity8QJ5tEhoX0QWF9qZs/gPAigh
         o+o1OYFVMsB28ya2khnns330KltQUq08sOOw04W1w0zyilv4z1ryTe5xKGReB3HGPZZV
         6C1kewpKBgv4uQBo01eAr8a6M68TH9EuCx2hA3gv43SHUxD83lJ4lL3tio3cEonB+oMA
         sf6NIGLyAWsEsIMZ6s4RanFtrH5KcgCGEEKKPgcel07/k0ZlEEv/mpmsqi2BJRKhrvfO
         2HjA==
X-Forwarded-Encrypted: i=1; AJvYcCVZz4HPe8J95Gm6thQmjrchLq8Rn5YVcSv/S+2yuR9LcellUGXLBPYIJ8PaT2ldAOGTqF6EplsAqglmG1APGCX13vlsvWUAFU9XkfFqkA==
X-Gm-Message-State: AOJu0Yx3/jHA2Dv4uEi1WU+/v6U5CSXAFT8GQGQwZMFPbpPniA9n/cCD
	0Qj1LLH1TDiUJVf0N7+5hUyq8a8dswOuciBtpfqjqjmeRt4Ii6fA6HPF6Q490wA=
X-Google-Smtp-Source: AGHT+IH37biRIx/8f46c1IJ8Q/uHnOIjI+D5S5pSlQ/LWCm0zMtHMjyeRe0IWzG5vO056lEWEfk0jQ==
X-Received: by 2002:a05:6512:a92:b0:513:444c:8a7e with SMTP id m18-20020a0565120a9200b00513444c8a7emr2679593lfu.56.1710335089816;
        Wed, 13 Mar 2024 06:04:49 -0700 (PDT)
Received: from [172.30.204.6] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k9-20020ac24f09000000b00513af268d04sm831415lfr.154.2024.03.13.06.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 06:04:49 -0700 (PDT)
Message-ID: <c0e10cbf-c6f3-4b0c-8616-983da2a40236@linaro.org>
Date: Wed, 13 Mar 2024 14:04:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: apq8016: Add Schneider HMIBSC
 board DTS
Content-Language: en-US
To: Sumit Garg <sumit.garg@linaro.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: andersson@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, stephan@gerhold.net,
 caleb.connolly@linaro.org, neil.armstrong@linaro.org,
 laetitia.mariottini@se.com, pascal.eberhard@se.com, abdou.saker@se.com,
 jimmy.lalande@se.com, benjamin.missey@non.se.com,
 daniel.thompson@linaro.org, linux-kernel@vger.kernel.org,
 Jagdish Gediya <jagdish.gediya@linaro.org>
References: <20240313123017.362570-1-sumit.garg@linaro.org>
 <20240313123017.362570-4-sumit.garg@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240313123017.362570-4-sumit.garg@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/13/24 13:30, Sumit Garg wrote:
> Add Schneider Electric HMIBSC board DTS. The HMIBSC board is an IIoT Edge
> Box Core board based on the Qualcomm APQ8016E SoC.
> 
> Support for Schneider Electric HMIBSC. Features:
> - Qualcomm Snapdragon 410C SoC - APQ8016 (4xCortex A53, Adreno 306)
> - 1GiB RAM
> - 8GiB eMMC, SD slot
> - WiFi and Bluetooth
> - 2x Host, 1x Device USB port
> - HDMI
> - Discrete TPM2 chip over SPI
> - USB ethernet adaptors (soldered)
> 
> Co-developed-by: Jagdish Gediya <jagdish.gediya@linaro.org>
> Signed-off-by: Jagdish Gediya <jagdish.gediya@linaro.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---

[...]

> +	memory@80000000 {
> +		reg = <0 0x80000000 0 0x40000000>;
> +	};

I'm not sure the entirety of DRAM is accessible..

This override should be unnecessary, as bootloaders generally update
the size field anyway.

> +
> +	reserved-memory {
> +		ramoops@bff00000 {
> +			compatible = "ramoops";
> +			reg = <0x0 0xbff00000 0x0 0x100000>;
> +
> +			record-size = <0x20000>;
> +			console-size = <0x20000>;
> +			ftrace-size = <0x20000>;

No ecc?

> +		};
> +	};
> +
> +	usb2513 {

Please use a generic node name, like usb-hub and keep the nodes
sorted.

> +		compatible = "smsc,usb3503";
> +		reset-gpios = <&pm8916_gpios 1 GPIO_ACTIVE_LOW>;
> +		initial-mode = <1>;
> +	};
> +
> +	usb_id: usb-id {
> +		compatible = "linux,extcon-usb-gpio";
> +		id-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb_id_default>;

property-n
property-names

[...]

> +		led@5 {
> +			reg = <5>;
> +			label = "apq8016-hmibsc:green:wlan";

These names look overly complicated.. s/apq8016-hmibsc://g?


> +
> +&blsp_i2c3 {
> +	status = "okay";
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c32";
> +		reg = <0x50>;
> +	};
> +};
> +
> +&blsp_i2c4 {
> +	status = "okay";
> +
> +	adv_bridge: bridge@39 {
> +		status = "okay";

???

> +
> +		compatible = "adi,adv7533";
> +		reg = <0x39>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <31 IRQ_TYPE_EDGE_FALLING>;

interrupts-extended

Konrad

