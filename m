Return-Path: <linux-arm-msm+bounces-25254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF2592734B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 11:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 436981F23354
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 09:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D12B1AAE38;
	Thu,  4 Jul 2024 09:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KbWAEAmr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B017F1A01BB
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jul 2024 09:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720086453; cv=none; b=W0t5xXuSUZ1kCMjyiljYVN0S3AWtMhRyjDnPO+PpHwZU0PbgyP5epyXBPY0dS+HgPNktkTRgpBqIddYZWYh7uYKu9IUqTE6y/67tDRAXt6uEwcotb6zWPrVZcNrDUnFoCM5ywas0oM7enA0vgVtZcx4h9ZKvj8MSFa9/geeSgRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720086453; c=relaxed/simple;
	bh=h7xMYCifnvTUw5k/D0mjXoV49x0eYwbCKpGUXqoPaqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UWDJOD9Hgr/VcQNiiqz3qizuswB4JOqLR5k26sa5v0Lt8wGt87qcoueBvEIN7vM1DGkCVxACE5EXYDR9Li02vbs/Wga1KSgmVKgk4sb1pMup1hUQ4ykYr49uqb80/Tnlnfn8IsEAqAZrociN6i+dJlDolF1k9rfqXrDnFhc7v4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KbWAEAmr; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ee910d6a9eso1311431fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jul 2024 02:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720086450; x=1720691250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=35N2PrXzYxiJZwkwJHk2aUwLzMamAemczMI+Lfl3A9Q=;
        b=KbWAEAmrWZYlVVEFjE1+xqDYAVq4P0FoAnKZUo/4QIInc9/P+FW9pUz0/xV7ZGVB4u
         aatWoQwXZhMkUdapjIrvKKCK8QOWeVc6znX31GqPAcerQBycZ2PP6utgPT6JGwMGuRTH
         qQ9umGTZHJFe8JIhO4x487OSA+jsCsskaBP1hrpFW5uzUkIjWeYZSLXkp1kNGkL1clm6
         ebAXW84PKdoF5Ao9kQAkVkhaVhHo5O5B382XahWnM9E5pQf85xvAenhnlDeJGGGHXEpR
         t0KW1N0bKnz8lq9QWwFFsRATRScRZrveJXuIr+2ZTLq7u6pkWrsaAtGun2Fp/+hHilj0
         3gjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720086450; x=1720691250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=35N2PrXzYxiJZwkwJHk2aUwLzMamAemczMI+Lfl3A9Q=;
        b=CkScg0jqqfh/3c1I1QhO5aFDAnojE0rqQEWtcEsd1BmZtU4SUI3Pk2SI9l7F3Ptnpp
         Fu3gtBM2OOLIzDD9J7IrFNTGjwv4yLc/SfeD1hw2rCNwOVn+JIdzLAIS00Kd7YhB+AOB
         bGZR92KM+If46tG8ppTfcKwp70YeVOLx4fsO7SGgHiGkzXaS4bdt4SuWSe4HxYYJ/WpI
         sVdkS7v6T+W/bjKBHcHYRUV+YoZ0Ggx1cJNA48I5GtNLAWLfyidDf/VsFQJrIgRDaDc3
         VQXqKoAo1oOQvzNRo0GSVl2a8Vg2cTe3ARD3xh/4zeAl8IDWBJVhGjXDVUkMUXadWN8r
         qcIA==
X-Forwarded-Encrypted: i=1; AJvYcCXtok0Et9pI/dxC0b3feoEm6IPFI9qzUNgGzvMVKiasazv6KZeEBS5QUulGgnAkNbygQoFxrPLh1RgDg8pav7jrmCPpup7YfdyPDwfeeA==
X-Gm-Message-State: AOJu0Yyh7iCzduLXCl74pSYDLbOT68KSjMJICD1y1reB2k4XNru0K1MS
	2MYa4BPX934ullIvEdaYxupHG1DnuVNuAY/i+WdVqXvMaEC2OFIfx1VGvoYzk5U=
X-Google-Smtp-Source: AGHT+IHY10vCx+yPAsfjMVF2tw9KVqfnRtV2MHnfk54hzEFRlKpMtmNraZr7IHPDg143p/NmuRLI2g==
X-Received: by 2002:a2e:3312:0:b0:2ee:8aa7:4885 with SMTP id 38308e7fff4ca-2ee8f2bce1emr3526411fa.14.1720086449816;
        Thu, 04 Jul 2024 02:47:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::b8c? (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee5168cf96sm21284091fa.108.2024.07.04.02.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 02:47:29 -0700 (PDT)
Message-ID: <019146e8-25b3-474a-b433-c69d4fbe0ee0@linaro.org>
Date: Thu, 4 Jul 2024 12:47:28 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix incorrect file name output in
 adreno_request_fw()
To: Aleksandr Mishin <amishin@t-argos.ru>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
References: <20240704093002.15155-1-amishin@t-argos.ru>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240704093002.15155-1-amishin@t-argos.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/07/2024 12:30, Aleksandr Mishin wrote:
> In adreno_request_fw() when debugging information is printed to the log
> after firmware load, an incorrect filename is printed. 'newname' is used
> instead of 'fwname', so prefix "qcom/" is being added to filename.
> Looks like "copy-paste" mistake.
> 
> Fix this mistake by replacing 'newname' with 'fwname'.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 9fe041f6fdfe ("drm/msm: Add msm_gem_get_and_pin_iova()")

Fixes tag is incorrect, LGTM otherwise.

> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 074fb498706f..0bb7d66047f8 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -475,7 +475,7 @@ adreno_request_fw(struct adreno_gpu *adreno_gpu, const char *fwname)
>   		ret = request_firmware_direct(&fw, fwname, drm->dev);
>   		if (!ret) {
>   			DRM_DEV_INFO(drm->dev, "loaded %s from legacy location\n",
> -				newname);
> +				fwname);
>   			adreno_gpu->fwloc = FW_LOCATION_LEGACY;
>   			goto out;
>   		} else if (adreno_gpu->fwloc != FW_LOCATION_UNKNOWN) {

-- 
With best wishes
Dmitry


