Return-Path: <linux-arm-msm+bounces-76750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DF2BCB047
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 00:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAFC21A64E81
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 22:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B60283FEA;
	Thu,  9 Oct 2025 22:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fp17ahPT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F47728150A
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 22:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760047623; cv=none; b=MSC5j7hNtwHUDU5JcjCUh9FY5F0rIlcQTeiHI8T0UbPzHSuD3o+EQhAkORd1O2c5/C5GKesMFDtVHF9H7YMerd/AijhelAousAbR7CQWKwmFpypgXXM697oZwc/6b8fP62JMFTt4ZbnnUjhKZ9ocmjAWhHUHu1PiFhwxavvodxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760047623; c=relaxed/simple;
	bh=dQORkJk6lnXWVGu2OR0fRY18hl8zcwHvysnU6b6D/2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IaqfTzPf+4I3jOZQDYASiprer+WQzzNCWWD8FBj3lHhCD1ZWZrfS5YHixBGIg+omGcK7CJotRQLJOe3US4Ox5UJY552ns3QXtavN4AME5WBSlVgP2tuFZUrBkaZ2PpkfV7cW/2IInXvMKYRabL4OhwJvty6gavYok1rxs+nJVi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fp17ahPT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599EbVF2030514
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Oct 2025 22:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PR41P3ZaU4FEtAYgEwsHsgOa9cZPdhmWSVDIIYk7xVk=; b=Fp17ahPT8DWjCQpt
	qouBdxGL1HMc6qfBQ5fW9eknKz0/5+fYAXH6FGfBwTVqeKnXsCrtGof8SNNFqChl
	vXB0p1CInUbxoMqW31vKUzukBG8LlPAY+IEhKUX9qYRTPK2aaCV3Umy4IqPsxF1Z
	SXZYRzGntiBxBIdpbPw1MTD/qjsmSCBn2o/mGZf5seTFB59S9odpAcMN921M0KzF
	vQwv+yLvRoH1N1oaJbeePgp1KDCm6Uu/gv1iid4CEI0KeNuygZ6mnT5QHiCJOKB8
	2X8OLjzYRY/cVhU2ii49bg060HRAN/F4ftjh83y/pP//xh4qQgU7yZWwE1Nzimma
	pM+cUA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4nmd8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 22:07:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3306543e5abso3885692a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 15:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760047619; x=1760652419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PR41P3ZaU4FEtAYgEwsHsgOa9cZPdhmWSVDIIYk7xVk=;
        b=QQFWAVeo4r14r1ul8MrT61nVUd4ds4CH0cQuy/73wRk7gX1hcCKhrLE+LgRrC7x/Jc
         E5bDtY8Xg0HHzAa+w/xtVaedZT7tB8xRX+sXJpB8+UQ2AnZLqK3IfgmO5uYaByryeXr8
         +zyAgR8AFIuAHfCVeCMWnUwNmcLGwkzSbKcBslolLle3OCfbX6gELB/JtQStwpLOL3MD
         OiJRuUhNvYVcgFkHlxio6iNs1foZQYPBZhndPcdZfqX9WJ+/GknGLNg2ozdH8lHVfQFP
         CtV3BLcRncD9xs6ewvjZlSO5bkFdnkTSquSK6JEnE3BVintHildiKznAIJxdvcR8edIK
         cDAg==
X-Forwarded-Encrypted: i=1; AJvYcCX3+odeqrS7Dtv+gYLvqjzIUIHR85F9Ek6LWRXF/g3FhE6bBgqY9urNOBpv689vZyqFpTTSAixQmas1DqYo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx81ZPedG/RqYhlEHPjeoOkePmGP48oHJ47VhdKNS0cw9ZeBaSO
	whfWxqKYkNKHiidGK64r3PcnEA30JIqqZcZeksn7hf0WcIquMuUT3skkuqobWO6tamJ5QHX3tr0
	Nxcb76ZJ64Hn8PAfvyLcIUhEvk85ZT+cBqBb6c0Y21F9cOfG/de2f5WE4I2ti3djbSlXV
X-Gm-Gg: ASbGnct/HVkDfkLZBuOIyHcK5NChsmZx/0epivox+oFIdQkYbhR+GvuStdPwGghUXkN
	a1XMuWWR1oCPPEvIJ8LVA93hVJ4q4+kxlSnH1wtUb0Z43t9vrkSslgnxJTXS1mNbKJwdyEG95bU
	IQIQnwb0Gir1/1oFbh1a51PA84xWXN9qwpm5Rtn8OuEeGxKHZIbKw5pxVce1ul12cZ8rblNsfsp
	/pjPYIbRmNC1WhqtzrXCQNZCyJ08Gkyvx8+LWDIBJ6dRz28sbns4eDl0JTU+F6YBrFMQs6yJ4tA
	6Pwj28F6rWstkuYJjAVCTdYxPYegH2tz9+LbrBkKeWbHVyC44yFR9jtBLoDnLLsF/Rccxv5u2eA
	nFw8FYjetEJnQwrGuBoo+XHuZOZA=
X-Received: by 2002:a17:90b:58ec:b0:330:a1ee:e119 with SMTP id 98e67ed59e1d1-339edaae564mr18570381a91.9.1760047618908;
        Thu, 09 Oct 2025 15:06:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4fyyM+GG4JOApDItPR8uaTlgz9TNMfnQuqAW3pfKetHHZhA+J8uV0VeyiU+3SyCfTwZRmzQ==
X-Received: by 2002:a17:90b:58ec:b0:330:a1ee:e119 with SMTP id 98e67ed59e1d1-339edaae564mr18570335a91.9.1760047618340;
        Thu, 09 Oct 2025 15:06:58 -0700 (PDT)
Received: from [10.71.109.75] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61b0ed20sm908807a91.23.2025.10.09.15.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 15:06:57 -0700 (PDT)
Message-ID: <55709a7e-21bd-4728-a818-d2739fa1a86e@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 15:06:55 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Remove dead-code in
 dpu_encoder_helper_reset_mixers()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Mahesh Bharadwaj Kannan <mahesh.kannan@oss.qualcomm.com>
In-Reply-To: <8e3b2fbbf5440aa219feb667f5423c7479eb2656.1760040536.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXz5Gqvvi3pVi8
 vLps83/357smz3CJ/tv0RERKsilJ1rQfrhs+V95ATn+XCXQOglDsClAn9kLU1AW8XbQ9VKx8iKC
 BUU8Jb3ncoRPrtLOqcNgDxVE4lZ9OjLQYzrs6CHNzOVs/eQnSoDw+B/iIdbwu43w9LZd//Eq0sL
 19IraQAPF+SY0kzfoRSo8RSDw5VPPUP0xkmWO6WawedvBF5tvjUJ1L/AnEnJtP6Mezn5eCL2pTD
 AgfhD/45Ef6pvvDcQpJd2pUSYqTlXDcfeUcKcGUE29aGF6ESKDMT9zcMtpN+5EvcTGlNOWwG2a9
 x08PDMcZOb2cF4WyZLzmb7K0Bp687xfpm+6Co5b/bdJYsQpxYN2acVEtl1EdeYnMmJb7OQySKSp
 gXfVmptBIijndhymcgrEKneqSYJGhQ==
X-Proofpoint-ORIG-GUID: h05bwQnDtITQseYS6LiOSyxBJlFnRDiT
X-Proofpoint-GUID: h05bwQnDtITQseYS6LiOSyxBJlFnRDiT
X-Authority-Analysis: v=2.4 cv=VK3QXtPX c=1 sm=1 tr=0 ts=68e83204 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=HXVKm-MKDGyxfSjg48sA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_08,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1011 impostorscore=0
 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/9/2025 1:09 PM, Christophe JAILLET wrote:

> 'mixer' is only zeroed and is not use. Remove it.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ---
>   1 file changed, 3 deletions(-)

Acked-By: Mahesh Bharadwaj Kannan <mahesh.kannan@oss.qualcomm.com>


