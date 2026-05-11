Return-Path: <linux-arm-msm+bounces-106925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ED03EgbUAWryjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:05:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A370050E885
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2D2A3098AC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C063A1A2F;
	Mon, 11 May 2026 12:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vpJ2G8Q9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C4538F25F
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778504163; cv=none; b=nKNDrq2ooqZtiaMPqLgx70mRUh6ohV8OdcE11XMHnLeT2bJmEmP/gqGBDSWFnILhrhJx69JOy1vFdeoDMT3UKPMaIwyISHF2lvZB3RRugL4v47qzr9vv/j9tltT/6805Opu/nvIFnVmP+5LoT93Tt8xHqcMKE2vnaCj5/Ey4p5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778504163; c=relaxed/simple;
	bh=+1iU5z69pi6F2Na0HC2kOduM8kBeZWewHfD+r34glp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tIy49UE2xh9wIPUFqia2ifAyo8C2tJVluY9tZtgBtxCNzofWLXyAkrrQguZ1le8B98D99+fQhPYhJJDgd60M9/dHzO1RwMP7GFgIh4avOG20R5MwJ1uF+HbSJ+MDG7E7EqRuBAt7RwVJgXw3JSWKVH2V3Wa3BTCELr2Vga1hulU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vpJ2G8Q9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so9326985e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778504160; x=1779108960; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uaDWiTODxxK8q8M5whzLuto3vCTYPlcoAVZ4yb65DCQ=;
        b=vpJ2G8Q9fkFguqezQkyvVdk07JmOL0lrgXPWQnIedhieOhKeFmV2ngsXQWkXspRI8O
         UcHxriHN0RglFqikE9UPlo/IoH7jJzaR7gVFMzTcgTcgtVEYwbKnAbqec90Qt8nQ7tEY
         VAXmEGtg7QU9NvlH95LcC7FFoBytNKqG7LLX3Mi5bPULYHOvt09zPsnWKhQSazD+FLE+
         yRvVJELtZbR4q0Egi8r1kB59yoaJUtRbQ6GXswjn84oPacK9cFsufJFYtL8JHDUV3e7+
         bt+eOjIM+Zu/5Rr84TSRNNFwVka0UUTsaoheE0aSqX3oOpmf4RcbEut4F9QA5TOXb9xJ
         iBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778504160; x=1779108960;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uaDWiTODxxK8q8M5whzLuto3vCTYPlcoAVZ4yb65DCQ=;
        b=ExWvlcGoaQFX8oF0Q2uPuwXrr+/XxeTdo+FURLuIKrYUJu/8BcNJFYz760Mat6jJlJ
         AEmwfMcZ50z+FsDQTZIzZtQHZTEJVoO4cLwV/7KjZWp2SOU0a/K4TF6oP+tijaiyxIr4
         4TMgmYu5O5XNVq86lm99XFqCVZLtQXyDvOmrJOqQkKvkzpupfuvBUbZlaWxnoNm1I3ij
         FOrJthXbXJEaRHdopQlHW2DjIzQ6A5eqhO0DD3Vt11/o4M7zECQ9oQ4O/ZLDZVD4IzP2
         +pKyA1vdQIoxeBdLSnPaMI5SraAYQ9y9y60a5SK4f0KQgAUuQaTo3Fvj7mdZWHDe1gx6
         lpVA==
X-Gm-Message-State: AOJu0YyXJa5UatfIeRdtpzQZRSgVj8qHjqHl8KeDSkLCIFtMnWCjYgbK
	7/AwYgwwf7fN3pRHERgUhZSS47MNwsdaiG1Z5XRXQ84u4za4U6bK59XB6LKCYOUO+m8=
X-Gm-Gg: Acq92OFqFxad+f6893Qmk37sO4ghKYRFBGiDSSfYXC5tEutVX2y87xh8yy3TTA5ekfe
	mm52aA8qJP2u3EeRCCSvX2aRh2LA16KVArvthVt7JUHm9GsizbysjQWjYmM97ZFwyRwHDQvv4sg
	8PYU/TcQUUlnHSR+UHnY7hXj//FSqcnRQ9dQPA5YHB5lc2FHOJ1kLahuN/yR4J9suLgIemReYac
	36Wqk3EgdRMR4SbhTXsww0Y9iStErl5OnW8lLkNodlXkhqXU3r1s3bILgLTpHXzfOSwPxNurmyg
	FqB5mBxcB9O7Qm1SpwVHE8vCX5i+pASka7sJeF0Ex23GdRoXP5bHLjaosRoTr+EqtFj0LXfEh3p
	675avtK0HRKCqdTgrEpIkFfxQl4Bto/VCuB6US/+ZcH8JewoWVlXGuS7iDudb93GVU4qxNBwlor
	GEKuS6eT65Z204gQu2+pIyYb1+sGQLosRoxth1AHVp21zKuWDOCLbwVRAwGnuWKibPTOIYzk5W4
	V+T/Gs=
X-Received: by 2002:a05:600c:35d4:b0:48e:74dc:999f with SMTP id 5b1f17b1804b1-48e74dc9b4cmr165718935e9.6.1778504159596;
        Mon, 11 May 2026 05:55:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:63dd:7879:45c5:21b9? ([2a01:e0a:106d:1080:63dd:7879:45c5:21b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6db09943sm64859725e9.19.2026.05.11.05.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 05:55:59 -0700 (PDT)
Message-ID: <e7997c4d-dd20-4f2b-8c84-6c75389f6285@linaro.org>
Date: Mon, 11 May 2026 14:55:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8550: add labels for thermal
 zones
To: azkali.limited@gmail.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511-pocketds-v2-0-299dd4247f2f@gmail.com>
 <20260511-pocketds-v2-2-299dd4247f2f@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20260511-pocketds-v2-2-299dd4247f2f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A370050E885
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106925-lists,linux-arm-msm=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,linaro.org:mid,linaro.org:replyto,linaro.org:dkim];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 5/11/26 13:33, Alexandre Hamamdjian via B4 Relay wrote:
> From: Alexandre Hamamdjian <azkali.limited@gmail.com>
> 
> Add labels for the cpuss, cpu and gpuss thermal zones so board files
> can extend them with trip points and cooling maps through the &label
> override syntax, instead of redeclaring the zones by path.
> 
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 912525e9bca6..a9c678fc9cb2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -5764,7 +5764,7 @@ reset-mon-config {
>   			};
>   		};
>   
> -		cpuss0-thermal {
> +		cpuss0_thermal: cpuss0-thermal {
>   			thermal-sensors = <&tsens0 1>;
>   
>   			trips {
> @@ -5782,7 +5782,7 @@ reset-mon-config {
>   			};
>   		};
>   
> -		cpuss1-thermal {
> +		cpuss1_thermal: cpuss1-thermal {
>   			thermal-sensors = <&tsens0 2>;
>   
>   			trips {
> @@ -5800,7 +5800,7 @@ reset-mon-config {
>   			};
>   		};
>   
> -		cpuss2-thermal {
> +		cpuss2_thermal: cpuss2-thermal {
>   			thermal-sensors = <&tsens0 3>;
>   
>   			trips {
> @@ -5818,7 +5818,7 @@ reset-mon-config {
>   			};
>   		};
>   
> -		cpuss3-thermal {
> +		cpuss3_thermal: cpuss3-thermal {
>   			thermal-sensors = <&tsens0 4>;
>   
>   			trips {
> @@ -6028,7 +6028,7 @@ cpu6_bottom_crit: cpu-critical {
>   			};
>   		};
>   
> -		cpu7-top-thermal {
> +		cpu7_top_thermal: cpu7-top-thermal {
>   			thermal-sensors = <&tsens0 13>;
>   
>   			trips {
> @@ -6536,7 +6536,7 @@ reset-mon-config {
>   			};
>   		};
>   
> -		gpuss-0-thermal {
> +		gpuss0_thermal: gpuss-0-thermal {
>   			polling-delay-passive = <10>;
>   
>   			thermal-sensors = <&tsens2 1>;
> @@ -6569,7 +6569,7 @@ trip-point2 {
>   			};
>   		};
>   
> -		gpuss-1-thermal {
> +		gpuss1_thermal: gpuss-1-thermal {
>   			polling-delay-passive = <10>;
>   
>   			thermal-sensors = <&tsens2 2>;
> @@ -6602,7 +6602,7 @@ trip-point2 {
>   			};
>   		};
>   
> -		gpuss-2-thermal {
> +		gpuss2_thermal: gpuss-2-thermal {
>   			polling-delay-passive = <10>;
>   
>   			thermal-sensors = <&tsens2 3>;
> @@ -6635,7 +6635,7 @@ trip-point2 {
>   			};
>   		};
>   
> -		gpuss-3-thermal {
> +		gpuss3_thermal: gpuss-3-thermal {
>   			polling-delay-passive = <10>;
>   
>   			thermal-sensors = <&tsens2 4>;
> @@ -6668,7 +6668,7 @@ trip-point2 {
>   			};
>   		};
>   
> -		gpuss-4-thermal {
> +		gpuss4_thermal: gpuss-4-thermal {
>   			polling-delay-passive = <10>;
>   
>   			thermal-sensors = <&tsens2 5>;
> @@ -6701,7 +6701,7 @@ trip-point2 {
>   			};
>   		};
>   
> -		gpuss-5-thermal {
> +		gpuss5_thermal: gpuss-5-thermal {
>   			polling-delay-passive = <10>;
>   
>   			thermal-sensors = <&tsens2 6>;
> @@ -6734,7 +6734,7 @@ trip-point2 {
>   			};
>   		};
>   
> -		gpuss-6-thermal {
> +		gpuss6_thermal: gpuss-6-thermal {
>   			polling-delay-passive = <10>;
>   
>   			thermal-sensors = <&tsens2 7>;
> @@ -6767,7 +6767,7 @@ trip-point2 {
>   			};
>   		};
>   
> -		gpuss-7-thermal {
> +		gpuss7_thermal: gpuss-7-thermal {
>   			polling-delay-passive = <10>;
>   
>   			thermal-sensors = <&tsens2 8>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

