Return-Path: <linux-arm-msm+bounces-85538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5357CC86B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D9F730AEB98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 15:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F6E355807;
	Wed, 17 Dec 2025 15:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Pb+qA2WW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4523557EE
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765983946; cv=none; b=FDszurU/TUdr61zUJs3bA9gVOEHbfPNXJaLQHUDpqaHCUBFa980VeHZlubgPrR9Zd48YlOW+N2A7x81vTSLeAZFp524gVevfOOLjXGbqURw1k5BA0hzhA6aqOjMmHZ1DRwK9renmOM28jOQe2CCeMv0gYzpLQFJpUDqkaQurdCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765983946; c=relaxed/simple;
	bh=eI8YbOyM9z/WkaNgK625OiENoKA/xykWTcIx4vrdBLo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EMvo//1j2xZdlM0nEehp6del8nk711UNE4sxKHY3Xm7rsOZ5KUYTLRu8Kybn/h6W7Q7PzxyUsEs2MmgqK/pM3GqVyLtFxtWZ9dA+7LL8fsTT5eln4PmaGylU4o7pvV9U9vIPElzQ/GiW6QO091BhsqSHcojbOZD/0GhWxi84tcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Pb+qA2WW; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Message-ID: <8e1d33ff-d902-4ae9-9162-e00d17a5e6d1@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1765983941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BU61uOE5rQFMg5G4aoZO7QP4QinbxTTLs0nJykuT8sQ=;
	b=Pb+qA2WWptWdsEksD+2nkZcRJvnq0032Qdw/x8F8Yh/Ryo31ap3ucPFTAXwfwceB3yQcR0
	H+FUbJ8YO+GXJj83trUH7u8d2IaeBJyLBaSz+Ji295q83uCKcJVQtzPZUbMc5wiAOrPWWP
	9mZdS3ecncoc7ujqlP8rHzTEH8xF6bfij661GCT4gcW+6Pc8qefkXHfHQKnimrPZtxdyJo
	XP6g9kyDP2xo5C5slSaVJQ8dcqxn1C4Oo86R14hLKria24kjsMRtWGKg5SPpVUfhh3tqO1
	gCCAwB97pxiFjxqPYk/EPFiJQeEiWg4D75Vzqw/wLhHqpKCy97kSqX1AtXFjww==
Date: Wed, 17 Dec 2025 18:05:31 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: Re: [PATCH] drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Sajna <sajattack@postmarketos.org>, barnabas.czeman@mainlining.org
References: <20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 11.12.2025 04:25, Dmitry Baryshkov wrote:
> Currently MDP5 3.x (MSM8998, SDM630 and SDM660) platforms are support
> by both DPU and MDP5 drivers. Support for them in the DPU driver is
> mature enough, so it's no longer sensible to keep them enabled in the
> MDP5 driver. Not to mention that MSM8998 never used an MDP5 compatible
> string. Drop support for the MDP5 3.x genration inside the MDP5
> driver and migrate those to the DPU driver only.
> 
> Note: this will break if one uses the DT generated before v6.3 as they
> had only the generic, "qcom,mdp5" compatible string for SDM630 and
> SDM660. However granted that we had two LTS releases inbetween I don't
> think it is an issue.
> 

I've retested DPU driver on our downstream release based on 6.18 (by
using msm.prefer_mdp5=false kernel cmdline parameter) on all devices
at my disposal, and I can confirm DPU driver working fine an all SDM660, 
SDM636 ones, but not on SDM630. Some logs from sdm630-sony-nile-pioneer
(Sony Xperia XA2):

[    2.356546] msm_dpu c901000.display-controller: bound c994000.dsi 
(ops dsi_ops [msm])
[    2.357328] adreno 5000000.gpu: GPU speedbin fuse 146 (0x92), mapped 
to opp-supp-hw 0x4
[    2.364802] msm_dpu c901000.display-controller: bound 5000000.gpu 
(ops a3xx_ops [msm])
[    2.444649] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x30030000
[    2.449793] [drm] Initialized msm 1.13.0 for 
c901000.display-controller on minor 1
...
[    2.911900] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu 
error]enc33 intf1 ctl start interrupt wait failed
[    2.911916] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait 
for commit done returned -22
...
[    3.176171] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu 
error]enc33 intf1 ctl start interrupt wait failed
[    3.176367] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait 
for commit done returned -22

Which results in horrendous ~3-5 fps in shell.

The block "enc33 intf1 ctl start interrupt wait failed" + "wait for
commit done returned -22" is repeated few times per second whenever
the display is turned on, and stops when it's turned off.

Meanwhile it is working fine using MDP5 driver (msm.prefer_mdp5=true).
Well, as fine as possible considering [1], using several FD_MESA_DEBUG
tricks to work around GPU issues.

P.S. I have not yet tested MSM8998, but I can try if required

[1] https://gitlab.freedesktop.org/mesa/mesa/-/issues/8442

--
Regards,
Alexey Minnekhanov

