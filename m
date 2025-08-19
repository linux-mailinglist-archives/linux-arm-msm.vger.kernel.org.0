Return-Path: <linux-arm-msm+bounces-69701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B97AB2BDC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46FC77B9D43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 09:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406AE31AF39;
	Tue, 19 Aug 2025 09:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SWB82A4P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62EB2773CB
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596612; cv=none; b=OdKTTc9ye0TmJp7LH5u6pOFU//5yqZGonL8V7IU7/3QCUbsMHSptxQWW9VGFoPQaqv2645GLEaEuySiSdt/uVdhiwVXJhaYWt+6TerFNUMXl7MWV28Ab3rVw+tauwkyK5T7QeEHsWjYvWhC+ZQW8k4LhBqd83Dtz5NDLF69qPio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596612; c=relaxed/simple;
	bh=g0ZQSSDWjXeANXVszXFg5R1z+7y+0W+C8DYO/dgRiQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4jsMnGXcsix4GMjWCbbcVcjuyBS3sU6OFv3e9FNfJbaJvnnahSJkP+ocw3FZJDE+2rxj0oedIFYAd6puETzEcoSfohu+rsTQndtL2JbPkfx6p8A+TUeZ85X64gfvlnKhDwbNOayjfuLDm7FngKmY7fEQcWyrIZht8/OJkn3tcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SWB82A4P; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b9dc5c2f0eso3270533f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 02:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596607; x=1756201407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rRnvcJ2f2fPQ8sZ2OC8GktyRnLPTrLj3Sq7t/FTrOnE=;
        b=SWB82A4PajiefsD9Tx7lUW/xs2sUP7FUOQ7J+U+tcUhGFjiFwQlOZcYyQ4DLoIEQnt
         2HnLu2rrBz9Iw0sWU+ZIc/yKQ4qjlTNHNWBlUbegbBLoAez758xoH0JhCao7MTZ9S21E
         VcLUlhAu/6CjZ7OOz4Zahu9rRhSY7vsLDyOrEf1eK/oQj6tYLp1mU0cNwIQav3XN8lyW
         CocfNDauboAKkfWFAhS2fQ1fyQSmuaDNmdN9Ip2Rn0uak2rwb2kvl/22YUJ7bB4+QDoG
         8wKSl8nLG8COKaUzdcLsjmPfVumsLQWMt1M3Ryhg6JbEXUwnrZ+7wdwIVuKORGs2DcoN
         VcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596607; x=1756201407;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rRnvcJ2f2fPQ8sZ2OC8GktyRnLPTrLj3Sq7t/FTrOnE=;
        b=FK2Lv68pvsz89fUGgvLJ8LBmyX+Xm80IxfsmitCuxY8g9/UX21wGfu6DRCgAv6r60f
         1o0kUjeAXh/kRhBkx2urkXVpSiS2evg9zUU/epE8mCiSxwEYvdaxV/fymvS2yQQE5G4q
         0OKcvYxftzQ6yUePmDBQk3WXyc0snIZZ5pQw7fFe3QInlbz3fX/SBbm6t/i54/jzxhRt
         hEjGzvVfbyVwo4RhjlAbRieAlNlOMP9YYQtQqTPypwUd2lTblMstrZPK3EwK8Aq9Ps2y
         55FV45R2kijLSIZZkzepUo2wQ5YGtVAm/PZbchNPrLBigoWL1hK1Mpsf5ySjNtheyzMK
         dShg==
X-Forwarded-Encrypted: i=1; AJvYcCXfn9Xq6x0VEKoY8hkpszeEBxIAdHXvXN+Ojhs/tRdkqwwYyeWNKDarOIKjgkUze573I+Dp3T2jUEbsshpw@vger.kernel.org
X-Gm-Message-State: AOJu0YyXmrNdBb03V5YR0O6VUo/Ci+Zs/P7G7QemEyxbpOjCxc1b/D95
	UPQrruiwmavWOazttsPpjDcO42Ga+xG8qxHs3IAlgutspyJhhuqo6tOeZ295U8Nnn98=
X-Gm-Gg: ASbGncuPTtaMz6WObVVYb39m2oI5dqskNwkucwE65T0V73O5+b8gEQNFsia88v7z0oe
	z8mjrSS+FnUXvxeyW+BBYCS/xfHSYs4FOTkp0id9H1/ZBbIn3eTJVK9YacwXZ9mA1YhkresMKaQ
	bp27Q1orTUloQ6qUSn4qYEKkFMNYvS0BAmUP/4AqwscLL9tptI4hcqEO4JHafUpMcWzJPcZlZPZ
	k2CvpkwgckV4Ufq98RSkKYoKkNTUJoUZHgJB8ae/xvFeV57cECW9iAGzRt879AKmc9jhhTKh6Iz
	dZQojhR5OLJbM/OBMATQbmjiyZRzm4ZqjSoY0jK5JqTaoGVdmQReG0EJZLT7UqLb0LdqvgT/TwN
	rLHQWjr7CV934brbXRVHniBkvA1QAxKszTaFUCvyb2KfS1ZU0gPvx7wqddBtPB5FxsJWnndTZdP
	5PpzKOmbE=
X-Google-Smtp-Source: AGHT+IHJcbfoHziYmKYumTTSzX3HBo05hfHJRAHATRASlvGKTD+Scv9wCOw89lV3HUAzWsOF4xrNaw==
X-Received: by 2002:a05:6000:2909:b0:3b7:92ca:2831 with SMTP id ffacd0b85a97d-3c0e028d43amr1435457f8f.12.1755596606910;
        Tue, 19 Aug 2025 02:43:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:e7a:79e6:53ed:ce35? ([2a01:e0a:3d9:2080:e7a:79e6:53ed:ce35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b437862afsm11782925e9.2.2025.08.19.02.43.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 02:43:26 -0700 (PDT)
Message-ID: <2d576dac-0f9d-4f04-8aef-b3df5f88c926@linaro.org>
Date: Tue, 19 Aug 2025 11:43:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 15/15] pinctrl: qcom: make the pinmuxing strict
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Tony Lindgren <tony@atomide.com>, Haojian Zhuang
 <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <20250815-pinctrl-gpio-pinfuncs-v5-15-955de9fd91db@linaro.org>
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
In-Reply-To: <20250815-pinctrl-gpio-pinfuncs-v5-15-955de9fd91db@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/08/2025 11:09, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The strict flag in struct pinmux_ops disallows the usage of the same pin
> as a GPIO and for another function. Without it, a rouge user-space
> process with enough privileges (or even a buggy driver) can request a
> used pin as GPIO and drive it, potentially confusing devices or even
> crashing the system. Set it globally for all pinctrl-msm users.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index a5f69464827119dfe2a7781b558094b283fca215..1751d838ce95d6138c824b90098f74891dec7656 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -268,6 +268,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
>   	.function_is_gpio	= pinmux_generic_function_is_gpio,
>   	.gpio_request_enable	= msm_pinmux_request_gpio,
>   	.set_mux		= msm_pinmux_set_mux,
> +	.strict			= true,
>   };
>   
>   static int msm_config_reg(struct msm_pinctrl *pctrl,
> 

I tested the patchset on CI, and I got the following errors:

db410c:
https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253304#L537
[    4.056081] msm8916-pinctrl 1000000.pinctrl: pin GPIO_38 already requested by 1000000.pinctrl:550; cannot claim for 7864900.mmc
[    4.061402] msm8916-pinctrl 1000000.pinctrl: error -EINVAL: pin-38 (7864900.mmc)
[    4.077245] msm8916-pinctrl 1000000.pinctrl: error -EINVAL: could not request pin 38 (GPIO_38) from group gpio38 on device 1000000.pinctrl
[    4.088430] sdhci_msm 7864900.mmc: Error applying setting, reverse things back
[    4.100751] msm8916-pinctrl 1000000.pinctrl: pin GPIO_38 already requested by 1000000.pinctrl:550; cannot claim for 7864900.mmc
[    4.107960] msm8916-pinctrl 1000000.pinctrl: error -EINVAL: pin-38 (7864900.mmc)
[    4.107970] msm8916-pinctrl 1000000.pinctrl: error -EINVAL: could not request pin 38 (GPIO_38) from group gpio38 on device 1000000.pinctrl
[    4.126971] sdhci_msm 7864900.mmc: Error applying setting, reverse things back
[    4.139203] sdhci_msm 7864900.mmc: failed to activate pinctrl state sleep

rb3gen2:
https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253305#L1120
[    4.155880] sc7280-pinctrl f100000.pinctrl: pin GPIO_91 already requested by f100000.pinctrl:638; cannot claim for 8804000.mmc
[    4.167636] sc7280-pinctrl f100000.pinctrl: error -EINVAL: pin-91 (8804000.mmc)
[    4.179817] sc7280-pinctrl f100000.pinctrl: error -EINVAL: could not request pin 91 (GPIO_91) from group gpio91 on device f100000.pinctrl
[    4.196265] sdhci_msm 8804000.mmc: Error applying setting, reverse things back
[    4.196293] sc7280-pinctrl f100000.pinctrl: pin GPIO_91 already requested by f100000.pinctrl:638; cannot claim for 8804000.mmc
[    4.203735] sc7280-pinctrl f100000.pinctrl: error -EINVAL: pin-91 (8804000.mmc)
[    4.203743] sc7280-pinctrl f100000.pinctrl: error -EINVAL: could not request pin 91 (GPIO_91) from group gpio91 on device f100000.pinctrl
[    4.235716] sdhci_msm 8804000.mmc: Error applying setting, reverse things back
[    4.235722] sdhci_msm 8804000.mmc: failed to activate pinctrl state sleep

x1-qcp:
https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253310#L1776
[    5.881549] mmc0: SDHCI controller on 8804000.mmc [8804000.mmc] using ADMA 64-bit
[    5.889494] x1e80100-tlmm f100000.pinctrl: pin GPIO_71 already requested by f100000.pinctrl:665; cannot claim for 8804000.mmc
[    5.901103] x1e80100-tlmm f100000.pinctrl: error -EINVAL: pin-71 (8804000.mmc)
[    5.913184] x1e80100-tlmm f100000.pinctrl: error -EINVAL: could not request pin 71 (GPIO_71) from group gpio71 on device f100000.pinctrl
[    5.913186] sdhci_msm 8804000.mmc: Error applying setting, reverse things back
[    5.913188] x1e80100-tlmm f100000.pinctrl: pin GPIO_71 already requested by f100000.pinctrl:665; cannot claim for 8804000.mmc
[    5.929538] x1e80100-tlmm f100000.pinctrl: error -EINVAL: pin-71 (8804000.mmc)
[    5.948557] x1e80100-tlmm f100000.pinctrl: error -EINVAL: could not request pin 71 (GPIO_71) from group gpio71 on device f100000.pinctrl
[    5.955983] sdhci_msm 8804000.mmc: Error applying setting, reverse things back
[    5.975984] sdhci_msm 8804000.mmc: failed to activate pinctrl state sleep

Neil

