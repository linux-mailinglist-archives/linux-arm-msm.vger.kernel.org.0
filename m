Return-Path: <linux-arm-msm+bounces-110244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QA0lJKxiGWrDvwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:55:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8436004D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7F35730069A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19CA3BED31;
	Fri, 29 May 2026 09:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XsHwlxh0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBA23446DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780048550; cv=none; b=Rad/ZXzp8+lCIobdULcr/Je0Jc3C0lEu0fZJ/eqh6rzs/awN3voAe5gtlM3sugrQbGHSwOie9N7pwmpUdgwf/9Qec2B0eiT4o0K33NubVmThiVIDI6CSNFuoWnnQeNpOl5ELXHvY7Y8lslbse2avhjuQ6fh+TJoUL1IuC3/zFGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780048550; c=relaxed/simple;
	bh=d3Z4Z1iJBfrEqHD0Kpt8W1NR0WSMZYbfR2eL2irTvY4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=l93hxZQb9naUfAv3eMWnSFu7wY0/Hq92wKxpIVdRVTvOEqoxKlpxxXqXy+JywiZgdlVz13qlQazjvZCBO4hgAMo3jWF0GkldZsxfmCP1GFPdvxD7GOC+JI6bXtDV7efX2uoyBNoPCgVMARE8OTfsZSNs6umqnQJHu5JlmkYdpEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XsHwlxh0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso63007985e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 02:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780048547; x=1780653347; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7yi/3JR1gKrin2QFBbQQL2NOWimtIfwQZrg/mmS3vs=;
        b=XsHwlxh0bfAcSxP6kVwcZEWUEnVF5tki3+XGiukD6yA6m5Bqs+C0XEAC3DC7T9ccUz
         lNKLSVTPaeThgTlGw8T8bM+V3gDOkM0erVttObs63KUC5RyqCJvwlHxpsDy7u/W6kYRB
         IAh7F8YHbtK95D3Njzuj73hZe1GAc/P6otYQCOiWCDM9EUpo9Owhtk6kd9pqX85+F6li
         TFWsxpWGZNbeafXFi1AG0+gZB2Gkn8poEJvgIv5253dd1qiZgRSWwNEdcTGtPdqNnNlc
         3wy6gxYb5OZGUWQiR5tRAeYjsFoAQlVyuH5/yOFslzsazqLjwc8gQXM54WMwNp2fICsA
         yXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780048547; x=1780653347;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7yi/3JR1gKrin2QFBbQQL2NOWimtIfwQZrg/mmS3vs=;
        b=IRqcTUzb2liDEnzZIkyv9CuCKKGVHEJtERaOt75dLveBdMfhadN6yEJpDFTWkHxDM2
         6n0WOBeSJmfaL8WueMv+UNRienm7J619mR0na1nQrPAsnmVMRHcK4nPqqVBHbbBINISE
         0kUQgZ27UIURHFh5ImpMGmlmsb46fpDZ3d1mhZbpkJibOTO1sH0y23bHrsWMYaObxcJ/
         S0D4iGcJMfj0M/wHOH2s0DoGSau8wzfmcVmuQzLD/K66zw7A704J6KsBvk9KUn5fVnhG
         omf5MJ5WS+ZCq+82v1FoAiZLzv+GT2K1Nzet1UwSccuVmRDcIu3wYb8vhxZEhLs5bkCU
         EYiw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZTSDTAxjDY/vnLGdOn1ck/8i+/+AosmjLxjvtZX4tCvBpjrTB3lvBJE0Xbil5qSxNLdB6XxkwxjUnYmyJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyMy4K73j1RvXhDrOqmfpdIm9epd5sATpjhRHMtkyt8sB5dlxwS
	avDut5h0kavWpX6IsiZW1FoXWM2fpI2WS3K6SPKUKIscrm0xT6UipeSG0EETKi0UEqs=
X-Gm-Gg: Acq92OEGPCMoG1Ov6DDKaweE3Z+Twu7p7hNEW8OEcGwkkokrCD+zdwTIvYgpCNB62kM
	RXTuo9NqpZxDt+mSmff5mLGyWaM33lwj7YS/L9ZQONTNVUq0P6BjNphpJLDiuUZdFLR8wLjWzPH
	HFnN4Z8RLADPPfHfppw/dQxBMvzIb3zKRlfd89h5KuhjEaLUH0yEswTVhDc78Rj/P2QC1doGKHI
	adNjvn8+oYXGRTSLvmWGXVdy7i7xxPsmQ/nb6I8ubPRZuE6PVSxr0YuTIr4s4BMVqcPGf3DlYZ/
	8mGmyWuCuvpk2MY4IEUwQPVWGwOgeX+WADOvDBSdTkR6vIjR9Hnk2gWI4xC7ONOCVXcPVKgaTY4
	BMyT+jwbXkPsXwsyR/vNpRe1ltCpFViykWcPL7FCpxSVjJUOS4M2ySw7QkBnbUwN8GEn0+ou0Dh
	H5Gc37Clevzct+GtQjUJMRgtXdPeEmGDhy6Lb8bVhFOQ==
X-Received: by 2002:a05:600c:4815:b0:488:b187:3c with SMTP id 5b1f17b1804b1-4909c088fd9mr21674855e9.14.1780048546862;
        Fri, 29 May 2026 02:55:46 -0700 (PDT)
Received: from [172.20.10.3] ([37.167.96.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0c39b0sm17345645e9.2.2026.05.29.02.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:55:46 -0700 (PDT)
Message-ID: <3baa753a-f716-45da-b1aa-7406f4092578@linaro.org>
Date: Fri, 29 May 2026 11:55:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
 <fa26f61e-86b6-4612-afae-7726e3b35c4b@oss.qualcomm.com>
 <12102d68-da35-47ea-a972-28cb6d54ce1c@linaro.org>
 <feb42925-5704-4266-8c3f-aa944fdbed28@oss.qualcomm.com>
 <12da2953-fe51-4999-9656-2b42a7897f91@oss.qualcomm.com>
 <c54e7f34-b3a7-47fa-843a-9930de04599e@linaro.org>
 <9148913b-a5cd-4730-beff-6c517ac4818e@oss.qualcomm.com>
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
In-Reply-To: <9148913b-a5cd-4730-beff-6c517ac4818e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110244-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:replyto,linaro.org:mid,linaro.org:dkim,larmoire.org:url];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 7E8436004D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 5/29/26 10:21, Wangao Wang wrote:
> 
> 
> On 2026/5/28 21:26, Neil Armstrong wrote:
>> Hi Wangao,
>>
>> On 5/27/26 06:15, Wangao Wang wrote:
>>> I tested the v4 patch using the gst command you provided earlier. The decoded output still has the previous plane misalignment issue, but all frames are decoded successfully. When viewing the raw data with an image player at 1920x1080 resolution, the first frame looks correct but subsequent frames appear shifted. If viewed at 1920x1088 resolution, there are artifacts at the bottom of each frame. I've attached the images.
>>>
>>> Also, have you tested the 720p case? I can't get it to run on my end.
>>
>> Thanks for the report but I don't have access to the Purwa platform you use,
>> I've run test with multiple resolutions with display using P010
>> and QC10, and ran fluster aswell and all passed on SM8550 and SM8650.
>>
>> I'll test it on the Hamoa T14S I have which should be the closest to purwa,
>> but it uses the same driver setup as SM8550 so I expected it to work the same.
>>
>> Could you indicate which iris firmware you're using ?
>>
>> Could you try passing the fluster h265 main10 test suite with gstreamer ?
>>
>> fluster download -c h.265
>> fluster run -d GStreamer-H.265-V4L2 -ts JCT-VC-HEVC_V1 -q -s -j1
>>
>> The picture you send looks like there's a mismatch with the kernel
>> and firmware setup of planes offsets.
>> Could you check if there's a Purwa specific firmware property
>> to set for 10bit decoding ?
>>
>> Neil
>>
>>>
> 
> Hi Neil,
> 
> I also tested on hamoa, and it has the same issue as purwa. The firmware used on purwa is vpu30_p1_s7.mbn.
> 
> This is the result of fluster:
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WP_MAIN10_B_Toshiba_3       ... Success
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_A_ericsson_MAIN10_2       ... Success
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_A_ericsson_MAIN_2       ... Success
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_B_ericsson_MAIN10_2       ... Success
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_B_ericsson_MAIN_2       ... Success
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_C_ericsson_MAIN10_2       ... Success
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_C_ericsson_MAIN_2       ... Success
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_D_ericsson_MAIN10_2       ... Error
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_D_ericsson_MAIN_2       ... Error
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_E_ericsson_MAIN10_2       ... Success
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_E_ericsson_MAIN_2       ... Success
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_F_ericsson_MAIN10_2       ... Success
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_F_ericsson_MAIN_2       ... Success
> 

Ok so this works fine, so I'm really wondering if your main10 HEVC is not properly encoded.

Could you try playing a well know HEVC main10 files ?

For example I just tried the 1080p and 4k 10bit files on Hamoa + fluster and it just worked as expected:
https://larmoire.org/jellyfish/
https://larmoire.org/jellyfish/media/jellyfish-10-mbps-hd-hevc-10bit.mkv
https://larmoire.org/jellyfish/media/jellyfish-120-mbps-4k-uhd-hevc-10bit.mkv

Neil


> 


