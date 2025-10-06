Return-Path: <linux-arm-msm+bounces-76064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 857C5BBE17C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 14:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 395D83BC4ED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 12:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C642528312B;
	Mon,  6 Oct 2025 12:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="akLfpc1i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F7128369D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 12:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759755018; cv=none; b=WjbxJQyOdYBoCGvOw8Zy/aejPyQ3cN8HGQ0SspFSLqIG8bTpxa8CPtUDAdfxaKXbdkz0dHXtcX9+GbtDqqakdn1PTQiuxijzVNn3ci2g4tKO8CgfICOUKsB5RjJu0LeXr2oq8OQPRUoFvY07bw2wBQ1NmfNp5vX4tq4C3ES6O6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759755018; c=relaxed/simple;
	bh=1+ke2TkHctZOigrivj+U7Q7F20sV5pMDl2nkjiByetM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OTRIpeoQ/HWfT40AiR+ti/bXX8nneo3BEQ9yfquWHaO0vEzFdtHFM8or9LS3nTBU/z5XUtJ65a9zQGzQBY5LNf/cEbfHfZ3eIc9G5Fye4E/RY2k7EsSKeoyeJrQ2ewtWvFMD77djlK8ozFPUTtriLqFlt2UeAlkLiaQ1wKqKyNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=akLfpc1i; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e37d6c21eso35592235e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 05:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759755015; x=1760359815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvDhuie6qY8dt8ec7g1A3HAHuwzFnTbr7gEWQFFeMLg=;
        b=akLfpc1i4vHLpXIQu7/IBGKFhjAR6cVqc0ts24uQF1GlW+XePrzg9ttrtW8B/lfe0r
         hSMk8k2KcaQ49lUys7bRRnlXOStad0jZ+XtAo02ALepbVltK2dgDlRovCOiyzXruepdV
         Eef/8cMwXR7mWjAOXF17GeIL+OEiIXN39L3IBEFHiNftc+RqJSIahVEe+F18XJZBHnJj
         ZObUb/fOd/GGUoFyxBrTy6UsJ/+6JzBxK23l6v1Osnotvw2GNelKa23JXHgMGk1FrcJp
         uARvcH1BC0dgEPuduSbo9ynlG7+zmD/IcMWIlCrJOlbxXnOwvzMBtCot+yGWm06ejER0
         tsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759755015; x=1760359815;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TvDhuie6qY8dt8ec7g1A3HAHuwzFnTbr7gEWQFFeMLg=;
        b=AnhHnyHMO6GGIWZyR7h5gwwVvCtXgEQAGiaZ6JTW3rzB9j5E4L/m8WcfpJaMHlqEtP
         18ijgp846tT4WrKydwN0Ju0S9bj0/o2oHddDWb2N4v9vBabXMj+y5gvD0tSfc7S+UL6Z
         raLZ/4AyqiA+S1jtFsua5t3DC4IqQ2goy1wq3xQOUnHjd6QZ6kSnPc13ZHq+Nan8kPwD
         6aiOBJhQdk/zk5PLXmP9eANzPz0gCiylN2bonZWATBVUaj3NeuY2/FgqD+VyK3NO0ETj
         rvKxeT2MqdDWJTdSwsfCZp5kF8ZqCAVSqthvKrOSJer+loB5FqZOQOeGX2NUiN/sRvuM
         7iaA==
X-Forwarded-Encrypted: i=1; AJvYcCW5ftMe55i6KMTN7/aZR9tQFYlSMa8ZPBB08gyJGb9ind+aH+2a1+y7yB9tek92Sr0KLjUg3ZjabCqgvsg6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8UR5NQGpRVvMU88cj2ERALbyUbolmDHl5sTWrBgMeCoj+dRXJ
	y7wozNavi1zI/Ts6wVkMgWuOZeo8yv1MnNF6CAZJvEOe9290WFkHs2I1LvUSS8ryG5Y=
X-Gm-Gg: ASbGncsjcsbXeXcB9WYcolIuWk1K7nMaskj2QQt2hXJlTvKtfMnNJRx2s5nmeG4XqOM
	eFOqvOmykhyC2OsyJLGKjNiz7Q1gEza6SaUwVITj0bnte/nFRyNQ7xwAWDjcaHlfX5Q6nI4T1hR
	KOwb5NcHtkrZLIw8iedhof/I0Sj95QkvQofkxS8nD8IPZlBE3cXiQgzFIGy8svo+8JOArwgtodv
	tg17yYYGf3MCmUySsXewhIoMd90uH8L1VTWsF+DphOom1RYcXTaSxrzKghiZFg0BiHQduhNpINY
	Lc8/DgDanoKu09+V9eHNxPjS8epev05ZEPlP4yIvsDmdeMZzjnJz5UfbolZb9YBaiJ7J06pDuu2
	MTG2PE/MZ01vr/2TduwHUS2xW1bqoWtxL2CjYvfxVhzPtX/itgF7ZL3JNK5M+tF/hAS2j7yellM
	125Vi1zxev4tVUDRsyK+upFuXjc7w=
X-Google-Smtp-Source: AGHT+IGxYNrhR5rb1hMdZacbBTASV6s/vat0+OUcrWk/mznR4enIUg1haus1BRrmnxmBozboXRQ6Ug==
X-Received: by 2002:a05:600c:3b08:b0:46e:396b:f5ae with SMTP id 5b1f17b1804b1-46e7110cf6fmr95364035e9.16.1759755014953;
        Mon, 06 Oct 2025 05:50:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:2dd0:9118:d7f5:51d9? ([2a01:e0a:3d9:2080:2dd0:9118:d7f5:51d9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e723593d8sm173623055e9.11.2025.10.06.05.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 05:50:14 -0700 (PDT)
Message-ID: <4bb1c10d-b8fe-485e-b4aa-faa43033be76@linaro.org>
Date: Mon, 6 Oct 2025 14:50:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/3] phy: qcom: qmp-combo: get the USB3 & DisplayPort
 lanes mapping from DT
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250930-topic-x1e80100-hdmi-v4-0-86a14e8a34ac@linaro.org>
 <20250930-topic-x1e80100-hdmi-v4-2-86a14e8a34ac@linaro.org>
 <74446713-15a1-4706-b3c7-801724467575@oss.qualcomm.com>
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
In-Reply-To: <74446713-15a1-4706-b3c7-801724467575@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/6/25 12:08, Konrad Dybcio wrote:
> On 9/30/25 9:39 AM, Neil Armstrong wrote:
>> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
>> of a combo glue to route either lanes to the 4 shared physical lanes.
>>
>> The routing of the lanes can be:
>> - 2 DP + 2 USB3
>> - 4 DP
>> - 2 USB3
>>
>> Get the lanes mapping from DT and stop registering the USB-C
>> muxes in favor of a static mode and orientation detemined
>> by the lanes mapping.
>>
>> This allows supporting boards with direct connection of USB3 and
>> DisplayPort lanes to the QMP Combo PHY lanes, not using the
>> USB-C Altmode feature.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
> [...]
> 
>> +struct qmp_combo_lane_mapping {
>> +	unsigned int lanes_count;
> 
> "num_lanes"?

Is this significant ?

> 
>> +	enum typec_orientation orientation;
>> +	u32 lanes[4];
>> +};
>> +
>> +static const struct qmp_combo_lane_mapping usb3_data_lanes[] = {
>> +	{ 2, TYPEC_ORIENTATION_NORMAL, { 1, 0 }},
>> +	{ 2, TYPEC_ORIENTATION_REVERSE, { 2, 3 }},
>> +};
>> +
>> +static const struct qmp_combo_lane_mapping dp_data_lanes[] = {
>> +	{ 1, TYPEC_ORIENTATION_NORMAL, { 0 }},
>> +	{ 1, TYPEC_ORIENTATION_REVERSE, { 3 }},
> 
> This is not corroborated by your bindings change ^

Damn you're right, I'll fix it...

> 
> I'm also frankly not sure whether it's pin 2 or 3 that 1-lane-DP
> would be TXd on
> 
>> +	{ 2, TYPEC_ORIENTATION_NORMAL, { 3, 2 }},
>> +	{ 2, TYPEC_ORIENTATION_REVERSE, { 0, 1 }},
>> +	{ 4, TYPEC_ORIENTATION_NORMAL, { 3, 2, 1, 0 }},
>> +	{ 4, TYPEC_ORIENTATION_REVERSE, { 0, 1, 2, 3 }},
> 
> Would it be too cheesy to check orientation based like:
> 
> static bool qmpphy_mapping_orient_flipped(u32 *data_lanes)
> {
> 	return data_lanes[0] == 0;
> }
> 
> ?

Do we want a proper check of the property content or some random check ?
Sorry I prefer something formal, since perhaps sometime we will have
a full lanes remapping available instead of just orientation and if
we have some random input it will explose...

> 
>> -	ret = qmp_combo_typec_register(qmp);
>> -	if (ret)
>> -		goto err_node_put;
>> +	qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
>> +
>> +	if (of_find_property(dev->of_node, "mode-switch", NULL) ||
>> +	    of_find_property(dev->of_node, "orientation-switch", NULL)) {
> 
> of_property_present()

I'll replace with that.

Thanks,
Neil

> 
> Konrad


