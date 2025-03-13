Return-Path: <linux-arm-msm+bounces-51209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49278A5E9A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 03:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F95C176AC4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 02:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0AD8381A3;
	Thu, 13 Mar 2025 02:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="K96VwPv+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9891EEC4;
	Thu, 13 Mar 2025 02:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741831890; cv=none; b=bbTK54SVYLDQPq387vWqmWs0w+y896UrxePm+Qru3UksFx1ZeobvbevhK/H0ZbvWJ25fijwOGKqvxFqC2MJ2tbBCy9qu7vkD3wgjlpl8FUNLO7Mk/2BdLDpJOn9VywK4nddTd3tK4ynVOe2NyTaufWJMd42nNCdOLom5YP7D3rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741831890; c=relaxed/simple;
	bh=FpC/vTuwIK5xIUgyQayYXS0BC2eQhbdB7objGTLAYV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uUYuNHWMuVahEmGD5zdx5DHanpfHt3h3cFcgwobAPaMHusEvCIYM+4Xcj2goCRG2HDU1WW5/kSv5i3b9N+Z68lZTt1z4lf63iu4R9PWO8aY/SUiuRRI6hRd31ATNhjoH6d/ALMDw5n1vmck4IOPct+fBddCFiaRquaWgCYZptoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=K96VwPv+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741831881;
	bh=FpC/vTuwIK5xIUgyQayYXS0BC2eQhbdB7objGTLAYV0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K96VwPv+aIwjbtzVY9PiUbxOZEX7YVvF3CNB/wJzqT34HrNwMBSIY6172lqADQjVk
	 xqGE8H7jqxTScepZPCRIBTlOI5eIVnZ55BOhvUHMMux8yRR2FSSlxtpg1Hnr4h1nHG
	 7rR+Fpdjnn7k3GVKPKhZ52mYWzfQiaXAHNlMjfrDrx9Lab6deu+lD980tlczpHtm+J
	 dBhB2uksMY+FsynP2gf+lom+DEzd6bsBwHZcGP9gCUrNLgqKYV2ZUaoxCYjmDRPsyF
	 MAThuelWlIXJzj6Z3OR1ZGvcbN4pH5xamSzylh6Ca/BK7fBiF63S1OR5/Bb01Xm5oq
	 YcxJQwdEchJVg==
Received: from [192.168.50.250] (unknown [171.76.87.92])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D09C17E1134;
	Thu, 13 Mar 2025 03:11:18 +0100 (CET)
Message-ID: <cc9501d1-c779-4728-a609-ce83a73f46f6@collabora.com>
Date: Thu, 13 Mar 2025 07:40:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/ci: add kms_cursor_legacy@torture-bo to apq8016
 flakes
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 lumag@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20241204-cursor_tor_skip-v2-1-f03bcbc4b455@quicinc.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <20241204-cursor_tor_skip-v2-1-f03bcbc4b455@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Abhinav,

On 05/12/24 01:29, Abhinav Kumar wrote:
>  From the jobs [1] and [2] of pipeline [3], its clear that
> kms_cursor_legacy@torture-bo is most certainly a flake and
> not a fail for apq8016. Mark the test accordingly to match the results.
> 
> [1] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67676481
> [2] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67677430
> [3]: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1322770
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> Changes in v2:
> - Fix the failure rate from 100 to 33 as thats the accurate one
> - Link to v1: https://lore.kernel.org/r/20241204-cursor_tor_skip-v1-1-f5f0bba5df7b@quicinc.com
> ---
>   drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
> new file mode 100644
> index 000000000000..2fb192c92559
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
> @@ -0,0 +1,5 @@
> +# Board Name: msm-apq8016-db410c
> +# Failure Rate: 33
> +# IGT Version: 1.28-ga73311079
> +# Linux Version: 6.12.0-rc2
> +kms_cursor_legacy@torture-bo

Reviewed-by: Vignesh Raman <vignesh.raman@collabora.com>

Regards,
Vignesh

> 
> ---
> base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
> change-id: 20241204-cursor_tor_skip-9d128dd62c4f
> 
> Best regards,


