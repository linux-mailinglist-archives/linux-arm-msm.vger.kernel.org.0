Return-Path: <linux-arm-msm+bounces-47255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A94A2D954
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 23:33:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D90733A6F75
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 22:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE781F2B89;
	Sat,  8 Feb 2025 22:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fBqCZJWq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064A11F2B87
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Feb 2025 22:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739054017; cv=none; b=TEpG48YC85MjZjLe47Mf/qietGPzfpGfpRtqPgJiK3zVTV8SCFXwqHyqOP8pduxvpA3BXo5PrJ6+FP0IHVCgoY3JZELohusB8O5vAAgavgZK3NsZBpfMnDFe60tT/uQxj1pNyVuB6t4ysE6BqPMXP0HuumausQVx9lMnCG4QrVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739054017; c=relaxed/simple;
	bh=9R9+GjbfgtWDzIqo04bvXnOwtBS/PkbYk1UtsJ2vBYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mqr7A+EHMzBRNaV7hRSS7kK1ynQaqtsBMpaG3MamxwlwQsA/vUeNjFEb9K0DvgnpVILmnwn1Rv6+vNksm1EEOxfIDyWMYbbizI1lIHFXWafwnjL5f0XmFOyv5rGlnz2N705OVlYBExST6lxxvgq/iLj6/aqSitHTgv5Y3Vmsk6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fBqCZJWq; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso3209612f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 14:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739054014; x=1739658814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mmCZoALgTPKPGHinlcl5J6z2VMpBdw6SS/bK8xvteAg=;
        b=fBqCZJWqqxf+/MOZl2R39iTj9zBgj7pRLOgvKzzhpD7YBxjLTm6u8LjXYYRnOET+CJ
         ZRBzUD27rrChPi4URs0u9F5QiRteutHe7WK4nAltSiYciX1Fbcu5ezOVoPhZI/AkAVnx
         CYuTD8oL1+DkbY8PWzLfBPAMiXhNb1fMDZgmaLD2QQLuNRWQ04p28+3M/GQZR9a0UHqj
         gacBa8VZFGE0efw1brIyl+hKOA802bW4Jltwo/3/Zd3l2N79KPG43WIuJ669iIv0Niy/
         zIKY1cIU9C9jcvp4p+Wpf2E+PxEMtwEheDs/LaXAwWbQ1P28PKMavzmTXyKvjHAhufTU
         rb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739054014; x=1739658814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mmCZoALgTPKPGHinlcl5J6z2VMpBdw6SS/bK8xvteAg=;
        b=gtjAQyJ/CiHZrBtKbMpX3WwemNvfPWwhEwvm6+JVx6vR9MsYmTPzpu9OUn4Tx0q6uq
         ZK2DzSHuPJsSvmIbSOy3MsSJPYJIq49GwJVIAADLVxibiYe31c9TK4zJPYMvxZZfSqhY
         lknDCyU+a4jV0lhEBdp+9OXIgHrE3PFbi5Nc8plxUvRd6cByffWm1Hx5JaFEuwWQwxfO
         pHDCfyjvsIm+uU8DWuEpAQ6Zp2Z8euos3oDFRMkeKsWs9IyDAlsfsVirC0nc2tJ4acHr
         +GSy113+hIxNHLw96g/5WfN90+DfrrTbkrTkLtKd5noW7qUtVkvVvC+o3OuID8/q7ViX
         FU2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvtIERNKUjV8l4BNpYh+sOBGKCBPo+DKV0oIjHB1qmMpU/Eud2o59L7nFqv3zNelxWC/ktCZHWbAdHAx5L@vger.kernel.org
X-Gm-Message-State: AOJu0YxszYvA25ppLldQxCm5hfRb1vBmd42KQ5s8h+sxOMLXC5uRs3xP
	vWHu9diMaUc60oUH7Q//8IjAPOO1lu8IpFcFzP4bxTqH0p/gZnETXl/U3DuwTd0=
X-Gm-Gg: ASbGnctDd6dMM7M7WWd4r0SY93Ylkp8frkSggElD/pRM1VZ1ZFIPOnyXj1mIYzVRwi7
	/4+fsZvq7MV2ej442/CN4gqi0fAAdMzeguTK/dYsCIH5O8X+PJtHF5MmAxS3y6N2U6DXNMECgLd
	okvlz8UNlqbCh0lLJ3spVwmyfsYK8KyOOfX4tLCh+NvQ2D8q0IGmbmfLEHeuF6i+1Jnw8iXLLyL
	yiNpodfsISdBmTWIndKNZCeJZT+nZ/ZkBDGb7ZuJpvS0ni7SB5yMDHgnCzWG05+yqv230HEH61R
	Dny45QRRN395T06KQljKQsL4WRbOSK+mU3zcFbIsSnSXjOQ0VuNKX9qnXpjnWTyHc7+FDJXi
X-Google-Smtp-Source: AGHT+IGRCV0aWm6VAHZJx5pGErputBzVkT9c+hC8hv+9pts8L//MC9dbIDaZeqQInA4bKCE7dLkvNg==
X-Received: by 2002:a5d:6d0d:0:b0:38d:c087:98d5 with SMTP id ffacd0b85a97d-38dc8da6713mr6711150f8f.8.1739054014231;
        Sat, 08 Feb 2025 14:33:34 -0800 (PST)
Received: from ?IPV6:2a0a:ef40:1d11:ab01:ce4f:b99d:6477:b544? ([2a0a:ef40:1d11:ab01:ce4f:b99d:6477:b544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d40csm131833045e9.9.2025.02.08.14.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 14:33:32 -0800 (PST)
Message-ID: <818caf8e-6eb5-4af2-ab45-644f063e9b1f@linaro.org>
Date: Sat, 8 Feb 2025 22:33:31 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "dmaengine: qcom: bam_dma: Avoid writing
 unavailable register"
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Amit Vadhavana <av2082000@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 Kees Cook <kees@kernel.org>, Md Sadre Alam <quic_mdalam@quicinc.com>,
 Robin Murphy <robin.murphy@arm.com>, Vinod Koul <vkoul@kernel.org>
Cc: David Heidelberg <david@ixit.cz>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dmaengine@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250208223112.142567-1-caleb.connolly@linaro.org>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20250208223112.142567-1-caleb.connolly@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/8/25 22:30, Caleb Connolly wrote:
> This commit causes a hard crash on sdm845 and likely other platforms.
> Revert it until a proper fix is found.
> 
> This reverts commit 57a7138d0627309d469719f1845d2778c251f358.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>

Missing fixes tag

Fixes: 57a7138d0627 (dmaengine: qcom: bam_dma: Avoid writing unavailable 
register)
> ---
>   drivers/dma/qcom/bam_dma.c | 24 ++++++++----------------
>   1 file changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index c14557efd577..bbc3276992bb 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -58,11 +58,8 @@ struct bam_desc_hw {
>   #define DESC_FLAG_EOB BIT(13)
>   #define DESC_FLAG_NWD BIT(12)
>   #define DESC_FLAG_CMD BIT(11)
>   
> -#define BAM_NDP_REVISION_START	0x20
> -#define BAM_NDP_REVISION_END	0x27
> -
>   struct bam_async_desc {
>   	struct virt_dma_desc vd;
>   
>   	u32 num_desc;
> @@ -400,9 +397,8 @@ struct bam_device {
>   	int irq;
>   
>   	/* dma start transaction tasklet */
>   	struct tasklet_struct task;
> -	u32 bam_revision;
>   };
>   
>   /**
>    * bam_addr - returns BAM register address
> @@ -444,12 +440,10 @@ static void bam_reset(struct bam_device *bdev)
>   	val |= BAM_EN;
>   	writel_relaxed(val, bam_addr(bdev, 0, BAM_CTRL));
>   
>   	/* set descriptor threshold, start with 4 bytes */
> -	if (in_range(bdev->bam_revision, BAM_NDP_REVISION_START,
> -		     BAM_NDP_REVISION_END))
> -		writel_relaxed(DEFAULT_CNT_THRSHLD,
> -			       bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
> +	writel_relaxed(DEFAULT_CNT_THRSHLD,
> +			bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
>   
>   	/* Enable default set of h/w workarounds, ie all except BAM_FULL_PIPE */
>   	writel_relaxed(BAM_CNFG_BITS_DEFAULT, bam_addr(bdev, 0, BAM_CNFG_BITS));
>   
> @@ -1005,12 +999,11 @@ static void bam_apply_new_config(struct bam_chan *bchan,
>   		if (dir == DMA_DEV_TO_MEM)
>   			maxburst = bchan->slave.src_maxburst;
>   		else
>   			maxburst = bchan->slave.dst_maxburst;
> -		if (in_range(bdev->bam_revision, BAM_NDP_REVISION_START,
> -			     BAM_NDP_REVISION_END))
> -			writel_relaxed(maxburst,
> -				       bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
> +
> +		writel_relaxed(maxburst,
> +			       bam_addr(bdev, 0, BAM_DESC_CNT_TRSHLD));
>   	}
>   
>   	bchan->reconfigure = 0;
>   }
> @@ -1198,13 +1191,12 @@ static int bam_init(struct bam_device *bdev)
>   {
>   	u32 val;
>   
>   	/* read revision and configuration information */
> -	val = readl_relaxed(bam_addr(bdev, 0, BAM_REVISION));
> -	if (!bdev->num_ees)
> +	if (!bdev->num_ees) {
> +		val = readl_relaxed(bam_addr(bdev, 0, BAM_REVISION));
>   		bdev->num_ees = (val >> NUM_EES_SHIFT) & NUM_EES_MASK;
> -
> -	bdev->bam_revision = val & REVISION_MASK;
> +	}
>   
>   	/* check that configured EE is within range */
>   	if (bdev->ee >= bdev->num_ees)
>   		return -EINVAL;

-- 
Caleb (they/them)


