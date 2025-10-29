Return-Path: <linux-arm-msm+bounces-79413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2162C19D45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 11:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58DFB427741
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 121202FDC56;
	Wed, 29 Oct 2025 10:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yqcBlwp5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB952FBE15
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 10:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761733556; cv=none; b=Gw1xXJbXtc8JOwCnD0XqcsvDlUSKi1hXPiV/PBU99yN1b+NbuqVCJ+rkq2Tb5JQDM9SM4YKL/4YRBzo7/hNUfsFnLKwYAHtPqaeN2qa3TKRqMQIiDrFnCFmoZkxbOZNK2V+BwIxExqbVT7CSv/+MRSEotA/Q3gjCyEePZdtXi14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761733556; c=relaxed/simple;
	bh=6N/SzBDlJU5/Vt/rR1nm44+5vCO8BylMryJ0mQThc9k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=M+JlbdDDxPafssFkNy04730aBWKu+R1S1jLXvXOdKDl2lRtcKWER7Id2142qQaZkv+p09DpRjm3/XWL5N/NWaq16d3+Z/Ift70oDzbF+k06ObgnhKsVDUSbaGsHRCdOH8suqy0E/mzCq9CxggkuZtLw49QE4LiWZ3qd+Ij6OoE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yqcBlwp5; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4298a028de6so514292f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 03:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761733552; x=1762338352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CU7TWVmxUfjdS/j+fhhfS1Lr/4BtUCHNuC4l5CHyDbI=;
        b=yqcBlwp52wKPWL+psGPLtZhIjoSQhjTQgEf018KfkXw3mXZMgC1e/dkOCFpt0qp6Ht
         I6py2Ux/RkRCkGTpX5lK3lpi7n7D0tEOw708uYpGqhpjHEcnqA+KelMwBiaSolBY+rBl
         P/xG16GUBPkQ/jKNw4Gk9SxRrcclbku0B2INPEgz48wmOrYXL8OU2TwBCH6s/mVy781g
         xU5oKtNsH346t63lZMc+jJ2y8uYJvdUqXg2w1ZJGl/fHOFCLCu66wFbDrmEOu3Sb9UI9
         kRtYCQv/7c7ErepHz+wapyOmhzfZpaKyo3Zivyp3uahF/grTjRX1rRRuElJdpg8hePX2
         Jh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761733552; x=1762338352;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CU7TWVmxUfjdS/j+fhhfS1Lr/4BtUCHNuC4l5CHyDbI=;
        b=IrEQeK8G1QbqE1+PfSyFMdLvtgz/ptHUoPYV2FtYOhul+x+z3W9nm7atntnLimZovp
         dBUQJsAC9Dw+OEDPkeTB3iY1z42/1hH68rdgL0OttSAOtiyAYkSxbV3fzDrkdg8G75gu
         PIlXMPWGswsgVJUZvpXELgPuPHF9j5K/G6xvI+Nlx50EJln5jMvwhva9Wfodh5I8vcTT
         bd6G+Z6xqrMtBlNR9khmR5smbmoX1NXae8LyElL08L9oAD8WOYzj8oxwVj/GNIP1LL+g
         JMqHdL9OHZ36C3LOZCQRYYWjt/YFY2ihtgyQjTY630xm8LAm9UmYwgEaaBRXhVj92Bu6
         qCOg==
X-Gm-Message-State: AOJu0Yxr9Lq17xUPC6NN+riueQDIX1QOW54Yx0IqvyKHCi/cujxCdbB4
	4GtIRcwd1qOPsC77AdQ3ijgrZaNW11piFh46vC3aMCvLiMDQ35PToiAJ4emjgozt5dc=
X-Gm-Gg: ASbGncv7U+K7+Isx+L6htkmeEUPo1q7bvGrjIdSlsVaxqkhokz8lu7YsWLArcKUbiWq
	iiK/1N2V3nO0svxaKTtfUIup2xnjwfIhWOVJNkEYX8gYsKilbXC3TZ4efeas91osrkcAyzpkzCx
	fDGOm298jysY0ifaoZbyxN9CgRW1o2W30B+3xaKU7bbRdVZDcYflyBbGheNX476FsWQL+kTTdTC
	zxBF++cv7EqR7DmMM1KQkQo4hMoiizkZIrnolxBrhdibpGjoUDTbHm0oLPDkKay5qyUd01pFzNo
	33SM/vAL/H5D4mauyScaN8dZTY9YIX442XU2vMiC30VYtgNHqIzOJDgwM9AM/06tuCYW6GDwyxF
	8IeFP549OtYhGBZQXZk4BDmH5LcuDib1Jf1FpqQW5pvoJ6tQaFenALf1NiqzP11sgFkALBirnQy
	JTuh7uhN+ewTdQQ+81lNxxecX3mmHuFucHagUpgCaZrGLJQnoZLQ==
X-Google-Smtp-Source: AGHT+IEaHuD6PBgXNpeW/yrwt9PlnJGDUDO8+HVfKS6ur9Ofnl58vj3by9OfMJOoTchhrlGpuEduUg==
X-Received: by 2002:a05:6000:1acd:b0:425:70cb:9ba8 with SMTP id ffacd0b85a97d-429ae8de800mr1917995f8f.1.1761733551856;
        Wed, 29 Oct 2025 03:25:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0? ([2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5c9dsm26655869f8f.26.2025.10.29.03.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 03:25:51 -0700 (PDT)
Message-ID: <e9e117ed-823c-47e3-8ed6-14dbecc844bc@linaro.org>
Date: Wed, 29 Oct 2025 11:25:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a
 driver
To: Jens Reidel <adrian@mainlining.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
 <02356e35-0a3a-4a50-ad38-3032f9f166c9@mainlining.org>
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
In-Reply-To: <02356e35-0a3a-4a50-ad38-3032f9f166c9@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 10/26/25 02:31, Jens Reidel wrote:
> On 10/22/25 14:44, Neil Armstrong wrote:
>> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
>> the GCC and GPUCC sync_state would stay pending, leaving the resources in
>> full performance:
>> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
>> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu
>>
>> In order to fix this state and allow the GMU to be properly
>> probed, let's add a proper driver for the GMU and add it to
>> the MSM driver components.
>>
>> Only the proper GMU has been tested since I don't have
>> access to hardware with a GMU wrapper.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 354 ++++++++++++++---------------
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |   6 -
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   3 -
>>   drivers/gpu/drm/msm/adreno/adreno_device.c |   4 +
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   4 +
>>   drivers/gpu/drm/msm/msm_drv.c              |  16 +-
>>   6 files changed, 192 insertions(+), 195 deletions(-)
>>

<snip>

>>
>> ---
>> base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
>> change-id: 20251022-topic-adreno-attach-gmu-to-driver-e47025fd7ebb
>>
>> Best regards,
> 
> Hi Neil,
> 
> thanks for the patch. With it applied, my GPU fails to initialize.
> Here's the related dmesg section:
> 
> [    1.733062] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x50020000
> [    1.735229] [drm] Initialized msm 1.13.0 for ae01000.display-controller on minor 0
> [    1.735403] msm_dpu ae01000.display-controller: [drm:adreno_request_fw] loaded qcom/a630_sqe.fw from new location
> [    1.735513] msm_dpu ae01000.display-controller: [drm:adreno_request_fw] loaded qcom/a630_gmu.bin from new location
> [    1.746710] a6xx_gmu 506a000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set BOOT_SLUMBER: 0x800000
> [    1.746766] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] *ERROR* Couldn't power up the GPU: -110
> 
> This could be because I have an Adreno 630-family GPU, which is marked as legacy in a6xx_gmu_init / a6xx_gmu_bind. Previously, the rest of the init code would just always run, while now, some parts are conditionally disabled for legacy GPUs - that may be unintentional? However, unconditionally enabling those parts seems to fail to initialize the GPU followed by a reset shortly after, so there's probably more to this.
> 
> Please let me know if there's anything I can do to help debug this.

Thanks for the report, it's an sdm845 based right ?

I may have mismatched the role of the legacy parameter...

Could you try this on top:
===========================><=====================================
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 6e7c3e627509..403675ed18c7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1925,6 +1925,7 @@ static int a6xx_gmu_bind(struct device *dev, struct device *master, void *data)
  	struct msm_drm_private *priv = dev_get_drvdata(master);
  	struct msm_gpu *gpu = dev_to_gpu(&priv->gpu_pdev->dev);
  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	bool is_wrapper = adreno_has_gmu_wrapper(adreno_gpu);
  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
  	struct device_link *link;
@@ -1936,18 +1937,18 @@ static int a6xx_gmu_bind(struct device *dev, struct device *master, void *data)
  	if (ret)
  		return ret;

-	if (adreno_has_gmu_wrapper(adreno_gpu))
+	if (is_wrapper)
  		/* Mark legacy for manual SPTPRAC control */
  		gmu->legacy = true;

-	if (!gmu->legacy)
+	if (!is_wrapper)
  		/* Set GMU idle level */
  		gmu->idle_level = (adreno_gpu->info->quirks & ADRENO_QUIRK_IFPC) ?
  			GMU_IDLE_STATE_IFPC : GMU_IDLE_STATE_ACTIVE;

  	pm_runtime_enable(gmu->dev);

-	if (!gmu->legacy) {
+	if (!is_wrapper) {
  		/* Get the list of clocks */
  		ret = a6xx_gmu_clocks_probe(gmu);
  		if (ret)
@@ -2063,7 +2064,7 @@ static int a6xx_gmu_bind(struct device *dev, struct device *master, void *data)
  		goto detach_cxpd;
  	}

-	if (!gmu->legacy) {
+	if (!is_wrapper) {
  		/* Other errors are handled during GPU ACD probe */
  		gmu->qmp = qmp_get(gmu->dev);
  		if (PTR_ERR_OR_ZERO(gmu->qmp) == -EPROBE_DEFER) {
@@ -2082,7 +2083,7 @@ static int a6xx_gmu_bind(struct device *dev, struct device *master, void *data)
  	 */
  	gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");

-	if (!gmu->legacy) {
+	if (!is_wrapper) {
  		/* Get the power levels for the GMU and GPU */
  		a6xx_gmu_pwrlevels_probe(gmu);

@@ -2115,7 +2116,7 @@ static int a6xx_gmu_bind(struct device *dev, struct device *master, void *data)

  err_mmio:
  	iounmap(gmu->mmio);
-	if (!gmu->legacy) {
+	if (!is_wrapper) {
  		if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
  			iounmap(gmu->rscc);
  		free_irq(gmu->gmu_irq, gmu);
@@ -2123,7 +2124,7 @@ static int a6xx_gmu_bind(struct device *dev, struct device *master, void *data)
  	}

  err_memory:
-	if (!gmu->legacy)
+	if (!is_wrapper)
  		a6xx_gmu_memory_free(gmu);

  	return ret;
===========================><=====================================

Thanks,
Neil

> 
> Best regards,
> Jens


