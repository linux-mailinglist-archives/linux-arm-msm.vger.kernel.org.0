Return-Path: <linux-arm-msm+bounces-65336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69050B082D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A7387A808B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 02:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD1319F421;
	Thu, 17 Jul 2025 02:21:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB7C2904;
	Thu, 17 Jul 2025 02:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752718888; cv=none; b=VueTrlcYLR2t1a4sHspxIYyGOxpcVdbhLfUHHMVNkpnQu+FnoJ0c1cS1x7OjhMpaUtDitrIY7abLUjFwRPtNt3dnElYKqMFA+P/Tu1oOHvIAM+XOede3lNLzyQoKbuGGEIxA/L9PSDUZsdK8qSdUTIlUfeg8JqOBZqff495Od8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752718888; c=relaxed/simple;
	bh=BXBFahkK39BOEpvY5tmFn9l1LNKikZ5S4KKO3mi3tAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jyDN7sb4IXOMd3/+uhDfMOOGV/9JzVTMZfJmko81Z6plX0FNkx7bO6zh/WqQ+fkx0QaHyXlB0uHuA1wopsAhbb/wkiu2pMy5hAN5nnE8xd5ddRkrXbtEtsB3WaPMrmRmj5SZ4FiDLs8wFZuIyaE8cj01xH9cp9IVlAQW0TqPuK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz7t1752718861t8873202c
X-QQ-Originating-IP: Zl/o0y9rYQVp35UT5ekeseH22v+Sdn/qwiqeQJnkDl0=
Received: from [127.0.0.1] ( [119.98.96.24])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 17 Jul 2025 10:20:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3465737500828252999
Message-ID: <A9DB4AE061FD8BB9+3519a519-1a29-49c1-a07d-28a0577677cc@radxa.com>
Date: Thu, 17 Jul 2025 10:21:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
To: Dale Whinham <daleyo@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250714173554.14223-1-daleyo@gmail.com>
 <20250714173554.14223-7-daleyo@gmail.com>
From: Xilin Wu <sophon@radxa.com>
Content-Language: en-US
In-Reply-To: <20250714173554.14223-7-daleyo@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: M8Zk4Li7PoFid/VxHKjo5b8QKkzFdNQQuHP1KAflGhYlWPxpwZEx9S8o
	6ZckWVnLd7CnHqzGLZDcIThHfIKESj1IzieJBeXmbsFZlRI47qTPY9CPjfTaELz00kPtNSR
	IuXemccbSOu6+dt0wdp0zsF2IuGpp5+Q795NFbLsPOZvSCQhJAbN6i4khFbv+P4aPkFKn1l
	p7DIRtXYswapOzfG8s6R9PkmVGixGvWV60scONWPClLHXmtAWHxNW8zs4MiH3TEUh+TUn3T
	foYgkAdJvOKIXb5/jPVhauIbx2ezevWHb+o9gBCzA6c5dTvDV+gmFvMgRNnG8WQ1zkQOp08
	Qdt32gBADTGWCJiF43s6Es4Wyt/47F5ZTwiVTnyguzpGFq3si/zkMCJvBQpRJ4SjgVBdo1v
	MxnbYlOKl4YnUcvOzzNORXtUmrfakIM7rbnMFSlvVaN4KoJGTQ4gbdfgGMf08borXrA36QH
	AXA53yn5KDwI30ULFhb2dKuNbJKt/P0j/H+qv+Zl3hncxQkfC+OIv+Q/g4yrsffYESgQR0Y
	OyWcOk8aZyr9z3TD2VGA0UA9JAmAv4T2kk/LyB2PDihYg6qnsyZM8ARWaHkk3iwa+l1Ml+u
	TcYeHhCE7huLzVnDCgWMqqxSLBJeZ7wXYisTiZkdGfqPAvbh5Q8Iy3aXt6oA4hthZ5CCvqZ
	ogIgn3SJj1zgIPZ5EHGuGkUPApTAIwXNEZ9E9Mqv8Ul8KzWLiG52LIXjViQ00dZeD3Iudvw
	Lr3t1QAWkPS4+Zv7FBZxz+7dCoJG1HoKESNg5FmfQF3oM6PSsWk5/brJt7RDGmy1wmXusAk
	nMyyFmzLxj1KNoLlqxK3he6Vf72wB5V9xjOIIfBG2oxTMUYuLXYEER7xYOR7jouiz8MrlKd
	o9ZIku2FiYPPHCXD44bP4USWZGljotkTQ1PTJykGE7+ytX/TZ9npLrBBGHzVvTrSVDirkRA
	oYWTRuL6PkXIpXdO/VvsaBlnFXYxI03UnCSOJcW/jPD7/P29+NEc/odyqN0UwhailnVZWMX
	yUH+XekAhgg0sKDd5qZVjuZ6+G613b2NUpgGXE4Q==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

On 2025/7/15 01:35:42, Dale Whinham wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> The OLED display in the Surface Pro 11 reports a maximum link rate of
> zero in its DPCD, causing it to fail to probe correctly.
> 
> The Surface Pro 11's DSDT table contains some XML with an
> "EDPOverrideDPCDCaps" block that defines the max link rate as 0x1E
> (8.1Gbps/HBR3).
> 
> Add a quirk to conditionally override the max link rate if its value
> is zero specifically for this model.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 4e8ab75c771b..b2e65b987c05 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -11,6 +11,8 @@
>   #include <drm/drm_of.h>
>   #include <drm/drm_print.h>
>   
> +#include <linux/dmi.h>
> +
>   #define DP_MAX_NUM_DP_LANES	4
>   #define DP_LINK_RATE_HBR2	540000 /* kbytes */
>   
> @@ -58,6 +60,17 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
>   	if (rc)
>   		return rc;
>   
> +	/*
> +	 * for some reason the ATNA30DW01-1 OLED panel in the Surface Pro 11
> +	 * reports a max link rate of 0 in the DPCD. Fix it to match the
> +	 * EDPOverrideDPCDCaps string found in the ACPI DSDT
> +	 */
> +	if (dpcd[DP_MAX_LINK_RATE] == 0 &&
> +	    dmi_match(DMI_SYS_VENDOR, "Microsoft Corporation") &&
> +	    dmi_match(DMI_PRODUCT_NAME, "Microsoft Surface Pro, 11th Edition")) {
> +		dpcd[1] = DP_LINK_BW_8_1;
> +	}
> +

My Galaxy Book4 Edge with the ATNA60CL07-0 panel also reports a max link 
rate of 0. But I think eDP v1.4 panels need a different way to retrieve 
supported links rates, which could be found in the amdgpu [1], i915 [2] 
and nouveau [3] drivers.

[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c#n2098
[2]: 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/i915/display/intel_dp.c#n4281
[3]: 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/nouveau/nouveau_dp.c#n101


>   	msm_dp_panel->vsc_sdp_supported = drm_dp_vsc_sdp_supported(panel->aux, dpcd);
>   	link_info = &msm_dp_panel->link_info;
>   	link_info->revision = dpcd[DP_DPCD_REV];


-- 
Best regards,
Xilin Wu <sophon@radxa.com>

