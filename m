Return-Path: <linux-arm-msm+bounces-62798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D82AEB8B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80AE6169A00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 13:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4297F2D97A9;
	Fri, 27 Jun 2025 13:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/TZJRlv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8402D5419
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 13:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030304; cv=none; b=AwrZICZM/jpGa12oQ3/Umw34X19ZvobVa+qz4uSwOD0k9XYsqYYay3QhBUQv2mF9u7cxkbaMiGfMmz2bYp+I8dlxEG3mZSs3vJ5vIMBK0gJF/MuXeYgF04JfmUbCIH0VVIICAFT/DM1vHm3XczMs8DTGDwHPWc/N3NsSasTPXCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030304; c=relaxed/simple;
	bh=DASYvfhNb+2DE4FVIzEICu3iK7wNmHwBQ/TclEhRxEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pOFcpLfehRB1V3TC7MN2+bRcAOI2N/IXgbyonThrssYHy6YSnZ6jtlvyHA3E9+MrRYGqmNM0+Nbs5RDu65LeVh0GOQ7XCJJEcSZpX1Ms6RYR35psOaOSpn6zZWgzx6K6LxDcgLArwhrDYxH0IKDPrdAEA7Ho0l9m8+RxRNBwIBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/TZJRlv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCYJPA008316
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 13:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B3DKye6fgw14zQoKRPlEfu7aezVTsZmbUNecwjwCMbU=; b=H/TZJRlvPlkKe58P
	mYf0/uRMYn4I00zjGoKaOV/SEIvqHaBa1iw3jehG1TbF9XoKxf/ykbVTnQHLzfdJ
	7SZFgonKBD9YcyfwqAui1NR6k0MWoJ3Xs6ceB0dIvZZN+X6xnZCLhCKwA7g4kjrM
	DyfoGHDTYN0DuXFVgfTu/VHeUzyoelae67zJC27ElCKtzhJTvLqN7XP+WelnmRgK
	1e+GmEuWYgIzN1Rwt0W7GJq7apZ4m3G/vDOdlAq59cmo0ndUzYgxc4ezH3nxkKLI
	CKqyjdhTXNf9pxV4/UZKccO7tu9jneBf1zTAQjQ8/l7HiUqeGC7V7vZ8N8RKk/SP
	J3OnUQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc604e5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 13:18:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f539358795so2079456d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 06:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751030300; x=1751635100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B3DKye6fgw14zQoKRPlEfu7aezVTsZmbUNecwjwCMbU=;
        b=RRQCZXXx7sghbzVOs9W4xQEMjVnLcOuHBD4HPbfwUsT+ERJWg/vuZ8ZVNZW+6zpP9M
         CYH3yTuh4s1Z9gJM6pE18HpI8bXl+eyWxpq76QvBeRp2TpCizAjuCEoWe+/C1QpEYiII
         0OXHi0uz/ljDA/+libWbOLS40AtLThHy/fFPLQdNwHy+K52Z2TYUJ8HUJ+pfd31yBwKD
         EguZAGb1IABYUszSZHBkZV+Q0Zor9LGAp1vWDtIYR53jejq8/2JxtcxeTLK734AeKh13
         4NDE0fQ+hz0KvCd/h8FQs39cTT7wkLmgXZg2qvXA6+XKaTSn5kyryfV3jsLWtqDpMyyS
         JtAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkHO2sNxGEwjOYWETNGuCcLsyFpV2rcPpeH1mtFrslhgxuMbO/o7VCgkhtnG35SFiTXmZJubAR8XReHA/4@vger.kernel.org
X-Gm-Message-State: AOJu0YxJUKksXonUcl1S41h1BnMAmgjjawEqsxON4lenl/YjtOJf1C0o
	7gLh4xlKGApLlgQlTwV93yDL9pthdVzSRrtiXSCh6EBJ4Zxco5LMB9ZNISTaSZw7xEz/xHovOE7
	bM5Kw+90cv1baUO44au1T/sBSuaGXMB1LEURd7j9z8o40dAmOHlR8lH92mmlY40T7GqnR
X-Gm-Gg: ASbGnctOOyW5jfdhXPW4IqpKs/Ae09TV7IjmHHl0Kv8yHcQbqzdb+xuMwkkKqylcfQB
	N4lxLeCvX4cCQofhSr0/bam2FrpYsFi1cPxSM0F78hZkYPdlhN5tZTA8d58Fp/XM3oARcQOcp8W
	aAHqGTmUdCKtXeAu/iFu4yE8hz+1QSBt+As+IF1AExgcl0Uh2e6wTOOibSRi9V+U3adeBwXlTaq
	XnlSe27TwLMmUi/3rVsrE6EXv7pcS9yynlJDG6v5y+w20+tH955ZHSXkkZHC3PvM1+FwVrYLWBa
	hz4i4rxfDTGfY0crgBZnlPkNZYffwPsorpvZVyIIBx/PD0MSu0yEBOC4Y7EO+1fEBhw30OYl4gq
	ErgE=
X-Received: by 2002:a05:620a:45ac:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d4439b767amr166877485a.11.1751030300379;
        Fri, 27 Jun 2025 06:18:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUjyId3keHx2+y/xDg8fhhpls0ND2oa3mIvMxjZRcmTvKRosNCivFewSfNCRcPy9zLXcv5QQ==
X-Received: by 2002:a05:620a:45ac:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d4439b767amr166875985a.11.1751030299816;
        Fri, 27 Jun 2025 06:18:19 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353659f7dsm121431966b.45.2025.06.27.06.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 06:18:19 -0700 (PDT)
Message-ID: <6aa7ce8e-b963-4b93-981b-771726349b73@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 15:18:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/msm: Remove ops->pgsize_bitmap
To: Jason Gunthorpe <jgg@nvidia.com>, iommu@lists.linux.dev,
        Joerg Roedel <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Robin Murphy
 <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Cc: patches@lists.linux.dev
References: <0-v1-662aad101e51+45-iommu_rm_ops_pgsize_msm_jgg@nvidia.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0-v1-662aad101e51+45-iommu_rm_ops_pgsize_msm_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VgGb6dfRXnfyNgCoSWi1ARvaSG8zkWjR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwOSBTYWx0ZWRfX8QdbhhxjoKnD
 J96VjU2JHfwl6NUufWXhdCS1mmP6RKMX+lef6SvWZ6obU+AvcXy8hoEEkU8KzXyS2LdGAVCBFnH
 VkgXe8plp2zl2NUGz4HFNY8DfhXV1Z+JeAHGUg5Ut319bHgzaLBFp3wRyratqnkS/qAd4qf9n2T
 xj1MnMmAMgXe+sTCeZfPzsJ0VwF8/HvTNv2yMW4vfgl7e1WSIsMGSd6Wp30kNhyLTsudoNQ1ZO6
 dY0OvNQxbLf60SfsxlqYn3BgyG4hzWswzNq1p05E0E0USr/Rq1ocoSBQsMBu4oI6b4SGmWFNHa6
 GjsDKWzILRBcKy0VIlixQN/pDlIRWRbZM+yPyd9UWYj18A5hs4tw6ATV+fv4qDnBXGwVRy2+IoD
 NfndZAgxeEzj7d4ugqrJZYhvbk+ZLEB/IlFX1w1dJJTBouA0QhxXKs6PKA8cI3n/5bjpTRjp
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685e9a1d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8
 a=KFRqgpUkTpDQm5BOWHkA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: VgGb6dfRXnfyNgCoSWi1ARvaSG8zkWjR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=948 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270109

On 6/27/25 3:02 PM, Jason Gunthorpe wrote:
> This driver just uses a constant, put it in domain_alloc_paging and use
> the domain's value instead of ops during finalise.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/msm_iommu.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> This is the missed patch for the ARM32 build, nothing is remarkable here.

This driver is a computer museum candidate and I have no way to
validate things, but the changes look trivial, so:

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

