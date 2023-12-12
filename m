Return-Path: <linux-arm-msm+bounces-4432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FBD80F214
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 17:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E6311F21661
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 16:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97D45D494;
	Tue, 12 Dec 2023 16:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="glwcASmX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0687B4
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 08:13:36 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c9fdf53abcso56772311fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 08:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702397615; x=1703002415; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EieXF+G/Fj2+HMWIrp65YeNhRWmBnutanD5ialKbuFM=;
        b=glwcASmXoojWLO7P9pcbgQ8PaFeGkvCLQXTf5etZyP4oZVNMG4RZT2vqzbsc+5uMvE
         4PV1Ztg+CBLOCb7yAR+HOth6DwgO6NsG77sDuhTEngn10Dc7tAhuKnYTgBrKLivVv7j1
         NaL8BVXTyE6QhF6AoN1RDRhQ6W1LHPiRB7ZCL3rpmrXdZ/f8obFmwcK0hL5GKF5VRExf
         8grLScV1Rjy2u89YQ9GVd27WqUAv5JBKIxP0Pcu9dYd0TlUGBAA7fL3snagdjO/zWC+o
         9yThIpcW5Mm9ai4qbFQz+M0yLL59tfg5MtMJMminVMbrDKU0bcmecXQjE/Jmld0OZhtS
         r3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702397615; x=1703002415;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EieXF+G/Fj2+HMWIrp65YeNhRWmBnutanD5ialKbuFM=;
        b=anOfftDr0FiMfXuXze56sWoTmYoMTPILMcURquOMC3NyiyAC/mvy6VCC6EnZYnwHjM
         sR975StvPJfO7Zn8eLGuKSlljWGtoriKiiq4KvO5xNfG8lpTp153MM0vEaKpYPBKVDof
         12QkQ+0Z1VrrXQoq9nsTelKVdvjU70CU+GbOgIzta8N3PZM0Hi2N1dT7mRmzyVw9LLjD
         kgC0z+74l62gCjKiqc4v09oTz9CdnM0XRT64vm0CkVczZYpxJQ6gp0ntB3/Nw3D9rwud
         xgzUMRFKefycEUcdtPcUg5i8wH4m2jFwXEIYVTW8AsyAH6gkj1KZ7p7WKyNSheBSIT1+
         3ODg==
X-Gm-Message-State: AOJu0YxAs6LM47WdERIzAwTo9W2UTF7BRXWFfuAkO/CR3/AGxG9pB+LC
	d5TtsVTDf6bqBTuEQ3uoOKqxCw==
X-Google-Smtp-Source: AGHT+IEYA+Az4d9iUrd7j3wZih1isE7ATbKUF2CUBdcqcG9KL43Qwz32Rnbk2xRr12rDB28KqLPacA==
X-Received: by 2002:a2e:bc05:0:b0:2cb:280a:ad3c with SMTP id b5-20020a2ebc05000000b002cb280aad3cmr4713277ljf.13.1702397615111;
        Tue, 12 Dec 2023 08:13:35 -0800 (PST)
Received: from [172.30.205.64] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y26-20020a2e545a000000b002c9f2a716e2sm1676866ljd.54.2023.12.12.08.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 08:13:34 -0800 (PST)
Message-ID: <4542652d-f69a-474d-9c77-aa502da4d54c@linaro.org>
Date: Tue, 12 Dec 2023 17:13:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100: add LPASS LPI pin
 controller
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Abel Vesa <abel.vesa@linaro.org>
References: <20231212125632.54021-1-krzysztof.kozlowski@linaro.org>
 <20231212125632.54021-3-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231212125632.54021-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/12/23 13:56, Krzysztof Kozlowski wrote:
> Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
> controller device node as part of audio subsystem in Qualcomm X1E80100
> SoC.
> 
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

