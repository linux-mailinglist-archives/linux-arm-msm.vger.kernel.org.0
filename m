Return-Path: <linux-arm-msm+bounces-14361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A28387E60D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 10:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AA151C20C44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 09:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD5F2C693;
	Mon, 18 Mar 2024 09:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MiaLcLVf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184AF2C1BA
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 09:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710754812; cv=none; b=k0xNj2kGkNTgmlMzpHfGrGO4M5hlT7Ykl5htyabgcEb+2s14XX9wcDE9JySHNUAEkb4a4aP/AbIpKjwPpTlOzQfOhNGGk3qvriYVsA+lCKtLCwXDfIMMA1Zdz8gmkbdO6P+rplF34EbQpPd7EBYFVA9euBjfn4bbx0LRNWKQQRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710754812; c=relaxed/simple;
	bh=+nTuf6loIWe5gL+9EwbER9eFj0ZkcLrpngj3c6sLprg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rt4hx09Hml1c5CrK5r/pIjH8smJxSjg7p6J1RErtoB9Lu1ipLwCYNt771rKZEpRI0HmNYCKX6tmQ1FOpKF+DzhioBmozLmnS9xEDUYNCW78+ajMjPuxCd99IfaZiglTT72i5XkzKmTBnfyKx3INZyNN+QdLMJROlSQWnuvUbIe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MiaLcLVf; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-513edc88d3cso432862e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 02:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710754807; x=1711359607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LqU6kOAU8rpeqlL+Vm6Vf2O79xdvQvsZszAfDGgY1mg=;
        b=MiaLcLVfDcd/1DWlVew3srVBFFZX2gAWkf2Zyl1OkswCmCVpD7dJlxnZevnkuw5oBA
         46k8L7CKpjIez4i9LEXed5nIV0S2CUX7+knfDhxLLeK+xZ7vf8Ib0t8tV792QxDxlXNg
         GvMF5PLIQVeJcxrN2v9Y2LNAweoPi320s6KeJ6JVuDHhg4geaLu0CyFSqzonSgzUu6aW
         VBXqxzHEizXWXc8eKNpaTlfuybniowsnNu3a0Vylb5hKOxiBeXhsHaXCsffzuQU28fNL
         F+uycPUElVADVTm8yn3O9RJEK6xwZC+jiWmSma2NGGDJrF8SIhb3BdxtBzHypbLkBRjQ
         w8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710754807; x=1711359607;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqU6kOAU8rpeqlL+Vm6Vf2O79xdvQvsZszAfDGgY1mg=;
        b=OT5OiatLfQuZUZT8O2ptjeeGBEhYB+1RDPEm/Jq/yI2hERklwIV51W/iVn6IJ0q8VT
         0xDBZNSxu7qhpp8r+oQ9kdDpg4pdVm1awusJyyV0UzSMIzDQB3dZQ81gHjFtA1/35Syz
         YIotw7MbdacR57BtPWuxJxqLj2upLxPMFHkKq4EsJGEgkR3xQP/5S9KHxhw58GE34k8B
         Ud/Ng/LWs509FoJXbRKyvD1S9lbiRiZMnYlbELDXoMUVrOMJveRMBME8r3blX4i5agUm
         2YQkhh0K8LAAXK6L/8p6pSB1saQx6Jh7CLcH5sDX4TclHLNqcozuk/ERUQaKOxrMWmvq
         o/8w==
X-Gm-Message-State: AOJu0Yw+hqOY8ov38K7+9C4tnIhppZRR403PLBCn9YOWLXkfB+KtKl3Y
	/foWy9qYf8Pplr79ryinocioKzaL11AZvXJ1rtOVWFl7GsH3plzj4pyqY0vnHbk=
X-Google-Smtp-Source: AGHT+IFKR1OSClPjI0WaNCRV9G/nPbNvHy9E4vtWCGHbi8o45TYlAayXdAfA56lZQhMn0HWoHSbOjg==
X-Received: by 2002:ac2:4acd:0:b0:513:cf5a:f872 with SMTP id m13-20020ac24acd000000b00513cf5af872mr7197314lfp.69.1710754807180;
        Mon, 18 Mar 2024 02:40:07 -0700 (PDT)
Received: from [192.168.52.106] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id q11-20020ac2514b000000b00513e3190eeesm642816lfd.171.2024.03.18.02.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 02:40:06 -0700 (PDT)
Message-ID: <5e5a7792-d7a6-4a60-8431-175fa23b1d6d@linaro.org>
Date: Mon, 18 Mar 2024 10:40:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: qcom: msm8974: Add @0 to memory node name
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240318-msm8974-misc2-v1-0-f71668a2b8cd@z3ntu.xyz>
 <20240318-msm8974-misc2-v1-1-f71668a2b8cd@z3ntu.xyz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240318-msm8974-misc2-v1-1-f71668a2b8cd@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2024 10:24, Luca Weiss wrote:
> Add the @0 from reg to the node name, so that both dtc warning and dt
> validation failure get resolved.
> 
>   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:106.9-109.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
> 
>   [..]/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
>           from schema $id: http://devicetree.org/schemas/root-node.yaml#
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Looks like it's indeed the start of RAM

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

