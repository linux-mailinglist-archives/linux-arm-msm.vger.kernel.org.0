Return-Path: <linux-arm-msm+bounces-1575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE00E7F50DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 20:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE2411C20445
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 19:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9DC5E0C5;
	Wed, 22 Nov 2023 19:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GXL6uAcW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 539AA12A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 11:41:51 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-507a98517f3so117864e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 11:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700682109; x=1701286909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xIV3JPWp9LtCID8UlZm8kAzAEy5+PM3LIH4NQyYQfiI=;
        b=GXL6uAcWjwj38/nPdYssXNQVhT5FPzGFtQYgn9k1+csK9TEYnWSb/et+YlMEDYuJyl
         W9xZMuWsH/VNR10bwV4tPtefbScsEtXSSakeQdKhOynOBhNKvwinZLOxg4bA28kEIk/K
         q/CtRfK/gFxFhjyC7tl75hI0ho+Kj3R4ywSve7bHLF+OIMbnOAgBINJiE4HX4RAnedzO
         bWBQAjQ2HLMIMT6XADSo0liVJLroVF2ksY4H/YsPoY02TEMJzhzKmpbhLHxXkqewSHf+
         QDrhMFuY800Ab+tc3Z89KaQPYw9DP5tjiOrZcBvLWyL58BSY4Y7UrbtkoPgmc/FYz5A/
         ed8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700682109; x=1701286909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xIV3JPWp9LtCID8UlZm8kAzAEy5+PM3LIH4NQyYQfiI=;
        b=MrpmuYLWBXlvhCz8CErZKDrk/h0OGCPQm8bT5fakeN+n1jttevGLbStX/LomDpzL/x
         rCLJKCgAteXDNh1fLfaLcIeLFRuvKaha37pZbFoEc+95gYtBGovtQ6fOPhwwdP5Q2GLr
         I01njvDeSRbHJpv5BZEEr3RTUJbdPgPKfk92IE8TGm0aaCXfIgzlzSkeD6D1t1ZalsIT
         QIhkkVMoJV4W2FW4UHrgvtTq85EThZjNq3rGlbLy437qp186Nf/dzg2xoK7uAS/kQmS+
         jc+MZbBcmtSvMo5S92y/JTTRfE9kGmZf/qX0QcPCX8lhEXXy5kIEt7mBk83vBGgMhdWV
         lADA==
X-Gm-Message-State: AOJu0YxK/mtfyb2onxCx0jVx0lPK/ugfNsXuNgAmHNl4npVHWSDx7AeW
	fRN0a/s0cR93lGZfQSuCM2fkcg==
X-Google-Smtp-Source: AGHT+IEwT5V0ItU0AkSUZ7Zesjege/w1DM0cQu0GPXPXvXQonpCQEcCEv2CBBINZXD2uuRXp+mGLDQ==
X-Received: by 2002:a05:6512:3b12:b0:509:8e9e:a416 with SMTP id f18-20020a0565123b1200b005098e9ea416mr3019479lfv.47.1700682109592;
        Wed, 22 Nov 2023 11:41:49 -0800 (PST)
Received: from [172.30.204.74] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id d19-20020a196b13000000b00505723e56acsm1945164lfa.273.2023.11.22.11.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 11:41:49 -0800 (PST)
Message-ID: <3865aefe-fb55-4f43-8f6f-30a1ecd5babe@linaro.org>
Date: Wed, 22 Nov 2023 20:41:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: sm8650-mtp: add interconnect
 dependent device nodes
To: Neil Armstrong <neil.armstrong@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231121-topic-sm8650-upstream-dt-v3-0-db9d0507ffd3@linaro.org>
 <20231121-topic-sm8650-upstream-dt-v3-7-db9d0507ffd3@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231121-topic-sm8650-upstream-dt-v3-7-db9d0507ffd3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/21/23 12:00, Neil Armstrong wrote:
> Now interconnect dependent devices are added in sm8650 DTSI,
> now enable more devices for the Qualcomm SM8650 MTP board:
> - PCIe
> - Display
> - DSPs
> - SDCard
> - UFS
> - USB role switch with PMIC Glink
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
[...]

If you're going to resend:

>   &tlmm {
>   	gpio-reserved-ranges = <32 8>;
Forgot to ask.. would it be possible to add a comment with
what these pins are for?

e.g.

gpio-reserved-ranges = <32 8>; /* printer serial conenction */
> +
> +	disp0_resetn_active: disp0-resetn-active-state {
..-reset-n-..

and I guess same for p8

Konrad

