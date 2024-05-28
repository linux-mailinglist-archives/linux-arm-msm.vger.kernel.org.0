Return-Path: <linux-arm-msm+bounces-20707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D01208D1597
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 09:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 579B81F21719
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 07:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF1B73474;
	Tue, 28 May 2024 07:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IelRUCbH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2389E6D1C1
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 07:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716883013; cv=none; b=M6o1p1XC0z3M4Wbav7sJFbEMMjutg0fzitfW9AXYRbEJjWo8jTU8VI7s1TZnbJMrCGK1TnnVP66Zd2+D1WxBMoH9RCi4vGiEph1L5vSWNlr+JBFk0ez314VS3mLucKaQCmnFvr/K/n+sO0UGxcfTf6+/Zb0BMQhQZvKfx1sQqAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716883013; c=relaxed/simple;
	bh=FTkID7+KKMJ9AweJ3LnYfYE2qesoTXjxnJwBfRB1nk0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iX1xYe6T8S9zYI0Y4d89dtNKsCRPb9LV89t1nchtVnxzCpvORmZ5A22sViSLaLDnluVsgO9ojhCsSOsUJrG5s/4tKVgvCiZ4+KWped2NToHTUHQ6PFFIRjzlBgiVuBll2TCmCxw8reLol1vt8FLh/QlWZICjzkkkdfg65uRC8nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IelRUCbH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4202ca70289so3699655e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 00:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716883010; x=1717487810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCjfHPIMT5wUou0t8i9b0QJfs+bLamMmZgWIm/rkFmM=;
        b=IelRUCbHRIh056sPmCvrubmcNzfnnoYI7RT4fkAGOWg0J9KLisrLbypuGPTFxUUuHR
         nQlT8+Y5bGggXc8ZdPhkMgnB0RE14zl54B7xUrAd/Uq54zmn7M1K7JpDBXT9qfZQVmSc
         61n6sa0x7W2OyNhuv0pzgdZS8zN+QAlVgS3s6QpNyLzE4zHk7/rpCRrR0w7quqYMIEJw
         F3t/yYfSgTIHzbuL5TSQDZKegJEKetQ3lb+2W5eDB62g3ns+NaVI7Lca6bIA+oBZtw3W
         1wE2lWd+tRdSzTDn9r1QWpUr3F4yTtZZg2oHYNjr4DGVBHQAIBt+JYRcxCxt49e0Ufig
         7kBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716883010; x=1717487810;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KCjfHPIMT5wUou0t8i9b0QJfs+bLamMmZgWIm/rkFmM=;
        b=Y0TaumPx8/6h4Jv/8nRY3mmKHakxBR4UGWoqfVP0OdJXYx/lo9tq10DlUiV8ox7JYk
         W5xe1s3+qXpd0Uvp3VuAUHjEJU8roKfOWae6Y5nN3NUJJsa8O7aT7LMpdBFzqOcaK53x
         5wvvah3NDkboJw47zkOQrmyeqgKMJCFTC+T3iMPCWMFQ4602wsFuleLpzY1BlQOn+S+d
         6Jh13j4uT5OdJWdPMgd6zCHoalvN1bDzKH/FyQPWJCPFVGEwI7KYmAb/6Z0odakHTReZ
         rH8eb+nLxamgv29VsCu4IQfdSV2bcBMnkwvcQK47hB8pcj4Ycmi1bDD+NJX+WlxRIrtz
         GByg==
X-Gm-Message-State: AOJu0YxDGOY4oplNmiw5tUOUkuhO1zg1gWFzcZnsLzbNIELkGFlF8U4N
	pFOf9ucThJHyXclDZf//H270MqAKfXHWFpxnCC3u++52yXR4TJTLXxf3ufKCPdU=
X-Google-Smtp-Source: AGHT+IEvsSaSRUS9z739pDAh0FjrjH3txLuBAGvYd1RJEBQ7yTIpgIeSfP/iRhvitjp+ztGPhdS87w==
X-Received: by 2002:a05:600c:5641:b0:41b:85bf:f3a8 with SMTP id 5b1f17b1804b1-42108a0ba39mr101583065e9.35.1716883010189;
        Tue, 28 May 2024 00:56:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8f19:f965:3f93:6385? ([2a01:e0a:982:cbb0:8f19:f965:3f93:6385])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f163a8sm164159405e9.13.2024.05.28.00.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 00:56:49 -0700 (PDT)
Message-ID: <e8268cf2-16e1-4903-9dc5-9377a9be7d0e@linaro.org>
Date: Tue, 28 May 2024 09:56:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 0/6] Add DSC support to DSI video panel
To: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>
References: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
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
In-Reply-To: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/05/2024 16:21, Jun Nie wrote:
> This is follow up update to Jonathan's patch set.
> 
> Changes vs V4:
> - Polish width calculation with helper function
> - Split cfg2 compression bit into another patch
> 
> Changes vs V3:
> - Rebase to latest msm-next-lumag branch.
> - Drop the slice_per_pkt change as it does impact basic DSC feature.
> - Remove change in generated dsi header
> - update DSC compressed width calculation with bpp and bpc
> - split wide bus impact on width into another patch
> - rename patch tile of VIDEO_COMPRESSION_MODE_CTRL_WC change
> - Polish warning usage
> - Add tags from reviewers
> 
> Changes vs V2:
> - Drop the INTF_CFG2_DATA_HCTL_EN change as it is handled in
> latest mainline code.
> - Drop the bonded DSI patch as I do not have device to test it.
> - Address comments from version 2.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
> Changes in v5:
> - Link to v4: https://lore.kernel.org/r/20240524-msm-drm-dsc-dsi-video-upstream-4-v4-0-e61c05b403df@linaro.org
> 
> ---
> Jonathan Marek (4):
>        drm/msm/dpu: fix video mode DSC for DSI
>        drm/msm/dsi: set video mode widebus enable bit when widebus is enabled
>        drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
>        drm/msm/dsi: add a comment to explain pkt_per_line encoding
> 
> Jun Nie (2):
>        drm/msm/dpu: adjust data width for widen bus case
>        drm/msm/dpu: enable compression bit in cfg2 for DSC
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  8 ++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 18 ++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 13 +++++++++++++
>   drivers/gpu/drm/msm/dsi/dsi_host.c                   | 10 +++++++++-
>   5 files changed, 49 insertions(+), 2 deletions(-)
> ---
> base-commit: e6428bcb611f6c164856a41fc5a1ae8471a9b5a9
> change-id: 20240524-msm-drm-dsc-dsi-video-upstream-4-22e2266fbe89
> 
> Best regards,

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

with https://lore.kernel.org/all/20230728012623.22991-1-quic_parellan@quicinc.com/ and enforce-video-mode in panel node.

Thanks,
Neil

