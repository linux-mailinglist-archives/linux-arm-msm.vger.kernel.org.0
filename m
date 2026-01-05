Return-Path: <linux-arm-msm+bounces-87561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8597CCF5D05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 23:22:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA7A9302D3A7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 22:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13DEB2F3618;
	Mon,  5 Jan 2026 22:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQ2RmKM1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0lHbm3+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AB04400
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 22:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767651732; cv=none; b=ZZCBC81oArnN9pog8GZaeDrC2M8QLq98B5pQW58NV8y6IC8JDnvjTqQh81SBKYddEGBLLY01XxY8bBhCgUVJ+APXHY2FKlB81e2zroUW9V39nncBHINYc/ZDWn2CPmbGOaD/I7JQsA+PWaOEwpQcsO7ii0s+W9KaLexEsvrQmZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767651732; c=relaxed/simple;
	bh=xFoS8BL21Vsohu56kpdrQ86rs7COkNPQ81kIF8XOQ/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UhmYY6MITIlWj1WH5PL5tGeK7G74QuiRfp5pFKEHHNV5vVYO5++z5CVoFRF92NzRvhMKTnhT8d+i/bAIzfiAxEsdXtFuOX7VcyWaktfoatAVtKiLAui/r+AHXTzRuY0Ud7HBnIXu0GKSi6akNQsH8OGmDuC6Q9xr5OZiXWBKJlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQ2RmKM1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0lHbm3+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605FoaIL1617156
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 22:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xlK1yGtAMRQCU4TTQJuWdRbB
	b6vuez75Pa3TFUS9pgU=; b=CQ2RmKM1EZGjndyKkaQ2jVesP+XMnViQ0RnUVym1
	R+KZ7W0yzOFuVvUx/r7oCUg8btFxKlB0pYRHtpHEfRXqh24PBcrOin6Wir1abyle
	M++8zw7ZArLgO1VGXQMGTjBd5jkhnMjzfvSIr86FkV0kKNeC1vqfegz975tP3DIu
	BuG+/Zlrq3smQm60Y1xl5Q8LjyxUrab96IgJjHSi8XYtyjZ/7JGetJQrAbeTQ5pf
	wRyYhu9q63AkNbNc0dpzh2HzM4FZwgXGyR5yqwVCGFSfDYwk18X1nGXRR+Jti94Y
	7sv3FdUI9Ja2PWoqEkE7zrbMKi2yflwMJmQ2cDus31rakA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgg9ys35d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 22:22:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edb6a94873so6704011cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 14:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767651729; x=1768256529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xlK1yGtAMRQCU4TTQJuWdRbBb6vuez75Pa3TFUS9pgU=;
        b=O0lHbm3+7pxJXL1Nrxm1l5ZJR6Az4Wje6dpeK+azciam1zEs1FVuJAyswbaY+RIMiY
         w/DN8YFsRn0JkyGnYmJhU8pVeTnoSQdZ2VH5lssT4dzoo0nkJzlJObIl6nHDNQP/aJIV
         efwnXnclGOkhgcnSLO4nfTHnaHnzKXO4AgoDc56WrUJCFQHIViwNya7J88ILdqT/fYlP
         6VMqoknpSQ4jPi6/eMc5cCHSkUr4XlnAUjj/PbQc7DdoM983IyHH1D9mf6cvSZwS0OVG
         sLyuq+bk1dP9nmgEtDM3GOqsl0ip3RitdzzUPvlLgMM7vLUkJPC3kvH1V+07u8wkGs4v
         bTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767651729; x=1768256529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlK1yGtAMRQCU4TTQJuWdRbBb6vuez75Pa3TFUS9pgU=;
        b=rg4eIvMjW5TmIXilrPihdBN9nZze7XCzXRxQx7E08CzMlykn/sPkdqSY+aH7EBrd+o
         pDttxmc07whElZEKUIxpBocc3kZXkALXA2mM2qn9Fv6egD5xNRS1JSp2EArgWBqMrIPH
         6lNmULsGp49GMNYP/V8tLkI3uNo0l1xJmX+dXhEHBr3a8OqUpWAfl0HqU+1//wfgAkbz
         3gnG/QrhJnANJCO8pYQFW9H6tXLzRJOkln1SzCIdiQ+C8Sa5FHEYMSBFV14Nsg0J99HR
         Jr16bQwa6+Hze0HQ3/TCtYjqBloM2A0/B4uCPoWPnx5zS6kjEfdqrXiSJmgZpnjJf8gQ
         8amA==
X-Forwarded-Encrypted: i=1; AJvYcCWSLztPud1+U1Vmw8zdGZ4o5CluG7QQBz3QDZLECIeGiqWkRNMhiNLpgYg8EPOQcPIfiV9ogBuPjBEYE2q5@vger.kernel.org
X-Gm-Message-State: AOJu0YxuOcdLo174kA6lsOuTyPbO1PeLvUrJ6KYoqVyMm+95uUc6REb8
	4iDxTySjPJwLz7iRm90bN+DHAQg0ujJu9++yrIoOu2b5J0DhqL5c+hqb2fZNvfaFfOjqEqYzA6N
	U+60wXAWgytGmlYGx3EHeSOVE1N1CvOCbXaFwpzVNyEMBkdWvdRYc1zwj+hGK4syiacij
X-Gm-Gg: AY/fxX55cHVzZBb7f34QKGkZsdmARPt0tBikA9Y3l9CR9fdQYzohsPdn/NH/uWytGrj
	srGHpZLieQZlEy/RqKiehh9SjThRT3gwljWy/+iNWCFZr0S/YEnf+8qIKiVl1s0vbXejHCEwi4B
	wuWv3AxzICOh04xtsHPzIBsKXZpwiqar8+xqJRdGm8/SYzABcbJGl08EWFj2+RltLp6Ks8MvDQV
	YmkSu12LLBFTOyIpfeDOb6PWB/G/fMNlJ6Chs6zi8qwhkvxoYAccvcM783VxlONb/ZneZGwUTv4
	ZWaWQ3An2vA+9ufwkgILOrzDXX8QgDTDSTP6bmnLE7DuUAa5W67q27wcQj92lND5lFYJG0jlAKd
	2syx1N6QRzyrNMWTojcVZQI/kDWfGQqzQYOAyeUu4hpw/b810UKtcFrvbWmTjoGygB+g9fCguTR
	oU6YjJpmdRFycAFIFrIQNoAFw=
X-Received: by 2002:a05:622a:5a15:b0:4ec:b599:2879 with SMTP id d75a77b69052e-4ffa78045b5mr14148571cf.66.1767651729010;
        Mon, 05 Jan 2026 14:22:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLfqYUHuuDhotEDrmSjd0PzwXZGTJ14WL7d3bG5GF/R2Vef9UMGOE2HKXO71V6BSrn8KHciw==
X-Received: by 2002:a05:622a:5a15:b0:4ec:b599:2879 with SMTP id d75a77b69052e-4ffa78045b5mr14148341cf.66.1767651728589;
        Mon, 05 Jan 2026 14:22:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8ae562sm938841fa.26.2026.01.05.14.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 14:22:07 -0800 (PST)
Date: Tue, 6 Jan 2026 00:22:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jinwang Li <jinwang.li@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH v3 1/1] Bluetooth: hci_qca: Cleanup on all setup failures
Message-ID: <qymmgw7oteikzceh3kyr664idl3asfqz67c6ibgpjruet4leje@e6xq3ov4gsag>
References: <20260105141427.196411-1-jinwang.li@oss.qualcomm.com>
 <20260105141427.196411-2-jinwang.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105141427.196411-2-jinwang.li@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M89A6iws c=1 sm=1 tr=0 ts=695c3992 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=j7vk0x6oEzrLbjgpdhAA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE5NSBTYWx0ZWRfXxK5cWM77xbCP
 /Sb7721yJFdn1HnUdJ2ObdU841EAZLAB4idmg0Jq9W41qenpX9UVUFOQe4mdtmU0WXfNEP/H7xH
 42z7LtKUXrRsAQnVcBCcrFYCBTkKz+/cYJCQW+V9GIYGvVkoswP4xUWHIP4nPLBWGRl4IgoR1u9
 NDtVLxepFDQvFk1ucPNoEQ2LBMcNtybsBLH46U1IKQSb3WdjIdEyv7x8hK7/V9b2pnPOFmV1/J0
 pvEF8YtiF0t2dnhjjU40f3MkIV9WS7ZSoC5HfGY9MZ2z3B+cMozpxev8w92O+kO1ytiey2bDULw
 IUpXTByi3IN6P8Rs5FRWj21FjzjTTOjs25wEka/cR5lLenrpON6UwDqUu0lPdtM5ZEaRydIEl3Q
 ETMVisudcFYEQLx6ZUI8NEzS8uRyc7GqtV2UTIq6VM0lE3kVRxgpoVwgOCtQsIUY8EN2ZZc8Elc
 G+uONbsHMZBF2rKraBQ==
X-Proofpoint-ORIG-GUID: IQnpVfaipPUpnQghFy2PA18fcGhYedzm
X-Proofpoint-GUID: IQnpVfaipPUpnQghFy2PA18fcGhYedzm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050195

On Mon, Jan 05, 2026 at 10:14:27PM +0800, Jinwang Li wrote:
> The setup process previously combined error handling and retry gating
> under one condition. As a result, the final failed attempt exited
> without performing cleanup.
> 
> Update the failure path to always perform power and port cleanup on
> setup failure, and reopen the port only when retrying.
> 
> Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>

Fixes?

> ---
>  drivers/bluetooth/hci_qca.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 

-- 
With best wishes
Dmitry

