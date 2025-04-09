Return-Path: <linux-arm-msm+bounces-53635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CAEA82503
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 14:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE2F07B80F7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 12:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AFD2620D3;
	Wed,  9 Apr 2025 12:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IAGkxqek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EFB26157E
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 12:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744202211; cv=none; b=tgGVDrGymcqqgX376IiXRXVJoJPyLEAGBBFAVWK8jZ4SAmrVUOkm0MfVJLYf/FCyq08gPApajmF9lKHHq82RFlHeLoQRnF0UfTvtNAnLjln8hUMxPvJQa6byKX6/aKTiecVO+rps/GazEfjoKxSPxvRIWy9w6FY7Sn27fVVmZr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744202211; c=relaxed/simple;
	bh=QvGqeVyR+0/+b53m3cQsHwf9C+sdmlzj4AS84hbQ1b0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rvTTh6I5cAJZc40r9E1zDH/aQNoRcqLwodFFiMSFBbf6jP1eCy7ZyxLUQmik0j7a0p0Q5MPsvtT/BgkKpzFIbOoekqAhUIJT4WNP72OFaVbCoUUxyrbBE59kBhxHT6MIeV9LmBHnTGCvjrBYUoG6XDkSsKpipVzANEsfQR98SW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IAGkxqek; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso71861215e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 05:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744202206; x=1744807006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KwK0naV27RrZvDNLnQVM+49TIANDOYakUt8eI4RWU/s=;
        b=IAGkxqekfxaGkGlmPDboVojM3RIYSFbBSv5g/7UhYDEA8R79JgNiDAg0G56K1udF/o
         3myLPkcf9H+TLaL1N5i3d+SZokx4TTZoD2vbcI1f2VtUQyWzqaAS89zC3V2Zsrh8vaTG
         c+K9Y/uCejS1x97jofR2EGb92YVpyK6L6lCYG6Hi6GqxtIGvrOcbAZzFTnsrW2uYDHa4
         z6rE0JMwj5Vg889H+/J4YzGjKnuXnFb8rR2ttSy5mbU3mgqvFun/OHamw3+BTWWC21sc
         awD50GE0Cy4mGpUKuCMsrK9eMbbCIGXjxRVVh7prdueU1M2xgaVt+31D8W6TlqXvjnQ8
         5vTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744202206; x=1744807006;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KwK0naV27RrZvDNLnQVM+49TIANDOYakUt8eI4RWU/s=;
        b=HmybNnOv2Bixbyr49WgCUYqxIQE8Y7Lqp7H9YfjHsEsiMKRJYr1muocRFU625+X4eU
         Lwcap/zOxXFzTPsRaMT4JdflJ3j4i9WeGnOlUe8RXPLwvpbLzGG47MSBpUGlpxXKiVYl
         PFvDaQidctkbQH4C+qf6y1zbm36hzpAF0mT3rz8MsVyy0U/EoitlU4z8Q1Y74bg8qI1h
         2QLcOgqzQGVtkJy1DPBWnT1JGWPiLqn84v/NAvqw5BXA61Ced8bIZ8VAFQllkcWgPxaU
         ik9cHtZTFbjDngDMJFKrViI5IHKmIpStMbMVdPd+kqLCE8YoNI1LlAdxA/Qe4NYFPRhc
         9YFg==
X-Forwarded-Encrypted: i=1; AJvYcCWE3ktqvnHWFifzuX0M3wTi76D/17YWmYv2aWt5dZfShOAyEGu8sfIrj00Bt32UGeew6lj+KW4KESI2z4iJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxlgfEUqgAeJnnNSCU0iiTnw9W31woPS6vY1PRJuQJnEKohXYAV
	g7kcOYp+FP0/X8X0LG1zOMf90B016Q8t8aio/5mZhkdP4zW0Jn6cOTBDI7jvfx0=
X-Gm-Gg: ASbGnctfNImZZ7uBjIWsFrFxxgIeGVeclACDA3riRiazQbSF8UGKdpp4StYcNnhB19O
	OmDHr0GPIhYJUTQ7qKkOZ0QRFysZLbbq3S1f6/DmZJENxaF7jwIMQSoKUKNRtEPn5gfq+Phnuqv
	PufYY3zwxzDOpDBzUwBM2hdux5yePq25aqXJ7GWR1m6Ai+D1U6jZlIsX2KrVzns0nPXUwvtzF6t
	L92q0h6xf47oUGJhTNWm7vCweH5E/A5KqufVzJ7k3S83zKXM40jQ+s6IKjjitB+tVwq/nBGgSXm
	HRX0R/fTPflZhIEJjYp5hUtspSBAVHQhw3Y6fgTMSWxQpH/miQXOMO1Yr7F4r6uIFL5h1vb85RB
	fKjN0zbwIqBsOslevDA==
X-Google-Smtp-Source: AGHT+IHBlyCqmjJJIWgNQo+0YLAowDIP7iInadYLTkkQDznweq1Zp91mujS5ucwbObvFMMcjnLhYpg==
X-Received: by 2002:a05:600c:c86:b0:43d:2313:7b54 with SMTP id 5b1f17b1804b1-43f1ec8d066mr29679945e9.3.1744202206227;
        Wed, 09 Apr 2025 05:36:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:87d9:979a:1261:ab65? ([2a01:e0a:3d9:2080:87d9:979a:1261:ab65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206332d9sm18743995e9.13.2025.04.09.05.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 05:36:45 -0700 (PDT)
Message-ID: <b13b4199-168e-419c-a897-298675533c67@linaro.org>
Date: Wed, 9 Apr 2025 14:36:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 4/5] media: platform: qcom/iris: rename iris_vpu3 to
 iris_vpu3x
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org>
 <20250407-topic-sm8x50-iris-v10-v3-4-63569f6d04aa@linaro.org>
 <808f48f4-ad4d-1afe-bf15-a8e57288f9d3@quicinc.com>
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
In-Reply-To: <808f48f4-ad4d-1afe-bf15-a8e57288f9d3@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2025 12:49, Dikshita Agarwal wrote:
> 
> 
> On 4/7/2025 8:54 PM, Neil Armstrong wrote:
>> The vpu33 HW is very close to vpu3, and shares most of the
>> operations, so rename file to vpu3x since we'll handle all vpu3
>> variants in it.
>>
>> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/media/platform/qcom/iris/Makefile          |   2 +-
>>   drivers/media/platform/qcom/iris/iris_vpu3.c       | 123 ---------
>>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 277 +++++++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
>>   4 files changed, 281 insertions(+), 124 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
>> index 35390534534e93f4617c1036a05ca0921567ba1d..473aaf655448180ade917e642289677fc1277f99 100644
>> --- a/drivers/media/platform/qcom/iris/Makefile
>> +++ b/drivers/media/platform/qcom/iris/Makefile
>> @@ -20,7 +20,7 @@ qcom-iris-objs += \
>>                iris_vb2.o \
>>                iris_vdec.o \
>>                iris_vpu2.o \
>> -             iris_vpu3.o \
>> +             iris_vpu3x.o \
>>                iris_vpu_buffer.o \
>>                iris_vpu_common.o \
>>   
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3.c b/drivers/media/platform/qcom/iris/iris_vpu3.c
>> deleted file mode 100644
>> index 13dab61427b8bd0491b69a9bc5f5144d27d17362..0000000000000000000000000000000000000000
>> --- a/drivers/media/platform/qcom/iris/iris_vpu3.c
>> +++ /dev/null
>> @@ -1,123 +0,0 @@
>> -// SPDX-License-Identifier: GPL-2.0-only
>> -/*
>> - * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> - */
>> -
>> -#include <linux/iopoll.h>
>> -
>> -#include "iris_instance.h"
>> -#include "iris_vpu_common.h"
>> -#include "iris_vpu_register_defines.h"
>> -
>> -#define AON_MVP_NOC_RESET			0x0001F000
>> -
>> -#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
>> -#define CORE_CLK_RUN				0x0
>> -
>> -#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
>> -#define CORE_BRIDGE_SW_RESET			BIT(0)
>> -#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
>> -
>> -#define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
>> -#define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
>> -
>> -#define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
>> -
>> -#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
>> -
>> -static bool iris_vpu3_hw_power_collapsed(struct iris_core *core)
>> -{
>> -	u32 value, pwr_status;
>> -
>> -	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
>> -	pwr_status = value & BIT(1);
>> -
>> -	return pwr_status ? false : true;
>> -}
>> -
>> -static void iris_vpu3_power_off_hardware(struct iris_core *core)
>> -{
>> -	u32 reg_val = 0, value, i;
>> -	int ret;
>> -
>> -	if (iris_vpu3_hw_power_collapsed(core))
>> -		goto disable_power;
>> -
>> -	dev_err(core->dev, "video hw is power on\n");
>> -
>> -	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>> -	if (value)
>> -		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>> -
>> -	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
>> -		ret = readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN + 4 * i,
>> -					 reg_val, reg_val & 0x400000, 2000, 20000);
>> -		if (ret)
>> -			goto disable_power;
>> -	}
>> -
>> -	writel(VIDEO_NOC_RESET_REQ, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
>> -
>> -	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
>> -				 reg_val, reg_val & 0x3, 200, 2000);
>> -	if (ret)
>> -		goto disable_power;
>> -
>> -	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
>> -
>> -	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
>> -				 reg_val, !(reg_val & 0x3), 200, 2000);
>> -	if (ret)
>> -		goto disable_power;
>> -
>> -	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
>> -	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> -	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> -	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> -
>> -disable_power:
>> -	iris_vpu_power_off_hw(core);
>> -}
>> -
>> -static u64 iris_vpu3_calculate_frequency(struct iris_inst *inst, size_t data_size)
>> -{
>> -	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
>> -	struct v4l2_format *inp_f = inst->fmt_src;
>> -	u32 height, width, mbs_per_second, mbpf;
>> -	u64 fw_cycles, fw_vpp_cycles;
>> -	u64 vsp_cycles, vpp_cycles;
>> -	u32 fps = DEFAULT_FPS;
>> -
>> -	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
>> -	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
>> -
>> -	mbpf = NUM_MBS_PER_FRAME(height, width);
>> -	mbs_per_second = mbpf * fps;
>> -
>> -	fw_cycles = fps * caps->mb_cycles_fw;
>> -	fw_vpp_cycles = fps * caps->mb_cycles_fw_vpp;
>> -
>> -	vpp_cycles = mult_frac(mbs_per_second, caps->mb_cycles_vpp, (u32)inst->fw_caps[PIPE].value);
>> -	/* 21 / 20 is minimum overhead factor */
>> -	vpp_cycles += max(div_u64(vpp_cycles, 20), fw_vpp_cycles);
>> -
>> -	/* 1.059 is multi-pipe overhead */
>> -	if (inst->fw_caps[PIPE].value > 1)
>> -		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
>> -
>> -	vsp_cycles = fps * data_size * 8;
>> -	vsp_cycles = div_u64(vsp_cycles, 2);
>> -	/* VSP FW overhead 1.05 */
>> -	vsp_cycles = div_u64(vsp_cycles * 21, 20);
>> -
>> -	if (inst->fw_caps[STAGE].value == STAGE_1)
>> -		vsp_cycles = vsp_cycles * 3;
>> -
>> -	return max3(vpp_cycles, vsp_cycles, fw_cycles);
>> -}
>> -
>> -const struct vpu_ops iris_vpu3_ops = {
>> -	.power_off_hw = iris_vpu3_power_off_hardware,
>> -	.power_off_controller = iris_vpu_power_off_controller,
>> -	.calc_freq = iris_vpu3_calculate_frequency,
>> -};
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..ea7be2e0a3a255f61e236740e1082e7c9207250d
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> @@ -0,0 +1,277 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/iopoll.h>
>> +#include <linux/reset.h>
>> +
>> +#include "iris_instance.h"
>> +#include "iris_vpu_common.h"
>> +#include "iris_vpu_register_defines.h"
>> +
>> +#define WRAPPER_TZ_BASE_OFFS			0x000C0000
>> +#define AON_BASE_OFFS				0x000E0000
>> +#define AON_MVP_NOC_RESET			0x0001F000
>> +
>> +#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
>> +#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
>> +#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
>> +#define REQ_POWER_DOWN_PREP			BIT(0)
>> +#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
>> +#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
>> +#define CORE_CLK_RUN				0x0
>> +
>> +#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
>> +#define CTL_AXI_CLK_HALT			BIT(0)
>> +#define CTL_CLK_HALT				BIT(1)
>> +
>> +#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
>> +#define RESET_HIGH				BIT(0)
>> +
>> +#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
>> +#define CORE_BRIDGE_SW_RESET			BIT(0)
>> +#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
>> +
>> +#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
>> +#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
>> +#define MSK_CORE_POWER_ON			BIT(1)
>> +
>> +#define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
>> +#define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
>> +
>> +#define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
>> +
>> +#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
>> +
>> +#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
>> +#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
>> +
>> +#define AON_WRAPPER_MVP_NOC_CORE_SW_RESET	(AON_BASE_OFFS + 0x18)
>> +#define SW_RESET				BIT(0)
>> +#define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
>> +#define NOC_HALT				BIT(0)
>> +#define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
>> +
>> +static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
>> +{
>> +	u32 value, pwr_status;
>> +
>> +	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
>> +	pwr_status = value & BIT(1);
>> +
>> +	return pwr_status ? false : true;
>> +}
>> +
>> +static int iris_vpu3x_power_off_hardware_begin(struct iris_core *core)
>> +{
>> +	u32 reg_val = 0, value, i;
>> +	int ret;
>> +
>> +	if (iris_vpu3x_hw_power_collapsed(core))
>> +		return 1;
>> +
>> +	dev_err(core->dev, "video hw is power on\n");
>> +
>> +	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>> +	if (value)
>> +		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>> +
>> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
>> +		ret = readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN + 4 * i,
>> +					 reg_val, reg_val & 0x400000, 2000, 20000);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void iris_vpu3x_power_off_hardware_end(struct iris_core *core)
>> +{
>> +	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
>> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> +	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>> +}
>> +
> I'm not a big fan of splitting the API into begin/middle/end just for the
> sake of de-duplication of small part of code. It ends up introducing a lot
> of jumps in the code, which makes it harder to follow.
> Keeping it as a single flow, even with some duplication, would be more
> readable and maintainable.

OK, will un-split them.

Thanks,
Neil

>> +static void iris_vpu3_power_off_hardware(struct iris_core *core)
>> +{
>> +	u32 reg_val = 0;
>> +	int ret;
>> +
>> +	ret = iris_vpu3x_power_off_hardware_begin(core);
>> +	if (ret)
>> +		goto disable_power;
>> +
>> +	writel(VIDEO_NOC_RESET_REQ, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
>> +
>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
>> +				 reg_val, reg_val & 0x3, 200, 2000);
>> +	if (ret)
>> +		goto disable_power;
>> +
>> +	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
>> +
>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
>> +				 reg_val, !(reg_val & 0x3), 200, 2000);
>> +	if (ret)
>> +		goto disable_power;
>> +
>> +	iris_vpu3x_power_off_hardware_end(core);
>> +
>> +disable_power:
>> +	iris_vpu_power_off_hw(core);
>> +}
>> +
>> +static void iris_vpu33_power_off_hardware(struct iris_core *core)
>> +{
>> +	u32 reg_val = 0;
>> +	int ret;
>> +
>> +	ret = iris_vpu3x_power_off_hardware_begin(core);
>> +	if (ret)
>> +		goto disable_power;
>> +
>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
>> +			reg_val, reg_val & BIT(0), 200, 2000);
>> +	if (ret)
>> +		goto disable_power;
>> +
>> +	/* set MNoC to low power, set PD_NOC_QREQ (bit 0) */
>> +	writel(BIT(0), core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +
>> +	iris_vpu3x_power_off_hardware_end(core);
>> +
>> +disable_power:
>> +	iris_vpu_power_off_hw(core);
>> +}
>> +
>> +static int iris_vpu33_power_off_controller(struct iris_core *core)
>> +{
>> +	u32 xo_rst_tbl_size = core->iris_platform_data->controller_rst_tbl_size;
>> +	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
>> +	u32 val = 0;
>> +	int ret;
>> +
>> +	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
>> +
>> +	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
>> +
>> +	ret = readl_poll_timeout(core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
>> +				 val, val & BIT(0), 200, 2000);
>> +	if (ret)
>> +		goto disable_power;
>> +
>> +	writel(0x0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
>> +
>> +	ret = readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
>> +				 val, val == 0, 200, 2000);
>> +	if (ret)
>> +		goto disable_power;
>> +
>> +	writel(CTL_AXI_CLK_HALT | CTL_CLK_HALT,
>> +	       core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
>> +	writel(RESET_HIGH, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
>> +	writel(0x0, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
>> +	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
>> +
>> +	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
>> +
>> +	/* Disable MVP NoC clock */
>> +	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
>> +	val |= NOC_HALT;
>> +	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
>> +
>> +	/* enable MVP NoC reset */
>> +	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
>> +	val |= SW_RESET;
>> +	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
>> +
>> +	/* poll AON spare register bit0 to become zero with 50ms timeout */
>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_SPARE,
>> +				 val, (val & BIT(0)) == 0, 1000, 50000);
>> +	if (ret)
>> +		goto disable_power;
>> +
>> +	/* enable bit(1) to avoid cvp noc xo reset */
>> +	val = readl(core->reg_base + AON_WRAPPER_SPARE);
>> +	val |= BIT(1);
>> +	writel(val, core->reg_base + AON_WRAPPER_SPARE);
>> +
>> +	reset_control_bulk_assert(xo_rst_tbl_size, core->controller_resets);
>> +
>> +	/* De-assert MVP NoC reset */
>> +	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
>> +	val &= ~SW_RESET;
>> +	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_SW_RESET);
>> +
>> +	usleep_range(80, 100);
>> +
>> +	reset_control_bulk_deassert(xo_rst_tbl_size, core->controller_resets);
>> +
>> +	/* reset AON spare register */
>> +	writel(0, core->reg_base + AON_WRAPPER_SPARE);
>> +
>> +	/* Enable MVP NoC clock */
>> +	val = readl(core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
>> +	val &= ~NOC_HALT;
>> +	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
>> +
>> +	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
>> +
>> +disable_power:
>> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>> +	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>> +
>> +	return 0;
>> +}
>> +
>> +static u64 iris_vpu3x_calculate_frequency(struct iris_inst *inst, size_t data_size)
>> +{
>> +	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
>> +	struct v4l2_format *inp_f = inst->fmt_src;
>> +	u32 height, width, mbs_per_second, mbpf;
>> +	u64 fw_cycles, fw_vpp_cycles;
>> +	u64 vsp_cycles, vpp_cycles;
>> +	u32 fps = DEFAULT_FPS;
>> +
>> +	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
>> +	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
>> +
>> +	mbpf = NUM_MBS_PER_FRAME(height, width);
>> +	mbs_per_second = mbpf * fps;
>> +
>> +	fw_cycles = fps * caps->mb_cycles_fw;
>> +	fw_vpp_cycles = fps * caps->mb_cycles_fw_vpp;
>> +
>> +	vpp_cycles = mult_frac(mbs_per_second, caps->mb_cycles_vpp, (u32)inst->fw_caps[PIPE].value);
>> +	/* 21 / 20 is minimum overhead factor */
>> +	vpp_cycles += max(div_u64(vpp_cycles, 20), fw_vpp_cycles);
>> +
>> +	/* 1.059 is multi-pipe overhead */
>> +	if (inst->fw_caps[PIPE].value > 1)
>> +		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
>> +
>> +	vsp_cycles = fps * data_size * 8;
>> +	vsp_cycles = div_u64(vsp_cycles, 2);
>> +	/* VSP FW overhead 1.05 */
>> +	vsp_cycles = div_u64(vsp_cycles * 21, 20);
>> +
>> +	if (inst->fw_caps[STAGE].value == STAGE_1)
>> +		vsp_cycles = vsp_cycles * 3;
>> +
>> +	return max3(vpp_cycles, vsp_cycles, fw_cycles);
>> +}
>> +
>> +const struct vpu_ops iris_vpu3_ops = {
>> +	.power_off_hw = iris_vpu3_power_off_hardware,
>> +	.power_off_controller = iris_vpu_power_off_controller,
>> +	.calc_freq = iris_vpu3x_calculate_frequency,
>> +};
>> +
>> +const struct vpu_ops iris_vpu33_ops = {
>> +	.power_off_hw = iris_vpu33_power_off_hardware,
>> +	.power_off_controller = iris_vpu33_power_off_controller,
>> +	.calc_freq = iris_vpu3x_calculate_frequency,
>> +};
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
>> index f8965661c602f990d5a7057565f79df4112d097e..4af3cb0d44e00be498fc7ba648c68f1ef2cb0f20 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
>> @@ -10,6 +10,7 @@ struct iris_core;
>>   
>>   extern const struct vpu_ops iris_vpu2_ops;
>>   extern const struct vpu_ops iris_vpu3_ops;
>> +extern const struct vpu_ops iris_vpu33_ops;
>>   
>>   struct vpu_ops {
>>   	void (*power_off_hw)(struct iris_core *core);
>> @@ -23,6 +24,8 @@ void iris_vpu_clear_interrupt(struct iris_core *core);
>>   int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
>>   int iris_vpu_prepare_pc(struct iris_core *core);
>>   int iris_vpu_power_on(struct iris_core *core);
>> +void iris_vpu_power_off_controller_begin(struct iris_core *core);
>> +int iris_vpu_power_off_controller_end(struct iris_core *core);
> These are unused, pls remove.
>>   int iris_vpu_power_off_controller(struct iris_core *core);
>>   void iris_vpu_power_off_hw(struct iris_core *core);
>>   void iris_vpu_power_off(struct iris_core *core);
>>
> 
> Thanks,
> Dikshita


