Return-Path: <linux-arm-msm+bounces-41106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FF89E9865
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 15:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF5FF1889993
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 14:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0F61B0430;
	Mon,  9 Dec 2024 14:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zuYQSyf5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A023A1A238D
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 14:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733753225; cv=none; b=ciHYFni2i2HQSFsPmu/9u1E7FKF06TaOJT2F7szvt5UJyGSQ6CZZkTu1lMzOrC9/pnCoCQaCqDc+nQkJoMLYenR3XdAOgN22l1CrNK4Dcq7IJk7nH+tk4N0m0bIlp1aDcyXGQeMNu0ArP/awvAvjDoalgh5NMPV3jwNxHU/28PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733753225; c=relaxed/simple;
	bh=51L9mnqIr29+7FShCAtxvhKSMRLPZlq2oBjN+kgy8PE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gj+UQpRxKsgbvfIcLUQu+2vqRLVeLf+5ZhyNHbj7e74bJXMdFnDIDBrsJfWX8ZIy0dnDoztGRQOTG02fNzuwvC5iHSkxpvvnbKhwkO+gTaJocNf/zMP9vFxdjqjUVhag3KdjFRC/Ap2XNyqNETa8Sh0uSGkjxv5eB0WqdSSm2+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zuYQSyf5; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385deda28b3so3437589f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 06:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733753221; x=1734358021; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TL2MbMVS0LA1fcrVHWeYCb3ppOpM6kJxBQgdxTKNEc=;
        b=zuYQSyf5mv6IhLob/w+0qLuOE82F0C2H9ro7QNHd11R4/1aWNhjOAHi6AwMpAtQuy5
         JxJKHT2LnSSTwzpX4upjdny00bABRln6h+0BL43f7Wkc6S9B5A2hODsZ1/Lx8E10B1tn
         XOJeFNteZImM3vjp2Lp3L7/UnWArtR+uszdY/KlgdNvkcu5u9DE0N288YQqSpBpqVG4C
         8/r4eQJCJNM0TepDsBdctQOw9pBqhUXvEhzVoaK81xwUppuTTbLm4Mg6Xd56hEhp6mym
         3+BHVHRcowITtqCJrOaiKRNcnbfrSRMrLlZJxFHwFb1mw4FcKDPiVZI6twKH2E6xv3RY
         LH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733753221; x=1734358021;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8TL2MbMVS0LA1fcrVHWeYCb3ppOpM6kJxBQgdxTKNEc=;
        b=YSp45rh7mlt8rjNNUfEnI/kYMq0K/o8aLP8C0a+Pw7i7Gua09jVAqiOGGdPH5fmQb3
         cXET4pciebwc9qOr4dOXtmBWHa0VZLztWPM26rIm7XPCclv/AIJIyPbfq5/sJMfF9Ztr
         j+tkGW6XLB01NhX6TY2MzZ/WSrzmpCnYH7r+egmG87cEX0itb43Mykk8zjqfYW6dG7Qx
         JDCDWy1DKFJ8ntAXsur5c7+Ag1qu93MT04/a61KKcJ3BWhPt0zvhrXlkjlHI9IpAnp8G
         bmjrzvZHOzrpT4ubU5IoP/HJRcm/TRJaAQsaR5kPcrEXmt/EIdAHvMMHkWAd4Diet9cW
         n4yw==
X-Gm-Message-State: AOJu0YzLVQGTlShs/HaXsm3w2Rdidh4dk1L9Pw1XGzZWr1uti/7cUXFn
	o1+4CYhscupNnngK4YAnT08qoZccnZe8KGJkjZSTZwF/Yx43dFcjPp57xLw97PU=
X-Gm-Gg: ASbGncvj2pY1A7MMo5c/nRnBy1is+fGZ9n2AW/P575WR0aJ3ICTE9B+f+DGIljN88YL
	sMmXfjI1dC5d9+hLdF4hxqefU/HGNDZGsV6vNpFg9vk8q5B9mSIzhBOkCDf/fxmIsfMDVyglnTh
	Sh3K1jtReN2KYixbhl7Uh4lFs25Xh+oOFomCSa1ej/R74Oj6usGFP2IXM1ygEeDO9Vqz5JLYgAH
	revKhSrLX3yR5Y9k+n3ojT1rQGWZnoeaqFJXKYljDDHvYiwMv/w3Pf8TthD5BEq4s2qlwgux9c0
	sDf/5xldTGeMTdAodsVDn8EjClw=
X-Google-Smtp-Source: AGHT+IGucCc+D0VX2jp79Smo7afxqpLhOYHKy/vpIQDIDF/vHEETnS6x9UlrTj3Drk16mX0zQ4F1EQ==
X-Received: by 2002:a05:6000:400c:b0:386:3560:477f with SMTP id ffacd0b85a97d-386356049e3mr6090376f8f.23.1733753220814;
        Mon, 09 Dec 2024 06:07:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:7546:6147:f006:709b? ([2a01:e0a:982:cbb0:7546:6147:f006:709b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434eb775350sm85048115e9.5.2024.12.09.06.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 06:07:00 -0800 (PST)
Message-ID: <c1eacaa5-f51f-4e6b-8848-3fdb065aab19@linaro.org>
Date: Mon, 9 Dec 2024 15:06:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 3/7] drm/msm: adreno: dynamically generate GMU bw table
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org>
 <20241205-topic-sm8x50-gpu-bw-vote-v4-3-9650d15dd435@linaro.org>
 <93ed4511-55b5-42a9-a3fe-32f29bd01bab@quicinc.com>
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
In-Reply-To: <93ed4511-55b5-42a9-a3fe-32f29bd01bab@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2024 13:11, Akhil P Oommen wrote:
> On 12/5/2024 8:31 PM, Neil Armstrong wrote:
>> The Adreno GPU Management Unit (GMU) can also scale the ddr
>> bandwidth along the frequency and power domain level, but for
>> now we statically fill the bw_table with values from the
>> downstream driver.
>>
>> Only the first entry is used, which is a disable vote, so we
>> currently rely on scaling via the linux interconnect paths.
>>
>> Let's dynamically generate the bw_table with the vote values
>> previously calculated from the OPPs.
>>
>> Those entries will then be used by the GMU when passing the
>> appropriate bandwidth level while voting for a gpu frequency.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 41 ++++++++++++++++++++++++++++++++++-
>>   1 file changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> index cb8844ed46b29c4569d05eb7a24f7b27e173190f..fc4bfad51de9a3b6617fbbd03471a5851d43ce88 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> @@ -5,7 +5,10 @@
>>   #include <linux/circ_buf.h>
>>   #include <linux/list.h>
>>   
>> +#include <dt-bindings/interconnect/qcom,icc.h>
>> +
>>   #include <soc/qcom/cmd-db.h>
>> +#include <soc/qcom/tcs.h>
>>   
>>   #include "a6xx_gmu.h"
>>   #include "a6xx_gmu.xml.h"
>> @@ -259,6 +262,39 @@ static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
>>   		NULL, 0);
>>   }
>>   
>> +static void a6xx_generate_bw_table(const struct a6xx_info *info, struct a6xx_gmu *gmu,
>> +				   struct a6xx_hfi_msg_bw_table *msg)
>> +{
>> +	unsigned int i, j;
>> +
>> +	msg->ddr_wait_bitmask = QCOM_ICC_TAG_ALWAYS;
> 
> Why this is QCOM_ICC_TAG_ALWAYS?
> 
> IIRC, this bitmask informs RPMH whether it should wait for previous BCM
> vote to complete. Can we implement the same logic from kgsl to create
> this bitmask?

Ack, Let me check

> 
> 
>> +
>> +	for (i = 0; i < GMU_MAX_BCMS; i++) {
>> +		if (!info->bcms[i].name)
>> +			break;
>> +		msg->ddr_cmds_addrs[i] = cmd_db_read_addr(info->bcms[i].name);
>> +	}
>> +	msg->ddr_cmds_num = i;
>> +
>> +	for (i = 0; i < gmu->nr_gpu_bws; ++i)
>> +		for (j = 0; j < msg->ddr_cmds_num; j++)
>> +			msg->ddr_cmds_data[i][j] = gmu->gpu_ib_votes[i][j];
>> +	msg->bw_level_num = gmu->nr_gpu_bws;
>> +
>> +	/*
>> +	 * These are the CX (CNOC) votes - these are used by the GMU
>> +	 * The 'CN0' BCM is used on all targets, and votes are basically
>> +	 * 'off' and 'on' states with first bit to enable the path.
>> +	 */
>> +
>> +	msg->cnoc_cmds_num = 1;
>> +	msg->cnoc_wait_bitmask = QCOM_ICC_TAG_AMC;
> 
> Same here.
> 
> Rest looks fine to me.

Thanks,
Neil

> 
> -Akhil
> 
>> +
>> +	msg->cnoc_cmds_addrs[0] = cmd_db_read_addr("CN0");
>> +	msg->cnoc_cmds_data[0][0] = BCM_TCS_CMD(true, false, 0, 0);
>> +	msg->cnoc_cmds_data[1][0] = BCM_TCS_CMD(true, true, 0, BIT(0));
>> +}
>> +
>>   static void a618_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>>   {
>>   	/* Send a single "off" entry since the 618 GMU doesn't do bus scaling */
>> @@ -664,6 +700,7 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>>   	struct a6xx_hfi_msg_bw_table *msg;
>>   	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>   	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
>>   
>>   	if (gmu->bw_table)
>>   		goto send;
>> @@ -672,7 +709,9 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>>   	if (!msg)
>>   		return -ENOMEM;
>>   
>> -	if (adreno_is_a618(adreno_gpu))
>> +	if (info->bcms && gmu->nr_gpu_bws > 1)
>> +		a6xx_generate_bw_table(info, gmu, msg);
>> +	else if (adreno_is_a618(adreno_gpu))
>>   		a618_build_bw_table(msg);
>>   	else if (adreno_is_a619(adreno_gpu))
>>   		a619_build_bw_table(msg);
>>
> 


