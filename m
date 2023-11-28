Return-Path: <linux-arm-msm+bounces-2223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA347FB514
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 10:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 646651C21256
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 09:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A852358AA;
	Tue, 28 Nov 2023 08:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lQfWA8iA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B95AF4
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 00:59:53 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c993da0b9eso37438851fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Nov 2023 00:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701161991; x=1701766791; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2BakYcGgqp0kJB3n7H4gdGk25DfuvAIGclFF4AFOAo=;
        b=lQfWA8iAjSfFjLu41ROZg5NQoeqecGSnAM75yPoAw89Mqv9RVD8A1IcYZJqyUoLz+U
         7dDS/5Dm9esrw9u9JFHmfsx8n4yRk1c/+eeP6yrPlY4GzQuFCIVVV32baBUu+NDomPkh
         +KfzDUopiXJ2moU8DNAiA5s3gPtCc2qu3JYMXFqsJmuGoosXkQq7Tg+qO2909Mlq8zU+
         fnhZh/bwGbJdbZ2rnCMk7RM1O++CWujTbTUqrWpHYjzlcPrurJ878xNY5ZN3VUZHyeew
         sDiUEHR/WrGIyPheIOQo8oOjNZ9GQB3lnEFfYT+vgW9s/mew6ILiMh/5jsou2vHnMIpf
         hqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701161991; x=1701766791;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c2BakYcGgqp0kJB3n7H4gdGk25DfuvAIGclFF4AFOAo=;
        b=k566OLnqMce4D9Fcd8d2KtDh8QaZGVXurjUs7SJeFzKWDQ7rWVR+722Q+M2WW9DK8F
         IBS72b0Ec0iD13UuiijGjo5Us4apmvL01igTfsWP77hoRoDFX2QEGSEOIR6vwI0Pl1qm
         HzWV+Vm3Wb9hiwYYjnRnoe0yEydL6POLaJJFF1Ruc+cT6SVpNhLDI7EGxT7xZzqpnJso
         rFpYtUNDV6+WxDfH0zLr9+TY5rTQZ2MgEPR9G6T2rwRVxXvhTZXVTHzPtdwEDYca3cke
         UK+YFDl9ExdXui4fwVPbTImcw8f2UTVf1omxc1rYKPDZ3/y9hCNwnYlcWXB6K0t/T05f
         jxvg==
X-Gm-Message-State: AOJu0YyGiw+5VXZR9tUp6B9LsMKQ3HdhZcBYr0T2MAjCsGrn8LudI8M/
	PSSOyXfMOVVR81rQwqOGfwpWJw==
X-Google-Smtp-Source: AGHT+IFZSdmEUPX7kD3W5d3ANhGnQGfBaHbtzMGU1EThgWvD5DR/EiGeJwfk7caA9pwSTLM1fV0waw==
X-Received: by 2002:a19:7901:0:b0:507:a650:991d with SMTP id u1-20020a197901000000b00507a650991dmr8345854lfc.58.1701161991449;
        Tue, 28 Nov 2023 00:59:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe? ([2a01:e0a:982:cbb0:eada:f40e:7ab3:2afe])
        by smtp.gmail.com with ESMTPSA id o10-20020adfcf0a000000b00332cb5185edsm14233807wrj.14.2023.11.28.00.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 00:59:50 -0800 (PST)
Message-ID: <d9dcaa1c-1f4b-4425-ada4-de4197c22bcd@linaro.org>
Date: Tue, 28 Nov 2023 09:59:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/5] ASoC: codec: wcd-mbhc-v2: add support when connected
 behind an USB-C audio mux
Content-Language: en-US, fr
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-3-21d4ad9276de@linaro.org>
 <ZV+ODbskjFe5louc@finisterre.sirena.org.uk>
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
Organization: Linaro Developer Services
In-Reply-To: <ZV+ODbskjFe5louc@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2023 18:38, Mark Brown wrote:
> On Thu, Nov 23, 2023 at 03:49:13PM +0100, Neil Armstrong wrote:
> 
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(wcd_mbhc_typec_report_unplug);
> 
> ASoC is generally EXPORT_SYMBOL_GPL.

Bad copy paste from rest of the code... will fix

Thanks,
Neil

