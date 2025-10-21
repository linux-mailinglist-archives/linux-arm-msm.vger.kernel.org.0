Return-Path: <linux-arm-msm+bounces-78118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 60583BF55DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 10:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 014934F56DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 08:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7FB329C47;
	Tue, 21 Oct 2025 08:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hO+9qRbk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335891DF26E
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 08:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761036713; cv=none; b=t2YUfgajLv0n0h89evI8NMUcGmI5iLOsiGXBnWoc3NltlBDqcTkLgPGhOzZkjB34sn19FTYL4yq+msuCVV8+/2luVWf0k5zvB5yM1fq5jwIq95mqW8LBVKN23hOziZtdeLG+KrXX+7WmalNvXAnmVjfJjX/C7NvhAcB7C/YX2v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761036713; c=relaxed/simple;
	bh=3Wm+qPQCGhquC1sqPqCbWcCtKdc8Ariy7FO9EDJ0/ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FS1PL2eIwFxjVXAmWgVEYzDiFQJakKO7o70uCu7QKwOiI9PexXP8Qqqsp2xahOucQzPs5Z/r02L0aLcc15tzeAEhf7VAN04jxyfmzrVRCqPHZiivyfpaEkQYTvpIb4i1JBD60Xv/vsVdsnCNswzRKJ0P06kzJ1iLe1gAKP5aUAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hO+9qRbk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8Pkg2031313
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 08:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Cu3mLCBx8dTdYk1x4AduwRqyoGHAAaN2BS60IdnX4E=; b=hO+9qRbk+V+obYOn
	rHu3WRM36xGZHGHQPFTz52aBhWND7Yx0cUDCMo+8rB9fa215pPpgpBLiHI1yQfMl
	9CirO5aTGBFSPQEmNqN5ZEs2yfes55/mQbR7RN+vAwiKnBbWbItzuqgpcRbtW+jH
	aAJOmQ5UBLbzpCa+wDally34XZJYFaPbtF+ZBHdqKnyh5boIEctDUwy/02/H/Ovj
	aE1dttX6JgHoo15iO3TZioTT6jk6I74+JeCgBxD1R840IzHglJp05PRd4ZDL7wVs
	ohj/8TI9knQa+pd0Eo1TaQ0sRytdbT2925yDRzcE9GENSous3wcsVDS9BuEyzj8C
	C2OfgA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2gdyyy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 08:51:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-89083a0e150so154562985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 01:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761036709; x=1761641509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Cu3mLCBx8dTdYk1x4AduwRqyoGHAAaN2BS60IdnX4E=;
        b=BeGefeiuvYTnaMs9ajG8ehN/HG3w9YkEAJ3NLTzegGW2P3al/l+sUvjZgSXBqhwZLY
         weNG0xRZOZ8rbHTZPQEdw3GlCGJat8E9gjLb8f9skAdH9PLrrqJpPPNsLljB8uQyHlhJ
         DoAhMM0Ivy4pnWv6i1xLLS6voYyq8fmZBi/ceNkTphyZdZ5KyrjfyoZIvwJpGa49WTNe
         SbfwL90q0aLuKGWt4Z0jySVfU/WmdhGBRSEIlbcJhbNpGTPxH0XTmm7rN2qPFHwof5eA
         1wH09u1DTXmF5vZ2mV7h439c9ZVbYnJXB81dSa6/Zq1j0dAPdJphMtzMvr/hSp9uejN8
         zANg==
X-Gm-Message-State: AOJu0YwpAWwPnbXBG7dmWBDGcFtC3CRCjwCAhzbVvcuRJNyNmUTL7I5o
	yFZub4jE1P/tVTrWTcbTUAJ+253h5P3Di68HOnyGfLf/xzfreKrAiEHG/hPWSuoSHj0xRRMrOEi
	6+XVzPkasRHIr8oZ2BfrJ50RPErXVvCyds1/Rjm2N4lSwDyhxR71pwKjPfGxx4pXLyPPP
X-Gm-Gg: ASbGncsd7qDDkXitRM8QEgrex3FVK39JlxBcpoSEuXvUzbHJvsGWZJLfZpJ/lW5h45Y
	brZjr+BEbMELN9iS9OPof93ijOx1xgT0+5ZAoKirGE0PsonmI+jybGQ1P3CFH9GX+vyl43JTlQp
	e8C4e8sDNMRG189Pbs/FOEG4kuKac30+AFtjM7I7vuQwDVdpa+reHoC6c7t0bXVW8tDII4kehCa
	7mCndJSTaX4ZVQ/csQgYFspyVHqZGqBqYL1wBItT4GPCOcVejJDKMLUmLqMewwN6j8zDvTDSPEG
	7duYhvI3Kgo6qT02DlhoLkpco+WjAUqYRg+SrfR76YagOAmRpFxbzeHOjO0KjJEIoJJkHeoE8VU
	M9Hz62aOmfU9Oev/YBvjwe+27r/jpDgdgzyGrlJ2SqBUu5B8pm6qPVJ/M
X-Received: by 2002:a05:622a:548:b0:4e8:b910:3a7f with SMTP id d75a77b69052e-4e8b9103edemr75870141cf.13.1761036709411;
        Tue, 21 Oct 2025 01:51:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHo/ceLdhKb/3TFYDA9gwxyTc8Bl+sCozFYSPjysEgI4X636LoRjzay/S1WPzMNJ3XSR/vJZA==
X-Received: by 2002:a05:622a:548:b0:4e8:b910:3a7f with SMTP id d75a77b69052e-4e8b9103edemr75870041cf.13.1761036708945;
        Tue, 21 Oct 2025 01:51:48 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48a91e86sm8907155a12.1.2025.10.21.01.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 01:51:48 -0700 (PDT)
Message-ID: <1b25aca6-da6a-4f83-a0d0-b1766110f83d@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 10:51:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: gsbi: fix double disable caused by devm
To: Haotian Zhang <vulab@iscas.ac.cn>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20251020160215.523-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251020160215.523-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfXxrZ+qwZPfnRT
 trctDV6j8nLYWO9S/effj0otXQFb26i1CSI1twEo9l6SP6KEIX5gtnewwjnA9ElhhxK8LHS5bkK
 M14Inl1+nmoMalSwpijD0g+I/+hjeCxwHQOMtfByWqii2n9M2BXVEHdS/IDv1owJgLAoBcobTwz
 cqAjgKsA4tksHQkvfqdDUkrhWn4qJu7Pm4nggSZ3UcpAnWMVzalvhsI8Rc6f91oyBcKY99mM0Ye
 Yn4+BFeMG9OZYxXm8fGcrTq+meXlQmnT/zvVACSTznN5HYzmr9FNEZSHzK6Z7IKBLAoPyVetSuF
 xXO7J5Op1XtT2iUMm14TSdLYXkrGESL6sO3jNM9B0jTIUhCRVuvVHXsL5HxOTFvkxJQRIof7NUU
 dxyyI+s0pQ6qArSS9R7iEWs0hXX0nQ==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f749a6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=b-gHXUNBb4A4jDXHR08A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: RRBljJGA3HWyi2Dou9BlqZqwnJk68cfA
X-Proofpoint-ORIG-GUID: RRBljJGA3HWyi2Dou9BlqZqwnJk68cfA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

On 10/20/25 6:02 PM, Haotian Zhang wrote:
> In the commit referenced by the Fixes tag, devm_clk_get_enabled() was
> introduced to replace devm_clk_get() and clk_prepare_enable(). While
> the clk_disable_unprepare() call in the error path was correctly
> removed, the one in the remove function was overlooked, leading to a
> double disable issue.
> 
> Remove the redundant clk_disable_unprepare() call from gsbi_remove()
> to fix this issue. Since all resources are now managed by devres
> and will be automatically released, the remove function serves no purpose
> and can be deleted entirely.
> 
> Fixes: 489d7a8cc286 ("soc: qcom: use devm_clk_get_enabled() in gsbi_probe()")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

