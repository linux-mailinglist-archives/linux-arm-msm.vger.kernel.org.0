Return-Path: <linux-arm-msm+bounces-23043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F204C90D30D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 15:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DABED1C244D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9561552FD;
	Tue, 18 Jun 2024 13:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lrATvGNT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ECF13EFEE
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 13:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717568; cv=none; b=hEvPoEITQmFkZkaXAE4+MzEPPA3NLZ275wylIqVZBNG5MbhJOVNHtxzNi1LFLs6sxM+tIcK67YySEVZQfpzsNYDqm+ETihB5+eTheI1EkjM7l0UieWNyMgkZjobMu4v1Jm3cdgn6KLdkg6oVnEh3zs2TjKGYD9Z17OFoSBIR8Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717568; c=relaxed/simple;
	bh=GgzUktl0D9SwGZEeIDX+GZpiHGkGUQjZHSqKbu5zMQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ey8paGmxD6cGKDfGptHQltChfeVeDfXoNlRERveRzZOMK/g1tShGmqWFWDbyPlBjgpMaFm1mrwAdiUnQVDdusVqDp1FeL5Bg16q3n9kqgIW+/PM8dSYAHL/fU1miMEMpOsThP9W6BiuCTY4iaIlIYRB3DztEvjf5jM5myjc/5fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lrATvGNT; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52cc148159dso1374152e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 06:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718717565; x=1719322365; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ez+ZYdZ4IhLN/85Rh7VlX4Z1ctdZ87K4zP66/HgVbow=;
        b=lrATvGNTfb3AKMeZ6GDh4FIr9HLQ+sQLwBneZ+0q046YuhN0qi7YfCqOvWI/aVKv9u
         H5QkbixvqREmqRZJD7veJv5f6pix9eKiuDoo3syJM9yphx0gNWOs/S418FJwqbksS3G6
         E+zm+mJpuhxv6V8h/rASD6UGoTReaCpPQaIixdatJ1kCplWVPk4jb+9WCYT4eNpl2296
         7fGigkeQE1uXyFocdelDfRIpJxMt3Yxs91qKPGkEb1KXzBevXhQWpalKw0sl7LZqT9Ds
         KCrKFBP4kro+kADUtejSRlX1Bg0eWdznATrAnDsD3GIO8kQ/X0lwOyYHyaTeBrSLnt7b
         2PIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717565; x=1719322365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ez+ZYdZ4IhLN/85Rh7VlX4Z1ctdZ87K4zP66/HgVbow=;
        b=u6L1rsallMEFPJOX7lntG9d25Co2TegQszk7OeA+mfh4TkUUTJW+8EEVOn9kAnaIld
         hfDc4FvKwSvftP6t6eXigE+tEAl8FIBpH/SIZAryrPhuFhrokeA85sJvijPctqNqaAvA
         sgUqbuYkoaClSrlkZJeXy2E5SVc4r9ipltRZSyBYnu8tCQw+vJ/VVkkWICbOiQkdeJQ/
         ap+jzv8hJmwPYjXC/mfbv1geGM7EfN42LrMsvtkeBhE00ZBhqlPYq5Y/uk5EBnfjhcMV
         K4HzmC+uLv7pJHFrK/Bdkbb1ZM5KacAknvDC6PbMfrM3bXmzbWl5aefemCFcOmvkNMom
         rcMw==
X-Gm-Message-State: AOJu0Yze0tuSl7Qjw46jgIaC9thKL8Ur9VI5Fav28hJdSZ7NZ16rWKfY
	BdCZg1Zsqh8ymzTtp+KkbWSVa81e3WTQceNEL2EO0UfJXK6Lq9vXeMn9K7dTQ4w=
X-Google-Smtp-Source: AGHT+IFd8vm/A2hU7dX3aYosPwqK6rV2k2IpMC6TsKDAceEBhHhRIb3K8WkyukwOO/rCj6gYmrYeTA==
X-Received: by 2002:ac2:443c:0:b0:52c:9906:fa33 with SMTP id 2adb3069b0e04-52ca6e92f06mr8544246e87.43.1718717563886;
        Tue, 18 Jun 2024 06:32:43 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282f3b6sm1503387e87.117.2024.06.18.06.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 06:32:43 -0700 (PDT)
Message-ID: <b53d7f5d-c619-4620-8a69-24e71d5d19ba@linaro.org>
Date: Tue, 18 Jun 2024 15:32:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: msm8992-lg-h815: Initial support
 for LG G4 (H815)
To: Alexander Reimelt <alexander.reimelt@posteo.de>, andersson@kernel.org,
 petr.vorel@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240403104415.30636-1-alexander.reimelt@posteo.de>
 <20240530135922.23326-1-alexander.reimelt@posteo.de>
 <20240530135922.23326-3-alexander.reimelt@posteo.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240530135922.23326-3-alexander.reimelt@posteo.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/30/24 15:57, Alexander Reimelt wrote:
> To make it easier for downstream projects and avoid duplication of work.
> Makes the device bootable and enables all buttons, hall sensor, eMMC and SD-Card.
> 
> Signed-off-by: Alexander Reimelt <alexander.reimelt@posteo.de>
> ---

[...]

> +	chosen {};

There's already one in msm8994.dtsi

> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		spin-table@6000000 {
> +			reg = <0 0x6000000 0 0x1000>;

Please pad the non-zero size part to 8 hex digits and use 0x0 instead
of 0 consistently

> +			no-map;
> +		};
> +
> +		ramoops@ff00000 {
> +			compatible = "ramoops";
> +			reg = <0x0 0xff00000 0x0 0x100000>;
> +			console-size = <0x20000>;
> +			pmsg-size = <0x20000>;
> +			record-size = <0x10000>;
> +			ecc-size = <0x10>;
> +		};
> +
> +		cont_splash_mem: fb@3400000 {
> +			compatible = "framebuffer";

Doesn't seem like a documented compatible, you're probably looking for
"simple-framebuffer", see:

Documentation/devicetree/bindings/display/simple-framebuffer.yaml


The rest looks OK!

Konrad

