Return-Path: <linux-arm-msm+bounces-22936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D0D90BB99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 21:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 140681C23BA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 19:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF02D188CD9;
	Mon, 17 Jun 2024 19:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u/wAAKi8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DAD18F2EF
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 19:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718654314; cv=none; b=NbI9R3kV2+K4kC0riE3XtOUQVf81W+2/ZL20xHF+8DWMBQPC1qZpieF1YrDIKIPh7TneQw4wvh0EUAxU+pMLiHMr7MxZi8i5oUETbmc0cWyJ10ZxLVuvlLsEScDjvQL/r9VPgku7SaIA5+os0Wb5e2iH/ypPQKGDaMcIvWsU3os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718654314; c=relaxed/simple;
	bh=bZpxC50zZBluEA/iujXmLqmlU7SsoVluLarJkO9NX2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EOpx+btFIRsbI/lxFm018q+zKnoywRsQYwpNb5MO6l49+TJvmy9xnbIhNiRQ0DHJYs59cY+hwx91NcKt+G3Bdv7EFMIh7sbRClb6ZAN8/ig5k2WAH9Rb7iY9MoAxMQ6EXtRsSPE8a0l4fwjLlBAVFba3BU7shJroVfgryZ4OjdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u/wAAKi8; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52c815e8e9eso4817367e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 12:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718654311; x=1719259111; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dt8gOXtAJsyKtG9aDgL57FXHSeZZBpHcJmuelSwD1xE=;
        b=u/wAAKi8nAnCDLTGVmCri/G7HsBxrBNFdXRKRMq4Pi6x5i18Il4OY27HwgEIHu8IT8
         cOyFvWsMqV3HPTrkPbWVbbsimbl5BLwfrb5U8lLV8+sm3DoULBF9c70Squsa8/YUFEUR
         p3KovDYYtVY/gRwQI/3n8Thstd8JKMqM49hGtU0wY7ByNAhi/G1Zc8aFJvSBwIx4Vabl
         RfwESzYT1MXtO2f7RsmQ69Q3CbBwMUDQmQS9Hfxq7lKWMIpIj1u3Hw8TnhYu1yvJEpab
         qvUhuDFpV5MaeUQrPoYtu29TuuzM/oEJ/KhGZw7xmGtytJJA7JxkzgMQy1AXasGGd6IS
         fEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718654311; x=1719259111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dt8gOXtAJsyKtG9aDgL57FXHSeZZBpHcJmuelSwD1xE=;
        b=MzTjv7qGjzwG5vmHy84Nf9gQXJArizPN1JQyLPB4UDFMy5wt5H+1fgub1a/5E+WEOe
         Kt8Uh2AcDAJ11wh+2bjaSWT1luygKPoGBlmdeZj0kpZf8KktqPGVdJ509Do+mvmff5zd
         LfHB+m7W3tkajYIXeIHQ79dLFTbAQm2HYDkQvpCu4iR2llipZxtMSOn59Xd6iY/7t3KZ
         KeRMnkA9/SphGYrf/IoTfb3VpiTCqgJVe4OeGlc1e92ncC9U/rM7Np/iSkVlooEElI0e
         aVEkVMkkjrHdxJjCY+4OZWXzCVmd/ERt+UnzHd5mM/LCT4LCpa3tVjTbQVv0Zs3YFOv4
         Bofg==
X-Gm-Message-State: AOJu0Yyzy1MTHOkGz7nv5q9UnLaEwMtw3ssMf+ZBbSnJDjA8m+bHYD83
	Uwqbblwz+n9Tgq/wME2n/oC1136ephjVJ4rMTMCpuz/MoWfS8Twv94KGdfget4BO0Nb2/DbXima
	G
X-Google-Smtp-Source: AGHT+IGgD7APk54YXCS3zR67bSlvd9lT2U7OUsokuRECk7zCt1gIA8J1/z9B6AcqGUIbtP5nCBnDGQ==
X-Received: by 2002:a05:6512:536:b0:52b:c2eb:2d with SMTP id 2adb3069b0e04-52cc628b041mr50934e87.39.1718654311052;
        Mon, 17 Jun 2024 12:58:31 -0700 (PDT)
Received: from ?IPV6:2a00:f41:cb2:a9df:5ff5:5bcf:651f:66f5? ([2a00:f41:cb2:a9df:5ff5:5bcf:651f:66f5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2872749sm1323169e87.164.2024.06.17.12.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 12:58:30 -0700 (PDT)
Message-ID: <55685d92-8f5a-4b23-a7a0-7dcdea5baaea@linaro.org>
Date: Mon, 17 Jun 2024 21:58:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: msm8926-motorola-peregrine: Add
 accelerometer, magnetometer, regulator
To: git@apitzsch.eu, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20240616-peregrine-v1-1-85d14ae1a11a@apitzsch.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240616-peregrine-v1-1-85d14ae1a11a@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/16/24 16:15, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Add the accelerometer, magnetometer and regulator that are present on
> the Motorola Moto G 4G (2013) device.
> 
> While at it, update framebuffer supplies and temperature sensor.

That's a bit too much for a "while at it" ;) Please create separate commits

[...]

>   	sensor@48 {
>   		compatible = "ti,tmp108";
>   		reg = <0x48>;
> +		interrupts-extended = <&tlmm 13 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&temp_alert_default>;
> +		pinctrl-names = "default";
> +		#thermal-sensor-cells = <0>;

FWIW the current driver doesn't seem to care about interrupts, perhaps
you could extend it


Konrad

