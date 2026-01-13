Return-Path: <linux-arm-msm+bounces-88640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9105FD161A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 02:01:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27B4E301D0D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 01:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534D3155C82;
	Tue, 13 Jan 2026 01:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="c8Jp2vox"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6011F3FED;
	Tue, 13 Jan 2026 01:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768266071; cv=none; b=uDwIZqUahQrH3fcP7YZHTf7P7HyFs74absFUrO+agaEWv4ZqU5nIi6aDJJpDWElcza2Xt6YcFlGlkQt0xYSDomdReOuGUgJ0IXByGtM5rqFLtPfueGpj88nXGijgOInD1qGjmCX6PjrPfj6CmW1HnapMk0ebhZ4TJKcrNsiwmKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768266071; c=relaxed/simple;
	bh=RH3oOWZCji97bZognVGdIF5XqidXF15tY79CGO4hD1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bcIWJDly6vlfyUed/JdU2vgbxOD94hHVP+1y+RnzMTMLwiDqPZgknMQspjvB8QhtGRu2hWsqan4lRb4Kca8hQCb1Hr3jwSE0OgpZshtH5fVZ/j1LL31X5qvoqixgogzHc8CLzVUD2/eFW8A7z+zUg6PfwenQrMlXavjplJbg0Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=c8Jp2vox; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jbAjuPYFTEJXorrBffuqKG8SxqsXfWlW/5ThtQy0OjU=; b=c8Jp2voxcCcoThA6CZVxvrdWc7
	sN+AnnK++shNpcJVnXi0ZXkvUCtHDJ8V65niXBPA630wqApzcogQByyTmuIjnz0PpUXUPPmDWuRhQ
	tYG3fu/tGk+RdqKrneebKzJOGDLvdKsL/CIrixgC+2Eai5XVPwHQV0nmbXMk7XL/9N2s=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(envelope-from <alexeymin@minlexx.ru>)
	id 1vfRrm-0000000FwLc-27Lj;
	Tue, 13 Jan 2026 03:02:34 +0300
Message-ID: <bb889140-5ddb-485a-bb50-739f68297838@minlexx.ru>
Date: Tue, 13 Jan 2026 03:02:33 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] drm/msm: drop DPU 3.x support from the MDP5 driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
Content-Language: en-US
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
In-Reply-To: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/28/25 7:02 AM, Dmitry Baryshkov wrote:
> Fix commands pannels support on DPU 3.x platforms and drop support for
> those platforms (MSM8998, SDM660 / SDM636, SDM630) from the MDP5 driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v4:
> - Inverted logic in dpu_encoder_phys_cmd_wait_for_commit_done(), check
>    for the feature rather than the lack of it.
> - Link to v3: https://lore.kernel.org/r/20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com
> 
> Changes in v3:
> - Fixed commit message (Marijn)
> - Reordered CTL_START checks to be more logical (Marijn)
> - Link to v2: https://lore.kernel.org/r/20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com
> 
> Changes in v2:
> - Fixed CTL_START interrupt handling on DPU 3.x
> - Link to v1: https://lore.kernel.org/r/20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com
> 
> ---
> Dmitry Baryshkov (3):
>        drm/msm/dpu: drop intr_start from DPU 3.x catalog files
>        drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
>        drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
> 
>   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   5 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |   5 -
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   5 -
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   7 +-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           | 314 ---------------------
>   drivers/gpu/drm/msm/msm_drv.c                      |  16 +-
>   6 files changed, 17 insertions(+), 335 deletions(-)
> ---
> base-commit: 4ba14a6add891fe9b2564e3049b7447de3256399
> change-id: 20250926-mdp5-drop-dpu3-38bc04d44103
> 
> Best regards,

Thanks!

This fixes DPU with command mode panel on Sony Xperia XA2
(sdm630-sony-nile-pioneer) and still works on video mode panels on
whole bunch of sdm660/636-xiaomi phones and tablet. The whole series

Tested-by: Alexey Minnekhanov <alexeymin@minlexx.ru>

---
Regards,
Alexey Minnekhanov

