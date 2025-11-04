Return-Path: <linux-arm-msm+bounces-80322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07283C31770
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 15:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D43A218C591A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 14:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F9D22B8CB;
	Tue,  4 Nov 2025 14:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d2hS0VxF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LgIrfhDX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738A923A566
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 14:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762265718; cv=none; b=lHwws3jOseF3CZ7jFckaHBGWgLWFGafJowSz0NC0VU4JzXgP1xfXJNyAW4EwHe3Lp9YywFoz6iuAcEDlFUvz/iUC9HWUH7SQqZGMwQmr3xxct+IqglKvefxHQn+SEotMBmP9PjRGkp7UaLiLRLhoy8cs0N8YK6ybWZsr1Op/LxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762265718; c=relaxed/simple;
	bh=4kBQhnMmMZ/Vy1JwfBL2bis3lRa4wBFnh9JULuE5Ri4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uWI2v9U5DRRPrX2lxzWF5vMFUIUerGPQnVj6J/61pxL7GxmOYz+Fwqy9mBTb8lcadbkmg/0Eqf4BBp9SUyjsQBsYR/04oJLVOpgU0vAa/FMLYKAU129KIBPK2JCnq3prtPIQ+oqaMReHa3YhiNuyFLtfB/iTgQHzidJ1tKvNBrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d2hS0VxF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LgIrfhDX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4Cfkmi1974141
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 14:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZawzPU1DPbFarr1ZZzIREyZz+hjl5nYRiQ8rgw6UyOo=; b=d2hS0VxFizwnb3BW
	uVAga6h34ZWMfLPqjAOnk0ObVLn3KSsrJ0mdCrJfhufeY+UYDhCeV+LKqKkbw1Nb
	NaEk+FQ6r4mYne0iHeC0EbSu/O+WC4bhomJKaKUzlk74jwNhehhhDoi8ZZwKkafV
	FlQBhkr9Qai2wi8/Su6BdGO2JoTIQpKe1Rjgsem07lt6XpKDoUgJ32dBP/ujef5n
	3F1UdVJ2V15gulYGj7H43bnD5DgYKFOA/yiZKUzqTPOkLyBOhPWJukExyn8j+xS0
	lt3vdvv+BBK8twD8vemZzu5ilHLRnW24+CLw9FLLMnOOUvsEntrUC8S0UbKoaeik
	IuuL7g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7heag95u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 14:15:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4eced2a52ceso20299581cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 06:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762265714; x=1762870514; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZawzPU1DPbFarr1ZZzIREyZz+hjl5nYRiQ8rgw6UyOo=;
        b=LgIrfhDXUOpygd+EDO5ndj9qqPEPQ63bEDMepnoM3bIsz8PixgnIpLClhVfPMTnvlk
         HybEiSsl3bcNDLzly14Qbso3dyn2ItUmYZahYFL2+jPYoXVrr/h0NGg9yQ7odFJIRojx
         t2cnIrsV0MfqQc8K0KtLROeRrU/mi4uF6yCijIhNatoK3glVRezSoYwi4KgObf0Hei3q
         vzsNRxq0jsb3et7SB0uGP7mBP5RrXHkSLB6/h+hr8Vibv3IXJpTMksXDUa4G0iLaqkBu
         NqUbxymya7tt1Z9KO0sx0FDcAcpZtKcyevp/hebuxtfvXkHAZDPann9kZiQ8pdUdzeNf
         RoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762265714; x=1762870514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZawzPU1DPbFarr1ZZzIREyZz+hjl5nYRiQ8rgw6UyOo=;
        b=vHh0IQLJm+689anW/YhVqk+rOyqSu550aIy1+BN8xFZKV+598u48rH18cFVkm14Hdo
         h7QhNtK/7rvwtcA7avDDuOFnXD6DOqoqC+S7L+nNL176Z1CBMpFZTk9f0zeMlVvOI6e0
         VqmJVNa99K+bWSjo19w4CpzHmFVNZuXBCoIA535h8+8M9m+ZShCtgFigexH4o9sayZNN
         YINKwQa01dczIAd+dDQBs0K31jBxXyIo++JNgaZ91dc2PYd9SUhbILCNXFTYaYLVNRWv
         mGUHGeFT3G7LKKd8IQBlkuoUW3hthrxEXOjXTUaEZJrgVAKxp1T1LIAVtDTPemBvIGiv
         /mdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9EtTukGWaEgPlXc67Ww/0x2slLKtcXwS9FUL6jSid5RTc0CquPHIXaLwZXHI/QbetO5d3dPL9ID+Ft8i8@vger.kernel.org
X-Gm-Message-State: AOJu0YxZXbWL1HlRiEc7pRWUofuFPHwDh2N7nF3Cgv60GNBcxWQW9LAJ
	odQPCE/tcJOYWCWfANwCAxu5Q3G6d3xUsvRzuETwMCsl6VNnPn2V/9eer90U++p5lUYiOI+Egp+
	etnKJvhTF5ud5j7Qmuhp8IpwqqRNe3qkwtqnFc4sX28iJUeUuezGbwcBV0aq1kWKbjV3x
X-Gm-Gg: ASbGncuSTfsEk8JVhRa3m5Ys2EXTR/Oo7QBuYMZ4Qd1jFawJ9plmF7iTNZ3Iw7ZrcIk
	IBcbEoMldQWfkzZth0X3iNSFpEsBL+O+hAc3DRvAC7Jr/FC2PcWg0xvioafCHPWXGVgYiZaR5zU
	KdMM63ZejTyeY9AqPnxyniisQDpS14alaGtny1g1aJtPJewYESaf8YBphxK1fR4F7xvOCjXI86v
	SvU7qtaxuqTBDMfDN8U2vsZ+c9hZQvpm9aXjuXeiA00/Yjw/HFqJ6EKXH8TE1RMaMWKHoaLE+LV
	XS5JhJ58TBSXKeVYqzi1aJzRRZz/8fj4VxKTVMW9SJHhy2mYeJiG9BLPKK0+ClfiJSVa45d8ujB
	h9FWKgmIE9+V7ydstigf2MwSu5Xig5+p+nMKdyJv658puepTTd2ACL0e/
X-Received: by 2002:a05:622a:114:b0:4e8:90f4:c3aa with SMTP id d75a77b69052e-4ed30fa1f91mr141075121cf.8.1762265714500;
        Tue, 04 Nov 2025 06:15:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCnoT8noK1WKbItMnFv98+PdZWeIxVjd/vScz7EL4P+FoEmsmNlCNB/0M/VxORbweqoFtfOA==
X-Received: by 2002:a05:622a:114:b0:4e8:90f4:c3aa with SMTP id d75a77b69052e-4ed30fa1f91mr141068421cf.8.1762265706797;
        Tue, 04 Nov 2025 06:15:06 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7240751077sm217902466b.75.2025.11.04.06.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 06:15:06 -0800 (PST)
Message-ID: <e50ec922-64b7-4d18-b527-0563260fb5fc@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 15:15:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] cpufreq: qcom-nvmem: add compatible fallback for
 ipq806x for no SMEM
To: Christian Marangi <ansuelsmth@gmail.com>, Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251104140635.25965-1-ansuelsmth@gmail.com>
 <20251104140635.25965-2-ansuelsmth@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251104140635.25965-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GekaXAXL c=1 sm=1 tr=0 ts=690a0a73 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=oITguE-HI76OPg9VQbsA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDExOCBTYWx0ZWRfX6CLzXg1/0bai
 lpti0KEGsRnHmgTE0lQLVdD54jSvV8KcqwhPkZWi0KQgQlpTxVH+ngNirths/HWqPd5L5/qAUg8
 1v2MVNXB4CS/FX72MB7ht8lDN7CxR8unOGcnnURZChH2wr9eP395p3ZkXDXPVDSFJYjXqjZsiip
 qBBcyuAxwc5Kr14v+XVdJQI1IS3zWpbN6puPnWWzQmG6nEsdd0U7eXeMn2LPEEK1xeCICwskSGt
 3OnxUOFWPMGg/MId0hOoAoPU6yFAhtmKUO3bwpfrmvW9EBf8nNGXLtPor+l1cyNMEqm2bi10mQb
 YZf3cXS9jlW3qNebLr1VDIYu8c3Iw/TCw8FzXtBg41snwmszSn/sCJTiqMLWkpl2zC7pi5aHCsv
 RHSdqaEG1g7C1YPJHbDjiF20Bnu8Ig==
X-Proofpoint-GUID: nwRwNVzDa7s9fH1Hx4mlrz0xCgQoXTkb
X-Proofpoint-ORIG-GUID: nwRwNVzDa7s9fH1Hx4mlrz0xCgQoXTkb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040118

On 11/4/25 3:06 PM, Christian Marangi wrote:
> On some IPQ806x SoC SMEM might be not initialized by SBL. This is the
> case for some Google devices (the OnHub family) that can't make use of
> SMEM to detect the SoC ID.
> 
> To handle these specific case, check if the SMEM is not initialized (by
> checking if the qcom_smem_get_soc_id returns -ENODEV) and fallback to
> OF machine compatible checking to identify the SoC variant.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

