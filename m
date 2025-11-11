Return-Path: <linux-arm-msm+bounces-81190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FBBC4C363
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 08:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 20C114F5288
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 07:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2912EBBB9;
	Tue, 11 Nov 2025 07:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7NyXXkq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7072D739F;
	Tue, 11 Nov 2025 07:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762847810; cv=none; b=bEVz1m9BmHpa/AVIFkXzFiypIOqX+CqvS1tz3HXZeEk9oXInHSyTIdqKfJ8GIQzymRnnJ1qHAd8cxQBrOMpnBUlKqxHj36dQuLzqjHesdQd7VxCOn5l95OV8kGedvXK48+Eqw0JCYhieDM9zcipflecehPSVZ+93dcJykHuzx9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762847810; c=relaxed/simple;
	bh=cqclq0xXJ8rVdClU7/Z+brn1juib8s0IgWUYtJIS6Kc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IyHbsWk3jgHqg/GMLwbQ+vQeZuw/27y4llE4ZCD+dOmC3fXpxDTfZwL9WpTR4/tJSxsDZQtfRaRBMSTo3uBiD8UMJ6oRedxSSUEvWhY8TFshWwxKhu+DqGSn2fVpxHbyPAXjGpLhDXsiNuN9sOtvCph6VXj2Ix2Stn6LhjM+gLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7NyXXkq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41481C4CEFB;
	Tue, 11 Nov 2025 07:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762847810;
	bh=cqclq0xXJ8rVdClU7/Z+brn1juib8s0IgWUYtJIS6Kc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=G7NyXXkq7pWsr2oPgLOMIsEss0RsFBN2pO/v5SjAHK/eXb0tcPlxIleH+KWCUfpj1
	 A8+KJWKS2TOxaHpXjEICknEEkDdN64B3sMQSpiy3/rB9Mwaf4zHxMuRXASvk8xgAM0
	 7pXHeHA4W7c7jrY5k9gwZhrHAg4pO1XjgLxCH/yMD4FH7ZdEWLfjD6T/sfsQ/rd+dA
	 blZYGk9Lwj/uoiFDwJOL59tquqzrYphyQFfGD1GiNRKlyh4emo6s9M93zklSvlzVIP
	 BWcAaodAhqD5wSgkhnd+8CnpLMHTJIHjk1ZolMWS77u0v6ZvHpbQ9oodwo55JbBO7u
	 9HAZmO8QBE7uw==
Message-ID: <9d73fc83-3f90-48d6-8996-bf5945368be8@kernel.org>
Date: Tue, 11 Nov 2025 08:56:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 1/5] media: uapi: videodev2: Add support for AV1
 stateful decoder
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
 <20251110-av1d_stateful_v3-v7-1-9913a15339ce@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20251110-av1d_stateful_v3-v7-1-9913a15339ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/2025 18:20, Deepa Guthyappa Madivalara wrote:
> Introduce a new pixel format, V4L2_PIX_FMT_AV1, to the
> Video4Linux2(V4L2) API. This format is intended for AV1
> bitstreams in stateful decoding/encoding workflows.
> The fourcc code 'AV10' is used to distinguish
> this format from the existing V4L2_PIX_FMT_AV1_FRAME,
> which is used for stateless AV1 decoder implementation.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
>  Documentation/userspace-api/media/v4l/pixfmt-compressed.rst | 8 ++++++++
>  include/uapi/linux/videodev2.h                              | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> index c7efb0465db6480fe35be8557728c196e0e530f4..235f955d3cd5cfc83b0d3d424e6625b14c07266c 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> @@ -275,6 +275,14 @@ Compressed Formats
>          of macroblocks to decode a full corresponding frame to the matching
>          capture buffer.
>  
> +    * .. _V4L2-PIX-FMT-AV1:
> +
> +      - ``V4L2_PIX_FMT_AV1``
> +      - 'AV01'
> +      - AV1 compressed video frame. This format is adapted for implementing AV1
> +        pipeline. The decoder implements stateful video decoder and expects one
> +        temporal unit per buffer in OBU stream format.
> +        The encoder generates one Temporal Unit per buffer.
>  .. raw:: latex
>  
>      \normalsize
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index becd08fdbddb857f8f2bf205d2164dc6e20e80b2..cf0b71bbe0f9d397e1e6c88433a0fc3ba11fb947 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -775,6 +775,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
>  #define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
>  #define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* AV1 parsed frame */
> +#define V4L2_PIX_FMT_AV1      v4l2_fourcc('A', 'V', '0', '1') /* AV1 */
>  #define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
>  #define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
>  #define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */
> 


