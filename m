Return-Path: <linux-arm-msm+bounces-83401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B504C88BCB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 959C74E87BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 08:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3B1219A86;
	Wed, 26 Nov 2025 08:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXRH9kQP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MBUDg6hn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA91431B800
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146963; cv=none; b=gWiIBZZDZ4DLhBYDuiY0Mh8jm98CXjkorFQ0VOo/YrumjLWr9ZuPdLfQHV2Hq3Rv2Ri+CLdjT/NxKU7etl7k72yV1Bir2RzySj8lStduj9GFaFc9gSKrJhZqDuU8/ps2k47FDhR0EPIq5/ShPYw4DTtVTmH0vObKS77dVkaJWgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146963; c=relaxed/simple;
	bh=4ljuW+R19L+hHRxjdhDHyaSQd37DjGCiyv0yhmRMh00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n1osis4IIgxWWnA80iAZO3WOizJKDUaF4bC9zm5vn+laFFbUACGFhvyN/xqzOqMYC2qy0Y36nUx1n58/I7l15G+NBtkQdBKfdnU8TGQhHEMI4B7es7rJUCpEzTe9lNTt5HHXw8t1wrXF3ViXaTVLiNupT7GuT0W6SN/k3dKewt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pXRH9kQP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MBUDg6hn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ0eve83317496
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FmhqzHGGMdM7br9Gh436MSDM37y5Eh9szWZ3H1aManE=; b=pXRH9kQPCd8Fwj7W
	3Dfl3wPtLAyCZJ+JutZ3xUH2uzl9wD76Vx5jzaIVP/sx3OS+jZElaykXwNRWODZF
	f2GXJTXwDQXkUv4ON8e5pb+RqoAC3GG3wdeJxpuc85cX7xcGYSyiFCk6F+Rp1V6O
	yYiQVJpj3koROOIyYfEEc+x6h8iK3nbnfsTGW3VmbZ6o5PjLhBQ8CEOrICK5pS9j
	hh85I9yrHkAFMmYi0CQBPjNN3NmW35JzIZ+EALWZwVA+j4xszyX/a2ZjL1EKuOAb
	8SY5rFmJ+WCIpGosIV0YczRqDssCt9OWKjW/wK/g1PEKB3SIaWJAFUbElyDAuFeu
	Q0AxDA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4and2qjvut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:49:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-343daf0f488so6580192a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764146960; x=1764751760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FmhqzHGGMdM7br9Gh436MSDM37y5Eh9szWZ3H1aManE=;
        b=MBUDg6hncjD8yRG/XpvNFgzMmQf3ph50/TSFPyTwQ+p6RPYEYZveGXUy5F7TgVA03n
         +/FhPyiD4rTIkUCGFbbEYAp95k9aepqRLbLFHtJolzLs4X/OTyRc5SUOT65tctWc0E7a
         9w9GHxCOUdq0r1/vbJFafT3zs5G5b+W1i1PAHtaFZdgdiAomzYCMQLAvuA87rRI0Wgkv
         NRICJDEr9lG7CKLo+JfjBMhO/Ci/ecRls/VYS1srayLp6PrhZiAgK5hIBbii9VuzfT5w
         iNkc9LJGXPVsZn7/qe/6ahBRhEMnCjQhOuyxzFIW2z2W3gCf8+ybu2u8ongjD/Kt1yXD
         o8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764146960; x=1764751760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmhqzHGGMdM7br9Gh436MSDM37y5Eh9szWZ3H1aManE=;
        b=qgMrQGSTRc6tgEt8ot1YDh5bO7ScG2E0Z+e9zizAThU4TtrynbrtXBbuN6bezEaaaM
         tzTGpJWVt+1GC9ZWBKlAF7GZIaCrOXn2FI2JyVlPmJnTHvcsW8b8MvdrLhVAyHfrxbmD
         eZo92VlGEyyoCdIPFKq1+ONzrcbVZA8bqd1s3w3HSaeacg09Ndlhpxu45pNCA4Af4yoo
         caJhrtyxIZ2f9ItiVQvfUwmz1jz5N/DSAecEG22Q/sQEd6OsShituO0O0Yyr2Xig0W/F
         9W7bFSr+uF00Fm/eUu4LiDnUdW+nIISr/uHNLw4bm4ckuqT/OPeAi1W1F4Oi7+ofmfTG
         WWmg==
X-Forwarded-Encrypted: i=1; AJvYcCWxV0ZGeWH+evhgDPCaZQNabGUuieSUdL8nXu7jdfKCxmc7hVOpv11aPJSb8XE08NDOhRS8CaRJdYASki9M@vger.kernel.org
X-Gm-Message-State: AOJu0YytGGpKsvNmXG1121pDGAQz2Z1jRrqHCOjg6jHqlGXrh5VDPGi4
	w56BLoEnweJEZXQze+h9yOmlpyM9YhGgsrgcIXfY71N95BHIGLAKmQre6sxMB5bGIKic/t/2IN9
	v2oy81pzrRF2O+Rlg41D2UpR46eLax7pzy9vkj3p9js05EJa/7fjSCtwjibm9Ew85Heoz
X-Gm-Gg: ASbGnct3nie2Ii8AJ/m+nz5BmyXqNatBHwu8iKOTAtpc3mu0JcJacMlsqc1mLjMmyMT
	xhX8Qa8ntg3pUAtstQC3+G7K94uX0Xeb/kJNQsjh66V5E7nugKlE00F4PCLcaecDtSYRYQPs7IO
	EIV7ofWVKwtef/uDYH/pEhhKFHN8ImV1Op7lXMKEK6KnLyoQPe43PnmYAmon5SsUk/wLp6YjKvB
	klMM2QxEXb2Bv7tGhnn4F3tlyN8+TnFfpNoajyRAzMrl8OZAM0d1JSZm2nxlk0HDlybgoqQXNCA
	sX5n8hGOAP4dVkArzhky4opLaz7T3x4SPwX0gYyoeSCuvjRPS8GAcMxlTZ1oTCBJ6oK4MneSp2t
	Zkd89fbu8xYMkt7D2I23IwGMs6iF6iLZ4p2Ks
X-Received: by 2002:a17:90b:5404:b0:341:124f:474f with SMTP id 98e67ed59e1d1-3475ed6bcffmr5324828a91.32.1764146959942;
        Wed, 26 Nov 2025 00:49:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKm6mO4vdyB2IT6DYpJsjuU1VmrF0wCEUFMhelWVC14utNHPWISQp7OEu9TksPHL9xRerx2A==
X-Received: by 2002:a17:90b:5404:b0:341:124f:474f with SMTP id 98e67ed59e1d1-3475ed6bcffmr5324805a91.32.1764146959465;
        Wed, 26 Nov 2025 00:49:19 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f1262364sm20692519b3a.58.2025.11.26.00.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 00:49:19 -0800 (PST)
Message-ID: <ffb5664e-432e-4c05-8e98-3827d111a8fa@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 14:19:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: gcc-sm8750: Update the SDCC RCGs to use
 shared_floor_ops
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera
 <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <20251126-sdcc_shared_floor_ops-v1-2-9038430dfed4@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-2-9038430dfed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3MSBTYWx0ZWRfXzeYAUVPB+uNl
 rtg3pQr92XW8QaC2Af9SLozxkp9ksOST7DUxeG+Qhk8Pnr3LqzJ5D/bstXzAGQ7blny42UYRjc3
 yqYq2mB8t0ZxYYc84cY7wOCsebJrC95j7qsYOjdCdHk25dohBZCGWDeFxh4zt7b/kRqyzMc8iCH
 LjXgpbvhffFczZRE4qoK3625TeKq02GCyho4R7i8NhPBk75q/mbZmefq7hfJ94gZDWk0JKHyXcg
 8W3nqvAqmg1ywSj4AdD3AaBIvoSL1Rza3CBQVZghtTJgrtIPs53Jawo6tQc759B3NCJfWEmQumC
 cL8AG50zn1sNsgNhaaT5h1Db292yP8iM6CjxR8bxqrDWmhHMEaodEZtCAuMpuMXu5PE31Wvrwug
 Zy9Ky435EEg2HkJN1tI96y8Wq0LVbA==
X-Authority-Analysis: v=2.4 cv=dZyNHHXe c=1 sm=1 tr=0 ts=6926bf10 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OtGAF3PL-3b91V71RaYA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: DL7VAPmyeQo_5IY-UyydA66ypYzoH_uw
X-Proofpoint-GUID: DL7VAPmyeQo_5IY-UyydA66ypYzoH_uw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260071



On 11/26/2025 9:45 AM, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: 3267c774f3ff ("clk: qcom: Add support for GCC on SM8750")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm8750.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

