Return-Path: <linux-arm-msm+bounces-54387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF392A89A6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E5367AC16E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EEF28DEF5;
	Tue, 15 Apr 2025 10:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dhDAC+iN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3207C28BA9E
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713424; cv=none; b=YIznwdqfNRmweEM2zHNkQnO4Ppf5q1L63mQHSVZefFc3BX2+rXszaE1YOajJkQmMhZM3GFtqbj1u4v1aTuxkvoM91auItlOj1uF4sLQYOf7tzbMbETjJspVI93SmnoorPPTXnXmgcgymCs6FwVqv7t8TCLZH4oVYH5YW28/Q8nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713424; c=relaxed/simple;
	bh=cQwcXftl576U3tWrMEUfsCJM2UPbQ3gsMoIHXZJwvy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S3kZpIySMWvrSNPQlwkkeDNlI9j80xmFmnC6rxasWYFfbJbbY71tMLlENRXcfMwVsgcJzu8ebbE0RNA61olgJCsNMaXAhZTymN20UkJBIJSXh88a4zltbnzLq9dc5ZOrJemvw3xcD+5AgGaH2In+hPROsvrO6W/J6AbN1Cu7LB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dhDAC+iN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tXL6002474
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7BfkcRCNci+bCQBNjVXlG/q2/sUT/p1vowXWuYhhnjE=; b=dhDAC+iN4dDN1pPs
	ySFjbBTF/Q5yi5TmCxL+w92f4LkVxjzyTvYkDsCjfVsIzr2DUwG4VWtiteW9xp8n
	jaFUEsOykFiGZ87UcR0pa5bAiDj+qj2odDdOIbZ6Pt2yzbVjD7i46V6Q/lTIBboX
	pM5xdq5meYc7AxhWTC5oIrB5Yr0jHmTgMmLWUKZDn1e3RkB+MJ04uo3ks2gNvQap
	27r/SBfT1xSab73h/pdfYASlFTokSLATa9C3w5cexQiEOc6nZj27ea6WpXdjoRKL
	yIAtLsOh5eqNpF0HcfJ+2bjA4/Abvd07rkoVkRZC1LICHtuz92QrRfkXkPaYSkGU
	xz30dA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vft9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:37:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476718f9369so12207711cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713421; x=1745318221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7BfkcRCNci+bCQBNjVXlG/q2/sUT/p1vowXWuYhhnjE=;
        b=wUeK3+24Vqe7r5wazTkf+ybufLxZuD0UH+WaeMHVwvL401AWPimfMCrkOjh2yAXqJO
         aGoHKUMxNJBzrJU/X2788499KIT61vPvewIshbPuoqGSRXsPyZIOx2btmVZ3LX1mCRZ8
         Q+r/XzjqQtPisz4NOW5Ma1azeVJLrawrG9V49QulN5SHdhFuMUwPLokkgKFSA7A5TYH5
         FnzE1M/EQBkhFnNSfAwtyz7Mqc695+yAKBUsNIC7D6EPmvMsM43JcIZrmsIbOWOzd7Fm
         HLpceUvoIT99n7O+dsFCiIRH809hQGf2efVkxO4wXmDDjhNOqsAuQBLPRI+/RJiax40U
         N8LA==
X-Gm-Message-State: AOJu0YxnmCyDd4701McEECE2vuz9IMBjR6KaIChPL9Cbxw3XKNWE71Ni
	pdk9xFQfb0tPN0Zu3GdDE0Xpfbi8iBW8++gDQIpRCA6LVQb6veos9UxENpygUp+EI9iUu9Jd/7x
	b1Tu/LYoC52jlkxN5A/VF4YslVlnRRqZVwfYbsBVbJOcyyegeEBqoMDmrMqXmco6W
X-Gm-Gg: ASbGncsDXqunvLF28ZRoHYN2DzE4RVgcjAewhIeReaghyLaL8RwCQjBAeuV3DiGmV6J
	lSikv+BJhsPH6XJqgA4yCKcDXIBnKBGML+XyknJ86UORpbbN2gvdAhHSciO3DBAIhUhhBhs5moh
	6y5qUPRRg/OUyCFKmeS4QjadZBVzsvovq5bf5U0jo86T+bUbf4LAxvka3pSsXi1GU9Tlaf9VTfb
	hdLL1Fbbscv8xCxbDUvcWLZJgGTmfhOtUt1rCBHVQ9L4EPGc3rOBjxRBu2NzMg4mwvMCOmWw9/E
	tlAvWO75+PcH4AEGmiHDHCl1B+f320/Dx2xlKqjsX1WTRmEhWActq3duEU8DYYXyKtc=
X-Received: by 2002:a05:622a:15ce:b0:472:1de1:bc59 with SMTP id d75a77b69052e-4797753959emr72955221cf.6.1744713420994;
        Tue, 15 Apr 2025 03:37:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKwxupMVfqIVUO5Z4iuLkNhaFfvE6SNotTJNqNxY1p9H5z+PlsLYFGYCWleXD/sZ0GRI8U8g==
X-Received: by 2002:a05:622a:15ce:b0:472:1de1:bc59 with SMTP id d75a77b69052e-4797753959emr72955081cf.6.1744713420688;
        Tue, 15 Apr 2025 03:37:00 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ee5500dsm6343674a12.4.2025.04.15.03.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:37:00 -0700 (PDT)
Message-ID: <ac64dcbc-64a0-4ac0-8e25-14c9706c6d00@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:36:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/20] arm64: dts: qcom: sc7280: Use the header with DSI
 phy clock IDs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
 <20250415-drm-msm-dts-fixes-v1-1-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-1-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LH0S7haUsvJGK5ghynVHSgTBUsILrjc4
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67fe36ce cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=udklyl2LCIZAaJMMIwIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: LH0S7haUsvJGK5ghynVHSgTBUsILrjc4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=600 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150074

On 4/15/25 12:25 PM, Dmitry Baryshkov wrote:
> Use the header with DSI phy clock IDs to make code more readable.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

