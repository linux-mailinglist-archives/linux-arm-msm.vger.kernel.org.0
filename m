Return-Path: <linux-arm-msm+bounces-58469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20523ABC056
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1550D18965FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 14:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D66280A58;
	Mon, 19 May 2025 14:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dd8WW/JO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07E2280A39
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 14:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747663987; cv=none; b=St+ivxye/mhDZdzop8nBZt0jsI3ibCscZ5EETvJeVM1htYUp4VuRDk4wVdAIuHhyaSJKIqOOOb1/ldDXRz683mIt+NvuQz26y7Oz32SrE+8GYGEnV2HvaY6ZvijTtF6bKZ1DmB2ZjKxTbfsoOjw5wklUlhRINHfDh/qU11fWgGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747663987; c=relaxed/simple;
	bh=Xhux39lBBQKuPR8VzWQRXBJuBTgP/d/kAe1GmAif5J0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IA4Qktv0X4X3bQZN+27QnlbH1EWWxQogy8iOQ+cdf9ZuPw0WlcWc2Jlk8I3R/JWBBbVGjlP/D/k4AKH0jMXhIW5SwKbK/F60SNv/sAbwEzyomZt4tH5sFJmxXDJtr8Kfvhq0HMLZiHxFmy8WARNeIbNi5KMQ8XHa/2v1539hm7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dd8WW/JO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JDhfQ7028704
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 14:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rCaJgluMmfXFVWvhFvT9T3CnWrQInCYbxFEso2AuIX8=; b=Dd8WW/JOvAUB19RG
	Y6xDTbA1jTR2Yth+8Dm3JLB+/nA8sVLWgwOAbeirpRRaYG5NV8FiRxzVCde/8V7P
	+KzXH5hfwXj78nmqfsqcEzY27BJxhNIsllTGkYNpwlklOVU8yfWV4G2scIksGDtj
	DbQdEUl7Jr11OMgmwwjnGGsExHDGBo0QpyuRlnhPOH4W5cxqXoACUfdWZeynylXz
	Od1M/Q2nSzFTk+cBHW4H81zmnKHquPArOXN6QF26H5vSu84gYoZ9TQSD1R5QVP+y
	3QXY76mtfTaaRhPWgGa9ocjQZzRiEQzEtseqQClq1MpqygvAioMbsQ7bRl5wOW0a
	dKwa0g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7cjxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 14:13:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23222fdb4f2so25591825ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 07:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747663983; x=1748268783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rCaJgluMmfXFVWvhFvT9T3CnWrQInCYbxFEso2AuIX8=;
        b=W7Pzax8g02rUbHsaWGnvnfgC5RtlVsoq3FUnJjBrIDWJdqm0vEs1c4aP1oqQjbC/TK
         3kZBMOY5K9Ycpms0KI1pekNehPxqvNeTqp45zy57ICabKY2d2jcYIhCwkuwWyIagUWdm
         Z9eBMgq+oNDclShvl0dS2MO7QC04p29ilFtMtsVWvctFxub2e4G4KNNoIzymFhyB0mBZ
         ops9/+A/+wDLVoD1VcwlgksMe0eVIkvktw6qNgswU/1NE7NMZZnNnGq8VF2efjfAHkwZ
         7cNtHr/HqsE6VQnn2nlXurO7XmYqUZKlNq6RGsqRuwUx/hjub1lekCDbPqwxIuhG3NO/
         QY+g==
X-Forwarded-Encrypted: i=1; AJvYcCUC1aTfkkuNkOpIfjShAsUNynsFCyN9bt98mcYG5flQQFPnUfjv+2fCR1Fvn7UUH1R+nnlIAnuLiXPPYAAI@vger.kernel.org
X-Gm-Message-State: AOJu0YyUU4Dapaw2bpqzpBtV5my5Wvikyt51xeBanbshOYsL5drmUXPY
	2DUDK3ww1z2De0l37CH05VXYkmSa5MAdN879ZDgvOVV2PuasAcTQFlpf/lrQJcI0yuQb8HXZz9W
	UlV5YUyf0S5dJq29+UXpYrS1mlLg2mh6iDskxo5oYiztKLK0HwemnPKy9yfU/5N0z2F2P8Qbd+4
	Mx
X-Gm-Gg: ASbGncssInJOSYEfx9kQNtXca8fEbxaSAh/TddpKRM2tu7QFK3wiMBJQ4xkoDT3r20P
	wnYScDcI4CAhNSYoiqqCyfMp2Y7ga9nLhYqCpM8rR4O9Kpq6QGac5hsr8SgWNX7X57W/5BZnH/9
	zeRg/uKudYFpJ7Lgcrjb2cEGfYscTk4GbYHGoFLlJq5zvkzGz2GoNsXz7nbTdcQ9qrKE1/ydc74
	xg1LCuWim7y5Rebmq53cqpM32RodNtMa4kjFW4egRobGHWGqQ0mGh4gq8A/MWvGlzGckQl+bW/i
	jwnetH79bvfBccVME9+S1bRQwlR0R26NfifA50cGeNXyfACStcVqN8+ot9JG0Q==
X-Received: by 2002:a17:903:2ece:b0:224:283f:a9ef with SMTP id d9443c01a7336-231de35143fmr144134465ad.6.1747663983194;
        Mon, 19 May 2025 07:13:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOyFknI1B/0ShJdLNtgetMKBIvN9RE1Qjwwuij6mD4Q1x4BLuZcO7/mmxxHNOCBDtnP7jDsA==
X-Received: by 2002:a17:903:2ece:b0:224:283f:a9ef with SMTP id d9443c01a7336-231de35143fmr144133945ad.6.1747663982607;
        Mon, 19 May 2025 07:13:02 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4edb0d0sm59771315ad.254.2025.05.19.07.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 07:13:02 -0700 (PDT)
Message-ID: <cf4adaba-5601-40b9-bd17-1b1bfa686b0f@oss.qualcomm.com>
Date: Mon, 19 May 2025 08:13:00 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] bus: mhi: host: fix endianness of BHI vector table
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250519061014.12225-1-alexander.wilhelm@westermo.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250519061014.12225-1-alexander.wilhelm@westermo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682b3c70 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8
 a=rGmKAQFIsUGY2xqShAEA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: ONHZ_5b9ZMmdVAeWxJkQUcdp_4vSpxkL
X-Proofpoint-GUID: ONHZ_5b9ZMmdVAeWxJkQUcdp_4vSpxkL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEzMSBTYWx0ZWRfXwhJklZBqlDNI
 Cpq71DYA3UB5ryMIwcrj+ME834h70gNjqEhvyI9X/qq30shTXEexh9ZjiyKaaPNbCJ8t63Qcpix
 buRXb1+FP14sNd/p78f6+qeEjUh/deKk3vsi0nUZA/BjKWIwFWnEczMQF4UNnlUxxdwpjN21HhY
 ePTpI+dvBjw9QK5Tk7JNXXXoCRnoI8+DFZiC8jC54/IFXqlHMunVz0jgIpQsQwhhHNk4ikhQN4f
 VVjYiBw+eT3NdP2ejZY+q17eOW3lbgWycFJaiN7+72nbXSL4Um1SXRhDQJd3h3Hs5geu9Uy9SMG
 hEbvMY4OH4Kn6dQtanEmCybqyeArvjJZHle8tD7chcQv7JRBuxoA5uYvydrMUZUTpk1T7rkoRRW
 rO7HhC2lWeoXx3fob5RiU5Mow4mp2q5Q+GA4LgxeCQT4bCB9XA30tDi214TVyoVziBOMfjXL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190131

On 5/19/2025 12:10 AM, Alexander Wilhelm wrote:
> On big endian platform like PowerPC the MHI bus does not start properly. The
> following example shows the error messages by using qcn9274 wireless radio
> module with ath12k driver:
> 
>      ath12k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
>      ath12k_pci 0001:01:00.0: MSI vectors: 1
>      ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
>      ath12k_pci 0001:01:00.0: failed to set mhi state: POWER_ON(2)
>      ath12k_pci 0001:01:00.0: failed to start mhi: -110
>      ath12k_pci 0001:01:00.0: failed to power up :-110
>      ath12k_pci 0001:01:00.0: failed to create soc core: -110
>      ath12k_pci 0001:01:00.0: failed to init core: -110
>      ath12k_pci: probe of 0001:01:00.0 failed with error -110
> 
> Fix it by swapping DMA address and size of the BHI vector table.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Shouldn't there be a fixes tag?  Probably pointing to one of the 
original MHI commits given what this change is touching.

-Jeff

