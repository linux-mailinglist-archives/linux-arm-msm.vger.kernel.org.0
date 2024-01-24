Return-Path: <linux-arm-msm+bounces-8124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6543683A9CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 13:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F9A1286070
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 12:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B7E77633;
	Wed, 24 Jan 2024 12:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QiJkpf6h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E77B76910
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 12:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706099568; cv=none; b=YzR6OQUm/QQa+aput2IBR99VZ8z3zrOe5/ginNzmrDOnCzbHcZnS4lbzfuYEgIZauLLxIB6tRC87oIZqxt2hY58/5/vrB0LS6cgX4CxSNDxilf649iI5UeCFIMlJUj9Xbw/yL9yUJEnoHPFVzH6VOH1MiIpJ+JClUhjgV2UDIrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706099568; c=relaxed/simple;
	bh=gW4Q5dgcJo/w+lcQ9ZV1dV+kkIgRmsKKEjic8VggVWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PdQ7R8YaYhi3bXBCeGvp1ZCxJUn4tJkRQiMReOeLO8V9JdizTxpn+k3wbdFsQ2UfqTbCdfxLra6lX8jYN/JkWVKTX5Yh7tqz8FcVcCq/TB9Jf0aCaq8ITa8Bp9JcTZVifb/utH/8wx3LuyEXBH2mgrF4fz4eiK1yFybzc5xj2dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QiJkpf6h; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50eabd1c701so6137328e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 04:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706099564; x=1706704364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AqPAahlzSVSD7Radk/ZPw7KMkRpgnqXYTwyUoIGu6qs=;
        b=QiJkpf6hKlWSGHEc8sNBx6i9B7QRKGtjJXdkKpSF1M/Pmk3csbtRUk13KIqK+sQmCV
         j2pHvwyeK1QSnXa8p962V3b6133eN35oftBUJ5QSBh1vJJGYlVSi8cdor0WdULfObRjD
         ccHG8fx4nlnz6wi8/ssLIFy5QpxpgA80ZFpsQT5hRHeW1KLaw5kvZO/TZx7jphXHT935
         VWb/bTsF6G/RAvvVxciq3+DXkrQxUbdrIb4SrJ7Q4TTSujbGO/99rNJXGEUODmAcSgQQ
         T3urwoxsDJR/5TAJYhMZxyFHoDQiOnip5Cfo968KnGN1nwlO0g1r0TMxX3L8V5C0u5cD
         jtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706099564; x=1706704364;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AqPAahlzSVSD7Radk/ZPw7KMkRpgnqXYTwyUoIGu6qs=;
        b=d/21dW3f2NwKGFEkYX+700zXT3Myw0p5GDYFDWl95m00HYTJ/y55ZaGhdoCNHPwl3A
         GChtUSO6EJXa/piMqJfFh90H3VTBnjn/oM/EX4av8ZgYt0t7IRtImmn9y9fr9Vk8+dgL
         UA5vGV5GbIx/S+UjNjfp7TUxZojSuw6g9Foxm13fOr+0BN461EsUlZf0Q31PDTs4GprH
         EEwp39i/XMWN0VjgPP55Ui9Km0YNUd/21eD2i2Ntr8jQ0ll3+yrIc/DQU8Jj+K6Wrw3H
         +L4Vx1dMcoLzGFHv/ayxzpb5/mF8z2f7Kkr0VlOd4z/+IqEstowu3qW4gZiX6DDeXSoK
         exMQ==
X-Gm-Message-State: AOJu0YzbHx4QgBTBYcU8Jn9v/tVOREsD+Pp/oGemA2Lu6ChuUCDt7c5F
	CYV0Z6QmiZf7dweJM7AXrR6YkTI6NKKvz4J1WbB3qLC21/K7ev6+EJvhuJzOi6o=
X-Google-Smtp-Source: AGHT+IFrTFWo9bWEH+c+SGSHh0D6uNxjEvNOgfsn42ra3rVSTjZMGwHmL9WzsduGBjgSsmB+M8qQBw==
X-Received: by 2002:a05:6512:110d:b0:50e:504e:6c34 with SMTP id l13-20020a056512110d00b0050e504e6c34mr4557809lfg.3.1706099564366;
        Wed, 24 Jan 2024 04:32:44 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id p26-20020a19f01a000000b005100ed58b76sm207756lfc.308.2024.01.24.04.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 04:32:44 -0800 (PST)
Message-ID: <bbd011b2-a17e-4310-8b9b-aa58defbe6e6@linaro.org>
Date: Wed, 24 Jan 2024 13:32:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8953: add reset for display
 subsystem
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>
References: <20240123-msm8953-mdss-reset-v1-0-bb8c6d3ce897@z3ntu.xyz>
 <20240123-msm8953-mdss-reset-v1-3-bb8c6d3ce897@z3ntu.xyz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240123-msm8953-mdss-reset-v1-3-bb8c6d3ce897@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/23/24 22:03, Luca Weiss wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> With this reset we can avoid situations like IRQ storms from DSI host
> before it even started probing (because boot-loader left DSI IRQs on).
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

