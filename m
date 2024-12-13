Return-Path: <linux-arm-msm+bounces-42069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6108F9F1052
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21166167DE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 15:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 201281E2312;
	Fri, 13 Dec 2024 15:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qta2E2mC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C7D1E2610
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 15:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734102385; cv=none; b=DfigWO7EmF6TFQakmte0KPMYUM66XMon64IVLhz59bgjmdCEkZqtrGxfKZQcUTVwghaeFBENdw19ng5y3+Z+LGQdMuROtd5r0XOLq79TTCK/8hfokX/1VOSGnDc1S/D2u9QPUPn9o6c9jQ9t0QAHxatqev/YIZMIoab1KAMNCzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734102385; c=relaxed/simple;
	bh=Mp8ly+92tHhX9bINbhqBS7p1g6kEmZGRyekJJGPkV+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GL6mRIqGXv+zJS6BX2Jdec4ZFOBCJTHh8HfCEl15gCzKdbNKaR8ZAcS30wq5LXUA0uQ1mq9OiAn49cg2M/tIMF2FvYVBezL7ejLOh2bJdKSDmn+V79aqKYseK7Ee5+sZw+TnNntNTEyHldrWbW8rZ88htHhap7ZwBwqQwCZL4cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qta2E2mC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434f398a171so1490235e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 07:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734102381; x=1734707181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vQHrBRNfCrfEiTBdvaenQLp23UktnaRFICWPYIL4wTE=;
        b=Qta2E2mCSid5FVi+ASKjRtqcQn+UOzV4G+8F6OxZchI6vAb8VdWHZPpev79UymXrsB
         ficyB0uuRvTs70TYUsRnTmGzS8Hi+FGWyqXSEag9bpQwIHz5lgsBA5EYWPNjjQMt2feV
         XUqnonsH92a8Jc+kdDQucOWEfYZyDia/0GWG2vPKY7ORwSbxvkDuVK6SROAXwfhk3ftc
         /DJqiv2DyxyksswVsty3aOcvOwIxEjzYtasVW4rPQ2Be50byc/cMArE3YHFyFuN6DPOi
         uO7fBSjK6yxxmvqAWjo2E+kYdM7sCY7yBZEgFIR8yZ2VdU2CHsKzlg5dFhLvaKaKa+7S
         VV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734102381; x=1734707181;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQHrBRNfCrfEiTBdvaenQLp23UktnaRFICWPYIL4wTE=;
        b=aGcgGRAPvMBf9AmAbdcung0FHk4IA8fF8URFSqnVOgkNUORgPzk0BxQEWcUzcLFLCh
         L/dBUakmPhNwLpvGnVgZQh21Ok2Zw7nThCHrtJD8SC2YTtAaZkfCtyz6Mv4mX+Ew9fEh
         VYlDJBmJEH4VhUDPmYMUwosIkopxf9XtLASZgKW0uslm83GIOxpCb0DBNUoUH8uqB5CE
         cgzXLNzJpqMZYaIexrCblkNeXTyTN9Zx0PmUqWYYoQSRokpqE5IDcuX4mgMn5cE0bIKy
         RmwSWZnCaB07UgbWCFfnJYD3jEhKqb1CMlopptx/EMO8mhjF2iNVMDXXBr5wU/bwpBC+
         oJdQ==
X-Gm-Message-State: AOJu0Yz127NK4LQ2xEWLQZazquF8eyM3bQ46XRU0WmqZUBWqDZbmgtsh
	5Rgc47r01EnRIawe111sWxGr6gUhW6MMUH6NhFmTgM88Ed10hyZrvUlrcsqypixu0LPibquq06v
	a
X-Gm-Gg: ASbGncvGP+AfwLGEYFwHkBelY6232axkmVFPSaesLn9IotRSY6Y+YUuM9zUC5nI2MkZ
	N9m2RONuglihNoIfXCHHG1jSZV/MZEMnFS9AtP/BeKbb14JEOD65QWQOodDe8FOFColry6pjiwR
	ejDA/n+dVAcGlFC9KznaL0HXyGpspizOcNqXUXkAGYd8xDxHALIWgVFxI7wHCW5Ey+/4jpFvp2q
	BRZ4VZnUo39WzTcz7b6e4a7AhrfuCa12gr6lawlVX8P6WaStHQOTChOLg80G4DVDLJ118Oz6np1
X-Google-Smtp-Source: AGHT+IE8TpCm9vjzXksrBnmibnIyaWJmXSKT6P98gggIT45TO3vJaV+jrWbqeaTjXtiHx7eAGPNwzw==
X-Received: by 2002:a05:600c:154b:b0:434:9cb7:7321 with SMTP id 5b1f17b1804b1-4362aa10a0dmr9711865e9.1.1734102379177;
        Fri, 13 Dec 2024 07:06:19 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514e6asm7405763f8f.79.2024.12.13.07.06.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 07:06:18 -0800 (PST)
Message-ID: <d7a89a5d-cb70-4d05-bb3c-9f4808984175@linaro.org>
Date: Fri, 13 Dec 2024 16:06:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/23] arm64: dts: qcom: sdx75: Fix MPSS memory length
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Abel Vesa
 <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
 <20241213-dts-qcom-cdsp-mpss-base-address-v3-20-2e0036fccd8d@linaro.org>
 <9a7f43fd-a720-481e-b8ca-68150c202b74@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <9a7f43fd-a720-481e-b8ca-68150c202b74@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/12/2024 15:56, Konrad Dybcio wrote:
> On 13.12.2024 3:54 PM, Krzysztof Kozlowski wrote:
>> The address space in MPSS/Modem PAS (Peripheral Authentication Service)
>> remoteproc node should point to the QDSP PUB address space
>> (QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x4040 was
>> copied from older DTS, but it grew since then.
>>
>> This should have no functional impact on Linux users, because PAS loader
>> does not use this address space at all.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 41c72f36b286 ("arm64: dts: qcom: sdx75: Add remoteproc node")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Changes in v3:
>> New patch
>> ---
>>  arch/arm64/boot/dts/qcom/sdx75.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
>> index 5f7e59ecf1ca6298cb252ee0654bc7eaeefbd303..a7cb6bacc4ad5551486d2ded930c1a256d27655e 100644
>> --- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
>> @@ -893,7 +893,7 @@ tcsr: syscon@1fc0000 {
>>  
>>  		remoteproc_mpss: remoteproc@4080000 {
>>  			compatible = "qcom,sdx75-mpss-pas";
>> -			reg = <0 0x04080000 0 0x4040>;
>> +			reg = <0 0x04080000 0 0x10000>;
> 
> I think this should be 0x04400000 instead


There are two QDSP6SS blocks - one at 0x0408_0000 and other you mention
at 0x0440_0000 (MSS_VQ6). I think in all other DTS, e.g. SM8550, we
describe the first, so 0x0408.

Best regards,
Krzysztof

