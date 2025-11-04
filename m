Return-Path: <linux-arm-msm+bounces-80218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F931C2F5A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 06:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0428B4E616D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 05:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B89E2C029E;
	Tue,  4 Nov 2025 05:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NVaKrjGo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J9FIKHJ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708A6287258
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 05:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762233205; cv=none; b=OMA8hK7+oEgGNbTGJiDThRzrToUMEJueDTa8Fq3pwxFTXpZ7HYyODUszDyipF01EqtyeQuNosz/Gnu7Wh/orxYK0c6aV7Xwtoc6OHfnuRvn51iukDCj2yNNvCePtyRsybN7gc+LMBUr4hqxPsx5d6pEeMY3vvG+XH+8OTh7HFIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762233205; c=relaxed/simple;
	bh=5gXXk2leYs+gy3As0SntaK3hhsSuBaldS6BpeXsEbpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQd8SRYYlpP6U2Yp9q6qzicLuSIWjQIM5TpXMbKuN4C1XMXEzUywWl2rpLnSDGHIxPQZl3w7KzW/JUNS99wlnJ4gkcpL21KQEFOGjouiWZAlYu+IUsXuW+Zbq/5CbnKxHC8vqDBPbi7/Es+puzpVdT3x375uM/qJEfO/ujzCQ/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NVaKrjGo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J9FIKHJ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A42qme23683068
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 05:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oYAxLmTpWPvEyUagaVzeYv5g7VV5X0dDKERVjboWJL0=; b=NVaKrjGouwnDFeWh
	Yhibpohug5B2KOBTv/pY/+2r2bjp5H2bZmicauqDTY45HENUO9IHCT+CXwDIx7zs
	q6RZRDqDwa0VnA0OwVtfT6EkbE0EbPDimx022hCeRPEQevj5COc5gQnFCIC6wkKo
	VeIFZaNt9KUV4SHgweYBIpKff1xfG+oAhpx4868+2ZrK6MXu031onh0rmK9TUgjg
	lNPdagdNwWQP9psHoGTbPTs3K/LOLXkmlhv9uGk7cxHX4akSv5LwIft1M02rVXth
	I7VXY4fNteKglMNUylfVoHO1OMIz5MXcVxYkQXIVx7x0RvihQ9bp0zA7N4o1MeUy
	v6/VxA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6xjqt5kg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 05:13:22 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b9ceccbd7e8so1709515a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 21:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762233201; x=1762838001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oYAxLmTpWPvEyUagaVzeYv5g7VV5X0dDKERVjboWJL0=;
        b=J9FIKHJ3isWjgiQ+L4UaYLjRzziHxbrD+QgB9AjaU7mQnXUvLMT8fyozcA84ePYeug
         NAMLFLIVd11Aw4eYe37bNxxS5l8V6zz55doDcfE+w/4wcAqH51MxSuCwozr1sHd9m+gx
         vACf+uqK4OCGfQVuYaXnz02qUFo/9D+FeBKc3x5PuzkQMhfn1vruwrnuL1nxOtI4viv9
         ryxoLGnmDoZ3jybO28JkzLe6mT0gNMPeNdkzczC0HV93+cVZjDTZpxD7STJU0xxrHcgt
         5MjkHbO4GbmnK2dYQgIOf/vM6Rts3F/Kzz5X8e80uyWQhwhfhlI8j54VA8WsymgNI/Sa
         QvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762233201; x=1762838001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oYAxLmTpWPvEyUagaVzeYv5g7VV5X0dDKERVjboWJL0=;
        b=Bd93arTTE4iw7oeyBan+ggKMXNw5N50cAlbVDQjSQRO2XCLLWeYo6A8HtPY11hrIo+
         +kzdmKDFIiH0f5IqyP0wCewUk/H3KmS1sNzCpX6A2SuGJiJi+TLEIrZD/2Ao6yi/REFa
         4efgTA9FILTlgAw8P7sDYnZD7GcZlMgiqleVkqqGOftIa5tsRVxueSAcTeh19Q1wxBIr
         vY6qCctqkNQcHqpvRlU7om0kYgeR94rinG9aUuITrfGGAQwaq2WhMOY0VN3hjMtgGx4k
         aEs6UR/aIgyjmgq4Jbm3YHbKmqib3v+kiL9Euc79ASArNkE5W9lJzOOVhg7xvYomcl0S
         8pYw==
X-Forwarded-Encrypted: i=1; AJvYcCWIRpk1YIjkQfn8wGXzVt7e+TB8+BWTPX5Q7S+U1PCjn8njPaZmAEGpmiqOBkaAcof1DsZ+MpkDzNsk5x5n@vger.kernel.org
X-Gm-Message-State: AOJu0YxVPzuO2ZiT/vmqbgssWi324i0Nq4znjx34sBSAzRGWEDhHJjOF
	5+PQxjjsY4fEfx8pFq8GMw/E7OpwIM6qwOOLtDUrWueXBFA51dnHnPNajQwmeZVm+bij9y6jrCM
	xpLhRv7ZkMhblG1nXb4PG0iZadxv4Rq07oTIwTEs7dRgKko8jfhN824wU/YrqdnUGj5IH
X-Gm-Gg: ASbGncszM/ZuT1+iirxf6KyHegVcTAjY63EkyQaWHS/MTegu2Xv8LWQu9Y/57THh/N2
	3Bd6CRGr4nXyYPrsW8kxGtuytpUobOXriXONxD8WGYppCaPIus7Z3PGp4M4U5qo4LDBK4u486Ti
	yz/EPVKDDWFreQtbSaq7RA1Uu2uYCXTKbOeYHTUW/QQmT+TUEyfZwRNNc7GD+QbivZA/VaC0TU2
	T6mXT2IdXzypJsW5I5nHc5vPT9CBbmNs9RLhaQ0daCjQGYt/Rio9IVQp2fXiWTKFR46wjf/RhJD
	nK2+chQeNMBWm7GvMQX27dA05cJHNlI40P2bMyUvkJFSMrrAwgZ3/X+h6WPvfpF0/jZ0EDg/QkO
	9zmV4C5epkNRfjMkKvPjghOUZmbl3/cE=
X-Received: by 2002:a17:902:ecd0:b0:295:9b3a:16b7 with SMTP id d9443c01a7336-2959b3a1914mr81483055ad.4.1762233201220;
        Mon, 03 Nov 2025 21:13:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWACZj+ZHM6Dev75PadzPzX/oh0XnEO8AOPJIyynJU0LeztkisVKif+JFLBlZ+JntwwJxQPQ==
X-Received: by 2002:a17:902:ecd0:b0:295:9b3a:16b7 with SMTP id d9443c01a7336-2959b3a1914mr81482885ad.4.1762233200674;
        Mon, 03 Nov 2025 21:13:20 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd69192c2sm1305796b3a.66.2025.11.03.21.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 21:13:20 -0800 (PST)
Message-ID: <ea10fd71-dc89-59c0-c366-446c20b3fc15@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 10:43:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/5] media: qcom: iris: Improve format alignment for
 encoder
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
References: <20251031-iris_encoder_enhancements-v2-0-319cd75cbb45@oss.qualcomm.com>
 <20251031-iris_encoder_enhancements-v2-1-319cd75cbb45@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251031-iris_encoder_enhancements-v2-1-319cd75cbb45@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lrGaHI0FnLeFRTbtZUbNIjKwHN2bvonT
X-Proofpoint-ORIG-GUID: lrGaHI0FnLeFRTbtZUbNIjKwHN2bvonT
X-Authority-Analysis: v=2.4 cv=criWUl4i c=1 sm=1 tr=0 ts=69098b72 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VppOGLtqdac6JACSmWIA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA0MCBTYWx0ZWRfX1Qj1Vlhx0iPW
 Jjhr6Umeq/VMHb7WAv+TaJ+pe/+Au87tv0fdly20D7lJF+HMcvUUZGDYp9q5F7pWTcrCKircDyC
 9Zs7mgXh56vSeTrNy0lGVA5KU/gDYefoT0WLmvb3rVg+ZzIJ3RFtl3mEbYJCs/gGFPwNwIuiwYC
 l0w3unU8Sdv8LzES4qJ1sNqeFZhx0Eq6nLI7rw6m7QdUPmsqMqFIv9ZF4BwpdxWSS5qHb8DNLH1
 GxMrKDXV03mi+nPN3ORZdtIDN9OpuxkUONHp4PQIiKTv/wAUyxjh3kWc+4phIbZLa2a1wASecJB
 f2LpQCZgGi7+6ocLo5odj97gnEpMhRXJy7JfdVtuu8lMHAzH/j/7Gv73T/pgkYpN3XqFINrR8lJ
 1u2o4K/3A2Q05J4gyYHmWXuln5I6Kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040040



On 10/31/2025 3:20 PM, Wangao Wang wrote:
> Add members enc_raw_width, enc_raw_height to the struct iris_inst to
> support codec alignment requirements.
> 
> HFI_PROP_CROP_OFFSETS is used to inform the firmware of the region
> of interest, rather than indicating that the codec supports crop.
> Therefore, the crop handling has been corrected accordingly.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  .../media/platform/qcom/iris/iris_hfi_gen2_command.c   | 18 ++++++++++++------
>  drivers/media/platform/qcom/iris/iris_instance.h       |  4 ++++
>  drivers/media/platform/qcom/iris/iris_venc.c           | 10 +++++++---
>  3 files changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 4ce71a14250832440099e4cf3835b4aedfb749e8..ada9b4d298ef10ac47a573061369828a1e150f85 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -168,8 +168,7 @@ static int iris_hfi_gen2_session_set_property(struct iris_inst *inst, u32 packet
>  
>  static int iris_hfi_gen2_set_raw_resolution(struct iris_inst *inst, u32 plane)
>  {
> -	u32 resolution = inst->fmt_src->fmt.pix_mp.width << 16 |
> -		inst->fmt_src->fmt.pix_mp.height;
> +	u32 resolution = inst->enc_raw_width << 16 | inst->enc_raw_height;
>  	u32 port = iris_hfi_gen2_get_port(inst, plane);
>  
>  	return iris_hfi_gen2_session_set_property(inst,
> @@ -216,8 +215,11 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
>  	u32 port = iris_hfi_gen2_get_port(inst, plane);
>  	u32 bottom_offset, right_offset;
>  	u32 left_offset, top_offset;
> +	u32 codec_align;
>  	u32 payload[2];
>  
> +	codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
> +
>  	if (inst->domain == DECODER) {
>  		if (V4L2_TYPE_IS_OUTPUT(plane)) {
>  			bottom_offset = (inst->fmt_src->fmt.pix_mp.height - inst->crop.height);
> @@ -231,10 +233,14 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
>  			top_offset = inst->compose.top;
>  		}
>  	} else {
> -		bottom_offset = (inst->fmt_src->fmt.pix_mp.height - inst->crop.height);
> -		right_offset = (inst->fmt_src->fmt.pix_mp.width - inst->crop.width);
> -		left_offset = inst->crop.left;
> -		top_offset = inst->crop.top;
> +		if (V4L2_TYPE_IS_CAPTURE(plane)) {
> +			bottom_offset = (ALIGN(inst->enc_raw_height, codec_align) -
> +					inst->enc_raw_height);
> +			right_offset = (ALIGN(inst->enc_raw_width, codec_align) -
> +					inst->enc_raw_width);
> +			left_offset = inst->crop.left;
> +			top_offset = inst->crop.top;

As you mentioned this prop is not meant to set CROP so left offset and top
offset can be assigned to 0 directly?

> +		}
>  	}
>  
>  	payload[0] = FIELD_PREP(GENMASK(31, 16), left_offset) | top_offset;
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 5982d7adefeab80905478b32cddba7bd4651a691..fbae1662947df73bb3d10b7892839fa1076b7e61 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -64,6 +64,8 @@ struct iris_fmt {
>   * @frame_rate: frame rate of current instance
>   * @operating_rate: operating rate of current instance
>   * @hfi_rc_type: rate control type
> + * @enc_raw_width: raw image width for encoder instance
> + * @enc_raw_height: raw image height for encoder instance
>   */
>  
>  struct iris_inst {
> @@ -102,6 +104,8 @@ struct iris_inst {
>  	u32				frame_rate;
>  	u32				operating_rate;
>  	u32				hfi_rc_type;
> +	u32				enc_raw_width;
> +	u32				enc_raw_height;
>  };
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 099bd5ed4ae0294725860305254c4cad1ec88d7e..6adadc89e360a6e4bebe1f839d38892990e10fa2 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -68,6 +68,9 @@ int iris_venc_inst_init(struct iris_inst *inst)
>  	inst->operating_rate = DEFAULT_FPS;
>  	inst->frame_rate = DEFAULT_FPS;
>  
> +	inst->enc_raw_width = DEFAULT_WIDTH;
> +	inst->enc_raw_height = DEFAULT_HEIGHT;
> +
>  	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_enc[0],
>  	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
>  
> @@ -249,6 +252,9 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
>  	inst->buffers[BUF_INPUT].min_count = iris_vpu_buf_count(inst, BUF_INPUT);
>  	inst->buffers[BUF_INPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
>  
> +	inst->enc_raw_width = f->fmt.pix_mp.width;
> +	inst->enc_raw_height = f->fmt.pix_mp.height;
> +
>  	if (f->fmt.pix_mp.width != inst->crop.width ||
>  	    f->fmt.pix_mp.height != inst->crop.height) {
>  		inst->crop.top = 0;
> @@ -329,9 +335,7 @@ int iris_venc_s_selection(struct iris_inst *inst, struct v4l2_selection *s)
>  		inst->crop.top = s->r.top;
>  		inst->crop.width = s->r.width;
>  		inst->crop.height = s->r.height;
> -		inst->fmt_dst->fmt.pix_mp.width = inst->crop.width;
> -		inst->fmt_dst->fmt.pix_mp.height = inst->crop.height;
> -		return iris_venc_s_fmt_output(inst, inst->fmt_dst);

why is this removed ?

Thanks,
Dikshita

> +		return 0;
>  	default:
>  		return -EINVAL;
>  	}
> 

