Return-Path: <linux-arm-msm+bounces-77450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08396BDFB84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 18:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BBE43E5612
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 16:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89549338F28;
	Wed, 15 Oct 2025 16:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZU5xCOqI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF7C3376AF
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 16:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760546656; cv=none; b=qBRgF8SLs3gqDnsAVsFlADqRmforZMBcXVFfKS/DDT4BVutmAD84pXZreHWwfJXmnvGqGfUxfhHFjf07w1gL3F+UN+XZh/LKNbgkMPfBsckXaKYP9g1StCrkutdYgFoGMWt8ZTxd9K2/1P5QtXpPRyBNV8F7uveiMnRgv5gOrQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760546656; c=relaxed/simple;
	bh=xrEFoB5swmjvWbEgGWzmW8FKVbrCyUvfC/271VbgHU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=evwgwosxTJ8SpzytSCJlQRis4WABKtwTB+vmrVh2SbSmLRjPvoazMX0v4DaHZsZbsOgJ+s92qXrEoHZcPCm/8xhSmPBRKh1TlRvPjQBMWTRjj0ZHznhIDGY4aQpeiY91+oKUVcAzGHg9ZnTwAyZXa0SHG3xELSAjjtWJ1GUrpDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZU5xCOqI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAabCf016719
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 16:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GzaI9a0N9LFuD1tLyfhK7VAWX8GeUCRnbgirvzK//UE=; b=ZU5xCOqIm7UnWJpH
	A8KkT8ke06AG7uaY7U0tukIFLZfI8e7nn/T6mwcdXIa0vdVQNdN8ejw+stiPE7Ey
	Oy5B/ZINydC+XHLMp/U/UlfAX++dAzfmteyWRPV4RRJwrfpFWaujgJWiTSJqikVD
	XMD+fDMXVfvRZjZqQbw6zkgw2/3J8Z6pEYUbA7fnoPjlkcnmzwOVlVM22emlFAW1
	zBLnEc8VicszwgpdduoUJElbSR3Nv9Ke6A0B0yybHSF/zHlq3h6ltNW1BJ0DJ9BY
	HqiLyfY1n4vgJ6J2yf9nCRQBc7HNr9aEElYbCrc2U/XhrGeZUXPyvXPG936K9ek8
	RilfhQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrta5jw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 16:44:08 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b630753cc38so17407397a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 09:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760546647; x=1761151447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GzaI9a0N9LFuD1tLyfhK7VAWX8GeUCRnbgirvzK//UE=;
        b=dds8/yrCSERASR9FOfRyckVHAekDCA52LXvLXjw2FwS9fQ1UbMB1dM1xvsJWS9IWXT
         UT9q/TmNwNOrS1Oy543m/frdaSFIuxkIs/CbX1I1o7ArRHbX5c7XDhQB23Kc2weGOJkA
         T/2ElSMBDYyHrKappYB9uJRVaYOFUlEGL6eBHZTqc84aEhi0ZxKpQbz8O0DyZPy8JV9S
         xrIhg5Hi8hFhyeVoV/K+Ejsu8F7wMf8TdapY+e3fVsgsKqroK71iIZ8OCUHZ1aNYtWzA
         V+j3PXxJ/5UIByo27rmuB9FAg20E447NyhQQzvt+HwUeCWiKliGlKT8WjLbGJK/lc/GT
         WjsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZAzx9ACtup+Z+h3V8sIsaV8G3A+Ws0PmcFnLeALIeq+y9xE1oW/KoSXEAicYX3Yc39VoFOw0zD7EU4gCM@vger.kernel.org
X-Gm-Message-State: AOJu0YzFoCSygXBOAWMEO5bIdJfFYkXILTf73cnwk0BuSCRDbwTSROVa
	AaPq/+oU+QwMxZL+NQIsSG0Ux5E6VkeJGp8+9ZLPPQoA3s4XUa05COzBaFpTXbQzgrT2V4TSap1
	+cvzrTnYPYJ57g9dQWQghJcq6m0PahChn/en84HMaQsVa69g5wfvaM1NJAJcRs9nbp+qT
X-Gm-Gg: ASbGncsjSub78uM9CbdL+iRr0Drt/XUvn/d65bSv17coxCGFYkAA0WLx0Vd6hchKIvt
	lw1UlOyYNk7obP9H7N2epOXNIo8nTkdCoaLqht6ppmivlqJhb5BJOmaJDyBzhc1vx0AoF4Hd5pr
	4Vx5qVdKEhxeEwhJRyoeJ28XnUP8w9S2ZaI5FOcwHPphF8+ELUmSfd/E/k+pa1cE/l75/4WYDQa
	i6apb/Sz5jMB+b+3u4QRIxvWsc/krDXzAppwTDKl8AjgCQp/9dbkhmmsvuCb2IaiCx0Pat3+h4D
	er5Db/foNOSnmvcNKLrLwqn0XEYvqdoDB13wrH062yOsXHkiJK9xUo54RJ2gMwPnGjDUVRajmLX
	AgM63kkg8TraBKg==
X-Received: by 2002:a05:6a20:7490:b0:2e9:d6ce:e125 with SMTP id adf61e73a8af0-32da80ee0aemr38623881637.5.1760546647119;
        Wed, 15 Oct 2025 09:44:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFToPLdatmPtsmDh1wnrXKMa1X9zL8hl4HwVmt4ke/y+HjLAJlconjC5RaXc/ql0sTr12jbDA==
X-Received: by 2002:a05:6a20:7490:b0:2e9:d6ce:e125 with SMTP id adf61e73a8af0-32da80ee0aemr38623847637.5.1760546646673;
        Wed, 15 Oct 2025 09:44:06 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b63e05csm19309506b3a.22.2025.10.15.09.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 09:44:06 -0700 (PDT)
Message-ID: <6d77f359-1bfa-400e-8c9b-3413dcdb2e3d@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:44:04 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix mismatched types in min()
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QXdIuc0eSTc7VPlgmf12xGl38Z-xdKKX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX6XlzQB4MwqLX
 qDVe6L8pU3igH5Ys7/6nXSwoRdlADrq+kG+6eLb1auEKdejxgB62ap8oxsSNvFMT00stDQ1CK1g
 oQ/94oWDy/TvRGZKoubTJlDTwWWZSi4ixfR4not+wkVtn0vBmikz8t7DCv2a7tpKNzFSrbURYDq
 SIPQ2nSB7Avv+/UAz0kPwo6LLbgZEKD79byHhshvPxlDv1Ovsf0Axul6sUfZOD6HsIb5XbVUD20
 Pri6jhaFmPB77wn6iOrtm8p7rjC8aLPUYCmDm4q9kGzkUZvZhDOXjNb3PmWsdswIYT3fDl4Flrz
 Ej9lBpL7zIHsZww1do2kegLlbRt5Oyd+lDrerxT0iDdK+9gcfu81YEdTKYWUybCg0WCXaiRbJFY
 h2nmT+Wzmlap3bzAoFW09489cXbmIA==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68efcf58 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-G_G9_dvTckeGbZ_RL8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: QXdIuc0eSTc7VPlgmf12xGl38Z-xdKKX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

On 10/15/2025 9:37 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Use min_t() instead of min() to resolve compiler warnings for mismatched
> types.
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

