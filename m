Return-Path: <linux-arm-msm+bounces-76792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D12CBCD61D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 16:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8087719A0444
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 14:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EFA01A9FA8;
	Fri, 10 Oct 2025 14:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K9yGqN8U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F76436124
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 14:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760104980; cv=none; b=pYDfns+3qN7cGZbvaCmtkXOXHzwo0PillkwS9aUrvB966NARYDWoYXDkNVF3S9nHgust8cAbmyyR0HUxy84gBIoL+YjYIScfRbOGr7jjKtL7381XydRtpLszctkLh+Umm8RUuLzyztxBGF9n7w9wLMDFytq5mUy5H2GaJrnzYSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760104980; c=relaxed/simple;
	bh=4596eQnteCsiK8Jrl+1VmFR7tvtvgLUB8LBmX20R1Ng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cI+It46z0fMpK7u6v3gmUUEbYpZ8AFgb1YL5I8Uzvdc3wnJ9Uywt12IXGsqc6N2r4IpG6dtzepmB2EUwLm1ZqgujLDU/SbAb8lu0OgGpOE9YU5jh6keIXPdzeKTQ9LdxBdERNCYognRYxmOpjEJdrV6Vm4y+QhvB2nGVsw3bkfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K9yGqN8U; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-421b93ee372so1128885f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 07:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760104977; x=1760709777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6xvdJs5J8wTljJYaElILA5gjp0FZrWAff697H7+wm88=;
        b=K9yGqN8UD+J5qUTYE4PRh0hNiN5JgoCYQxiFVxWcxYbggs9zQ67BWg2r+/fVVeqU7a
         9+bJtDbAIdUVQcTKDudDyj7o4wgxgidk9RKarX3FXZxGXHzYp1YG8S/6SwwXYzleU5tQ
         Uxn5qX0BeW5LEEZ6h7pH4N9nKyNfmEAnicn33zNXIi1aons4VpQIVheQ5U0tdR8ZXVck
         PYETAsj8Rzrqa4hEYsSjp5dybXo90Zlesm4Ow8UDNl0TYaxmIgfw+ZFDUNResTHRuZPn
         Isl48C8ZK0KyiB6ZMwHIIJeaTux0hCi/xOXQfdxp+jsKfyUgIYyhIr5Oy1xgyE3cA2t3
         tPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760104977; x=1760709777;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6xvdJs5J8wTljJYaElILA5gjp0FZrWAff697H7+wm88=;
        b=L12aMbCyNKPZBqEPLWh41ZJHtpRsiujJNInNLUuT6W+X2oDXjVKfFbDtiAPUITGLnA
         c1IwaHL7IY/ZgC/vfGPvmPR6BP6o306/4Tus26j1LvxvmKGIZ3R3IH4D8UddoqiRDpYQ
         HAjTX6sHcIUUYIC7SKtFSE/pLBQzO704vxn7YxVNctvQQdRS8DKzfU3imCXnUrzEP7c2
         XY7pz43FAPhsrVFTT1Shdn70BTGqXyogrPBrHASC95aOchXOa5q3tNvArWpbj54VDyYb
         qC0fs6jWENYr3Dk1TozU1FbAQKe2vAMdjYFJnI99Wl5feoazwenzY557oYbCdaFtqsmM
         sm8A==
X-Forwarded-Encrypted: i=1; AJvYcCX7LRXwrxvbvRHFy1GrMjk9ar1J0huzUHCiYjT8KSty9A3wD4+nb1kzYGQF1PpMTovDyyTntFxEBsaZ5mio@vger.kernel.org
X-Gm-Message-State: AOJu0YxNKRsUfW/QlbbQHjmKFG3Xkz6XwD9moKzlKlYvUFce8vcqsCnj
	m0P0yV2jiWTOwAP4w1UiqMJgtupoA05UvfzyzDl6b2bzRIOFIQyRqSWlXkCtXQQx6ZY=
X-Gm-Gg: ASbGncujoY5RkYLXzxo2vRShI1id32FF+bIYvSYZnnu9rgJN1Sk/BQBpdY0r3yV/ycp
	0WeRmi+6ea10fmQN8Q/Ejh1/gxieJAaGQQGmHnZT1wHqqB+TDgzTPCswuMXSt5KrN83HijG9pEe
	Nxj8aYTlszCevnD+PXo3eclVpVZFhVnAF+9nDKjeE3DtXpWB16MuaYI53USGgqM80GO7TN5K584
	foLoJbAHP5Xhwhh+Zbb1gT19LogfD54uN4NjK5I7yO7a18ClsDsOSLCU6je59HbzSvEokhz6Ybl
	suEXDhgn6Dohlg6W2dovrVPRSRsbC9XKeUodMGlcFZ3YsdaAjAs0cZCvvEGL4Awez/SS/3oTH9h
	sIQZQp8ETJ78YDqzkOHe6QXTUHn+LBBBXp2RgSKHz6s1mEac2JQ0E
X-Google-Smtp-Source: AGHT+IFMJs1J0ul1z7neVgUHTZq6L9h03M7SqqQgiNU+WjQXX6UWkaj0wdGtXcJAgfu9+uMGHTGV7w==
X-Received: by 2002:a05:6000:41d1:b0:400:6e06:e0ae with SMTP id ffacd0b85a97d-4266e8ddf1bmr8062216f8f.47.1760104976326;
        Fri, 10 Oct 2025 07:02:56 -0700 (PDT)
Received: from [192.168.0.36] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab656554sm60112625e9.11.2025.10.10.07.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 07:02:55 -0700 (PDT)
Message-ID: <f255b8f0-4d9f-44c6-91e1-f706d86f7dba@linaro.org>
Date: Fri, 10 Oct 2025 17:02:54 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/20] arm64: dts: qcom: kaanapali-mtp: Enable more
 features
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-14-3fdbc4b9e1b1@oss.qualcomm.com>
 <588a7b68-2e2e-4e65-9249-fe8b18b67927@linaro.org>
 <831f6fd7-b81f-4d6f-b9bd-5a8fe514befb@oss.qualcomm.com>
 <0c9ca026-9986-4347-a86d-8bf65e2d12e6@linaro.org>
 <kocj7sf6jgj4uynvlxvbsojc4bykyj2ipb4ex56fagjqoxwcie@2trytltkhd4a>
 <dd4d4fa3-abd4-476f-a37e-c44cb6c83fb0@oss.qualcomm.com>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <dd4d4fa3-abd4-476f-a37e-c44cb6c83fb0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/10/25 13:54, Jishnu Prakash wrote:
> Hi Dmitry and Eugen,
> 
> On 10/9/2025 9:58 PM, Dmitry Baryshkov wrote:
>> On Thu, Oct 09, 2025 at 05:58:03PM +0300, Eugen Hristev wrote:
>>>
>>>
>>> On 10/9/25 16:54, Jishnu Prakash wrote:
>>>> Hi Eugen,
>>>>
>>>> On 9/25/2025 1:33 PM, Eugen Hristev wrote:
>>>>>
>>>>>
>>>>> On 9/25/25 03:17, Jingyi Wang wrote:
>>>>>> Enable more features on Kaanapali MTP boards including PMIC peripherals,
>>>>>> bus, SDHCI, remoteprocs, USB, PCIE, WLAN and Bluetooth.
>>>>>>
>>>>>> Written with help from Jyothi Kumar Seerapu(added bus), Ronak Raheja
>>>>>> (added USB), Manish Pandey(added SDHCI), Jishnu Prakash(added PMIC),
>>>>>> Qiang Yu(added PCIE), Yijie Yang(Added WLAN) and Zijun Hu(Added Bluetooth).
>>>>>>
>>>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 663 +++++++++++++++++++++++++++++
>>>>>>  1 file changed, 663 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
>>>>>> index 9cf3158e2712..2949579481a9 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
>>>>>> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
>>>>>> @@ -5,9 +5,23 @@
>>>>>>  
>>>>
>>>> ...
>>>>
>>>>>> +
>>>>>> +&spmi_bus1 {
>>>>>> +	pmd8028: pmic@4 {
>>>>>> +		compatible = "qcom,pmd8028", "qcom,spmi-pmic";
>>>>>> +		reg = <0x4 SPMI_USID>;
>>>>>> +		#address-cells = <1>;
>>>>>> +		#size-cells = <0>;
>>>>>> +
>>>>>> +		pmd8028_temp_alarm: temp-alarm@a00 {
>>>>>> +			compatible = "qcom,spmi-temp-alarm";
>>>>>> +			reg = <0xa00>;
>>>>>> +			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
>>>>>> +			#thermal-sensor-cells = <0>;
>>>>>> +		};
>>>>>> +
>>>>>> +		pmd8028_gpios: gpio@8800 {
>>>>>> +			compatible = "qcom,pmd8028-gpio", "qcom,spmi-gpio";
>>>>>> +			reg = <0x8800>;
>>>>>> +			gpio-controller;
>>>>>> +			gpio-ranges = <&pmd8028_gpios 0 0 4>;
>>>>>> +			#gpio-cells = <2>;
>>>>>> +			interrupt-controller;
>>>>>> +			#interrupt-cells = <2>;
>>>>>> +		};
>>>>>> +	};
>>>>>> +
>>>>>> +	pmih0108: pmic@7 {
>>>>>> +		compatible = "qcom,pmih0108", "qcom,spmi-pmic";
>>>>>> +		reg = <0x7 SPMI_USID>;
>>>>>> +		#address-cells = <1>;
>>>>>> +		#size-cells = <0>;
>>>>>> +
>>>>>> +		pmih0108_temp_alarm: temp-alarm@a00 {
>>>>>> +			compatible = "qcom,spmi-temp-alarm";
>>>>>> +			reg = <0xa00>;
>>>>>> +			interrupts = <0x7 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
>>>>>> +			#thermal-sensor-cells = <0>;
>>>>>> +		};
>>>>>> +
>>>>>> +		pmih0108_gpios: gpio@8800 {
>>>>>> +			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
>>>>>> +			reg = <0x8800>;
>>>>>> +			gpio-controller;
>>>>>> +			gpio-ranges = <&pmih0108_gpios 0 0 18>;
>>>>>> +			#gpio-cells = <2>;
>>>>>> +			interrupt-controller;
>>>>>> +			#interrupt-cells = <2>;
>>>>>> +		};
>>>>>> +
>>>>>> +		pmih0108_eusb2_repeater: phy@fd00 {
>>>>>> +			compatible = "qcom,pm8550b-eusb2-repeater";
>>>>>> +			reg = <0xfd00>;
>>>>>> +			#phy-cells = <0>;
>>>>>> +			vdd18-supply = <&vreg_l15b_1p8>;
>>>>>> +			vdd3-supply = <&vreg_l5b_3p1>;
>>>>>> +		};
>>>>>> +	};
>>>>>> +
>>>>>> +	pmr735d: pmic@a {
>>>>>
>>>>> Hi,
>>>>>
>>>>> The PMR735D is available in pmr735d_a.dtsi
>>>>>
>>>>> Can we find a way to reuse that include file instead of duplicating it
>>>>> here ?
>>>>
>>>> In pmr735d_a.dtsi, the peripherals are added under the parent phandle
>>>> "spmi_bus", which was commonly used in older SoCs having only a single
>>>> bus under the PMIC arbiter, but in Kaanapali, there are two buses
>>>> present under the PMIC arbiter, with phandles "spmi_bus0" and "spmi_bus1",
>>>> so we cannot include the file as it is.
>>>>
>>>
>>> I know the problem. I disagree with using include files in one case, and
>>> having the PMIC in the dts in the other case.
>>>
>>> So there has to be a unified way to handle this in all cases.
>>
>> Rework SPMI PMICs to follow the approach started by Johan for PM8008. I
>> think this is the way to go.
>>
> 
> We got a recommendation from Krzysztof recently here for Glymur: 
> https://lore.kernel.org/all/b784387b-5744-422e-92f5-3d575a24d01c@kernel.org/
> 
> For PMH0110, he suggested we could keep different DTSI files per SoC,
> like pmh0110-kaanapali.dtsi and pmh0110-glymur.dtsi.
> 
> We could follow a similar approach on Kaanapali, to 
> #include the following files in the .dts file:
> 
> pmk8850.dtsi
> pmh0101.dtsi
> pmh0110-kaanapali.dtsi
> pmh0104-kaanapali.dtsi
> pmd8028-kaanapali.dtsi
> pmih0108-kaanapali.dtsi
> pmr735d-kaanapali.dtsi
> pm8010-kaanapali.dtsi
> 
> The first two files are new and common with Glymur,so they
> do not have the SoC name suffix.
> 
> Hope this is fine, please let us know if you see any issue.

I would like it to be consistent, you would have to rename the old
pmr735d.dtsi into pmr735d-whatever-soc-was-using-it.dtsi in another
patch, and then create pmr735d-kaanpali.dtsi for kaanapali.

Does this look good ?
> 
> Thanks,
> Jishnu
> 


