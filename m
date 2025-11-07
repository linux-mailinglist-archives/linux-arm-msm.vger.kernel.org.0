Return-Path: <linux-arm-msm+bounces-80721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3D2C3F257
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 10:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72BEC3B067A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 09:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50BB43009EE;
	Fri,  7 Nov 2025 09:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nrZR2l72"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EFA2FFDCC;
	Fri,  7 Nov 2025 09:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762507517; cv=none; b=R1cj3nDuHaGH1EXtRrzUbQSsb5j05cqk8HXXm+T81xeQHgVhgNrV5CAlHQXEA2VNgkkBihP4VbwBzmPNYWbYwEF688LP57oFxYvmRnzkddm1uvsL/Gd0mEB1oYzFpn0rTfcogupzZpsQbSz8xxReO+AIUMRk9jy2iQ6GFZxXYV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762507517; c=relaxed/simple;
	bh=tcPCB2yEkM2XmDWImXI5XyTWoD11UnAI1EYhECSXkEE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LSCHNQA4EKfZwEauyKklOEd5WMVZQxMYpmw5QXRm8v2YlobaMWVi1fLvsRL5L/jyrTCqyKk4TRdyMMPV3giD2SkiPWpaPg1KPOQXAaQbBVdD3E94M9KDNS1wXff5M1i8iDPPZUJOc/1OfVnZenyPr1+ZjhuMMZxA+aNELQ9/LWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nrZR2l72; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA49C113D0;
	Fri,  7 Nov 2025 09:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762507516;
	bh=tcPCB2yEkM2XmDWImXI5XyTWoD11UnAI1EYhECSXkEE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=nrZR2l7287WcvaYq6yQO4Jv8DXdxURFeeseNX6jUIgA/7dqvrcFb1CrDNPr1kc2Wi
	 EQvaMb51TCgFUNnFMrRE+PCq/5ezkSO9OEMC4dyqJLEnzA6QgWIzCnc+iha07xAmK1
	 N8cImuJfm0Hse/aDF71NKfhFFe8y/DD8m2ZTjruQjI0dfDCj3L+I7t+5stA+7dnQCs
	 OnrB+EB+C6Dgt60W3qx8NjNSNHP8QBuiJss1/ETi3uF90WzHq8acCM73Pgio/bqSHD
	 fRC15SBORzU1G9clIMv745CmL+E28kZXoYnuQMNR8TQLnibyCftXwfeofn2omU3GjV
	 r4AEVQMLcOK1w==
Message-ID: <43938312-ae0a-4a29-9fab-9cb3920b8335@kernel.org>
Date: Fri, 7 Nov 2025 10:25:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4 2/5] media: v4l2: Add description for V4L2_PIX_FMT_AV1
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
References: <20251103-av1d_stateful_v3-v4-0-33cc1eaa83f2@oss.qualcomm.com>
 <20251103-av1d_stateful_v3-v4-2-33cc1eaa83f2@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20251103-av1d_stateful_v3-v4-2-33cc1eaa83f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/11/2025 14:24, Deepa Guthyappa Madivalara wrote:
> Add a descriptive string for the AV1 pixel format to v4l_fill_fmtdesc(),
> enabling proper reporting of AV1 support via VIDIOC_ENUM_FMT.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 01cf52c3ea33e1a01e1b306036ba4e57ef5c95d0..bdfdf45c5de2f2ce885f219007718a54b5c86251 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1542,6 +1542,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
>  		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
>  		case V4L2_PIX_FMT_AV1_FRAME:	descr = "AV1 Frame"; break;
> +		case V4L2_PIX_FMT_AV1:		descr = "AV1 OBU stream"; break;

stream -> Stream

Regards,

	Hans

>  		case V4L2_PIX_FMT_MT2110T:	descr = "Mediatek 10bit Tile Mode"; break;
>  		case V4L2_PIX_FMT_MT2110R:	descr = "Mediatek 10bit Raster Mode"; break;
>  		case V4L2_PIX_FMT_HEXTILE:	descr = "Hextile Compressed Format"; break;
> 


