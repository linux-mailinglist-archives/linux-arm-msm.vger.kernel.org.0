Return-Path: <linux-arm-msm+bounces-86909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC831CE8BC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 06:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60BD73013E92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 05:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652362E3AF1;
	Tue, 30 Dec 2025 05:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddiVl5pY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UBcRTYp2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7C52D8379
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 05:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767073777; cv=none; b=dKn+2Mue1UkrXJVOeopJ2XxfjiZFgiTpa0NYqtfsMckhtGMJTIsisy7ttLjcuAOziyXE/ZwRf5W4Zg/xan4sA2Z4kCC0iZchSMxGeIdme4l5OxNuZn+tGnS/txPd+g9zwXs4mX9Xaw3fB0twVzOm5x43dg6qAUA5V8qb6ADDi10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767073777; c=relaxed/simple;
	bh=DK35swWojrnyQZGBfz/hLao8jS30SL4LnWZams9X4rA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oVepHWoTnjLhqKKx559swwJjmV0nGj1hZYMpNiID5/J0ucrnoCa3AwJDjpZ+RrB9eEU2iQ8t7+TLhdz5zzLRpQEYUEkfHZwAvAhLIKPyo62vms7Y2Ny2A3h8n1VmWJLqtIoV8wygnslaZ4pjcbiDRx0TeS+aJxyy7ZicmdmqTdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddiVl5pY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UBcRTYp2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTKXOUh2550982
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 05:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6CTdIhTwi14+X7PFOmiPA2JH7wjlhgniSmmVgGT7WGo=; b=ddiVl5pYFNF8UEYS
	P1JOW3IGKo2VSmYVLvrXM0vLltOcG5tmeRO7cTC/oQaEOYTlfXyWGfIkBrrybX59
	Md9E1DuAcxjZ/i6Sx54E8kHFNQvxCCvzJMw2PqVjNYTIMErQ5pdaGUoNQ3wwgjLr
	OsHCIrQpKzQSX2H2JZDel3aydjpU8I6fn7OpG6gQA6pDWmCWmHkIB1y/d0r4HwnB
	pWjME1jpTMQHJ8UqIvvek9dYAEwjE4QFmQIrRuymftXcfkn9GF1T/GGD4yuO9Z45
	MG7JKydGLRyKnYkB+6Ukz/MK/sg6xyI3YXdSwS8KxnKcUqyJyYpudBFo83s7y3qc
	6z6vug==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0skgwmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 05:49:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c38781efcso19613181a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 21:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767073773; x=1767678573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6CTdIhTwi14+X7PFOmiPA2JH7wjlhgniSmmVgGT7WGo=;
        b=UBcRTYp2CyrZYk5CwSxQ3UXzZLXGcdYy2dNPa6W0I8VPeZGPYNzGREOnkDAYr7/5te
         OjFqVn45/ZZZSkDFfAE2ZgHC5IoAHi+ceis0SNLjOappke4zfzBw63orCEbutMltu3jW
         kbaRayV26B515PNkbivkB32jzvB5/g+5UG7Ei3F+U3qtW+X0mtypjkJD0HM9boKjnNh4
         WTA+2ferl+x3wj5PaTsWqYtlz6ip1RrqCQvZukbre22SR6gztncF5kYNXuFCsHJteOmE
         Tpfz9IG6auWC4ciLjJAQ8TtJFAi8Ob/ktrT5yDuSvdUE8hAwF67sbLxVkzwl14l8b5OW
         k+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767073773; x=1767678573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CTdIhTwi14+X7PFOmiPA2JH7wjlhgniSmmVgGT7WGo=;
        b=PgCByNOtD8GmJjVqGu+nHDnG03rI71axPqWDG7WymziiQzUmNXSoTcZGzwgXpNifJ7
         UmJqHKvxbJmkSRCkd3DdUYqaTnalPPSzoq0Q20VHJcrXU/nAuMZVZPL7Z1iQ3k+luzwb
         o6DJF4NA55agGQggjxQ+211BcvcW5KuizAl/JQMKTNd+6aAE0oiMIfjRofgldF1hkDZf
         dofHRbAZU1tGDjtliZUUn/yEKLMUSoGtcYxHzz2HqGg5Y/erm0vay13wLxWVJmeo/4C1
         I/KFhfMAOnN4EAVGV92paYTNa9SmUnf/asyPfABOas+xBLTV7MrcX9vzDHkd3NVCe8wR
         OKWw==
X-Forwarded-Encrypted: i=1; AJvYcCW5Xqk8daMaPLx1iT3Ez5PdCIJEo3FV7NuGKsodvoVGrwTOKUQ0kwdWNFMFoEGh5Y8Tw5S1jhV/v7dYRWjN@vger.kernel.org
X-Gm-Message-State: AOJu0YxKpqVcAXIJgeN6AkrI7zHoqtOh7er3ZsN1gDqmirOgB5oFstse
	H+7q0SU7imKIfCD51qvdwwK6KqD59O0lrxI+oimYvcG/hW+X8Q9aHPJSryGNQAWf4X9tcU9+W9v
	/KftaXCiTNdZoGTntUqOyK85PxLaDsne5O2ImEqtaB3CikKUW/CegkRwQauzQauEz2C9f
X-Gm-Gg: AY/fxX6HungYDP+YvJiSNuiFoY5iXSltsTomDJb511nYsfVctjbqGrSfHra6Zb9oYUN
	Rn1zD9/yZxJNbsswDDLOtT5ojHZdXgcBXxtak+S6SHBTSyB5gcBJgeNvWszHZcC0q75ecfTzqiu
	I6ICFpvx0/sJ9wtV4thrNL1y6z/Bcvzekke/nLilf4N+grg1W1vRqJMnTyqdI7Nzh1GUMnIa+yO
	ZfdUsH5NYTwwIMaSD5SFbGV2HxSWxJa5kqwjv9lPwDCxPvz3YqFIw/Jbhkmo5C+icZhCNB7sItn
	YNpewVi7r1t85D/3mx6IrV1HPhtmkx2O9+d0yfTPLx/3lgGb9r5cMJb6ZDFdfQ8c8reDWWU7Jeu
	LaSC5oDgQt5odpToB1higFHqqSmVK5Hv+iTau8hjhDw==
X-Received: by 2002:a17:90b:5608:b0:34a:9d9a:3f67 with SMTP id 98e67ed59e1d1-34e921f010bmr25431693a91.33.1767073773596;
        Mon, 29 Dec 2025 21:49:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhKY2GINFBVitSySAl1t+mQj4uvyAnT3E8/rn9ol+4qbHAfxFi+AXHXxZwQD0Cw2z/C4dUXA==
X-Received: by 2002:a17:90b:5608:b0:34a:9d9a:3f67 with SMTP id 98e67ed59e1d1-34e921f010bmr25431680a91.33.1767073773108;
        Mon, 29 Dec 2025 21:49:33 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e9223ae29sm28763996a91.16.2025.12.29.21.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 21:49:32 -0800 (PST)
Message-ID: <7220393c-fad0-2301-77be-20b9232731b5@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 11:19:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 6/6] media: qcom: iris: Simplify COMV size calculation
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251219-batch2_iris_encoder_enhancements-v2-0-371f7fe24801@oss.qualcomm.com>
 <20251219-batch2_iris_encoder_enhancements-v2-6-371f7fe24801@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20251219-batch2_iris_encoder_enhancements-v2-6-371f7fe24801@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA1MSBTYWx0ZWRfX/iX2QsTkA3pF
 8EiNXcSqT3AEY3KHW58j6nyofZ5LeXlCxoY0SLu2duij7WbZjfeHxWeMt/Tjj5HCHoJ+r8EKZKU
 1zWfV8qhWjmapswTad2936JL0u2JQ7eHmifH48zOIkAtPl860vMZUi5t8cGReqburR2NaZ/foVM
 38r/J8q4YBKf99S+ke7CARdHPtb9pFoqNlcyHsB6GsNlL2I9oO21jRitFxIcyV6vlKkEEJLpEX8
 RLs3Qff99aO4AuXZFqmoGpodz82AWNx7+uHkU0HcdWeZjKmDyw6jOkq3QbSgkwy1wtb3Ko7EB9C
 uYeC/8tYWqrF2izwCCSj2KkzQyR40BJ8OSu/cIaJ+E8n994V4RxGQJKfZJGEAREFzOpqFxDWiYD
 C/RIf5i2VL5KgsqiCblDLSxqiKHbm043k7ljt4t3Xgqj/mlgGFQ/3YnTUQZvy8ridgTCaTC5CLY
 NC77VlbT7dV4cOpsRIA==
X-Proofpoint-ORIG-GUID: DTx802imUSH82QXCIuBAvKQempANWOnX
X-Proofpoint-GUID: DTx802imUSH82QXCIuBAvKQempANWOnX
X-Authority-Analysis: v=2.4 cv=FJ0WBuos c=1 sm=1 tr=0 ts=695367ee cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IzfGebrgPFzWcUWWzKPHyQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=veCZvnjz67tEVBlp6j4A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300051



On 12/19/2025 1:12 PM, Wangao Wang wrote:
> Unify AVC/HEVC handling by computing codec and lcu_size upfront.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index c962042518fceb0f82a48956df01c8f3cd26df99..d3f1120dac8d64abcf5f87bc11aa368cfb02820f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -739,16 +739,13 @@ static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
>  	u32 height = iris_vpu_enc_get_bitstream_height(inst);
>  	u32 width = iris_vpu_enc_get_bitstream_width(inst);
>  	u32 num_recon = hfi_buffer_get_recon_count(inst);
> -	u32 lcu_size = 16;
> +	u32 standard, lcu_size;
>  
> -	if (inst->codec == V4L2_PIX_FMT_HEVC) {
> -		lcu_size = 32;
> -		return hfi_buffer_comv_enc(width, height, lcu_size,
> -					   num_recon + 1, HFI_CODEC_ENCODE_HEVC);
> -	}
> +	standard = (inst->codec == V4L2_PIX_FMT_HEVC) ?
> +		HFI_CODEC_ENCODE_HEVC : HFI_CODEC_ENCODE_AVC;

'standard' doesn't have any meaning to it here, pls use a generic name for
this variable.

Thanks,
Dikshita
> +	lcu_size = (inst->codec == V4L2_PIX_FMT_HEVC) ? 32 : 16;
>  
> -	return hfi_buffer_comv_enc(width, height, lcu_size,
> -				   num_recon + 1, HFI_CODEC_ENCODE_AVC);
> +	return hfi_buffer_comv_enc(width, height, lcu_size, num_recon + 1, standard);
>  }
>  
>  static inline
> 

