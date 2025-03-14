Return-Path: <linux-arm-msm+bounces-51448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 986B7A616FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 18:01:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC5A14624D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 17:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FEBB200BA3;
	Fri, 14 Mar 2025 17:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gjrhRMkp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A288A3B1A4
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 17:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741971665; cv=none; b=VAzeuSaY+pGv9B6iEfKw3X8O3cfL/bxMZN5+wK/8FxowKS25Ns0/bDuxGkafTySWtUEk2Nc8F38YTlbxh12SrSZGBuU5mfb0T3Ut/JcnGVdqOPW7ChzDv/MbnD92kzaT0/c2UWsauRNJ39c3VtJDayCmxilY4T85Ljp2OxZ2JOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741971665; c=relaxed/simple;
	bh=2QXPnUe9GLVtbWmmtYMb9nsF5q0waW4YXO1n6P3kWYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bgkrm9P80cQh9KgUyDQf1lCsndXSmhnFWHP36zHLOqKPsnvjGUr8hoUrTG8kRa9Z1C3p+dGu+9XfbdBc0U2uQ3OnPcr6VD81WPWCsmVLSNOiFL6PTkDGGjtg2cJc5QbWp+JbTRVduzb+USaUXaiShIufuHrFg+13PcGNMeJnTfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gjrhRMkp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EDu6Ed024861
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 17:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iZxIc4fXmTh7BmZPiGBzFz5sN8PXR72zH6C4vE4Nqcw=; b=gjrhRMkplGuVsQs9
	DJhFeCrCGcvtiTB/AuOtPcKHM+XYs2NjAmt1N+LV3NOOmzu+FKFLZvnd66OgPO6l
	our+icURRo0c3jm+ikJibDnsUObQ1lUjXjrwvurZoRWQxqiK/NLHzI42+49OcGY5
	y8PT45hp00XR6GRfWPkSG4CKBhMB7fbOaMQ1ukOF/smeEJHxsoLlFJqLsNXUkVFO
	kFDWN4Jie4rpUc/PEyI+xkS+41U7ikM63Jie5p+wW7809koXEfpjU7hr2vAiEF6T
	ccidCVmBHEWBbilRidFoBLuS1tEY8WhwR/Ps7TuL1iD1bln/DUPNUwzWJhaRhv1k
	dMYSEA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45cnscrfvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 17:01:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff78bd3026so3924357a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 10:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741971661; x=1742576461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZxIc4fXmTh7BmZPiGBzFz5sN8PXR72zH6C4vE4Nqcw=;
        b=kPmVZLyILSScTQTfIRuBitdWmxKQ8dpbeXYInFk7d/507us7lwqTywdnq9qCU0+9mp
         HTAvXsfdgx4o7YNMGMouP6vA4cfTYIHuzUeLG+TLlBTIHw4Dv1ho/137nmKwfsxF51Iu
         r0wqfzmRHwhLm9EhAxriq8Q7T9Pwz0/p96ChgKj5mUZzqqDSS9IKvfrtGi1S4w4d4pT9
         LpiI/7n8MHxlBVGdHl+3UjothulUG/VPchZqub4wfZ8S9lSKRUl3kNbnD4YrmXJwOQJ1
         IikRFRE57lJAXaD8t8UhAn+29T/7NoLNdrmP9qkqpyWhrCE0qKpEVlBqMC+7m9rlpdmk
         WfXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBmd8CWJ1d8NERCzcmotgdqivwp9pqKk1PO1DIHIXGaiVSVZw2RbzIfxg2uVVHpfVhFsIJQjjq9i1h/cNX@vger.kernel.org
X-Gm-Message-State: AOJu0YyVYhkOw5Y8gEDnR4nf2WOtvUhbdYwIXwqBDOxN5APZN8Ibe5Ic
	hWxP9929tXCQzKiAPskA9/iZKFW6FupgU/XW0Y9XKEeBOpy5GSFyCW9+D8EfkVmTS2DT6rsWVIZ
	MB99MjhGHyeM04cENgBs/1QtbwRUlPqRtDqPJ1Z0QnuuC+OFZhlPuvjXaTQlkNvBGZLkgDXsd
X-Gm-Gg: ASbGnctsbxpXHgq89l9Dfb7RdnX4ljXSY2Kvmwxni0AkpiA5ML/mo9HioQDUFjp4NyQ
	oeA8/lrw7J9eOo+Pu6jQZNx58K6ELJgOBXHAOHDtrkN0U+VX+DhswJGRJ7uYkLzSu5KufNxFwh5
	qMzfqVWXlxXX00+wXeIAi2YY04nHoMyRUMV9QToKFtjK1Dn13sXwlnWWiJF5Y2jsd/N9G2oXLTx
	NOH+InNfUsTiUNpJmsIVGZc0JBCKByjDC8PBwGWJb/FCVsKioBu+Re84ZUEuHHyslSjasVi/vkS
	ACcTTC1a/5YvsdbhjcGmBiduOmR30HDMuywCeja8/L9fHH3KR8QuB37m7RDojvA7xg==
X-Received: by 2002:a17:90b:1d4d:b0:2fe:8902:9ecd with SMTP id 98e67ed59e1d1-30151c9a224mr3857589a91.1.1741971660612;
        Fri, 14 Mar 2025 10:01:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7BkWC19VSzRPfQ+JLJt7WQkj0MaPieUPKAMlO8qGoLHk7FT7I8XtR55RY0QuJlSCC0mYjpg==
X-Received: by 2002:a17:90b:1d4d:b0:2fe:8902:9ecd with SMTP id 98e67ed59e1d1-30151c9a224mr3857559a91.1.1741971660259;
        Fri, 14 Mar 2025 10:01:00 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3015363278bsm1240065a91.31.2025.03.14.10.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 10:00:59 -0700 (PDT)
Message-ID: <64370d2b-88c5-4663-8746-28bf36c6bdef@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 11:00:58 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Remove redundant 'flush_workqueue()' calls
To: Chen Ni <nichen@iscas.ac.cn>, quic_carlv@quicinc.com, ogabbay@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250312073404.1429992-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250312073404.1429992-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Qbxmvtbv c=1 sm=1 tr=0 ts=67d460ce cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=jdnOPd7pnXj7N3RGrIQA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 8xQ4yNFje-01eRxITqM4lD8aAns6bl81
X-Proofpoint-GUID: 8xQ4yNFje-01eRxITqM4lD8aAns6bl81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=868 mlxscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140133

On 3/12/2025 1:34 AM, Chen Ni wrote:
> 'destroy_workqueue()' already drains the queue before destroying it, so
> there is no need to flush it explicitly.
> 
> Remove the redundant 'flush_workqueue()' calls.
> 
> This was generated with coccinelle:
> 
> @@
> expression E;
> @@
> - flush_workqueue(E);
>    destroy_workqueue(E);
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Pushed to drm-misc-next

-Jeff

