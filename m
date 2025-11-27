Return-Path: <linux-arm-msm+bounces-83656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B55C8FE0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 19:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5278E34F5BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 18:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9C82FE056;
	Thu, 27 Nov 2025 18:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/oLjezA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958372EBB90
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 18:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764267289; cv=none; b=TAazFxxJEt8f0TmCla3i78+/+8VO9uCPdO/aYzx8IBz33lcuRBPvqshxJ7vqE6o0Jr64ge0GzcNssVKOnngZ4cQYkJHjBWOYNiAZFCqurnRpDbmO9xgTSTKDgJJaVuo9xQA4Ch2V+zXO0yeU0o4qZn3Oj+WG9ppSWeWmZGbrCWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764267289; c=relaxed/simple;
	bh=ia6SHQohiechg9nQ9nHZ1T6fV6EympZXMLpAndDTUS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hhiwsJ3ec7dekoDSA8rRapiyVLE5klSp5KDlH5/wh2SEsyGIMD19+uRs8S2aisZvhPQbuyvh3kVPV3MqAgm3g0zpHt9TRhJvFy+LmnaoBTU9Heg3HwY6r5b0VNKUJFHU2LOjhavGtd8uXPAmp6umE6/fzWxlHtTMO4Fotg/jO70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/oLjezA; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-645a13e2b17so1779077a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764267285; x=1764872085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ceY0sHn48rRAcMonu5JKJvkpaxI/kuQGGI7CQ61F3IE=;
        b=S/oLjezAw4VIYGWJ94CDGeEcT9Pj1l6NUtJn8mgwx/ynhErW2LZvSQHrrBwv6RWNQg
         6s7U+mNpL5/+EBgJr31j6u6MhtfJD6XfHX4GAVjOauwNxuFtSztiRorkSTTasgVlyh05
         B4xUUtKVs8g68owR2D7YZBsB23+RgaOghpJTr+2dNwgbw6BIFC1H/8MXuEXvw/qE845x
         OM+MVnAjx3YAgUOMCArAFstdNIQA7AbIN3X9wyTJjoI6Et54qgM6XuAtjG9Ir0NYpVuP
         y2E1/23WSKZ3r/6b5umpCSXgdqiPpMBqTmwt+HNS9Ey+47+QtitFrw4MZGlgsVP8KUtB
         0Plg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764267285; x=1764872085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ceY0sHn48rRAcMonu5JKJvkpaxI/kuQGGI7CQ61F3IE=;
        b=D3mULY+mtAFwcIZeWSBcIWpfxrbrkJM1mhp9h2f4tC1enR32P/wkOhGdinM701chBM
         JzD7/QZ4UFDmyoryToed4LDlhQfSPnZKTVMz0opwv57NpTdOlq9sbcgnj/XYec5+lyD0
         j0RAWcvmzjWdoiCOtCJRYXBSqOFSSjEzqziz79nqgIzHXzDCcwox70IOWdfqtvnYcDV9
         BG0lzFhRisQSpY1Dz1r8Tnzmuj95yDNd90rG3R1PSECnIfs0pRqlfuIo+2/OvTxU1Rsx
         90yfTLv2D5JRMH+5APgeJB3QVKIZIuc2QjBUs8utLj+fZSt7xNF95qwJac4oRD4j4IGD
         dd/Q==
X-Gm-Message-State: AOJu0YyRhIf9Vft6udx0U//13m/kH5UMXTWyF4QrCc/dvJNRo/JVI4Jc
	xxBjZRWknMXzXvaqZiVjeH9kk67wzzG980yBQkIWAfq5eBv4uMUZWus=
X-Gm-Gg: ASbGncs7dO5PQL2coXXZ3k4aoytTwzcfGny0upIv/cgvh8zQT9aGO2qwtF2sf3asDO4
	xugn6n5rf6hjTWnHWysS3vsgZNfKv5NfwSjchfz3u9c5LXoo0QE5cZ6w80DN2wQ/XosT8ZxVnse
	oPzQtS1ZXq7i9aA4TWYe9Yd3B55WtqtIyfxCTeQrxMkTitd3Nk5xGCaNLmNs5vS/8GjB28i7znR
	EpETQRSf0auVLp2ZdcfMLDtecsZXjvCs5X0zHTz71gI+O42xELtNflmabavWEIZrDO89Pwa/4qr
	w4c8UMXzaXUr+ZUCTiC1herU3y+X8hDzZhHHlzPzLVfgpQEdCWEZvnOJWLyp3RK+VpV8dGljfc0
	Spe/RuIEBDWZrw2TPVvzHNBpsZoag/sCitq2WBSKXUvqkHUa5lXIln6zkJnNBm2Nu5auFFh8QeE
	03NpyQbAl7sTJEQ6wcpYTrdvIYiSRm7xNGeMpwqH7m9uTst06pVi0B0w0t0SN4Oz7eYL2MaUQqx
	xrI2SpqhQ==
X-Google-Smtp-Source: AGHT+IGRUoCmVJ8/5fdmTyuQWpZViuuejagy86jo7A4HW53phUVP0SJulYD9Y2kxyuKuF6EnaU2ukQ==
X-Received: by 2002:a05:6402:2688:b0:640:8bdb:65f0 with SMTP id 4fb4d7f45d1cf-645eb23bc21mr11606430a12.11.1764267284699;
        Thu, 27 Nov 2025 10:14:44 -0800 (PST)
Received: from [192.168.1.17] (host-79-53-175-79.retail.telecomitalia.it. [79.53.175.79])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751050a63sm2219261a12.24.2025.11.27.10.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 10:14:44 -0800 (PST)
Message-ID: <951138f1-d325-4764-a689-e1c3db12bb90@gmail.com>
Date: Thu, 27 Nov 2025 19:14:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix a7xx per pipe register programming
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20251127-gras_nc_mode_fix-v1-1-5c0cf616401f@gmail.com>
 <58570d98-f8f1-4e8c-8ae2-5f70a1ced67a@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <58570d98-f8f1-4e8c-8ae2-5f70a1ced67a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/27/25 3:25 PM, Konrad Dybcio wrote:
> On 11/27/25 12:46 AM, Anna Maniscalco wrote:
>> GEN7_GRAS_NC_MODE_CNTL was only programmed for BR and not for BV pipe
>> but it needs to be programmed for both.
>>
>> Program both pipes in hw_init and introducea separate reglist for it in
>> order to add this register to the dynamic reglist which supports
>> restoring registers per pipe.
>>
>> Fixes: 91389b4e3263 ("drm/msm/a6xx: Add a pwrup_list field to a6xx_info")
>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  9 ++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 91 +++++++++++++++++++++++++++++--
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 13 +++++
>>   4 files changed, 109 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 29107b362346..c8d0b1d59b68 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1376,7 +1376,6 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
>>   	REG_A6XX_UCHE_MODE_CNTL,
>>   	REG_A6XX_RB_NC_MODE_CNTL,
>>   	REG_A6XX_RB_CMP_DBG_ECO_CNTL,
>> -	REG_A7XX_GRAS_NC_MODE_CNTL,
>>   	REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE,
>>   	REG_A6XX_UCHE_GBIF_GX_CONFIG,
>>   	REG_A6XX_UCHE_CLIENT_PF,
>> @@ -1448,6 +1447,12 @@ static const u32 a750_ifpc_reglist_regs[] = {
>>   
>>   DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
>>   
>> +static const struct adreno_reglist_pipe a750_reglist_pipe_regs[] = {
>> +	{ REG_A7XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> At a glance at kgsl, all gen7 GPUs that support concurrent binning (i.e.
> not gen7_3_0/a710? and gen7_14_0/whatever that translates to) need this

Right.

I wonder if gen7_14_0 could be a702?

If we do support one of those a7xx GPUs that don't have concurrent 
binning then I need to have a condition in hw_init for it when 
initializing REG_A7XX_GRAS_NC_MODE_CNTL

>
> Konrad


Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


