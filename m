Return-Path: <linux-arm-msm+bounces-80720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDE3C3F248
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 10:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 321C0188E342
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 09:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2412E974A;
	Fri,  7 Nov 2025 09:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKyqjzas"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDCB1EE033;
	Fri,  7 Nov 2025 09:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762507514; cv=none; b=DyMKA1ntD72wLpWOVQ5meC+6P5F60MqxyxXc8faeeaUDQGk9mR5eNotmlZtDl1/fCZik8k/DPspV8RtfBybySxzCGTPRG0M2FXef8iOI5VjMK6Iy1jrzxj6eEqQhfNURYI3stR2qFyhwlSFLs+apVtmXwwZMN3xW9+s5+2qRecc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762507514; c=relaxed/simple;
	bh=scaYGbcpSvCOTxoOLacgKmKJrxaRMjR19N/EXHpgqoM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=id8m47jX6RqIQx9oJ1/xl0syQqMuQlobvBndfIfLHuGwqTlSj52q3aTsvRhxNJcWhIeD7Jlz9YARo7uLpSkRsXdNLcbZWrf1O7mSCYYR5gDm+RBKzTEcQXpIwnO1GMtFNI6S661n9uYR23U9Xm9P5zGuuYXzGZe/boK7uSm4naE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKyqjzas; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE0CC19422;
	Fri,  7 Nov 2025 09:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762507513;
	bh=scaYGbcpSvCOTxoOLacgKmKJrxaRMjR19N/EXHpgqoM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=UKyqjzastWANIAVetO98aeyjpL7Zy67yOOE8DZ+3Ey+4ai5ZoOtBm07VHfoN8s4fO
	 EWmm72Zxuq1icPgwJizIMEZEkr91z//2+hJjjXHiEYbSNrB/8A2frsoZZkWz+2+vkL
	 5M7MKpS+QcRF8XLB5RbUxQoTcdLyUGki8D8ZMgR/58llYzKDxZ3cbSJIhJyAgE919c
	 7qeZR+VA42VxIVH5xjxaJUGiqZFyRWixWjW7u9bcWmMRJhCO8kXhZiXYCCZPHT/YJo
	 NlYc5CiOqg0fTqHLisBClJ6IfMrVMa+KgvYVoBjK6KS3KklOZdFT5Qep6a44V6hK8d
	 MG/HsF5F75Ylg==
Message-ID: <6198674a-2af0-4906-9ffe-bc10e68eb5c5@kernel.org>
Date: Fri, 7 Nov 2025 10:25:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4 1/5] media: uapi: videodev2: Add support for AV1
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
References: <20251103-av1d_stateful_v3-v4-0-33cc1eaa83f2@oss.qualcomm.com>
 <20251103-av1d_stateful_v3-v4-1-33cc1eaa83f2@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20251103-av1d_stateful_v3-v4-1-33cc1eaa83f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/11/2025 14:24, Deepa Guthyappa Madivalara wrote:
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
> ---
>  Documentation/userspace-api/media/v4l/pixfmt-compressed.rst | 8 ++++++++
>  include/uapi/linux/videodev2.h                              | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
> index c7efb0465db6480fe35be8557728c196e0e530f4..0c70410ffd4d58e0719d3cf13ad336c97b454ae9 100644
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
> +        Temporal Unit per buffer from OBU-stream or AnnexB.

OK, but the next patch says:

		case V4L2_PIX_FMT_AV1:		descr = "AV1 OBU stream"; break;

And Nicolas said here:

https://lore.kernel.org/linux-media/544147436308901fba85d6de48380c0c1eea7c67.camel@ndufresne.ca/

"Perhaps "AV1 OBU stream", so its clear its no Annex B ?"

So if this is just for OBU streams and not Annex B, then the description is wrong.

Since I'm no AV1 expert and have no idea what the difference between OBU and Annex B streams is,
I can only comment on what looks like an inconsistency.

Regards,

	Hans

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


