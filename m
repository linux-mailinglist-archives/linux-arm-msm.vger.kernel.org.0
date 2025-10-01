Return-Path: <linux-arm-msm+bounces-75629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8363ABAF59B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 09:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FD361C5559
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 07:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E89A1C861E;
	Wed,  1 Oct 2025 07:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUL7WSz8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CA27261E
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 07:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759302277; cv=none; b=lbS6wa6T4awGhl/l1dVQx/BY8VmCrWCgIzQxiOCRAjDCImRm9PtKR0Z//N29YyK8DzuZS0XcZYQhhdz0d4kBsjdWYr66dbqZUjt+Oe3VqiYnUlMnYSQM3QG8O8HeEP3qoAJduLwidSaJ2ukhaRlETdsFYRhlfUMMrlAaGzrWpQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759302277; c=relaxed/simple;
	bh=We2BKF/GHnXH5YX/6E9v5kprJ6brDvpihZaj/zsbNOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qQdNmElQnpD8xoiiEb5ybKa5uROcttnUk0tz4YJmrB349zY59+IJHS+UbcklbCo3eouK4XRKebgZqZITnflDNVratXMeEH0mHjZAnXTkKcuzgZUYbRiqHNTpBAcYRp2p/4Mh6mLRmXEwXhG6F7rLvm6jpeXXzyhf2NGL4HAnqMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUL7WSz8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UMIFQo027330
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 07:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rajT27AwFunrMNV7n/DU+VYrepqPJvpfTRDT7Uk8rjA=; b=NUL7WSz8Lq0J2Yug
	iwphD+paud8YRd/GQRn/PNIrIY8X54TBs0eq29v9iHTUJkzpL04BQqWpRhZu/3wd
	py3S09QvkmwZQpuQE6vOI76HWMZrLKJdqEdrPKKvliTdlplwHppaTzNCsUCQtEMK
	NGKkKau+Oyc7jxRqU6b+U4OY/TvR2zVrpyuIabqyb9Q7UgodAQ3G0mad+zl32/TO
	IujM2q5oaGekfT1RUXPDf4ZL9wmNQKwsvRyx/wm3T6C3nv79fpMsR+Gqm3QnbALQ
	tb9+YNE00NRWCkdPtWLYIwW1+Wpb5pJOtzFn+CFp837ax8kCK0NSnxjxSOKmGPPE
	nNU2iQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf582g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 07:04:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28e538b5f23so22138155ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 00:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759302272; x=1759907072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rajT27AwFunrMNV7n/DU+VYrepqPJvpfTRDT7Uk8rjA=;
        b=iyHmMaQrog3aBUs2lKwHtqT77y6iLVADhbTBUd9k4bP1V68lpZd2W4arTgKMrRo7w2
         mKLUsHIfUJVTjPS+/0G++ynAZJ1aqNVTQ+TlW/Ej7tdRBFT9lHR1dEc+IJ8zV9B9fopQ
         3HzcXWMTyvPK9Pt+7eIQNVgDS40FYwpYboaS0ZMZekTAGrZ/6JNhtDQSrb64tE8GEFKn
         2eENuT/UA22jjS+CzOksx5rOI+kNEmfhdEJssiZsEA/E2fqxrl8CfvzUVpZ5frHVstOz
         2hqNuq8ga8TnDmrLpxcyoXM1w+62Isfjm8NqPWhbEty80eB+SY5VBHApzaVJxehLCn0w
         BOnA==
X-Gm-Message-State: AOJu0YxnoY1DjP14e1Rhrs5lZSROJZqlBargJnr8+FPbwQQaBULfTrPN
	xDcnfKo0dneHBQszQUyX19fKhSd5qKn3OR/moh7q2nBVYK7sZF38vS3FCcNom8c0EE7tBK1XHDA
	pw81s5CH0I5DP9n16JZkcdxSCfY04DjnCza7dM4nCTCmebKisJavOyL4rJRa/Sj7cxYPr
X-Gm-Gg: ASbGncszJPZOz59j+coEYMACpQTrFtNCOejuVvn1p9r+M/HBoGSzfiZ3RG7FG7Y4DyD
	8vOPET+kKOLTO1Hov4694nySHQRhNOdkdZTmFu+gENe85yUJkLqhej91CV6HSb26pk1SjgiJ1XU
	VCbi+5pn9zZfipc9tQ45APpJZUZjy29MWMdDq0pCHwOuSzMKLQXv3rRtRyOdCNvY7+U3a35u4EJ
	eVtOZzqfQW1+wzSRg8dFfyRGfrNMxqqVJsgjjbrZjPJ4cmIMU/ErxUimcbrUzb74a5cWrMISpc5
	ckTGtcIFq30I3CQ5t8iXoIaMV8cEyjlf8tSXN8/z+w2CZywNof9/xH6pIwmsRfyPpaS7cTID
X-Received: by 2002:a17:902:e74a:b0:27f:1c1a:ee43 with SMTP id d9443c01a7336-28e7f32ff11mr31042375ad.29.1759302272022;
        Wed, 01 Oct 2025 00:04:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv94nJISy/926rdHvVX5QYfH6D1YpTXMM4MBF8t63Ks9MFaXihh5qMTzyo0mDLv3bcRsz5VQ==
X-Received: by 2002:a17:902:e74a:b0:27f:1c1a:ee43 with SMTP id d9443c01a7336-28e7f32ff11mr31041995ad.29.1759302271554;
        Wed, 01 Oct 2025 00:04:31 -0700 (PDT)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69bd869sm179517665ad.120.2025.10.01.00.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 00:04:31 -0700 (PDT)
Message-ID: <58d76b7f-843d-4439-a987-7895e0b52441@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 12:34:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Fix dependencies of
 QCS_{DISP,GPU,VIDEO}CC_615
To: Nathan Chancellor <nathan@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@lists.linux.dev, stable@vger.kernel.org
References: <20250930-clk-qcom-kconfig-fixes-arm-v1-0-15ae1ae9ec9f@kernel.org>
 <20250930-clk-qcom-kconfig-fixes-arm-v1-2-15ae1ae9ec9f@kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20250930-clk-qcom-kconfig-fixes-arm-v1-2-15ae1ae9ec9f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bqbhrVrZc5z7k-RnuZ3owd-P3SveYa_X
X-Proofpoint-GUID: bqbhrVrZc5z7k-RnuZ3owd-P3SveYa_X
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68dcd281 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=zds2va5xP088SW_5QeoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfXxdqjKZiNou3H
 7gdLH6RF0AqtkxpVM83HO0cLzul0FEcAsEvm8+1AXQi8wMqSF0diprnlNzIOyegAetN6rtfwKwl
 uOU/mnlhaLSV6IasDzfrAaEbgyZFbMSMieEskomZRF4Zaihph6XFaNhctLJ5nzJ9h2+v66rPmDS
 XsgcDBfEbxFsMtdmIbpCvBW5yu6WLAJDF0ZtXzrOaON9GhNrcjVLd9Teo6T1BjqX5zVaNRHlXfe
 eQXK0AvkXiodRye9sRxIYkuwOEOy0q3v6+ZJjDqrjUPwN5HaGZJQniKeWLWrQaaF24fuD/QuP5P
 GX1VCyK6pwoUQy29vI8K5SZ1iVhTUDouf57ojRQ6DBRkbFo0sUkcF5Ivd97YVT4EyPShwsc9r1y
 ih+hkFHKP6DzER8+kYSgCordy/EeuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175



On 10/1/2025 12:26 AM, Nathan Chancellor wrote:
> It is possible to select CONFIG_QCS_{DISP,GPU,VIDEO}CC_615 when
> targeting ARCH=arm, causing a Kconfig warning when selecting
> CONFIG_QCS_GCC_615 without its dependencies, CONFIG_ARM64 or
> CONFIG_COMPILE_TEST.
> 
>   WARNING: unmet direct dependencies detected for QCS_GCC_615
>     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
>     Selected by [m]:
>     - QCS_DISPCC_615 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
>     - QCS_GPUCC_615 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
>     - QCS_VIDEOCC_615 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
> 
> Add the same dependency to these configurations to clear up the
> warnings.
> 
> Cc: stable@vger.kernel.org
> Fixes: 9b47105f5434 ("clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver")
> Fixes: f4b5b40805ab ("clk: qcom: gpucc-qcs615: Add QCS615 graphics clock controller driver")
> Fixes: f6a8abe0cc16 ("clk: qcom: videocc-qcs615: Add QCS615 video clock controller driver")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/clk/qcom/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
>

Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

