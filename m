Return-Path: <linux-arm-msm+bounces-89751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF895D3BD94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 03:43:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48B89302C8DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 02:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81AE62750E6;
	Tue, 20 Jan 2026 02:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WSvofj2G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CgJB4cPW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE251F8BD6
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 02:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768877034; cv=none; b=CBNrlScCwRdf1YxXxrNxyGH5UmKzxt+g7OmfXuTEMmMTgpvMw/zX9NgxUuLR4ESSrw8PUpfxV3J0e5BJCffxRhM0hSlQx8XFG2hENKnH+mAXuE3MOfrQBlZ6qK0nopjXGF31NAtyX8tRAJ3jjQjhKChFmeU5oZFpi6K7KXKGZCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768877034; c=relaxed/simple;
	bh=nuUeT7gQlkRoba8PY7o/3+JBn/7v3Dz02pM/gPiGE3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YrDjW0SIAP3Qmx3o/47A8F7Z8MEsFHRCZhAax4eoVZjbGfQ2xrGFMp8N55dOZ8OxMSOn6/vaFHWsgE3ervygglb5IlREqjS+5lM41vivm+xV9sDeiEM9J+mjgT9RphN4cA+DU1Lj7p6rhD7PogEDjBXIKs4SlLMPYbIpe5NbTco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WSvofj2G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CgJB4cPW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JDd5Fx1347301
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 02:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NRl6Sa+ZwZHRuOm1+JnhJZ4n5H6tSZyrGahUYzTc84k=; b=WSvofj2Ghfai1Lkw
	n/ekCft7017zUBHDfVGYjif8awVgXqrqhsEU0L1Kj1C2m6jjfd++qfyXeZjPwKEy
	yDXRmp1osxY1dxsB0joR1aNWiPGJMA7wfdi5dE+6VSIaUdzXFCl/tiNg1MtvcSO8
	6u8pRPYhRVpjHaPBjDzeygdoNSPzDL9ourbsHugbo/KsPfhmKHERcXRsqkqGVf2E
	3/H11PBbezN0yd0gLNIkHMIKbor9cryQ0fT1wLXesmS86xyQe5r8ybS81bOddA3p
	snpL9YvgB6TTUWziPGpNMHl4VGIHwVsBl4E0buhBSOOqp+hpQjC1hlFiNMHp0ABp
	Xu8yxQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsnpdhm45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 02:43:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c5659f40515so8129584a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 18:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768877031; x=1769481831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRl6Sa+ZwZHRuOm1+JnhJZ4n5H6tSZyrGahUYzTc84k=;
        b=CgJB4cPW8JUr8ow44S7vUtZamHaSjWa9Sy2WOzkISNoxx1KG+OV/37Uyz42lUO2Jjh
         hvYmFPi7tUFDFTbrr/ChICFHu/03zE8glQa9518762Yo17sy8MKjmUxy1EPG7owbiwM1
         ZDszthVU4WPS1dFXolVYBmyOzy2Fz3LhjKyr1kjc+vJe5FK3P9n77zh/aJ7ZoVdx4Tgn
         PO1C47K0KBONdLL8BCQkwQuhH+vB6V0zvsB8z0ZERn96msuDu1nExEms1CHf01fKAC03
         Gh2brc8iYsfLfm3AQ3Lr/mTTYBucPWto4xccbx210LerofAK8lDpBEEtGQSRAOOwGsU+
         0Ykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768877031; x=1769481831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NRl6Sa+ZwZHRuOm1+JnhJZ4n5H6tSZyrGahUYzTc84k=;
        b=DtiDvxnGgjrks4clJRuDa41nQ6pIhfs9GCRYKfZNZqmCKhzDHp4xqrYIXjXVZBjqCv
         G7P1/rJdNd/d9XyGnZETng8+3FUirc3yTMacAuVgrwZDBy/gSyBp9B2c+cazylARktXY
         Ytu/49L795HZBiNziEZx0VkNaXHQaV59uGj+Sv+q3W87c84POHdkinlsxqpn2JkyEkTV
         c4HLS4h4Fs2QwOfTK/K04M/a1ojxSmL64Wq+JBHq9pLj53pxyfvI5qTxBh6TWWEH8WKd
         VGYbk66QRUc3P/Bxsjdc1xXoV+jTEfGqERqzz/TqL0NRIPERFO/HY3iV2A2Eh6jh/DjG
         syvA==
X-Forwarded-Encrypted: i=1; AJvYcCXl+zgA8H72BqQAWgul4Nrc1N3ujKqu8DI5cHXroBL86IFaR6VDQmbfewUo1XxRIeujy7gsBe3pKVvnYr/3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvn2gn2HMCjlCzoycBU8ClZInYLlIXBrxICNH/HNp6urEdQUun
	YJrmbY4S0NWlPwX0YyNi3zb50Wl8klqSZku6+2ed63Y7CuXyedXxvjOScgswy8P5J932/vDLf3Y
	htyNJAxtIwuoyOp+ryeKXN0j4DhRBVeCbit3nZR1iWpjX8dfGL2l3dw1mvB9AIAl4OuXl
X-Gm-Gg: AY/fxX4o3S4f4C3YHxb32zKQf2ofiHq2nZzYRbyI71NQWztYU9hNc7d1QLxhPQfuJIY
	JvAYVYGRJtH9p3XCsO8v8FWjLlTAlGqQIKA8tjA3Rbz0MzHbhCqUC5Z+1J7VNMAg7FJRLcMKM7y
	pLnYvvtvGdEcq7JqkpejkE6abXnOAiXCImF+mtdNJbrAQDEwfmpBf9+xk2g4lMDXOj3Co515ta9
	0eUsFeSggGoDoFTZj1PQoU/e/noKa4V19X3fAjvd9+K+UAWNC/Szj02H6QY+9e8nIYZ3PR8fPrZ
	MMUX8yEZ4L96VQ/Qo2CjAlI7cjUkXuorrLRrhsmSqjmTcruXUduPm6qcHUsPlm5WSYXAeWothF4
	Dbj9xawoioGXw5yei2MKGD73lYZUwz34sdqszyU49NjhLr5inMjpwF5KS/cxEV97Bih7qkGxahs
	zFQZjM
X-Received: by 2002:a05:6a21:6f01:b0:2b1:c9dc:6da0 with SMTP id adf61e73a8af0-38e45e40609mr460455637.46.1768877031043;
        Mon, 19 Jan 2026 18:43:51 -0800 (PST)
X-Received: by 2002:a05:6a21:6f01:b0:2b1:c9dc:6da0 with SMTP id adf61e73a8af0-38e45e40609mr460438637.46.1768877030477;
        Mon, 19 Jan 2026 18:43:50 -0800 (PST)
Received: from [10.133.33.57] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf395851sm10323294a12.36.2026.01.19.18.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 18:43:50 -0800 (PST)
Message-ID: <749e716e-a6cb-4adb-8ffc-0d6f4c6d56c4@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 10:43:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dp: Correct LeMans/Monaco DP phy
 Swing/Emphasis setting
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260119-klm_dpphy-v2-1-52252190940b@oss.qualcomm.com>
 <47skckagggxijdhinmmibtrd3dydixtj6pccrgjwyczs7bj2te@2rq2iprmzvyf>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <47skckagggxijdhinmmibtrd3dydixtj6pccrgjwyczs7bj2te@2rq2iprmzvyf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NtncssdJ c=1 sm=1 tr=0 ts=696eebe8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=GPqq8a5sn0nJmRmufXgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: yq1iHYqw3lATesRXJb8NeQ6Ays0_JW2P
X-Proofpoint-ORIG-GUID: yq1iHYqw3lATesRXJb8NeQ6Ays0_JW2P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDAyMSBTYWx0ZWRfX9SoX14ZKBW+v
 v4vF/Q/7o3uNZuVgona/sFB1g7kbHtTnfZgdxTxM1jqImfb+Wx7HyK9xLb/rwAnRU/It0LzI4nF
 XEr1snHc42S7Kwy8shGU1wrjRCQYr9rlNVhca4FWBRhP2DBP96/BpXD/em2irpV2vyTuWTYyLmr
 6rUA7Q6ImukEZyY/o/xlVF4oz1gr669Ri2g0AfexaMWP8FqHUO8kZh5osG8vjzwv9gNx5il4Xfi
 kZZVBziMaSOpJdLN5khrCDXGRIgiC9T+oqC1Igfn4scn+uyPrlDBvpEPo59SzlsrU1oMeRtqd7O
 5z5hJllGy5YhmcRDe2gwwBqtl4KTbZCkbJ1DkzhF5OB6PF9gEEJVm4oCH7fXYBExy6MpeznSfs+
 sb1y6DWUt1slD8wZpVVCGKRQF8FZmtKGulZRgs85hTSrJFDiaNxprXDeT2xVwMT+ZH0Lpn0rEJk
 4i24F3aYKlH5wgi4dfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200021



On 1/19/2026 8:55 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 19, 2026 at 08:37:20PM +0800, Yongxing Mou wrote:
>> Currently, the LeMans/Monaco devices and their derivative platforms
>> operate in DP mode rather than eDP mode. Per the PHY HPG, the Swing and
>> Emphasis settings need to be corrected to the proper values.
> 
> No, they need to be configured dynamically. I wrote earlier that the
> driver needs refactoring.
> 
Hi, Dmitry. I plan to submit them in this order: this patch → LDO patch 
→ refactor.
Since the refactor involves more platforms and may take some time, I’d 
like to get this patch merged first.
>>
>> This will help achieve successful link training on some dongles.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 3f12bf16213c ("phy: qcom: edp: Add support for eDP PHY on SA8775P")
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Separate the LDO change out.[Konrad][Dmitry]
>> - Modify the commit message.[Dmitry]
>> - Link to v1: https://lore.kernel.org/r/20260109-klm_dpphy-v1-1-a6b6abe382de@oss.qualcomm.com
>> ---
>>   drivers/phy/qualcomm/phy-qcom-edp.c | 23 ++++++++++++++++++++++-
>>   1 file changed, 22 insertions(+), 1 deletion(-)
>>
> 


