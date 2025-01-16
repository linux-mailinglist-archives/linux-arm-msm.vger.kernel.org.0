Return-Path: <linux-arm-msm+bounces-45297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E503FA13E87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 16:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 461AB7A4819
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 15:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400DC22CBC4;
	Thu, 16 Jan 2025 15:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kZvzRIwx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400BA22BAC6
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 15:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043036; cv=none; b=KOHbOrg2dL7PtMBBgpK0/nrZbb03OTTorDR769AwaLJdiRQ7RxEDlYpqD9HgtS8kcx5vJJQJImdCNipnQHnphERwRzZYZrS6fFA5T7fl8r9uNHooeEvrkEK8v4oclZ4o29MkxXwhN2fpmxTEesyAUwo6dcRrZP8AxV+w1TFFxB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043036; c=relaxed/simple;
	bh=2mXw9Yg33Bxu+/IP6cHKmDWuh61UksklpzH8rf6S42g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=o1nMVh1mvcUjjDeXTvrwOEXAy3Mma9HnJajSML368bOPoCekGrrMPYDP6HBvQTgR6pvLhB1RO4eiiHIK9WnG2kIqEwDkDx2kzkCdbENfy6zB3O+BnqbSx0SIIGWQEJ1DRD+lLsxbjCFgL8QE0CkbN/gMVJWJMYPSXDQM3n95EKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kZvzRIwx; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361c705434so7156375e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 07:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737043033; x=1737647833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=usx0ioMicGPHqo0IpMUxQsb9OGcht91JkoYaqB1CvBE=;
        b=kZvzRIwx/WC/KRhoMJoEhueOy8sP4FUcups5g6Gsh0w7SzbYdroX5WauII7su3pOTx
         Ju10P+M7YG5Uw8F15V9gfQL7wD79+e30kitHVNGV9esP0UxTjSMsklQwZvHaXYX9VmJw
         NQLRyzZ2yaC14/W5Jzh8lkMOZ0gEpo/mtfOwkJH0laEMsHom4t/yskSL/HaPWzrdl9e+
         11ATJJUUx385kK2NgIb28mbXmDFmPfb23+47AkCZeLBe8lskjBbzgbWtvmTNznowvdiB
         0zj1RVvr3mxXk8sJk/S8kxx6O7QiQLVmdnH63CoSKimKyMhM+WzETWbeX2paMyuTixZY
         4jBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737043033; x=1737647833;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=usx0ioMicGPHqo0IpMUxQsb9OGcht91JkoYaqB1CvBE=;
        b=Aq1YOAEJJoIytH/XEk8IQWfHcS4Osan2wUbGxB3Ka6dnfjIKRJ/DaydN1FaQR0evzE
         zlqIl/4KCo5clvHUuf3LXHz6tXkX+gjFmnOO5oVDzl94GdTV6SC23IgZUUial3UCFaKj
         +bkdLOBFnh/KlefA/BbUOzArhwJxGivhl6xDwRTznFUMAmTtYFHz4OPtTy5PveFmBOTI
         /iVTdO98epXGgV1dh/mMBnN2faqI3i5CWcOOgECmIHBwJ3NkhPTN0jAWMQnd7XIkXTHl
         HGqEJswo0yaFWQ1NGNW1jd0JDR+4WHuHXgOfxBZlkwowk8igXxn7JgWldOMhYJ4gTttT
         6RIw==
X-Forwarded-Encrypted: i=1; AJvYcCWTC+8zDRCwBArtn9G1Y2jounIWeXAoLANXNOqQgNRGww0BDyr8maOK0qO1ZCDXx2zsy4tQKocpFZHzcWun@vger.kernel.org
X-Gm-Message-State: AOJu0YxtoX/YUdPCGGNgIfvlMIKVzkmwIsH7h84FPa9v4zjx96od4tJW
	MeHpVXmOa2LKK/WTgsT6Coh5NmB1pKvpJWsTR7FcO5iJgzpLmRPDTnp6CynHlPg=
X-Gm-Gg: ASbGncsCtbJmF4dQowAtySZKTc/68th4ictNGPzDcW0+HGL2rNH1CfPI9++YrpX0mx7
	zDDQS5/KenP0SL6NgysAfUrAsTdW4eWAhp0Wn+2FRocnp9RCk199t0uwaMMm6oXbBSro+s9Qcb6
	CapQ0JhwY8e1gigHPI+y0MhVIj5qadEtqWWyl/iS5NVbAiKZg5Xjq9f92I96EaifeRMSr8SEFbv
	fwZDvbjirMevTVYkLnrGotguthCJO3oQBvBMWmnv3uYNWm09BBiXge6ulZ7yPySOlNBAHZedo6F
	SlDm0rKIap9C1Yo3qAbmfUzSna0/4+6FjQ==
X-Google-Smtp-Source: AGHT+IGjVdQRjaMidXYivLi/ICO5J6O+Hm6JBzDfpixblm/d3iVHDoW25ShEp0ZgglfZ9u5JKRlcZw==
X-Received: by 2002:a5d:59ab:0:b0:385:df6b:7ef6 with SMTP id ffacd0b85a97d-38a873579a8mr31664496f8f.51.1737043032663;
        Thu, 16 Jan 2025 07:57:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4adf:8d3f:1419:e65d? ([2a01:e0a:982:cbb0:4adf:8d3f:1419:e65d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf32754dcsm190821f8f.77.2025.01.16.07.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 07:57:12 -0800 (PST)
Message-ID: <be7b0acc-495b-4bb6-91e1-5db8e301503d@linaro.org>
Date: Thu, 16 Jan 2025 16:57:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v4] arm64: dts: qcom: Add coresight node for SM8650
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250107-sm8650-cs-dt-v4-1-2113b18754ea@quicinc.com>
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
In-Reply-To: <20250107-sm8650-cs-dt-v4-1-2113b18754ea@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/01/2025 09:48, Yuanfang Zhang wrote:
> Add coresight components: Funnel, ETE and ETF for SM8650.
> 
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
> Changes in v4:
> - Re-sort these nodes by address.
> - Link to v3: https://lore.kernel.org/r/20250103-sm8650-cs-dt-v3-1-759a3f6a3cc8@quicinc.com
> 
> Changes in v3:
> - Move ete0 and funnel-ete to /.
> - Update coding style.
> - Link to v2: https://lore.kernel.org/r/20241210-sm8650-cs-dt-v2-1-cf24c6c9bddc@quicinc.com
> 
> Changes in v2:
> - Update compatible for funnel and etf.
> - remove unnecessary property: reg-names and arm,primecell-periphid.
> - Link to v1: https://lore.kernel.org/r/20241210-sm8650-cs-dt-v1-1-269693451584@quicinc.com
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 166 +++++++++++++++++++++++++++++++++++
>   1 file changed, 166 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 25e47505adcb790d09f1d2726386438487255824..49d6567fbd2e68b66b517d8d9180c7443f8bf611 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -365,6 +365,40 @@ cluster_sleep_1: cluster-sleep-1 {
>   		};
>   	};
>   
> +	ete0 {
> +		compatible = "arm,embedded-trace-extension";
> +
> +		cpu = <&cpu0>;
> +
> +		out-ports {
> +			port {
> +				ete0_out_funnel_ete: endpoint {
> +					remote-endpoint = <&funnel_ete_in_ete0>;
> +				};
> +			};
> +		};
> +	};

Why only the cpu0 ete has been added ?

And why are the other components (TPDA, TPDM, STM, CTI...) missing ?

Neil

> +
> +	funnel-ete {
> +		compatible = "arm,coresight-static-funnel";
> +
> +		in-ports {
> +			port {
> +				funnel_ete_in_ete0: endpoint {
> +					remote-endpoint = <&ete0_out_funnel_ete>;
> +				};
> +			};
> +		};
> +
> +		out-ports {
> +			port {
> +				funnel_ete_out_funnel_apss: endpoint {
> +					remote-endpoint = <&funnel_apss_in_funnel_ete>;
> +				};
> +			};
> +		};
> +	};
> +
>   	firmware {
>   		scm: scm {
>   			compatible = "qcom,scm-sm8650", "qcom,scm";
> @@ -4854,6 +4888,138 @@ data-pins {
>   			};
>   		};
>   
> +		funnel@10042000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +
> +			reg = <0x0 0x10042000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					funnel_in1_in_funnel_apss: endpoint {
> +						remote-endpoint = <&funnel_apss_out_funnel_in1>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel_in1_out_funnel_qdss: endpoint {
> +						remote-endpoint = <&funnel_qdss_in_funnel_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10045000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +
> +			reg = <0x0 0x10045000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					funnel_qdss_in_funnel_in1: endpoint {
> +						remote-endpoint = <&funnel_in1_out_funnel_qdss>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel_qdss_out_funnel_aoss: endpoint {
> +						remote-endpoint = <&funnel_aoss_in_funnel_qdss>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10b04000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +
> +			reg = <0x0 0x10b04000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@7 {
> +					reg = <7>;
> +
> +					funnel_aoss_in_funnel_qdss: endpoint {
> +						remote-endpoint = <&funnel_qdss_out_funnel_aoss>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel_aoss_out_tmc_etf: endpoint {
> +						remote-endpoint = <&tmc_etf_in_funnel_aoss>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tmc@10b05000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +
> +			reg = <0x0 0x10b05000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					tmc_etf_in_funnel_aoss: endpoint {
> +						remote-endpoint = <&funnel_aoss_out_tmc_etf>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@13810000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +
> +			reg = <0x0 0x13810000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					funnel_apss_in_funnel_ete: endpoint {
> +						remote-endpoint = <&funnel_ete_out_funnel_apss>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					funnel_apss_out_funnel_in1: endpoint {
> +						remote-endpoint = <&funnel_in1_in_funnel_apss>;
> +					};
> +				};
> +			};
> +		};
> +
>   		apps_smmu: iommu@15000000 {
>   			compatible = "qcom,sm8650-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>   			reg = <0 0x15000000 0 0x100000>;
> 
> ---
> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> change-id: 20241209-sm8650-cs-dt-ad649dcfa5e8
> 
> Best regards,


