Return-Path: <linux-arm-msm+bounces-87982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E3CD01045
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 05:51:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 699883002849
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 04:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A16E2C11DF;
	Thu,  8 Jan 2026 04:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIh1+7qC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43122C0F8E
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 04:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767847885; cv=none; b=S2l5QQyUhRbnaxiP/qweBXKL3VSmabZrtH+5SNKmXl5P4P7pnIXwieZJZvBHrUjENIss6/1q2oqUuh6i5Ec+38UEQbOdUGM/Vo06inu8TqdJWNfkCw5VdDRJuRPBCXWisuOGYPLFZHc0VIvPoxvGs5ZggORNkT+AXjEtPdJr7U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767847885; c=relaxed/simple;
	bh=KInylRKqGPEZDy85HSAT4b1HbM1y3G03NZiizlBuoTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HyW3CdVfXosZvPVMZovEjbe0lPmCjW4HTYY0bDMGojqZ/zO7qRLoyE+64f1OT6FU2B3K4ARiUB70UNP4fSTrsUaau9LsUuyRXaeKHdhp2q651CtAXGXOpQy1DyZymqLaBAMpDCldVEF9nQT5qj5shfywyXOFu5nu8L6oma6cj/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIh1+7qC; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0ac29fca1so21928125ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 20:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767847883; x=1768452683; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HBRC4McLwzpT9aXoMu4nX/56hk8UMq3mLiffjdzC7K8=;
        b=aIh1+7qCcYXWYNxHcxl7jRpy8dF/0oB8PBP2+ZBE73TBd2JmZErPE5KO/Nzp2KRumv
         TwI0oI1rvr4nP8T+sodN+Pa4mMJ7lRnfjlOlC6HJhuPRLkkXnC+0q2cKSSf+VRDPYFyd
         0jEcxlWdNCnyKooi3B2OCYXyGHGQBRsmZYk7iHDuSVg5IuIU6oPPmbWtMKaksVsQiYGt
         NVR+CeY36L2z7GXWre8YRxYevUhUSsBY4yVTStde24jzG9ph5F7vhie6iaxCGP//2cop
         iLDSUJ97sZekUd6dFEjcREmgvhSuGhTbdFNuf+w+e+JukmVS0S0AFSBn22/a0TrSAV/3
         JVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767847883; x=1768452683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HBRC4McLwzpT9aXoMu4nX/56hk8UMq3mLiffjdzC7K8=;
        b=qn8aPXTYqUTtm+zWicGr2jfg8h6KXWSF9PQoq33A+FS7q0F2uuMrEn9MNcZDUrGwER
         kf2tsIN78VQWZ2I6uhQ/+EFJVG/CPU4TKC6gI6+ldTrmV0hYQk4hb3kjQs6ffKjVkWij
         kLZtqiEMrGFP/9sm09ro09WBhUY2l8FFmcs6jSRXCv97ONPFJx27se/F3iJ6OSCCiqdD
         lRGZqoCBAGoXf/BYhmd8hmAXMVNNdc9Ycdj+Mklpg4/uijKqaGaZmgCmZrRvPJyNUjug
         p7z69EQgx6D/2LRNhMyAKvkca2R2ojfM3DiK7jy0C0dErDmOfnC3/3xSe4Nr8WvxxR7V
         bLug==
X-Forwarded-Encrypted: i=1; AJvYcCWMKJGFmpAkARbLZUxunv0TKv9TnYdkveLmilw4ZJTsGpV08KRjZ2UWgMLWtrFeXrCrPMe3uHf5nDyuktF2@vger.kernel.org
X-Gm-Message-State: AOJu0YxdcDtplD2muGxt3FyCRRa6+QqhYGiAPAvL041RBlOqEWJfMJOp
	FE8L8Zud/DsMoHJYjsa/VZa9CZwxTw9FTrtAklc4aKSAxm3QMRHTKSeA
X-Gm-Gg: AY/fxX5iLB8NgBqD5h/reDOcoB/XsGG2My4Xm/4QTZCKzMa/VBtgQ6KJ4UAkVZZDcMP
	oiOJCk7P3DpbB7JLlnmfqxpJ914BLwTxcbLkvl++RoHL5TkpBh1e5vWmoEWyOENWiRdrjDanbrF
	Q76pdFF4qc//SRoAZtjb3Kc86N/HBwhIkxUNbVJIQfe3pGiu1mA3+ySHe8/hea3kQBvse3v+XG5
	i4CYJAJg0Lzjhp35d3KRFcFsi1mg1IpwWw8qBFUc81nU0eZ3bKb8nNeYJgTUtpcNXmQ6x6YIGB7
	DImj0cnyzCgn/YZOKfCkyacuvvJ9nm5Pf1VAS/Qe3xzkRsE7dT8kD7fkekNrOUKA6q8ID3e3zWl
	0dOHT8keOzQXhOAYAZ6WRctGrI/9zqpChD7dynFOyOpR95NXW5tujFXfs3le08AbQ+q5wLKI3TN
	dKUcJO+FfmyZ0E6YPQGOK2ZFEDpoHuznJR
X-Google-Smtp-Source: AGHT+IE59Bw/HBnzQSE/d1trKAC4GO+IUnojcVfX4jX81ZYUTScmwSMkXhGxR4AZZpLfkuzHeSkUQA==
X-Received: by 2002:a17:902:e790:b0:29d:975a:2123 with SMTP id d9443c01a7336-2a3ee4ebc93mr32662825ad.60.1767847882906;
        Wed, 07 Jan 2026 20:51:22 -0800 (PST)
Received: from [172.16.20.12] ([136.226.245.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2c5bsm65408935ad.58.2026.01.07.20.51.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 20:51:22 -0800 (PST)
Message-ID: <2e20bbe4-ef4d-4f17-a84a-4f1cdebaeb47@gmail.com>
Date: Thu, 8 Jan 2026 10:21:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/5] arm64: dts: qcom: talos: Fix inconsistent USB PHY
 node naming
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251230130227.3503590-5-tessolveupstream@gmail.com>
 <aV4YA6wFjPD8G9kk@yuanjiey.ap.qualcomm.com>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <aV4YA6wFjPD8G9kk@yuanjiey.ap.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 07-01-2026 13:53, yuanjiey wrote:
> On Tue, Dec 30, 2025 at 06:32:26PM +0530, Sudarshan Shetty wrote:
>> The USB PHY nodes has inconsistent labels as 'usb_1_hspy'
>> and 'usb_hsphy_2'. This patch renames them to follow
>> a consistent naming scheme.
>>
>> No functional changes, only label renaming.
>>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/talos.dtsi | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
>> index 95d26e313622..c7dc507a50b5 100644
>> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
>> @@ -4304,7 +4304,7 @@ osm_l3: interconnect@18321000 {
>>  			#interconnect-cells = <1>;
>>  		};
>>  
>> -		usb_1_hsphy: phy@88e2000 {
>> +		usb_hsphy_1: phy@88e2000 {
> 
> Here just modify talos.dtsi, not modify qcs615-ride.dts
> 
> we will meet compile error.
> 
> Error: arch/arm64/boot/dts/qcom/qcs615-ride.dts:635.1-13 Label or path usb_1_hsphy not found.
>

Okay, got it. I will make the necessary changes in qcs615-ride.dts
in the next patch series.
 
> Thanks,
> Yuanjie
> 
>  			compatible = "qcom,qcs615-qusb2-phy";
>>  			reg = <0x0 0x88e2000 0x0 0x180>;
>>  
>> @@ -4412,7 +4412,7 @@ usb_1_dwc3: usb@a600000 {
>>  				iommus = <&apps_smmu 0x140 0x0>;
>>  				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
>>  
>> -				phys = <&usb_1_hsphy>, <&usb_qmpphy>;
>> +				phys = <&usb_hsphy_1>, <&usb_qmpphy>;
>>  				phy-names = "usb2-phy", "usb3-phy";
>>  
>>  				snps,dis-u1-entry-quirk;
>> -- 
>> 2.34.1


