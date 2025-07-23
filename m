Return-Path: <linux-arm-msm+bounces-66220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 246A3B0EF3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30FC6168EB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F04428C2A3;
	Wed, 23 Jul 2025 10:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XPTTaDIp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EFB28A407
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753265142; cv=none; b=ZXck7z6HtKR3fQH9YBOQLZZAOARUvmFUSOoAWEwLu6XoUU+6AX7cpdftHuxJUQ0JiyCFgyb1ceX77Z4pkU5Al6WkbTS3DV7g9iVmvpmkuCxyaj5IqGpjxa7heV5oSaxFGugZh5+jiAOnZSXvh4It5igdKuS68En5LeLQJGHfjw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753265142; c=relaxed/simple;
	bh=CfG63TX7EW5eJHNMhHKCpCZ4PTn1maRn8k8Etpme2PY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b1Amd7kbwZ0AYnJJ7KPON3RhiC6C/luwQVfo+3lgCOFio75uJQiUqA8xrOHirTlz8xde7BwSj/kYHgnr8YhEU4hvjeBtFGqp9OJMXT1lHq6raVpDW7vLvkPbOa1T9P2xPjWkcy/vTH1WEhW9IEoikN+kyzlJDbiLbdeNGqvLyz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XPTTaDIp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N95IdU001899
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4dITZrpRLLfNiDzDsVfXaS3NGw4vNmfg16p169LKj68=; b=XPTTaDIptBlmsY4D
	J3KoAXcU0LlrUtSSv/ydQYsoYVm4ubWkmo+qnBgCXqxasXzMJhFSIAFeq/juxEby
	YNTvni79dr3cmG9NkxPWuGZ6a2QXMmy0oyjUwCxGRGK1a3aNlBuYMNJUeV5PigvW
	VVicywIpxy7cYY08ZLr9JFNSdx4cFaGSS+VNevzxOr0OC7UdT5r0sXQ9Xcwym4c4
	kWO93xX9oX7roWNLHH5XHE/diJ+LGe7p5MHp2Y5hSBVgjewjT8hS4cld5eIASRu5
	OjrKvxXHS3OzWUsOXO9okrDFbR0ZO1kcWUXz7gfR4Rc1XnIiUAehS77/ElUOwNpc
	uO4WKQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w5v4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:05:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab65611676so23237201cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753265139; x=1753869939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4dITZrpRLLfNiDzDsVfXaS3NGw4vNmfg16p169LKj68=;
        b=Eq7xP2iNGNK1UGw1/VoMrHUNuJuWS8tL6tZLVyhvcKbTsuRoXBox6fJyeLpN5s4pjC
         AkjFq9rklCvTA3QdzAre0TagqyHCsA2awL5rYGnnGSo4kuzQTVh9bTOmC9HT75MvoNtK
         3W1mvhuJ5ed540RiHQJSUkMZppMJ+gYrPgV9xJubzg49UK+mxvweRxdntuvn0gv3zqYn
         RQ0+dXqjQNI/ia3Ns6E7440h2HWcG3Zip5vgcLl9GCSnCHODmZ0//pA/yYrmNwtVxcg8
         vOCXPzJyAccS87t6NhiYlqUc2KruhcEADVuannCzAIpni75Vvl1dvXKjKL+rHpY3mm6L
         0RpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdeDY+aj0RE26/UnedDshobXe3Iy0XUD2AHoY3BpLY8EQa38u760dVHgQ3OXwGGw3al8x8wZVNc5E23PPx@vger.kernel.org
X-Gm-Message-State: AOJu0YxgwtbDfdnDHIIgjj6N1gmMlFg/dkHIFk5aT3mrG40J9ziwmVHj
	YySUae93ewg05k78OXfkIRgRA1iaDbFtsSdh/7BOJTEg7/M19ndLxbTa0BjHkwiyFOpLK5wEkoC
	xtOebmvyDwpSdONAmhZildJHq3wYH463UfXmggduD+Fggy3/M3ski02eRJ0OYcfxQw7jd
X-Gm-Gg: ASbGncvBJAthZQzxddgjO/yfgrbbMCuGMI9Z7852QSyQ5FGw0T5tLEnck3OfemYhJpb
	WDB1y8O/F4tX3WjyVTXILz0hCuFx/l7M0NQdohAvnxjW2XoplJBgbFpd9VNz5bwfhX1hd1aUbt6
	Nl14I5VeT/WjXOY7dGKblsZnvgsgB540MiC3JpDV2PY5wDc2CVdpW/CpBx8Yyiymwyo3FMAqc4p
	Z080mQMYIZYZOjtTGMO7tSdV7q9XThP6vXFZSyFR+jgEpf/QP+GJz76olnSHj4YoUDZGJQZiIeM
	RAHIayypG/GRR2gXgLH3H5DX/B6xV5FbHn+UMgBXYZOdvaqxGjVb6jqW2+9DBp1OxuOSvyS6p8W
	Sv27YZrV0bDLxMYFBWA==
X-Received: by 2002:a05:622a:1454:b0:4ab:635b:a309 with SMTP id d75a77b69052e-4ae6dc94975mr13062581cf.0.1753265138769;
        Wed, 23 Jul 2025 03:05:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7VWxyiO/uqaEAXmfUFM7818+WHuRXfXtfClF+Ol27/qeXk++n++ym4I/iG/5MBDbAN4drlg==
X-Received: by 2002:a05:622a:1454:b0:4ab:635b:a309 with SMTP id d75a77b69052e-4ae6dc94975mr13062291cf.0.1753265138140;
        Wed, 23 Jul 2025 03:05:38 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f0afbdsm8405149a12.6.2025.07.23.03.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 03:05:37 -0700 (PDT)
Message-ID: <644a81ff-bbce-4cc7-a364-8e0c591898b3@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:05:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] drm/msm/a6xx: Set Keep-alive votes to block IFPC
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
 <20250720-ifpc-support-v1-8-9347aa5bcbd6@oss.qualcomm.com>
 <jvn44gmttkidyy4emnz6mytqqjbwltlxibywfr6bfbqjfbq35e@fuvvefesqbzw>
 <0427769f-62a1-4a20-af94-b340413296ab@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0427769f-62a1-4a20-af94-b340413296ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=6880b3f4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=w1FpSeGnf3HiULV0hxkA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4NCBTYWx0ZWRfX3I08po7a8OMH
 mumsrc3ZyPpg7hqh5R45dL63T//EGt1Myl/Cy2v5MmYPj50ddWG2p6yOmk/ZoSenReS+HijU1m5
 mNJxlwGAwM2B2791UarSRadg8AnbesSzZDweKx2VZtUYGs0eIigsy8RHjuKhcPHjc2AdgfXLhSd
 DpuSR2mFK9zwKgKhHgcg6266iHw1FRW6N5WQIESetaue3YiUq6gWNRLupX1SNeaFJOHNvcHeRxP
 p1V5I3ZwXoPjHJWvTye0wiqv3B7dIrQFP6qs0mQ+Qg0RrHOufulgPgAHjE8eST0ZRDzhDZ2Al+8
 af8Nuo3sQpE2ipYt/IBVqYCU3fXXXezEvSTkorm99LRBcz5KP90o8XBUg0txck1ZtlAVZvgrFk5
 3ukaWCJzzX7P81pLHY8FwX9YfbVUoCtk64PAbFdCW3QxuaIwPv0qs1ADB2Gte/jcgpg/qRyl
X-Proofpoint-ORIG-GUID: AUwcT7sRBgLJJbObTjqyiw7Bh2XjbMRy
X-Proofpoint-GUID: AUwcT7sRBgLJJbObTjqyiw7Bh2XjbMRy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=941 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230084

On 7/22/25 11:24 PM, Akhil P Oommen wrote:
> On 7/22/2025 7:14 PM, Dmitry Baryshkov wrote:
>> On Sun, Jul 20, 2025 at 05:46:09PM +0530, Akhil P Oommen wrote:
>>> Set Keepalive votes at appropriate places to block IFPC power collapse
>>> until we access all the required registers. This is required during gpu
>>> IRQ handling and also during preemption.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---

[...]

>>> +static void set_keepalive_vote(struct msm_gpu *gpu, bool on)
>>
>> a6xx_set_keepalive_vote()
> 
> static fn! Why do we need prefix here?

It's good practice to namespace-prefix your functions, so that you
can more easily find them, e.g. in a backtrace.

For a prefix, adreno_gmu_ would be even better, as the register doesn't
seem to have changed across generations

Konrad

