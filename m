Return-Path: <linux-arm-msm+bounces-75277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 984B1BA2FC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 10:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58D78625719
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 08:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47FF296BBD;
	Fri, 26 Sep 2025 08:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TW6ltXRz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF15626E6EA
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 08:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758876044; cv=none; b=qWSbaUcG+PBQXS/1jWseAJCrzOZfrjqnHgxxpifIJoYUVSB21ZgVX7zHO1GSQR1lFazZH1dfSTQDDih1qUEeMKZcOpNajaQEqW8BAnzM3zB4mb0Pl9Llbg6ekz0TCJVo/xIzaZ+Li/7A1aIBA02nOqAD65wxkK4qjL2L70QWO/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758876044; c=relaxed/simple;
	bh=BF6fj45ETbF2JTxivH96fy19F1Zq2v8s40/BNLfEbsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jrvvmrKBfacJvpuY5uZqAQQAdR44ByahZndGwIlD0cW2WJeFt39Ed6nbqO8dBpc6T7HYFM/mdBo0UJgM260HVKOlkGKvf0gJTmIlEjaZ/UsATMnby69AECNWD3Rvwv4lRq7Gg8HPy8aFj+iroBqRuRSHPJpLQ7pKYhtAwOpr5ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TW6ltXRz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q7ERLN004177
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 08:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QJH3H/0kmdW6w7MgCtEBO34/S0w4O3IKZVUmNKMzmxs=; b=TW6ltXRzQyf5A7om
	E18NnxeB03KQyW2HIqMhNtSSpsj8daU4M3DoSJiF+CN8Ob3AOMMvzlM4mN2ls++K
	lrOthPpxhzyxOQbPvBVEBVA0rzWNe2lUaLCuItVXgdQ0/nGr/H9nWkPMR7rmrckJ
	rU+AvuwfmzVhlD/iI39A6TtD2ZIepde1jdDt74ujELry+hgSe/qOnh00kayYDXTb
	prbcPCRSvg8qYjZiAZdnt/stB8QpyxDTHB45bEICq106dailIXO/si7EGsO0SwQa
	r2r70ePAFVD08PQVJW7G6ZCaDH5QvaSakNtEFVKtydxUDFyql70//cVqyXW0NM13
	8PL0pw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u24ta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 08:40:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-277f0ea6fbaso22947575ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 01:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758876040; x=1759480840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJH3H/0kmdW6w7MgCtEBO34/S0w4O3IKZVUmNKMzmxs=;
        b=Yd5a79TscTxuB+cFu1uV+TQmg32sRi/uGCdkCe0Fy5jzHiVeGJHduzn2RkGGK/5U+6
         pwI6s3R9Ek7kRpyCkVZFhAdOdafwInAvWPha06pVLiVqwS0cmbLeBeK3GCtgVlsbLUcX
         JwjiwJaHODr8+sVm1qPBfu+SMrTxCZShMNGTc+URNXcxeL0yABmAAizCpOhbptRYjS8/
         QaahZh5o3e5UNqtdyhTlzRSLzNgzqM8so35tbAYH7CNjASedUhIrVRqUFUUqocdvIEce
         dwbmerSCX7FGpU478yi9l7IbUWT903ye13gISqAcYrdXkeDPU54uBVFRMBwMfKy/awoK
         Wa9g==
X-Gm-Message-State: AOJu0Ywgikj6vkNJC+ieTe02agBgLQTYJFN+0fRdefRqAZ8roJENZ4Ua
	Kz9Ie9FWG5tFiIFbSJ0BDftAiD8cfZh0NCXkO3upgrpgEf4gFj0WEohUjY2gpgpra6vFEUj8nmX
	gp3UfspPWdlox6qrvDd6ZO8Nv/1UtlQKyq6tazvLRoX7uPvB2xRZdlWuoc0yAJObTrXTV
X-Gm-Gg: ASbGncvBBSbeDK25XGJ2POWehFZsmiKJPwisKMRnwWBsI0R8zlmWL/cYx9X6vQc1g2m
	YNMyQsKgEvI+V+ihUXg4z8pHf5dN6eIZufGZ3dWOFOZ3cqvbnYdivW4+eQQHSIv8KxA6NvyPIby
	FVnPRGp+ynrbd2TT1mC5gRBNM22aTjrAvt87L7MhGXxrVdgyOI3WBieGzUtmC/KGeFaJ3LKcFgK
	QrJ1m3i175Uu1ZBY3355sbIzC36yuRSIOTeTgLw/qLlyhDsH6wDpLR66NGRI/Pn3hrmbIaWrjcb
	zDI/oG1NsKD0lvFpxXYqs6cM9byMokGG2k6TvFXe6HlllMz2rvkEO5nrjp8TilMGrM6g
X-Received: by 2002:a17:902:e787:b0:266:e8c3:4731 with SMTP id d9443c01a7336-27ed4a4e69fmr57199435ad.23.1758876040420;
        Fri, 26 Sep 2025 01:40:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSYjbgxz3ZpRa0D00ZVNPgHg9O0ctAAj1epWv0U96tMdUGtuWmJ8IJY2bgSO3VYP/MfK11Rw==
X-Received: by 2002:a17:902:e787:b0:266:e8c3:4731 with SMTP id d9443c01a7336-27ed4a4e69fmr57199205ad.23.1758876039860;
        Fri, 26 Sep 2025 01:40:39 -0700 (PDT)
Received: from [10.217.216.188] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6733a63sm47601845ad.64.2025.09.26.01.40.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 01:40:39 -0700 (PDT)
Message-ID: <d55b42b6-1b2b-4a52-8eaf-78c4ed78958c@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 14:10:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] clk: qcom: camcc: Add support for camera clock
 controller for Kaanapali
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-7-d7ea96b4784a@oss.qualcomm.com>
 <d18c5196-dd8e-47d6-87bd-de0ac94fbf3b@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <d18c5196-dd8e-47d6-87bd-de0ac94fbf3b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TApdmemnH6_SfZ2dktMbF8zieOrEKmcn
X-Authority-Analysis: v=2.4 cv=PYXyRyhd c=1 sm=1 tr=0 ts=68d65189 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=txcd_wJ1IAhHlW4x_IwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX0PskV+GhppKK
 broaDCHM8dAkwTdwV5ST3eyoVUxiI9i88iwMvGk0F78M6BKHGZptbVjT0BHPbzL4A/hSitE48R/
 juKtrU1zaCSe6Xt6eRW0LBDQBw6VFdqGE27tpIjES1KaJ/D63JsVRJF6LP4seYvlGwJIlXGKSiz
 5E6Clibg8m3mmkgJ9xoZmEClDEOs5zfaAPw9TgQTegHHMF9Q9xhBM7j0A1mzRNatLKTUIMJP3Pa
 lpE32OUwRIf8kOCMvbQWtIcS8Fs5oibvS+c2QoE9WEMv2vi+S2fWZ508tPMs2YkNK4ZKWTAXHhP
 YImjY8gXcSdl1dpDoyYMVCLI84bdb91QH9/ypu2XFLKefzzETsjSLkhss/wHkANUgMSnLHwn/Sd
 SzXLsYTRPb5FGpSHBBMfCjeKZYGxjg==
X-Proofpoint-ORIG-GUID: TApdmemnH6_SfZ2dktMbF8zieOrEKmcn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171



On 9/25/2025 2:40 PM, Bryan O'Donoghue wrote:
> On 25/09/2025 00:56, Jingyi Wang wrote:
>> +static u32 cam_cc_kaanapali_critical_cbcrs[] = {
>> +    0x21398, /* CAM_CC_DRV_AHB_CLK */
>> +    0x21390, /* CAM_CC_DRV_XO_CLK */
>> +    0x21364, /* CAM_CC_GDSC_CLK */
>> +    0x21368, /* CAM_CC_SLEEP_CLK */
>> +};
> 
> How is this critical list decided ?
> 

Bryan, these are list based on design recommendations.

> For example why is the AHB clock critical but the CAMNOC and AXI clocks
> not critical ?
> 

AHB clock is required for access and NOC & AXI needs to be managed by
the client SW driver.

> ---
> bod

-- 
Thanks,
Taniya Das


