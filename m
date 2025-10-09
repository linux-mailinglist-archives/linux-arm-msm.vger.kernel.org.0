Return-Path: <linux-arm-msm+bounces-76536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C61BC775F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 07:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 69E364E0118
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 05:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53170236451;
	Thu,  9 Oct 2025 05:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b="grFunmPV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EA51DF75D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 05:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759989054; cv=none; b=vFyWWg4N2hATH04xiFIP96Le1ZY76Z4rEDkndYFzMR3fpbPhxO7a1rGTgyMn1Qpea5FHTdT9S2mlXePeIrVsIlpnhIDJ7UGOrpTooUGaJnymSHxa7uNL0LbMs1+IHpYmat0DTwC9/FIE1cQQausddHnahP3nCU+kLZxyQkVoo4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759989054; c=relaxed/simple;
	bh=CRcGoM/pdmgvjzc/HLi5jOX3AiGRO3dzVYqKflx3hZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u6gr1MX+EWSCUClZkTESJCXwGiqpRMKq9hSbqvx3sM9mZe1GnS6DeFEzTuNfU6nEKVhkw4y0IF6cdUtEq6g/8WODuJk3S2HlkGgQlavrudk3yYa+/RYlc2baHWTpXHmIANbU79XTwNCduxjwxKLrWW9CNEm2KYQKW+GY5ApmOcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org; spf=pass smtp.mailfrom=me.ssier.org; dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b=grFunmPV; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.ssier.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-87db3aa478fso48063585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 22:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=me-ssier-org.20230601.gappssmtp.com; s=20230601; t=1759989050; x=1760593850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W/oPt2UM/yRSup/UV3LslStLtsSul+rezNIMA7ALhsY=;
        b=grFunmPVQaUBhYHE5+rccqwp8qgK+YMX513QU/fj+vri+LReQY6Q4coqnOdlI+KR3C
         Dycz+S2IKaRGgM1Zmno5ScOSFOj6+V9Gu4GrgQT7MUqOd7KjCSlf89fios5RctSOQ1uJ
         /1DZlUjtBpo/tU98A4S/LEFVNFIFUIDgpbHsMMuLngrnxiUBpOWIKrkrbsyyItWICx2b
         jyUYhTsq1fisTobSHx7xndI7vFj/TNfEFd8x/sn6J+4UvKzNbUDW9BN22tc1t6+C51E7
         buyejUYk9sW/ePk1q6071vm045BFFmw/rb1GlEXiuPRQjnJnldDLyzHaov4PBIfmIcNe
         daFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759989050; x=1760593850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/oPt2UM/yRSup/UV3LslStLtsSul+rezNIMA7ALhsY=;
        b=ZY0cZA9oMr5puwpj9mLOnHjt5FuARMru3WpM7YLcJFtKGphVj8KPU8D+nObilt8hcK
         /qjeg4e0L7CXyMh6UPvUDEpCuLOolhRZsyoxnLT2XEWHHYELvUSzEx/UE74TY5nskNFW
         8ftF3oQ6qLClTIf3OI86gL9HW7+DQAR4NmpXn/iKPRP05dHzs5WWAZeVzTaoFIq4a0qW
         SaGRPJRR3LBS+4lVCYV5HOr6iegokOkC7QyBhbii0TACm19nVCXaE+XyvDo9xzLOfLMu
         4gVw0jhxeXvW9ee4E09lc+JVd5SoNZg7+eH9WuFLx45BAOqeHFtxg7XRgnKXGXAlQVaz
         qPUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbnno1eeDl3jtyBxb3apd2/9/EThbDBv0STboT6iBUp62W6IFL1Xug5ty14EoJ4SulmGU8lHytYXDpQ22J@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe36bP9jRATpsOaY2i2JKnITZFAemtNSM++vv5l1F6Ck08eu+8
	h5JDuB9COC78RZfUxTfh93YAYBIi05Ba3Ey2cbSK9CEvR70nRyrHri04qSn8sqybaVoL+1++iBl
	FTJwRIyc=
X-Gm-Gg: ASbGncup+IThmfJ34oFFxMpPtT6AjrFez8ggf5wyQ2HmmBUFMsgTNdNr5qO86ODN/on
	Yv7ML73++k6i7PsVQYc5a+Ipd2dV6MiWocef6Ot/pFKA2I9+5/vA2P90zilBjnVVYMUkWUEDFAx
	PqFY6IL09fGQ4Z5QSgGtpUiK9ubbynSvmKFPIEmsOzv9UM+izdC2+SLLXt/B5qCYhSu8leA7pA7
	YmSIV8qjehylyvAHovFfuK+5qQ/Ij2DjhUpriOvHk7TE+lnP/KDVCO5OqdVfkve4aGjwr2nL+ko
	YSOl8I7gHirb4apy3Hx4fu3qGM0ZaY0qZUMKzJeUpVh7Qasdh9Iwl9d9ERTIr//fqh19kUTrx+P
	rTC1PpQ++GbuZ+Gh/6livjvgxMlw1Jga0w8hxtri4flxMLfDbLOhL7uepED+hgkSktw+3yzY5zv
	9AQpL8895C34Q8dEzuPcZvlxl8WEMcngQZQA==
X-Google-Smtp-Source: AGHT+IFCznXbDVprhXyGUQz2c8H3d7UxKBtr6+yolyAKzCcIf8tTzXD2m9VShCCqzveYlA1zyjZR+A==
X-Received: by 2002:a05:620a:1a0e:b0:868:5fe7:8d92 with SMTP id af79cd13be357-88350983f36mr1024873685a.31.1759989050419;
        Wed, 08 Oct 2025 22:50:50 -0700 (PDT)
Received: from [192.168.2.8] (bras-base-stggpq3702w-grc-09-74-14-126-215.dsl.bell.ca. [74.14.126.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f2e00d8sm136229585a.1.2025.10.08.22.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 22:50:49 -0700 (PDT)
Message-ID: <1d60b78e-136f-4051-8296-245d111ca49f@me.ssier.org>
Date: Thu, 9 Oct 2025 01:50:47 -0400
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-4-53d7ab3594e7@me.ssier.org>
 <5a9a2ed9-9e95-4bb0-b5b9-e4e0edcfa8d8@oss.qualcomm.com>
From: Alexandre Messier <alex@me.ssier.org>
In-Reply-To: <5a9a2ed9-9e95-4bb0-b5b9-e4e0edcfa8d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-10-07 06:04, Konrad Dybcio wrote:
> On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
>> From: Alexandre Messier <alex@me.ssier.org>
>>
>> Add the touchscreen device node for the HTC One (M8).
>>
>> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
>> ---
>>  arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 36 +++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>> index 36eb42f0f3d9..040a256f9465 100644
>> --- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
>> @@ -65,6 +65,35 @@ vreg_vph_pwr: vreg-vph-pwr {
>>  	};
>>  };
>>  
>> +&blsp1_i2c2 {
>> +	clock-frequency = <384000>;
> 
> This is not a valid I2C frequency
> 
> You're looking for 100/400/1000 kHz

Hello Konrad,

This frequency value is used in the vendor kernel [1], hence why I used it.

I did a test at 400 kHz, and the I2C devices (touchscreen here, and NFC in the
other patch) are still detected, with basic functions still working.

Let me know if I should still update to use 400 kHz. I would prefer to keep
the value from the vendor kernel (and in that case, I will update the commit
message to add that information).

Thanks

Alex

[1] https://github.com/LineageOS/android_kernel_htc_msm8974/blob/lineage-18.1/arch/arm/boot/dts/msm8974.dtsi#L970

> 
> Konrad
> 
> 


