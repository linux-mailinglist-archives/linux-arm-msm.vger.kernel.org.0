Return-Path: <linux-arm-msm+bounces-78900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D8FC0D990
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1DD5F34DE71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 12:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE8D30DED0;
	Mon, 27 Oct 2025 12:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bjFU2cIR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15A23019D1
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761568687; cv=none; b=qeihhQSz8A2Wi7/XV4+F4SLkw/SXRBqgr6OYG18P2nKjIBWjINacmUX4OsPdtHB0JxEzdgTD80U8HDR8uUaWfaZLVyosp8JHH7aVMab4To3zgCBp8m7BhUITKAGnyIMs3BEyafQ+cjlig3CxFh3p1+VsYZbfpJqMCSQcWgcOQok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761568687; c=relaxed/simple;
	bh=lPiYTDtRjDZmT217lCKABlCpCvxK42i4gTfeJsqcnDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IqB00PAj4xQq84hhvJ6fdWZS/fqIkKXNXqLxeqYhT42LwnzTPbc1FSG8QRcisC7KLaBMZDLyhXVR5yw+98Xvq+7AZgtKIZ8T1iU3g6xeVH+Z6Le1A28eltoHEboBzgVWeptFEM+XNAz+XLPeV9xsGDVW0MWOWbKEPJmvvA7XEvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bjFU2cIR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-475dc918150so872965e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 05:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761568684; x=1762173484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RHGUu/H89+nPNkVnAmHWGAl8x9ue4UGzIIMtUhE6fgY=;
        b=bjFU2cIRarJGL2zNOe4Y6PKrxCb97KDnSpKZq/n+tt8W65nGg/1K6Gy9wbphqZltym
         5DsKywlktXoDvXrPQKDWlszY8Ftg2+ssTRk7l7Uj8F95lPiysi4xH+ybpTKklu6ZO5PT
         5N8hYTAcqQgB0Bo//5CZiTgxnuckGTvbcQZXCymaUMD54dIMfoHD46XPYDjkMAjPvmKJ
         8iTILt+v6uN2KFDGkJesz06TY6+FQug3PavpyFAh4qBZY6ZK5pFMdUmRT6mgubv3Q1Yb
         SEHIAFdmsLntt8JBF9CYYoGEYIkb1yzb62hdl1uppdTrJMlKSifpumMc0ruSMW3EDs0s
         8X6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761568684; x=1762173484;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RHGUu/H89+nPNkVnAmHWGAl8x9ue4UGzIIMtUhE6fgY=;
        b=X02caeXw8KMugOtXEbx1TG08Pn9OzPAPxkrAs/NtwGOQ4IdqELUzKiC1QNXJvz0Zm8
         +7U5Gq3I3ZHDpLphAGshkYVp6yQ8MaGqkxa9nqADdJcsL/mONIkInY04WB3zcqIffHA9
         sJd7RAi6JjtpwsjKoGxHDjo8ZliNcr6sPaLZLs7nH3IYXMjHleTK3YUK4TSj4klOx6tE
         Mw3Ykdf21zxEARxoUnvHihW0G5qr4rwE+laTQ4K1Uu/zK/0pKj+PQ0edPzsPUfIJNIvp
         +6SlN90niXcPwOCsO0x7GN7+mFa/t20kNhBc8tD4nTHevzjciywQxEh+G5eGCChTSZ/X
         QdPw==
X-Forwarded-Encrypted: i=1; AJvYcCUEP2Tw9Ora/ldxTPbvSMH6I18pB6s4o+YlBoGpHSMMzyx59aAWUBuVEPbqDKzLXEXB7YWBQl4CpDcsp/FQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyhZELESbVzB5bqYctA0K32+0C9ti5Aqo6zKPMXT+N8ZNS0beLw
	B7uhKZ2xIm9NfVDep1fgu+DG6zrYk+4aaOk6qJZPEXMEHetmaK+CMXg2o49sC+w7NoI=
X-Gm-Gg: ASbGncvNXFSizsixg3Tq0OyYfDstekpSR6LYxNn6A7agV0Vb5A4anRv6Tp9cdO+vwM1
	LYe21Z1jApl6Ovm/4fqgiHehqR905HfhB2dkWpW7Dy+E1Scb5TvdGfIjrk+Kt9pz1YGWpw3X0Qz
	ZK7gJP3qPBGdU+JTMa/uxI6iRdp8af87H5AHTwkwrHu9Zta1Lk8sfdNdmWP+WTVNEu93Nf4yyDX
	vruSn9BAPJjO6Vs81ESQc/wqT608g+l28pF6wBoLQ8n1DJ3Cr2JTq9sDeqpvNR42W50XfdTQAuV
	qyMJ5U8LkZ+6QbJwWRH1SPFCXeSGgUfj6wCBABnZlJMuqeU6frrJdrqgEElruIf7YwYhbDMnrge
	cki+iNi9TKN7YHXOnzk6e4rKL74gajZw8sC6/lsyXng5G8dWnwHwqPgbY7feyVfT2MIkj1XF+tk
	hw4unoB+OZn2uSJmkC51IF
X-Google-Smtp-Source: AGHT+IGNtmCu4D763h6+9G3lrm83csyPVRDnPaCSfA4fw/nANSongHAbjp7WQaqw83gqqPcc+kuLHA==
X-Received: by 2002:a05:600c:4f81:b0:475:de51:ccce with SMTP id 5b1f17b1804b1-475de51cd8dmr32268755e9.1.1761568683944;
        Mon, 27 Oct 2025 05:38:03 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de5f9sm14127748f8f.38.2025.10.27.05.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 05:38:03 -0700 (PDT)
Message-ID: <a3808dca-2356-4871-83e8-c535cd0cce86@linaro.org>
Date: Mon, 27 Oct 2025 13:38:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e78100-t14s: Add audio playback
 over DisplayPort
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
 <20251021111050.28554-4-krzysztof.kozlowski@linaro.org>
 <51da0617-db4f-4c6f-9f46-0492e49c9a2f@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <51da0617-db4f-4c6f-9f46-0492e49c9a2f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/10/2025 13:20, Konrad Dybcio wrote:
> On 10/21/25 1:10 PM, Krzysztof Kozlowski wrote:
>> Add necessary DAI links and DAI name prefixes to enable audio playback
>> over USB/DisplayPort and HDMI.  The HDMI port is not yet enabled, but it
>> should carry respective DAI name prefix regardless.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> ALSA UCM and audioreach topology will follow up as well.
>> ---
> 
> [...]
> 
>>  &mdss_dp0 {
>> +	sound-name-prefix = "DisplayPort0";
> 
> We should probably push this into SoC dtsi since #sound-dai-cells
> is there


Hm, that's important for user-space and represents actual naming or
wiring on the board, so it is strictly a board property. IOW, there
could be a board which does not have DP0, thus mdss_dp1 should be called
DP0.

If you are sure that such case does not exist, then indeed we can make
it shared.

Best regards,
Krzysztof

