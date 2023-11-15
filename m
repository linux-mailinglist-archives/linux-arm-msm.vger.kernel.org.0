Return-Path: <linux-arm-msm+bounces-718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D19D37EC846
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 17:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D07F1F2453C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 16:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE17C381AB;
	Wed, 15 Nov 2023 16:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tyUzCfXU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3A633CD8
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 16:17:21 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 587AC83
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 08:17:20 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5099184f8a3so9672703e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 08:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700065038; x=1700669838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3qRdRIQB+SyLD/2SSSnhRbTBC1T+kT3kqoQQAJb6ZGk=;
        b=tyUzCfXUfjuyWxENabaWJnV2OSyvqNR7EAWA0zT2WntfZHI3s6xG04BXO/R8sk/+YD
         MXsDRtoBW2LdtRzcmpIk/h/N9xBOCTRkC6sdyqv+pcMpwCWHI8RpfNKosESC9/ca/q1T
         /mV5SXOA5FvbpJ7WCnt74/AjFRRi1SGDG3deh979EwjPtLFfjpVWCDj3vdD3F6bNhZE8
         Y+yBlGGVcPbx3gEjSH2NvfnM1WQF5W6jm/9FdhGandDK5j7w1DNn1xFx3okl1Thzft/7
         XAXqHup/En7RKolTYnwn328dVHmm+2BK/1oHwFX3Z9qqr/bV/yWaUAAruY3OgnZ0LCIB
         nZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700065038; x=1700669838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3qRdRIQB+SyLD/2SSSnhRbTBC1T+kT3kqoQQAJb6ZGk=;
        b=DXTVvjP8Yan5Um9+Kxg8lf2rZ7ZC1hKM1m2VHsOW3tK9EitBw1VYRYOCCeOiF/M593
         jNng9qmYNl0eTn/K7d2lFQlCPZ6wJ0rePKLJHOoYbfHgQZlaybSMRsNlsOcMfqW2FEbw
         UwIqsoCoFuPC84my94XBoatuZaegzxWQaiI74T/vBUHRQuFo+BH7zNqxii7CIfzNqMWP
         zAqJYPrdwgBuopDPpkQ6s1mJN3YKy8JCTn5UnWcjVMAG27mtGIcX+7O/FC6J7YjnCkke
         p8Rlv61lFq65XuPZ/Oep26M0BslCvxCbuoPaY+Ymb68I4YabJeJlxp+Kzic2GheAhrDU
         iCAw==
X-Gm-Message-State: AOJu0YzAJIdx8CFpA5MfwWBTW1fvy09D1n+rHdxsAtiIHKejkAsuXBEN
	RPmX/elXH3XB+j1x1PgxJgfB4A==
X-Google-Smtp-Source: AGHT+IGDqUKQj8i4ksmCvgTifMSpJYI6UUhnm2dFhWerlnxd1hBxKHSzpcMr+i8toBc2SR9Oy0cD/w==
X-Received: by 2002:ac2:43a3:0:b0:509:3bba:e8a with SMTP id t3-20020ac243a3000000b005093bba0e8amr8552355lfl.39.1700065038548;
        Wed, 15 Nov 2023 08:17:18 -0800 (PST)
Received: from [172.30.204.150] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x17-20020ac24891000000b00507962dd2aesm1692517lfc.207.2023.11.15.08.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 08:17:18 -0800 (PST)
Message-ID: <1df726c4-745c-4b41-be04-d3081525210d@linaro.org>
Date: Wed, 15 Nov 2023 17:17:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qrb5165-rb5: use u16 for DP
 altmode svid
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mark Gross <markgross@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20231113221528.749481-1-dmitry.baryshkov@linaro.org>
 <20231113221528.749481-4-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231113221528.749481-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/13/23 23:13, Dmitry Baryshkov wrote:
> Follow the bindings and use 16-bit value for AltMode SVID instead of
> using the full u32.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Fixes: b3dea914127e ("arm64: dts: qcom: qrb5165-rb5: enable DP altmode")

(because it was previously not compliant with bindings)

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

