Return-Path: <linux-arm-msm+bounces-80444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B539C35764
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 12:49:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB1303BDC7E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 11:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4577B3112C0;
	Wed,  5 Nov 2025 11:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRYe8JjT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IkvOSa7r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CE12D63E3
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 11:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762343018; cv=none; b=sr7KWmeethRyfkEET6m0XffdYZR7UoCeG7f76bMqQC68t0quCikTNbPlHuyLOqnfIEFd1LgP/s9ZiDcvugze50nk+7du4j3sbKOp8xdv3w9cx6X7TJprY09FFI8ktnfwBcfafZiG91joHFzR54SoULO6orLhU3oIiLqECOdOqfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762343018; c=relaxed/simple;
	bh=BdMm81xYZiuBh40gc0Ua6efd+2dzC13cTYSHrMpRHXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OfvZxDktiIdqE5afcxOyBSCz6FVEV1q35BNi8agRpLBc5VYiyLxxGM56quCQ7gMExFgnq79tBs63cORmNu5YTiRH7g9aMlIZMT6H5TPSBjPhRw+qyxiQJV7t5EyiGSOYOqzvuJujen0m5XV3l0Yj+vV+Tq3I1Fm6GtYfce7A4Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRYe8JjT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IkvOSa7r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A582gJN3164671
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 11:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BdMm81xYZiuBh40gc0Ua6efd+2dzC13cTYSHrMpRHXs=; b=XRYe8JjTZQm1XQ36
	tOSvxyaCtjVUS+hp0JU7p//fVMX4o814+BAQqNrsA/OAtHGZyUJBRdCsRgXMrQ92
	SWKAfVFYjftXjI1DEN7w12Hs0wqpeQuVd23XPILKiQv8XgfpcsKT6tw4arsBDu5B
	1tsyCDJ/uZLfkzHlXqZgU4RiMOPgkvSFgcWFFR3E1OHiRwXKT2RATUwViNnBrjwo
	imVZbC1C6wDZ88co3jBOqeEuuGqk1BvQC4kwmhkTFkt+P/rQs/rmxn5dkTqblIoI
	492cEHvrFBrIIbs3v1c1ApiSRId2Zb/TSg9lSTEkga3awJ28WKRKok5kWO6Q8b72
	8kh+xg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7ketke7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 11:43:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7900f597d08so6572615b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 03:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762343014; x=1762947814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BdMm81xYZiuBh40gc0Ua6efd+2dzC13cTYSHrMpRHXs=;
        b=IkvOSa7rdK/5qjP/opy4dQuLCC7xg9tY48bEIT/PGJL9k/2xkN7IxRjtWaR444rD+p
         tRwioC5M4JNfa+wQmttuPxudsPJgV0TGpEs2LkOoqZ5tLDeVe1G/dsNPckzXb5rk2QVu
         2fBtKUhJUTldzxSv9MmEUaR7DRmgzc0QxczEyMyWUhvsPZaiJfzMpElIHvlY6A+iY0EN
         sZvFlVWG1iacTXbPgGzVYsVcNCW3QZ/2yOIrwhf7Sm77hiRhymCLHd8BiQk1E3ew7PWo
         s2Z0R7Dp/Qhi1olSnPzKIoUHto4I2RCOGXaZr5/J3Pfsv6mfVbmlc/VqRTG4wvZ+9I0R
         /cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762343014; x=1762947814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BdMm81xYZiuBh40gc0Ua6efd+2dzC13cTYSHrMpRHXs=;
        b=vqgw8IjmcY6updnGUurthbl60CwUffVxmWQ5oczgm+vCseEBOxiS8HMfPJWNXTnFyz
         /vZPZCVVO3rlYD5ks4V2xsZhj6OrUeF4TQ63Eo0HTfPqeFu3fcjACyDq/vpHFtpgzWwY
         HavyNDuGj5y778/yrW8l0/QCH0c2PglJPHBwgumno8fO0R86izVyefwTSMPMsOsoSZMx
         XdE4zvYYKfULU/ioKvmgxlDC8i7U7oN/clD1Q3elYYgoZ2R2XY2e0GJ1HLJa2FO0TaFp
         k73yyGjjXeA36XghWR+PCJnMISddlCW4eBcutXDxsnS/kSfU9QSY5vc79xl+8i3rChkI
         mE/g==
X-Forwarded-Encrypted: i=1; AJvYcCWuHlYlEeOBnNU4KypNymx2mhV2FRvEyvUjIVkkofc7yzIkyHG4+3i9kc90TrwFCsqhdhRrSApCss09Nz9y@vger.kernel.org
X-Gm-Message-State: AOJu0YzhQC2QGtpQPx8b62YWVQql2ERUC91iVuFbdRE1Mkeo2RVwvHbX
	MTIzKWED6JQtSIvRjxGgUh/D/eZDfevlPve4wnMcKuoy9iN64TLURfVq9tXHkuKqRYyWuAHJD+l
	v+8qPH1ov+P39FC664vBLHkoX96tGLp6uqmiI0nZUNzeZBadCvpKVjsyVh7e87HNS3U71
X-Gm-Gg: ASbGncvNbYmT72I3439RUvMBGaDNIMdSpwzXpnXb0stx+9ytA06TtJL0dPqU7mi/ZWG
	gRQITNbiz1cV3sMK1kcwmvYhO5HUOiNoaXpYSC+dC8SbQ9LXuFZjS9qhSBznxQ/DZtt3b4/WmgG
	PC2x4uF5cRo3ZQtiTUtZBR/9oD1s/qzN5y6NFzu6MayvpcHIt0Cpn8rPJdr5gjYV++0Npiix5F1
	yQwZEMHX3Dcm5xnDfSLME8pzU81x6LAumQTl/G/p9Av96o52DqzZNYrvfDREiqps7ufZmTCLEzV
	egyfZSOCf4iiI0JszzLqJOPATP5uaiSMb6CgphM6iUICzJV5G1l24oXNg0zNOuccGs71H+fms2R
	ogkN/HoUt4ltFQspr28yBJE6REHq3a94+
X-Received: by 2002:a05:6a21:338a:b0:344:97a7:8c68 with SMTP id adf61e73a8af0-34f86114a51mr3703189637.54.1762343014262;
        Wed, 05 Nov 2025 03:43:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHq1fw6AQRlBdqYRnyUSOmKR0xWysU4bHGiCWZGyF2QQLzwtoZWe/qua4VlMjRvlHnlxSRLyw==
X-Received: by 2002:a05:6a21:338a:b0:344:97a7:8c68 with SMTP id adf61e73a8af0-34f86114a51mr3703149637.54.1762343013781;
        Wed, 05 Nov 2025 03:43:33 -0800 (PST)
Received: from [192.168.0.171] ([49.205.248.32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f765eda9sm5265961a12.18.2025.11.05.03.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 03:43:33 -0800 (PST)
Message-ID: <ba589a5d-65b8-4980-937a-29598e891dd8@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 17:13:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: iris: Refine internal buffer reconfiguration
 logic for resolution change
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Val Packett <val@packett.cool>
References: <20251105-iris-seek-fix-v3-1-279debaba37a@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251105-iris-seek-fix-v3-1-279debaba37a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA4OCBTYWx0ZWRfX9w+NQ8UP9CSW
 4pTf9xdvrgXOi5wuIhgkGnVUj6zCefglIP1yhWfMIfBFA8vYTcpo4J5HDUdbpAQxbTx+FMtXJZo
 sjDUGa94FY74wO7dKK9tLhx26gs49BFBPgsYOVBXjV4ck1qiKwsU0hbZBMLXKjZ2s9PehqvBbgh
 xRbYaJ+I+mwT/riTajS6CGGvTXUaMt84qDaw1lCJYvuhiwkfDLogvlmDQRE6bO6kbGPyvr1x8tC
 0AXSjRIG9phJnP3TEBuTocf55mwxkuepK8Krf1CW7uLRiie80LrZYXM5c8WCGX4yHPV17jSmHpY
 UYsuDqqtdi6nYmnObgw6Vc0vcFgGsiHDQOxcG4CHvickrS3f7/HZE7xUdzMak3O8eLDMZ0ppX+2
 4+BmhwLHHfmdnFrLsFZHDaVyHtBxjw==
X-Proofpoint-GUID: AxVcRTb_FQyjZfHWhgt5wK-xU3U7FJ_M
X-Authority-Analysis: v=2.4 cv=IdSKmGqa c=1 sm=1 tr=0 ts=690b3867 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=AzyGrR4UViKNxLVuAS9Z9g==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=srhs0GdQF8B2Dv3X-aYA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: AxVcRTb_FQyjZfHWhgt5wK-xU3U7FJ_M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050088

On 11/5/2025 11:17 AM, Dikshita Agarwal wrote:
> Improve the condition used to determine when input internal buffers need
> to be reconfigured during streamon on the capture port. Previously, the
> check relied on the INPUT_PAUSE sub-state, which was also being set
> during seek operations. This led to input buffers being queued multiple
> times to the firmware, causing session errors due to duplicate buffer
> submissions.
>
> This change introduces a more accurate check using the FIRST_IPSC and
> DRC sub-states to ensure that input buffer reconfiguration is triggered
> only during resolution change scenarios, such as streamoff/on on the
> capture port. This avoids duplicate buffer queuing during seek
> operations.
>
> Fixes: c1f8b2cc72ec ("media: iris: handle streamoff/on from client in dynamic resolution change")
> Cc:stable@vger.kernel.org
> Reported-by: Val Packett<val@packett.cool>
> Closes:https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4700
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>

Reviewed-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>



