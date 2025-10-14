Return-Path: <linux-arm-msm+bounces-77107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB2FBD8189
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:07:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14424422A2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 08:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70B030E84F;
	Tue, 14 Oct 2025 08:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W78OR81F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CD1301712
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760429207; cv=none; b=Q/KvZCW9tyOXJmD691oDl0TCpD+BdQA1AY6A0+nhpdDKHMRYMYs/vlH1Z8cr3p0ahZ/RQYb71OGlGOzZztAuXXdQ6bwHUl1qBqXIvZtdkTD+gG8GnFYGYl5YSt6N7RnfsPr9+kbsmkpJ7n1bWt1BIdtye9DVKEETQfKyjENcUEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760429207; c=relaxed/simple;
	bh=fVlJuu7kx11Q9Cca/sPAmXb5uL2H3gXWKoVGmvXX06I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jIPWYUF/ACsjt83h2XjOVYnKTU4Ubk0L2IDfU4WNZe3RYpSS2MrfIku8b8IcUhd88qDpcXhN5JY11q6zEOneM8k4FuQVIViowI5JjeeI6r2KkeRLtY//w2Z0GaO5V0iKKtocwpEdOTVggCSf95OYLAjSWU0UKbb7gzJmYWmrTRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W78OR81F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E6be5p016341
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7CdCQL72+wx7fzCdR3aCJ9NPHrR0L8HOD5RG5xmpUQc=; b=W78OR81FAQHK44rz
	bU9UuzuI5MFtyAHtAHZDOuBrxqcYjJgkFikU3BEOPAGu1yXMjL0mIfwoYjT15B/9
	yB/2UWZrtYgXl/arAa2i7OmJtXZ4ZdTmvfTv5bs7fpRoFkQtlgd7BhIw4eHg/aVW
	1VHhvbycrxc04AeK79gGUKjWHYQLQbLryuJ2tdjosz4B2/iHtZ+Rx93mDuqIWfBQ
	+I0FSz+utbXw2rkuyTPkf3CyftslPrKzB/1jIK9ane0DmINXNpCjvQbe4vrYczKq
	/MNBCX8mnPNRNrvskdfckj8kpnF+TCJw3xamnh9r3OuZGu2koDsqobp2/Lq0pkQm
	vOHJvg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1ac09c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:06:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b471737e673so11976363a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 01:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760429204; x=1761034004;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7CdCQL72+wx7fzCdR3aCJ9NPHrR0L8HOD5RG5xmpUQc=;
        b=N+Kii+wkvDPiDVAvgq94/CJE0KWvIeT2WHLA3uSMgR49U7E9DLLwugYwRcVmUx/3Fw
         IxtUo5CMi9Pj5cnbC842auPNvI1O/55SvD71yzk/zkk3+ikRU8dDrrpw4ZLA8Y9Pupip
         R+wabPZx7+OjF9p0AuAqjxSJtcNGnp5Weu8BGFTx1GC6kMssQPSCa528e3NBfQo9BXkX
         8ovXy3C8x1/gbhHFi/iIzb6CtJ8TfqlNTx0wp+sYqULY8T5AQM6K8pR3kky3qssVfUyB
         aXg2BH/A1IzxsK6ThV+Pw7UJ0fRuTU1YywaaBY7+gIrL9Yz3PInJOmoURUBFeGS0luto
         s9RA==
X-Forwarded-Encrypted: i=1; AJvYcCWFu0kU8zX88yZZYYrfRYzdDb8tDU8TwgQUwLjHpio/2ITscAQQLmEWQytNX6R8qYAYUjOuMgdnOYz0aF9y@vger.kernel.org
X-Gm-Message-State: AOJu0YzJprArPsPTCOFoqAkwu1AKb4iTqbukVOsQ0xzS2J94rSluQLbD
	7rJ/iHhAh2rSTSp2ElSc1tVuWApd/o1LgHkb7dg9FUmxJ01orWVekP7iOjmu2cW4K/YDjwn1nqD
	Qvhv0pCCHXmziLnW8gGaii3FQZe1oKpd+S3RpYFKFI4vuCzfKHRti73+A6bG7JkYwzb8w
X-Gm-Gg: ASbGncvMoGWklj8zC3Kv3TyAJYImObBNzflMtub5y1DlYZSEIlLmcA+JBpO62lz8HKG
	soNb0dYjUieqjBAUzDeU2x8lJYM4MjQTsG8irGCbd3F3ya+5oVWOE+rDs0nmAzBroiqDQF4GCGW
	uNWGIUBFvG1pyrBVVRoTRdC0hsXjzrPBxLwyI1oSp5YrouLFSGpvPOYt91CBMNXsGy/AZM+cPtj
	dzRX7ergKLHu/YmbAFqGlRqzLvJPlDwcxxfVtpPH0MB1NIfzqhvOOEetvFq2YdPsa5gLVLYZO/a
	gISa75Yp+zbTDpwRTGV1fgebyX235n2auBJnySkBeOCl7q6bY35G+6YMtVvuyIHY3sCMKmcA
X-Received: by 2002:a17:902:e54f:b0:28d:18d3:46bd with SMTP id d9443c01a7336-2902740089cmr343944415ad.43.1760429204390;
        Tue, 14 Oct 2025 01:06:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhbY/rsBKCb8k0lEMtnnpbymoDmTuTFFchpcgnd6Bdy9Cz0O1GUjdLwC9fI+/RpmaJj9lk+Q==
X-Received: by 2002:a17:902:e54f:b0:28d:18d3:46bd with SMTP id d9443c01a7336-2902740089cmr343944095ad.43.1760429203912;
        Tue, 14 Oct 2025 01:06:43 -0700 (PDT)
Received: from [10.206.101.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e1cbadsm156112245ad.33.2025.10.14.01.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:06:43 -0700 (PDT)
Message-ID: <415b48a9-73ca-3385-4c00-cef091627844@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 13:36:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 0/8] media: iris: port support for Qualcomm SC7280
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ee0495 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iCAh8AotBxNhkk2J9E4A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Go4JwZ_Utqdm-jmlhsi4WMxUx2nEZyCK
X-Proofpoint-ORIG-GUID: Go4JwZ_Utqdm-jmlhsi4WMxUx2nEZyCK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX/MQJ3mfbJ0SY
 CHxRlx/Yycna9tgOxtYlXZK0grt22FetT1Fz3ZTZ8e66K0apGzj6iWuQRsVBn5gq2KUXeXgeqQT
 tAzbdPlLMtQem5lfEiq3mMDr6zML4SCCAQN4aOJNjXFctsLW+I91xko+aBuF4MYFih8wazb2b8Q
 j4DIOwDXB4T8IWfNRs4iH//alYql1KceSkct2yCz6mRo5AeJi+xHZ+TSo8j7qWu/6Q6c9oFchV+
 CNcBo85nlB5b/sQiqGuQGMJv63ptbHpr3fFvcPQXna+y7aYCoi9AtLFhOQnJR+UvVG++7GOnTqJ
 x/eiYoJddIN9aimIKHr2LZuAVvfY178k4HZJDt+VSL7pOIO+MgLHO9Mhe93RvTpzKPK+4mABa3F
 /rkGFLUKyTXK/Hc3FVPtLXRewIJfJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035


On 10/13/2025 7:38 AM, Dmitry Baryshkov wrote:
> Port Support for the Qualcomm SC7280 aka QCM6490 aka QCS6490 platform
> from the existing venus driver to the newer Iris driver. The firmware on
> this platform uses the older, gen1 HFI, which puts it close to SM8250
> from both the hardware and interface point of view.
> 
> Test results:
> 
> $ ./fluster.py r -d GStreamer-H.264-V4L2-Gst1.0 -ts JVT-AVC_V1
> ...
> Ran 77/135 tests successfully               in 17.010 secs
> 
> $ ./fluster.py r -d GStreamer-H.265-V4L2-Gst1.0 -ts JCT-VC-HEVC_V1 -j 1
> 
> Only WPP_E_ericsson_MAIN_2 succeeds, this needs to be investigated later
> 
> After removing several test vectors and running single-threaded:
> $ ./fluster.py r -d GStreamer-VP9-V4L2-Gst1.0 -ts VP9-TEST-VECTORS -j 1
> Ran 219/292 tests successfully               in 134.749 secs
> 
> Disabled tests:
> 
>             "name": "vp90-2-18-resize.ivf",
>             "name": "vp90-2-21-resize_inter_1920x1080_5_1-2.webm",
>             "name": "vp90-2-21-resize_inter_1920x1080_5_3-4.webm",
>             "name": "vp90-2-21-resize_inter_1920x1080_7_1-2.webm",
>             "name": "vp90-2-21-resize_inter_1920x1080_7_3-4.webm",
>             "name": "vp90-2-21-resize_inter_320x180_5_1-2.webm",
>             "name": "vp90-2-21-resize_inter_320x180_5_3-4.webm",
>             "name": "vp90-2-21-resize_inter_320x180_7_1-2.webm",
>             "name": "vp90-2-21-resize_inter_320x180_7_3-4.webm",
>             "name": "vp90-2-21-resize_inter_640x360_5_1-2.webm",
>             "name": "vp90-2-21-resize_inter_640x360_5_3-4.webm",
>             "name": "vp90-2-21-resize_inter_640x360_7_1-2.webm",
>             "name": "vp90-2-21-resize_inter_640x360_7_3-4.webm",
> 

Encoder is failing with the changes, most probably due to #3 patchset. Look for
the comments in #3/8

Regards,
Vikash

