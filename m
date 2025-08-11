Return-Path: <linux-arm-msm+bounces-68542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A74B2131E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 19:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A25A57A4D1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 17:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F321D2D3A71;
	Mon, 11 Aug 2025 17:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IzwgtAtv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CAE29BDBA
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 17:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754933244; cv=none; b=CjNwUPkTZikEM9pT7K3K+6tSL1cI8td/UtxPkYXbSnHRth8/hiv6r1P3dmGTUqZpe18W2RRiNrc4iVOUYn8kC4qYKo41wdgb4IuXeuOlBivlq/0MlmQcUcvzpHs6RsECSM/b/gTd2zSQ5agvqWCUHRFiCXWBwmYgeT1FYFi2F/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754933244; c=relaxed/simple;
	bh=oBdTxqPKIbAma/i7QMyH23HvNHluobbtLiwBoEX4yXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XAyIR6CmuShIQRSiQ1+DwzdMX7q5XRs4WHcp0tEwzXX0yPEq9wMdru6lQ0jQTKAHosq/MY8Dz2RpclTnZZCdyx04dz0UaWJtcaFPmB4lnBQztNZ6Vt4yGB44phbmJ/oKAwot8eQozo26OpSS2wffZhO7YKRIhZxl6FsD51rj2vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IzwgtAtv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b79bddd604so2699637f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754933241; x=1755538041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXe3oMcNYYT4mns/cdffmItPqtrlHjIjLChPEwu6yu0=;
        b=IzwgtAtvBuLWvi5eqZT4MyoPt5yzv6gvskJRIlzCCRTPLzs0ttMcGdWPZKMq/mp0xt
         ZPmHxXzHBVLtodOxH1hGFkjAWSxuFVXSSTOND1QBryqeGYTb9PJE/Bf9sfMsBphes/22
         qXkO5AK3JWzVvrhcqUxeaFezctiQV+GJ4UJZEhAw5BSKmaJv2tI672G9tVU+lvo5qGM/
         VTXTGIk0EspreHSc2PdqVutORXW8vkMzNX6oSktenNImk2zO1Fv6AzTdxAkKcVnoEzfc
         ZVpqRls7v2+FSAm/jmldOu17beOmlZjP2vdeLIuaTfBtzzWGvrf67uE+h00tfTjAOD97
         sF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754933241; x=1755538041;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NXe3oMcNYYT4mns/cdffmItPqtrlHjIjLChPEwu6yu0=;
        b=Y84Ip1TyaxBKdpj++N9l1islut+pMKOFCgAmLjS9OI+eWQ5WRPCcvBBYEElumvi6po
         AxhG5w8QaLtr7gVmT1W104Ip3Dy3MUFso2LoJaAyc9dDuZNLAjzDErVvlXmSijtJLW3n
         75XbDCxH9cWIsRx+jGq3QEoOwKVOJESQFBZXJ3YsMDi2wdUC5G5tc/QD+Qj14zwcLJ5r
         sBSQZia5TPZMpnyWgPOcwR1S06BMUKNMkyE3AxME62JEURdwC66je/AGQoJ99ZTeW1Yo
         zyObgz0EwHuVuNXUUBbAGR81H6pu7JXRyxnGAeFUTTtW+QvTYMXnLMzc0IIB6iTf+S6F
         bh+w==
X-Forwarded-Encrypted: i=1; AJvYcCXkBMQ6T+LMYcP1sYa8rgoMSJlGPGtZAesy/EfLlFxNIDFS8y9WKerKZi2pcJVESsBRRDXbbIHcSysqAbzi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9QKtbpvYcj/w3KC6Qd7sxcwO7p58f96sPRXL+TwxOtSE8IE+j
	uJoBifYiF+P7Nzp9qavjF16NvpbzHXBEs55SvDIky+5TvA0rFqcUcPvHkx3Qju3gwY/Po88lKvU
	bVl3Q
X-Gm-Gg: ASbGncuo/k1m7+CfC5ddJDlUFjuMwsj02Z3EvJhFnUmYOzU5TUaBUQjJ3ahRkOS2XGS
	ULCbCh76uXOCU3kwThoByxeFGd/PDnAIRDizEu/TFpdmMO2C3NJ9eizNntxvcxKCshZStoLcSYx
	/DaSZTgSvXYml4Ak8rtz1YCVPgTkU7iyMwkwCcjVH3c3acoQnMYvpjwsCzO5tvWJx5bvAPMULaV
	OcCLiS6lVw0KJOU3JZgdjUhlHwKGd5xCmk5j6hKn+1ydf7GDBHwa6ibvpNouQnnyn6cxCIP9GFz
	4nk5MSHEw5w5PjI53g4L7IxEk9ydKS72v7YGv8iY4z7kVdpfnHXjc9YrOhsHGBlNvb5ntrN2NFg
	IkOThq+y3L1+jx4yKxNCfEReyYprrBPJQVLB0WucLilbPQ3ahtcdMqdpHTDPWh0UJyoPNnlWjl6
	g=
X-Google-Smtp-Source: AGHT+IFXH1MhGzvGB7oVp7Zph1jzJAZ+OdG4MQzi4NRmUzTr/P+qbxicUVWnGDGrds5h6H9pYXwtpw==
X-Received: by 2002:a05:6000:220f:b0:3b7:644f:9ca7 with SMTP id ffacd0b85a97d-3b910fe019cmr483345f8f.25.1754933241412;
        Mon, 11 Aug 2025 10:27:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b0fa:b045:4b82:de09? ([2a01:e0a:3d9:2080:b0fa:b045:4b82:de09])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458b501f22dsm249243435e9.0.2025.08.11.10.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 10:27:21 -0700 (PDT)
Message-ID: <5e3e3c8d-b382-4a50-a474-b9a01f940a53@linaro.org>
Date: Mon, 11 Aug 2025 19:27:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC v2 0/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
To: Bjorn Andersson <andersson@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
References: <20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org>
 <175449112353.639494.1882304081892662235.robh@kernel.org>
 <bs4bgbyrph4xwsianzvkonpmi72muihob2yaip3gz4yhlqon2s@uvbwrhlr2xlr>
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
In-Reply-To: <bs4bgbyrph4xwsianzvkonpmi72muihob2yaip3gz4yhlqon2s@uvbwrhlr2xlr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/08/2025 18:15, Bjorn Andersson wrote:
> On Wed, Aug 06, 2025 at 09:40:29AM -0500, Rob Herring (Arm) wrote:
>> On Wed, 06 Aug 2025 14:38:29 +0200, Krzysztof Kozlowski wrote:
> [..]
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/video-codec@aa00000: failed to match any schema with compatible: ['qcom,sm8750-iris']
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): 'required-opps' is a required property
>> 	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
> 
> Can anyone help me understand why required-opps is a required property
> in the videocc binding?

Tee DT changes are to be picked, see https://lore.kernel.org/all/0a6baf09-b1b8-4573-b53d-574838efd9ec@quicinc.com/

I asked for them to be re-sent, but no...

Neil

> 
> Is there a valid level below "low_svs" that is otherwise selected, but
> insufficient to keep the clock controller ticking?
> 
> Regards,
> Bjorn


