Return-Path: <linux-arm-msm+bounces-66231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6A2B0EFEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F63F18926EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF50127D77A;
	Wed, 23 Jul 2025 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z0yrZJWe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CB6282F5
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753266835; cv=none; b=uPyDNnw1/vKJcTvBnVq2UKRvUmx3k6oOf1hLto2z1QGrTttBynybJeRURKYZL+gGGnwHlckj1XA+ndRW4z3eYga0hKxItH7tJ2bosdGfZRKL8VOjI89QOLeyL6G57HpMs0bVz4lIy1xQlQ7AU2Yp3a4bo9/Ot/S6M+kPGVbNcA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753266835; c=relaxed/simple;
	bh=KPN+vp3SZ1U4t2zJAOAO6TQevWKEb7K0+lf+cfAmgcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DnfhHH5ypscpGomXFCl0tC4Iz/40U6qTZu/5Tp8dj8daJtie97ZZiCMF+zoL4FK/usr9P9teEYPaoSmrR3PDt4ZTUVIHPBQkOjY2NdwEbWF2iHVtdDpDgyyvwNl2Y+dX2DoonKjeaWM5BNYL/jMF5/x5JGCnvpd8FixMw/Rh4N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z0yrZJWe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9PVb5007918
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oBHkd60XiHv3KTV4Q/cfQM2d2Sgw9xBBOOYrRSYVnq4=; b=Z0yrZJWeWkVSGRng
	ztzDGzJDZ7ad7CtObEmZZxE395gQXCp5/a/bKKALwUBwhajCf+C7sYP9mdJ5doP0
	8yteaZRW9EIKZX33NyvAm3XQ3yWjm8jwy0qCYwOBYf9kwu1oEAmsJLTMfKuguF7W
	SeiW4YJ08+ybvypPghMWMRPzqJmYh+jssS/HmL9yOkCxkHbw6U+ulUTh1A6AI7yK
	rcPWxFbQLcAZ2BZqakZI2qbqLdvX4OXucGtR6MdzQKaBSWh1FpbAeiqwtAowSiiA
	vKMbdQ1w4Zmoi4TnP9nEkbqixtLdFwvpaLRTF5G4DyvyzDFiSK6fhZWUNNmT8CpR
	BhARHw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3htu7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:33:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fabbaa1937so13912316d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753266832; x=1753871632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oBHkd60XiHv3KTV4Q/cfQM2d2Sgw9xBBOOYrRSYVnq4=;
        b=fDs3UtKkIVYAyWPMlUo6Tv5TdbY3Dti6ggEIFKM6sWmqcOkNsHLsyVY7tHRCoWnjfE
         b2AGvbZ/m6E2bNLw0DOUZBEu0Zq79LyTnkDJ/31mCW2bMolmRzxQT0yiuk2L9FbZoirq
         J98S8UNHYaFDJf9gaSHzIr9FZXyh58dRmA34kXP4A0MDOxy7rCKeFXdvQTAPbHeUIhod
         UGtWM7i7BHzQsgZIgrzpO7YqHNOO8wuN1vzO7RGTT8FrbG6gceQnmUCDwyAtPQVrvdup
         k9YWcW+VKdhYqPD7yXfOfhXjWHsXxieTiElhioVVAebBqoGvn9M2lKbVZCb3Q95++dAQ
         mY5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSA4I4r3L3SZt/U5tQqgoYMgZAvlSI4UU3exNIV3C0B2uFGZksndOYxQFYXLy8JP96rKwz/pMprNmPBZrk@vger.kernel.org
X-Gm-Message-State: AOJu0YyPkgesvBjpiZ9lpPXVTAKjR0QQcQb4kKUqLJiUDyBD9IYE0sFf
	WX0wMScGEbQzQdnbaUntM5ZiJOC/XMOz0NkllsGmF0cy50swq4tQt4+ux2L+yWHPSc1t32rALAH
	BCkYd1CILNBYBE4qD1IvmHuGVAT8RLGw7plYmfAkpX7Kfime6wWQpu9IAdwRno3p7rCVq
X-Gm-Gg: ASbGncuFnBJNzHsA2Z/66RpzluXoGNf0D+Hl47FzwqPM25v2Y/acnSGu7k0FBOc42oK
	iOKgU/zdwpT9I1MB6/xBtg76PRNy/qm2ipfEbEAkYMJpFqMKn5AqyCHpkw7kZNyu+iijkV+gtag
	S7qjOzc1UdCQfbXJ92bg5uSdRfxP0LZP3he3Cftna/vjMcYSMcrNB/WZhKd8xXrZUfnBt43Y+k3
	fODW7+YFgR+GbYnNqQvLzwjNLwnRLjHWCXe14m4e4OFZBs3LAUFTVcVZ5OYm3ZRWa9k7z2ZC2ZM
	y2Tp63xdGowC/tEiND44zfcpmubbLsBy96s/qRfRLKWnsMz0Oy6q+hgTo0taQaRrm83Z7pMaSVH
	pQtMiTtC0vORDoU77bg==
X-Received: by 2002:a05:620a:2a16:b0:7e3:512b:97f4 with SMTP id af79cd13be357-7e62a1211b1mr119488485a.3.1753266832059;
        Wed, 23 Jul 2025 03:33:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2NMUcGI464RrH7J7b4NwsfI3U6elRNVRs3V+eXGNIbBdAvL30yamLCKXZICj1j4UL5vBZ6A==
X-Received: by 2002:a05:620a:2a16:b0:7e3:512b:97f4 with SMTP id af79cd13be357-7e62a1211b1mr119486685a.3.1753266831636;
        Wed, 23 Jul 2025 03:33:51 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d68a1sm1023903366b.46.2025.07.23.03.33.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 03:33:51 -0700 (PDT)
Message-ID: <50d6a7dd-46a4-4281-968d-d7df041f21ae@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:33:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
 <37nuk4kevhpwlzbpgm4tyhnmk6vi3a75oosz7l7xbvvn7qwq22@oomdnizhc673>
 <85073de3-3933-439d-9912-1f0ff145df97@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <85073de3-3933-439d-9912-1f0ff145df97@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=6880ba91 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KWxADXa3oT3Tu5R4PFYA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4OSBTYWx0ZWRfX8MemZry45pPa
 qWF1UwtjklWE458SShyk3NodVtTyVV6ufbM5xlbHqigtCaikXaGx1IchxpPgxdyiiicDf9qgcil
 UaU+pF1E2oRfqBE9QueUsmQeGxb/fqiCBMG8gtX9/OxYwlg/+bOVGChcK54XMSZ9UE1mYi82/ey
 HqsRUjnrQ1ouDTcdrhOi26KM9zC4rwDsQfu1MCBG8k9+SPbdSSA8ugHcoakDSObKkJD1dZ+D/gM
 gi0B9xLBXi7eq/Fabk3tP9+vb3AFcFQxds5rcXxrjqp42cEemSCZQbIAPAUpKUuYPfxoqV7Ayfr
 zgQOq1I4TGJxMykYWOOjIrOLnZiY4V/LtxDadvtiPVfFpuRzMHnVO+i9QQx0VotztUhW6PtJk14
 7Jog/W1RMLDC1Pi3yYHvf7MVGTSz5h0A6jUc3fyynH2PFgT6BRxdl4tMxbq8/bqmJs0NSigi
X-Proofpoint-GUID: WIjFHxQGgcW5dyrf_KDV73FCqevyOXwC
X-Proofpoint-ORIG-GUID: WIjFHxQGgcW5dyrf_KDV73FCqevyOXwC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=700 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230089

On 7/22/25 11:37 PM, Akhil P Oommen wrote:
> On 7/22/2025 7:25 PM, Dmitry Baryshkov wrote:
>> On Sun, Jul 20, 2025 at 05:46:17PM +0530, Akhil P Oommen wrote:
>>> Add the IFPC restore register list and enable IFPC support on Adreno
>>> X1-85 gpu.
>>
>> Nit: GPU
>>
>> I can't stop but notice that KGSL enables IFPC for a bigger set of
>> SKUs, starting from a630v2 and a615. Is there a plan to get IFPC
>> supported on those platforms?
> 
> Sorry, no access to those hardwares. But I can certainly help if someone
> wants to do that. :)

Let's get the groundwork merged first ;) 

Nowadays you can reasonably assume we have access to at least one board,
no matter which SoC

Konrad

