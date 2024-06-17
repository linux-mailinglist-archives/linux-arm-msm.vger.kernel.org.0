Return-Path: <linux-arm-msm+bounces-22925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6C690B854
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 19:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEC4B2878CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 17:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F3C1891C2;
	Mon, 17 Jun 2024 17:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Suxbqy0a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838B51891A5
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 17:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718646064; cv=none; b=GWxM63p9QpqrYyYF/M4TVRJKwdmFtGjOPp2nXk6R1S85gKhxhk+QQAC/5VeuIMKACfje01SO8gqjFbIr4LMFZdJgTbyg9AWtEF2SDEdbbaR6GYW/6AwRz+oV6jatW49bqfHr49Ehq7mh74V9i9eeyCGwkCcAIla7z5zLWsQ/xqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718646064; c=relaxed/simple;
	bh=BJmjf1LIJNYCuuytinW9Y7On5XMCJcBh1ACpNVOQGkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o984ThhNjbjtM7w0MLAoZupc5KX6SqoEzOoX9mBZ8Phdbh9Hk79K8JMtBhAuwTQ2+uzjeHM3NVa4RwGv1EbCM3HVzZb36kxMzAnjVX6CX9ZnbrFH21SC6OZ8vKHWmETyJRFHFV2gWpZSY2wAjIJB1ySyR3+nuSbddGN+D2Mzoyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Suxbqy0a; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52b7e693b8aso4908066e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 10:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718646061; x=1719250861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kq55y/PD/L2nMZHKqMLWBSD0lhW7pm3VII5rKQRtysY=;
        b=Suxbqy0a6gJYIar7V+oGzroQQazJF3njkhRUGggw0GgXW/PCmBWfXHvkkXJEhPBXS2
         Qgh/+IqrXB54HHfeMiZgoPL7Hk3ehlueEhqQ0aDqu84fliDh9wxKwzRUTh2nsqeTi0VD
         /2xWrQM/YU3Rn6TN7V/a8IlfZEH1G9KILj192xb+uDuo4B6ac2LAqKlf+SDIqUgnTGz/
         bf63fTdYv9nfQYBK12Yil/u+UUVIKlXvP7JdI26Cp8JUGG1fVaw/qg16zPiGTAjF91Gt
         aujh8QuJkPbjkLtTVoJkwFUndW0ip+G/sQB9jgN0oFNLVRugD+WEWOmhYFtgrKC9oiwM
         GhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718646061; x=1719250861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kq55y/PD/L2nMZHKqMLWBSD0lhW7pm3VII5rKQRtysY=;
        b=xHKhZPBPjY4M0JqjqHLbukWVUkm4EGdJzvDtpWmu8NBlNsq9I7pCTOjm1cayAjNaod
         8o+OAW1cqXi/UlnqBXp6mcGcCyt497f9OKISFNbpsRQHgSLI/S2VLnwuNgs2eDp/Osq2
         euvbqu0JqOlXK0VbI4RgcLpuvC4dAf+4GRiwPFHBjwfoRm72ypoRMB7fypaAJY9qblUR
         W2LREOQBLSlWCWwDu14leHBgcwWCGMyWY3pYiaGFgRX5i/UAQYSVUpYJJdp0/LVun8+o
         Fxa1vukSGib+8VeOFRyjCcFkznhn6PEbVAKqkQR8Zez1FPDkZiQvLKapOv14tbK8t7EX
         Nqbg==
X-Forwarded-Encrypted: i=1; AJvYcCW4IwIdKNWoaIuWIgk/JGG1mrak0LS7xKPWD2r2xmh+tR4Ro92Jcz0Vx8TodIIk647EGQ6pS7nyTtUTJ0jXF8kfsFRJPtI4l8BTRhfGoQ==
X-Gm-Message-State: AOJu0YwJPPZB4uTYvaUVmWgp/Nk+fDiWCM/mST9EFvXh2RML9YhJ5OBn
	PHUKHd447wwyBTnVMI5Xn9KRN2+9qOmZNhpT1BCUOE/X0Ic/5epbFJqifnZKVRo=
X-Google-Smtp-Source: AGHT+IG18Zlf67kY/yuR4GVWFWSjflpDP80nHZFVDBocWaJkmiI0R8aIiaA+Q2WHlGH6FufaNEOBCw==
X-Received: by 2002:a05:6512:402a:b0:52c:b196:ea37 with SMTP id 2adb3069b0e04-52cc4767572mr130908e87.0.1718646060728;
        Mon, 17 Jun 2024 10:41:00 -0700 (PDT)
Received: from ?IPV6:2a00:f41:cb2:a9df:20fa:cfbe:9ea6:1fe8? ([2a00:f41:cb2:a9df:20fa:cfbe:9ea6:1fe8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cc477f19bsm28297e87.224.2024.06.17.10.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 10:41:00 -0700 (PDT)
Message-ID: <00090117-d765-4f52-abe0-f8bddc980c75@linaro.org>
Date: Mon, 17 Jun 2024 19:40:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/15] arm64: dts: qcom: sm8650: add hwkm support to
 ufs ice
To: neil.armstrong@linaro.org, Gaurav Kashyap <quic_gaurkash@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 andersson@kernel.org, ebiggers@google.com, srinivas.kandagatla@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 kernel@quicinc.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, quic_omprsing@quicinc.com,
 quic_nguyenb@quicinc.com, bartosz.golaszewski@linaro.org,
 ulf.hansson@linaro.org, jejb@linux.ibm.com, martin.petersen@oracle.com,
 mani@kernel.org, davem@davemloft.net, herbert@gondor.apana.org.au,
 psodagud@quicinc.com, quic_apurupa@quicinc.com, sonalg@quicinc.com
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
 <20240617005825.1443206-15-quic_gaurkash@quicinc.com>
 <109b1e46-f46f-4636-87d5-66266e04ccff@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <109b1e46-f46f-4636-87d5-66266e04ccff@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/17/24 10:28, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 17/06/2024 02:51, Gaurav Kashyap wrote:
>> The Inline Crypto Engine (ICE) for UFS/EMMC supports the
>> Hardware Key Manager (HWKM) to securely manage storage
>> keys. Enable using this hardware on sm8650.
>>
>> This requires two changes:
>> 1. Register size increase: HWKM is an additional piece of hardware
>>     sitting alongside ICE, and extends the old ICE's register space.
>> 2. Explicitly tell the ICE driver to use HWKM with ICE so that
>>     wrapped keys are used in sm8650.
>>
>> Reviewed-by: Om Prakash Singh <quic_omprsing@quicinc.com>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index bb0b3c48ee4b..a34c4b7ccbac 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -2593,9 +2593,11 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>           ice: crypto@1d88000 {
>>               compatible = "qcom,sm8650-inline-crypto-engine",
>>                        "qcom,inline-crypto-engine";
>> -            reg = <0 0x01d88000 0 0x8000>;
>> +            reg = <0 0x01d88000 0 0x10000>;
>>               clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
>> +
>> +            qcom,ice-use-hwkm;
>>           };
>>           tcsr_mutex: hwlock@1f40000 {
> 
> Please split this (and next) in two patches:
> - one extending the register size + Fixes tag so it can backported to stable kernels

Would also be helpful to know which chipsets require this, so we can
fix it up. FWIW:

rg qcom,ufshc arch/arm64/boot/dts/qcom -l | wc -l

returns 17

Konrad

