Return-Path: <linux-arm-msm+bounces-70320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AD4B313E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F2F7627DB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889C02FA0D3;
	Fri, 22 Aug 2025 09:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a0a/ehrZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C4E2F8BF4
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855333; cv=none; b=MwsheC9Staqrx/rykkMBGS7hOrdxFthgAT3AtX1kJd2Tkc+XERsdJXnYXKluAq3ZdDisECnyprj9Ed51wJmotiKtiY1FcGtInavmeTy+ePv8678rBCH626bVJZXXqlaRryD1y4m5C3N/cvRSh4jtNZPiB2TVHDA4t6lyQiS9mHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855333; c=relaxed/simple;
	bh=u2cVZCViLmM0qGu+nHCKy5aS4XNiSfo4aTc8MMywpew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RpzNGh/7t8WcUWCL5j9NWWyRQI9EknMF84kRrzOfk26D2o7m4Ax4dcfvxl1gng6SS6Oa7zUffp8eF3tEpsLEv2ZGbC5Nwh1NlNr+usv6w4xYI1YYOq3mlwIadHZonnfuMAoKRJXra0VJgrYjsHivSP1TkdCj1xiPHmzloaa5+qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a0a/ehrZ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b9dc5c2f0eso1012343f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 02:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755855328; x=1756460128; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJkW9jOdewoj0W9ptZbkJ608Pxc0QK82I1kL9/NJC98=;
        b=a0a/ehrZdcTI55fygq5cj1TlhARWCwekzYiSa3ff47F148jFUzCGB7pG8EbKIRX/3L
         09Qf87e9fyhyUKcMRyVaucsY01MGoKg7XXFzCIzc3C4uifGkGTLzWxl9TJVwT2yqwoVQ
         z0BrgmUYFxeaAxQCJ5YhBQvm7i3TMsNzPmU81DjGuptv7bDXmlvTnOmsy+OlbHyW4AK2
         93kl/Qmsk4oVnuNu1mUbBVd5wVWHaflSWIeSV0efhA1LT5+Gzs2TTvxLSIxOOaGiuEfz
         zY9kJ2njTWMLDSaxqNbNh3PdP2kjGlZsA7MT9yykzZEh6pQIW1tKs+p2775xa7s0wsTL
         AfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755855328; x=1756460128;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OJkW9jOdewoj0W9ptZbkJ608Pxc0QK82I1kL9/NJC98=;
        b=PNyrTVJOhr0VCr1OKnPbWNdkUu+an0XHdyb0JsB3U4Zv5h7qWcs5s/mQESMoFvDUoS
         giptdLvbPNPMHix2YiVF6UhF7xyuAdhcStvNQVqVNlrBwGqvRY+3IeTsFzl1sha6d2HT
         aQEas5IZtQEb5nBihw3Z52lgy1ZqGrfNQt0Y22lA8MmuG/JPNLc9rvHx/OEkne4VwYd2
         ZoIWl8C9XK1vGew10aJmt/M5WXzyDwRTKw2DbHNM3jn+XodP6TDENPJ3xogH8rhhWW2N
         u1+u+lKfPgeVLuCdoKH+RW2iQ72kMc94lHegMwDVhRPa29ah3dBWrQ9lTSX+E0nx+WM7
         BCCA==
X-Forwarded-Encrypted: i=1; AJvYcCVUYixhvdYygqL1ZGzWoAbaShyLnzXQT3eB09f5+CBhbidi4lrGt3fPtV/R6hHi6Hc98pNUrifcLfcXab6t@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+aGdaewhQD/KmmkYh83skrxmQRc+ZDzliMzCMx0w/NMMUU/LH
	rwfS80MMMXE1t2JkMw+mUV9EzGh+dkLobO5vN28RTOpnwNY2GeXzQDq+/YIIEUYxwuw=
X-Gm-Gg: ASbGncvCdNMpI0pURj0rQSwPrOlo3w9B/NzHjfKPhlQxa2oHJ2GqkRXOmvtHKGxIovs
	UJrB2IYXIHMVAKZKpLJeqCnSOORTxbgrVfAEhh8M7p3voFKn7gz64/AHc/Wm01LIYtrzswGLdtq
	krLiiDk64cu0ywxvql63upY3d9mYfBym1cJyqjLsZvyYcvqAKH8epj5Vagk5C5bdv6irSoYqnFM
	BBHVBitaglngO0hKHKEs1bRRatHbF3US2KxAp7CE2gzqrDF6M3E9DlfGnjqmS1+fs7V44nZcV3N
	MFSspFcbAqWBYlWaeFamgTVEOgrGyNHhzQS8sige1F+UkqAscDZFxToqbNlZ8iDglBASd2j8RDa
	rvg65Jd8j6SBVkZx9FdzlQeVBSIZaL/MEtggKz2QWc8kJ8fiZcJ5mX/sQ91lo69052F1WMGdor2
	8=
X-Google-Smtp-Source: AGHT+IHLpgQ4dn+cM03lopM+8J38FUhN5HG9CkM9OhhaBf0+riVpwc8dRtPrCsKf5QsWgdRMaAlFJA==
X-Received: by 2002:a05:6000:288a:b0:3b7:92ca:2831 with SMTP id ffacd0b85a97d-3c5daa2800dmr1587093f8f.12.1755855327805;
        Fri, 22 Aug 2025 02:35:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3dd7:7361:c101:6a77? ([2a01:e0a:3d9:2080:3dd7:7361:c101:6a77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0777892basm14547830f8f.56.2025.08.22.02.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 02:35:27 -0700 (PDT)
Message-ID: <9f6ee709-662e-4bd1-ac28-601bb530458c@linaro.org>
Date: Fri, 22 Aug 2025 11:35:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 01/10] arm64: dts: qcom: x1e80100: Add pinctrl template
 for eDP0 HPD
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Abel Vesa <abel.vesa@linaro.org>, Xilin Wu <wuxilin123@gmail.com>,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Srinivas Kandagatla <srini@kernel.org>, Sibi Sankar
 <quic_sibis@quicinc.com>, Rajendra Nayak <quic_rjendra@quicinc.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250822-x1e80100-add-edp-hpd-v2-0-6310176239a6@linaro.org>
 <20250822-x1e80100-add-edp-hpd-v2-1-6310176239a6@linaro.org>
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
In-Reply-To: <20250822-x1e80100-add-edp-hpd-v2-1-6310176239a6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/08/2025 11:28, Stephan Gerhold wrote:
> At the moment, we indirectly rely on the boot firmware to set up the
> pinctrl for the eDP HPD line coming from the internal display. If the boot
> firmware does not configure the display (e.g. because a different display
> is selected for output in the UEFI settings), then the display fails to
> come up and there are several errors in the kernel log:
> 
>   [drm:dpu_encoder_phys_vid_wait_for_commit_done:544] [dpu error]vblank timeout: 80020041
>   [drm:dpu_kms_wait_for_commit_done:524] [dpu error]wait for commit done returned -110
>   [drm:dpu_encoder_frame_done_timeout:2715] [dpu error]enc40 frame done timeout
>   ...
> 
> Add a new &edp0_hpd_default pinctrl template that can be used by boards to
> set up the eDP HPD pin correctly. All boards upstream so far need the same
> configuration; if a board needs a different configuration it can just avoid
> using this template and define a custom one in the board DT.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index f293b13ecc0ce426661187ac793f147d12434fcb..32fa9fa6fb946c4933f74fd0ee820ecb9284901e 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -5808,6 +5808,12 @@ tlmm: pinctrl@f100000 {
>   			gpio-ranges = <&tlmm 0 0 239>;
>   			wakeup-parent = <&pdc>;
>   
> +			edp0_hpd_default: edp0-hpd-default-state {
> +				pins = "gpio119";
> +				function = "edp0_hot";
> +				bias-disable;
> +			};
> +
>   			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
>   				/* SDA, SCL */
>   				pins = "gpio0", "gpio1";
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

