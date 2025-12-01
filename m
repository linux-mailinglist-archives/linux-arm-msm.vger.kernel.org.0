Return-Path: <linux-arm-msm+bounces-83969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E11C976D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 13:57:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5FC63A58C5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 12:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB513101BB;
	Mon,  1 Dec 2025 12:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Aau7poNP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB6630FC22
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 12:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764593435; cv=none; b=OHsth02uDhUa8qd7UTVa3G3FP74+TiwXEstAT2Vk+hg0w4T05GN2vwXSrlsosgukqPwCtMaPVqageU8wVtf69D0CxVCLm+LZ3wveU0IvB1G8JvMKgSOELIOpbK37U7EW2crdcHbK1YFlJGtlQFUGsXUhcxgDNoxHNKG9p6NlSE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764593435; c=relaxed/simple;
	bh=3Lempk/IOUZAlYvbPF2A/aQxGYHdGcn33YO5RSNVjRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skGl0knByEsK/iaIpoP2HSck9T1hJMdWsEQ9dAe/de693FfFoZdup55CQmsWW/T+Dz7mbubIwzci62Snlznmj/SftvefvUeg+Ub1QszO6z/BCNhPFfQTHj1NFBdTOjQjDn1Zlp1jPcYOL/XGHNEaJZluQSyUaB2yi0aSMz6CiFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Aau7poNP; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47118259fd8so38956385e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 04:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764593431; x=1765198231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3JlqK0ZnrQL7pFj/vous2tYHR6XDdun4YSY1ntH8dXY=;
        b=Aau7poNPM7BaKhv7LzTA1uvPJ5hOOUaCNxivIpo4UcfK0q5aSNKsU8SsQU+AmWpDkJ
         Pylb8ifHaIrJ8hT8SfJs973553skug2nb1bcSY5AhOMKSlIAHXFcbXJxyJK0ik8F0Roq
         7yruYhQ4QN/sGgXGf2PgW6TEZJ2umCfxZBgVMdHYY2wYruMpZ7qmFseY42ZNXm2WQ7W8
         KluFhMSvUJOx4aiqSeMUNsDifjIKBUkEh6Y2osEhE+3VVxuVAQxJ0ObkzWC3KkpxraQA
         IHY6+iS+xI8CocwcyoAtY1wTDz/khi3R9GjY8MzDvABTb5SF++DO4Qm1YGa1d6tZdJ+L
         bmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764593431; x=1765198231;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3JlqK0ZnrQL7pFj/vous2tYHR6XDdun4YSY1ntH8dXY=;
        b=rOMJVAtnr8MUdWUQPZF+PGko1pG7vqYdFlm6szd9Jldx5tNRUyL2NXl23EsGS8hIJ9
         Iu1QpJbdGEgaefVPYkpdh4BW/NsGy2bPAjwiWB6dHGDVCIzUSBpgV+jQMVftqAWtAjcj
         ox2CWjc0H5Azi59wNw+PKkg7TcSbxXFtmJskC4/8ouACSMhVlKQRFRXhgaqmbV4PiRS3
         z1LAtYkE9ZudoTRudbKVksHmBiyzgPy0UhvxPh/pao0u7uavgpD6Ur7o5XABdwjk4FX1
         5ETZHBxlE+M5uvl1gKv29t4Nqf5zzNDx7SekkO/57JsJU0BTrNwbdToEeHlAlYAEpkzT
         dwng==
X-Gm-Message-State: AOJu0YwW/jM64i86T/6ZrHsotHY9xwS5OPHQPfK+9QM9cY2pvGhy2mKD
	ovqkcxG2pD6sNfmIb5zGJJsxTkx3iudKwwqhFN2bvEFSQxy5IXfOqj1+MS54CUvqaCg=
X-Gm-Gg: ASbGncuTj04zl1AHv9HsilVaye5qaeo7Ptsz+QThGYXQX6fTW5hPnJZPLyOTKsyuHf+
	2qDVmLemICDcxg3CEKMCO314+y68CCObEJYWkcmiVvK8qYC2yMUBMyCvbri38Hu5FTmEVU1zeC4
	s1HDw3ZTj7XK5K/B2O8IgoyMkHu6Xl91ROk/hV8DC9SNtzvBrDnD7MyKF3VChVFkZhBXWHCJ3cv
	+X2cp+S1jFHV4SfNN/9XCuIw/OBX2kY3gKlnSPu/iqaOb62ugZE906SIImjfDSLuAPQM1dMbObX
	Ytj37bXmQDw+v/9uTuyLSvlVbHG5aCrEOPu9pEz4cYT0K0ywgQ7iTsRZGUYzBYWf+UW/yH973SD
	cYkEmtrjAhXRgDDWiJ4XLdyxQydYpM/XXmPcVLxbwCelYzl8cWGe0LQRqOFmVJs/2IB3kFo92+O
	jtD1PPbHoAnopzAoUnQpjoW9bZyq2RmgsH9HJ/CvJKF4IYhLeqZUA=
X-Google-Smtp-Source: AGHT+IFCiHhSv7clOJbOTsjbFGUe1tQYLwM5Ciro9iNMejKFvi5zfUI19dCqAQbxePS0HCp6jxwcYw==
X-Received: by 2002:a05:600c:1551:b0:477:7d94:5d0e with SMTP id 5b1f17b1804b1-47904b23c43mr242645295e9.27.1764593431085;
        Mon, 01 Dec 2025 04:50:31 -0800 (PST)
Received: from [192.168.1.36] (p549d4b1b.dip0.t-ipconnect.de. [84.157.75.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479040d3c72sm158803585e9.6.2025.12.01.04.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 04:50:30 -0800 (PST)
Message-ID: <f86267ee-ad70-43ef-8e48-b9f2e509c193@linaro.org>
Date: Mon, 1 Dec 2025 13:50:29 +0100
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
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <3fcfc5b8-7509-4e4c-a1cd-e973d7e1d091@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 01/12/2025 13:48, Konrad Dybcio wrote:
> On 11/30/25 1:08 AM, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> The lab and ibb regulators aren't used here. Disable them.
>>
>> Removes following warnings:
>> qcom-lab-ibb-regulator c440000.spmi:pmic@3:labibb: Failed to create device link (0x180) with supplier c440000.spmi for /soc@0/spmi@c440000/pmic@3/labibb/lab
>> qcom-lab-ibb-regulator c440000.spmi:pmic@3:labibb: Failed to create device link (0x180) with supplier c440000.spmi for /soc@0/spmi@c440000/pmic@3/labibb/ibb
> 
> These are only vaguely related, as there's nothing to be wary about that's
> specific to these devices - it's just devlink being grumpy
> 
>> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>> I assume this is right approach, as OLEDs on both devices are driven by
>> different regulators.
>>
>> Question is, if should be labibb nodes enabled by default?
> 
> They're onboard. I'd rather keep them predictably parked than left in
> whatever (potentially ON) state the bootloader may leave them at

Shouldn't they be default disabled in the pmic dtsi and only enabled on
the devices that actually use them? Many SDM845 devices with OLED panels
don't use these regulators.

> 
> Konrad

-- 
// Casey (she/her)


