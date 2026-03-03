Return-Path: <linux-arm-msm+bounces-95194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMhOMi0tp2mbfgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 19:49:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 440C21F575C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 19:49:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AECBF3021D32
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 18:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698B849250E;
	Tue,  3 Mar 2026 18:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XSb3zBBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ewVmjMQ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246473D6CB5
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 18:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772563750; cv=none; b=jTVG/V3+pdfxP8oNONhsuTMqEUFBjhnLZu0GIs14+nB6h7c8xja4SY0vpJhLeNKrl/EjutMWCOp2vlLEwPzp1g3R5uJplznYAPzXq/96tMS5+NuzZ9hNgKmXuN3/IVsompX4b1tw8U8jOlKnrTLN1HmTYWSSnB3CcvDN6+55Rzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772563750; c=relaxed/simple;
	bh=+YCHZthXzXferOAYmuw1oAFs0k8y0dUN8O4oTXBLz4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJByu2uYf9GP8yJQ15oNEGXVi2/rr+SnDHyNcvPZmZDx7zybJuJOl2JK2Ym5+myqWlW5muzm7tni45Wl89gvJYTmxSjppEPRHUR+QIXabFAsf2EV6BjJTv3N4Q9siEnOt26/Sjv8UMutjL6YvQn0o6LsHROaaosRgoPNkJZTJ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XSb3zBBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ewVmjMQ1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0R553669958
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 18:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i00w6JYppMDGe8px09NxESnkQORu5ngL847U9vrSgKg=; b=XSb3zBBRLGvsPltX
	KITAC+6l8F8e4K5i41hygfyDR8/STImJdseZDQ2lDNOQOe4P/UaqF+p8HSXHoxFN
	5JABDk9/26hJOolg0w0lVsP2iH9Ed7yEhy7mFh2ZRLjZWGSgzc9EiG2aMNmeYd30
	+QuovYiPmAiK5Om9oKNxYXY1qpiF1H7k8RWHOxWFyGLWJDiFHt8eovtxk7GdexE4
	PMPdTYKV/vq/OWaptUJ5zTbxRLB/Y/eLpl60jyR5+soPRfZiLa9Unp7b6Dj5UKpx
	C9RualGYhzge+4VVJF4nKxyojpJDsC12NndMGLuevk0NNjwGuf62A1qrpO8TbGW3
	IaMuIA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnswe2hv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 18:49:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35449510446so5604048a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 10:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772563748; x=1773168548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i00w6JYppMDGe8px09NxESnkQORu5ngL847U9vrSgKg=;
        b=ewVmjMQ1KRKNL0RY0d+qs5DrG8h50EiR5ziZDv5OqNQvLOHzS8e4uBF+mvfJYQHtoo
         nkhtzBO61p77KA8IRlLQ4XJtp2cS9geLWqbUEEqXvwUAbyphIBbAcTQsUDLBGm37Qj58
         yskfhvLyRONT5X5kxRw+elC4xSsHt3X0jPOxWAIkCeIIpS880b5e8q/tOVvSOhaJnTi9
         WpcPas5C4/IJ7iNZ+c511FndAFkkYZxgjV9HF5N7N3da1kyk1y20hwwxctLRJVFLqPW7
         WJ46Kod9IkZdiaPfL/C5G5wEh2cl+B9StiaYyGIUEtRNup1khhjY3TrX+MgV1kMTjY+x
         gjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772563748; x=1773168548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i00w6JYppMDGe8px09NxESnkQORu5ngL847U9vrSgKg=;
        b=hsUWGJKsy3BWozasTWDz4V2oEydoE8yoBzBUynZHqp2KkqsGC0ps6mfbnFREKBJLEd
         lhuA6sjPNMhDHIffCt0YUwaTAgfaKvIFGDOpFgLDtBCm4A0PXJLwJMHU+WyzZF6SXKMI
         FvaeLXj+soTCXuNMaUdCi5BngKIglxBRPmxf+9l7DGJuNKS4cjUAW4UaQ669GebI3Wiq
         wha8pg8oyQKxCo2elkA/CLPMsS+egpy0dNN5/3tupTnUrbVhuvqL9TYezW8ARlPgMHsL
         x7CL1XYBJrF4H7NXtp37XSxfEbzqTV5JM0nO9l6tT6EtPJmMjAlCRNMFoPl/gWwj6kxI
         KFZA==
X-Forwarded-Encrypted: i=1; AJvYcCWVqPF8nneHQeJNABRQd5pZKXk004W/8ilsQb4kgdSrbqtLmjpc54TlfaY09d5zIz4FpQn47t64S7I1oHBG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1IS8ytJZxi0uHcswU4LI+am87vFHUI2a66AG2UztmfvN4Co9v
	0fornQG3hn4DPDJFWuCkvMPaZwx8yeUTPKHCrzZEzJ9e6NNK1APf00cgrmgeSKF/Qn12/5a2URF
	wszAbCIPhSzuV0zNvprqX8sp1aL79kzyawuNBWdRauWk5WWiR3P2hVTbnALs9ZIsMM9ao
X-Gm-Gg: ATEYQzw/yWkQv7yD81ZVOV9L0bMwGubkzTwh7uCtSKMAp8ZqkPpJVAuzR/lXFuIISmq
	RYWy1ORnceBsWr1c0ysc9imF0UMl62bhNZzhq4++6q+hU7ZhhhKvWTVfTaT1WObUNUOBDMLIzlr
	bRjRa5ZLKjGteA8esuJiyXDuta6I/Vx1qEqL1brORPmrU6xq9HTWPwC6Ofga842/wkY7weve2Qw
	4sxu+UMly4Gnn7HIG9OHi1WH1/2uUzc9LjbbYkSqm5P9zsmWIV5y+qa48IYF/vifu1SnsvbWYSa
	f+Zkl2yas7P+ptA9PS29+x6eaoYCp/MT7F9wKzJiL/QKS1lN3Gq4ZxppZDggQ+FTCq2Ta3cpJIv
	uc4XHfj0/vcFu+6awfSPJsJjH9BcT4iENlj7BH1b+b/eQgcDiGnyshzU=
X-Received: by 2002:a17:90b:5847:b0:340:bb64:c5e with SMTP id 98e67ed59e1d1-35965c34e76mr16015874a91.14.1772563747540;
        Tue, 03 Mar 2026 10:49:07 -0800 (PST)
X-Received: by 2002:a17:90b:5847:b0:340:bb64:c5e with SMTP id 98e67ed59e1d1-35965c34e76mr16015837a91.14.1772563746967;
        Tue, 03 Mar 2026 10:49:06 -0800 (PST)
Received: from [192.168.0.172] ([49.205.248.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4083a1sm2897718a91.6.2026.03.03.10.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 10:49:06 -0800 (PST)
Message-ID: <ce80e60e-90ca-415d-83af-4fe2e86ffd91@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 00:18:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] media: iris: add iris4 specific H265 line buffer
 calculation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-6-850043ac3933@oss.qualcomm.com>
 <cbwz5wtd55enswdi2zvvy3d66nsxlemyzdypheibvljnewmkax@kybx63aveepn>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <cbwz5wtd55enswdi2zvvy3d66nsxlemyzdypheibvljnewmkax@kybx63aveepn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vVSHhMuhhCgDTkX8EgP5Ktdd0Zlg1JIa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE1MSBTYWx0ZWRfXzGIos416BmM7
 nHhGp8Fk1j+Es3Hg1jYYDz/FnthrzspH9nUQL4vVmCTXNYOEaGu5nPaLU5Rid0AjzsqcI9Yhgh1
 G4PuyU7L2lGCrK6kPJ/tDvy30SZl/dK5fzA6kpbE+HohRMupE5q4/MRlOqyoVBVYU63o0+/7i5f
 c75Z5449GIZoEpSSzCLC4pl07SgieIuw9qF0Fs3hitJCyZNryoxLh/T3EHbUWDW1xpfbgX04cLq
 Kkqn9HY9eU/jkrVJAT4EldU2/d274jrD2XFdS4lktkmXNz6AnhDZva2qkHUFbqK7Uz6qnsNPFfv
 d2QvJ+en47JOqHquJzueVwKF4wRMCBX58cP06m1zjD2G36cYrfWNn6AIcE0orHHRWwkwobzo43Z
 /nsfcU12TSxC+iabCbvqg8B+0UicnsNYjJlMmpacBfH2iYPhiMxTNFuY2Za6Wat8eKqZMmSQpjc
 aDfZFtNPu/aotsMrdsQ==
X-Authority-Analysis: v=2.4 cv=TtHrRTXh c=1 sm=1 tr=0 ts=69a72d24 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=KPiuay1jFzAquJblYynD6w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hv41YOXH2Fg2t9TqYk4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: vVSHhMuhhCgDTkX8EgP5Ktdd0Zlg1JIa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030151
X-Rspamd-Queue-Id: 440C21F575C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95194-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 2/28/2026 1:58 AM, Dmitry Baryshkov wrote:
> On Fri, Feb 27, 2026 at 07:41:22PM +0530, Vikash Garodia wrote:
>> The H265 decoder line buffer size calculation for iris4 (VPU4) was
>> previously reusing the iris3 formula. While this works for most
>> resolutions, certain configurations require a larger buffer size on
>> iris4, causing firmware errors during decode. This resolves firmware
>> failures seen with specific test vectors on kaanapali (iris4), and fixes
>> the following failing fluster tests
>> - PICSIZE_C_Bossen_1
>> - WPP_E_ericsson_MAIN_2
> 
> This reminds me of the commit fixing SC7280 support. Should SC7280 or
> all VPU2.0 platforms also use separate formula?
> 
for vpu2, there is already a separate formula

>>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 51 +++++++++++++++++++++-
>>   1 file changed, 50 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> index 9270422c16019ba658ee8813940cb9110ad030a1..a4d599c49ce9052b609b9cedf65f669ba78b5407 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> @@ -1755,6 +1755,55 @@ static u32 hfi_vpu4x_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yu
>>   	return lb_size + dpb_obp_size;
>>   }
>>   
>> +static u32 hfi_vpu4x_buffer_line_h265d(u32 frame_width, u32 frame_height, bool is_opb,
>> +				       u32 num_vpp_pipes)
>> +{
>> +	u32 num_lcu_per_pipe, fe_left_lb, se_left_lb, vsp_left_lb, top_lb, qp_size,
>> +	    dpb_obp = 0, lcu_size = 16;
>> +
>> +	num_lcu_per_pipe = (DIV_ROUND_UP(frame_height, lcu_size) / num_vpp_pipes) +
>> +			   (DIV_ROUND_UP(frame_height, lcu_size) % num_vpp_pipes);
>> +
>> +	fe_left_lb = ALIGN((DMA_ALIGNMENT * num_lcu_per_pipe), DMA_ALIGNMENT) *
>> +				FE_LFT_CTRL_LINE_NUMBERS;
>> +	fe_left_lb += ALIGN((DMA_ALIGNMENT * 2 * num_lcu_per_pipe), DMA_ALIGNMENT) *
>> +				FE_LFT_DB_DATA_LINE_NUMBERS;
>> +	fe_left_lb += ALIGN((DMA_ALIGNMENT * num_lcu_per_pipe), DMA_ALIGNMENT);
>> +	fe_left_lb += ALIGN((DMA_ALIGNMENT * 2 * num_lcu_per_pipe), DMA_ALIGNMENT);
>> +	fe_left_lb += ALIGN((DMA_ALIGNMENT * 8 * num_lcu_per_pipe), DMA_ALIGNMENT) *
>> +				FE_LFT_LR_DATA_LINE_NUMBERS;
>> +
>> +	if (is_opb)
>> +		dpb_obp = size_dpb_opb(frame_height, lcu_size) * num_vpp_pipes;
>> +
>> +	se_left_lb = max_t(u32, (ALIGN(frame_height, BUFFER_ALIGNMENT_16_BYTES) >> 3) *
>> +				MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE,
>> +				max_t(u32, (ALIGN(frame_height, BUFFER_ALIGNMENT_32_BYTES) >> 3) *
>> +				MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE,
>> +				(ALIGN(frame_height, BUFFER_ALIGNMENT_64_BYTES) >> 3) *
>> +				MAX_SE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE));
>> +
>> +	vsp_left_lb = ALIGN(DIV_ROUND_UP(frame_height, BUFFER_ALIGNMENT_64_BYTES) *
>> +				H265_NUM_TILE_ROW, DMA_ALIGNMENT);
>> +
>> +	top_lb = ALIGN((DMA_ALIGNMENT * DIV_ROUND_UP(frame_width, lcu_size)), DMA_ALIGNMENT) *
>> +				FE_TOP_CTRL_LINE_NUMBERS;
>> +	top_lb += ALIGN(DMA_ALIGNMENT * 2 * DIV_ROUND_UP(frame_width, lcu_size), DMA_ALIGNMENT) *
>> +				FE_TOP_DATA_LUMA_LINE_NUMBERS;
>> +	top_lb += ALIGN(DMA_ALIGNMENT * 2 * (DIV_ROUND_UP(frame_width, lcu_size) + 1),
>> +			DMA_ALIGNMENT) * FE_TOP_DATA_CHROMA_LINE_NUMBERS;
>> +	top_lb += ALIGN(ALIGN(frame_width, BUFFER_ALIGNMENT_64_BYTES) * 2, DMA_ALIGNMENT);
>> +	top_lb += ALIGN(ALIGN(frame_width, BUFFER_ALIGNMENT_64_BYTES) * 6, DMA_ALIGNMENT);
>> +	top_lb += size_h265d_lb_vsp_top(frame_width, frame_height);
>> +
>> +	qp_size = size_h265d_qp(frame_width, frame_height);
>> +
>> +	return ((ALIGN(dpb_obp, DMA_ALIGNMENT) + ALIGN(se_left_lb, DMA_ALIGNMENT) +
>> +		ALIGN(vsp_left_lb, DMA_ALIGNMENT)) * num_vpp_pipes) +
>> +		ALIGN(fe_left_lb, DMA_ALIGNMENT) + ALIGN(top_lb, DMA_ALIGNMENT) +
>> +		ALIGN(qp_size, DMA_ALIGNMENT);
>> +}
>> +
>>   static u32 iris_vpu4x_dec_line_size(struct iris_inst *inst)
>>   {
>>   	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
>> @@ -1770,7 +1819,7 @@ static u32 iris_vpu4x_dec_line_size(struct iris_inst *inst)
>>   	if (inst->codec == V4L2_PIX_FMT_H264)
>>   		return hfi_buffer_line_h264d(width, height, is_opb, num_vpp_pipes);
>>   	else if (inst->codec == V4L2_PIX_FMT_HEVC)
>> -		return hfi_buffer_line_h265d(width, height, is_opb, num_vpp_pipes);
>> +		return hfi_vpu4x_buffer_line_h265d(width, height, is_opb, num_vpp_pipes);
>>   	else if (inst->codec == V4L2_PIX_FMT_VP9)
>>   		return hfi_vpu4x_buffer_line_vp9d(width, height, out_min_count, is_opb,
>>   						  num_vpp_pipes);
>>
>> -- 
>> 2.34.1
>>
> 


