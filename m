Return-Path: <linux-arm-msm+bounces-78249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B182BFA194
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 07:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83CE2565767
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 05:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271D62EFD8A;
	Wed, 22 Oct 2025 05:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUdX5aP2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB232ECE9C
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 05:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761111874; cv=none; b=HeJSk3Dy1WNK6fiNr5AFP+2ntjazi/X0hKI1k+X7rmm8j3IJMmXyzsNQ6vlIFEzNa0TFmjXcsvORrj2NGGWZhhASyxLNQUljLx6XR2XooJ0DekOHld+51j+bkUdgEbGTydQwl7+xfNQZcgyJbgZfEh9SAD9PSTlznHaoNLJJR6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761111874; c=relaxed/simple;
	bh=tcUD4EQbeOiixehNpu7v0H7oPtKBd/AJWusjJ5KewBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJrjUS+q3YJnK7hBoIdg34wHOefu148KNLXh92/1niocJK82BTtgIoPmhN3ODMevZ+MEdPUSEVEj9rJ6Yb8LmbDhWb35y7G1xkGwmEU0F/Sv01qZ0WIGZVFOdN32+rrGQUwHXa9+yVGodLawqt6QJqjNXXJHW6sQWLgk29uu1cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RUdX5aP2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M1hV9U020418
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 05:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XezIXwm2kvsHwv+azWqD5hEZ5XYPnRLDHsouMeElX18=; b=RUdX5aP2h91hc5KQ
	pAhdRM3pNmVrzv0EKAyr59cBqWjN27YY3ctHl1+acUDC+ll10bBm+rU2VnURgC5f
	ff+8EAQRQ4aCEs6vtpr6E/T4wUrdR/qYd7JyM29SHq0Z4xbXEgNtb4AIV4zdxpAx
	vte7CW6fXIjhosvfS4/IqlMl6lOgTyg1YcWPYeew6oRH+EgylQKE7AoFs455rcrd
	D4YIQ4gLMn4Ej/ILHvHRLDlE4E3Kr7kaUAvGXkQUPT0qHtgA7PQVkZx9ptJMUT07
	gcPmABscEDJd9qBfGJ0xDhFz2a3AsyoL1LKl+pXsHbNW3X4TUaoh3hmgdd3f3Ht7
	0RBtRw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3443ck7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 05:44:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28973df6a90so63573755ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 22:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761111870; x=1761716670;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XezIXwm2kvsHwv+azWqD5hEZ5XYPnRLDHsouMeElX18=;
        b=vMBAkXav1LsgFfT2zdxUndeaynmvHir67EOPCIHWfz0BuB4c+Py2s2uDVJnMN0UxqH
         +MRpGesX22RIhhGpeITZY0vzJyT+880AAldgdq7E4FjrTmn7BvAP/ddvCrqiwAYxvSs+
         NMsJPKtI7oJaNUjGivxgPdNzIvGj544dyW1xKL9hbpkHIo+2cXdYbJ764Yxgt5LSr0H0
         809X7wyYlUZqiqPTrWCnaxnVkdQN3yBnwjtUHCCG7GjmysHqm70vExoOYpBw99bkTMOA
         wNtR7ogkIGULHQR+4goD8tNitSl4Vfqn4/HflVdPL68jQxPfpFSwDjzVP8C+ScAY8K1O
         7WcQ==
X-Gm-Message-State: AOJu0Yw254xq6wVna4F03ALOurU4DjFjlHsQiInzaNGga/3zX22awbNr
	vBf2ESR53DDVCsBzlKor70dJGvzcw5aYlhSgOTulJhCfYa4uXbsspuZo1TmpudbYvrNdfT1+wmL
	1tdIUDNgZOnrQLkRyajF1SE+f7y1SRcz6YnjSEwoF66x+MHOsaW7UdfY7W4WtJM9SWG7nicuoB4
	cN
X-Gm-Gg: ASbGncvH/WS2JzE6Jym1IGw/3sb67/rdhSrECZYJ5SSi5oSen7tAgZnEU5KhGL2vtjX
	ly64ic9frP5CllCFKobM5lsX+ynLG8nLROQ3XpeXW8BKYMHWNy/MZzGW+L4HBcBvnaKLoa//vzr
	4s6WQp161lL6ZOn+ebVBUkbnRADenOZ7d778VGMYOkXTEIVuCkM3Njgtju+Aq0HWhNihBHqWSBL
	70kDG2thvt+xux84/3V0KXECB51hU5haRaBUmkeq+gEZ+hXk/VC6wpQ0Ovx3zRE+zBe6KO38dvE
	RkvUmjZfDemuVbVah6wbxrwYYtA/zbXErPzZ/SyEcSQtsDQ3Jxar2gY99Fp3SvlXe/cGePnRFrs
	vLUvyJehmGWiiwoHcqlnVWAgx0dQpc9/sCg==
X-Received: by 2002:a17:903:2381:b0:240:3b9e:dd65 with SMTP id d9443c01a7336-290cba4ec0fmr239924425ad.38.1761111869591;
        Tue, 21 Oct 2025 22:44:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDeFeUhNgJlMZ6PwfKKhhegiNwtt0fceM9zAQnEkRyWJLeZgcOtimZJB7SIgd1LwiVmKXeoQ==
X-Received: by 2002:a17:903:2381:b0:240:3b9e:dd65 with SMTP id d9443c01a7336-290cba4ec0fmr239924195ad.38.1761111869101;
        Tue, 21 Oct 2025 22:44:29 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.252.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ffeec3sm127923005ad.52.2025.10.21.22.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 22:44:28 -0700 (PDT)
Message-ID: <ae4c7968-f593-6c8d-2c10-f7a2b31318e2@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 11:14:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 4/8] media: iris: Introduce buffer size calculations
 for vpu4
Content-Language: en-US
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
 <GTpef7Aus-RX4JTIPiuyzDI3BJc-uy2KS2_iCt9iA5vLn1uSC4euaEJSsHiAkdYfbyDe1qV7d4unrSJ5gXQPgw==@protonmail.internalid>
 <20251017-knp_video-v2-4-f568ce1a4be3@oss.qualcomm.com>
 <eb8bca50-5e11-48c0-8c1c-0e639928e089@kernel.org>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <eb8bca50-5e11-48c0-8c1c-0e639928e089@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8DQqffim4IcxmSIBrA2AGBfrHUxNOOWt
X-Proofpoint-ORIG-GUID: 8DQqffim4IcxmSIBrA2AGBfrHUxNOOWt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfXwHXcfFSNE9/l
 EAQfWYRFeGpVw0/8FHory79jErhGD88Ic53VRGBK3y/u7Op5br+5OESTkidVQV8OptTy6Can2js
 JtWw+S/a7vzqFBCobDPldp17jojiuEcDK4p7kcSQk4w49Uk0weB8RMh7kEhoyVzQPs9lLpEdGVQ
 UlG+QuFqvQbMpXH8ZVQOcpY++A1ndf81OeNTqno5Yh60HcuCCLOWAVHQutoWV9lNtCLc4KPYHt2
 kxDHBPh+TabnpWdSTytfFiHdC0PtmfjvjaSnKHVIAfSgYUkdmo4Hcxen2Ayq/Th1sPyv1WpoO8b
 keZwjpfFQzUY0Rb+U1VxTRssRfVBaFt/Sjg4EzXpr3gJsvLSTdwYEwQSAgGwnFEdHwauWgHDUkb
 GxVvP1plQ9CYOyjgaWr1J5Uw4wdP5Q==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f86f3e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=FoPg1IWog9mqHsjG+aRTFA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=EynWgtm1Wqj_ObTU-tcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023


On 10/22/2025 4:55 AM, Bryan O'Donoghue wrote:
> On 17/10/2025 15:16, Vikash Garodia wrote:
>> Introduces vp4 buffer size calculation for both encoder and decoder.
>> Reuse the buffer size calculation which are common, while adding the
>> vpu4 ones separately.
>>
>> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 345 +++++++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  15 +
>>   2 files changed, 360 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> index
>> 4463be05ce165adef6b152eb0c155d2e6a7b3c36..8cc52d7aba3ffb968191519c1a1a10e326403205 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> @@ -1408,6 +1408,307 @@ static u32 iris_vpu_enc_vpss_size(struct iris_inst *inst)
>>       return hfi_buffer_vpss_enc(width, height, ds_enable, 0, 0);
>>   }
>>
>> +static inline u32 size_dpb_opb(u32 height, u32 lcu_size)
>> +{
>> +    u32 max_tile_height = ((height + lcu_size - 1) / lcu_size) * lcu_size + 8;
>> +    u32 dpb_opb = 3 * ((max_tile_height >> 3) * DMA_ALIGNMENT);
>> +    u32 num_luma_chrome_plane = 2;
>> +
>> +    return dpb_opb = num_luma_chrome_plane * ALIGN(dpb_opb, DMA_ALIGNMENT);
> 
> return thing = someother-thing.
> 
> You must mean
> 
> return (num_luma_chrome_plane * ALIGN(dpb_opb, DMA_ALIGNMENT));

Ack

> 
>> +}
>> +
>> +static u32 hfi_vpu4x_vp9d_lb_size(u32 frame_width, u32 frame_height, u32
>> num_vpp_pipes)
>> +{
>> +    u32 vp9_top_lb, vp9_fe_left_lb, vp9_se_left_lb, dpb_opb, vp9d_qp,
>> num_lcu_per_pipe;
>> +    u32 lcu_size = 64, fe_top_ctrl_line_numbers = 3,
>> fe_top_data_luma_line_numbers = 2,
>> +        fe_top_data_chroma_line_numbers = 3, fe_lft_ctrl_line_numbers = 4,
>> +        fe_lft_db_data_line_numbers = 2, fe_lft_lr_data_line_numbers = 4;
> 
> You can reduce this very long variable list to macro constants.
> 
> For example fe_lft_db_data_line_numbers doesn't vary so it shouldn't be a variable.
> 

Ack

>> +
>> +    vp9_top_lb = ALIGN(size_vp9d_lb_vsp_top(frame_width, frame_height),
>> DMA_ALIGNMENT);
>> +    vp9_top_lb += ALIGN(size_vpxd_lb_se_top_ctrl(frame_width, frame_height),
>> DMA_ALIGNMENT);
>> +    vp9_top_lb += max3(DIV_ROUND_UP(frame_width, BUFFER_ALIGNMENT_16_BYTES) *
>> +               MAX_PE_NBR_DATA_LCU16_LINE_BUFFER_SIZE,
>> +               DIV_ROUND_UP(frame_width, BUFFER_ALIGNMENT_32_BYTES) *
>> +               MAX_PE_NBR_DATA_LCU32_LINE_BUFFER_SIZE,
>> +               DIV_ROUND_UP(frame_width, BUFFER_ALIGNMENT_64_BYTES) *
>> +               MAX_PE_NBR_DATA_LCU64_LINE_BUFFER_SIZE);
>> +    vp9_top_lb = ALIGN(vp9_top_lb, DMA_ALIGNMENT);
>> +    vp9_top_lb += ALIGN((DMA_ALIGNMENT * DIV_ROUND_UP(frame_width, lcu_size)),
>> +                DMA_ALIGNMENT) * fe_top_ctrl_line_numbers;
>> +    vp9_top_lb += ALIGN(DMA_ALIGNMENT * 8 * DIV_ROUND_UP(frame_width, lcu_size),
>> +                DMA_ALIGNMENT) * (fe_top_data_luma_line_numbers +
>> +                fe_top_data_chroma_line_numbers);
>> +
>> +    num_lcu_per_pipe = (DIV_ROUND_UP(frame_height, lcu_size) / num_vpp_pipes) +
>> +                  (DIV_ROUND_UP(frame_height, lcu_size) % num_vpp_pipes);
>> +    vp9_fe_left_lb = ALIGN((DMA_ALIGNMENT * num_lcu_per_pipe), DMA_ALIGNMENT) *
>> +                fe_lft_ctrl_line_numbers;
>> +    vp9_fe_left_lb += ((ALIGN((DMA_ALIGNMENT * 8 * num_lcu_per_pipe),
>> DMA_ALIGNMENT) *
>> +                fe_lft_db_data_line_numbers) +
>> +                ALIGN((DMA_ALIGNMENT * 3 * num_lcu_per_pipe), DMA_ALIGNMENT) +
>> +                ALIGN((DMA_ALIGNMENT * 4 * num_lcu_per_pipe), DMA_ALIGNMENT) +
>> +                (ALIGN((DMA_ALIGNMENT * 24 * num_lcu_per_pipe), DMA_ALIGNMENT) *
>> +                fe_lft_lr_data_line_numbers));
>> +    vp9_fe_left_lb = vp9_fe_left_lb * num_vpp_pipes;
>> +
>> +    vp9_se_left_lb = ALIGN(size_vpxd_lb_se_left_ctrl(frame_width, frame_height),
>> +                   DMA_ALIGNMENT);
>> +    dpb_opb = size_dpb_opb(frame_height, lcu_size);
>> +    vp9d_qp = ALIGN(size_vp9d_qp(frame_width, frame_height), DMA_ALIGNMENT);
>> +
>> +    return vp9_top_lb + vp9_fe_left_lb + (vp9_se_left_lb * num_vpp_pipes) +
>> +            (dpb_opb * num_vpp_pipes) + vp9d_qp;
>> +}
>> +
>> +static u32 hfi_vpu4x_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32
>> _yuv_bufcount_min,
>> +                      bool is_opb, u32 num_vpp_pipes)
>> +{
>> +    u32 lb_size = hfi_vpu4x_vp9d_lb_size(frame_width, frame_height,
>> num_vpp_pipes);
>> +    u32 dpb_obp_size = 0, lcu_size = 64;
>> +
>> +    if (is_opb)
>> +        dpb_obp_size = size_dpb_opb(frame_height, lcu_size) * num_vpp_pipes;
>> +
>> +    return lb_size + dpb_obp_size;
>> +}
>> +
>> +static u32 iris_vpu4x_dec_line_size(struct iris_inst *inst)
>> +{
>> +    u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
>> +    u32 out_min_count = inst->buffers[BUF_OUTPUT].min_count;
>> +    struct v4l2_format *f = inst->fmt_src;
>> +    u32 height = f->fmt.pix_mp.height;
>> +    u32 width = f->fmt.pix_mp.width;
>> +    bool is_opb = false;
>> +
>> +    if (iris_split_mode_enabled(inst))
>> +        is_opb = true;
>> +
>> +    if (inst->codec == V4L2_PIX_FMT_H264)
>> +        return hfi_buffer_line_h264d(width, height, is_opb, num_vpp_pipes);
>> +    else if (inst->codec == V4L2_PIX_FMT_HEVC)
>> +        return hfi_buffer_line_h265d(width, height, is_opb, num_vpp_pipes);
>> +    else if (inst->codec == V4L2_PIX_FMT_VP9)
>> +        return hfi_vpu4x_buffer_line_vp9d(width, height, out_min_count, is_opb,
>> +                          num_vpp_pipes);
>> +
>> +    return 0;
>> +}
>> +
>> +static u32 hfi_vpu4x_buffer_persist_h265d(u32 rpu_enabled)
>> +{
>> +    return ALIGN((SIZE_SLIST_BUF_H265 * NUM_SLIST_BUF_H265 + H265_NUM_FRM_INFO *
>> +        H265_DISPLAY_BUF_SIZE + (H265_NUM_TILE * sizeof(u32)) +
>> (NUM_HW_PIC_BUF *
>> +        (SIZE_SEI_USERDATA + SIZE_H265D_ARP + SIZE_THREE_DIMENSION_USERDATA)) +
>> +        rpu_enabled * NUM_HW_PIC_BUF * SIZE_DOLBY_RPU_METADATA), DMA_ALIGNMENT);
>> +}
>> +
>> +static u32 hfi_vpu4x_buffer_persist_vp9d(void)
>> +{
>> +    return ALIGN(VP9_NUM_PROBABILITY_TABLE_BUF * VP9_PROB_TABLE_SIZE,
>> DMA_ALIGNMENT) +
>> +        (ALIGN(hfi_iris3_vp9d_comv_size(), DMA_ALIGNMENT) * 2) +
>> +        ALIGN(MAX_SUPERFRAME_HEADER_LEN, DMA_ALIGNMENT) +
>> +        ALIGN(VP9_UDC_HEADER_BUF_SIZE, DMA_ALIGNMENT) +
>> +        ALIGN(VP9_NUM_FRAME_INFO_BUF * CCE_TILE_OFFSET_SIZE, DMA_ALIGNMENT) +
>> +        ALIGN(VP9_NUM_FRAME_INFO_BUF * VP9_FRAME_INFO_BUF_SIZE_VPU4X,
>> DMA_ALIGNMENT) +
>> +        HDR10_HIST_EXTRADATA_SIZE;
>> +}
>> +
>> +static u32 iris_vpu4x_dec_persist_size(struct iris_inst *inst)
>> +{
>> +    if (inst->codec == V4L2_PIX_FMT_H264)
>> +        return hfi_buffer_persist_h264d();
>> +    else if (inst->codec == V4L2_PIX_FMT_HEVC)
>> +        return hfi_vpu4x_buffer_persist_h265d(0);
>> +    else if (inst->codec == V4L2_PIX_FMT_VP9)
>> +        return hfi_vpu4x_buffer_persist_vp9d();
>> +
>> +    return 0;
>> +}
>> +
>> +static u32 size_se_lb(u32 standard, u32 num_vpp_pipes_enc,
>> +              u32 frame_width_coded, u32 frame_height_coded)
>> +{
>> +    u32 se_tlb_size = ALIGN(frame_width_coded, DMA_ALIGNMENT);
>> +    u32 se_llb_size = (standard == HFI_CODEC_ENCODE_HEVC) ?
>> +               ((frame_height_coded + BUFFER_ALIGNMENT_32_BYTES - 1) /
>> +                BUFFER_ALIGNMENT_32_BYTES) * LOG2_16 * LLB_UNIT_SIZE :
>> +               ((frame_height_coded + BUFFER_ALIGNMENT_16_BYTES - 1) /
>> +                BUFFER_ALIGNMENT_16_BYTES) * LOG2_32 * LLB_UNIT_SIZE;
>> +
>> +    se_llb_size = ALIGN(se_llb_size, BUFFER_ALIGNMENT_32_BYTES);
>> +
>> +    if (num_vpp_pipes_enc > 1)
>> +        se_llb_size = ALIGN(se_llb_size + BUFFER_ALIGNMENT_512_BYTES,
>> +                    DMA_ALIGNMENT) * num_vpp_pipes_enc;
>> +
>> +    return ALIGN(se_tlb_size + se_llb_size, DMA_ALIGNMENT);
>> +}
>> +
>> +static u32 size_te_lb(bool is_ten_bit, u32 num_vpp_pipes_enc, u32 width_in_lcus,
>> +              u32 frame_height_coded, u32 frame_width_coded)
>> +{
>> +    u32 num_pixel_10_bit = 3, num_pixel_8_bit = 2, num_pixel_te_llb = 3;
>> +    u32 te_llb_col_rc_size = ALIGN(32 * width_in_lcus / num_vpp_pipes_enc,
>> +                       DMA_ALIGNMENT) * num_vpp_pipes_enc;
>> +    u32 te_tlb_recon_data_size = ALIGN((is_ten_bit ? num_pixel_10_bit :
>> num_pixel_8_bit) *
>> +                    frame_width_coded, DMA_ALIGNMENT);
>> +    u32 te_llb_recon_data_size = ((1 + is_ten_bit) * num_pixel_te_llb *
>> frame_height_coded +
>> +                      num_vpp_pipes_enc - 1) / num_vpp_pipes_enc;
>> +    te_llb_recon_data_size = ALIGN(te_llb_recon_data_size, DMA_ALIGNMENT) *
>> num_vpp_pipes_enc;
>> +
>> +    return ALIGN(te_llb_recon_data_size + te_llb_col_rc_size +
>> te_tlb_recon_data_size,
>> +             DMA_ALIGNMENT);
>> +}
>> +
>> +static inline u32 calc_fe_tlb_size(u32 size_per_lcu, bool is_ten_bit)
>> +{
>> +    u32 num_pixels_fe_tlb_10_bit = 128, num_pixels_fe_tlb_8_bit = 64;
>> +
>> +    return is_ten_bit ? (num_pixels_fe_tlb_10_bit * (size_per_lcu + 1)) :
>> +            (size_per_lcu * num_pixels_fe_tlb_8_bit);
>> +}
>> +
>> +static u32 size_fe_lb(bool is_ten_bit, u32 standard, u32 num_vpp_pipes_enc,
>> +              u32 frame_height_coded, u32 frame_width_coded)
>> +{
>> +    u32 log2_lcu_size, num_cu_in_height_pipe, num_cu_in_width,
>> +        fb_llb_db_ctrl_size, fb_llb_db_luma_size, fb_llb_db_chroma_size,
>> +        fb_tlb_db_ctrl_size, fb_tlb_db_luma_size, fb_tlb_db_chroma_size,
>> +        fb_llb_sao_ctrl_size, fb_llb_sao_luma_size, fb_llb_sao_chroma_size,
>> +        fb_tlb_sao_ctrl_size, fb_tlb_sao_luma_size, fb_tlb_sao_chroma_size,
>> +        fb_lb_top_sdc_size, fb_lb_se_ctrl_size, fe_tlb_size, size_per_lcu;
>> +    u32 fe_sdc_data_per_block = 16, se_ctrl_data_per_block = 2020;
> 
> Again you can reduce this - at least a little bit
> 
> fe_sdc_data_per_block
> se_ctrl_data_per_block
> 
> are const

Ack

> 
>> +
>> +    log2_lcu_size = (standard == HFI_CODEC_ENCODE_HEVC) ? 5 : 4;
>> +    num_cu_in_height_pipe = ((frame_height_coded >> log2_lcu_size) +
>> num_vpp_pipes_enc - 1) /
>> +                 num_vpp_pipes_enc;
>> +    num_cu_in_width = frame_width_coded >> log2_lcu_size;
>> +
>> +    size_per_lcu = 2;
>> +    fe_tlb_size = calc_fe_tlb_size(size_per_lcu, 1);
>> +    fb_llb_db_ctrl_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) *
>> num_cu_in_height_pipe;
>> +    fb_llb_db_ctrl_size = ALIGN(fb_llb_db_ctrl_size, DMA_ALIGNMENT) *
>> num_vpp_pipes_enc;
>> +
>> +    size_per_lcu = (1 << (log2_lcu_size - 3));
>> +    fe_tlb_size = calc_fe_tlb_size(size_per_lcu, is_ten_bit);
>> +    fb_llb_db_luma_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) *
>> num_cu_in_height_pipe;
>> +    fb_llb_db_luma_size = ALIGN(fb_llb_db_luma_size, DMA_ALIGNMENT) *
>> num_vpp_pipes_enc;
>> +
>> +    size_per_lcu = ((1 << (log2_lcu_size - 4)) * 2);
>> +    fe_tlb_size = calc_fe_tlb_size(size_per_lcu, is_ten_bit);
>> +    fb_llb_db_chroma_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) *
>> num_cu_in_height_pipe;
>> +    fb_llb_db_chroma_size = ALIGN(fb_llb_db_chroma_size, DMA_ALIGNMENT) *
>> num_vpp_pipes_enc;
>> +
>> +    size_per_lcu = 1;
>> +    fe_tlb_size = calc_fe_tlb_size(size_per_lcu, 1);
>> +    fb_tlb_db_ctrl_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) * num_cu_in_width;
>> +    fb_llb_sao_ctrl_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) *
>> num_cu_in_height_pipe;
>> +    fb_llb_sao_ctrl_size = fb_llb_sao_ctrl_size * num_vpp_pipes_enc;
>> +    fb_tlb_sao_ctrl_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) * num_cu_in_width;
>> +
>> +    size_per_lcu = ((1 << (log2_lcu_size - 3)) + 1);
>> +    fe_tlb_size = calc_fe_tlb_size(size_per_lcu, is_ten_bit);
>> +    fb_tlb_db_luma_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) * num_cu_in_width;
>> +
>> +    size_per_lcu = (2 * ((1 << (log2_lcu_size - 4)) + 1));
>> +    fe_tlb_size = calc_fe_tlb_size(size_per_lcu, is_ten_bit);
>> +    fb_tlb_db_chroma_size = ALIGN(fe_tlb_size, DMA_ALIGNMENT) * num_cu_in_width;
>> +
>> +    fb_llb_sao_luma_size = BUFFER_ALIGNMENT_256_BYTES * num_vpp_pipes_enc;
>> +    fb_llb_sao_chroma_size = BUFFER_ALIGNMENT_256_BYTES * num_vpp_pipes_enc;
>> +    fb_tlb_sao_luma_size = BUFFER_ALIGNMENT_256_BYTES;
>> +    fb_tlb_sao_chroma_size = BUFFER_ALIGNMENT_256_BYTES;
>> +    fb_lb_top_sdc_size = ALIGN((fe_sdc_data_per_block * (frame_width_coded >>
>> 5)),
>> +                   DMA_ALIGNMENT);
>> +    fb_lb_se_ctrl_size = ALIGN((se_ctrl_data_per_block * (frame_width_coded
>> >> 5)),
>> +                   DMA_ALIGNMENT);
> 
> On the one hand lots of variables.
> 
> On the other hand I think the code is more readable with assigned names instead
> of a big morass of return ALIGN(stuff) + ALIGN(other stuff).

Good to know its better now interms of readability.

> 
> Anyway I think you can reduce this enormomous variable list by at lest two.
> 
> u32 fe_sdc_data_per_block = 16, se_ctrl_data_per_block = 2020;
> ->
> #define FE_SDC_DATA_PER_BLOCK    16
> #define SE_CTRL_DATA_PER_BLOCK    2020
> 

Ack

Regards,
Vikash

