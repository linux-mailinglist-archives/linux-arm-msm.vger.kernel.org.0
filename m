Return-Path: <linux-arm-msm+bounces-169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6A77E52FB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 11:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EE3D1C2099A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 10:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015AF1094A;
	Wed,  8 Nov 2023 10:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rujnSOcB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7702107BD
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Nov 2023 10:03:17 +0000 (UTC)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3336C1BB
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Nov 2023 02:03:17 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5a87ac9d245so80625827b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Nov 2023 02:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699437796; x=1700042596; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+hHQVK2U6/kZAUYO7M6ukUkQi1h7K41srJttLODmFqQ=;
        b=rujnSOcBArl0FiVttRREX0ihVoTFt25sawGwTJlPWseCWecqyHoc07q5ApSSzTveaf
         e/Qo/hBRYGnPz512k0jCPOxPU7DPdSMGydXC7VNPjPqA+NaJ3Z0u/IfSxhLPdos1EInG
         LJLGqsiV0ot+LYcA31EuQvvy0bFn9ASjxfdOqbNIIteIrSLmIQh5z2NmhS1pozq7eNxQ
         RWLeeMHWSQKiQjS3qbiysTQOh5aN7MB5ccnIaFJ5cDvNUEfjvZwVSWpeLIdYJpjW5o6d
         kqqJCxrkmg4wSTZSk+glx+Rj+NMLPKk35L6R2nDA7yyXTUbSngke8Sdlm+lXoBp77Wni
         4vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699437796; x=1700042596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+hHQVK2U6/kZAUYO7M6ukUkQi1h7K41srJttLODmFqQ=;
        b=ftfgH3qwx3xvPkyQpUv+r8AXgyN1A5rvdfAap0j8E3nR/KbZgtCVDqfN34dg/ZNxl8
         I6/VgEsd/URG1B9VqNeSBC8OhtY2MJ2wEuAKtaWHRhwYxikmgyWCOb2SUaW/yCXjJ8eg
         6H+5B2sCXa5YoZ8Zum3XG41KpwRrTo5vcmCCObfKI85drqsRx2e7+tCyUbYPTzLtrOIl
         TbYGdMMU2PIqBvL+uvbPROrtRjRGsjBHSat3QjYUWDKzzZd9lY3Yymew3ZhDBhBCB5Cy
         msXAzdCTyNtxaUt529OBDSiAbfBBzZDzLkxwHVtRsVCNPdps65CyMAAgOBez+dMlvUon
         TXyA==
X-Gm-Message-State: AOJu0Yw/u6ImvUa5aTSfxpRkj6eZi+eBUcXeSV4X/SKNbRSIWidtdBtW
	vUodcRrIb66bwNx840YY4HyhIQ==
X-Google-Smtp-Source: AGHT+IFic12v75dCBwbm4Rz+UAC0cBlweltnHJyTInK6P+k7Nbnogudom9am8MvSpwal/ROHctaSsA==
X-Received: by 2002:a81:a549:0:b0:59f:5361:d18c with SMTP id v9-20020a81a549000000b0059f5361d18cmr1415761ywg.41.1699437796322;
        Wed, 08 Nov 2023 02:03:16 -0800 (PST)
Received: from [172.30.205.23] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id o16-20020a056214109000b006717ddb4d47sm888826qvr.28.2023.11.08.02.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 02:03:16 -0800 (PST)
Message-ID: <bd268e9f-2e41-443f-ba29-163a552b5b09@linaro.org>
Date: Wed, 8 Nov 2023 11:03:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm850-lenovo-yoga: Add
 wakeup-sources
To: steev@kali.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231107-wakeup-source-v2-1-bf1562ef9367@kali.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231107-wakeup-source-v2-1-bf1562ef9367@kali.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/8/23 06:17, Steev Klimaszewski via B4 Relay wrote:
> From: Steev Klimaszewski <steev@kali.org>
> 
> The keyboard and touchpad can be used to wake the machine
> up from sleep, so mark them as such in the dts file.
> 
> Signed-off-by: Steev Klimaszewski <steev@kali.org>
> ---
> It would be nice to wake up the Lenovo Yoga C630 from suspend by hitting
> the keyboard or touchpad, so this patch enables that
> ability.
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

