Return-Path: <linux-arm-msm+bounces-88907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC14D1C937
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 06:23:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E6C830329E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 05:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EBB33F38C;
	Wed, 14 Jan 2026 05:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8RX3Syo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432DF3557E2
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 05:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768368190; cv=none; b=D8xWDNbeVvCvX/qL43uhxWYSQ1s+L3ql/gC4m7DDjz/KtChKWjYp9PpX0JlhyXjfx0obheNVE1cQ0QvH9COzRlHXSZk1AnNIVyQmRA1efDiHDHojUQgvib/wITEBVLiYxjLhAclq3KHBYqjA+hDMqb/qB5Z6s1dUdj3q+lsmEs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768368190; c=relaxed/simple;
	bh=Hkh9mVHV8jEBuh2bM7sXJ8jZxOZKJFPSOYL4/A5LALg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J7QLWYswwYG7jG4W1Dg3xVd7cKtJr3Yphstmo6QuTgc9AVu0HMkO7SGSeggLqGCh4ftOFcmEE0zzxJkRa9/0VX5QCq89cEjTgqm2GZIRwlvncIi9MR//HNIWTPEKySwbBJ+/m11Z5QK56ce/dgITSR0aDOjZk6OBb8ywx1i3uak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8RX3Syo; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0834769f0so57452955ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 21:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768368184; x=1768972984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pw+P/vhMS7LNzSvseo/v0Y8/Etjvb5loLlH12yTLsr8=;
        b=g8RX3Syox7r5vCMqj0+nDBbRmaMpAc2zRc5qEaAbHyhg3joFpg2gdlJX8iu4UdbVNj
         8Htje7reBaEI1q8bMqWwABPJQW6RlcOQ/Y+4OpXvgVdrDvKqr0cc6iVQAKRgD+Xzb9LV
         IrPYGeE92AEvrdKX/CiJ0JEk4MoZuCzGJDFF/D4CQ1h4ZhafP7ZdNOfwAoiUeTnbNOXp
         bUw1+2plnINk0DG8hADH4BlqTBWhdhLcu5pKhp7MU+BkKAG1/tCOmKL1P6nDgSt5M/bv
         Pr/iNW/Clr0ZI4PQsPLTxOfryir95343o7xsP73mkpxcvVETBRDMdQqqXfAyqch4Z1xw
         YhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768368184; x=1768972984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pw+P/vhMS7LNzSvseo/v0Y8/Etjvb5loLlH12yTLsr8=;
        b=Leh5xxu+l3Lzs8LlZgjg+HnFu17WzpxW4Q7XCQPqzjFUolPBKQZnw5YqnpVH/MImcW
         PbqSDeDLpNuMMl+HKmPowkVu48IDxGQ7ht55tt+5/uWy1eyeU+7SbotLlAUsfEVKy4FV
         khH76lDY51Pg13tb8vaE7TaME9QbJBHWhRtLT1MeZD3H8uAEw7phaxj3qDfrG1656OFC
         weizt4pELsT4t81BeaApdAexD5rKidKkG9CEm5k/sYbh/3u38kwsWz4fMlYlI7sIMJz/
         DDNwB5+cM5FsY3tmjM766tLOT5wTD4BxTqNSl7JpZ9eY0GC0IyCyS4TupgNn/McyO3rD
         8O6A==
X-Forwarded-Encrypted: i=1; AJvYcCWKyp4TUGDa/ec2Grc3EGPLLNDgHGOmeYvyq09ALz3+5+xCqMzEReT6zrvYFf82cm+vhIecbQwEO1k/oDl0@vger.kernel.org
X-Gm-Message-State: AOJu0YybidkqNJIFkx8qtnkZeu3pPXCE6UJl+VNWmgnAPtpA55eAntmD
	wgMNxgpOemyIMQAVAFUwAPwkd8FoJr2yFug6ghrzI86JOsylpwu118qu
X-Gm-Gg: AY/fxX4b9hv4V0AvbiPDskyNKKKdjR4rykFa5zCO8ntDFRtqZDh6gBj5H0Tk/ganiDy
	z948eADutCzCUWWr6sYbuR4PE2dRoGWBF+CahRGvuuOOQa7f73tZm2wAvlVkwYTfKcFEIf3rfvU
	B3FPbpxGdyfMqzRjTidgLlVeEw5zKVvCDx5V9begPv4YwEEbE3VladAS2vVPdRw1KzdlHzSqzFT
	hUzIXgUIZtEFRgt3aZKUa1+s/BxC9u18ixMJI7UmYKLyrIEOLWRF7dh01UiP2M4o38mVDKy5tz9
	2ynzBPhXhw+uiKLf6dct5TWfC5NM1aZO6GHUGF+Lb67gixKHddX51alSzk/kMGoWs2aD0qKVey9
	nbQDJV88vPBFMNlXIO7U9G7bZQod7DoZ1xvjPQVwENfsWYkHqn2O9vTnzsONCdHR3hUogVkYo9d
	TxFO04DkE0wNrbq4XbSTdoCbM+yLjiHws/9A==
X-Received: by 2002:a17:903:1b70:b0:2a0:8be7:e3d0 with SMTP id d9443c01a7336-2a599daaf0dmr13788695ad.10.1768368184334;
        Tue, 13 Jan 2026 21:23:04 -0800 (PST)
Received: from [172.16.20.12] ([136.226.253.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a596365ce0sm12997235ad.41.2026.01.13.21.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 21:23:03 -0800 (PST)
Message-ID: <753fc364-3b32-496d-89f8-d9330d980f45@gmail.com>
Date: Wed, 14 Jan 2026 10:53:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/4] arm64: dts: qcom: qcs615-ride: Fix USB PHY label
 reference
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260109095221.2847067-1-tessolveupstream@gmail.com>
 <20260109095221.2847067-4-tessolveupstream@gmail.com>
 <ba7845ba-9f85-45f4-bfdf-cb1c6f6c2f7e@oss.qualcomm.com>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <ba7845ba-9f85-45f4-bfdf-cb1c6f6c2f7e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09-01-2026 15:29, Konrad Dybcio wrote:
> On 1/9/26 10:52 AM, Sudarshan Shetty wrote:
>> Update the USB high-speed PHY label from 'usb_1_hsphy' to
>> 'usb_hsphy_1' to maintain consistency with the naming
>> convention used in talos.dtsi, where the second PHY is
>> labeled 'usb_hsphy_2'.
>>
>> No functional changes, only label renaming.
>>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index be67eb173046..0ca6b50a6de1 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -609,7 +609,7 @@ bluetooth {
>>  	};
>>  };
>>  
>> -&usb_1_hsphy {
>> +&usb_hsphy_1 {
>>  	vdd-supply = <&vreg_l5a>;
>>  	vdda-pll-supply = <&vreg_l12a>;
>>  	vdda-phy-dpdm-supply = <&vreg_l13a>;
> 
> This must be squashed with patch 2, otherwise patch 2 is going to
> cause a build failure which must not happen at any point in the
> git history (to make bisecting possible)
> 

Okay, I will squash these changes with patch 2 in the next patch 
series.
> Konrad


