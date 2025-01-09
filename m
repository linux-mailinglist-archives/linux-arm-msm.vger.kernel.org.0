Return-Path: <linux-arm-msm+bounces-44557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D9CA075B1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ADC43A826A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 12:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0B6217653;
	Thu,  9 Jan 2025 12:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NgqNJud1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309A820551B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736425543; cv=none; b=WlHEYdGMEkX5dUW5neTigVpCyWMVCUDbozT+EO3HbyfwyxFeVRRQkVH6DHW9hsVnUsROWfImzCFA52HQdP10Dpzuko8aTDVL6gwFSNc+59utsEFx6RdkvYbe3kNtjhmhdDfRUBsc87SNNAoIhqhdJL44RIdQh8bau1bUPrnImCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736425543; c=relaxed/simple;
	bh=zQfhpNq9wPU8fqXdgDqG1NOlu2RWFAMrVY5RTV1u2LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zc1lVuBz14AM045Blv8Z3BOnmE7OlqrWYMuhbxnovBYNupS1VOZ48L/B120HpDIm39eRGrd5uRUkfaEr37YuVlou2Rsnz2AN8cyhMyUtYItpx7jibEJyjPpoaj/kWGWH47yugnQiklkMqbGMM15wcNt4d9UoEmy3uz4x1SIYfPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NgqNJud1; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so927095e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 04:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736425539; x=1737030339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EkA4eWtGqrX0Cp1veyrLZwVMj4rFGh39Oy2w043QSSA=;
        b=NgqNJud1TGc1Yd8/gZzCCLUtBBjs0NbNgCadgcRWVs2BwpbwwQEU9U0sEE/9u98YhX
         hH7G0mT/9paXZTa3rglMrg/iVpnEGcxiCbw6YausjDGkGJyVNst3yXoUyQwhRp5atvlO
         92PoIgcVKQhR/wwU9bwW5RCbkJKOZ0zHd36T0n4ux6POCVsNqK5me22iVb2TXVCDeN/K
         Wf4ScznFL4GtS0v+2K4sSV0nCnAnT4yg8bFe15ZAuIn5VBIQ2ymMOTxlSo6EH6Kn8X+N
         OV7a2woIEjaWrMOrPtjCaisavQPd81ERxCpbw3fP7WJDQHIMkNcjfje9XQZU5mJ/70cZ
         dfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736425539; x=1737030339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkA4eWtGqrX0Cp1veyrLZwVMj4rFGh39Oy2w043QSSA=;
        b=j6fQobTuJCoG6hMRdV3flgJ0zUIjsl6GkjeR5P8luX1KiEo2SuS+iGDeiJ6PehX0S5
         oDhQb0xmmSkouUMqnPU5V3pnXoFzjDpOrvPzILBkYWAI3I27xpj10MNdTBuYnYnwoYIv
         Q2CqCfkvDNieIBmUKyMVi2GRuz2bYer6B13BF8CVOnlZjqc2JdU/sK9/dmBCNJ11+RhT
         bolTx2afE0/E7X2Itm9/8JxkMQpFlLzUIZf3VoWVzy+hHQxavLTeadGDszGsLijkcnyQ
         12seholbHaZcmJ4xLXLF2qKYeQmhmhOt1llcLTgExnJ44LFzoqDnDdITB50pFEyp4S5R
         E5UQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/Lh8neSHoRjXhN/jNzo/xp4Jt4eneGBdshz5Ep9WHQckiI/hpJ41s2xPpMtyuQnkZpwVW25NxPQnAQdqt@vger.kernel.org
X-Gm-Message-State: AOJu0YzLZ1lvQyM1xD4MRhKwWGq6DFfMT+Lps8fkwRlWhkD0q9ZO8Rva
	X41zYmgXjsowadmaOgfOFLcnP1rv0W8nxW+n9RY0o7z57ZvbUlItwiNsDr9YLC4=
X-Gm-Gg: ASbGncuNOFiOR7uqUD/8vSO84V3mjRMKEJFfFEmXIBAqbeC/MbP+CfIsD2e6rio52Vw
	9L+1hFJepJGiG8vTYkPUiLmAPW8+wRcl5TJ+8fl2R0Uar6RgngAwsYmooZV9nWxiMFr4t+FEEkT
	F3MMX7py0ThwBaxXLDw7CYWFVLGF4h8AlYDrrKbF2Nz6leScjPzYeVPL5TiOS3udE/iEV8xxGN8
	KxaFzASKeqFR72LWtFinkUG8HXXLoxiK5m8oFmdQCg5rxqjVOaF7GYPwpl9kYZGkUuD20n+6sgw
	BpR98i7pxSWTJfa+8XqPLS0r6LV+Fe80/3xZ
X-Google-Smtp-Source: AGHT+IHsNzccMcvdbHRkfYVmMDoqOyv7369RiZHtzafxhM8zI+VwKIqquVfPQdEv+gF1X2+8XlTl3g==
X-Received: by 2002:a05:6512:b0f:b0:540:3566:985c with SMTP id 2adb3069b0e04-542845d1495mr1782471e87.26.1736425539185;
        Thu, 09 Jan 2025 04:25:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea68e9sm180648e87.157.2025.01.09.04.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 04:25:37 -0800 (PST)
Date: Thu, 9 Jan 2025 14:25:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
	stable <stable@kernel.org>
Subject: Re: [PATCH v1 1/2] misc: fastrpc: Fix registered buffer page address
Message-ID: <q4h6myikxgg226kbalquvoiveez2cpipopod5rt45d37f46fev@v5ir6c5eg343>
References: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
 <20241218102429.2026460-2-quic_ekangupt@quicinc.com>
 <rhy3yvsnhdud45mesempnwyv5faxfkbj2ba76k6dbm7krwl77y@mnpi5jzykjg3>
 <ed96e4b5-a0a0-4c0e-b2ef-e06ea9d3718a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed96e4b5-a0a0-4c0e-b2ef-e06ea9d3718a@quicinc.com>

On Thu, Jan 09, 2025 at 11:09:30AM +0530, Ekansh Gupta wrote:
> 
> 
> 
> On 12/18/2024 4:42 PM, Dmitry Baryshkov wrote:
> > On Wed, Dec 18, 2024 at 03:54:28PM +0530, Ekansh Gupta wrote:
> >> For registered  buffers, fastrpc driver sends the buffer information
> >> to remote subsystem. There is a problem with current implementation
> >> where the page address is being sent with an offset leading to
> >> improper buffer address on DSP. This is leads to functional failures
> >> as DSP expects base address in page information and extracts offset
> >> information from remote arguments. Mask the offset and pass the base
> >> page address to DSP.
> >>
> >> Fixes: 80f3afd72bd4 ("misc: fastrpc: consider address offset before sending to DSP")
> > This was committed in 2019. Are you saying that the driver has been
> > broken since that time? If so, what is the impact? Because I've
> > definitely been running fastrpc workload after that moment.
> >
> > Also, is there any reason for neglecting checkpatch warning?
> Hi Dmitry,
> 
> This issue is observed is a corner case when some buffer which is registered with fastrpc
> framework is passed with some offset by user and then the DSP implementation tried to
> read the data. As DSP expects base address and takes care of offsetting with remote
> arguments, passing an offsetted address will result in some unexpected data read in DSP.
> 
> All generic usecases usually pass the buffer as it is hence is problem is not usually observed. If
> someone tries to pass offsetted buffer and then tries to compare data at HLOS and DSP end,
> then the ambiguity will be observed.

Ok. Thanks for the explanation. Please consider moving relevant bits to
the commit message.

Also this brings up a topic that we have discussed several times: what
is the progress on a testsuite for the API?

Last, but not least, does this issue result in a possible access to
unrelated memory areas? Can it be exploited somehow?

> 
> Apologies for delay in response as I was traveling with very limited internet access.
> 
> --ekansh
> >
> >> Cc: stable <stable@kernel.org>
> >> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >> index 48d08eeb2d20..cfa1546c9e3f 100644
> >> --- a/drivers/misc/fastrpc.c
> >> +++ b/drivers/misc/fastrpc.c
> >> @@ -992,7 +992,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
> >>  			mmap_read_lock(current->mm);
> >>  			vma = find_vma(current->mm, ctx->args[i].ptr);
> >>  			if (vma)
> >> -				pages[i].addr += ctx->args[i].ptr -
> >> +				pages[i].addr += (ctx->args[i].ptr & PAGE_MASK) -
> >>  						 vma->vm_start;

Shouldn't it be other way around:

	pages[i].addr += (ctx->args[i].ptr - vma->vm_start) & PAGE_MASK;


Also, can offset be larger than a page size?

> >>  			mmap_read_unlock(current->mm);
> >>  
> >> -- 
> >> 2.34.1
> >>
> 

-- 
With best wishes
Dmitry

