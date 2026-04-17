Return-Path: <linux-arm-msm+bounces-103516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAGVJLUF4mna0QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 12:04:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66446419DF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 12:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E08A1308A2DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 10:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791353C9EF4;
	Fri, 17 Apr 2026 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v4O5w8FM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9451B3C9422
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 09:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776419964; cv=none; b=RvGdHusJn9bltqajVj1Y1cipPKgJ/WzystYgTQ7cz103fW85aabG7FEAG24inNvKmH0dfKqAIH1CngjZYjfuBKDoVk0b/Y4l3Tl5myQsp8AYqFy2ns67jvisUp94dm3kwMWcanKn3AMYpx/RZHIAFxEcakElBXer98dEpsj/rvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776419964; c=relaxed/simple;
	bh=+ZVNCJW8hzEutCAUZQxSHnlR1zTrkcdD3tl/PG1cNvg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=W9JiRnbvelqA82dH/uW5U9pY1b70dypJPODUZcKdINZpGcZGfm/Qof8ZZPxh6Kjd6l1b3grmtppgKRfr+MMs9JpnK7rimex7hxZ/3ea+8O2TZW6efVmOhkzV5ST7kdYUNw1ClipzZ2BrCUZFKfte32HsGPm3ZIDa3xBL2bReyEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v4O5w8FM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488d2079582so5186795e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 02:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776419960; x=1777024760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U21r1MrN/jfJ8h8OFcl922YvVb40wkUv1MN0ITxOF2s=;
        b=v4O5w8FM/sZisdnLphCT3+VWxZBHFXbTodxQ89QMd9aAzP+rrta7gAdwQz41i/K256
         QdPQy+NnCUbiCGCerysuhPoikQk0sLwU42V29yBCZoUSLyxuwL1iTWk/cTg1vRcD8nLv
         4Ktf5/Ddv5CVboCXmjBRdsKuRvuCRJv5j7RLuFWxOig13z8/O8w5KC15Uy43ckmnFfeU
         fn+gxDV0ojUhHuyBdW/zo2R4mFRmvgrgzbpyQYajPdXHOHjZfE0UcJL9NCcI0tp4NgUj
         uyvICZMX0rL+i6H/lepUNaTzg37vi/JoIbc3Xo/Yx96vmXVO9GWIKsOqCU9PgsFoaWFK
         a7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776419960; x=1777024760;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U21r1MrN/jfJ8h8OFcl922YvVb40wkUv1MN0ITxOF2s=;
        b=iDRYfGXAcfREnwYWpiJ0BePodIQ9d5+8m6vwDSLYDGoLGjxV+w6Ewt5ubJjwTzJ0RL
         WX1EzFGcTLFGW3rJ0cKtkKBsVBf67HECdgH6792xgNzb75JWmpryR0x8p7+e09lDqJO5
         vI214UKkTsnAcLXnPb3k3HBPQe109A8hV351UrPmA3o7TgWVL0xe/OiGbuS6CT+5q/LX
         519c4PH7HZip7oDp3nmk+ZJwanmHoqQS2tEG9o443h/z8KmjUG6L/njtx+Cx0w+xPmCu
         hOcgD+HdGuPcv+fBb9j77iF+dktgvL29Z/LSPPxQjNCPIrTA/iSmKnaowgLbdDM3yChn
         G5SQ==
X-Forwarded-Encrypted: i=1; AFNElJ919VT2zbOZOiWQmgbFtx2Jlkya2oqdCPtFngvaO7CI1wxL517Xc7dqit4pfduXF0cNK8OJVfxiLaMI+IMM@vger.kernel.org
X-Gm-Message-State: AOJu0YyAmUBAC5HKQejR2qg8dG1CRz+LngwhqcgjgH6HS/temrOMwwIf
	mkeZb14C9nOzJGD9+pZw+uxjXzC1r0Ux0m/F2Yp4JAORfKHi4Jkl9EpvhDA7JvBds/ED1Wqb29a
	4pNYG/r4=
X-Gm-Gg: AeBDieu9YNoI9sQp8ZgHiiohK/784CAD2SjpS0n4XL8MdxeeOS9uKuxdsWFwXRYnsyB
	gV7EiE+tyF82LBY/O/sbwcY/iTr9K1quNwBcNWoRfTCT/vKs5olgTEJhWB/Kul3JpKYypNRVYYg
	VBDQCmJGV/sReqzdBXmXAMSGkOE98JIRapspCwH2X8jgJ2JjBtl84OG6GvM8KC6nOSW0nccLAk8
	DA9TAnHFlOdn1LpYSa9AmprcV2Ghleke1JW9L9Gk9aC3LwytlMkqo+myjaJloYOp4bJ0RwxkTzE
	zZoZ7KCyr0rez6DwKyMPsDmZNSpPEAWLwzWJaPsWVJ7EavEgXB2QKJidfuGwJmjvGh9fxE6fkck
	C37tFWhlOn9N6P9/UerQWFyjmmW55DOysd5vXd4wFmeWNiPWoXbIRO426JSLnK0B3DCQTVNYk4f
	YzwtzNHIFGi+vMmptaZt6DZY7FuSZDOUigrUnHPVLmGUiwN8F1ksOhV10Zq28Cjcsle/XEkilmj
	vpqtMXcsoUsDrxQfA==
X-Received: by 2002:a05:600c:3483:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-488fb7787d7mr27629845e9.15.1776419959810;
        Fri, 17 Apr 2026 02:59:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:9b0a:b8df:9ec3:b505? ([2a01:e0a:106d:1080:9b0a:b8df:9ec3:b505])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb74c7dcsm13316405e9.4.2026.04.17.02.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 02:59:19 -0700 (PDT)
Message-ID: <b27f7356-709a-4968-9ed8-ad1e09b03ed0@linaro.org>
Date: Fri, 17 Apr 2026 11:59:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
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
In-Reply-To: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103516-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,linaro.org:replyto,linaro.org:email,linaro.org:dkim,linaro.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 66446419DF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/17/26 11:37, Neil Armstrong wrote:
> This adds the plumbing to support decoding HEVC, VP9 and AV1
> streams into 10bit pixel formats, linear and compressed.
> 
> This has only been tested on SM8550 & SM8650 with HEVC, and was
> inspired by Venus, DRM MSM and the downstream vidc driver for the
> buffer calculations and HFI messages.
> 
> I was unable to get 10bit decoding working with ffmpeg since P010
> support for v4l2 decoding is missing, but v4l2-ctl works with:
> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=P010 --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.P010
> v4l2-ctl --verbose --set-fmt-video-out=pixelformat=HEVC --set-fmt-video=pixelformat=Q10C --stream-mmap --stream-out-mmap --stream-from-hdr Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr --stream-to out.QC10
> 
> The non-10bit decoding still works as before.
> 
> With Big_Buck_Bunny_1080_10s_30MB reencoded in 10-bit profile
> and tranformed in v4l2 header format with [1]:
> ffmpeg -i Big_Buck_Bunny_1080_10s_30MB.h264 -pix_fmt yuv420p10le -c:v libx265 -crf 28 -x265-params profile=main10 Big_Buck_Bunny_1080_10s_30MB_main10.h265
> /path/to/mkhdr.sh Big_Buck_Bunny_1080_10s_30MB_main10.h265 raw Big_Buck_Bunny_1080_10s_30MB_main10.h265.hdr
> 
> Fluster HEVC results on SM8650:
> 
> ./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 131/147

Typo & report error... it's 141/147, Here's the full summary:

|Test|GStreamer-H.265-V4L2|
|-|-|
|TOTAL|141/147|
|TOTAL TIME|8.600s|
|-|-|
...
|PICSIZE_A_Bossen_1|☠|
|PICSIZE_B_Bossen_1|☠|
...
|RAP_A_docomo_6|❌|
...
|TSUNEQBD_A_MAIN10_Technicolor_2|☠|
...
|WPP_D_ericsson_MAIN10_2|☠|
|WPP_D_ericsson_MAIN_2|☠|
...
|-|-|
|Test|GStreamer-H.265-V4L2|
|TOTAL|140/147|
|TOTAL TIME|8.600s|

|-|-|
|Profile|GStreamer-H.265-V4L2|
|MAIN|131/135|
|MAIN_10|9/11|
|MAIN_STILL_PICTURE|1/1|

So the failing cases:
- Pixel Format mismatch
  - TSUNEQBD_A_MAIN10_Technicolor_2 - Gstreamer waits NV12 but decoder returns P010
- Unsupported resolution
  - PICSIZE_A_Bossen_1 - resolution is higher than max supported
  - PICSIZE_B_Bossen_1 - resolution is higher than max supported
  - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
  - WPP_D_ericsson_MAIN10_2 - resolution is lower than min supported
- CRC mismatch
  - RAP_A_docomo_6

Neil

> The failing test case:
> - Pixel Format mismatch
>   - TSUNEQBD_A_MAIN10_Technicolor_2 - Gstreamer waits NV12 but decoder returns P010
> - Unsupported resolution
>   - PICSIZE_A_Bossen_1 - resolution is higher than max supported
>   - PICSIZE_B_Bossen_1 - resolution is higher than max supported
>   - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
>   - WPP_D_ericsson_MAIN10_2 - resolution is lower than min supported
> - CRC mismatch
>   - RAP_A_docomo_6
> - CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as well
>   - VPSSPSPPS_A_MainConcept_1
> 
> v4l2-compliance results on SM8550 & SM8650:
> 
> $ v4l2-compliance -d /dev/video1 -s
> v4l2-compliance 1.33.0-5456, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 8aa593bda182 2026-04-11 10:54:25
> 
> Compliance test for iris_driver device /dev/video1:
> 
> Driver Info:
> 	Driver name      : iris_driver
> 	Card type        : Iris Encoder
> 	Bus info         : platform:aa00000.video-codec
> 	Driver version   : 7.0.0
> 	Capabilities     : 0x84204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 	Detected Stateful Encoder
> 
> Required ioctls:
> 	test VIDIOC_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/video1 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 43 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_REMOVE_BUFS: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 	test blocking wait: OK
> 
> Test input 0:
> 
> Streaming ioctls:
> 	test read/write: OK (Not Supported)
> 	Video Capture Multiplanar: Captured 61 buffers
> 	test MMAP (select, REQBUFS): OK
> 	Video Capture Multiplanar: Captured 61 buffers
> 	test MMAP (epoll, REQBUFS): OK
> 	Video Capture Multiplanar: Captured 61 buffers
> 	test MMAP (select, CREATE_BUFS): OK
> 	Video Capture Multiplanar: Captured 61 buffers
> 	test MMAP (epoll, CREATE_BUFS): OK
> 	test USERPTR (select): OK (Not Supported)
> 	test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0
> 
> $ v4l2-compliance -d /dev/video0 -s5 --stream-from=test_video_10s.h264
> v4l2-compliance 1.33.0-5456, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 8aa593bda182 2026-04-11 10:54:25
> 
> Compliance test for iris_driver device /dev/video0:
> 
> Driver Info:
> 	Driver name      : iris_driver
> 	Card type        : Iris Decoder
> 	Bus info         : platform:aa00000.video-codec
> 	Driver version   : 7.0.0
> 	Capabilities     : 0x84204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 	Detected Stateful Decoder
> 
> Required ioctls:
> 	test VIDIOC_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/video0 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 12 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK
> 	test Composing: OK
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_REMOVE_BUFS: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 	test blocking wait: OK
> 
> Test input 0:
> 
> Streaming ioctls:
> 	test read/write: OK (Not Supported)
> the input file is smaller than 7077888 bytes
> 	Video Capture Multiplanar: Captured 601 buffers
> 	test MMAP (select, REQBUFS): OK
> the input file is smaller than 7077888 bytes
> 	Video Capture Multiplanar: Captured 601 buffers
> 	test MMAP (epoll, REQBUFS): OK
> the input file is smaller than 7077888 bytes
> 	Video Capture Multiplanar: Captured 601 buffers
> 	test MMAP (select, CREATE_BUFS): OK
> the input file is smaller than 7077888 bytes
> 	Video Capture Multiplanar: Captured 601 buffers
> 	test MMAP (epoll, CREATE_BUFS): OK
> 	test USERPTR (select): OK (Not Supported)
> 	test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0
> 
> [1] https://github.com/superna9999/pyv4l2compliance
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v2:
> - Fixed bug breaking 8bit decoding
> - Dropped filtering on G_FMT while waiting for soure change
> - Dropped format filtering on ENUMFMT
> - Switched ALIGN(x, 192) to roundup(x, 192) because ALIGN works only with Power Of Two numbers
> - Cleaned and refactors the width/height/stride calculations
> - Cleaned and redesigned the buffer calculations functions with proper comments and var names
> - Passed fluster and v4l2-compliance to check for non regression
> - Tested on SM8550
> - Added missing V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10 with made gstreamer fail decoding
> - Link to v1: https://patch.msgid.link/20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org
> 
> ---
> Neil Armstrong (6):
>        media: qcom: iris: add helpers for 8bit and 10bit formats
>        media: qcom: iris: add QC10C & P010 buffer size calculations
>        media: qcom: iris: gen2: add support for 10bit decoding
>        media: qcom: iris: vdec: update size and stride calculations for 10bit formats
>        media: qcom: iris: vdec: update find_format to handle 8bit and 10bit formats
>        media: qcom: iris: vdec: allow GEN2 decoding into 10bit format
> 
>   drivers/media/platform/qcom/iris/iris_buffer.c     | 195 ++++++++++++++++++++-
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     |  71 +++++++-
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  37 +++-
>   drivers/media/platform/qcom/iris/iris_instance.h   |   2 +
>   .../platform/qcom/iris/iris_platform_common.h      |   1 +
>   .../media/platform/qcom/iris/iris_platform_gen2.c  |   8 +-
>   drivers/media/platform/qcom/iris/iris_utils.c      |  16 +-
>   drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
>   drivers/media/platform/qcom/iris/iris_vdec.c       |  42 ++++-
>   10 files changed, 360 insertions(+), 15 deletions(-)
> ---
> base-commit: cac3ec101ba14f040f966d2464c60f9c0f92ec47
> change-id: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c
> 
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
> 


