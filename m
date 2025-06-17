Return-Path: <linux-arm-msm+bounces-61524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A848ADC1FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 08:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D154A16C85B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 06:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C9228B3EC;
	Tue, 17 Jun 2025 06:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hZRRVO0v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD3728B3EE
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 06:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750140063; cv=none; b=Kk6C6bnCmhhwxpmbFY5MP+CadUVxJbnxkmcJGG+2cJ4cZzEblHkwKXuqTzN41rCiY7kVLaL/6VgTKlwWc6A50lN0nGnDzyWDYV/ioiKWEseaYMOkUwdifR5a6++mXJ6m78CayEm9dkPvqv0Mre5jAEn764Gh3jnE2bZrGa64KtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750140063; c=relaxed/simple;
	bh=yyo4zxa6ygCm2jtGfnAQ1q1FCeDbxttdenfVykbqXAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ok65IVTTJVrFlSnYWX3PZLRF21eF5oujYxCIKwcuKHS6Tw0K20DvjcMOb2FvHgOb77pBqfXkoMxXhWEdAOmGFJpa2/2rLNJO6v2gId12/bPlbbYlK9cqQ8AlarREFAm4LWh0NsJnyEgqqBjpOV6C0FUluLW5ArAb7IIBtZ25tL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hZRRVO0v; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a528e301b0so706206f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 23:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750140060; x=1750744860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3amWnYYOsSXKV1aGWt/S6iSzIIDj1ujFQXJkK0yqFPs=;
        b=hZRRVO0vDuLD3HYjNKpTONA9XdiOc6uPF3hnw6z3D46IbsG+mGs0bw4/SJWlH+0T9m
         iC0K0q9UbrmPXZFswIIs9cS7HnRrEe429GX++EgMsWI3NYlXU+0DgfhE4JLhk/qncPd8
         KZsfwI06eEpWuY0cxxLh8jUV2Zq/8B1CmPozglLhelGKJqCIPGGeWCSt6N/zWxItVeII
         uZXv6kGsLP1j5sxSv4vS5I0E6KHgDIhH59qrWQrFzC9i3SjVZJlVXf3z8zB4ygxmVSm9
         3K3oKrqHRcNCaCMpxPeK1KlWGy+SSyG9ozqIUG20QS8IRYK+Pv6BsiZ1LM2jP8RiNehw
         RqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750140060; x=1750744860;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3amWnYYOsSXKV1aGWt/S6iSzIIDj1ujFQXJkK0yqFPs=;
        b=EeqSCR7K6ROZ8FaSws5SHsa6ulRVhNlVdvgRD73Y7JNe92HWZzhffj3WtyPyYvs0A/
         l8X3ypGOpgMJggJw51lIB7bbD/I2pWFkT8J3z1zYVF3suQb9e+I6J8LDQpw7qhhuoThY
         jPubwBMHiT6vXJpDe5BFIXt0KBhILmqHeoZ62CtdMBBc3j4I7Lb3Pyu52/be/BvrxVLK
         hBpr8cnCyXfwdU6tNgg++xIJvcBfy9tcISAZ7uR5GYHxfPDOavPknKvFDfoxdkSh9Mzm
         nN42BScXLiExAoez68pYffJfKnJgMcGhf/bEJ5HLTWx0QL7JsdDIFvAAjlRzVKmg71PC
         c/IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr6zU1/VWtUuN4uvWvOKiF5FYZJO7Ns8qsQzodgCjSLFyDShC5rr/02Yga2gQGnLlrJfWukcM4NEhF8/7w@vger.kernel.org
X-Gm-Message-State: AOJu0YzcwjTgH/hgSYFdZ/0wLhW1h42Eu/Z7MotAZYiiQKpfUJpfhTrY
	ncj4noaAyTiTG/KYKpmNUriSVjPwO5y2+itryInBXUzbGnUFxuq/q2cn6mcVdA2TSLg=
X-Gm-Gg: ASbGncsv20MEA3UkN6uTyIrTcsA80FgsXyiK//dMI4uKTM/ZSIvFCc+CKSMc7fQETh5
	4VsZoVsYgp1aNWuTK5wwPp7aVbuMCQfUVUGsgfC8n0tFBNOSxNsVagmTE2QxRRJ9n3jaBkgT2v7
	im920QsOeC2ID24VERRNWE7TKBz0im42cEsxfW/0vk34lj43KgjX/PoqKYoIyaPBIRlbYfq7EPa
	/0I1M6VBad+OFeQP0VMttBcAMlsmMYai8a5CCklvO0NkbKiUPkjC4/a7CMbLIjsoUCoHQoixFtW
	B+BZ5XHe/Z+uOvD0xmFo2nGykNur037xs+vSPPxiHEgAnmG9YtHw6HGqWg7/RbnZMadMszCEm5W
	6YPC7nVs=
X-Google-Smtp-Source: AGHT+IE6/ujC8RvWh5QEdjZlVKo5xpSWeWU7pqeFIYtGV6IlnzxpN1wOBsHwS+VTpsb7nAoRLJMnOw==
X-Received: by 2002:a05:6000:2701:b0:3a5:7991:fee with SMTP id ffacd0b85a97d-3a579911341mr1949524f8f.14.1750140059996;
        Mon, 16 Jun 2025 23:00:59 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b4ba58sm12860919f8f.84.2025.06.16.23.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 23:00:59 -0700 (PDT)
Message-ID: <f8222e9e-0c0a-477a-be10-a340fb5fa4dd@linaro.org>
Date: Tue, 17 Jun 2025 08:00:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: qmp-combo: Add missing PLL (VCO) configuration
 on SM8750
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Melody Olvera <melody.olvera@oss.qualcomm.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250616062541.7167-2-krzysztof.kozlowski@linaro.org>
 <aFBNxvggJXYKQ4d1@vaman>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aFBNxvggJXYKQ4d1@vaman>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2025 19:00, Vinod Koul wrote:
> On 16-06-25, 08:25, Krzysztof Kozlowski wrote:
>> Add missing DP PHY status and VCO clock configuration registers to fix
>> configuring the VCO rate on SM8750.  Without proper VCO rate setting, it
>> works on after-reset half of rate which is not enough for DP over USB to
>> work as seen on logs:
>>
>>   [drm:msm_dp_ctrl_link_train_1_2] *ERROR* max v_level reached
>>   [drm:msm_dp_ctrl_link_train_1_2] *ERROR* link training #1 on phy 0 failed. ret=-11
> 
> Hey,
> 
> This does not apply for on phy/fixes
> 
> Can you please rebase

That's not a phy/fixes. It is a patch for next, as pointed out by fixed
commit.

Best regards,
Krzysztof

