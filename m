Return-Path: <linux-arm-msm+bounces-7549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E64D683186A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 12:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B503B28467F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 11:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB026241E6;
	Thu, 18 Jan 2024 11:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lf0+hQwt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60022241E2
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 11:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705577018; cv=none; b=ZRnxfgKuKKXx/28DMXlm1/slrYaD82LKe7A2B5ZDE8YsejudGnWv3FINNCEIq2FMvBbMJ7whEwxURe5ycIJkpJrHXqJfn4nN9xEHene1fEv9ZQiMCt+p1EjIhapr6gh9Vf4KSPPseif/OVE9UMQxKO/ykGIvjVCMa+66dOC8z2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705577018; c=relaxed/simple;
	bh=sR2iSJeRcu2stQpQNEvV8Hhw4k7cZ1XXVkDU5fZJMoU=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=ZMB3BUxoaht7nWz8pYkF9NJemNuaUeET7WIZagUn8kxrIA+gjeidnpK8SYpn/tqHOW3oThYlyTnZXPJigHHHvNU7LCWbmRu8dOJGEIek/kpMDjFVpTU1Ww9TcAkwnotdx+h/Eus8iZkMiGemSzZtuglIdEJl//HuTeKLtutzE4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lf0+hQwt; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50eabfac2b7so14526808e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 03:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705577014; x=1706181814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3n0yh0WMwXQXlpz0Q7yPANFTmNYevmws+HDSuGAve8U=;
        b=lf0+hQwtsQwpBde1tHenyRHvh/K+CNpzqVbPtlG3EUhPJ92oNrM0qvziI7LoSC+zpB
         NLZhQkTWD1di+lhN8QsWS39ajW2DIe3qVfDcIbI5seUzL05PMuzCOz+oqbtX4TmiuXPj
         n8Klpq1l9y9Ng5aoho41eRAcydSkxE48lWncu1OlWqvlhKCdM8hK9YGoHN6ukPNx69e/
         /j7pai4nP/6JC8sVS7utHu0LTCy1Tx88Tn4DCT1j1ceAd7U94QcWHOLp7eTNyUyevG8X
         iGh3MgwHhBsZAItiWa6tNEfEiMPNzjwo/pCwm8cx1YbnZsFQoLaOsFfEaab/k7lo7xxK
         JaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705577014; x=1706181814;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3n0yh0WMwXQXlpz0Q7yPANFTmNYevmws+HDSuGAve8U=;
        b=lQPc6Dcf15EeEy18U/94H+nHL5hyIRThF6mYlxXbXVv4kPq77CiAY1IzUFFfWrhpfy
         3reeiKkMDCpYy5N/M5kKiePAz8i+7Ya1VpcUYtFlWaTLknHntfMXf7s6DcIw50EHd/+N
         F1I8JFidmEtK/ov5lzgUemCknlQMeZthLDWswBnOh48LSugFuoiEVDoJ/cwXzACaPj68
         wTVMl4I2HX0QQwswbroiTkatuWMYroKttEWwtTQWUciQeM9X50zMf967gFITsy2FA6AN
         rr2ukOyyXWFSs4qkN97Y1hPhxgbyzB6FqqVpsgc+/ovWSKZBQqX2x3cz11G97WokF80y
         4yXw==
X-Gm-Message-State: AOJu0YwNVKGEZjcwh19QMF9I9gg0xx7lEda+Oi8Ecj7Mj2WrzvtDoqCi
	C39NPIwDNQiRKdJy+Ax18qIlz6ZZjRO8gJVm4DzPCSnMcnZMUF7eHHsUJt6JIsI=
X-Google-Smtp-Source: AGHT+IGAFiY9QYKMMRj1hiX+XJpEl6/UwZGOnkZSILFJapmWR+gs3x0i53U1tDVN6vcmRNKXSbKqAA==
X-Received: by 2002:ac2:58f3:0:b0:50e:cc3e:2f30 with SMTP id v19-20020ac258f3000000b0050ecc3e2f30mr359528lfo.109.1705577014400;
        Thu, 18 Jan 2024 03:23:34 -0800 (PST)
Received: from [172.30.204.173] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k26-20020ac2457a000000b0050f147c0244sm125917lfm.292.2024.01.18.03.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 03:23:34 -0800 (PST)
Message-ID: <1d707a9c-82ee-45db-b04d-76bd0afe668a@linaro.org>
Date: Thu, 18 Jan 2024 12:23:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] phy: qcom: qmp-usbc: handle CLAMP register in a
 correct way
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20240117-usbc-phy-vls-clamp-v2-0-a950c223f10f@linaro.org>
 <20240117-usbc-phy-vls-clamp-v2-3-a950c223f10f@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240117-usbc-phy-vls-clamp-v2-3-a950c223f10f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/17/24 15:04, Dmitry Baryshkov wrote:
> The QMP USB PHYs on msm8998, qcm2290 and some other platforms don't have
> the PCS_MISC_CLAMP_ENABLE register. Instead they need to toggle the
> register in the TCSR space. Make the new phy-qcom-qmp-usbc driver
> correctly handle the clamp register.
> 
> Fixes: a51969fafc82 ("phy: qcom-qmp: Add QMP V3 USB3 PHY support for msm8998")
> Fixes: 8abe5e778b2c ("phy: qcom-qmp: Add QCM2290 USB3 PHY support")
> Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

> +
> +	/*  for backwards compatibility ignore if there is no property */

:(

Nonetheless,

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

