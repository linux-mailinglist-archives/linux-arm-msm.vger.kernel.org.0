Return-Path: <linux-arm-msm+bounces-81567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9DEC56A2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 053773497E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 09:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84507331A73;
	Thu, 13 Nov 2025 09:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b4yChBe0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561443314D7;
	Thu, 13 Nov 2025 09:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763026556; cv=none; b=i1ArJ+LiGxXvEjzcvDWeX1mdTHUssepRAo2/+Ht5RnBn0HDSKhIKq22XkAhMsPVuNa4l04d0fsqOgU9E3ps55MrSjIRCCBEEHpnyI7MpQrjzIcK21szzP21kTLuaocTA/gOwWr7TQffzasCz0KDjBLHUKW7282+IXVOrCK3pa48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763026556; c=relaxed/simple;
	bh=6fX45CUIg9TnHGo/8WP59O5cVc8DmjNzpk+lpUzxxEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jj0pVQij5OeXEEXa8M9D9bj+o0L5Fw3IYB6CsTKGyQBTqr0GSx/rQQDGvpmjyM55lu3nFvKAUgzv7y+/GmzCjPM10/X0VRmLOwq+XCzDvtM5b+e9RqKGug8/2SvjeGYLGE4h3I3lOhRtTqcPPQ9Kemcgem1m0pMrC8lkZ6E6r9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b4yChBe0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CFB4C4CEF5;
	Thu, 13 Nov 2025 09:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763026555;
	bh=6fX45CUIg9TnHGo/8WP59O5cVc8DmjNzpk+lpUzxxEg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b4yChBe0H12rfqNAwuRUHuQfjjVtVjaYxg/u25JrFirFI18q0+xrADCCMBQvagrpZ
	 Kq98eKYTa17/RrY+TOQttzR/mBClBggB0LjJj0NtwsdHFvYKMNPAyXeD1/fhMXKLzT
	 SmBfb/KQmMMz846FPx8fuT1SePpzGv6nafCihMs2bKITcZY8Zi3vWh48Nbq4aakkd6
	 McT7xd1F9LL+OgSnRJBjr3oexki/0gVLvL9WFDRUJkJ5D5faB4M0wmmfY1WnutG6pz
	 Nui0O6CX/PuNMYARWSQ+h/gSHkOwJiVymRtCb4MNVZCAtkkDsULK/i7qcKNC8vHupe
	 xsX1u71F7M3Ug==
Message-ID: <2b412062-8882-4007-ae57-4446ba85cbb2@kernel.org>
Date: Thu, 13 Nov 2025 09:35:51 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] media: qcom: iris: Improve format alignment for
 encoder
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 quic_qiweil@quicinc.com, quic_renjiang@quicinc.com
References: <20251110-iris_encoder_enhancements-v5-0-1dbb19968bd5@oss.qualcomm.com>
 <5SeXfUkXV8MzQx-7AXJq1nL4iuMrdaMQTb6UZjcGZgzuqRXrn4kIbYl1BopLdjacLg03Bse8ZBy67r_1Nw1xKw==@protonmail.internalid>
 <20251110-iris_encoder_enhancements-v5-1-1dbb19968bd5@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251110-iris_encoder_enhancements-v5-1-1dbb19968bd5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2025 10:23, Wangao Wang wrote:
> Add members enc_raw_width, enc_raw_height to the struct iris_inst to
> support codec alignment requirements.
> 
> HFI_PROP_RAW_RESOLUTION needs to be set to the actual YUV resolution.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 3 +--
>   drivers/media/platform/qcom/iris/iris_instance.h         | 4 ++++
>   drivers/media/platform/qcom/iris/iris_venc.c             | 6 ++++++
>   3 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 4ce71a14250832440099e4cf3835b4aedfb749e8..48962d2e4962935bbc24244edfbbdcd42dab151f 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -168,8 +168,7 @@ static int iris_hfi_gen2_session_set_property(struct iris_inst *inst, u32 packet
> 
>   static int iris_hfi_gen2_set_raw_resolution(struct iris_inst *inst, u32 plane)
>   {
> -	u32 resolution = inst->fmt_src->fmt.pix_mp.width << 16 |
> -		inst->fmt_src->fmt.pix_mp.height;
> +	u32 resolution = inst->enc_raw_width << 16 | inst->enc_raw_height;
>   	u32 port = iris_hfi_gen2_get_port(inst, plane);
> 
>   	return iris_hfi_gen2_session_set_property(inst,
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 5982d7adefeab80905478b32cddba7bd4651a691..a9892988c10bc28e9b2d8c3b5482e99b5b9af623 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -64,6 +64,8 @@ struct iris_fmt {
>    * @frame_rate: frame rate of current instance
>    * @operating_rate: operating rate of current instance
>    * @hfi_rc_type: rate control type
> + * @enc_raw_width: source image width for encoder instance
> + * @enc_raw_height: source image height for encoder instance
>    */
> 
>   struct iris_inst {
> @@ -102,6 +104,8 @@ struct iris_inst {
>   	u32				frame_rate;
>   	u32				operating_rate;
>   	u32				hfi_rc_type;
> +	u32				enc_raw_width;
> +	u32				enc_raw_height;
>   };
> 
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 099bd5ed4ae0294725860305254c4cad1ec88d7e..50a3eb975a2523abf1c2df128a66a762a1ed35c6 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -68,6 +68,9 @@ int iris_venc_inst_init(struct iris_inst *inst)
>   	inst->operating_rate = DEFAULT_FPS;
>   	inst->frame_rate = DEFAULT_FPS;
> 
> +	inst->enc_raw_width = DEFAULT_WIDTH;
> +	inst->enc_raw_height = DEFAULT_HEIGHT;
> +
>   	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_enc[0],
>   	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
> 
> @@ -249,6 +252,9 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
>   	inst->buffers[BUF_INPUT].min_count = iris_vpu_buf_count(inst, BUF_INPUT);
>   	inst->buffers[BUF_INPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
> 
> +	inst->enc_raw_width = f->fmt.pix_mp.width;
> +	inst->enc_raw_height = f->fmt.pix_mp.height;
> +
>   	if (f->fmt.pix_mp.width != inst->crop.width ||
>   	    f->fmt.pix_mp.height != inst->crop.height) {
>   		inst->crop.top = 0;
> 
> --
> 2.43.0
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

