Return-Path: <linux-arm-msm+bounces-77953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8AFBEFBAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 09:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8CD3F4E552E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 07:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16BE2D8391;
	Mon, 20 Oct 2025 07:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xaLG5nBL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ABE1E492A
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760946432; cv=none; b=Hje1WBo23KqSQyulBnorbJDVP3ngj/SSwRT0T2fPPefqUHpfmsJoOXGSbhNWNl4lqpY+ke47KNykHhAqk9PTdDGy8gkhIUEcXVd2nF+LecPhgGRCFGm65hqRkeAGgh1fdfI+YjaV5BJMAhFHYIrpknbn7s9XYuH+j/VpaR9erk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760946432; c=relaxed/simple;
	bh=dpdzrgiVWoL5sgn5jiHJvregSh9Hz2YrDXxvG1FGiZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRvinhslLfgzMWn+wTO9Z/04itVc1p0DL8Wn1dCKiDDD7oWAfeDpGZO4+bWo0GH6Dy2p18w5RIJqhVtrWQJvA6q+4MC1ixwx8Xsw5d1As1rcQih01lscGV3gvd5H3y8mPlR07zH39qhNIcmlU49k3SIk9F+Nu+PqZbHMgmtyxek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xaLG5nBL; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b64cdbb949cso630513966b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 00:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760946429; x=1761551229; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jdYaJXFgTemOzLDPjiQMF/fHtgMXn8p6F+1f3IeWbt0=;
        b=xaLG5nBLVOB9HcGruAqi9Wt2G4BRVu/x/EiyxYH2SiUL79WysgtsOm+JKtrYu/Ofqk
         fUNHtHTU3XVdXMOCbRY3a933JS3Lw5Jc1ViYiVU09IQhzE/fxfRN4EnJLSBZVrr9baYX
         P6QpJBG6hCiX4O4ADR0sXUUVl/8mBXnCPDQ51Z0Q7Uli4dyOmjiubhjX7T+gKrkeHp0P
         QgDAtG+ZQw6PVtWjCOLIr7AMDHBveAYTVr5pPxGr0P3/6Hm0+pvAUfrfLYUMrvJqGDqH
         gMGB5CtS7jtoYTLRC7RDIz++RC/sIlnZDhEj++mN8LKfA1t15TGLWjdspBiq2jvW8wPN
         zyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760946429; x=1761551229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdYaJXFgTemOzLDPjiQMF/fHtgMXn8p6F+1f3IeWbt0=;
        b=G7OrNvVMYfPrUAeKVFKgMj2SOtsPKOeK2qSySUP89BfU8XibzDghkUuvdGqzDmscw6
         5sCb3RkRAbolgs/KwdZH7rY+P8UT6yZGtwuhER5uoyG+ATrPaT6teyN1cCQA0ieqKUGO
         ihEh9oBWLuuqO6h0DCERUuvZF3ag2s8oh1xJdP4/umZXDtNaagZRND2eKhd9WdP/KgEx
         xDGMX7Lpmgp0TlpR4Tgh+yo7781URBiA05xJ1crsjQqP4vGWYXITT9xnd3uJRPb+MC43
         Ro2rL61IVcHIp/2ruVm0Ynwj+lAcbYU5cL93fzavskEtxccedrnuU+xXGdXvCIbfhe/J
         cZFA==
X-Forwarded-Encrypted: i=1; AJvYcCUC//FN2n0ua1u0ck+LXWs+BXncCUctnzlwBqe8MqdwBIrAF6YLEOrZVOiitOY2SaosFKIq2/gJn78beHJ5@vger.kernel.org
X-Gm-Message-State: AOJu0YwCWxsFeXCUPrY+kjwdYTTJX/CkMGMFjogkHTHceJ1fwV7QrF4B
	/NsrDKQTV2W2hs0CewcUu4OaLvqGqE5RFhxUiTxvKBTm0jRLvSlkClW1IrerLNz0X+M=
X-Gm-Gg: ASbGncveLtXAWhvi1VKRVCPcJZiJdZnX8UyKqfilWok4wbGQcz/hB25PwzCw2dJTajO
	9+YD0tNezhU4b9bTxGPygWxrWXW9H60W28hXEFAdc9wP0mFMFo/YEq9PRGwBZqPpeOgLX4vCFOj
	PEeiUv7YkRoNxtjZAXz/pMSBHtYzdq2FM8rXWwnaKYbvjx1ZocPMLEtP6OzDmjzx4FdpzIlZPJ5
	/i74ll7fVHP0v82uyTs//GTGKtk+AyWfhQveYrfqdxXxfsCQ+B9UK0Ox0W/sJ+LMo/+zCVlQ3PY
	qFzQYYiVMDGbeUoRy+d6rPMJojWTFCiR/S/9E1DtpUM9jcjgtF4ZrtOdfitRHazDTTZE5EqpiMK
	tEeAFZfrpzf+d7zK+rnmlDDRwo6EZ9QBUyBp+HP3mwN7alQ2T0LjeP3j9J3n/lr33kbJ5ig25Sz
	fcdgK0zzg=
X-Google-Smtp-Source: AGHT+IF4us/nnQeKxobQ3RVkxQjJdQzleXZR2CQU+rtXDcnJakB7pwz67OrdmRumJrsEloyzXaLaVA==
X-Received: by 2002:a17:907:3daa:b0:b5c:66ee:2058 with SMTP id a640c23a62f3a-b6472c6212bmr1246452366b.6.1760946429000;
        Mon, 20 Oct 2025 00:47:09 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8391547sm721693066b.22.2025.10.20.00.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:47:08 -0700 (PDT)
Date: Mon, 20 Oct 2025 10:47:06 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: broonie@kernel.org, gregkh@linuxfoundation.org, srini@kernel.org, 
	rafael@kernel.org, dakr@kernel.org, make24@iscas.ac.cn, steev@kali.org, 
	dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] regmap: slimbus: fix bus_context pointer in
 __devm_regmap_init_slimbus
Message-ID: <65ros7g7iyh57gbr35e4h3awxavf5acljjaiw3v36r2qelvcbv@t2faxxlvmu3n>
References: <20251020015557.1127542-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020015557.1127542-1-alexey.klimov@linaro.org>

On 25-10-20 02:55:57, Alexey Klimov wrote:
> Commit 4e65bda8273c ("ASoC: wcd934x: fix error handling in
> wcd934x_codec_parse_data()") revealed the problem in slimbus regmap.
> That commit breaks audio playback, for instance, on sdm845 Thundercomm
> Dragonboard 845c board:
> 
>  Unable to handle kernel paging request at virtual address ffff8000847cbad4
>  Mem abort info:
>    ESR = 0x0000000096000007
>    EC = 0x25: DABT (current EL), IL = 32 bits
>    SET = 0, FnV = 0
>    EA = 0, S1PTW = 0
>    FSC = 0x07: level 3 translation fault
>  Data abort info:
>    ISV = 0, ISS = 0x00000007, ISS2 = 0x00000000
>    CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>    GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>  swapper pgtable: 4k pages, 48-bit VAs, pgdp=00000000a1360000
>  [ffff8000847cbad4] pgd=0000000000000000, p4d=100000010003e403, pud=100000010003f403, pmd=10000001025cf403, pte=0000000000000000
>  Internal error: Oops: 0000000096000007 [#1]  SMP
>  Modules linked in: (long list of modules...)
>  CPU: 5 UID: 0 PID: 776 Comm: aplay Not tainted 6.18.0-rc1-00028-g7ea30958b305 #11 PREEMPT
>  Hardware name: Thundercomm Dragonboard 845c (DT)
>  pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>  pc : slim_xfer_msg+0x24/0x1ac [slimbus]
>  lr : slim_read+0x48/0x74 [slimbus]
>  sp : ffff800089113330
>  x29: ffff800089113350 x28: 00000000000000c0 x27: 0000000000000268
>  x26: 0000000000000198 x25: 0000000000000001 x24: 0000000000000000
>  x23: 0000000000000000 x22: ffff800089113454 x21: ffff00008488e800
>  x20: ffff000084b4760a x19: 0000000000000001 x18: 0000000000000be2
>  x17: 0000000000000c19 x16: ffffbcef364cd260 x15: ffffbcef36dafb10
>  x14: 0000000000000d38 x13: 0000000000000cb4 x12: 0000000000000c91
>  x11: 1fffe0001161b6e1 x10: ffff800089113470 x9 : ffff00008b0db70c
>  x8 : ffff000081479ee0 x7 : 0000000000000000 x6 : 0000000000000800
>  x5 : 0000000000000001 x4 : 0000000000000000 x3 : ffff00008263c200
>  x2 : 0000000000000060 x1 : ffff800089113368 x0 : ffff8000847cb7c8
>  Call trace:
>   slim_xfer_msg+0x24/0x1ac [slimbus] (P)
>   slim_read+0x48/0x74 [slimbus]
>   regmap_slimbus_read+0x18/0x24 [regmap_slimbus]
>   _regmap_raw_read+0xe8/0x174
>   _regmap_bus_read+0x44/0x80
>   _regmap_read+0x60/0xd8
>   _regmap_update_bits+0xf4/0x140
>   _regmap_select_page+0xa8/0x124
>   _regmap_raw_write_impl+0x3b8/0x65c
>   _regmap_bus_raw_write+0x60/0x80
>   _regmap_write+0x58/0xc0
>   regmap_write+0x4c/0x80
>   wcd934x_hw_params+0x494/0x8b8 [snd_soc_wcd934x]
>   snd_soc_dai_hw_params+0x3c/0x7c [snd_soc_core]
>   __soc_pcm_hw_params+0x22c/0x634 [snd_soc_core]
>   dpcm_be_dai_hw_params+0x1d4/0x38c [snd_soc_core]
>   dpcm_fe_dai_hw_params+0x9c/0x17c [snd_soc_core]
>   snd_pcm_hw_params+0x124/0x464 [snd_pcm]
>   snd_pcm_common_ioctl+0x110c/0x1820 [snd_pcm]
>   snd_pcm_ioctl+0x34/0x4c [snd_pcm]
>   __arm64_sys_ioctl+0xac/0x104
>   invoke_syscall+0x48/0x104
>   el0_svc_common.constprop.0+0x40/0xe0
>   do_el0_svc+0x1c/0x28
>   el0_svc+0x34/0xec
>   el0t_64_sync_handler+0xa0/0xf0
>   el0t_64_sync+0x198/0x19c
>  Code: 910083fd f9423464 f9000fe4 d2800004 (394c3003)
>  ---[ end trace 0000000000000000 ]---
> 
> The __devm_regmap_init_slimbus() started to be used instead of
> __regmap_init_slimbus() after the commit mentioned above and turns out
> the incorrect bus_context pointer (3rd argument) was used in
> __devm_regmap_init_slimbus(). It should be &slimbus->dev. Correct it.
> The wcd934x codec seems to be the only (or the first) user of
> devm_regmap_init_slimbus() but we should fix till the point where
> __devm_regmap_init_slimbus() was introduced therefore two "Fixes" tags.
> 
> Fixes: 4e65bda8273c ("ASoC: wcd934x: fix error handling in wcd934x_codec_parse_data()")
> Fixes: 7d6f7fb053ad ("regmap: add SLIMbus support")
> Cc: stable@vger.kernel.org
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Cc: Ma Ke <make24@iscas.ac.cn>
> Cc: Steev Klimaszewski <steev@kali.org>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>

Really straight-forward, so:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

Best regards,
Abel

