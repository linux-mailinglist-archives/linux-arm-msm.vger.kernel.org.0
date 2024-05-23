Return-Path: <linux-arm-msm+bounces-20297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5BE8CCEC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 11:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 854BD2821AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 09:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888BD5B5B8;
	Thu, 23 May 2024 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yX0NSgue"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D8713CF93
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2024 09:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716455203; cv=none; b=XnaqeHH4k5YSB/2CEYnsL3IxUenNb4IKYHAnqXv6BXQPy8OQcwKcO/2tjd7HK+KjRwxX2JgdswZdl83KLYUPhwiAWvzcOWvTPpwq86mt3ZgPAUGjm0YevQrD6ivbVplwP/ra2OEZOGi4cc6OY6hNV9yiY56TA3my3Yc/Wkdnioc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716455203; c=relaxed/simple;
	bh=q+vWQ0wSq5VGqQvuf6ip+bl2B+qPr7a4L/s2DMEIKhc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cr+8+UeHwEQpZ3ibI14DnOAcJX9661tnvuzVEyUf2nZ1uw2aq04uCOufUC0C+UW3YUwI8xUgD+DJUfx7uZ+2/rK6eP1xrwRwlvQsftAi/i4jQXPDok4sOlZkHj0uii4aWMondND8DIAjWr3dIbeD3GeroLb/sC1xEjEaQ1pje1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yX0NSgue; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a59b81d087aso1058619366b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2024 02:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716455200; x=1717060000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KeTryMhYF8Bv+Eu9Cw5VgyH5Tkq4hHi6Ok4bLDS0p0g=;
        b=yX0NSgue9VfB+w6TtG9dYlRpBMwq1cKYr24Wp/U5oMTiBvTTYhiJ8sbiu2xghwGuU1
         7N/64ZIYKWjjCZUTuGX08iY4pa+11pgkLuj2vMewle6wQ0a2HuzhFCU5Tz8Jl/JBjsKU
         5hnLoDDO4S7UinCziHZSiChCI0EB8baaQcSni4loGHeV1uLePI2y4L/jbRhuUe5qB2qE
         BbZRQmGn05o429jG3McSIYOvGqUD0Q0pFMOD2UaKe5zpsVwoqdoNqbMWm/66Z7AkYm3c
         4n1S4QzHXBYjnkQGnS7Nd4oFYclNFd6rqfZ0Xvx2kQtvl+GqrcMIjiQTqlL7Sg0O9EDq
         WIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716455200; x=1717060000;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KeTryMhYF8Bv+Eu9Cw5VgyH5Tkq4hHi6Ok4bLDS0p0g=;
        b=BE27WnY2A5ataRbk35FtJtrDcPAeHZBppWo2OMXT9j6BhOEOF4FfxVBi5Y22B1WpT/
         3/7RE+FZbNmK7srGKhrAvsCWu9n7oCEdNK1Rkd01eeeXcOzhr2tXPB7VGZ4MGfXKxIlq
         32n/IjhhiRXG9/Wph+YvympWQJI+wud9sprq5ZZdJpUtxWSa3JqLudShCqvkNwLCuQK7
         TttJ5ukkhL34ZeRUIrLZCAXlFyBOTbVEG7I2VLF/Owfnn0R0Bmpp8R9e4qciDqUi36qw
         CQFY+oOcGQ6ymxS0pBBr6+YY/md2wr5+vUyds169tdPb8ii//cMWBNr/qA+FJaAfwEqI
         rC1w==
X-Forwarded-Encrypted: i=1; AJvYcCVHsZk+vingdMOgCB3VgrGcYqE25HmTMRQpb9ZP/Erv2XhVHNyc7FZ2A1RwvT+slTMWgYRn2fjHNG3XgXLlrGyjF4WdXDaU6TvnPGemWg==
X-Gm-Message-State: AOJu0YwmRBqjETMHZGoLFEyDe91m7An482BkwwksX9oMgaJ3ru31MTbS
	IcADrxSEIwm1mgWVFOugI/DntHk9xNYqsP044nDujaG1pVWDtUj3qcR8zm5+gmo=
X-Google-Smtp-Source: AGHT+IEs1c5xO8f7f8eqHoNwr3xE5DYwUOIKsTj7els7FbsktBhUyhhk9D0XSIWDR3Tha3n4T/gYAg==
X-Received: by 2002:a17:906:1593:b0:a59:c2c3:bb4c with SMTP id a640c23a62f3a-a622820a6abmr368800266b.70.1716455199946;
        Thu, 23 May 2024 02:06:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:825d:600a:c16:a973? ([2a01:e0a:982:cbb0:825d:600a:c16:a973])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d2dcsm1904867366b.44.2024.05.23.02.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 02:06:39 -0700 (PDT)
Message-ID: <cbc8a2c6-0047-4345-8c93-afdba9c2bd10@linaro.org>
Date: Thu, 23 May 2024 11:06:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RFT 0/7] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
To: Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org>
 <CZUHV429NTF7.1GW9TN9NXB4J1@fairphone.com>
 <7a7aa05f-9ae6-4ca0-a423-224fc78fbd0c@linaro.org>
 <liah4xvkfattlen7s2zi3vt2bl5pbbxqgig3k5ljqpveoao656@iacnommxkjkt>
 <236a104c-fc16-4b3d-9a00-e16517c00e3a@linaro.org>
 <D064242SMIVM.1GUC1I9GE9IGC@fairphone.com>
 <963b60e5-6ab7-4d9f-885a-ba744c2b7991@linaro.org>
 <D0C42YR1270X.23P9WCWWNB8XF@fairphone.com>
 <f2d96f99-d8ac-4ff1-83fa-742e541565e4@linaro.org>
 <864063fb-eeae-4eb7-9089-0d98011a0343@linaro.org>
 <D15RKEU49B4G.1B6A2MYB4LH3X@fairphone.com>
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
In-Reply-To: <D15RKEU49B4G.1B6A2MYB4LH3X@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lucas,

On 10/05/2024 08:51, Luca Weiss wrote:
> On Tue Apr 23, 2024 at 4:08 PM CEST,  wrote:
>> On 23/04/2024 15:03, Konrad Dybcio wrote:
>>>
>>>
>>> On 4/5/24 12:19, Luca Weiss wrote:

<snip>

> 
> Next, with DP 4 lane (not working on mainline but still plugged into a
> screen) the diff is quite a bit bigger.
> 
> See attachments for the full files:
> * usb_1_qmpphy_20240503_151052_android_4lane.txt
> * usb_1_qmpphy_20240503_122443_mainline_4lane.txt
> 
> Not attaching the diff because it's quite a lot
> $ diff --ignore-case -U0 usb_1_qmpphy_20240503_151052_android_4lane.txt usb_1_qmpphy_20240503_122443_mainline_4lane.txt
> 
> Not sure this is helpful to anyone, but at least wanted to share what
> I've done so far here.

Thanks a lot for the traces, it founds out the QPHY_V3_DP_COM_PHY_MODE_CTRL stays at 0x3,
which means the mode doesn't get broadcasted to the phy because.... the retimer only broadcasts
the orientation and not the mode... and it works on the HDKs and the X13s because they don't have retimers.

So I made the changes in nb7vpq904m and ptn36502 drivers to get the next mux and broadcast the typec mode,
if you find time could you test it ?

Bjorn could you also test on the rb3gen2 ?

The changes:
https://git.codelinaro.org/neil.armstrong/linux/-/commit/a61fb3b816ecbe28a12480367d9e09b700ec09e1
https://git.codelinaro.org/neil.armstrong/linux/-/commit/f6f976ff692bad430cd945f02b835e355f19632b

Thanks,
Neil

> 
> Regards
> Luca
> 
>>
>> Neil
>>
>>>
>>> Konrad
> 
> 


