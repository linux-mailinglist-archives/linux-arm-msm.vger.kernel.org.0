Return-Path: <linux-arm-msm+bounces-83972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2A0C9775D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 14:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C62093A6C34
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 12:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7667F2F5A3D;
	Mon,  1 Dec 2025 12:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k30IszBp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C61C30BF4E
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 12:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764593854; cv=none; b=FtIljTpn6XbUOrtRAqJuw+pTZkleQPsGzVQyRbE9hbHfzLV1BoLR0Nv3Y6JKIc9nx54yCPEKvnnwPiHFkMzWnKP9dBLLTyM18EZ9Aj79oTT6e4spYCTntnI1JTZuP2EQ5QXW3dNjyc0IpUYfGMqhmO02ZRC+Ni1K48hRFm8RX/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764593854; c=relaxed/simple;
	bh=5+1ynFX9sq0ziaJLuRN5eNyfkmxm5J0x2HmsoNtaays=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZXojImigZ+b9t9Pov7Vw12jyjwfEkilKHo55BTbmfsO7S7v6Dy68RcFij6Kdjd6cteqjaO3rIcIawWPdiUK8nu1LTyjxHb/QUSPasYHYGNUzV7YSNcF43Y1PZ165HUrj1tf1Nxbc9DEox8YAMtqddoaHmVQsgWQR9mR3G0YjQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k30IszBp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47789cd2083so23109885e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 04:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764593850; x=1765198650; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=266CUf2mQ02zb00BTrcOWPUIAlQp5ZHo7Lg3QzyKKsk=;
        b=k30IszBp0wz/hU7NqhxlwrUnagrVNA3eeJPdCyR3m2TnRH4pERZrrp2rfMieLsejod
         2p2IDxQwG4hBNrVv79cpr/3UyFfrAm6g0lYY6W1JIsNXb1UiWvxtgClMLib/1cen5Fkc
         cRwPqcY3mZxdj1CKHn2h3jLIWnokkr0sUTAH0uk+wanO4N1WR0KCzLgxv9Fev1ru0lNt
         neLKftGab+9e5xGP7EH61p4qwaCZmS19nx7mh8z8PqKUaJmCV4KT3Byl3D1EEo4+pFc4
         ubYVigyZ0TwgLZakawmLPh2HKVhh2nCCX2Wbkv8SU+tRj6e2xazD8MN5kZ3wNxz9Eu8C
         sPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764593850; x=1765198650;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=266CUf2mQ02zb00BTrcOWPUIAlQp5ZHo7Lg3QzyKKsk=;
        b=MyQVJeOJcSqqq3DT7ZgiqkUi/bxmseNYemMB41mhBTOBPQUywnJwbEgl1Tn9/el4ui
         73movYmcsUvjCJVvqsoehc6gVv/sMq0HhILF/72nlwOgyD3fdyvCVvoM0e0G7Vu5w19i
         n2roz0WJnd/3BMU8JezoaB0KWufUOQvtVbNb8q910JK+vD5WxYkwGF0/k2b45g9DBBXp
         urAU9XdIo305BmF80+PuQoY6568UxUTKM+6wg9J7z4dJHI71Gdn8lujzsJvfbh/r4s6d
         +2SId0U+F+R7XqPHs2JsoMzzzQ0TxqrjZSgLj+cvoi1O2LOEUxxKqvdgjfCe751wWPJR
         AeTA==
X-Gm-Message-State: AOJu0YxJSsZL4skXenR1hVNlOW/kuimrtEvf9JVzwA23ipy1lzg4zjVU
	nlx5g5FBtkrNRzgicka+z08yo3i/dTzEKuNqReBAmmeFp/jGLeDQOft2IqxcczotQQA=
X-Gm-Gg: ASbGncvwMSiVJVPEBpadzzfIq0mnuYHoPOg0CMTngIQjo3sCmZeu48Ji2kuzejJtJWq
	62ePpZFb+AufG2CRLAkINBGz6vQBUUK5UNrMQMgD21JN6LVD2vpOES26rnSvVQK9T2lUFGkpSC2
	UPLJC5tfJc6ey20n1PPX18f16atQgv623dFPvJBVKOgrZQxDL1UIueezfaBqkC7GDSRfvBIB/OH
	4f5walG/xsT4sgNiOoWAIm/T/By8H9l5wpn2v12k+EuutpOPoQjpeDGkB/YiuFrRRDELDOzIFjc
	uZmUp2+plcLp9DQL7+AkRymMTUgnJg+ux/Pylb4JM67inIqYT3I7nTvbBRHUrhUPP9QAmRY8e5j
	LsX95g7esUNoTMzRh2jGFbmksLWb0e4PdYKEMyGfL5UBjMywwyQPah2LrXOAmRw7KtYFl2Fj/b0
	XU4dVPPLk01mzB04J/u3Bu7EyGsFamMsFhl+vLngmBa3EgBto42RY=
X-Google-Smtp-Source: AGHT+IFKcT3KZ6F5cHrXTlydWgyd1JuFvppbFsoLD2jFXYXeFZihdr8Tlj7uRzO7WrrPLR5+bwhxBQ==
X-Received: by 2002:a05:600c:4f46:b0:477:63a4:88fe with SMTP id 5b1f17b1804b1-477c1103099mr389390305e9.2.1764593849911;
        Mon, 01 Dec 2025 04:57:29 -0800 (PST)
Received: from [192.168.1.36] (p549d4b1b.dip0.t-ipconnect.de. [84.157.75.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479052cfe70sm153236355e9.10.2025.12.01.04.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 04:57:29 -0800 (PST)
Message-ID: <92c1609c-735d-4b5b-85ff-c40995aab813@linaro.org>
Date: Mon, 1 Dec 2025 13:57:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: labibb is not used on
 OnePlus 6/6T
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, david@ixit.cz,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251130-oneplus-labibb-v1-1-bb3653e43120@ixit.cz>
 <3fcfc5b8-7509-4e4c-a1cd-e973d7e1d091@oss.qualcomm.com>
 <f86267ee-ad70-43ef-8e48-b9f2e509c193@linaro.org>
 <0d63bddf-7a88-4c59-8ba3-6655e7a8854e@oss.qualcomm.com>
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <0d63bddf-7a88-4c59-8ba3-6655e7a8854e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 01/12/2025 13:55, Konrad Dybcio wrote:
> On 12/1/25 1:50 PM, Casey Connolly wrote:
>>
>>
>> On 01/12/2025 13:48, Konrad Dybcio wrote:
>>> On 11/30/25 1:08 AM, David Heidelberg via B4 Relay wrote:
>>>> From: David Heidelberg <david@ixit.cz>
>>>>
>>>> The lab and ibb regulators aren't used here. Disable them.
>>>>
>>>> Removes following warnings:
>>>> qcom-lab-ibb-regulator c440000.spmi:pmic@3:labibb: Failed to create device link (0x180) with supplier c440000.spmi for /soc@0/spmi@c440000/pmic@3/labibb/lab
>>>> qcom-lab-ibb-regulator c440000.spmi:pmic@3:labibb: Failed to create device link (0x180) with supplier c440000.spmi for /soc@0/spmi@c440000/pmic@3/labibb/ibb
>>>
>>> These are only vaguely related, as there's nothing to be wary about that's
>>> specific to these devices - it's just devlink being grumpy
>>>
>>>> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
>>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>>> ---
>>>> I assume this is right approach, as OLEDs on both devices are driven by
>>>> different regulators.
>>>>
>>>> Question is, if should be labibb nodes enabled by default?
>>>
>>> They're onboard. I'd rather keep them predictably parked than left in
>>> whatever (potentially ON) state the bootloader may leave them at
>>
>> Shouldn't they be default disabled in the pmic dtsi and only enabled on
>> the devices that actually use them? Many SDM845 devices with OLED panels
>> don't use these regulators.
> 
> As I said, I wouldn't be surprised if they were enabled by the bootloader
> as part of some reference/common routine and left hanging. Linux will
> switch them off if they're never used and I'm fairly sure the users won't
> mind the odd couple dozen bytes of runtime kernel memory usage (which if
> we go that route probably balance out with the added couple characters for
> status=disabled in the resulting DTB)

Ahh yeah I understand, the DT node has to be enabled for the driver to
load and actually turn off the regulators if they're unused. Makes sense.

Thanks,>
> Konrad

-- 
// Casey (she/her)


