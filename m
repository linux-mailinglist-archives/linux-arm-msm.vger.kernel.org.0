Return-Path: <linux-arm-msm+bounces-64559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE11B01B8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 14:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39BAF1CA59EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 12:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BC928DF27;
	Fri, 11 Jul 2025 12:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f9svvUfD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03C71E5729
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 12:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752235879; cv=none; b=Gbx/M7BUZhvhKKU9RvVJIQDcrnytbnk1lDuW5H/x9k7h7rLvFEY5+bYSdT/gyR9m7HWoZuWgdY6Klf4sIrWLmrnjxJ3r3AVN5ZT8xDA9cri3av4elhpa7RfLqxvNg/8hd68c9jzN6T4wm01Ir44i+dExhCFKj0C8JlyqFgDhcRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752235879; c=relaxed/simple;
	bh=20yEYpgMk2k4hfbLWF68tB2yj+fPDxYnbRbzutQZA2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z4U9WK3cGW/XGKwmfObr+RXB6k/uPRZbr2RifTi4R+2l6Vdhkdot46Pntp5Vzc1p6u4J0ay3+7oHaGYSYFTITz8aOL5Vpy5QYQ6jGFBD9NsOVo7bdfjAj1DQBiqX4eePM6dShagDht32fQYIKjNRFEq22CS99n9B6YWUuMV1OFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9svvUfD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAredl017350
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 12:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1hO5ND6o1S4IRbGj5wj/0aZsDaznogj0eIPmth2a0c=; b=f9svvUfDp9Jnkuro
	/Otf52GwrL6hVPRd9W5oQmoDmEYwa21m/RQqDUHw5OGpbuwno4jCiWK/Kc8e7Isv
	O2m2Ryc+idFGStcBUEQR5p+IWt9/VmY6oA/3PliR2cwLxoOjhHj0FkB1y6+JcX3T
	5F8WUupJkLnggtGntEnJcwZFSrs42I0R37W00CpY6tY5L9kALE6v+IIM8yBqfQDp
	/karLPWu4A0wufUCQ6GAliMqT5LDws45/59sOVF6+7Y7CjpXyai5khQYLGzh5XMy
	66JtVxS0330kRMHJNeExIsRyHrWsaA9Ez7ne6yEeZEtPFBcDNMND4XOG9ECPWgp6
	eP/lOQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap8gh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 12:11:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3eeb07a05so31615385a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 05:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752235875; x=1752840675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E1hO5ND6o1S4IRbGj5wj/0aZsDaznogj0eIPmth2a0c=;
        b=Bpr6TlyoscAfwP4vTs9I2SRl+HR3fY/EGhSBXHdat11RiCwjN4sij2hp9C7XypwfQy
         My7FZVEyUxEXvDhl60NnceLLMUrcS+PLCZagklo7TgtHcnCDHJBq314bXrUAbnb10lYJ
         zNR4pGyIellYwcy9FAcP8zmGimZQq9RslV5NrdW2Eys+SwJYODsidyfNRNkVsQUe798s
         8/klETqh21sHI9XRO2dZCNViLXcdgUXhPZXPVW68nZbbCWRj1GDYO0UQX5sTJUNhDaE5
         vkRYY4R9rgmpl2rtgXB9VkpKiVw9DlJ2/nV2ZRshhRaDsFIXVCaDIByKqqhYb4WSz4Aj
         oUzg==
X-Gm-Message-State: AOJu0Yy0Keic9/8lHmqdAvDXo8G2qt52YXcbTGO+XRfv7uZ0+q7zXkWq
	LYyvjZ2PXTamPnemK9zelA6QUjO/AbmTdIJQ5nyh/yYtuYIxNMPFsGggpF9/ctiKcrklpHikInc
	N//Gd9GJZeO2qOffZAfB+VQCmyCtJx7mfUEng3KUh8e5mXwMyPNz1O7tiutZwUMu3HfQu
X-Gm-Gg: ASbGncsepFrfcpp/XGEwP8mhCQqi8d37JOOkFBBdOREKS2QcVzgQz3gc9RL/LvacKRn
	9IqHG5y9ZuBKjrBA9aPnQgtsyYGmp3PFIzAUeFjnlzZZL7/9mbLTjG/+vW1foOJTPt8CAGaaj9y
	buXWsHweFwDTMJ9plR2MD3MYWQm/RiNJwI5czqOubfBRKn3u9RYDy9iSIujQRPR82WKyjo8CXmu
	x4+SeHId/5NO1QxAJZyXo65cIsodrsc0bFcjMey7vgtImJ1C8ZAoMuWZ6g5gLCOBp+JA7TqhxPN
	g+gE5tdWR3C8gIlxbsZAcUb5ttCXDyo0flJ9+R7wUcBlxIAqBcyTrILcaE17zQS795OKQl3QhgK
	BahUFl1srnSOENXrYgpRQ
X-Received: by 2002:a05:620a:448a:b0:7d4:4372:c4aa with SMTP id af79cd13be357-7de99b58108mr141908485a.8.1752235875398;
        Fri, 11 Jul 2025 05:11:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG75AwJO8klriW48siiGrNDo4BitXOJrFV1MfgzRcCNWaXRSKsT3osDC+MWRuxa7QZti87jFw==
X-Received: by 2002:a05:620a:448a:b0:7d4:4372:c4aa with SMTP id af79cd13be357-7de99b58108mr141904985a.8.1752235874558;
        Fri, 11 Jul 2025 05:11:14 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c95256d0sm2135423a12.24.2025.07.11.05.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 05:11:14 -0700 (PDT)
Message-ID: <3cd5864e-e6cf-404f-94b5-b85866086d76@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 14:11:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: socinfo: Add support to retrieve APPSBL build
 details
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250711-appsbl_crm_version-v1-1-48b49b1dfdcf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250711-appsbl_crm_version-v1-1-48b49b1dfdcf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=6870ff64 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=GUEbe4ff609SwjsIVCAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: oMd9-YDGDwVWnQ4etcD_BvkQpDW5DsB-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA4NiBTYWx0ZWRfX8A6i3KxSb2+8
 85RQv6eEzdM9LPaRY7d9BiYfloNQEIOU6+LD2m/l1EZ5GfxtgT7/KcwKuIwKEnQ7hNimuNHg04A
 XpybcIViBNTXjEAJlc1ebK/DrGWaHU4IWcEr/MjuXYUhEpwpm4aFZC7vRlurm0kHon174NjIvlC
 iWFx8YrxfUzd48ISmcZpltfEh5QwtZj57ynlKWRDRZZky6op9p6vBWmLAWm82qr61PJqi18l3eL
 Opu4jCjwJ6HGyxiQsGg+dJd391/cJvrgsYaSAe/z46sgBugxlvLfBc1zTCJ4Znkha02EB1jMPEF
 kBcrNodTn9+KO2yHeYPeC59SepPvaHJMc6eBfat4XOTIPJ3+/v+JkzjSjPage62G9okMyeHQRnK
 vcEtsDzeHuR0fMOAaGBVhhdDjSsQBRaFSXvDw6GM47gAQGz0x8Wiu5kDqwpcHbfKvadkiPC6
X-Proofpoint-GUID: oMd9-YDGDwVWnQ4etcD_BvkQpDW5DsB-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=576 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110086

On 7/11/25 1:03 PM, Kathiravan Thirumoorthy wrote:
> Add support to retrieve APPS (Application Processor Subsystem) Bootloader
> image details from SMEM.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Can we expand the driver with all the known IDs at once instead?

Konrad

