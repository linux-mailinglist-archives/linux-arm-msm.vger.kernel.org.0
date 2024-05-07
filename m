Return-Path: <linux-arm-msm+bounces-19305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C3B8BE0A8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 13:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F47F2864AA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 11:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F8D1509A5;
	Tue,  7 May 2024 11:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DjbvWXXS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F23414EC7E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 11:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715080022; cv=none; b=KwGGNwa4sSRwhaOELyZxdxOE58wBM+3xQEbobVS73P+4OzT2lpRQhggNYiPt36f6LIkC8Dvu8VCOLMdaAmpMgYVIYVBJ2wG1BPIuh3HLS3h7rqeAETp4N//ytRC14IhlZIxWQAOlSolMtRJbGVbh3nt3YonVtrIjHzZftV7YGo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715080022; c=relaxed/simple;
	bh=0wthStaM0L1IEMjidKAObMHjHCckB8nsQgt387187UE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W4pM2RjCz0HrgD3vQ8SAfypygVJOrak36iLhAfsI6lR4zgc1fUPOC3ISHYgiqe87tGkex9IAnhxCUFcJAw0KqkBpQSkHm5/m6gBreyw1igHPltW/ZQ46rFhicAbqdLmyvcIO4RcZT9yaQiaUQcYPAWfm8LtTP4w8S9zgllzbMpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DjbvWXXS; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e3b1b6e9d1so15461341fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 04:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715080018; x=1715684818; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vu3E57enROBhkqZ25vaLZg3w8R1eCilIpWi4uX7bS5I=;
        b=DjbvWXXSHAEEzyvHkXXH/E7lcMDOaq9rKhpNeikRSahjxHmcdpE+aZbSTZRFd0Hh2x
         W2BIQOkswQRIsP5zr5Cq5dY0lOO4et3Wau+e6qL6iwn3eOwPK7FytbFKHmUGamT4FGiV
         E1WKBrj/N35fgoYt4ycwNW9UK8WKvgGfjMjT3ugrWPM+O93DJi8+YGRQKzA+HfKfF1fq
         rbRWkb4/w+wyTDEyRZPdfCDJO/HXep8UNfUtK1L7O+AXgzBXMQeqiBZqEWpwWruZr+kH
         TW0wVCt/fQiC0nZIjweWbrOmLIgyYSKyNIwq8cOVET077Q0BgQCdMisKFdFWjQDPqY92
         W9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715080018; x=1715684818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vu3E57enROBhkqZ25vaLZg3w8R1eCilIpWi4uX7bS5I=;
        b=ubEBitw7cH90Yyu+hwlD0dov0XQIJdMlKpNxwwiMPHoDH0VafVgy4ne9/xUg/g65/K
         jyS/wB0uGfzvZr+ZZ3wJ7B8QEorIloJ1uyv/ERQbaIgUWfR7tzK3mDgvztyh9p0S1qID
         Z1EO2UbcoDMFShNGW8cG2v301l9hwA7rJqs2yds+C3QOVo/VBfJPhHOcNoahTpHT4GNb
         7rzniDgTRyt9FOfioFI/rjDUCMDknEEaN0pmwr4R9+v0Vohf0jtbvZFirjCVPqBt4V2l
         hRjH7bvlE1yd972h2Uju+olCYa2c0AHtjtKpYgLa8QCkiYt3tOjLxMVK3t64EbkBwzEt
         52AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCEtTWloAXrWQnqXrP4RzGRhc0caph+d4Do8ZlHKOrrygbKVFiIGYM7/5iTWQsZkejl0AN39ytdH7B3pKjVxCzV8881kYlVoxb66SSoA==
X-Gm-Message-State: AOJu0YwBNPnmQrgJJhF2m2Q0AMwuIxKavQvroCEQGC2opiEmLoG3KQNA
	87UAEA+KrX+jZuyYKdRgJi16otq6vLRskGH7SwlFVcPOElCf/TuF9BAtWcKjn/s=
X-Google-Smtp-Source: AGHT+IExp0qXNrJyw996e89disi8phPXmFYED+G9fNF42W0b5gF5pUVkJQl64hC5epdp7ic0/3TADw==
X-Received: by 2002:a2e:9153:0:b0:2da:15cf:1e23 with SMTP id q19-20020a2e9153000000b002da15cf1e23mr7938406ljg.17.1715080018522;
        Tue, 07 May 2024 04:06:58 -0700 (PDT)
Received: from [172.30.205.144] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id e3-20020a2e9e03000000b002d6daf3b41fsm1906226ljk.101.2024.05.07.04.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 04:06:57 -0700 (PDT)
Message-ID: <e1d66d4a-baf7-4f17-b214-be7e7432f53c@linaro.org>
Date: Tue, 7 May 2024 13:06:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8998: set
 qcom,no-msa-ready-indicator for wifi
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k <ath10k@lists.infradead.org>
Cc: wireless <linux-wireless@vger.kernel.org>, DT
 <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
References: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
 <0914f96e-fcfd-4088-924a-fc1991bce75f@freebox.fr>
 <02592b09-8ab5-42ab-bd6b-6db79722d708@freebox.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <02592b09-8ab5-42ab-bd6b-6db79722d708@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/6/24 12:39, Marc Gonzalez wrote:
> On 29/04/2024 16:07, Marc Gonzalez wrote:
> 
>> The ath10k driver waits for an "MSA_READY" indicator
>> to complete initialization. If the indicator is not
>> received, then the device remains unusable.
>>
>> cf. ath10k_qmi_driver_event_work()
>>
>> Several msm8998-based devices are affected by this issue.
>> Oddly, it seems safe to NOT wait for the indicator, and
>> proceed immediately when QMI_EVENT_SERVER_ARRIVE.
>>
>> Jeff Johnson wrote:
>>
>>    The feedback I received was "it might be ok to change all ath10k qmi
>>    to skip waiting for msa_ready", and it was pointed out that ath11k
>>    (and ath12k) do not wait for it.
>>
>>    However with so many deployed devices, "might be ok" isn't a strong
>>    argument for changing the default behavior.
>>
>> cf. also
>> https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_835_(MSM8998)#WLAN
>>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
>>   arch/arm64/boot/dts/qcom/msm8998.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> index 67b8374ddf02f..4e6245095adfc 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> @@ -3234,6 +3234,7 @@ wifi: wifi@18800000 {
>>   			iommus = <&anoc2_smmu 0x1900>,
>>   				 <&anoc2_smmu 0x1901>;
>>   			qcom,snoc-host-cap-8bit-quirk;
>> +			qcom,no-msa-ready-indicator;
>>   		};
>>   	};
>>   };
> 
> 
> Bjorn,
> 
> This patch is supposed to go through your tree, right?

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

