Return-Path: <linux-arm-msm+bounces-60188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D3BACD933
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 10:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A5F13A6ABF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 08:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AD8267F66;
	Wed,  4 Jun 2025 08:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lr/Rhvst"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA341247297
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 08:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749024009; cv=none; b=HgEBJS+gH1kVBDJ37FgvXtZlAnDWfAYExp0K/1nPFM/jMiXGCoZ53LWtVd/gVmb6TbwSFh+E3OBoVeS605e9ik5OxHOlWhmqSzEChWS8nc/GhC6kWu6XF6NKWDVbqwu65kmUGln4vliHkYSURg6ciy8pXYS9yBmhX6MBPWOAZVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749024009; c=relaxed/simple;
	bh=vGjfsWAwsHZ3yBIMOtSLUXwOxrgx+hmNf3Sgv3inK5Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=i9Qnei0e2mcr3KK8HPxf7ITkVV6JuhMNimuFQ6c/WL8cEojg69j9o1HJT5lKmhvPTWM0qdbHa/ejq0hdTRmpjro0lb1WZAYhTAZt+eUVkpE1yxP/jNe01/iRNZqSIYoombwvwEnFUX9agaDqlMuCAj3S2VxWEpgX0vVvgzd6Rr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lr/Rhvst; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso44756545e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 01:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749024006; x=1749628806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGCMzlor+Gxz4pn8XEPLv1l0Q92r4Vwo/GqwNEaOS60=;
        b=Lr/RhvstH2cHNYwcquX1T9v0yqt1RY+oNLz/eSIuWDlIkj4g5+euFTifWPnkcSD3nU
         aZVn+1QOkEi5LUQGUdF6o0k55XtYoa75DRk4UvU1HJgaB8lZJZ397g1S1PSUadyinPI+
         ACyCJMvq7hORG3VfB5aboPp1fcnG0iQUrvMnROHsHGbtMJ93G337oD0n7XI4LHgybYmD
         6biQAGhA/gbVgtBPMK/DOQacdKinvSh37Dgaus4FhMikjY54H3uAbyU+YxgEuH7MOzD1
         3U6m3JKQ5yufPic1UxDHOo72D2sX72u+Cif8rYtG445nt5fVq+gQXg4mhiiScJ8aesp4
         PiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749024006; x=1749628806;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bGCMzlor+Gxz4pn8XEPLv1l0Q92r4Vwo/GqwNEaOS60=;
        b=Jk66kpAJO7juytY3eTEhw5g5WWiyXWgGuBjPk60287vulc3KsYqlV6+H5Fq2ph5tcd
         L5kb/d+Ct3pW4NfGFsAO5pVgw/u+INVdnc0lJ9KphuEdaDErbh0BwbgkpQlu7uNv1iSs
         5lOwnROGO7dBAAfAM5i05SgUhwwSpBgOhnHD0uCS+5u+oZNEXfAgcgRH8ziYsjRimjBf
         d04OPoBQx7krVQsWSpWr+6sXVpRIyA2TsndKx5YUFoAAcJOig6QYrf15j9EkM58WnbdH
         0GNhDKfVjzd8SlYn9HlG0nbgaNFfb3xN6tzxWoy4jxZwiDFlcc2XSWH1Ex7XNezVBiat
         kK6w==
X-Forwarded-Encrypted: i=1; AJvYcCXaDvmMSKx4lnzYdHaDHFucA4cwKSCpYmoj21PTyf+qXU4772t8W1ohsiGw6lsYZrxOCEZWZFKjRcLAAEOz@vger.kernel.org
X-Gm-Message-State: AOJu0YxwPACm4S+BngXgBp1GOR+UKLAsrOBxWZpkgmP+26IfP6+Jg3i1
	raaNzX4JIp0QQNeloL/mPzNFnQQIJ+hCOzz1maXY/L01G9WZQWhvAnqlInvNYouDVZ4=
X-Gm-Gg: ASbGncv/QSCgN8nNfNEaq3vm9R0TBLQmma53lYCpcf1+NDQgJLZ4rS8nZo8ZFmkaLUJ
	m0Xng4cj8qT3MNlcVGAi3gnCvVuopaK5f9hxssUMsbiaOPkCzNM1ZleWpDbeiT32lPOretl50lh
	VBi/px1XF5O37wgxiztwpIYvY8V3WHnmRUI10KYaajGK95hYXoWOXKUoKMZ8lyNesw54wHee8ee
	7CSQNP/tAcRx8yH2ygHLpVrDTfKWLmjuyUCLpShXKXATRPxlT4EVsZ7KwZQpLbvemt0Ys6/OKQm
	m9NB+cGD04nOVWeKUmj6OExjkcj4gUPb3Af7R9nO9ztJC3jxEuHAcS0/4uZf0a1HHtqKLvBkJQM
	jivDydyI31FUA4IsRgXfY8BPkvQ==
X-Google-Smtp-Source: AGHT+IGLk1TPgg+eYfU6DNCv4bWwu3geZXiU4ukwWnIImgNZScCTFNfSxyS0vnstUIQnEi4Fku/y7w==
X-Received: by 2002:a05:600c:4f8b:b0:450:d37d:7c with SMTP id 5b1f17b1804b1-451f0b105d0mr11385875e9.21.1749024005774;
        Wed, 04 Jun 2025 01:00:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fef9:cf1c:18f:2ab8? ([2a01:e0a:3d9:2080:fef9:cf1c:18f:2ab8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fc1b60sm194686905e9.34.2025.06.04.01.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 01:00:05 -0700 (PDT)
Message-ID: <50d1c481-e431-4544-a034-f7d0e78ff272@linaro.org>
Date: Wed, 4 Jun 2025 10:00:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 09/10] arm64: dts: qcom: sm8550: Explicitly describe the
 IPA IMEM slice
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-9-f7aa94fac1ab@oss.qualcomm.com>
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
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-9-f7aa94fac1ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/05/2025 01:18, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As part of stepping away from crazy hardcoding in the driver, move
> define the slice explicitly and pass it to the IPA node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 71a7e3b57ecedd86d798e71b781451fe11f9c1ce..17d755daba4141d3a8716cd6ff4483c34dc0f660 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2659,6 +2659,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>   			qcom,smem-state-names = "ipa-clock-enabled-valid",
>   						"ipa-clock-enabled";
>   
> +			sram = <&ipa_modem_tables>;
> +
>   			status = "disabled";
>   		};
>   
> @@ -4737,6 +4739,20 @@ data-pins {
>   			};
>   		};
>   
> +		sram@14680000 {
> +			compatible = "qcom,sm8350-imem", "syscon", "simple-mfd";
> +			reg = <0 0x14680000 0 0x2c000>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			ranges = <0 0 0x14680000 0x2c000>;
> +
> +			ipa_modem_tables: modem-tables@8000 {
> +				reg = <0x8000 0x2000>;
> +			};
> +		};
> +
>   		apps_smmu: iommu@15000000 {
>   			compatible = "qcom,sm8550-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>   			reg = <0 0x15000000 0 0x100000>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

