Return-Path: <linux-arm-msm+bounces-46508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0DCA21DF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 14:39:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CA2E165C02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 13:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9698C13D51E;
	Wed, 29 Jan 2025 13:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U4u/oFdO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D29086250
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 13:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738157965; cv=none; b=DcTk6NNaPN7ZldOQQSe5aBKcpi/ZNg/GukUmpH7QyNy0qFxlYrF1Pl0GU7JDeJFo1tO8CxPDuSZRGa5oOMr/cJXou/aC1GXom/y8Oj5Y3R5LxwmAuaufesgP0eSDUQXvKTTxtzTdSWc8LF/CJKuKgr2MEi1xx4TQFJP7qrJ4hU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738157965; c=relaxed/simple;
	bh=CDcRRXN0ifiuQSEQoQDUdUPg9kOvhCH+/uhLp/TkVuI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jD7vxoxbZPjFZxqoxUZMQKcn2oO5exfOVxFPedQ6NR6KVJpQCccpFAD95gD1Jxfj0gqDokOAlVAAWqgBLF+1raQA61laNz3TXiKgPLk7PDs/26j3R9Iujm+09/NJIdsZwRJ0dXWqo7m9LtH5nzHTc8Ee8i4mHym/Ki+kHP5sc7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U4u/oFdO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43634b570c1so48912285e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 05:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738157962; x=1738762762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+K0sidwnuxavvy1AkJKNcWdrNuKvpIiQ4qgOISO6jE=;
        b=U4u/oFdOcU3ycHMXhF9GP21Cx82wSVvJQVoRDBMAhyFSOmJLIL40dhZZlVMLrwZWfV
         OHxxNp/MYmQaLQIRQ/tXK3hvkWxC4b6zfbLqoOG7KP9IN4p7PWc4ThKGTwRqAdNlDoyo
         25XVLJiapWWyFcHnXNfVxHGF/ZhdUCUXPj6hfsQYB0YkosxX4PrMPMrCvSgGc+tRrGBa
         Ci2H1X0e+wWYrOI+hPfRTnjugZVYqxVDOrBqG1fcLW5s1JYKaM7ETur3NJnRYdZQjHGR
         0ymbm5TRHoP4fJtSzRAm2Qz0XH6aVJeLCq5YptiCNLlcuRJg+KAI6RRJxsunM0xRjRAc
         3pRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738157962; x=1738762762;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y+K0sidwnuxavvy1AkJKNcWdrNuKvpIiQ4qgOISO6jE=;
        b=FBkw+9mS6RHbLs+CAjTVMMfPOicrEV7wwXDoth21UUlQnYaJ73+kyNhYIYVHQC0RBI
         3pN//3aecYMsti5lDDMX4SroN83yCtc2wNORr0cZg64Iqprls5LOza+/wimxZMrMv9l2
         qDF4dtKBFMtMc5EA3gnqqd37frsc9eOqADiQttouH1CTkQKAluXmDQmNIPiSdcobsPR2
         49JE8pRdFB4JFzw8bEN/VlAilEipY83+TJEkM7+En4lc9vzuzxlirMXPV77lAeBDf3aD
         d8PX35B3VoliVtQO7LLSkh15iwdfOKfofUhPXQWv9DDmrb1Nl6yYz7O1z6s/CjJs/xRK
         BnyA==
X-Gm-Message-State: AOJu0YxyB9JEMljs2MViM88WSnc/p4WdFuGi52d3QtJY7RMEN2XLzL0k
	QWKIOJx54mG3MBSPbbe/1XET7H0z/2SHqe3ebz5WzwFC43gMIc4AOybcmdjFGUY=
X-Gm-Gg: ASbGncsAhYzHQkHyMWeqN1kCT/65qcTqSjgmzvqyjpMqHFHDMR6F6bUBeqokHvJFoRP
	SaT3M+76EkiaDCdxpUBaYQYTTrLe8+3BG54QRWreWKJ4UeoEX9r6L46hFjMXKAgdcAY0OOslqs9
	TICjtXpr5JpPYFpHFHF5zhFaSxCAlBQ3obRZBvBZKMcy3Vw+uDEX4HI5/atvIRATp8LOgju4yl2
	tbdPws9qcDZWJri1tdMqA55B93FLxNEU79Sfu+keMLSoUKORYdB5hL4u3WlFNQfTyNG8nBo0TVX
	Yz5tcatcqJOkQmNCVbKbS/nzAOAHdOAvM11wWIERyd1p7oseUi10x34+rCFhGtSP1otK
X-Google-Smtp-Source: AGHT+IEhSvgjfruwhcex+wivH//fD/wuaybIS2/hD16jD5+lAolzYLPk996GstOlH4QsZAZmUZU1Kg==
X-Received: by 2002:a5d:47ab:0:b0:38a:87cc:fb2c with SMTP id ffacd0b85a97d-38c5195f506mr2941224f8f.18.1738157961709;
        Wed, 29 Jan 2025 05:39:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b25e:a614:863b:566e? ([2a01:e0a:982:cbb0:b25e:a614:863b:566e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c3f8asm16757481f8f.86.2025.01.29.05.39.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 05:39:21 -0800 (PST)
Message-ID: <df4baaa2-0c31-4ecd-9c48-9a2cbf1ece4d@linaro.org>
Date: Wed, 29 Jan 2025 14:39:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: add all 7 coresight ETE nodes
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250129-topic-sm8650-upstream-add-all-coresight-cpus-v1-1-96996d37df8e@linaro.org>
 <D7EJURP1JU6R.1TNVVAGA939RR@fairphone.com>
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
In-Reply-To: <D7EJURP1JU6R.1TNVVAGA939RR@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/01/2025 13:18, Luca Weiss wrote:
> Hi Neil,
> 
> On Wed Jan 29, 2025 at 10:54 AM CET, Neil Armstrong wrote:
>> Only CPU0 Embedded Trace Extension (ETE) was added, but there's one
>> for all 7 CPUs, so add the missing ones.
>>
>> Fixes: 256e6937e48a ("arm64: dts: qcom: sm8650: Add coresight nodes")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> The subject line is missing "sm8650"

Damn, thx, I'll fix for v2

Neil

> 
> Regards
> Luca
> 
>> ---
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 163 ++++++++++++++++++++++++++++++++++-
>>   1 file changed, 161 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 86684cb9a9325618ddb74458621cf4bbdc1cc0d1..d925d5e2c8182d522dd5b8e1fa0e253f5de2f7a7 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -365,7 +365,7 @@ cluster_sleep_1: cluster-sleep-1 {
>>   		};
>>   	};
>>   
>> -	ete0 {
>> +	ete-0 {
>>   		compatible = "arm,embedded-trace-extension";
>>   
>>   		cpu = <&cpu0>;
>> @@ -379,15 +379,174 @@ ete0_out_funnel_ete: endpoint {
>>   		};
>>   	};
>>   
>> +	ete-1 {
>> +		compatible = "arm,embedded-trace-extension";
>> +
>> +		cpu = <&cpu1>;
>> +
>> +		out-ports {
>> +			port {
>> +				ete1_out_funnel_ete: endpoint {
>> +					remote-endpoint = <&funnel_ete_in_ete1>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	ete-2 {
>> +		compatible = "arm,embedded-trace-extension";
>> +
>> +		cpu = <&cpu2>;
>> +
>> +		out-ports {
>> +			port {
>> +				ete2_out_funnel_ete: endpoint {
>> +					remote-endpoint = <&funnel_ete_in_ete2>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	ete-3 {
>> +		compatible = "arm,embedded-trace-extension";
>> +
>> +		cpu = <&cpu3>;
>> +
>> +		out-ports {
>> +			port {
>> +				ete3_out_funnel_ete: endpoint {
>> +					remote-endpoint = <&funnel_ete_in_ete3>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	ete-4 {
>> +		compatible = "arm,embedded-trace-extension";
>> +
>> +		cpu = <&cpu4>;
>> +
>> +		out-ports {
>> +			port {
>> +				ete4_out_funnel_ete: endpoint {
>> +					remote-endpoint = <&funnel_ete_in_ete4>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	ete-5 {
>> +		compatible = "arm,embedded-trace-extension";
>> +
>> +		cpu = <&cpu5>;
>> +
>> +		out-ports {
>> +			port {
>> +				ete5_out_funnel_ete: endpoint {
>> +					remote-endpoint = <&funnel_ete_in_ete5>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	ete-6 {
>> +		compatible = "arm,embedded-trace-extension";
>> +
>> +		cpu = <&cpu6>;
>> +
>> +		out-ports {
>> +			port {
>> +				ete6_out_funnel_ete: endpoint {
>> +					remote-endpoint = <&funnel_ete_in_ete6>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	ete-7 {
>> +		compatible = "arm,embedded-trace-extension";
>> +
>> +		cpu = <&cpu7>;
>> +
>> +		out-ports {
>> +			port {
>> +				ete7_out_funnel_ete: endpoint {
>> +					remote-endpoint = <&funnel_ete_in_ete7>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>>   	funnel-ete {
>>   		compatible = "arm,coresight-static-funnel";
>>   
>>   		in-ports {
>> -			port {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>>   				funnel_ete_in_ete0: endpoint {
>>   					remote-endpoint = <&ete0_out_funnel_ete>;
>>   				};
>>   			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +
>> +				funnel_ete_in_ete1: endpoint {
>> +					remote-endpoint = <&ete1_out_funnel_ete>;
>> +				};
>> +			};
>> +
>> +			port@2 {
>> +				reg = <2>;
>> +
>> +				funnel_ete_in_ete2: endpoint {
>> +					remote-endpoint = <&ete2_out_funnel_ete>;
>> +				};
>> +			};
>> +
>> +			port@3 {
>> +				reg = <3>;
>> +
>> +				funnel_ete_in_ete3: endpoint {
>> +					remote-endpoint = <&ete3_out_funnel_ete>;
>> +				};
>> +			};
>> +
>> +			port@4 {
>> +				reg = <4>;
>> +
>> +				funnel_ete_in_ete4: endpoint {
>> +					remote-endpoint = <&ete4_out_funnel_ete>;
>> +				};
>> +			};
>> +
>> +			port@5 {
>> +				reg = <5>;
>> +
>> +				funnel_ete_in_ete5: endpoint {
>> +					remote-endpoint = <&ete5_out_funnel_ete>;
>> +				};
>> +			};
>> +
>> +			port@6 {
>> +				reg = <6>;
>> +
>> +				funnel_ete_in_ete6: endpoint {
>> +					remote-endpoint = <&ete6_out_funnel_ete>;
>> +				};
>> +			};
>> +
>> +			port@7 {
>> +				reg = <7>;
>> +
>> +				funnel_ete_in_ete7: endpoint {
>> +					remote-endpoint = <&ete7_out_funnel_ete>;
>> +				};
>> +			};
>>   		};
>>   
>>   		out-ports {
>>
>> ---
>> base-commit: da7e6047a6264af16d2cb82bed9b6caa33eaf56a
>> change-id: 20250129-topic-sm8650-upstream-add-all-coresight-cpus-a3418606b354
>>
>> Best regards,
> 


