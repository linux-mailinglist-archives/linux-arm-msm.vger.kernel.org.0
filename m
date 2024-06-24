Return-Path: <linux-arm-msm+bounces-23944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F506914A32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFA431C21136
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 12:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC82413C681;
	Mon, 24 Jun 2024 12:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VQKGa16B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A56B137750
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719232493; cv=none; b=d6lrYGkS6VO3anofaJ4mJ7jmgDUfvTCr8N5eYg8woTD2E70myoqGmpbHd+dZpLvkCD43zTZIF2zbxbrOjYZITK6q8SrYMSJKhU9URsQt2SFCY3OFbcdLQQ55vg34qPHMBeN8LkT4kCrdp3gXAd66mmnYmokEEqOg2BR90Y9l3UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719232493; c=relaxed/simple;
	bh=5f0/UoGx6xaywRoX9Pa4HI10K9jFxVdu6pAJ0tGudJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AvNsdgzLT//tITHwNyed1jcW5pAbNaHMglWt12lz8LNjhxKPmYcWDO8/vokKTKpYCp4mKykkWY2xlFpJwJqK6A8xmdlcnMJNxlQf3X2no0bWIVm8jh7j6T8jhPHUwFHqenvEmJ1V3fwnBVOGIC8kPzL7wFmldlV1Z3p7QJZfizA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VQKGa16B; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a724e067017so130053566b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 05:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719232490; x=1719837290; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T6mu5FL/2KlapxSCeQ/DGjboe5sy2JfXpFVHbsPe+7s=;
        b=VQKGa16BAXYLVBbkG18H0v2Ccnje4zrb75x8fenRbds+FOkpBxv/RyQXv/Md5C9bNU
         FWiwwi7WsNSQOrWK3y0DpD3SSrZi/bwNgN4Q9DFIcItkVG7gmSGJWlY6MAkvc+snevVs
         1YR6UIeOpL2P1XYaNm4xVrDsftL88bcOqrpet/5wqmXNv24zGMarDAEcBloHVz60UsNl
         ofAJ/mZXz7eElMmOnwlYRPyz9zO2Ykxsqu30Ebg+NJ9JXYYMJM8P0ISWoG/J+EJQHgwM
         be6k+pRGzgAsMBP2XmjNYM5a3nMeQaA+NQjYYEqIxCIStHrP6N5Iwbgiti0oN3B8ei1m
         Aybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719232490; x=1719837290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T6mu5FL/2KlapxSCeQ/DGjboe5sy2JfXpFVHbsPe+7s=;
        b=D/3kSM1cBuWmOOIUPU7rZm1KkxSGrLbQSjOWOTXX1/eCt4x3CtQxNzBeGk6yrQcKO1
         H5EfU31vw65L8m9CXCXzNNWw/PoNQo1SL4rGgrPmEggbSuyb0neI+Sv7gnMoYV9Vd1Fe
         AuCoTAIT8Nt78QYzZPUrhuySQ5CVYiHHid3HB9xY7UWE25bZpGTB6oskql6u622MwAD0
         HpAECHwUlD96/kfAQn5Fvbbqv/aUaC8vnzocRaXvLZx37LrwqezMg7wKGt6Suy5IPEkG
         c8JwTzl76qUVIlBY3YTgiPlF4c6AfRzjlX/3MCubEy6MhSxrCu0LmL1EuR9dOJ64ncZJ
         BeIg==
X-Gm-Message-State: AOJu0YyAQiDRZ9ZWsEEiu6OJIbKL/8K3MBmq0Gtie91z1hYKAhxvpqmV
	GO3sr3FJyBY/zgakdUD0u9eRDlGCZpn0SWGhW8fzIci4SPHR5ZmMT63LIySd4YA=
X-Google-Smtp-Source: AGHT+IHhqhonX6NXyzCrMbfxJmbvAwRvtzOkWNJuPKmWWYJ0JpIp7FmdDe+Qp1r7MvCKUIDvI8XH+g==
X-Received: by 2002:a17:907:c301:b0:a6f:5f5d:e924 with SMTP id a640c23a62f3a-a7245b4c9bcmr369118666b.6.1719232489511;
        Mon, 24 Jun 2024 05:34:49 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::52af? ([2a02:8109:aa0d:be00::52af])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72452140e0sm209539866b.217.2024.06.24.05.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 05:34:49 -0700 (PDT)
Message-ID: <5d5eaabc-8a85-4d1f-bf2e-cb2594005a39@linaro.org>
Date: Mon, 24 Jun 2024 14:34:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: prefer host mode on dev boards
To: neil.armstrong@linaro.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240624-b4-rb2-fixes-v1-0-8d763ee4e42e@linaro.org>
 <20240624-b4-rb2-fixes-v1-3-8d763ee4e42e@linaro.org>
 <8411fee8-7e09-421a-a52b-487acd3a3e24@linaro.org>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <8411fee8-7e09-421a-a52b-487acd3a3e24@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24/06/2024 14:28, neil.armstrong@linaro.org wrote:
> On 24/06/2024 14:23, Caleb Connolly wrote:
>> Generally, when given the choice these boards should prefer host mode
>> since they're SBCs. When attached to a laptop (which is host-only) they
>> should still fall back to peripheral mode.
> 
> It's really not what I observed on sm8550/sm8650 QRD/HDK, as the power
> is setup for peripheral by the bootloader and without an actual UCSI/PD
> negociation it would only be functionnal as peripheral mode.
> 
> So this is definitely untrue on sm8450/sm8550/sm8650 HDK/QRD/MTP.

Hmm, yeah in that case this change could break U-Boot.

Let me re-send and split out the rb1/2 since those are much more clear cut.
> 
> Neil
> 
>>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 1 +
>>   arch/arm64/boot/dts/qcom/qrb2210-rb1.dts     | 4 ++++
>>   arch/arm64/boot/dts/qcom/qrb4210-rb2.dts     | 4 ++++
>>   arch/arm64/boot/dts/qcom/sm8150-hdk.dts      | 1 +
>>   arch/arm64/boot/dts/qcom/sm8350-hdk.dts      | 4 ++++
>>   arch/arm64/boot/dts/qcom/sm8450-hdk.dts      | 1 +
>>   arch/arm64/boot/dts/qcom/sm8550-hdk.dts      | 4 ++++
>>   arch/arm64/boot/dts/qcom/sm8550-mtp.dts      | 4 ++++
>>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts      | 4 ++++
>>   arch/arm64/boot/dts/qcom/sm8650-hdk.dts      | 4 ++++
>>   arch/arm64/boot/dts/qcom/sm8650-mtp.dts      | 4 ++++
>>   arch/arm64/boot/dts/qcom/sm8650-qrd.dts      | 4 ++++
>>   12 files changed, 39 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts 
>> b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index c4cde4328e3d..bac4ed5874b6 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -657,8 +657,9 @@ &usb_1 {
>>   &usb_1_dwc3 {
>>       dr_mode = "otg";
>>       usb-role-switch;
>> +    role-switch-default-mode = "host";
>>   };
>>   &usb_1_dwc3_hs {
>>       remote-endpoint = <&pmic_glink_hs_in>;
>> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts 
>> b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
>> index e19790464a11..bece4896ca23 100644
>> --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
>> +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
>> @@ -593,8 +593,12 @@ &uart4 {
>>   &usb {
>>       status = "okay";
>>   };
>> +&usb_dwc3 {
>> +    role-switch-default-mode = "host";
>> +};
>> +
>>   &usb_dwc3_hs {
>>       remote-endpoint = <&pm4125_hs_in>;
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts 
>> b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
>> index 1c7de7f2db79..17d36f0ef5ab 100644
>> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
>> @@ -661,8 +661,12 @@ &uart4 {
>>   &usb {
>>       status = "okay";
>>   };
>> +&usb_dwc3 {
>> +    role-switch-default-mode = "host";
>> +};
>> +
>>   &usb_dwc3_hs {
>>       remote-endpoint = <&pmi632_hs_in>;
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts 
>> b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
>> index bac08f00b303..fe548d795490 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
>> @@ -695,8 +695,9 @@ &usb_2 {
>>   &usb_1_dwc3 {
>>       dr_mode = "otg";
>>       usb-role-switch;
>> +    role-switch-default-mode = "host";
>>   };
>>   &usb_1_dwc3_hs {
>>       remote-endpoint = <&pm8150b_hs_in>;
>> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts 
>> b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
>> index e031ad4c19f4..20d5c54cfcf9 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
>> @@ -847,8 +847,12 @@ &ufs_mem_phy {
>>   &usb_1 {
>>       status = "okay";
>>   };
>> +&usb_1_dwc3 {
>> +    role-switch-default-mode = "host";
>> +};
>> +
>>   &usb_1_dwc3_hs {
>>       remote-endpoint = <&pmic_glink_hs_in>;
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts 
>> b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> index a754b8fe9167..ebafcbe6859e 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> @@ -1098,8 +1098,9 @@ &usb_1 {
>>   &usb_1_dwc3 {
>>       dr_mode = "otg";
>>       usb-role-switch;
>> +    role-switch-default-mode = "host";
>>   };
>>   &usb_1_dwc3_hs {
>>       remote-endpoint = <&pmic_glink_hs_in>;
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts 
>> b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
>> index e0dc03a97771..1efda478b7b9 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
>> @@ -1252,8 +1252,12 @@ &ufs_mem_phy {
>>   &usb_1 {
>>       status = "okay";
>>   };
>> +&usb_1_dwc3 {
>> +    role-switch-default-mode = "host";
>> +};
>> +
>>   &usb_1_dwc3_hs {
>>       remote-endpoint = <&pmic_glink_hs_in>;
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts 
>> b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
>> index 26dfca0c3e05..7b05932f9c36 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
>> @@ -945,8 +945,12 @@ &ufs_mem_phy {
>>   &usb_1 {
>>       status = "okay";
>>   };
>> +&usb_1_dwc3 {
>> +    role-switch-default-mode = "host";
>> +};
>> +
>>   &usb_1_dwc3_hs {
>>       remote-endpoint = <&pmic_glink_hs_in>;
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts 
>> b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> index 361b0792db4f..744bdc846e70 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> @@ -1211,8 +1211,12 @@ &ufs_mem_phy {
>>   &usb_1 {
>>       status = "okay";
>>   };
>> +&usb_1_dwc3 {
>> +    role-switch-default-mode = "host";
>> +};
>> +
>>   &usb_1_dwc3_hs {
>>       remote-endpoint = <&pmic_glink_hs_in>;
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts 
>> b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
>> index 092b78fd8a3b..f07a56583e7d 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
>> @@ -1300,8 +1300,12 @@ &ufs_mem_phy {
>>   &usb_1 {
>>       status = "okay";
>>   };
>> +&usb_1_dwc3 {
>> +    role-switch-default-mode = "host";
>> +};
>> +
>>   &usb_1_dwc3_hs {
>>       remote-endpoint = <&pmic_glink_hs_in>;
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts 
>> b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
>> index d6f91580ba8d..1a9a31423af4 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
>> @@ -839,8 +839,12 @@ &ufs_mem_phy {
>>   &usb_1 {
>>       status = "okay";
>>   };
>> +&usb_1_dwc3 {
>> +    role-switch-default-mode = "host";
>> +};
>> +
>>   &usb_1_dwc3_hs {
>>       remote-endpoint = <&pmic_glink_hs_in>;
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts 
>> b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
>> index bd60c2770da2..031b7ada8eb1 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
>> @@ -1285,8 +1285,12 @@ &ufs_mem_phy {
>>   &usb_1 {
>>       status = "okay";
>>   };
>> +&usb_1_dwc3 {
>> +    role-switch-default-mode = "host";
>> +};
>> +
>>   &usb_1_dwc3_hs {
>>       remote-endpoint = <&pmic_glink_hs_in>;
>>   };
>>
> 

-- 
// Caleb (they/them)

