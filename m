Return-Path: <linux-arm-msm+bounces-66110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E82B0DEF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 16:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 346CAAC42C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217752EA177;
	Tue, 22 Jul 2025 14:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6uh+MGG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888102EACE3
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 14:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753194840; cv=none; b=JeZrCfcFaMQthr7uLP5CaNLa8XX18zxPnpDTohsyJ+MSiTVQXYNC1u7SxO/gM3aNzLOTaXxG8TJfhfRmq+Zcp+zmLKA+XKQykE2TMt+OU5aUyKi0F+ukFfaCMHqTqS4Jrtrt+VtDfhtXzK/bFAN1y/BbMugvIIn648BaaxU1Kos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753194840; c=relaxed/simple;
	bh=HnC6eudhab74S+HNC089ggQr1Wce6NWyzPqRySJv01M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LXdjUeDCUJNLIeRi/+uo205LUVHavgKLtTh8x3iRa2dWzz6785fxDtlNJoZQA6oK8kNtddnHhjim0LofuCXpU2Tg6ncjbX28AhjZayfsGbmS/NkVOn3CV0FnI67jvn/qIugd4diQ5++4/T5YJEygg/QlWFrJBBYkaXsPtLIperg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D6uh+MGG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MBLul7001068
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 14:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xtT5su/VJ7JP1pHjFV7X/fYhQ9wlxMPwqcGXpQ4560g=; b=D6uh+MGGULIyksQh
	T1z98YOrVB8kJ3nH/vaFmvUc1IfBWpz8u0xhpyshYnb99/AfS5SqUhMAYDEMLYpP
	xNUvw3lHLhJTkEfTlivMfUj3jb7mXStVBncUdBjfuZyi3fYAGnt8edcWZHdf3bQX
	MDWPWdi0BqJ8AGbFosXVtz4O5ZCBNfAweH45AbC9XYUWpf0UXJA3B89ZU6ALzcut
	UQ60GCuT/nLISw0wGWVJEfCl1gaBUrAGXPYWzGUgVXYccslegUOQNYumJ0R6+opH
	J+1m1XDDRjBKOfheJt2+x2TzW7CB2+Y7J16+DzY+25uvuyabjNe7G0NZgq9wLAi3
	anrgTw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dhm55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 14:33:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4abc1e8bd11so12490751cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753194831; x=1753799631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xtT5su/VJ7JP1pHjFV7X/fYhQ9wlxMPwqcGXpQ4560g=;
        b=p43oT/M64WaCyHZ6CKOc1bgzFao8bbJMQRH9I3qtDKpgEOfQkGdUCcPtS2jznD4tT1
         m6bc0f8BqWddnwC0pq3cBmgFOwFnRvYARufW3dLa2hjRZoVPrX/1F4jEEJ1uS8zlhYc1
         oUCieClPHrfX9WgSSkaRbCR1fPA6IDA5amOMFoCU/E+WUT2fwaRoM8TLpWfiSrH8LMs6
         IAJjZu+oTzAiXtf3ZE4a1OvYtJv3VRVDv9GkTmoPys4+uhgEismXFPMOyKE41E0d1wu5
         bWFVBfIBxvTIq76Q0yAxVNjcJtTXf/zobhRM4WU6/0TGZx42HQliRdKhtG/IHhxl97Jw
         lhxA==
X-Gm-Message-State: AOJu0YxtsXqQzYfMatOSIZErKXHHN0fnACL5zr3Rl11A97X5NWDbWS2u
	Ap5MP4qIaQvWOcYUfZjp3b5/beEogpgFRD57S/JCwdyZVDQwAYzBGwXYyngiWsTvc9rDzVUphPa
	XsK8anIdtfn+0QDRl2+sN/O8WDnoA1Dp/eIKR9bN8M4UO+qGaGrJR06HVhc67aynVyABT
X-Gm-Gg: ASbGncs1/6mzGVLtGuEQmUl9tZQGERJzrY8cK1s/QhbDta7iMZGhkhFwpKL6YrYLKU5
	JLHtw7LQtB9nTpxtDkt9eWD5yf32EjNZOCXAjpeJsUXCxf2/oNGcPISoLevumWyCivFrQ5BI1h1
	p+Nkr4mdvbxqboEeIyQxKQGBRHyBUO36c9q7+rCorV3hCx2kZGF4zJVzdvSUaaM1r5TtTIvHohS
	8elmvwhgGKEY4N8SEByWbIo1P9iqNvl5uHVUbFW6wJmgb8x09TYvHJ97NonM1yhXJkS976RtX8b
	rvbCFImb7A+ISYKJD4KUaoifN1jI9BCzNVAIOOXTIu7Ux7rkYyt6MqO3Drs+JeKGTKuTPyf/gUd
	wqnsUU8T8lRynRICeZgOF
X-Received: by 2002:a05:620a:2227:b0:7e3:2e02:4849 with SMTP id af79cd13be357-7e342b41754mr1177998685a.9.1753194829886;
        Tue, 22 Jul 2025 07:33:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU1lbhaP2WVsTXTqM7GGer/GTSGogiYRwUzlLubvQGVjS0cOplM2JT/IJ8lGgLcTomzSOXCQ==
X-Received: by 2002:a05:620a:2227:b0:7e3:2e02:4849 with SMTP id af79cd13be357-7e342b41754mr1177993285a.9.1753194828498;
        Tue, 22 Jul 2025 07:33:48 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c9075d76sm6920459a12.52.2025.07.22.07.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 07:33:47 -0700 (PDT)
Message-ID: <84a33e15-edaf-4951-8411-24b17ee5f4f5@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 16:33:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] drm/msm: a6xx: Fix gx_is_on check for a7x family
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687fa155 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=rILJP4qTGdYfNujWrMwA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: OoOtDlC1Z2OhiHBeZHeb2PcfKGDek7mE
X-Proofpoint-ORIG-GUID: OoOtDlC1Z2OhiHBeZHeb2PcfKGDek7mE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyMSBTYWx0ZWRfX1igpwW2mVVVn
 X4FigaHuluL9IL2qiuYMVI/fxDq3xQi8zI/KFIE0FdPPXot0TCCM0fT97JTudd9m9i7ojubMYex
 g+Qj1IiGtfSMka8yPZHzUkao2AtBEUJVSJW3SV3U4ptGPvEqgF6oYW2LRlOPqB2mtyqS43+OS62
 LkRb4j/Q7SrrQN0BS4s5np53gmFujxsMR+qq2d4ukmABUy47niM7eJq89I3M1MHVubGCFS0maWc
 2eLuyUbj39hd/xkLoBMM55PV3vTPdkVLfdW+TrHzUOG/te5LaqUn0WSAon2wm6OZBLW9iDRZI4j
 L9WF06HOOpyx/IwS9kuWnsARk+fCYCjF9GoaQIMa+Nc88MlSmRrXOfLd9eVSPFaRjzYYUOkncfZ
 0ejcj/jrHuGoVRijf2o2jKxGh/Wm/jokIz+VtXKMt5hEqf71CYhNfCAB/6BXNVYev3AGpS4U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220121

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> Bitfield definition for REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS register is
> different in A7XX family. Check the correct bits to see if GX is
> collapsed on A7XX series.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

This seems to have been introduced all the way back in the initial
a7xx submission downstream, so I'll assume this concerns all SKUs
and this is a relevant fixes tag:

Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

