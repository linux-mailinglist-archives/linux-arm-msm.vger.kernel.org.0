Return-Path: <linux-arm-msm+bounces-97861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIBCLUrAt2k3VAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:33:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1774B296419
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:33:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9388C300D97F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 08:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703F937B018;
	Mon, 16 Mar 2026 08:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dDiz5HkH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8878337AA74
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 08:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773649849; cv=none; b=IT6/mC5XDI9dMlFgDNcXFj1I/7+C0bTIkDFbHyaNunEWUzPkmi8uXV1xRZxdncAzPhmTD2P0TvRvIaLWp4NiWHPfsFcwmuMIYzccuKhF0JZuahGVqr37geEM6ki8ARlPzBrBwBVk5ihJ7eDODTbhdL7+4V0GZXVSzgTAXCE1RVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773649849; c=relaxed/simple;
	bh=He6ytlqAfD6vZnzL6TqN0OJ/NuGp+3dzxlRf1o9A2dA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IuVYUjYTJKRgxjr1xOxkZ9gxs0hAAPdkzqPEksiIGi3yeGjsLXTVYeaHtVhlfVeuRYIbnWVHa30qLQ57imNzdG/yKkUvv287fSPHil/wF47BJD6p8huoct2ZSg+Sl/un1In9MRAZSnQnEsQlzxtU3w7Rr81bxPTlJPkHPWKscw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dDiz5HkH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so26508465e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 01:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773649846; x=1774254646; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAleYFZgh5CbUQA+ftwJCtERYEst9PxuThfsDb4IO4Q=;
        b=dDiz5HkHnfhhPLFaghH9llsqDbv+iuxQfs40eQUeCs7jy5sVNL4/aHyYuP0wP+/1Qx
         npO9mFaxVZoHpEkmVsF10qwi9MwUBgAZ4rOojrBFqHy1JjwELXr6KjZ/wQJOrsunjvQy
         11jCZOkeOd4DqBzpoApbMdATz7EwvrAMvL615R8PeNhKSCVy4r3gv54UiMDz6esrS9/0
         8mjgnEhE2lYMqDOScKjbfJ1agDe7Y1sDf88DAoDD/NV0zgLJkTa3qfB6hXD1iQt0v8fW
         ascP+YOfbmBqfLLrfN+gySv5qitBVsn9/F1JxgUVMuoE+YyBTd5cU99unmaJf8gnno5X
         UVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773649846; x=1774254646;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAleYFZgh5CbUQA+ftwJCtERYEst9PxuThfsDb4IO4Q=;
        b=DVXdU22NmV8QA6s5eYgby9SeX7n7ILZ29qDpYHgUw0dHbJ6jqXPiMeTTKffprGv1le
         ZoZqn5GUAAu1w4ye5ZeRMjEQJz4XMYfAJoEYes+h659BWTf7q0vRJGh88ETTTLOZmKD5
         tPGfSh0T0/FIz5Nwpi93A7478ybw1HNPaR2+P7crldz2j7s0Tdb6k4wgWeLBa6FpsMmy
         y7GIJxXC8WCxGI6uCgqMuicMbNKwJj0gpfyw0dKqTFfmjOAbx3ORURMDa2GSNFEjY44/
         0S+Qxyl/SFjOyQfxTre/9HYRa1dpXviPApx99weWT6wOWPxan4cpsIYr8Skuc+/97TqO
         s2tw==
X-Gm-Message-State: AOJu0Yw5jKZFMoxqEso493wqE+CzIu/fqpwaxWp6rjWR9myE+INDe13C
	V0lPWpPp1t/wMmSe5R2pbEqoO0zFko1cDUyh6sZ21x9fqR9OvwrTWpwFd8PwA2pnbZSlNPVIn9M
	x05RJ
X-Gm-Gg: ATEYQzwKNJl85dDyGAO8wwXwjCrazP2VjzFm4DBP06f2dacmGEzfgTSODiDYG3EHnKw
	9Vlxu0Tk3jGWB2sa2RMZI0iuayZCUeClSTobjaUbLCPUDDDcq/xh9WfgjoCqJjvzBFCtmOC7PbV
	uAC2pXJbdEvJ6EDxigUJacsJyYwi01Rxpb4HO7BluNaEW8WGmvZNkwl9g3C2wF/dRFGrCR4X2uX
	Xm17FRo6vdXUtJbTPFX1D/0dBTuQwLQindxTYq0d4nwiChIgzNQC+Fwa8cjaQA+B6SXUyg3cela
	nGBX8y5zlEZevRaw8v3icLXA35HLumPgXt/YAZGSnEMbL+MTmrhFw5MBbih9QkBiK5slLLx/kRC
	U2f9qoYE4rzGRyUH23VQ3GOjh1WhWauyCPUUskiNDapRYEHxurcF8o6XfEZRaNMhm51zrFwzcLw
	hE0KaM6zUtFMHd1YyXv31smigCSZHuNBfSRb1OxIGxhch2OW7G1DdF7dMhzANj48PNOkldkz7Wx
	GJ/IDo=
X-Received: by 2002:a05:600c:1550:b0:485:38fc:7069 with SMTP id 5b1f17b1804b1-48556704780mr207322995e9.23.1773649845776;
        Mon, 16 Mar 2026 01:30:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:a12d:6e5e:e745:c5e8? ([2a01:e0a:106d:1080:a12d:6e5e:e745:c5e8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855642c481sm82514775e9.10.2026.03.16.01.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:30:45 -0700 (PDT)
Message-ID: <03edfc8f-d7e3-4caf-95cc-7c5efb1d1f49@linaro.org>
Date: Mon, 16 Mar 2026 09:30:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 03/11] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
 <20260316-x1e-camss-csi2-phy-dtsi-v2-3-859f3fa55790@linaro.org>
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
In-Reply-To: <20260316-x1e-camss-csi2-phy-dtsi-v2-3-859f3fa55790@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97861-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 1774B296419
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 02:12, Bryan O'Donoghue wrote:
> Add dtsi to describe the xe180100 CAMSS block
> 
> 4 x CSIPHY
> 3 x TPG
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 367 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 367 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 38f9da6ad9ca5..c62187856a451 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -16,6 +16,7 @@
>   #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/phy/phy-qcom-qmp.h>
>   #include <dt-bindings/power/qcom,rpmhpd.h>
>   #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -5543,6 +5544,372 @@ cci1_i2c1: i2c-bus@1 {
>   			};
>   		};
>   
> +		camss: isp@acb7000 {
> +			compatible = "qcom,x1e80100-camss", "simple-mfd";
> +
> +			reg = <0 0x0acb7000 0 0x2000>,
> +			      <0 0x0acb9000 0 0x2000>,
> +			      <0 0x0acbb000 0 0x2000>,
> +			      <0 0x0acc6000 0 0x1000>,
> +			      <0 0x0acca000 0 0x1000>,
> +			      <0 0x0acb6000 0 0x1000>,
> +			      <0 0x0ace4000 0 0x1000>,
> +			      <0 0x0ace6000 0 0x1000>,
> +			      <0 0x0ace8000 0 0x1000>,
> +			      <0 0x0acec000 0 0x4000>,
> +			      <0 0x0acf6000 0 0x1000>,
> +			      <0 0x0acf7000 0 0x1000>,
> +			      <0 0x0acf8000 0 0x1000>,
> +			      <0 0x0ac62000 0 0xf000>,
> +			      <0 0x0ac71000 0 0xf000>,
> +			      <0 0x0acc7000 0 0x2000>,
> +			      <0 0x0accb000 0 0x2000>;
> +
> +			reg-names = "csid0",
> +				    "csid1",
> +				    "csid2",
> +				    "csid_lite0",
> +				    "csid_lite1",
> +				    "csid_wrapper",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "csiphy4",
> +				    "csitpg0",
> +				    "csitpg1",
> +				    "csitpg2",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe_lite0",
> +				    "vfe_lite1";
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
> +				 <&camcc CAM_CC_CSID_CLK>,
> +				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY4_CLK>,
> +				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +
> +			clock-names = "camnoc_nrt_axi",
> +				      "camnoc_rt_axi",
> +				      "core_ahb",
> +				      "cpas_ahb",
> +				      "cpas_fast_ahb",
> +				      "cpas_vfe0",
> +				      "cpas_vfe1",
> +				      "cpas_vfe_lite",
> +				      "cphy_rx_clk_src",
> +				      "csid",
> +				      "csid_csiphy_rx",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "csiphy2",
> +				      "csiphy2_timer",
> +				      "csiphy4",
> +				      "csiphy4_timer",
> +				      "gcc_axi_hf",
> +				      "gcc_axi_sf",
> +				      "vfe0",
> +				      "vfe0_fast_ahb",
> +				      "vfe1",
> +				      "vfe1_fast_ahb",
> +				      "vfe_lite",
> +				      "vfe_lite_ahb",
> +				      "vfe_lite_cphy_rx",
> +				      "vfe_lite_csid";
> +
> +			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
> +
> +			interrupt-names = "csid0",
> +					  "csid1",
> +					  "csid2",
> +					  "csid_lite0",
> +					  "csid_lite1",
> +					  "csiphy0",
> +					  "csiphy1",
> +					  "csiphy2",
> +					  "csiphy4",
> +					  "vfe0",
> +					  "vfe1",
> +					  "vfe_lite0",
> +					  "vfe_lite1";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "ahb",
> +					     "hf_mnoc",
> +					     "sf_mnoc",
> +					     "sf_icp_mnoc";
> +
> +			iommus = <&apps_smmu 0x800 0x60>,
> +				 <&apps_smmu 0x820 0x60>,
> +				 <&apps_smmu 0x840 0x60>,
> +				 <&apps_smmu 0x860 0x60>,
> +				 <&apps_smmu 0x18a0 0x0>;
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			phys = <&csiphy0 PHY_TYPE_DPHY>, <&csiphy1 PHY_TYPE_DPHY>,
> +			       <&csiphy2 PHY_TYPE_DPHY>, <&csiphy4 PHY_TYPE_DPHY>;
> +			phy-names = "csiphy0", "csiphy1",
> +				    "csiphy2", "csiphy4";

Adding a separate node for PHYs and adding them in a a fixed phys property is not what I would
call an evolution, it will still require a per-platform data to associate a phy-name to a PHY
port... just add port/endpoint to link each camss port to each phy and make this dynamic.

Neil

> +
> +			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
> +					<&camcc CAM_CC_IFE_1_GDSC>,
> +					<&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			power-domain-names = "ife0",
> +					     "ife1",
> +					     "top";
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					camss_csiphy0_inep0: endpoint@0 {
> +						reg = <0>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					camss_csiphy1_inep0: endpoint@0 {
> +						reg = <0>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					camss_csiphy2_inep0: endpoint@0 {
> +						reg = <0>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					camss_csiphy4_inep0: endpoint@0 {
> +						reg = <0>;
> +					};
> +				};
> +			};
> +
> +			csiphy0: phy@ace4000 {
> +				compatible = "qcom,x1e80100-csi2-phy";
> +				reg = <0 0x0ace4000 0 0x2000>;
> +
> +				clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> +					 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +					 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +					 <&camcc CAM_CC_CPAS_AHB_CLK>;
> +				clock-names = "csiphy",
> +					      "csiphy_timer",
> +					      "camnoc_axi",
> +					      "cpas_ahb";
> +
> +				operating-points-v2 = <&csiphy_mxc_opp_table>;
> +
> +				interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +				power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +						<&rpmhpd RPMHPD_MXC>,
> +						<&rpmhpd RPMHPD_MMCX>;
> +				power-domain-names = "top",
> +						     "mx",
> +						     "mmcx";
> +
> +				#phy-cells = <1>;
> +
> +				status = "disabled";
> +			};
> +
> +			csiphy1: phy@ace6000 {
> +				compatible = "qcom,x1e80100-csi2-phy";
> +				reg = <0 0x0ace6000 0 0x2000>;
> +
> +				clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
> +					 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +					 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +					 <&camcc CAM_CC_CPAS_AHB_CLK>;
> +				clock-names = "csiphy",
> +					      "csiphy_timer",
> +					      "camnoc_axi",
> +					      "cpas_ahb";
> +
> +				operating-points-v2 = <&csiphy_mxc_opp_table>;
> +
> +				interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
> +
> +				power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +						<&rpmhpd RPMHPD_MXC>,
> +						<&rpmhpd RPMHPD_MMCX>;
> +				power-domain-names = "top",
> +						     "mx",
> +						     "mmcx";
> +
> +				#phy-cells = <1>;
> +
> +				status = "disabled";
> +			};
> +
> +			csiphy2: phy@ace8000 {
> +				compatible = "qcom,x1e80100-csi2-phy";
> +				reg = <0 0x0ace8000 0 0x2000>;
> +
> +				clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
> +					 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +					 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +					 <&camcc CAM_CC_CPAS_AHB_CLK>;
> +				clock-names = "csiphy",
> +					      "csiphy_timer",
> +					      "camnoc_axi",
> +					      "cpas_ahb";
> +
> +				operating-points-v2 = <&csiphy_mxc_opp_table>;
> +
> +				interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
> +
> +				power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +						<&rpmhpd RPMHPD_MXC>,
> +						<&rpmhpd RPMHPD_MMCX>;
> +				power-domain-names = "top",
> +						     "mx",
> +						     "mmcx";
> +
> +				#phy-cells = <1>;
> +
> +				status = "disabled";
> +			};
> +
> +			csiphy4: phy@acec000 {
> +				compatible = "qcom,x1e80100-csi2-phy";
> +				reg = <0 0x0acec000 0 0x2000>;
> +
> +				clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
> +					 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +					 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +					 <&camcc CAM_CC_CPAS_AHB_CLK>;
> +				clock-names = "csiphy",
> +					      "csiphy_timer",
> +					      "camnoc_axi",
> +					      "cpas_ahb";
> +
> +				operating-points-v2 = <&csiphy_mxa_opp_table>;
> +
> +				interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
> +
> +				power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +						<&rpmhpd RPMHPD_MX>,
> +						<&rpmhpd RPMHPD_MMCX>;
> +				power-domain-names = "top",
> +						     "mx",
> +						     "mmcx";
> +
> +				#phy-cells = <1>;
> +
> +				status = "disabled";
> +			};
> +
> +			csiphy_mxc_opp_table: opp-table-mxc {
> +				compatible = "operating-points-v2";
> +
> +				opp-300000000 {
> +					opp-hz = /bits/ 64 <300000000>;
> +					required-opps = <&rpmhpd_opp_low_svs_d1>,
> +							<&rpmhpd_opp_low_svs_d1>;
> +				};
> +
> +				opp-400000000 {
> +					opp-hz = /bits/ 64 <400000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>,
> +							<&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-480000000 {
> +					opp-hz = /bits/ 64 <480000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>,
> +							<&rpmhpd_opp_low_svs>;
> +				};
> +			};
> +
> +			csiphy_mxa_opp_table: opp-table-mxa {
> +				compatible = "operating-points-v2";
> +
> +				opp-300000000 {
> +					opp-hz = /bits/ 64 <300000000>;
> +					required-opps = <&rpmhpd_opp_low_svs_d1>,
> +							<&rpmhpd_opp_low_svs_d1>;
> +				};
> +
> +				opp-400000000 {
> +					opp-hz = /bits/ 64 <400000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>,
> +							<&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-480000000 {
> +					opp-hz = /bits/ 64 <480000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>,
> +							<&rpmhpd_opp_low_svs>;
> +				};
> +			};
> +		};
> +
>   		camcc: clock-controller@ade0000 {
>   			compatible = "qcom,x1e80100-camcc";
>   			reg = <0 0x0ade0000 0 0x20000>;
> 


