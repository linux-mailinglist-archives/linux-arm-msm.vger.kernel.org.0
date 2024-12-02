Return-Path: <linux-arm-msm+bounces-39876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C749E028B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 13:54:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0E80B25C36
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 12:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCFFE1FDE37;
	Mon,  2 Dec 2024 12:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PfWLYAW2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC1FA95C
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 12:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733143584; cv=none; b=rX2TW33SPh6tj6te8e1SYlnYcJhTsHoYEosV15vJy2KRbAWsbBTP3WgqoR4AT3Hi5eblRaAoctX5WA/6Y3MuRYnQse9PKRs5LjD0BEuuENrksVidpUxu6M2URt3zsMHuYuuXgZ22JhSdvpEDoVbTYvXrVS1Rav5NabHKwYNsgyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733143584; c=relaxed/simple;
	bh=jqgR+4SGsaX1gjLd5dJCGTNd2Jj27S6AIu1QaYeb4gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bI3Z71hRDY5pUsyhshGBB2SmfcPh0mC21+EUgxQ5RZJE4z5uZ53z9F/ypaj0woE9iymqThAj4rQwrCS7rUz+6EBocFljVFToG+NtXDOjgv/g1Uo+zBMZGEjAgxthnxD/V5sFQHmh13uWCf08EMMeG3PBc73XIKLMN+EWTNdGNjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PfWLYAW2; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53dd0cb9ce3so3692501e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 04:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733143581; x=1733748381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GaYCukmgMxDA5taJqCLpictvWOWvPCBn33S0g48RWIg=;
        b=PfWLYAW2dHQn5WfXcgapFYUBgCHeM1Kpa77caKP8MgkzK/POHzRXxLnJJ8te3ol+Xf
         e9snKi45Zzw1J/TdCMCmKM0RUbwD8TYM/rWF/HakcK09FcqrTEJEX7G6f3kEOQUcXWxr
         QQOPV3HI31jb3dr7cuGvtGgxeuu2qaLPWsRsQxevHn/lMtYQvE15P0Wo0AoEIiJzcuak
         MwQ/hJREMRAWal8NypYSM8XCDO/QlgpXS4UGtl4yglkMOSNYUhv9MomPkd2TRXue3dg9
         uS3IjvGJseTndJzj2X+PHSgOO5eD0UULspJVoieQlQL9OdDgKB/n1PqcsbFw71EVx/ju
         j5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733143581; x=1733748381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaYCukmgMxDA5taJqCLpictvWOWvPCBn33S0g48RWIg=;
        b=kXMirsukVN0YW6HhPM2HHOVKMCLEUVQu9XqfyAvAifa/Nyw2js8LVqUH8HURlXw/b/
         5+ATAWWvSbeSSh3fpodsb95+7DBW00k67cRzVj4INMPGGclyTRklJJKA51xaHT83Meya
         0G2UhZxIv1OaiuYG+H9fCStvjdDc0oso1F7ONLGzJp7FFGHImQbkG93zQKdnQntQI4ue
         dyFoL5+4SxZLtqsBvybKq22Zx8iC3xrU/yUp68afS7CeA2dX4/xHuauvfEzXEyFV/OOu
         KPR/iQfr+wSajasSqmkZJImWexLeJo5bTqf/4LG8kKxI937N2tmKQOj82uTppSBjtg4l
         jBgg==
X-Forwarded-Encrypted: i=1; AJvYcCVn3dCeZ8568eKOuFC/8QHdlUvLXf9+GR4hy56+ixm0fkpzB8k6JYzw/RTCW4rKuOAHDGcX8HHVywg3UZY+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4VHNdrwv6/EZPYY+g/pYeGzkkU5In4NZ12x657Z/jE6qwY8g1
	DBG6kJz2JgHhPrNsIHuxRVwvAG6dbm4V79F+H30ziQ4O8jk8rREdChMzMyIUuRhQ9+TblXHLtum
	4
X-Gm-Gg: ASbGncu/0k7PTY/RRCUbDZskPYxzt50NhiVZLre05Na8n2Hv8b+PmqA3w3/RUA96kpQ
	w6ESyC7RCa1u5y3EVL3CH0+gnhX+tCKGB+mWy176QkQcLrctRYeO4Y+z1GtCspyPXe0sjK8c+rT
	OcDcLG1r3OHYSyB8iwToUtFYEE/tnfMp6BBITd/wifRgvdvIT/ZTfwU9ZZudGWfCJBh7GCgoKXR
	i+MjP4EUZviPEl/PXxGqY+GcAKkLX4kPVeaiT3bIHkjF+vHPUDjFWh8kxGMJ1sbQGU5jq4h5Z46
	jvf6pZ7qRnvcuA21FLbSnm6a3jR/jQ==
X-Google-Smtp-Source: AGHT+IE1voE10D3iwYWwwQY3sK3Nf80iiVJk54y47WLDhdouHdUsNe2wedZKcAAFSKP/Pfj0eKxIFg==
X-Received: by 2002:a05:6512:b8d:b0:53d:dd02:7cc5 with SMTP id 2adb3069b0e04-53df00c6440mr7027271e87.7.1733143580677;
        Mon, 02 Dec 2024 04:46:20 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f257sm1429639e87.122.2024.12.02.04.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 04:46:19 -0800 (PST)
Date: Mon, 2 Dec 2024 14:46:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, 
	"Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, "quic_zhgao@quicinc.co" <quic_zhgao@quicinc.com>, 
	linux-arm-msm@vger.kernel.org
Subject: Re: add venus firmware file for qcs615
Message-ID: <magmzevx4cisi5s2ytdtzsqr6klrt6wot6cex3zpxugjspdwyt@qpooycw4b2bs>
References: <ng4o7sdejoh4jn4nnarjd4lio4lbx2tiuiz5c6bigjbtxldinr@xl5wx6dmdivy>
 <ab4f83c1-5cd6-a80b-fd85-ccc337c8f301@quicinc.com>
 <pqoq64hk2jedmqta5fs4ktcadw4getwkgz324vtrzzotcurpaw@zc6dlhbqtsnz>
 <a1bbc1d0-d3bd-e44e-e393-a7ade909a506@quicinc.com>
 <CAA8EJpoDXKbF5cqb_vzE28zjdC6OC66Zxb5j030QXaCe+FUmfw@mail.gmail.com>
 <egdqhgdiqqny57yiauiyekcvhxvebfttyncqoazslzjprwvakz@txvy7wn4vg7g>
 <a259c98c-6c77-1c1e-e428-41c2550f7517@quicinc.com>
 <pukoimsqhck5oymirmgiwad6s3l6frt7xbahp7juhvj3rt4622@wpajx6vyw5nl>
 <rukxa3h72trvqvu6wkxmkp33entybcvxfjlpcjh7odipwds6lq@rt6ferue5nbr>
 <5170f77f-c5d3-02f1-8deb-5d00fef7627a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5170f77f-c5d3-02f1-8deb-5d00fef7627a@quicinc.com>

On Mon, Dec 02, 2024 at 05:30:55PM +0530, Vikash Garodia wrote:
> Hi Dmitry,
> 
> On 11/29/2024 8:05 PM, Dmitry Baryshkov wrote:
> > On Wed, Nov 20, 2024 at 01:22:50PM +0200, Dmitry Baryshkov wrote:
> >> On Wed, Nov 20, 2024 at 04:40:51PM +0530, Vikash Garodia wrote:
> >>>
> >>> On 11/20/2024 4:09 PM, Dmitry Baryshkov wrote:
> >>>> On Thu, Nov 14, 2024 at 01:31:14PM +0200, Dmitry Baryshkov wrote:
> >>>>> On Thu, 14 Nov 2024 at 13:05, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 11/14/2024 4:16 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Thu, Nov 14, 2024 at 09:06:55AM +0530, Vikash Garodia wrote:
> >>>>>>>>
> >>>>>>>> On 11/13/2024 8:10 PM, Dmitry Baryshkov wrote:
> >>>>>>>>> On Wed, Nov 13, 2024 at 10:50:44AM +0000, Renjiang Han (QUIC) wrote:
> >>>>>>>>>> Hello
> >>>>>>>>>>
> >>>>>>>>>> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
> >>>>>>>>>>
> >>>>>>>>>>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> >>>>>>>>>>
> >>>>>>>>>> are available in the Git repository at:
> >>>>>>>>>>
> >>>>>>>>>>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git<mailto:git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git> video-firmware-qcs615
> >>>>>>>>>>
> >>>>>>>>>> for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:
> >>>>>>>>>>
> >>>>>>>>>>   qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 +0530)
> >>>>>>>>>>
> >>>>>>>>>> ----------------------------------------------------------------
> >>>>>>>>>> Renjiang Han (1):
> >>>>>>>>>>       qcom: venus-5.4: add venus firmware file for qcs615
> >>>>>>>>>>
> >>>>>>>>>> WHENCE                      |   1 +
> >>>>>>>>>
> >>>>>>>>> Could you please be more specific, what is the difference between the
> >>>>>>>>> existing file and a new file? According to the soc_vers the new file
> >>>>>>>>> supports sdm845. Should it instead replace the old firmware?
> >>>>>>>> SDM845, SC7180, qcs615 can be enabled on same firmware ideally, but due to a
> >>>>>>>> different signing for qcs615, it takes a separate bin (xxx_s6.mbn).
> >>>>>>>
> >>>>>>> Can SDM845 handle v6 signatures? It supports v5 and PSS. Or can QCS615
> >>>>>>> use v5 signatures?
> >>>>>> Infact we started with loading sc7180 firmware on qc615, video init failed. So
> >>>>>> far i have seen 2 categories in signing version for video bins, either default
> >>>>>> or v6 specific tool.
> >>>>>
> >>>>> Can firmware / security engineers actually advice us on using v5
> >>>>> firmware signatures with QCS615 _and_ with older platforms?
> >>>>> Existing venus-5.4/venus.mbn uses v3
> >>>>
> >>>> Vikash, any updates on this topic? Would it be possible to have a single
> >>>> FW image with just v5 signatures?
> >>> Not yet Dmitry. Having a followup with relevant folks this friday to understand
> >>> the signing requirements across different SOCs, hopefully will be able to add
> >>> something on this by then.
> > 
> > It's been more than a week since the last email. Are there any updates?
> > I'd really like to get this sorted out before next linux-firmware
> > release, otherwise we'll be stuck with these names for the foreseeable
> > future.
> I have been chasing both the firmware and security folks to align on this. So
> far the updates are that one is signed MBNv5 and other with MBNV6, hence leading

I think the existing firmware uses v3, not v5.

00001000  00 00 00 00 03 00 00 00  00 00 00 00 28 00 a0 0f  |............(...|


> to different set of binaries. These MBN versions of signing is defined at SOC
> level and depends on secure boot libraries used in that SOC.
> At the same time, there is an experiment to check if SC7180 can be signed with
> version used for QCS615 i.e MBNV6.

Thanks! Are you trying that without updating the whole bootloader stack? I
think some of SC7180 devices might be EOL'd, so it might be hard to get
FW/bootloader updates.

> One query here - given that qcs615 only loads the venus_s6.mbn variant, and it
> is not enabled yet (patches in review) for video, we should be good if we
> conclude the firmware part before accepting the qcs615 enablement patches ?

Good question. I think that depends on linux-firmware maintainer's
opinion.

-- 
With best wishes
Dmitry

