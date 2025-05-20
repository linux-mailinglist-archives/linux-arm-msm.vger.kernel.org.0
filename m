Return-Path: <linux-arm-msm+bounces-58636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D326ABD122
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAE498A63CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 07:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325A92571D3;
	Tue, 20 May 2025 07:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lHzdQTWn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EC925B1C5
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 07:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727755; cv=none; b=I7RSFooqP6K3C84O1Nfu8aqSZjENIOCbGKAXU+7sFX/Oof5Kvhmnqxtv06KrRi+T88J+ouAyHzlIMCX/pApb+2ZQRqxTbtiyMHjxG5O5ShCK0rUKcdpTbjjQFaiCWi3p+xccL19pMMSLyO5mrQS2VERsQV4o78LonlJQp3XylAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727755; c=relaxed/simple;
	bh=7ETIO8j2NFvu1HImrLPK//1/jRc+u9SOjxdQk9AXImw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=E4rT3qiSRuxYqVonbe00xFgQPq+sVTEi6g9bOkXCR9LA7XGqtW/jVefGNCtR09PFf1/efEEC7h5EWleIyHuqIOxSZseHNK0nZgNQld8GwSdi4zBPY+vaFGNch0rRFypA70eBPbov2dEntEnpg/qo0hScZw/trvq4t8MvlXXTcjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lHzdQTWn; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a3798794d3so415236f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 00:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747727751; x=1748332551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EKbUf1p5APeINLuH5WiUTeML7/CNRBNC0lyxpgvI6Co=;
        b=lHzdQTWng3jc4TgaRgx/CnxLpKBYdwFcR2tGLYzu4ozm3VnfGUT5hpXSZOaNtJCODp
         jBUHVZU75Df5Nixp7Fm8j+OG2sTJb51EO7Rj3J3Zv0co0GK+x+WXCQ3BEE/v1i1n+6iE
         000jzqafktdzr6vnFrVMeXsvRPbfNZ8GDGCcRGSGDw/IAMKALI4vwUXuUUmoCQ3fMZLp
         EPyXjDLxFe/VbTzkDmDctVPvbXXHIBGW/luq4LXkyilpqL0dizMolZXGYTrixcj+N81V
         7FwGH9zMFenozUYF6qrjeItZrXCrnYWQpyyZ5d+ZTze9Hq7OD9W8R+9JHacbg+5HJT5y
         Y6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747727751; x=1748332551;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EKbUf1p5APeINLuH5WiUTeML7/CNRBNC0lyxpgvI6Co=;
        b=sj53XyRED2SwqFatG6HZDyhvRh/jP3/LWMyWN/wYYSXdqvEWDy+YbxGZefzW/huQZl
         Hg8DIgbBWSHyMj5Y09gKNpkXD/1hEA97oBgHrBSqKAPbYfzfz9hv2fU1lwmM1D3Q6Jym
         K3+kttIRVY2sKr8nliB2TP7vo4OYLwVngGrGH5krGI6pOwwrufXkEF365rxbxFcEGe0v
         9BpJb1+icDr7dBrsMp3Td4ZHfq9q4Ds2t330zv/Fb+cDiGq7JW1Tx1nTKDDtHkTEs9tI
         qqbev+bpWQ417M1GYctMUaaQtW19OcMk1hCQz7foRTw0BQGk3txrUYXhaqdT8R03BvY2
         hXjA==
X-Gm-Message-State: AOJu0Yxlt/vW+3lsX8MjO6RWYI+UZgrKTlqrWjzon1eCBPxJdspmkift
	sHBS4Ihk6PguDpqpxfZFZ+/fGkpbsI+AJyP0G3ZXX5HZfo0M/urJNLu/zuSOqPvP5oOBY3QASDP
	wW1dp
X-Gm-Gg: ASbGnctb7jUf+damHiRBJVaurivAWiE/ZvcgPHyrOJm0E+7zcxqfDIC+okmAur4uNV+
	yU68PTLLskcVLQwFEjE5fvYx0KSmMnBdOQdr863ybB43yIJrgMFecbnM77hYSvrOGybG9xu0IkE
	adBmFFZSt8PA29+rHVAt5mgQ1c/1nyMzbMIt+iKBhCYzJ5VeIxLsnse4mM1yRrMuPUrzlFpQb0x
	7Urfmz9XdTamHLXwkxkBhOKS98CiACPoQkLhRLruIeur9ZYMoM5bwWJ7jWJ85EsnbBYHslURKqv
	2k7IWlPssRFNbCUqIDMteabMuY7uIOJSxEVttAehGLGD8xBAhvVN3UOObDTpOlLpA5BvLXW/7eF
	MwPKSmwn/tuteUa5rd5aqvt/T8MpI
X-Google-Smtp-Source: AGHT+IHqpQQaiMIHYcSyQZgHE1IAkawjruaI9sdxo/uke24AEDaVkry7vbPYloyowFnuUreFj8dklQ==
X-Received: by 2002:a5d:584c:0:b0:3a3:7077:aba1 with SMTP id ffacd0b85a97d-3a37077ae33mr5942554f8f.48.1747727750878;
        Tue, 20 May 2025 00:55:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a79asm15195141f8f.25.2025.05.20.00.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:55:50 -0700 (PDT)
Message-ID: <c097dc26-6437-4052-95be-1a7f98509ced@linaro.org>
Date: Tue, 20 May 2025 09:55:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 12/30] drm/msm/dpu: get rid of DPU_CTL_VM_CFG
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-12-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-12-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Continue migration to the MDSS-revision based checks and replace
> DPU_CTL_VM_CFG feature bit with the core_major_ver >= 7 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 6 ------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 6 ------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 6 ------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 6 ------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 6 ------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 6 ------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 6 ------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 6 ------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 3 ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c               | 2 +-
>   12 files changed, 1 insertion(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> index 52ad7e2af0148c9ea81a2c95b270be7058fbaec1..bbdb7e1668fee33cb7d99a7cb8ab001e58f079be 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> @@ -31,32 +31,26 @@ static const struct dpu_ctl_cfg sm8650_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x15000, .len = 0x1000,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x16000, .len = 0x1000,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
>   		.base = 0x17000, .len = 0x1000,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	}, {
>   		.name = "ctl_3", .id = CTL_3,
>   		.base = 0x18000, .len = 0x1000,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>   	}, {
>   		.name = "ctl_4", .id = CTL_4,
>   		.base = 0x19000, .len = 0x1000,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>   	}, {
>   		.name = "ctl_5", .id = CTL_5,
>   		.base = 0x1a000, .len = 0x1000,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index bbef0e1c597299d24a923e1f0d977c99afedb8fb..3c6da0acdc3b81db65e2544f16d90322fe7e92a6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -39,32 +39,26 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x15000, .len = 0x1e8,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x16000, .len = 0x1e8,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
>   		.base = 0x17000, .len = 0x1e8,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	}, {
>   		.name = "ctl_3", .id = CTL_3,
>   		.base = 0x18000, .len = 0x1e8,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>   	}, {
>   		.name = "ctl_4", .id = CTL_4,
>   		.base = 0x19000, .len = 0x1e8,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>   	}, {
>   		.name = "ctl_5", .id = CTL_5,
>   		.base = 0x1a000, .len = 0x1e8,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 281826170da082fc90a05c641060901ece0fbed3..2ee29c56224596b3786104090290b88cecf7b223 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -32,22 +32,18 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x15000, .len = 0x1e8,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x16000, .len = 0x1e8,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
>   		.base = 0x17000, .len = 0x1e8,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	}, {
>   		.name = "ctl_3", .id = CTL_3,
>   		.base = 0x18000, .len = 0x1e8,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 1dd0a1aa222d65f03013d634a87371dc552b5bd8..2f20d0014a94e707a5f0548fc1c6bf0983b0cad0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -39,32 +39,26 @@ static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x15000, .len = 0x204,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x16000, .len = 0x204,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
>   		.base = 0x17000, .len = 0x204,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	}, {
>   		.name = "ctl_3", .id = CTL_3,
>   		.base = 0x18000, .len = 0x204,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>   	}, {
>   		.name = "ctl_4", .id = CTL_4,
>   		.base = 0x19000, .len = 0x204,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>   	}, {
>   		.name = "ctl_5", .id = CTL_5,
>   		.base = 0x1a000, .len = 0x204,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 50142b14e24eb875e72e5cff3b28ff8aba89fc9c..314875e2dca96b3b5c40aae0d15fb80da8ebd42c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -40,32 +40,26 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x15000, .len = 0x204,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x16000, .len = 0x204,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
>   		.base = 0x17000, .len = 0x204,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	}, {
>   		.name = "ctl_3", .id = CTL_3,
>   		.base = 0x18000, .len = 0x204,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>   	}, {
>   		.name = "ctl_4", .id = CTL_4,
>   		.base = 0x19000, .len = 0x204,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>   	}, {
>   		.name = "ctl_5", .id = CTL_5,
>   		.base = 0x1a000, .len = 0x204,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> index 264cd6d3640be1bf321fda429748ecdafbeed214..36775f444af4b2654231cd9456ac4eea1f0f18e6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> @@ -39,32 +39,26 @@ static const struct dpu_ctl_cfg sa8775p_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x15000, .len = 0x204,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x16000, .len = 0x204,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
>   		.base = 0x17000, .len = 0x204,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	}, {
>   		.name = "ctl_3", .id = CTL_3,
>   		.base = 0x18000, .len = 0x204,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>   	}, {
>   		.name = "ctl_4", .id = CTL_4,
>   		.base = 0x19000, .len = 0x204,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>   	}, {
>   		.name = "ctl_5", .id = CTL_5,
>   		.base = 0x1a000, .len = 0x204,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 83f73c7cdcc3a280285fa32230796fac57167ed6..624f24c8a33a182634d49058014fc3175f5ac9d3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -31,32 +31,26 @@ static const struct dpu_ctl_cfg sm8550_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x15000, .len = 0x290,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x16000, .len = 0x290,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
>   		.base = 0x17000, .len = 0x290,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	}, {
>   		.name = "ctl_3", .id = CTL_3,
>   		.base = 0x18000, .len = 0x290,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>   	}, {
>   		.name = "ctl_4", .id = CTL_4,
>   		.base = 0x19000, .len = 0x290,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>   	}, {
>   		.name = "ctl_5", .id = CTL_5,
>   		.base = 0x1a000, .len = 0x290,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> index b21aab274703ac1f38698bee82d5d28b0fb6a0d0..857dc8465bf5571cd08cf3115fb96002873c004b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> @@ -31,32 +31,26 @@ static const struct dpu_ctl_cfg sar2130p_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x15000, .len = 0x290,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x16000, .len = 0x290,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
>   		.base = 0x17000, .len = 0x290,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	}, {
>   		.name = "ctl_3", .id = CTL_3,
>   		.base = 0x18000, .len = 0x290,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>   	}, {
>   		.name = "ctl_4", .id = CTL_4,
>   		.base = 0x19000, .len = 0x290,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>   	}, {
>   		.name = "ctl_5", .id = CTL_5,
>   		.base = 0x1a000, .len = 0x290,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> index d7e5f4dd3bccab125b0a42f67eddf194359dc761..05b0962c2d937f077d0b42fa8af6e2da40c7dcae 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> @@ -30,32 +30,26 @@ static const struct dpu_ctl_cfg x1e80100_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x15000, .len = 0x290,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x16000, .len = 0x290,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
>   		.base = 0x17000, .len = 0x290,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	}, {
>   		.name = "ctl_3", .id = CTL_3,
>   		.base = 0x18000, .len = 0x290,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>   	}, {
>   		.name = "ctl_4", .id = CTL_4,
>   		.base = 0x19000, .len = 0x290,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>   	}, {
>   		.name = "ctl_5", .id = CTL_5,
>   		.base = 0x1a000, .len = 0x290,
> -		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 19a859e2a1f80c2321789af4ec7c5e299f0fb873..5cd87b13e839e7ad60356cde162405fdfb6f9498 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -104,9 +104,6 @@
>   #define PINGPONG_SM8150_MASK \
>   	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
>   
> -#define CTL_SC7280_MASK \
> -	(BIT(DPU_CTL_VM_CFG))
> -
>   #define INTF_SC7180_MASK \
>   	(BIT(DPU_INTF_INPUT_CTRL) | \
>   	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 1e5fc1d5873975189a1759212b8a6c6078de22f9..3b6133e1bb581741fe87b049ad0c89bf30b76019 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -132,12 +132,10 @@ enum {
>   /**
>    * CTL sub-blocks
>    * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
> - * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
>    * @DPU_CTL_MAX
>    */
>   enum {
>   	DPU_CTL_SPLIT_DISPLAY = 0x1,
> -	DPU_CTL_VM_CFG,
>   	DPU_CTL_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index edb82c81b0a449b1a7273fc258961b9447be8d9d..fe4fdfb8774b176fb024d76dc0bd269d9736d226 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -575,7 +575,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	 * per VM. Explicitly disable it until VM support is
>   	 * added in SW. Power on reset value is not disable.
>   	 */
> -	if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
> +	if (ctx->mdss_ver->core_major_ver >= 7)
>   		mode_sel = CTL_DEFAULT_GROUP_ID  << 28;
>   
>   	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

