Return-Path: <linux-arm-msm+bounces-80738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC354C3F69E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 11:26:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74A063B0A71
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 10:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13021304BCD;
	Fri,  7 Nov 2025 10:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n22hTG2P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLyyb7ZT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB343043D6
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 10:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762511158; cv=none; b=RrQBFD8EBF5c9opmLXjjrMDbkLvONbxhbzEPavYIXTP/DVoCmmWWjq09O4IjOh7mEYCGM7HAjMC15D66PV2VrZMhW5oyvEvoHnRt7KX/OX3RzIgLWibbLuhb/uQgb+NXm1XsIXVidTQUQoUKB4oJgVQ7OznTtJCz7cUeomzakRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762511158; c=relaxed/simple;
	bh=TfqVBbE95iBGfqw4ThDJ4Ix4Y/sO9BB/7GhORuIN2B8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=anMcvN4L9aqEE9Jn5W/Ggvx2BKIazJdDDgHELgchzN6L+NurR8ksNy2tomRv4PD0Ct8UA5y/phG24THSNKgptaGKCzqgAAMvyVekGrhcmyOeojp7jBiHJjIgUuE2X/FxMZB5xOxGbK5wPoDWl95rtaZ9m+TpHuYAtcSmenYPp9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n22hTG2P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLyyb7ZT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A78HnBI4131423
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 10:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N0g2bzgjrGduYTi0M77+HVdu59jcso00dA0UqQXUwnk=; b=n22hTG2P7JZiFA+g
	v4aZBSEYx1v4NED+z1Qv/3C8HbRWSla/52Jo200AXr1FM3e7i7KqVNIma3GHNduH
	ePp/JujVaWa0U140adurEmofmxaBqgEXfNOPOnM6xYFWvPg5JN00OT7qEQa0RGta
	3n/tvXzhRG/scn9ZNDxo3wnpRA1ssY4mk1pp1ti8G++/vHjhAbuB/gAgBQhOl7jq
	JsnSjMnF1LvApUk95u3ngzSHxctjljAhr6WjH+UdhevbeqyBcLMkFNqwb8batD0B
	E/wS/N5j9feAVt4Ai0ahrymnJZSzLh7+KPdbcHTFW+tZiibSzV+GfYfjHFqC/E8X
	vYXyhw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8u3x3pnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 10:25:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-294df925293so7932625ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 02:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762511155; x=1763115955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N0g2bzgjrGduYTi0M77+HVdu59jcso00dA0UqQXUwnk=;
        b=XLyyb7ZTTl+FkhJjGKrfdNQDOrIj01X+cztPjNd+W9lWB/J4v/t3Yow9ddbAGyBHr3
         t6XnsDdXdwJymDY8KSwzRqvfkms93AgLKcZB0nbA1U6AAxuDKEeFs1UBd92dIKG+9wxF
         IBakTwPcHq3QaRN51D5/18iQ0ElBdd61V77Rql7eb3FuWyCSAfmEj9ib8g51VZAieKoK
         RfXVe5Tx2iW7BnQO7DCS6IIHT8pOBHSgMvehPSsoRmBehzFOVyWN4nct3pCAv2Mnj640
         HbCwvWUbQbXLTv6eljC72B2gGlVGzAC6Vv9oD9qS0wZcsi4/VE6QXydoze4m3CDaxfnQ
         An7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511155; x=1763115955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0g2bzgjrGduYTi0M77+HVdu59jcso00dA0UqQXUwnk=;
        b=KHc1YouzDpzOofsmkGi+bHFlg13O4p8RyXwsYsHObpsUpuISFVZQf1cRynu4OtQTaS
         /uyhWwAMbW8pSX4i7hWRp1F5HMTN6c/houRadNEF4woECt9tkQF69tI2d0l3IvKP0kNf
         H1agssqpXIexTxLBBEJJeQb4SAQyKVKrawsRKHugcfLTTEvL2CDTwWodZf6EHb2EGv+E
         KrMokypo+jm/WAnwoz3jagQ0ABfrm70RZJj2aYey9IptobkUIDg80313iFtW6LttfmBo
         BoC4uy/p4aT0pp9/zDavkoIOC8FVZr6WiGjw4eVkH9GGbZhZu+bc4hNmmq3lQN/CZyTY
         RxDw==
X-Forwarded-Encrypted: i=1; AJvYcCWokxZJWxOHDaMI3YLRPNfMxN8J3NTAzqLN603cJspaLti/CttD102NhpsmvQx55Hpaj5bBmdZi2yCckQBY@vger.kernel.org
X-Gm-Message-State: AOJu0YzZqqtI4jAEWiXkVRRW+bQDossbksdMjDWEXSWMcnf+Ei76+l2+
	JBTA0t6caE1IZV4km+XZUC+FPeJai7hVsPuPNWqkz6DHkvUSbYTBxYQbdc93QC7Xx4ExJyPFVJo
	5s95PTwHr1p500ymMAVBqmrWD14/D9RkzDLLNAJyT+mMwKnaV2/VhZxN6jg9IN4JYTJgr
X-Gm-Gg: ASbGncuBsx1h9kt8krJb8tMUA2fM7GFscFwvOHIr01wGIYr8DTPw1x78UdrNj8p/9Ft
	uP+7oVA0NzEhS5Zpz/435Ku8fHfxMQMbigKFlo6SYrTbGUAfG1cPDigmy4ClUwifjfPNRrbk8aV
	4HYERpogbuIheOykFX2AW6q4rub8WvWf/bcp8JuLcjv8Xyh90tXj7OhbOtAeuE8JlfE7F88djtX
	0T082Pxi6BC9oite0ewfzDLzpjG2UOUEw8eGerait6XDof/cj8b04X90S4V2utlnbHCNEQN1TBy
	Tifh7+T+HfUVKh/xCEmpM3X3pleMKTpW2IYnA2dcGU6npbUV2s+wTp/644kp+6ZpF6eMxTNhl9Q
	TrzK3DEfM7a+q80yGo1vZELpskmrce0c=
X-Received: by 2002:a17:903:2305:b0:294:ccc6:ccfd with SMTP id d9443c01a7336-297c03e59b2mr38789835ad.24.1762511154815;
        Fri, 07 Nov 2025 02:25:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1tMrg3W/RNIxDscOnZnps3MrCElLCpEcVd1QI5sytXqXnRNUDDFD2lrX1/cHKqttfpe64XQ==
X-Received: by 2002:a17:903:2305:b0:294:ccc6:ccfd with SMTP id d9443c01a7336-297c03e59b2mr38789475ad.24.1762511154289;
        Fri, 07 Nov 2025 02:25:54 -0800 (PST)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096dbe4sm55763195ad.11.2025.11.07.02.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:25:53 -0800 (PST)
Message-ID: <1728c571-1e25-59e2-beae-124d9976fb3f@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 15:55:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/6] media: qcom: iris: Improve crop_offset handling
 for encoder
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
References: <20251106-iris_encoder_enhancements-v4-0-5d6cff963f1b@oss.qualcomm.com>
 <20251106-iris_encoder_enhancements-v4-2-5d6cff963f1b@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251106-iris_encoder_enhancements-v4-2-5d6cff963f1b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4MyBTYWx0ZWRfX7lGZCo5GTEl8
 4Xg2xjypJJYI9LEFoi4oMhP7zbaFjYzF6vga5ScFmw9gWJSn2HKZnbOIfcvb9tY5PlxQNOuqL3C
 Tp0ZKPA8lSrhRISKwhvhoI8pTuDYHSQxW3spGGxSKFLPOa9o47JE+joJDUYV8zN05+rJquj/N3I
 iDeAHyiujBjsqJQyMB7SoTcFwQhlGCsUR2ZgmU3F3BAfdcbSAz+12eXhN58r6a6wdBh6cR8Qs8u
 dW5s6tXW1TXmZkAbSscplPpTDdOtzDm+n5FqW153+vksYbXLHIU7YRQjjnv0r1D++nUjw/Qs78r
 WIqUfdL54IsxTaWWsGZubx6nFFTscUh/W808BL9tx/C8Of7ymw4D4pq94X9ctRzC50qFdH78gEW
 fgSMVXw331ObFDCpO8bm7/aaUhK5aQ==
X-Proofpoint-ORIG-GUID: HozIHmirwtfHbKlg4zCZvtoTzx2lMh6L
X-Proofpoint-GUID: HozIHmirwtfHbKlg4zCZvtoTzx2lMh6L
X-Authority-Analysis: v=2.4 cv=BrKQAIX5 c=1 sm=1 tr=0 ts=690dc933 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-McpUROWq26EwQPLxNQA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070083



On 11/6/2025 9:00 AM, Wangao Wang wrote:
> The setting of HFI_PROP_CROP_OFFSETS for the OUTPUT port is correct,
> but on the CAPTURE port it is used to inform the firmware about the
> ROI, so crop_offset needs to be handled accordingly.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

Does CROP use case work with just this patch and first one?

Since you are enabling different features in your series, pls make sure
features are working with individual patches.

Thanks,
Dikshita
> ---
>  .../media/platform/qcom/iris/iris_hfi_gen2_command.c   | 18 ++++++++++++++----
>  drivers/media/platform/qcom/iris/iris_venc.c           |  4 ++--
>  2 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index aaa79dfe2db281bb77be7274233f093b0086b5d4..69034e1ea8eb64440646776a40dcc657453916db 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -215,8 +215,11 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
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
> @@ -230,10 +233,17 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
>  			top_offset = inst->compose.top;
>  		}
>  	} else {
> -		bottom_offset = (inst->fmt_dst->fmt.pix_mp.height - inst->enc_raw_height);
> -		right_offset = (inst->fmt_dst->fmt.pix_mp.width - inst->enc_raw_width);
> -		left_offset = inst->crop.left;
> -		top_offset = inst->crop.top;
> +		if (V4L2_TYPE_IS_OUTPUT(plane)) {
> +			bottom_offset = (inst->enc_raw_height - inst->crop.height);
> +			right_offset = (inst->enc_raw_width - inst->crop.width);
> +			left_offset = inst->crop.left;
> +			top_offset = inst->crop.top;
> +		} else {
> +			bottom_offset = (inst->fmt_dst->fmt.pix_mp.height - inst->enc_raw_height);
> +			right_offset = (inst->fmt_dst->fmt.pix_mp.width - inst->enc_raw_width);
> +			left_offset = 0;
> +			top_offset = 0;
> +		}
>  	}
>  
>  	payload[0] = FIELD_PREP(GENMASK(31, 16), left_offset) | top_offset;
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 50a3eb975a2523abf1c2df128a66a762a1ed35c6..7ad747d2272f029e69a56572a188a032f898a3fb 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -62,8 +62,8 @@ int iris_venc_inst_init(struct iris_inst *inst)
>  
>  	inst->crop.left = 0;
>  	inst->crop.top = 0;
> -	inst->crop.width = f->fmt.pix_mp.width;
> -	inst->crop.height = f->fmt.pix_mp.height;
> +	inst->crop.width = DEFAULT_WIDTH;
> +	inst->crop.height = DEFAULT_HEIGHT;
>  
>  	inst->operating_rate = DEFAULT_FPS;
>  	inst->frame_rate = DEFAULT_FPS;
> 

