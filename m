Return-Path: <linux-arm-msm+bounces-77539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A795EBE2918
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 11:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D2E2485B16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 09:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 588B032BF23;
	Thu, 16 Oct 2025 09:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JoUTjwmf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C6731E0EB
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 09:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760608357; cv=none; b=T+5EOEqINU5+66xqKwwo4rzQ6Kq93o0y6kRRixWL14V8PlVVnbL92h07jLmqDasJC7zJ1CwrGyXSXJmHRGZ9frxfI6NwPzl6XN4Qq544FuczAgP3os3HOBu8O7u1AC6kDwxvXoHZFIptmadUMnhBV/PTE94oTlxljA7CeqjWDmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760608357; c=relaxed/simple;
	bh=jE2GoX19eyhmDAzyJNkgxtQN6Hq02Z1VjLQd8iVTPAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gRuniH1UL33kzCWfj2ZPJb8sEjzVmDv79sZJWnZ45HVeoC2eYGFIR3LUZoAYETHPJHcleo0DUftSUzPzDZIHyk2HhzKUjcVEmiovb/bh233V/Q63gIli/01nAwY3T8jIk79sEolwloA7eOKmHeHLZlXW/IzeByVi7QMDJa4zq/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JoUTjwmf; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57b35d221e2so117827e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 02:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760608329; x=1761213129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jn4dZoKK26RuIY2MUwW65nuRqIMdpVV2Qu/kLcTzIEE=;
        b=JoUTjwmfP6jWMtxLJ31VW4DUdqWdZAzEXyHedVQHXPHsvLhmcHEG0yM24AU81jCq/B
         n8mL2ghF4Jv3j9zz4d7Mn0cDsFu5hNthEpWimSV5Cjhkh0Rlu9GQ5vndEzxk7yAt+t/V
         BLvpONm5VTDEF0JCiswwbsJdl8usxQK/A9hBwa9s1zKY+NmU8jXS7lcNZIHnUizeKErv
         LAS3gAD1Jtt1yMmJ8O/lsfTLqctnY2SEwiweOiEPfHmQjn8TdEtNpUE03zRhuY63U4P9
         HPJuXx3etp55tQbclfZVDQIX91ZbroaFSeqAMHqDhdG4J6B0tFXPz+OoASqWYKhQrxKy
         4R+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760608329; x=1761213129;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jn4dZoKK26RuIY2MUwW65nuRqIMdpVV2Qu/kLcTzIEE=;
        b=EXuEqrtrIJxkLypIG8ogUVtibg0+nFS590J+9nFEb0WOOjCaZipVh0SqQfj79nO4ck
         /O1opSLZCUfRqmx0HUzC0BpYz00qDwOL7yzHC15MpkEUur2I+FfR/GlC/22TZyM5k0xo
         vq2FpAxgCttctjmuw4LqrNN34j6usUjUWLpb+fG/Frn4ERiHs6in0cVi4xRVjX7gEdxl
         eUZiXiBtWermaXVSYNEINcfHFxwJmcsT8SI28SioiEcVAhpI5uB97PJvipyPti9HbTPT
         85dwlk0GOIvoGPHbycDkNXznCzzoTLSrEk7ZMCrLy3+6cvhUngJzkpF+rxdzh+hpn5k9
         6bDA==
X-Forwarded-Encrypted: i=1; AJvYcCWdxTRdTelMbDVaph0HrgryOddvNnFxFdkgtP7UvZzW8DT5Kb7G01sJyn+b4HlJySI5HaFeRSq58Zpy13iB@vger.kernel.org
X-Gm-Message-State: AOJu0YwQrSqyEJ6/uLFJHtmg14+NfoXO62N87CYrseHzlh9TVPprj253
	U2ETL0Utmlv7cezsJZCLu38cv1R6NoqD0gMlfnVY7I2dT3la1tKGa3MWEAud+Q3nvQ4=
X-Gm-Gg: ASbGncugeYJoYB+lCkxPyc1YccGCKNK78csl//FyPYUH3QNyC2SKP7Picf1Npgl5K6k
	i8b5RBgjJn3Bdkl7eLrQ3/7r8BXpT4Xmzuq+h8z5/v0KqH+48XUYPHxJ1CRjaJOh2OrstGZdCG6
	Iq8keX1r03iCrQ3Opk8t2QU8CF8K7ar0zkWWeJJkenhMwb+4OLGvfBeyaAaBpI4fSE9MvHWYmpb
	xZIOQoi1vVjU4aIw4PGD4bgd1Xv7TT1uPGfnlgUc39giVbSksgNSkXSTrDCtc0iRcq5gLo0LwE/
	qVzWF7UAp9MkdTGNPr2u2rr6rY3FzFvMDsQyL+94rMS/Vu3hKA0kx+/Rzk/NETiwEFpQYxFYtxS
	QIc2kep/KVmnNNqxNuqGV4LOwy+P7m6pFs7I3RWmE0k7RMi6oBhH+USv3cACbena5FpDODlCP0i
	7AhyZrNY7r0T/ts3lMeOProDsQuOgouw80GLHGa2hSXy1GHBIGtisdPaj0uI8=
X-Google-Smtp-Source: AGHT+IHGrMqF/SxK/b9Eusc1EmuTMX1oF3LiG7gqz6PSDdypVz3evm0d5vIiv9I+NCKFDiLfXQtkSg==
X-Received: by 2002:a05:651c:2224:b0:36c:ebb0:820c with SMTP id 38308e7fff4ca-37609e72b63mr40963831fa.7.1760608328682;
        Thu, 16 Oct 2025 02:52:08 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e77ea1fsm54348501fa.3.2025.10.16.02.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 02:52:08 -0700 (PDT)
Message-ID: <ad05ed96-80fb-448a-a264-f4b4befc5d30@linaro.org>
Date: Thu, 16 Oct 2025 12:52:07 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300: Add support for camss
Content-Language: ru-RU
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, bryan.odonoghue@linaro.org
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
 <20251015130130.2790829-3-quic_vikramsa@quicinc.com>
 <b4207e22-8d9c-4223-8b28-272d2650661f@linaro.org>
 <8966ddaf-9c10-4626-a4cc-36efd3fc93e2@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <8966ddaf-9c10-4626-a4cc-36efd3fc93e2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/25 08:59, Krzysztof Kozlowski wrote:
> On 15/10/2025 20:49, Vladimir Zapolskiy wrote:
>> On 10/15/25 16:01, Vikram Sharma wrote:
>>> Add changes to support the camera subsystem on the QCS8300.
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>>> ---
>>>    arch/arm64/boot/dts/qcom/qcs8300.dtsi | 171 ++++++++++++++++++++++++++
>>>    1 file changed, 171 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>> index 8d78ccac411e..acd475555115 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>> @@ -4769,6 +4769,177 @@ videocc: clock-controller@abf0000 {
>>>    			#power-domain-cells = <1>;
>>>    		};
>>>    
>>> +		camss: isp@ac78000 {
>>> +			compatible = "qcom,qcs8300-camss";
>>> +
>>> +			reg = <0x0 0xac78000 0x0 0x1000>,
>>> +			      <0x0 0xac7a000 0x0 0xf00>,
>>> +			      <0x0 0xac7c000 0x0 0xf00>,
>>> +			      <0x0 0xac84000 0x0 0xf00>,
>>> +			      <0x0 0xac88000 0x0 0xf00>,
>>> +			      <0x0 0xac8c000 0x0 0xf00>,
>>> +			      <0x0 0xac90000 0x0 0xf00>,
>>> +			      <0x0 0xac94000 0x0 0xf00>,
>>> +			      <0x0 0xac9c000 0x0 0x2000>,
>>> +			      <0x0 0xac9e000 0x0 0x2000>,
>>> +			      <0x0 0xaca0000 0x0 0x2000>,
>>> +			      <0x0 0xacac000 0x0 0x400>,
>>> +			      <0x0 0xacad000 0x0 0x400>,
>>> +			      <0x0 0xacae000 0x0 0x400>,
>>> +			      <0x0 0xac4d000 0x0 0xf000>,
>>> +			      <0x0 0xac60000 0x0 0xf000>,
>>> +			      <0x0 0xac85000 0x0 0xd00>,
>>> +			      <0x0 0xac89000 0x0 0xd00>,
>>> +			      <0x0 0xac8d000 0x0 0xd00>,
>>> +			      <0x0 0xac91000 0x0 0xd00>,
>>> +			      <0x0 0xac95000 0x0 0xd00>;
>>> +			reg-names = "csid_wrapper",
>>> +				    "csid0",
>>
>> The list of 'reg-names' is not alphanumerically sorted, this is a newly
>> introduced sorting order pattern of CAMSS 'reg' property values.
> 
> Please stop inventing ad-hoc or fake rules. There is no such sorting
> pattern for this property, which I expressed multiple times. Last time
> you claimed there is some sorting by "values", now this.
> 

The sorting order above does not resemble the order present on other CAMSS
devices, which is the alphanumerical sorting order.

The same order is supposed to be kept.

-- 
Best wishes,
Vladimir

