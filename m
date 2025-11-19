Return-Path: <linux-arm-msm+bounces-82455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 27986C6D8A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id E529928ACA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5991A32E730;
	Wed, 19 Nov 2025 08:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/U1Jp+o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vle2N8pf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DB28F5B
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763542723; cv=none; b=toe5INaAuBK196grkIUuCPKigUYr8f5mdxrfzVs4zKyKkBxZUJdpi/GUeub42T+MaaSYGYE3zjCU5rrwhTejdSxZORDoAwkupymp2OLmqjku7lxC48nkLLAaVgEagun/9zPhRmZJAIljh/Lp/kmm+rP2wZcyiCPtogj1ga0aGoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763542723; c=relaxed/simple;
	bh=iMQjxgb2Z+rYDLrPE4JmNYBt8FANzyzUx9YKbzzMraw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=diVW+QUi11XxiC7CgqwFuYOsNZOtqYxcfJ2+frI7o7i7+zX3H1D5cfyeHrB8RMq2mwCcrYwKW7Zr64DFfF+K9OTk6jeEbW9V0fiEf2z0QZp+MjRSCZZPLJ9QOmh8y5OnO+Gqi7M+pIv6+kH8LIcEkQ8wQAU1a0j3P5S0lIeqiP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/U1Jp+o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vle2N8pf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ1M2BJ3412658
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w8ArxIvCEScXV9c8RI3uKZmj
	DUxSkzRPyK+6mLnIODM=; b=Q/U1Jp+oY0+WQ1U9yDSKS1rTdnq7TyH00Fu208K5
	v5/0NnvmDnnF1ISqgjLlBidxTKVp4W11sF+izMBTjVflItJ3aVeL7VVzW5vFTO38
	97apemDqHaSRhvNhXSMxudGc+kvPLYxB356sUXWf+sxNv+3F7kzHB0Oj3XsxUtSF
	EPmsH8VD03Vv1IYnQ4JY9cqN95MDlEJb3qJ2VxV7wTbpnXpefyhGHnSG5yCvX8RX
	EnmXA5apTSbnREQn1HimeTsbgq10hH5Z0Z++Cc8X2dfp/AUYbWF8fuRmMB0QdahR
	a9XFAwyC+12T+MWV1CdJmggOI0zZqa3od4SjFQ7lDthhDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agv0v2nk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 08:58:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b225760181so794835185a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 00:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763542720; x=1764147520; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w8ArxIvCEScXV9c8RI3uKZmjDUxSkzRPyK+6mLnIODM=;
        b=Vle2N8pfoLWnrvCgOOervJFoZgqIiT505AEjpPNJqvJr9XtjrfJWAhrEcqfnAT+fxr
         PvrFbYOqukJuucEfpy0vEcAUfTpHDC54WZ3eHZy/OywcoIuwcM6zEjr+GL/gfR5WK30z
         ctDQz6KqOxoywzAIQVD5g1RBy1brkNcO645h85wUyDCU0/QfA3yws9ze3xjX0wzGISCH
         /i5s/83PNfjhEsbgjXLqwX50tuDwsfKUNl4Ot2s/bcXfOjJCm7NjaHkGkIQXZA/++0vp
         mPZStyPWaujRxEApsJKUciCx0gJ9rymEW3rRgxfEqxPPhb70UWZL4+n+/Fbx58XqKpC0
         iYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763542720; x=1764147520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8ArxIvCEScXV9c8RI3uKZmjDUxSkzRPyK+6mLnIODM=;
        b=b+LfDmJflhbuoIU1ft5DZOEo0jlmjgTbl1VGqkcu5Bn/2F5kNoPbInFbsuFxTBu6Xp
         insGNgREI7mGHbHIL2MLJ1Uo/FlSDJzTDnR744m8UlO1nx1OBPqB2Ti5U77frWxZ7Qel
         /1loO23luPPgUcbBnFGhgx9DABoeGRTZXM5wINLn7pK2DsQLbVOEZ5ltf5FZLbarxMbe
         H3xfHJLBFLD748k47g1H+1SM+iq+i29ewQ0gNcNpP2xLHsJ+/RRWP26wVXsu+WrA0jJ8
         6Nglr7G0K5SVUZxHCSYPh7cRwGybya9/HEp0myGYmudHGIPXpZC1f77CcsC3UZ4ed+69
         qyoA==
X-Forwarded-Encrypted: i=1; AJvYcCUKSDK5DhOUtB06WSYFH0vhMwxrLibP5VpG7yIi9UsP5lVSxFr5oP38uPa5NskysRc2VN5sl5fhPcljtBdA@vger.kernel.org
X-Gm-Message-State: AOJu0YzzOT4bpYxMUGvVegtwb4I22HScdXL6gQKYD8+p56V5rVmnl4Q+
	BXtjaR1bIlLPaNhb1ka/LcCH9FCgQsHaLnZzLivsEd6/2Fvi+yVt6PVfn16PL+0slAgVGsaWRMp
	Wu9JPU98OIrLGfXe1IU5TTsisem8xE+jFTYxS+tntBnVRSanQ8HNgO5mLU6foLFQ7LUOR
X-Gm-Gg: ASbGncs4LvNpVtSNFqD+w/zQ7Bju45MmWMxJVktNDtak9lznPrZfVWYtn26RC3+TRTd
	0Eqrrc3odzbF672gO09j7dAWOfoWuab/mz5f+6Q8QZ3nqPksc8P/DsyT0XEv6rEhxGS0dAxohaF
	4urke5cf8+lSQsiufDjlKDTN4Ff93pzW7p6jRkDp4tmdEwlQCaadcM3L+sluuOIO48BF3N7Vc/K
	Qrkw7r4FUTaPETTRCgDFwug2hT9eAPDp6S1ICeH/mLfdTbkmJwG6eDrTbfgu3H3JsSfo2QSWRQu
	eGpCyDAaUZlpiDIBbbL7a4dMJzOEUP1vVy6I6ypP+X2H4JRRfHMObRpf965NV+mMqKLrXp74BmW
	JTQeU2jTi+8vheXEou81CqYkqFKNlc+1D5nxQeGoGJY1kvVBDDv/0UchL6PhjMrpl5ucNR4v8zK
	uGZL8a+hkkg+SEmVkhuhAfo5o=
X-Received: by 2002:a05:620a:45a7:b0:8b2:271e:a560 with SMTP id af79cd13be357-8b2c31b4408mr2288090985a.72.1763542720017;
        Wed, 19 Nov 2025 00:58:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHM68qZR5ufBVNgqJOavTs2bM/nCJaPnebE1XZurspaV6TG/sRMf7k3MqnwJffcSAcFV5cDSg==
X-Received: by 2002:a05:620a:45a7:b0:8b2:271e:a560 with SMTP id af79cd13be357-8b2c31b4408mr2288089385a.72.1763542719480;
        Wed, 19 Nov 2025 00:58:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405303sm4608000e87.74.2025.11.19.00.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 00:58:38 -0800 (PST)
Date: Wed, 19 Nov 2025 10:58:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable EC drivers for Qualcomm-based
 laptops
Message-ID: <w5kt7ya6h7auppcz25s6ndrdvx3p7qsmhol224ybykwigq6nn2@kbxrst2bxod4>
References: <20251119082408.49712-2-krzk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119082408.49712-2-krzk@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA2OSBTYWx0ZWRfX7nBXy+JEwVLT
 shrtj+94bsPvLeLUyk5BLOfgx0xvDyuUGF1XcfNAC2z1frpMRnzEvUyH60KgYsqmLenWSE0/HyC
 4/lXXdG5WRZUzKgvSTsSc4K61C849+inNb6CefzRvpujRUHophldjaQY8GHMSwU1tNYVqOqkTDH
 UaRIZIISKtXBMVnUsr9ADiIIfeaVXwvarrwWW5lv3qSEoAqljE+Bh89PkL95xyB9GG3pcariq2a
 PsiTTyqdueAbCoRx3ohmmY/sgg/KSRNGAGt79i9B2NrFXMHk6YJ/fAvG6uR333VhsclTE0A3b4d
 CuOeWJnP59oEWLNjFB3lPqsmzW9gbZgsvD7k+BfgxejT7rmZ+yTuYPkVkaeDEFgVsVclIJ1wDwc
 oK4TCKNVecVDya64UEyxooIMxfZFuA==
X-Authority-Analysis: v=2.4 cv=S8XUAYsP c=1 sm=1 tr=0 ts=691d86c0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WXXyHQMcWFp6grFSk64A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Ccr5jKyAb-4y1OWBaLR_aopGA8Bi-MIC
X-Proofpoint-GUID: Ccr5jKyAb-4y1OWBaLR_aopGA8Bi-MIC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190069

On Wed, Nov 19, 2025 at 09:24:09AM +0100, Krzysztof Kozlowski wrote:
> Enable the drivers for Embedded Controllers present on laptops with
> Qualcomm SoCs: Acer Aspire 1, Huawei Matebook E Go, Lenovo Yoga C630 and
> Lenovo Thinkpad T14s.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm64/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

