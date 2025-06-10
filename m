Return-Path: <linux-arm-msm+bounces-60827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C88F8AD3B41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 16:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 909B0176E1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7708419B3CB;
	Tue, 10 Jun 2025 14:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mn4SUFjE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AED717E0
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566207; cv=none; b=Bu/sEPGtwyzoREXlasDstiwoW2ckZkvH05LGNoGeLw16HE7gZ8+hXgV6L3f1Bn3k+6QiOsIwXeFN2YG0kUIpEWG0TiuaHJez2cQFpjVMEdnClh8TnHjHj9yFlVIBMGI5BNYvX/Qm8qGVbHSGTI9eBMKPcEmJj8axtZAu/JWGKNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566207; c=relaxed/simple;
	bh=z8bTv4mLDuRDlO+FaPlTDYKUXMESgx/vu0DK4Il2gU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KLAsfPUkkI3GITnMGKUro4NWyhBA3udwjHWrrvDPudmrrKTsFLnUQH3jl/lMd2L5LJ5rlvHg/MRlsoR0VBY00XBUdheL4cz8uahO1Saoj9fY37RhuWVjoJWi12UAbkC2FysFEunBvVpMPvKtLfsUeyH4cHKsWFebXbrdZf6AVdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mn4SUFjE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A6eMQ9021159
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BVZlJK/GxgJY/X9zC0XGrcWqi+GkfHWHyAwskSfnpf8=; b=mn4SUFjE8MRlZ8ke
	th4z4VSdiSRULhatOTzsxH3y97c1zG7QDfIUZKTm/6V7IOw8NTJXEcce9bnlNkqa
	dCLMgWGT83cZ+cqcYHmJ1t0AOAJp+mIkzzFgGlxhI847Sosgzv6wmT3F56XbzxDq
	c2p2JWle1/byMaVeY9OiCTu06028CUH6HFQ+pJdZxVYxs7U4hnb9HtReEdkxIQvJ
	ENBqgx+f9YrdpNbPDQnELhIYRDkrzTeHi5MwIOiHy9tpTmTXvzOGgWQUSyyS6acy
	88+43FAPKs6bOFi2QEzWcinAkUqHruexI4hoD8Eo/hdnPfd8c3UxCNHFY/AjFLIe
	Rf/1+A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmn9cj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:36:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c76062c513so100337985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 07:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566204; x=1750171004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BVZlJK/GxgJY/X9zC0XGrcWqi+GkfHWHyAwskSfnpf8=;
        b=LbSinsye83obaA+e2GvsMU+EXsvdxoaFacWS950ISJS4pm0Dqxl/adjowEGRi1Kjpw
         9Bdauoqc73l6kfhFYISnrffnp+2wjUuz4AVUjxZVv0OQ5wEM1Jac4h/SnK14RH5/raWG
         5cW+Pd9EUQHogut3SFOqE0sS9Tbdnqk16tJySH+bUSqdtQSM/B+P36CPfBaX5YM5V6q4
         N8+qF9QW16/RO++Y5SXydDeHu4Jnt7pnJGXAdaFnlqPUSDPq5CgpJDQsrcIyZtpvW9wU
         KR5DxwMCUg9Vz1O9F4rGPY7Q5qZfvlYK74szHrwN3+jZRhjWe9yRt7WnO3kwZ6ww8WQ4
         wdLA==
X-Forwarded-Encrypted: i=1; AJvYcCXy5Bqvf8nlctu9//Gd2wNFtkV8H6POX8Tw3bgtma0rxV/ZKJpzxlrQ1XINErPLhAZSm4TDTkYIfIKYNNy+@vger.kernel.org
X-Gm-Message-State: AOJu0YyLin4rsn3HOgnUy9TgERmU3gE4cz/dasf9kuM8KD8HuB6a+eiZ
	CS1mr2k3kt+VeE1RTK6aNzd6VzdNXAAQtgOYZiB34AskX4uPZHvEZDlLkEDLCvPh8NW1l7zD5P5
	3siAUi8gL+JoMU/jbPCAfyb1tcbLuXUoQy8h19HXc+JHVg3obbbgiZEYHpiV7am7q8ADB
X-Gm-Gg: ASbGnctDJ65Vw9Uc1VLyMYeDC1NyvSC+wxB7Ux4M+vpShTdFvqma7ZGqTCMDXR6szxv
	al4HFwQ7gAEg9GbEfy4+XggdDDEp3uqzx2Dta/JTgkE8ErwbnwJ/4PJhFywdJtRY2cbNLNTKshA
	fA4Ul511yKZBOd7PjG92GmGmqyciwHS9JRK9RIDLmrzcQXaOGfJmd2SRIMmWP80HP4K6ekJe8kJ
	NT9JmEpuWUb307CJaTGWn5W3NLo7USudC01Dt7YWkOsk2NjTIs/aIXWk/YQDpKdMjlPKBNl6rQG
	IWkWkoEArk+CfRGPJuxLyVhyEtWk5LOyuWyyWxBZlJpcvzIMPRyBM7dbvpMrpCtxrUB8mU39eqV
	X
X-Received: by 2002:a05:620a:1905:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d33ddf703amr932426385a.8.1749566203885;
        Tue, 10 Jun 2025 07:36:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBbQ7SHFJAIcnH7aGz2wAofoXXYsrztV5V109VXWdIgAcLNVnSvMvyMhOqmTXg8HcgDxWrxA==
X-Received: by 2002:a05:620a:1905:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d33ddf703amr932424885a.8.1749566203410;
        Tue, 10 Jun 2025 07:36:43 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d7542c8sm734986766b.21.2025.06.10.07.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 07:36:42 -0700 (PDT)
Message-ID: <33fe6caa-6720-4af2-a0d8-44b75b6792da@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 16:36:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm/adreno: Add Adreno X1-45 support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ojt2rdQJB8FSwfNL28ZI9dAAEWvxDsSa
X-Proofpoint-GUID: Ojt2rdQJB8FSwfNL28ZI9dAAEWvxDsSa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDExNiBTYWx0ZWRfXxUxI/ryqsZ2l
 oqhEy1uIEJ97tAWO841R1wYID4p9gsJJWZ5l6y56EVbr41+9gxjEHtzZZdIwYLiwkkve37knYd+
 IxjDCfImUAWaxJFQXU3cBm0m7HaeNkmZ5Np0N65CGaiz+gVTZBAgQwXQFiGfs3I2tQrA1djPFEv
 j3/026+nwwytLHwQ3jq0bXN4uKFdz7eAmUxps5FH6marQOtWFdpemtxDMkeKZdWbgPy7txOwpF5
 f5tH1wL6LHWJWDTKVXiAQn16RC3leFDrR5nURPFoxZTXbRniBB8rtBav190SMW9tJslztgOGL/f
 uOjDmVw+46B7SKJ8jjQAim8/2KKCt/qR8CxjWUrasJKXwoNiialcaDuuMC51UJni3zcnI3Tpcqc
 bNUu7ED06zxzfXoTvEwiGOMCW/A5wITh/HSI6o5r8v753gBEQEoew+8J2UwMBM+R22qPSBvR
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=684842fd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KtEEE0qNWcsMKkko6jcA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=931 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100116

On 6/7/25 4:15 PM, Akhil P Oommen wrote:
> Add support for Adreno X1-45 GPU present Snapdragon X1P42100
> series of compute chipsets. This GPU is a smaller version of
> X1-85 GPU with lower core count and smaller internal memories.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Matches what I had running, I don't know the source for fuses but
I trust you

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

