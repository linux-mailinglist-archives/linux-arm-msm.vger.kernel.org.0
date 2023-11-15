Return-Path: <linux-arm-msm+bounces-729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCCB7EC8F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 17:51:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 289E8281306
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 16:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D542F531;
	Wed, 15 Nov 2023 16:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gPkbMXjP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D012104
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 16:51:18 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ADC1181
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 08:51:17 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c5039d4e88so97675091fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 08:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700067076; x=1700671876; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E1i4q+KeQwsIi0Qm6oURv67PVM/qypPfRLYO5kbNQm4=;
        b=gPkbMXjPTUTqH23ETdUmkfCOrhTb16/l3EuJuPTyNqwiUoaewGfjxyI5miEjfXHcQI
         +lhSsGUkR81ah4OEtFtrL6qOLO0erPQsJm3sOvA2qY+nmfzcWYLrm54H4ktpOAdBwpL/
         blfz36M6dpZgVYMS++HU3z8ppAugAevyiYAVPhUfHq6jmCkE1Qg+8L8sWYZG7QbLUnVA
         Xrns6gBQCaKtoAwIvxHoGul6v9rqbjxq5F7e7i3CB9/zL+tedLz/a2JUtK3ODjiLd0RM
         LDj/sbCAGTcFKfc0vyYu3rGQPZEH7p79DnVsgDBsvkSBbTzAc7f6F5uOliTTgKRYzmux
         0DTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700067076; x=1700671876;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E1i4q+KeQwsIi0Qm6oURv67PVM/qypPfRLYO5kbNQm4=;
        b=sEzrrd2bILLHS35mrKagMnKBA5Et/46VZjLbH/BmhU+sTwE7utcyQNY7ME/u/94SdQ
         4/R9t7O5+rWIaIzJPdKNhbTstVGCraOvjfRxRTQlp5/YegB/Msn5xncySPfzf9pWEAGt
         atptC6Ue+M/lkFuQ2VV3w0grJ6hceDeiYsknOuTEKWZw0OVOm2ZdgxK0z3hKM2mDyqz/
         H6mKP1L5Q/cGGBxZrzcaA5n52qannHRjtUM8kCXd2FTWeF2RNuJPAAJQYXD7LyvOE56v
         674lN/pFmJi8zW8JjO24BWtwWyJc4Jo6etoNChWaR3ksQe68fjJg80WszlN1oT3pzL8P
         5oNQ==
X-Gm-Message-State: AOJu0Yyhsfu9XkUQ/epnI5FIMsvbIA53PdPvrdVZC+sUPi0goq+oyBX+
	I4phvLgLKruLOgiqyeqPIw/fzA==
X-Google-Smtp-Source: AGHT+IE4JiixN7a3K++e1hfkKsL/80lUrULgomKmtJuUWg3Kmvjn04eARLlsLi6SfALUNEIRcD7KqA==
X-Received: by 2002:a2e:8758:0:b0:2c7:fa6:7183 with SMTP id q24-20020a2e8758000000b002c70fa67183mr4832341ljj.47.1700067075770;
        Wed, 15 Nov 2023 08:51:15 -0800 (PST)
Received: from [172.30.204.150] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id a13-20020a2ebe8d000000b002c12c2094e4sm1705775ljr.74.2023.11.15.08.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 08:51:15 -0800 (PST)
Message-ID: <a4e60c81-da6a-447f-a986-e23224602ae4@linaro.org>
Date: Wed, 15 Nov 2023 17:51:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ARM: dts: qcom: sdx65: correct clock order in DWC3
 node
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231112080136.12518-1-krzysztof.kozlowski@linaro.org>
 <20231112080136.12518-2-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231112080136.12518-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/12/23 09:01, Krzysztof Kozlowski wrote:
> Align the order of clocks in Qualcomm DWC3 USB controller to match
> bindings.  Linux driver does not care about the order.  This fixes
> dtbs_check warning:
> 
>    qcom-sdx65-mtp.dtb: usb@a6f8800: clock-names:3: 'sleep' was expected
>    qcom-sdx65-mtp.dtb: usb@a6f8800: clock-names:4: 'mock_utmi' was expected
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

