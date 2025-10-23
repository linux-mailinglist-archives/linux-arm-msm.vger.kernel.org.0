Return-Path: <linux-arm-msm+bounces-78481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C40BFFD2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4775E4F069F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 08:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756832F261A;
	Thu, 23 Oct 2025 08:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PtF7rT3q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40F12F28E5
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761207455; cv=none; b=UGIVKRdCw8aJalOUmsArLamdpeOiJA/WYHCikHpdc39U+5eh0XuuRztWUFMLRVGkj/mQdGWyOYhLdUgx8UlakGOT4VUOHU+3AK6q66JqVDiVJUIc40OKGUKHZCQKtq/3LWjtPf48GyfqnLhg5JbjuSMkcnzdb8f+C5qVhKdupxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761207455; c=relaxed/simple;
	bh=nGh7+KyfgJvVeFndN6DP8WYW7fH1A9URw0atmnYdGfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uEzG5w1Q24na6voPEAXRXYPdWXSW8ZcMxDgsFu1XwfK5c1jaOYDySA+y0iFaj09do9fIg0hW2vJ48wOaXe1pQ2t/RNzbH2B3qNcEI0lVJMlmr8z3WpzCXa2q6/sDMTjtJgDSlQEuChDnLGSjSRrSmczajBU8QeeUH9EV3yHDowk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PtF7rT3q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N75tgY026940
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P7jby+P/cezcampo9PoeFaJfywyvEEZmUdeXikYv1WE=; b=PtF7rT3qNo8pEb4m
	MQRs08HMOPhkNHc0aCXV1RYrSSDzCJqbLRi5OMTwQPCYNKDiIYeorDyZbTzA+fyJ
	K0ziDue66aKH4oMSGuFsnuBqJZi1U5+TeYUcJqK8hqun6v3+an3dxlDimxc6poo7
	95Qoo3JEq16CrUkkG+h3hXvrhbTv/Fkwt4By+r8A6tPJpczIQJ/nalg9UDOp/TmB
	QaMrDbNfN3y7Y1o0J4mQ9Cnm3CoU/oqLLaTqoc64LMEjkd+iypv5sJ3g8GROpdco
	90qzBS2bUyWTXyqvgHjaXSVFsJsqzBcjfMHEdzx7VEr9sBxY36bHEV2k1MLxBZK9
	ncuFxg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8hp40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:17:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8934ae68aso2492421cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 01:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761207451; x=1761812251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7jby+P/cezcampo9PoeFaJfywyvEEZmUdeXikYv1WE=;
        b=LnojhJJ5RNYRUcyIXCKhMnjBep9qZjK6XwY5e7DcjBjX9aR6PZJ4Zw1jq46iwQ/FjZ
         tOqtRF4GRv2bbCVOI43sK1kYz7BQ1BkJiO1wQRtx3clNYtGiwB28bTLr30QzrZMzlL2E
         VEEcZDvSxax8yEB4FTqwC1Rds9espwzqSQEd8KxXkyiAZKdpWEOAoaPGkqRH0zhQLPYs
         d2qhfiLElfYuK7MwKAGqFR9hDvLnQ/5bmxr5iWeWHfSMgUKSGrxOZw9JvN4bO48bfUq9
         52dLeDoBZEGznUV5wtVtMT7MEnVQDPV2ZRlnb6FhvIbZxt+zzoac84HSqbt6sdLmnRA4
         7OcQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/z3xfgw1c76EekTTv1ZWDgbNRscPgVpJ1giATEBkVEKCK5+6hZHNwbEThAwB2FuyVCQU+zlJf4V/GTARI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+eVEZPS8MWI1RVVwaBEEFJKQheDOYq8zMkTffQDDQjuUqsIre
	EA51c9wP/1ezHBvd+LzHkULJKdGK37jFg/SbYIuMwT3Os9E31Q9tHl6y6R+i1FmTs2++ScOMk55
	hEU94YaFbrVpc16m7texzGIOV8TlVgmkdHKOYrG9VfVH0qzzbSblQ82OKRYtyMcPvmQk8Ydj8HW
	oD
X-Gm-Gg: ASbGncsaGkUBjbZqfyKvmth8LpjC3NDWIy0LqwmlxiU09FF3OskSPHhb6Tqs9J489tc
	sU+mQ2ZInKF6gs44emp2oOa46N+Mvz0UjG4petcnQwYNR+VN4VAgFgBMeQEFZc0d22l3jgf4mli
	WMA4tubTzGi1Ig3OHgeYjJmSzRCXsB+0yiyQlpriWNEnjeRZ62jsFz56Qc3sBteoikVwjeETZwq
	Y6inE4gpbF07lLHmhckX8gAh3p/xXaiLSoD/5IXGhIv+uiueUimWCdtYNnqeoAJTI6/SBJy1Pj7
	AhZ+spGvFLc7+HfC8skTth+vxuh6IMESnunJgMQ9N/XEqxp1FMhO5w39QdsKmRyu+fUJj6f/eVU
	2E4UjJz+bNToFc6Zb/HhPwOcNLZlAc0MhHFB83ht3UlyUawlGFsNdCULZ
X-Received: by 2002:ac8:574d:0:b0:4d1:7b86:3618 with SMTP id d75a77b69052e-4e89d1fa0cemr229932591cf.3.1761207451415;
        Thu, 23 Oct 2025 01:17:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb0VylzRunRisW3rxhmOhizwPymbY5hIWBS4CGdW63B6rUZIyRdd8xr614joK8Z+NnMnnr7Q==
X-Received: by 2002:ac8:574d:0:b0:4d1:7b86:3618 with SMTP id d75a77b69052e-4e89d1fa0cemr229932431cf.3.1761207450986;
        Thu, 23 Oct 2025 01:17:30 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3f32366csm1099380a12.30.2025.10.23.01.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 01:17:30 -0700 (PDT)
Message-ID: <5c0b4712-4a54-4a1a-ad73-dc3bdb21a0ff@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 10:17:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] soc: qcom: rpmh: Add support to read back resource
 settings
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <20251022-add-rpmh-read-support-v2-2-5c7a8e4df601@oss.qualcomm.com>
 <litd6qcxuios7uwwcrz55ea24kj26onrjo2aekouynsce6wslj@vatjbulg64mb>
 <4831d12b-a42a-464a-a70f-e0e40cf4ae4b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4831d12b-a42a-464a-a70f-e0e40cf4ae4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jO9LSH_sv9vTytueJjGqgKqIEVNjBUhI
X-Proofpoint-GUID: jO9LSH_sv9vTytueJjGqgKqIEVNjBUhI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfX76I9JnpnRmGV
 WPe04ixkNHUrFVkpY1h8/164P211pBkbIgEE7WNfUIIu0F6qS7TWcEFMaj6gd63+FxLMJMD2BEX
 XdZWjG+6fa7tD5MFFDZkGshu09FeAuPU2hgOCmgyTiwUMZRyCTlu3erQjgDH3hA7/OfzqfJV44i
 jk/vqKEJ6++MB5hyCSaQK4EIGfFJ9e27TE2wUdrz+g6bKz1YolWxuMrPfJs6AABTkiJIwtONmSI
 kbVqWQlOGpWurIlHvqiHAWyPKG538yksOhtyWeWqCannvoGci0bvH1iRS4Vz7dR3urmvmouT986
 EXVr7wDH3nCa575fgHXtxkaw6hEk9zMkT4Yormd+fvlgFSg6uAnthksaLisN/b6z54s5Szrue8l
 pXKoj8OxT22vs9CPzGdaWIXkkZHXJA==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68f9e49c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ECcW57WI63K3aF9AT9UA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164

On 10/23/25 6:46 AM, Maulik Shah (mkshah) wrote:
> 
> 
> On 10/23/2025 2:51 AM, Bjorn Andersson wrote:
>> On Wed, Oct 22, 2025 at 02:38:54AM +0530, Kamal Wadhwa wrote:
>>> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>>
>>> All rpmh_*() APIs so far have supported placing votes for various
>>> resource settings but the H/W also have option to read resource
>>> settings.
>>>
>>> This change adds a new rpmh_read() API to allow clients
>>> to read back resource setting from H/W. This will be useful for
>>> clients like regulators, which currently don't have a way to know
>>> the settings applied during bootloader stage.
>>>
>>
>> Allow me to express my disappointment over the fact that you sat on this
>> for 7 years!
> 
> This was a dead API (even in downstream) with no user since SDM845/ 7 years.
> Read support was eventually removed from downstream driver too for the same reason.
> There were early discussions to remove read support from RSC H/W, due to lack of users.
> Its not realized yet and all SoCs still supports read.

Can we read BCM states from HLOS this way too?

Konrad

