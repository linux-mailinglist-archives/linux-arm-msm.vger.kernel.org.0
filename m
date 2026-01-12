Return-Path: <linux-arm-msm+bounces-88454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A888D10DAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 08:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 365FD301141F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 07:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41423233F4;
	Mon, 12 Jan 2026 07:25:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F9E30CD82;
	Mon, 12 Jan 2026 07:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768202728; cv=none; b=jskadF4FN5mqmiGU/lP4sGQKwZkAnib8hUDJYjpQkmfViVwODdmAXlaoLnqfhUj/J4P4lCNCXFsrWIRudmVKKECG+upInk/J2Ml+FhiW3rMbBn0me6mb/OtqnimvhfUqP/C/m5uGAOfR+PspG4daMgbmp6d2ve1URkhdD2oS8y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768202728; c=relaxed/simple;
	bh=3uU/KFfJkQmxNruoEc44/HLlvg9x/AB+PZXxxr245us=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DNI0eKHssaMS4jQD7U8D/s+642OwRiqlXBX/IimsD1Kg1XNqUnKEzm2fzAMcyfPv8WYzJGJMWq6izdqK0yGDp0P8X8i8FspdNOdX4iz9Jbt6hx5HFTPFQzUkg4NJQnS+9OxJSgYKY1NvsBLfdwPtrH97cI0zWZnFl+dFTrHmNhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1768202707tc160a062
X-QQ-Originating-IP: oKEITeMqQL1Z+DxJ12O8HBGdk/32is1aGKFweU36mns=
Received: from [127.0.0.1] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 12 Jan 2026 15:25:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9765549277843554367
Message-ID: <2E7090A0C462255A+6658f83c-4e5b-4f49-a90b-54eecd61fcbf@radxa.com>
Date: Mon, 12 Jan 2026 15:25:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/msm/dpu: check mode against PINGPONG or DSC
 max width
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260112-max-mixer-width-v3-0-f98063ea21f5@oss.qualcomm.com>
 <20260112-max-mixer-width-v3-1-f98063ea21f5@oss.qualcomm.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <20260112-max-mixer-width-v3-1-f98063ea21f5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: N8Jy6PtD39R8tJpCsFuJsmU0q3dplmfIxR7njP/vNFNElgs4MYs4nn51
	tWqERqtZkkHDjf54gg/X4qu39JQCF+8n5sV85kQ5ODrY27uqQH6JL3bxUKWyAznXGDmOOLM
	pj1tNV+S7W5PATqXVJIo6fCp1e1iIP38Wva8gGhNQ5XZIMvV8dd3h4WmqzveMA3+FP2hEtR
	fZCD41nbkcEAlyEQo2KhfxZwQP+4lNuUfy1zewXyX0OWDHUhL9YF7FS8C4g8Djv0uiOvtM7
	ho14i3FG+4iIIvg796lLm8ULzw2w6AxGYP3bJwq30NHDjtEWQwsIeXmyp/HVx7dCcO09MY3
	kuZLCukk5PAYuUsRyzODBYB8UOSgoGimlZhJjIko+NCqU3x2Kq42HN8tX2iLAyOWPndYfLs
	5XG5grk6HsV5fgpeyislQCcX7hcJDXm4iH7T4fted6DCIcNqDz9U0ZR1FXhJEhWel8E3y4G
	Y/vmLKbh2hf/u+875vxTVkmjHBDUZYU8Tyl88vGDJjyAivLgnAqVIvm/PrenHY+8akv7uAa
	zF1qYM4ZRXAqkY0X3ezBakv/XZKTMWIdv3r0Lx5Cb7yY+IpZ6N9i4sA2DqzFfEcNsCQfPBd
	pkQdr2Cu20KEWUofJ7BQWUzvbUH9xA6mVE0F2wdG4DSoHdW0jPt0+4c+oXBNgr0EmCxIkUw
	ofACiqZ1KaFt/IKahS6enMYCjrbM4IW5tk6rjRJ+Q5BwRI/WDejw95NMfcJFJdeKhIPHXnd
	47WgmRn+fq5+DXReI95z80vIsvf7WQB98K+oL0yUWhemDKCsr/F/UBPLTxUwSSwxKhVg30Q
	7MHqq2vkc06w9+eCPkjbWv+i7Mf+6LdvwBljzftCeievqHzumTf+wy0vBdQ2/c1nYSl8bGj
	iMIC/xjSxMFtIBO0dL5+YmtJhIKWZlq+0pASQgXG6p8qOn8VJ5TiKSUDlPFlC/dRoSHH9NR
	t/iDrHSqBkd2vWd/JFRUfXXt8iunhkCnI39dUODSe8D5PGbC4KS8QAPqjr4Dgs7sPTgDrm2
	JF6VdlGfBh2yTQ6XvDCwKDQ83vr7nXCLGzplZ2Bg==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

On 1/12/2026 11:11 AM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> LM block doesn't have a hardware buffer (unlike PINGPONG and DSC
> encoders). As such, don't use ephemeral max_mixer_width and
> MAX_HDISPLAY_SPLIT to validate requested modes. Instead use PP and DSC
> buffer widths.
> 
> While on the DPU 8.x+ supports a max linewidth of 8960 for PINGPONG_0,
> there is some additional logic that needs to be added to the resource
> manager to specifically try and reserve PINGPONG_0 for modes that are
> greater than 5k.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Tested-by: Xilin Wu <sophon@radxa.com> # qcs6490-radxa-dragon-q6a
> [DB: reworked to drop catalog changes, updated commit message]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sorry for the late reply, my colleagues are still testing the new series 
on qcs6490.

However, this completely breaks 4K 120Hz display on SC8280XP CRD, which 
was previously functional (albeit with the clock check bypassed [1]). 
The display now shows a solid blue screen. Kernel logs indicate that 
only one layer mixer is being used, instead of the two that were used 
previously.

[1] 
https://lore.kernel.org/all/F4CDF36128041430+0d030e3b-054c-4910-a132-72273c541948@radxa.com/

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

