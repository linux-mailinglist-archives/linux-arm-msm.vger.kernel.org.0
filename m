Return-Path: <linux-arm-msm+bounces-75288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEAEBA31CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 11:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F3FD18869BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 09:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C56266B41;
	Fri, 26 Sep 2025 09:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YszUB8Ko"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68AA1DDDD
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 09:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758878442; cv=none; b=r/IJl1Bq9LHdYxjZaHA5kK16SMAHBr0FBCg3I5Mxv0euqP9ufo0nPWqPCe0VZ9ivB/0paLevo7FxMzifFz93Nki5Y9SUu0xg1j/BqcM8PZAiOLk0Ver9NBB6bKIbMcDPJp+8R5CYtkr/L1ujRJ7nxgSmV01lbp0BC4NFmzsTBUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758878442; c=relaxed/simple;
	bh=FFLhJlGbweJau3CWZze0Dpw9OjhVRBCsdhDY0ijmLSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FbG/PAT1dzk2BcaT+hV/ksI3rYYMhCkudMkZlGglCRQoLvtg2LufbdKoLLAOpn6uvhFKbUVFZTi5HNr7QTFYF7evo1kd9glRMonrCxFZQWbYqlEzhc+b4jjzO6ogZG/GXWu64Tq8lXSL+Ck6uFGDBIlRd+84EisWjDNunSUvanM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YszUB8Ko; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vZNm020692
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 09:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lFu/WjwzIa456FPHcfJQDUYZ+72FnaVpv0Jr0vDGqFA=; b=YszUB8KoVynIXOrV
	KQtjRSDsqYGCYWYsCLIP1VTCczDIVIjLmuGO0A+Uud/X/3BHAvMg5mOtUFhod7fa
	BygBv7bFIp/xwgfZyhmr9PWTf/yMTx06rbUYQYkRlw73f2/BdPLRXg+H4x3Xscuj
	psax0GLS+N1ejvavBRDqeL5YcVC15bT1y6mDhxuUbS8vLlOPdRF2YbyZo39PzL9/
	hhZO+DnnQSfF46R+bsrN7/NLWCEgVsDagR+aVTFaXLq7VnZSRfAEAchEUw+YgcU8
	+rB5ZWj2MBvdOK+nwx7PCIaVZ204lLWaXEWKmkFs0rgcsgNJMYAVLp1x3GGuY6CS
	9jokiw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qt8x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 09:20:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-25bdf8126ceso34235815ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 02:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758878439; x=1759483239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFu/WjwzIa456FPHcfJQDUYZ+72FnaVpv0Jr0vDGqFA=;
        b=J3ZgjPBQXealRfTFOHhyIbRMIIWa0oDmCmIWoi2tJJsXRB/0ujFnJwifOwp0rorkRI
         EJlV962dQRVBqE9cw+lRpYdUxmwvKBU6U7T/CHfGu3QNx6rsETpD3pWhbS/XyYrD/A0K
         qyQhJRTozA0WEKtt3B8wO77sNTl2xdzCKoUjhV/vdOcL2iUOuSEKsskUvVhXSl+h7A34
         6NkbgwSUm9U2xeIl4eudoxSc8xjqx52YFe2PNyXTVKn2z6PziIPLHyMnigzExB/XH6f8
         9oxwnMBgxzC/BEUXBEdYWQKmTDHYx8QTclfgE9KimEbExQqObK5ob1BjjhnFX+L88fDo
         GoPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+YzDZpkt85f0onGlMrewWhlS6R3KWY8yiDsi5N3yI6YwKO4uC4TvK6lrsD3bcksBOBmr7vA9tzePt7XyX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Yh0k8PSDX8nocS0phWaIhavhVsx+0XPicy2wyht1eRKcW/yv
	2EFq+A9BHP7Hbmku0BJnMgAQsXM8ignQC2iaEmHIJKSiFXuEZZQ7YVOpNQTWsNn2HNXf/uj90j8
	L2p11cGJeZSP+RMNZBSMQByCVo+Q86uM3lgDL8aKWZ2PRz/xU+w5K+c6v0GfkRgY/2hp+
X-Gm-Gg: ASbGncu36t79ynLQLdHIu+0FvgDEYLPwIzDPA8s6KsImHhG6Y4QY/UpCNDlBtZNokKf
	wgoG4BHrDH6a6M7WHO489BuwxswaSrO7GydeEVX/Mg8gjMJ2DcSvflu+M6K1f3V9lN2YBNfwtaW
	auNCGjfWTJP5g5t4i3ja3gY+gzxWJ9osgLQ4BtbYTabkpkFYORAuxFNTIY+mhgZhgr3zsWT5XO3
	7w2jSa36ayq1396/kdV5ejqiYLwNICrXpftEkOC2FKP/w80ITaQWOhut1TGx1nih1JgJgm1knMv
	+WZylFKv9rnVhSmC6J6xYoMjvS4JHwrsV7iZqNOzFktkoOi1+MDzcMhdUJ9TnzR6VWJt
X-Received: by 2002:a17:903:986:b0:26c:9b12:2b6f with SMTP id d9443c01a7336-27ed49b85camr71575745ad.3.1758878439224;
        Fri, 26 Sep 2025 02:20:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7rrW7nDK+DSsZ1+iAO+YYBObXr6q47Vhq5ZpJ+PYNdGMhbv2C4q/3UQ6WknVUYLqfgBU/xA==
X-Received: by 2002:a17:903:986:b0:26c:9b12:2b6f with SMTP id d9443c01a7336-27ed49b85camr71575355ad.3.1758878438738;
        Fri, 26 Sep 2025 02:20:38 -0700 (PDT)
Received: from [10.217.216.188] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed672aa0asm49116955ad.62.2025.09.26.02.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 02:20:38 -0700 (PDT)
Message-ID: <2e862560-c422-427e-bace-4199b86d3e6d@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 14:50:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] clk: qcom: videocc-sm8750: Add video clock
 controller driver for SM8750
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
 <20250829-sm8750-videocc-v2-v2-3-4517a5300e41@oss.qualcomm.com>
 <503e1fde-39ea-4107-947b-18b705f2bc51@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <503e1fde-39ea-4107-947b-18b705f2bc51@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0ZMoV55FO7mDax2V9Azvz9nqRcpv54Gl
X-Proofpoint-ORIG-GUID: 0ZMoV55FO7mDax2V9Azvz9nqRcpv54Gl
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d65ae8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=TyDm9B-wxu7uxzFpS6AA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX2tfLBPELJNn0
 92w3W6zyTtZya/f2jRpnN4HhYuNF+4ZyQFZZnG9mcBCIY3iytwi8/5Wb1dOWCbtLdYlbzZBcYAQ
 1v9eTIG27Lh9AyqkyvFZrkr+C/9Gdib0/xcbt57K+iQKKqMYbN10uVRqyzOYsoZ0GcC12fy+kO3
 LiYGHeAeGKQFLCd4VE8Wqn0VADvQRjpD31tGN05QY9ldSARAxmnoIco0hf9eO8P+rnQQKJ68xU7
 Z6S5fQuWfLoGwu8NLUn+VNYfqxDKgSjvDrJJkBTSI1lVu2vWAWMldrpIwTAn+900MQ9kiJ/OJwT
 k56rJH5u8jHQzWsXxLN/aMQmPEiQ8JxRXxQvxg5t/JpZs+2omS89Puz9xZsYgKusIobJ4zXy3QR
 9hluQ+4qs5XO7j0kUjGMYO5XtzhoaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171



On 9/12/2025 4:38 PM, Konrad Dybcio wrote:
> On 8/29/25 12:15 PM, Taniya Das wrote:
>> Add support for the video clock controller for video clients to be able
>> to request for videocc clocks on SM8750 platform.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static int video_cc_sm8750_probe(struct platform_device *pdev)
>> +{
>> +	struct regmap *regmap;
>> +	int ret;
>> +
>> +	ret = devm_pm_runtime_enable(&pdev->dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = pm_runtime_resume_and_get(&pdev->dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	regmap = qcom_cc_map(pdev, &video_cc_sm8750_desc);
>> +	if (IS_ERR(regmap)) {
>> +		pm_runtime_put(&pdev->dev);
>> +		return PTR_ERR(regmap);
>> +	}
>> +
>> +	clk_taycan_elu_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
>> +
>> +	/* Update DLY_ACCU_RED_SHIFTER_DONE to 0xF for mvs0, mvs0c */
>> +	regmap_update_bits(regmap, 0x8074, 0x1e00000, 0x1e00000);
> 
> regmap_update_bits(..., GENMASK(x, y) /* full field width */, 0xf)

Sure, Konrad, will update the change.

> 
> would be easier for the next person to check against docs in case this
> needs to ever change or be validated
>> +	regmap_update_bits(regmap, 0x8040, 0x1e00000, 0x1e00000);
>> +
>> +	regmap_update_bits(regmap, 0x9f24, BIT(0), BIT(0));
> 
> The register description mentions a ticket which I believe says this
> is not necessary in production hardware
> 

It is required on production hardware as well.

>> +
>> +	/*
>> +	 * Keep clocks always enabled:
>> +	 *	video_cc_ahb_clk
>> +	 *	video_cc_sleep_clk
>> +	 *	video_cc_xo_clk
>> +	 */
>> +	regmap_update_bits(regmap, 0x80a4, BIT(0), BIT(0));
>> +	regmap_update_bits(regmap, 0x80f8, BIT(0), BIT(0));
>> +	regmap_update_bits(regmap, 0x80d4, BIT(0), BIT(0));
> 
> Please use the new _desc infra
> 
> Konrad

Yes, will migrate to use the _desc infra.

-- 
Thanks,
Taniya Das


