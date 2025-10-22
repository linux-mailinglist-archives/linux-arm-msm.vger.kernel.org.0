Return-Path: <linux-arm-msm+bounces-78345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D08BFCAF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 16:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E08B118992B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 14:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143871F582E;
	Wed, 22 Oct 2025 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="huYSaP9C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F4034C98F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761144632; cv=none; b=buLRPTDrq2Wf1IAzFu0UgPOpo+YQtkqI8s+wGBX6CevVaz9rOwc+cE7xVlHk4SD1Np/VKOMZosWjYV42i5qAAYFG4epaOZHPQ2k24cibQIpul5UegOZLNuny+KtsiiwqwzKkLQt8P7mYeBnC29emYYlbksNYXioqIVv3BPfy7F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761144632; c=relaxed/simple;
	bh=1/KjRrMsZ/XCDGwFexf3EAhWXCX98/VuB2qIhSrUi7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jqyJVD1IpnDsShwVAbiYSIRcgiEl6eo7zErqLeKSJDH/1M8BY53ABS3lsrg8pkHPBS2weS6NvwIs++AFw36wskVi5cDHUruHo+w7OcF0L83wot4EYw9mJgmw6wWIHrtqAL6F+Pe0ofes9M0FtFF971E/ULj5Pu7vyG/Ao7UbMPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=huYSaP9C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M7MoYi012327
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	INq9WPyFfBY9ghUyC/moYyME3bMMJgDJZ6a2dYdOhJE=; b=huYSaP9CnOQ1bi0l
	rgZhra3KiW+/C/yFDmnWt30f5/a+iW8a5OJNOk9Too93qN1VgXzlJAADJ/+44WzD
	9j5UX4NjYpQ36yRC9GTtKKc7Y6Df9ghIj8oaj5wWeR+9aBK1E0hchzlRnr6CI33Z
	zYzFDRKUsJ5Ktx/VninPR1qTaP8WazK1hv5yYj2Dah2Vpo6x6AUpcg3ulB+Kpdb3
	SIdkwQzr5e2pLvZgQ1fPvUgutuHIKvelZ/h8Zq73cfmgQdQiZTUT+aX2VTCA5e/L
	j9WwZsa3x8ym2ljn2LdgV4NYTovjjmxEw5gezOI2Lu/Wh+X9eDbQfqEq+Myn+LK/
	Cg0i5A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0jv2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:50:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e89d7946a1so3759881cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761144628; x=1761749428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=INq9WPyFfBY9ghUyC/moYyME3bMMJgDJZ6a2dYdOhJE=;
        b=c/aYiDwG92GOHQida43khDai3npwVZpNmmzR4+7SwWDDohNvePdScZ7yLt6mBUDZzf
         9gFCdbIwDwK1Saf997LHdg+mBtsyWZiPm7k1yOoJVUSX4VLxnlISX5GExPlkfADR654s
         CYUAMBM7a50PTzvcBszkVJZvtyWCM/cEAK89MGIDZ3opszt/+6l4Go+58S1gdjoS5EG6
         z0N4q3ivEmBViiAbBOl5M7fkAHnNvBH1Pb1NhEsV2ZQv6D5TSpNFOE9EFpbw67YNLjAN
         BnFvdKxoiawyKusDo324GBvNRKRdRDg/m+gVBX+EOzX+vnqcHVoEt6o3x+R68hhpl+p8
         bPuA==
X-Gm-Message-State: AOJu0YwSFfuCAHhLhk24UdI8UqZ7ZmU94f43lx7vuBCT+N5/zutaVzbH
	Rh93zvLd/cHGVjPOn239Vy2RyNltTfOJSRz23O9utqRUs8+M0zyq9Ed61sGfH+LJtNljfXi4BHI
	nU9tg9OPCYGvZkDt1fO6UzOM2YZPWx8O9XLSKoTji8HP2oUOYbw4Zytv0yOhXwqrYkjtO
X-Gm-Gg: ASbGncvWF6uB90rRCjsmo4hLxl06VNqWV+lR44s0uv6ufpjocqvYkIRLfMvwxeoKqIC
	TrAHAMkL82oUa0qK0UaiDODc0TV7oxzUFLMNoBNtwy6Nub2nRmRJ9BhAY2vi3UKw3e/2jyrSDbD
	fkKUNVUuDxo7rSH+l9I5TjCRWEi37sJ1btegYfQ5ACu8uKAER29IrcIpMGLHSKXExeKT+7ma7Vh
	X2d+JusTiKtFlWzakg1/IkQH1GTCS5B7dDmWKpqAMI15w2QvoZCZcSFfKhbjcgVrUPIsCtf0KHH
	uupVpvaD0bMgRe1+xXnKwAS0xh8Pi+4r4hCNfo+Rgc3yEEA2Vn/1m9KSGgBu8vD7n2W8cT9ABEs
	LAfDa+XRf6UVMKjoLVg2aquN0bSFQdAJJduUlhD2dpajwS9OVHAY5CQBh
X-Received: by 2002:ac8:5a88:0:b0:4b7:7dbf:9a81 with SMTP id d75a77b69052e-4e89d1f794cmr163149981cf.1.1761144628249;
        Wed, 22 Oct 2025 07:50:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyMZ9k+YL5Wi+O8wwfKKdoq08qbg6uZyT+lVQy1vWpqtzoyM414DZneAUJEWMiRHKY4+8HcA==
X-Received: by 2002:ac8:5a88:0:b0:4b7:7dbf:9a81 with SMTP id d75a77b69052e-4e89d1f794cmr163149711cf.1.1761144627733;
        Wed, 22 Oct 2025 07:50:27 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48a8e4easm11883700a12.5.2025.10.22.07.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 07:50:27 -0700 (PDT)
Message-ID: <acf7b931-eb67-49fc-b9ec-abd56e636263@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 16:50:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-shift-axolotl: fix
 touchscreen properties
To: foss@joelselvaraj.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251021-shift-axolotl-fix-touchscreen-dts-v2-1-e94727f0aa7e@joelselvaraj.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251021-shift-axolotl-fix-touchscreen-dts-v2-1-e94727f0aa7e@joelselvaraj.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfXx/RrGEGMFfld
 vo+61YiFZ48t3/8PrKYzv61FoNwlaQCYxW3WJWXH5wNnxbBxVh3tOeMi5FIIIRNh+iUqd9pb3LO
 Ipy4zLk3uOPG1Y44cW8ukoTenNfRoj3UDLBFhEA5NlH7Znc/IgSJ05fZngVvMMGaSQe8mEzJXzu
 X/X0KkaP2IPNSdj82b9ESD2Ymo+wUZB6lc0SCboywi8huVXTHJIcX0Halemmo3o8A0b6NcZKoGL
 8FUFazj+Z3adatfN+lO5O74Tgpu+k8AwnRn7LNTjnZSOIY8Z3P4poVie35q/bY7jqUBOkQw5loQ
 cSqLbb/PBjj65TivYVjhEjkxkop3K9GOurKtQ8hKeX7Fjtc/EEeCuH84+eklTNAF+MFWvQUs61X
 bzHncc0AFDtifw2I211wsPd/pRypSg==
X-Proofpoint-ORIG-GUID: jLDOne9rnRUe3pVQWESE1eZoY2aFjjI_
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f8ef35 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=WFa1dZBpAAAA:8 a=EUspDBNiAAAA:8 a=HvsTOjCDc2fgz3nxQJ4A:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=a_PwQJl-kcHnX1M80qC6:22 a=MZguhEFr_PtxzKXayD1K:22
X-Proofpoint-GUID: jLDOne9rnRUe3pVQWESE1eZoY2aFjjI_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

On 10/21/25 8:20 AM, Joel Selvaraj via B4 Relay wrote:
> From: Joel Selvaraj <foss@joelselvaraj.com>
> 
> The touchscreen properties previously upstreamed was based on downstream
> touchscreen driver. We ended up adapting upstream edt_ft5x06 driver to
> support the touchscreen controller used in this device. Update the
> touchscreen properties to match with the upstream edt_ft5x06
> driver.
> 
> Also, the touchscreen controller used in this device is ft5452 and not
> fts8719. Fix the compatible string accordingly.
> 
> The wakeup-source property was removed as it prevents the touchscreen's
> regulators and irq from being disabled when the device is suspended and
> could lead to unexpected battery drain. Once low power mode and
> tap-to-wake functionality is properly implemented and tested to be
> working, we can add it back, if needed.
> 
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad



