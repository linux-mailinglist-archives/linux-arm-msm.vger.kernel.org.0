Return-Path: <linux-arm-msm+bounces-81191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE78C4C369
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 08:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BB1184F63BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 07:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C042D5930;
	Tue, 11 Nov 2025 07:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y2onh8ww"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0B6254AE4;
	Tue, 11 Nov 2025 07:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762847817; cv=none; b=VqG417G7X4UUnagwUih1nhVC8AnGNpjwcHJxPa4YWLztEDziXbfHudvju1g7nCFY4geqFBvJOyBAfIZn5li8jILdrjF5qNRLnS7g8CtIUkI14zN6vf1zVEbmL2t6G3knQKGdmHDBTTI5Nj1P7VRvK0DkFkwXitu+LWctI0tlRmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762847817; c=relaxed/simple;
	bh=zIuzwhgE3i3d4MvsNcCYUTXJrHXGdj+Nw0s4bWBPang=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FNsFRrTbgvEail5kcQXxICK35aM8080DIcvDOMs+jvBIaJezLv3aMjAIeoy9Qge27cgu+gYUXAW/Oxjop0aZ2K4pVeUJvHD5DjyGB5C7w2osMAdpwwMEWRqW4tw4AwaApWvAcomCW78JwWeoHdizPRvDM3Easthb/ZU1cfBS0PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y2onh8ww; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41967C116D0;
	Tue, 11 Nov 2025 07:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762847817;
	bh=zIuzwhgE3i3d4MvsNcCYUTXJrHXGdj+Nw0s4bWBPang=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Y2onh8wwFfq09EdkPDxh6zgUPVmjcnPEZJGuIQ+nxbZ4jRFzKYGTt9rAsO7k/rPmi
	 yI6uL02Xw/m4On6DCbUg3mqHQ3+GWdlW8dHvVUtBbUSiGCpS13fLNDmZPivf6YakTb
	 PvNVESbEy1jmQe3U93C7dWyFk7d7DLX/Q/quvKg9a8rj9K+PTGv6rKs7dfi+26oYsf
	 Yluey6HM0HzFFril+H//7A9hTbinQcj1fHLp/qGk68o+AfcxvkzM6jdzssGIfn7nl2
	 k2lPzt+pXfhldMfH9tRtS3hVr70oKHno5bzJvGlUhBeJIX/UamMnWrvsQgXQ/x/CPW
	 H3rYdJz0r39jA==
Message-ID: <ac16f71a-4840-4d9f-b34a-fd0a1b9f2075@kernel.org>
Date: Tue, 11 Nov 2025 08:56:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1
 in v4l_fill_fmtdesc()
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20251110-av1d_stateful_v3-v7-0-9913a15339ce@oss.qualcomm.com>
 <20251110-av1d_stateful_v3-v7-2-9913a15339ce@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20251110-av1d_stateful_v3-v7-2-9913a15339ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/2025 18:20, Deepa Guthyappa Madivalara wrote:
> Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
> enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 01cf52c3ea33e1a01e1b306036ba4e57ef5c95d0..4f4f341c26b0795831dc20941a4cecc223af7746 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1542,6 +1542,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
>  		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
>  		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
> +		case V4L2_PIX_FMT_AV1:		descr = "AV1 OBU Stream"; break;
>  		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
>  		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
>  		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;
> 


