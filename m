Return-Path: <linux-arm-msm+bounces-77051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B01CCBD6926
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 00:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91D344257B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 22:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2347F2FDC5D;
	Mon, 13 Oct 2025 22:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chMFoqvH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1E42FD7A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 22:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760393197; cv=none; b=NxfmK3RKaQTK+xDjZ1dNf6iLd1UUFvAIN8eq2Mw1FByRGiefG1X2ej7G5wdGKyIXysXxUAUhewAq9eMI1rYi7sDOtQWYgI41VOfpbfp0cR3SyB7SOrydzEAtEESgNsevBIOROXRydfzjDMOr0f1n/wsi4dubUCpK3vPqb5AYTv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760393197; c=relaxed/simple;
	bh=0mQcROW3U2B09sT0wq8Nq3U5t073QUqcJq01p/G++sQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c5PaOIg3g/Lb7DfavX+Zneite+r8uKmqI+W5BANpA4LXbH2f1ekYjN3IC6vbush4p0ceirT6uuVAtoG+THG+gOONNDSLZvynrICNOH4Fwa6RdCMWBb/G1GJOd6LaZc6I6RQVLnEcZ+nnryleiviYJfxC9w7W5MKqdm6s0BLkZXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chMFoqvH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DINg0Y026577
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 22:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUtnEqm9W0AyDzcUPO+4X4YtSXgTOf5YN5ccynW0JeU=; b=chMFoqvHOSxAgFbh
	v09Isy3HxUYjlQO8BwP3VJHHYB83fhKWchBnkEVB0NUIPt79DHBbPIx/E4EUkBhH
	NZ9ZkUB2TydWwyfBew9EKO3n6wLo19tsvLS9cDHnq0dYlsa18i4maba2DjSgeZlM
	CADW1UQHRnT/AJ7FTN6F/3M+ez96ckkZCE0bdrKIMF3AR5AAwos3L1u6SMjbXr7h
	NQH5DPsqDAbBNsBgklTxN7z1xUuYcAn7oE7+qK6ksODNPXhfXSE8smwSY8qki/KL
	G7WFGzsT76OixeOmrUxalyMxB3tiykV4+LI3aH44psJYzURwMUOZ/VqQOeT+t/iT
	snxizQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwgkdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 22:06:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28e538b5f23so89546755ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 15:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760393193; x=1760997993;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUtnEqm9W0AyDzcUPO+4X4YtSXgTOf5YN5ccynW0JeU=;
        b=Y7XmS1ntNwSTcuKBr9fLcthmQlqOIaLoCc+YUwnnvfsIojrfdAMY3cQyls7M0+8GG2
         eh1rnTRhtTPsg0NGdwXmA8wZxw6MDID8XWrRGrEVvQz9KiUM39HT7Fvl4ABdhVem2eJf
         fTiMkEEm3IYIPagZ1166LDnXZOP2NCLlSwRTNSWBjwDILWOAHlzRJXYbIhFwLJEUz27h
         lZbVggpj4tUiAdLGOPjzss56r4jV1o0+mTrJ7hxU7kBUS0ZI1WW9owKZfE+LijRLwJng
         ti5fWmjIqiHdE/3HpZuINHjirroxvjrj6LOj64lYO96zkymsSXHSRdAUKyRKusb8iWrr
         YT/w==
X-Forwarded-Encrypted: i=1; AJvYcCX1rbVbIg9uWhrQZTIpMnl56MJoaD1bhdXO+s0xc3unG2nffsBV57Tmcv4nqPSciAWICfQqKh7xAD9SlZSH@vger.kernel.org
X-Gm-Message-State: AOJu0YwCvbPQcJHHXvmBBAzfgvQ9+sJLTn8v/L/pdyWNQEtP7FvQg7V1
	1PRo2nuiLf2Pm+tGO2NTgGEZ3iynGo41QH6sezohDBpN04ScNMYmvTGwIXMPNVCUACAWbgByE3Q
	8bk6TQ/55guBE+Fgq0QOSqhdVleZcVsaz+BcIsjx/yKtF4oCQ+EKGPWNXbR4/rB8YuLrpuioK2g
	Ewbds=
X-Gm-Gg: ASbGncu7tWts7qt7epOS7lBwxiT96nE3GDXCWYB8gKj0f9C+LimCL32XEI3z4Yu7B87
	s1sTErcgt19DWnLh7b4TlHAFdl7hKlx0OV46a5HU1zMCLRqQwy6mLKNIMfTxcFR0ZijqS4HEcoA
	RGLsFRtuUXk+sJdfXSHLUEzJc00dGT9ErSWmWmpaYqt0nrU4eU2yBCwvBKteoGDW68/1Qrbx8xi
	LfZ+x7djBNMD10Z8K1OFydksqwlM8WJvOBIIXBXBa6JyqwwCHpGJefmpk53MncItPhWrYo6lC4Z
	3JzmeGgUDDvibuN5XDC9/K9YuMUy8hOZI1DbY/tgTS1gi+YKQMcNss1S80YrlcuHUMUTLgyyxnC
	Zat0xKKOZYFpPPHK2m2Bkw0MJKLg=
X-Received: by 2002:a17:902:f64f:b0:28e:a70f:e882 with SMTP id d9443c01a7336-29027215bc9mr286186835ad.11.1760393192982;
        Mon, 13 Oct 2025 15:06:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSxHdfBPn27c2WBgKTgU3BvadNjo70hod4ZuZVnZ6a0D5VESPMyyEHsceDdwpDA0twPuzhFQ==
X-Received: by 2002:a17:902:f64f:b0:28e:a70f:e882 with SMTP id d9443c01a7336-29027215bc9mr286186475ad.11.1760393192538;
        Mon, 13 Oct 2025 15:06:32 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f08ddasm142163185ad.65.2025.10.13.15.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 15:06:31 -0700 (PDT)
Message-ID: <62a54b46-aa4d-4e45-8be6-f2697bbc924c@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 15:06:29 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix bootlog initialization ordering
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20251007115750.332169-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251007115750.332169-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX7fyv2thellyk
 Mmeeva3KyWISg6pppA2cp+7WGC9Pw160BTbDSUMTlTzFDsSD/v99anTGdAa8Opo72PFeFqPiE6A
 4+osaCtzcna9GrtRgcZJ195wcSTOtEGerVx1JdPfV+1Pb626fIHfGC/aaf73hOhjJmDoRdzPknC
 474saZrplqo6pvk1Dcwg10w59ywRkoa85R/+kRlclF10+YFKG0TnFmF4ZSJp+5yKJZl3uLjB+Ds
 py6gBRAs8eKmKY6g3E9HqXKn53JqLM0ScALhWcly+vVyYuVY5WHQ9dNa1BQ53GFvT50g2R4O2o8
 LQCyqpMH+rT+++7zYxIkUHKWAIbEsECxUZYwxPfaM65PlXuGPyQofRWe2oHj87BdAuR6eTt8cjY
 ZNYbcAXz9O3SuOjNtdyzZ2CFoWv+9A==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68ed77ea cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=haWFd_X1g-iGgqmt7XIA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: S4J6mHL9ipc7U2KgmcfFWOtr0AQA0SuZ
X-Proofpoint-ORIG-GUID: S4J6mHL9ipc7U2KgmcfFWOtr0AQA0SuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083

On 10/7/2025 4:57 AM, Youssef Samir wrote:
> From: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> As soon as we queue MHI buffers to receive the bootlog from the device,
> we could be receiving data. Therefore all the resources needed to
> process that data need to be setup prior to queuing the buffers.
> 
> We currently initialize some of the resources after queuing the buffers
> which creates a race between the probe() and any data that comes back
> from the device. If the uninitialized resources are accessed, we could
> see page faults.
> 
> Fix the init ordering to close the race.
> 
> Fixes: 5f8df5c6def6 ("accel/qaic: Add bootlog debugfs")
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>

