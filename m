Return-Path: <linux-arm-msm+bounces-90128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLySI07kcWk+MgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 09:48:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3428663679
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 09:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 23FFF44A296
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 08:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73AEB30BB80;
	Thu, 22 Jan 2026 08:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WJx43O4U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B792F7AB8
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 08:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769071145; cv=none; b=mSUzj8Dcb4FEK4WY2rFFqZmBknNKxM3hSJbKN8GuS6peCXoOGWSdKCPP+VDzBFdRs4OHWecZHLQhCIeEeEyEPqlxednwyOn1Qbc8WYrBCp5tVZS5/TK229TJ46Ohtjyu6z/ZVoP2q1U3bl94Cr3FPTGaOzL8fJ6MO5TjOSe1AD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769071145; c=relaxed/simple;
	bh=Bsok9y0iUeV7AveEoSqBf60zCkbG3Xq4f+71bZRjVKc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cd1zKcEx7WTuK+jqbBp9FSAbUF3K6PbFzFD1bWPjSQJhBWplj1lhQpMRYL5VIpvz0CsAsxXgw+5JiSfUYrVKhRMe6fwsXPsI6KS3yEjzLuRWRZAklh/6V3QQSkVf+xJJ59s4wNFB8NtFWPwykfEtt+vipEocINmz+lojd5ccG2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WJx43O4U; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so5569245e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 00:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769071140; x=1769675940; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRgWt3QOSpx0eS1nwXFOWd2CSZ21RZ8VIcbpaI5Urno=;
        b=WJx43O4UdQcqks0hvtf5gC0hbuGCkvUXTBd5ovn6D8Ub8Qzgpgd2qpehnZ4qGgrNjO
         NFYTnyiymeW1Rzg+aowhTWzhnZoVfmegiN9uRnaJkyphQ9KIz0cY3PQMgwujpGk4/GpG
         Rd2iQVPBRQf/cyerZ/5AjBPwUUDkC0u3w+HDOMiZ8T7MLL4IXPnb/2Ybv5KCmN+sgrOf
         u7UjKsBtWGC9bszBBPoUlNEUK0zLeVVUOJ1q03nlj5Hbq9H9rOpNl2dtKaHakS2EG0qw
         QQjYpEb79zT8h/SNHB1JF5Pweuvqf8NnhPFjt9QrDye5y81c6s7+RwYhQRKFl8WvR/jI
         qduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769071140; x=1769675940;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRgWt3QOSpx0eS1nwXFOWd2CSZ21RZ8VIcbpaI5Urno=;
        b=ZLcNWXCWosPUp4hJNAFlGdpJ8LhNmCe/UkFUd41BiFENkARqJsyezBL84PTE4CxkQW
         W9UyLN3hw8zd4slfVBswZciRrl/fqIFnxSUJsdiVx1jPZkSB3ZpX8vMZq0mpDR60pNLR
         MxCcxKx2z1mCrPxsQTD6lOJIYJwdirW3nkIx1to4hXfgAh5s7xlWDzDqkRgxPf37ycWu
         bc7PdLIlPQc9gVcFH/inI1HhlygFTQ1k7s2AQI7ZYurLLAy7yBCbjgHdCB/JT/wTdsu9
         9bxGZC95cdNaAuWHVPcbPIANzN3zrXLv6x4nCVH/obuY9rtdbfZN03/irVjKJkFc1C/k
         04Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWlylrCrret7T7G/G0h39VRCgqceu15HxsNhA/UB9kuue60tR+ACpWwoskkXjvsTAxTU1sh0A3jpn4Is8KL@vger.kernel.org
X-Gm-Message-State: AOJu0YybfMBXdpjq2i1tF5TmDRqS7995mmD76hChq5qf7nTnO9fdx2q5
	zGZA3eqzu/8Lx+cKXUrM5+1QpbiC4wFxmFDAMk7nr3aTMxqLVw3yWfxMjMwsfw747PA=
X-Gm-Gg: AZuq6aJ6XvjYTUlpJhPpVAy5ifsIkPpbnxHdgcTOCzbYtoCv4sijx7lB1qowzm2xNhx
	Zt9awzHYj1acm/dZyUV2LQn+sSymStfw2ZCYwB/JpuwCXZlvZj5T36LXthm2lsy0BrmFbf9sfze
	r3NGHEApq+vym0uHgSrFfvXso5kBFUm+/nV02BoDRSc/nYXtCR9RRcC7w6wHRWgO3N0tnhyOWOH
	HMX10zsUadVvVIRfuK5MXqz1e+Uv/jPcN13BR53qB4uZZ5RarcLwyHg3/eUFcddouxhmd4kkY0D
	4aCyB6lIZEUAvpNWMzWi8X5SUes+qu9uY45REwe/CT2ggL9jKltudI2TWtsZn4XOR7cK/Bm3Pjg
	98h5lwKyDTKjyyaGp5CHEugICgcuwopMgZmRm8o53M+dLW8Xi0NBhshFAKmwrnQv6rTSF6wcD0g
	zhTgA74DJW/FwfeSImhhC5WlfGcc8Ds+1w16wQ1EWhq1mbP3lRJhUiKlu0WBH3HbI=
X-Received: by 2002:a05:600c:4653:b0:47e:e0b3:2437 with SMTP id 5b1f17b1804b1-480470689femr23241895e9.5.1769071140057;
        Thu, 22 Jan 2026 00:39:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:9dc7:6955:8850:f258? ([2a01:e0a:3d9:2080:9dc7:6955:8850:f258])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470cf385sm48724455e9.13.2026.01.22.00.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 00:38:59 -0800 (PST)
Message-ID: <5c54dffe-f8eb-4b45-97b0-512a9658c212@linaro.org>
Date: Thu, 22 Jan 2026 09:38:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket S2 gaming console
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, KancyJoe <kancy2333@outlook.com>
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
 <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-3-bb3f95f1c085@linaro.org>
 <hmnyvxz7ashufiiil6hf4lg5g435e53zd3xla7qeqcb2styrqg@jkbjl6arm33g>
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
In-Reply-To: <hmnyvxz7ashufiiil6hf4lg5g435e53zd3xla7qeqcb2styrqg@jkbjl6arm33g>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,outlook.com];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	TAGGED_FROM(0.00)[bounces-90128-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,1c:email,0.0.0.0:email,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid,e:email,0.0.0.1:email];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 3428663679
X-Rspamd-Action: no action

On 1/22/26 02:30, Dmitry Baryshkov wrote:
> On Wed, Jan 21, 2026 at 05:40:28PM +0100, Neil Armstrong wrote:
>> From: KancyJoe <kancy2333@outlook.com>
>>
>> Add initial Device Tree for the Ayaneo Pocket S2 gaming console based
>> on the Qualcomm Snapdragon 8 Gen 3 platform.
>>
>> The design is similar to a phone wihout the modem, the game control
>> is handled via a standalone controller connected to a PCIe USB
>> controller.
>>
>> Display support will be added in a second time.
>>
>> Signed-off-by: KancyJoe <kancy2333@outlook.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>>   .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 1445 ++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi               |    2 +-
>>   drivers/gpu/drm/msm/dsi/dsi.c                      |    4 +-
>>   4 files changed, 1449 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 6f34d5ed331c..1ba29755e5ba 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -313,6 +313,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-qrd.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-samsung-q5q.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-sony-xperia-yodo-pdx234.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-ayaneo-pocket-s2.dtb
>>   
>>   sm8650-hdk-display-card-dtbs	:= sm8650-hdk.dtb sm8650-hdk-display-card.dtbo
>>   
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
>> new file mode 100644
>> index 000000000000..141d92933957
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
>> +
>> +&i2c3 {
> 
> clock-frequency?

We never did so far we we didn't need more than 100KHz

> 
>> +	status = "okay";
>> +
>> +	wcd_usbss: typec-mux@e {
>> +		compatible = "qcom,wcd9395-usbss", "qcom,wcd9390-usbss";
>> +		reg = <0xe>;
>> +
>> +		vdd-supply = <&vreg_l15b_1p8>;
>> +		reset-gpios = <&tlmm 152 GPIO_ACTIVE_HIGH>;
>> +
>> +		mode-switch;
>> +		orientation-switch;
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>> +				wcd_usbss_sbu_mux: endpoint {
>> +					remote-endpoint = <&pmic_glink_sbu>;
>> +				};
>> +			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +
>> +				wcd_usbss_headset_out: endpoint {
>> +					remote-endpoint = <&wcd_codec_headset_in>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&i2c6 {
> 
> clock-frequency?
> 
>> +	status = "okay";
>> +
>> +	typec-mux@1c {
>> +		compatible = "onnn,nb7vpq904m";
>> +		reg = <0x1c>;
>> +
>> +		vcc-supply = <&vreg_l15b_1p8>;
>> +
>> +		retimer-switch;
>> +		orientation-switch;
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>> +				redriver_ss_out: endpoint {
>> +					remote-endpoint = <&pmic_glink_ss_in>;
>> +				};
>> +			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +
>> +				redriver_ss_in: endpoint {
>> +					remote-endpoint = <&usb_dp_qmpphy_out>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&iris {
>> +	status = "okay";
> 
> With the default firmware?

Yes

> 
>> +&remoteproc_adsp {
>> +	firmware-name = "qcom/sm8650/ayaneo/ps2/adsp.mbn",
>> +			"qcom/sm8650/ayaneo/ps2/adsp_dtb.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_cdsp {
>> +	firmware-name = "qcom/sm8650/ayaneo/ps2/cdsp.mbn",
>> +			"qcom/sm8650/ayaneo/ps2/cdsp_dtb.mbn";
> 
> Is it fused?

No but as Kancy reported, it's usual vendord provides their own
version with battery & features tuning.

> 
>> +
>> +	status = "okay";
>> +};
>> +
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 07ae74851621..fcd5a1a45803 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -3917,7 +3917,7 @@ opp-32000000-4 {
>>   				};
>>   			};
>>   
>> -			pcie@0 {
>> +			pcieport1: pcie@0 {
>>   				device_type = "pci";
>>   				reg = <0x0 0x0 0x0 0x0 0x0>;
>>   				bus-range = <0x01 0xff>;
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
>> index d8bb40ef820e..0781dce7cda2 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> 
> Something stray
> 
>> @@ -43,12 +43,12 @@ static int dsi_get_phy(struct msm_dsi *msm_dsi)
>>   	of_node_put(phy_node);
>>   
>>   	if (!phy_pdev) {
>> -		DRM_DEV_ERROR(&pdev->dev, "%s: phy driver is not ready\n", __func__);
>> +		DRM_DEV_ERROR(&pdev->dev, "%s: 0 phy driver is not ready\n", __func__);
>>   		return -EPROBE_DEFER;
>>   	}
>>   	if (!msm_dsi->phy) {
>>   		put_device(&phy_pdev->dev);
>> -		DRM_DEV_ERROR(&pdev->dev, "%s: phy driver is not ready\n", __func__);
>> +		DRM_DEV_ERROR(&pdev->dev, "%s: 1 phy driver is not ready\n", __func__);
>>   		return -EPROBE_DEFER;
>>   	}

Aw, will drop in v2

Neil

>>   
>>
>> -- 
>> 2.34.1
>>
> 


