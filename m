Return-Path: <linux-arm-msm+bounces-88511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95193D11D9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:26:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE6BB30049FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CC929D294;
	Mon, 12 Jan 2026 10:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceHXgwTf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L7HVM3o2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D689429D28A
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213582; cv=none; b=NwktfXmU8pWXjcQQs5kILisfAkYEt02ET5lcRpP8m8p0kyukrJgMWXfJkoKzLJYTQevds1UZ/EoC3k9FK7DzeXdIpjd8kRQyvFxMHcmiM2BRIlPGxKJXnM9QI6kAHhe+8FS0xPI0O8C5KrN2Oc+4A8ZiRuEcY0HlVs5vHDo7gFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213582; c=relaxed/simple;
	bh=6EssJbWqqt3dV8a6VPFy538cFm47uru3ffTb+BHy29o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kLK4pWmpjczHAmaS1t1FvnhxU87UaPERLf0529Y/9lQfBgc6Nyfdq9mxlL5oIe+U23sr7YUEoLp7+w+SFIW7YJO2JXdsEgtnUAoZYV9+NxEba+d6zFeg3yQwKQMtWTtWXTh/OVH0ce9ZLRk0V9cPRVOJFPifm5XXmeJky2w5SYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceHXgwTf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L7HVM3o2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8le5G113540
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g8lUZToudBH9q1/pg3SWxOEwPH6flUMuQV1imeaCvNw=; b=ceHXgwTfSxPGwu8n
	5XJR2oOjkbbiEiIKdNBR3DtegEykGuT4w050rRRGXa8eWTMw3hK6cy/TO70F0AVq
	I6Rbex2pzh/3s8dHgQz0UeaeZA8XMzoohzst9t/ahyDgD3DE/gv/WeSLBrfnUng6
	G8Cc6S73BT0yzuMexd35r0yNTiidQrVkNeNWy9VjD1mDZmqPJS94nKYbsi4Af0+E
	sQRQ6SWoHd/0y/c1poDZYZveilHjSHqQXN1WidSDT0+3rw607UCPzPQU0Y/0NQa5
	/dliMOZzFIWeNYA9Lm+7i1QOdZZiKmU6Qs7wpdrDNGDDYPU0R8eaS/7PumVOtNaI
	K1MbNg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmr4uhc9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:26:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7f89d880668so4919173b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768213579; x=1768818379; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g8lUZToudBH9q1/pg3SWxOEwPH6flUMuQV1imeaCvNw=;
        b=L7HVM3o2fNuwOlFIhlY+zEnC0NhAzriDldlO1UdaqiClwz3Bb/YwJUtDZeXN2Sh5kL
         FhO+Q7g/NAJij4MwRaTWUC8+xFkbhpEd5GdYJyGysJvttD8AdIxXo28V1cWaNtG7GMBR
         oOKG7faLD/Vo1PC69bnNReymSg4oEXThyi8SBY/T+qUTlI4ahv6FaLZdwSc+Wsp5waG3
         xtv1iNVcxHZaJnXqO1LYswXm7lLCOlDm1cbLz+ah51toZqo3nW2yfgFhgNe/R57C7E3u
         Oz/1B4r6YlpN2crDZsyJh6Zes//H/r9o42HhkKKADdwR4+nRj2BiLIXGk6rBJYRI2Dzc
         t8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768213579; x=1768818379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8lUZToudBH9q1/pg3SWxOEwPH6flUMuQV1imeaCvNw=;
        b=NcLDWsKcYTvLRhBjK7PQMC5oo1JzVIN6BBPIDZSs7/1OEvGO0Gy2G8RAGm/2trpL6z
         xXSp5nJ20TKvIG0YEElJEMmCc+TGH4oUFLttMKpCORhT8R2sIh+l/qg/Kwv2t9g+aI8l
         aGPKlZCUE3XIebepnB9DUF6Zd1KxDhSjhj0Vu3nSYTY9T59uX3+TSax/G1WGgui2UR6b
         GvsjrEeHT7yQ3McHFuB3ADv/aJOYrNQdgEOgtu3pDFsLJ7gKHhjkKK2ayW9yi81iHEyY
         aGyr6I5mcjReFpKFWLmI1RHZrXq+CL1gY6TEXl90zSek3/tPE648Xh8WVt3bF4O08RJP
         x1LQ==
X-Gm-Message-State: AOJu0Yx7m/7S1dpci2P+YWJTun+kodpK954+LzmD9YXxzDF1suGB5jpE
	7fMnCN5GfIwReNWxlAd+3WazAbWN2b1mh+fdhh3RK/KPjLf+UCbgJ+EBqXBqz8XffVJ6KqbkSpL
	4aEf9qr1qBI5tNaG4KLQvr9v/XEUc3UQkQp3jRuySFYqQhjEZTQfZn4SZ7J3V0vY4Tq2q
X-Gm-Gg: AY/fxX4ZMMd4DL0roJNo21Y2RXDP52bMXZ6FcR4e9SpGl9PJvormHf8ibSKQtc2XB2/
	lbcZISGmckemF/ew5PlBc7qVFM9jV3ebQptv44iyhX0p7LpwJUovsrygBZC5ixr5Nkzbmn8oPSU
	YYTpi0/oTvbf/ZXj//LHP9yhc4gGeKmdtBV+UB9UEemFpfKd1WP3kdEmdoLeqblWIx2kEYZuOHg
	IFyYLw1VC7E3mVxshYqI6N+DOdE6FrBAKsSNlBTOVL35B86U45UnWtwY7zSMSN94JATE12rrr9g
	oPKFkt/RxX+BCKKe7KRYJJeg7W1k/JazXP4ICy5sJU+6h0CdANFpjRRuSVbFxLYmf9Fn3HaNcmL
	rgpoBJGbrvMl6myBOElvG0RNIJLwDAx4TGVa1Zw==
X-Received: by 2002:aa7:80d7:0:b0:81c:96b7:7fa7 with SMTP id d2e1a72fcca58-81c96b791bfmr10082803b3a.42.1768213579530;
        Mon, 12 Jan 2026 02:26:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGI6qx3J+uQ+5qvS5B0ynvsIyZCgYZuZrZmLW2dtC/5Po5VbaT72bNm4abYOxU/5lW7PXjRKg==
X-Received: by 2002:aa7:80d7:0:b0:81c:96b7:7fa7 with SMTP id d2e1a72fcca58-81c96b791bfmr10082793b3a.42.1768213579015;
        Mon, 12 Jan 2026 02:26:19 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e7fd708fdsm8531052b3a.65.2026.01.12.02.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 02:26:18 -0800 (PST)
Message-ID: <4ab4cf95-6ccc-4eb8-82d3-78ebb6e7930f@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 15:56:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sm8450: use RCG2 ops for DPTX1 AUX
 clock source
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260112-dp-aux-clks-v1-0-456b0c11b069@oss.qualcomm.com>
 <20260112-dp-aux-clks-v1-2-456b0c11b069@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260112-dp-aux-clks-v1-2-456b0c11b069@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4MiBTYWx0ZWRfX3dflQ/hqLwZ0
 yx6RTeztq8tteJrsTZce9sZXFyHjgJiaRpLPXWkS8/jSR06P2M5LUojXaRm+DlFBDA62aGDd6PR
 ONrkM1e2Y9LXgrD/wZl6ZU7/pYDdCBVc5EAOZSCTGfo3d1M0O3rHwXCip0ytGRVXa9SbKOkyqRC
 sK+5GZ9DZl2Nwgjhm8gjU2+LHkU+XsYkBJuHUkcnfR9AgJLDzvrhYjVEB1zNkZsKXYHkUnpqKFq
 +RRKmGRBrG4yAnRDwLBRn5hcxiiNgBLKxZxQF9E8SuD4p2+ITyJqVXsQGXag0jWhYx+72fttV78
 +PPXArrMsvvTG7QNQeKJJxcE06K3u8bIDt1NhpUCCa5KinntisUrWaNXdyjCNjo8Fq7qy9h23AB
 ULOTa3XgwHdffjHbciVnMDeuMjgS4YRydCaP/YXadUS07O7g6uzk22SGeC9KUFKQQQi7JqHDJxt
 aSbYsS3OHUqL/Nx1mvA==
X-Proofpoint-ORIG-GUID: aGocr1X0pQ_IwedwyDdmEuHNcCnKu0x6
X-Authority-Analysis: v=2.4 cv=YocChoYX c=1 sm=1 tr=0 ts=6964cc4c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FCWHNvtYXcGM2Pe_cTUA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: aGocr1X0pQ_IwedwyDdmEuHNcCnKu0x6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120082



On 1/12/2026 7:42 AM, Dmitry Baryshkov wrote:
> The clk_dp_ops are supposed to be used for DP-related clocks with a
> proper MND divier. Use standard RCG2 ops for dptx1_aux_clk_src, the same
> as all other DPTX AUX clocks in this driver.
> 
> Fixes: 16fb89f92ec4 ("clk: qcom: Add support for Display Clock Controller on SM8450")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-sm8450.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
> index 9ce9fd28e55b..2e91332dd92a 100644
> --- a/drivers/clk/qcom/dispcc-sm8450.c
> +++ b/drivers/clk/qcom/dispcc-sm8450.c
> @@ -409,7 +409,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
>  		.parent_data = disp_cc_parent_data_1,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_dp_ops,
> +		.ops = &clk_rcg2_ops,
>  	},
>  };
>  
> 

 Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


