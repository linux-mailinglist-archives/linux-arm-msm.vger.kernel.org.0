Return-Path: <linux-arm-msm+bounces-50126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2AAA4D666
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 09:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FE3F3AB852
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 08:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED471FC7D6;
	Tue,  4 Mar 2025 08:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oLStp+Cy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD8A1FBE86
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 08:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077030; cv=none; b=LYO+WKqPLHMchxCfCS+dqdZJxoTHOmVt1xsH+gaLyr0MJe7M2gDtKYmfE9+284h7WiORijjoauKbPBj6wGSyL+Jms3XKb9P4kahuC1PqHQBEV/I7vATePTMz3MO8VOu4XJhz5wvfb4Va2h88gc0EHJk39XHLHE/Pf7G52mg00Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077030; c=relaxed/simple;
	bh=R7n1fGRKBqdjYD7qjAK0e0Z/E3j53RSIm1oESRXE5hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ODXxGn5EziZByO8IelAJX3iQAoYz0asOzRr447oZ4vqh0j2fcZj8S32Gs/426jrVgtn+ZVD3AKh+BN7GRWvZFLuPUWOO7IU0RsXl9M2RPMwlZMfjf3xjf8YsNuRgVjeuwhcOApYvryNRYfLQfyzjs0obJWadyAhfi9tgl/bEkdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oLStp+Cy; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5495ba7ad81so229511e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 00:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741077027; x=1741681827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=exz8dJdGpu0keF2ocUHooEu3xVfMKLaveroqXRkMjFE=;
        b=oLStp+CyBpwi9PjekiWbpLhpJPiLNfBqQ7Xg7S2uBN0Nj+Rg1yRwihTXifdbumzjjv
         td1RbEZtpyK1kYB7+axVkK542Xz7uGPQVl21+WOX/JQ37efVLRmk+KSb/3OkmMunqDRI
         FeGo1oHZ4EmCyvOQX/4EhyDosAl5sAspNqU5SU8vgdTp3uwA72/qVVjMDnRtsp1Z6Tua
         xK0u4OgpgrPfSR0slVvnoK+LfsLO/C8bmbEVUgbZgCr6XTneFf4nLfyU0//OnxAj8FDp
         47jixILWSZFXZvibp5+EzbS42PIf7iALJhsjXp3mJuORpj/t5wn3OcP7Ho/uz0qHBniu
         p9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077027; x=1741681827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=exz8dJdGpu0keF2ocUHooEu3xVfMKLaveroqXRkMjFE=;
        b=HVYnFjKUM6AZ3sKMiYbrvYM2/qMNAKitxIEnHO1D7RQiGNvt1KWLxOA16y4rAobnce
         slu88yMENwY03Mrx7nmCypJHs5itFd0x5Xgy5uLgeH1rL3PqBxjZZFYj5saz1s8y5bFS
         b+XbC2sp85pBQtkjjQpy4B3BTdw5UooNyDvzDqPk3kDxbI0fOMn3r5F2IP3ttnCBJVJj
         k0zIcmsFZ0l1qkD3Xz3q8HBru07M/qrjWVICUvWwWpBKL1q4F6yeZyw/8xrUj2n23xYW
         G2pz187Ve3wOsEcF/DXntdbU+lWoBe9fzcdicQuLj4vxztE8ck3a7V3RoizEvD39mmlI
         lmjw==
X-Forwarded-Encrypted: i=1; AJvYcCVdtc0FYdEGCA+bW68NzkdIm51Oy9Lofw7lQaSc5PVrhj46jwbSsVHXMh6NdllRkMrLtkfVFl4mdIdjW8qe@vger.kernel.org
X-Gm-Message-State: AOJu0Yysr0W2TrEy6DJkgkDLf7ApwHRDs3ppC1q9FejklaGPsiQBFJvV
	h1bvBd3KSVWrT7of5GGlTQ2gofNyZ3SI885LFud/IIyYngPXcWHfZR30KXUyfgU=
X-Gm-Gg: ASbGncvRghn6FpgV5usMoHjKT6Ef3/MZ16W2/rMpN3Zz7vv1Kp5GLG9YzNhFu8tWQVB
	bv/X91p3j8rlO4TU6imK50VyYM/X3vB1o10JswwOtXa4uNpyp2pcBucusRQzn709+amOMmfq5DI
	3dXo+/2P5vLlh256avcCgWQ3iRsaHQADemaeGPc37Vmg03gOVb+AVAnEw0bR7RBLAsHWVOHP9u7
	l4ijY0pWciyUt8W/E1UPHUl2MVfWpydkwdxPHlHCIoT2isdtXIYu8fvxDAlvyTVoouTUojgDuxK
	ba/L8snBVyRncucQMo+HpIfm6AixkZjey8gbsnRCokWl9rNpx8wF5+egrsDQiHOhHdjXpiF8r78
	NhX8XaHm5R9Dm2g2j43b9LbU=
X-Google-Smtp-Source: AGHT+IEGXHdD67orThjoh+EdcaW0STtZkWcUjMqYIynw/oUS1Hi87oaWacTmj0dkEiU9M/5UUH0QdQ==
X-Received: by 2002:ac2:5492:0:b0:549:5769:6af5 with SMTP id 2adb3069b0e04-54957696de8mr1360664e87.6.1741077026829;
        Tue, 04 Mar 2025 00:30:26 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494e52a47asm1295952e87.152.2025.03.04.00.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 00:30:25 -0800 (PST)
Message-ID: <2e6a0c7e-9c24-42fb-be9a-2b73da8dc69b@linaro.org>
Date: Tue, 4 Mar 2025 10:30:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
Content-Language: ru-RU
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 3/4/25 01:53, Dmitry Baryshkov wrote:
> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote:
>> SM8550 Camera Clock Controller shall enable both MXC and MMCX power
>> domains.
> 
> Are those really required to access the registers of the cammcc? Or is
> one of those (MXC?) required to setup PLLs? Also, is this applicable
> only to sm8550 or to other similar clock controllers?

as it is stated in the cover letter, both power domans shall be on
to access CCI or CAMSS.

>>
>> Fixes: e271b59e39a6f ("arm64: dts: qcom: sm8550: Add camera clock controller")
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index d02d80d731b9..d22b1753d521 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -3329,7 +3329,8 @@ camcc: clock-controller@ade0000 {
>>   				 <&bi_tcxo_div2>,
>>   				 <&bi_tcxo_ao_div2>,
>>   				 <&sleep_clk>;
>> -			power-domains = <&rpmhpd SM8550_MMCX>;
>> +			power-domains = <&rpmhpd SM8550_MXC>,
>> +					<&rpmhpd SM8550_MMCX>;
>>   			required-opps = <&rpmhpd_opp_low_svs>;
>>   			#clock-cells = <1>;
>>   			#reset-cells = <1>;
>> -- 
>> 2.43.0
>>
> 

--
Best wishes,
Vladimir

