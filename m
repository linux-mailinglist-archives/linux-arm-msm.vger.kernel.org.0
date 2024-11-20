Return-Path: <linux-arm-msm+bounces-38493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1DF9D3AC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 13:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 334F0283409
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 12:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C1E1A3BAD;
	Wed, 20 Nov 2024 12:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eqs2hFtD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3E51A0BEC
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 12:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732106310; cv=none; b=UuN+QF9J/HqhUJoTGNOKwMKF9G3s7FKBh4kI7UCHyoE9qE3WT9Ff1ko911KFtThIJ7XXH7zFuScbGhThYxYOrXEY5masAko0LJ5ZUMAhBEkfQSxgaIWFUBBASwoBpkVaxnBD8qbX1sSYwaf7seYNx2stPk+xhJc2+8S/Bn6RImE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732106310; c=relaxed/simple;
	bh=T1SHhS5gSBi3f2Ap4tHWCiN3xBm5XNZaeGss3DVKBDY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VdcQmm0ct55BgLPcLqkYB+uuc1KOi05dEAi03Ju5QChcA7Q6v/uYIguKpIIyDI3sxy1KlaJ9+7XQxJ10D0UkvHkOdkhMtpFm/vtt4IR8sP5j3v0/QGG1dsax8iWggjH58dslAmjYWgEfnIExLLxeOCLvrkIzknKNsF3jAYHp6tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eqs2hFtD; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53da3545908so4999990e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 04:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732106307; x=1732711107; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcUEOpFKPbKPpXUIzJ5sVKWN691GW1SaJnZt3c54KG0=;
        b=eqs2hFtD1NXa08JLrxuTdUnrV19/JgL7RLd96Azc9bHuuKn00lPDwiOUr+d3zPRHlk
         d2c+k65DszUP2tm5/YQ5WoRaoJQsOQZ6/A1cWm71W+8Ol3ohkqOe9Drl24jGppiKuR+I
         k6iDR+aX9pSIQT3Gs9UIZrERNoch8n5BfUnH3O02VTdnnzOW7YK+UYE4V9sr2IdzuGOY
         u48hPqX3ZJTKwVc3J+9TUMIOH6Skq8m/STDM9GmiEuRoKmPUGtEczVspimFfHp7atnUh
         4Y/A/RMFlkwHAwMSBOCXhe0G23+wKNmFjZCLX96GUHrw7zawVPmocNi/osqTg8j1M2Gn
         EKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732106307; x=1732711107;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LcUEOpFKPbKPpXUIzJ5sVKWN691GW1SaJnZt3c54KG0=;
        b=f/+qZpFxbuW5eMSGS6G06W8zgTHYroMPXjY9YKXiaDESgnEdcmji+77ScCLPqhS+0L
         pr3EieJR5lwFUDg37vj3S4PAnSoM8KDqx8d413BTGqXAgV+utw/Hv/lICiNqeez1agox
         F0F/cmhM1D3UZ566mJyp1QDFPcKCJaRE4znAOYS1SwkVLdWy/lgKVWpL0W/kZqKEKFuZ
         9pRjQbE/6xCTB1TGa7GWYseWAzgcmUfXYiNCEWdeg73S9CW9zmha+qCEh5f+HErIpak1
         9A8SriMKUYGO7ZnqxYgZtcXcEsThDhfYTs1neET/T39lyZwluzamAxilR7qeOu155hYY
         yauA==
X-Forwarded-Encrypted: i=1; AJvYcCX0WSKCj+9VTyqEVEddbFNAWIBXcmTMgpSBIRq4IroHZbdW9RUrYrfFrilIRS6cSs27fJkJztuJGD6nnt90@vger.kernel.org
X-Gm-Message-State: AOJu0YzE9kn0s4a+5sN5sutRXoR+rV8E0FahVVjJjYToWppwugGiT9md
	gOtXfhY55D4igrUd762iV7FjRqMN8Upt6cLgDdAJ3z04SRUh3lfx+O9V9ZeWaj8=
X-Google-Smtp-Source: AGHT+IET0Zw1GUg8juWJTYxh5Mnsf3Wkht9UNm0mLBOVYbwCAwfJ4/8EQhMft+wrL/1dot2VgyvChA==
X-Received: by 2002:a05:6512:b8e:b0:538:9e40:94b with SMTP id 2adb3069b0e04-53dc13384aemr1066848e87.19.1732106306977;
        Wed, 20 Nov 2024 04:38:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:927b:2848:1f7d:3776? ([2a01:e0a:982:cbb0:927b:2848:1f7d:3776])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd4783c1sm626248e87.239.2024.11.20.04.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 04:38:25 -0800 (PST)
Message-ID: <14583b16-776f-46ca-85fb-c1d151a72781@linaro.org>
Date: Wed, 20 Nov 2024 13:38:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 10/11] arm64: qcom: dts: sm8550: add interconnect and
 opp-peak-kBps for GPU
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-10-4deb87be2498@linaro.org>
 <ctx4ajfhrpu43scq7momrx6lhel6c5sk43yjtvowv25ur6swzh@igo7gofc4lpg>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <ctx4ajfhrpu43scq7momrx6lhel6c5sk43yjtvowv25ur6swzh@igo7gofc4lpg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/2024 12:47, Dmitry Baryshkov wrote:
> On Tue, Nov 19, 2024 at 06:56:45PM +0100, Neil Armstrong wrote:
>> Each GPU OPP requires a specific peak DDR bandwidth, let's add
>> those to each OPP and also the related interconnect path.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index 9dc0ee3eb98f8711e01934e47331b99e3bb73682..808dce3a624197d38222f53fffa280e63088c1c1 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -2113,6 +2113,9 @@ gpu: gpu@3d00000 {
>>   			qcom,gmu = <&gmu>;
>>   			#cooling-cells = <2>;
>>   
>> +			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
> 
> QCOM_ICC_TAG_ALWAYS

Exact, bad copy paste...

Thanks,
Neil

> 
>> +			interconnect-names = "gfx-mem";
>> +
>>   			status = "disabled";
>>   
>>   			zap-shader {
>> @@ -2126,41 +2129,49 @@ gpu_opp_table: opp-table {
>>   				opp-680000000 {
>>   					opp-hz = /bits/ 64 <680000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>> +					opp-peak-kBps = <16500000>;
>>   				};
>>   
>>   				opp-615000000 {
>>   					opp-hz = /bits/ 64 <615000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
>> +					opp-peak-kBps = <16500000>;
>>   				};
>>   
>>   				opp-550000000 {
>>   					opp-hz = /bits/ 64 <550000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
>> +					opp-peak-kBps = <12449218>;
>>   				};
>>   
>>   				opp-475000000 {
>>   					opp-hz = /bits/ 64 <475000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
>> +					opp-peak-kBps = <8171875>;
>>   				};
>>   
>>   				opp-401000000 {
>>   					opp-hz = /bits/ 64 <401000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
>> +					opp-peak-kBps = <6671875>;
>>   				};
>>   
>>   				opp-348000000 {
>>   					opp-hz = /bits/ 64 <348000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
>> +					opp-peak-kBps = <6074218>;
>>   				};
>>   
>>   				opp-295000000 {
>>   					opp-hz = /bits/ 64 <295000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
>> +					opp-peak-kBps = <6074218>;
>>   				};
>>   
>>   				opp-220000000 {
>>   					opp-hz = /bits/ 64 <220000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
>> +					opp-peak-kBps = <6074218>;
>>   				};
>>   			};
>>   		};
>>
>> -- 
>> 2.34.1
>>
> 


