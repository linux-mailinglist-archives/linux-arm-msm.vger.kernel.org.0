Return-Path: <linux-arm-msm+bounces-77236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AEBBDA830
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 17:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 61B4150096D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 15:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5496330148A;
	Tue, 14 Oct 2025 15:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cbNAT1Cs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBD1301013
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 15:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760457209; cv=none; b=G0S8ZlvoHQCQoexaF3CssJEksk01lXwpchl0cm3Nu5Ip5ejF28ffFZIO86g9jiQ77gdmhCY05nNol6uE0057nG9q6QO0C/DDbW8ycSwMVxKoDeohjj1PfxxMofJmIEw0kw2nA9HYMGk+fF7blcfuJ2ABQMwa8aQJMYWvXGyXDfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760457209; c=relaxed/simple;
	bh=aCqbGDUakd86Aeni/fl/d6NHS8MxL8w3HHkhultJ78Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8DE0otf0yPeyJvnXA1EXQPnA+rbwoQly1Jiz6ThBok8jXVqHaoyrqmQMtT3tbC07+XQhQrN9WdG0H8TwiIry0syNaHfwMY4sQ+4vA21BYTH5vChT0AXJAhEbSevKReWypkfqrDHIOHsNRgHvvwSZ12xFedgCspmz854lhEAPVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cbNAT1Cs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EFT8dm009033
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 15:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CYMg/VTxO+QlQZq6ElScXWxM5UsYviEIpp7XWocK60M=; b=cbNAT1Cs9JKt6ZTx
	YAhuJQTmbVGmSzDwrRGLadgnOzyGVxExaRVsX0y2KIn6gUSX2p+OJFg8ox5LFWgs
	N5N3fVx8c36PUjcdy0fY6HlFqQZgOWxj2lqMatL6mnKc3GNYnRrKfwxRAUefyzPg
	hBYjQeyruMWZWYUki+nbWxxapXJ9wHutKH3LG9VpMHf7lfGNle1E3uRwJd6BbWLn
	iQlT5J7Qkqxyt67xsAHuczTyycGMActe8NSWFpm5tAUziEBeocU3ku2uRwOjUts9
	jiXgdC8IYDepAmvSBPltOSnEAzqd9T2/WxqNeiet5Dllc2BJNrYGlQKLNBJ1ZNg+
	F06tmA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5h4ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 15:53:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33428befd39so22084383a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760457205; x=1761062005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CYMg/VTxO+QlQZq6ElScXWxM5UsYviEIpp7XWocK60M=;
        b=jxV13foFm4z0WffNtl9SsYN63vc8KkUAfyCp/wJ8lTEIj5HZcdU7KXafEulPx4fNbo
         1ccpOYjHGJoQfi1P2pKI9dJ9n0JCHOfeo4MZt4lTdORqw38LZatLXTWsf9Ae4Onf480V
         XUV3+9OvLbzRKlK6Kkpg1nuF7st9FPr7PsIH+aqbQBLZRjr+D403pyDlXZv4fT8xqqN/
         +xYZ8Mjh80yUbEU91AUS8m16/V73oeJRqw5i3i9QTC69RZcNAnbb3KXW/Mare+ut0zxZ
         1PCOrgSPUSUt7/BUojdqxx+I9Lmz5pphpFCEihqT6AKMZJ8cOSqMBH716isXfWOAelQH
         0PWg==
X-Forwarded-Encrypted: i=1; AJvYcCUriaxnCHa76uPw+mc9FzVgOhKlnmwqZ7Lhztkv6Orums31p4NZvRoC7/PGv9vw/QHmKx1oI8I0j0xXhAtl@vger.kernel.org
X-Gm-Message-State: AOJu0YwgeMEOX17xfQ+kEd5a2aVJ5oFTjpfO+x5XYsddsAYlusBAbYCV
	eXEyX9LCEfNETcWg8YkSUWS4SEY5HLoANDkUA5GZunuDRCFJ3KyOI+psbWR1qjCMZfb06/K/Rv2
	E0DEPXLSjKm51BzD++c1passX524w+0c+dtHeYqKnDnwC+BhTSb7KRqT396z++kNG6a0g
X-Gm-Gg: ASbGncsfsCtnlS8+aR116LEGzjBMyIhjPwVd3trk6m+9v5/18fDPn3vrH1SFa84WfQ2
	U4v8NMC5Tte86VpGRzCsc9Y1SYGpNHc1WdBFW1GMFJ4+ZC1GAiC2pS+2ag7NWxy4fN3eGwOh8kQ
	HRf8kAAjWVDbPAIma7jTimuIwaJhf2JENjgCwvv1+MLn8FZ+zesfOMnGqD6Mx7MwZbaZctlhFCp
	iU6LW5CMEHA9mUe7wQxXUTvxrh0zFz6tMDuViak+5zC8RPNU6Oz4tT2A4Dos5XXq6cgPgu70XvU
	h14f+bEQNtRb77s7UQUrSdCGUShFmJhx92u7wT1GeXf9uU+n4Lt1Hj4E5mtnwMIlpHFVhOxZ1M5
	zK1h3F0i9iJwFVQ==
X-Received: by 2002:a17:90b:1d87:b0:329:e9da:35e9 with SMTP id 98e67ed59e1d1-33b51106b13mr30016847a91.2.1760457205263;
        Tue, 14 Oct 2025 08:53:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFi0/h/KSkeL1r/bLVesMfLHrnMwBPy+wE5Y6BoyGC9WWR9jx7AjhcTjqZrx2RwfwgPGyESQ==
X-Received: by 2002:a17:90b:1d87:b0:329:e9da:35e9 with SMTP id 98e67ed59e1d1-33b51106b13mr30016830a91.2.1760457204728;
        Tue, 14 Oct 2025 08:53:24 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b7411fcf0sm10350248a91.4.2025.10.14.08.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 08:53:24 -0700 (PDT)
Message-ID: <ac804969-5901-4a9b-b6a7-c8d31c98ca41@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 09:53:21 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use overflow check function instead of
 division
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007174218.469867-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007174218.469867-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZxPePlJ2elcccKFdqq5Gtl09li7N_VY_
X-Proofpoint-ORIG-GUID: ZxPePlJ2elcccKFdqq5Gtl09li7N_VY_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfXwjLiYXlGQxwy
 OuwsYkmYLlc7JdrTkDDRhVnLoqY1n574UXj7sD3CICSU4cMWiFaWjFBx19HG+8D+BStWOPvuIWg
 6HntUZXePqfKlVOJMb/Rh3wIB1dc9w3OI5jNvnWRmu1eerP5SI3tyNsNhM3qrlsCToNLNCOjuUR
 HRUzKOgYQd3rbaHhYYjvJkJJjziT4i2FHG6H+ydOAmeDV0QCSoDJjvp+1GEZF9KPzb8kQJ0J/tj
 R3eI6MmoxWDVbmRvDKG5rPcesY0yHYPPADKUa9hjuiW/kZva0r7fMNSZ6RGGJpvin1K8jp+0Gac
 pZjJG0FK87F0jgsUtEc6lWFcNkrCYG8mNvODk02QFT8/h4/R9ZtyPoTtg+Kvtkwofy7k6XHnApy
 DqskCJn7s4p/26ml6Phn5+cemIcf3g==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ee71f6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5CQhQK5fGE5c9LPSzNkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

On 10/7/2025 11:42 AM, Youssef Samir wrote:
> From: Carl Vanderlip <quic_carlv@quicinc.com>
> 
> Division is an expensive operation. Overflow check functions exist
> already. Use existing overflow check functions rather than dividing to
> check for overflow.
> 
> Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff

