Return-Path: <linux-arm-msm+bounces-67294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1EEB17BD6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 06:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0281A1C228A2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 04:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CDB21DDA15;
	Fri,  1 Aug 2025 04:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKX6tpEM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A9070805
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 04:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754022744; cv=none; b=Pa9kawIdGBmWJqSKnsXY0jko81mzOE3cFewCFfbYWul9HRdXqi5OmpNajLXJQO3bM8cR12ZOsXWpRHNJrR55laC8yZnX/kekpzZqnrAydmwUoQFOSxFK6Vb18TLzSQ7Q0Eb1SOAv1fMKkQMbMhkKi9aPe2jMlHd/FIL6BdB6cTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754022744; c=relaxed/simple;
	bh=PZsepC5GNtWag35e7sBw+U/csrG/NR/QT3fy/e+DqFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QrUt2UG1JF0o74SA+xCwikPHYtGF2XT7syf5Rs9EQDCZUmw4s1kIat4gwCLZ7jdIVDXf1zgzYk3B3P7Lc2Ivd8XEFBZeVxWFVZj9z1GoZpbg+HtCOlPyY4NcafoeYYLiM/6WFKic3Qk2d+WvPGnwcJUt2FJdQvmVnXWo52XDd10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKX6tpEM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5710ZLmO031981
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 04:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLNJqEgg1Sd977O4ZU1RM/AYukW1berh1aTC8vgdSTk=; b=XKX6tpEMGRmJEt+C
	Yb0ngEYWNu8aWh6UUdfsCiRY92x1HMtIWMWf7TFYLvEoApCqdQ8UDJ3z34PE144b
	8aiiXA27565LWgiSDCHVsCy7mh0+SQQFQj0V+rxk7v4hC065eu+nwjTmlYj/pf8D
	pWC+IsEmQhCvPj77urRTg1Erju7LBFb5fpmSsWGdYEjh445dhsFasrFqsvla8JQH
	jvsUi3d7UWGSAep8yBo7aAdBetI6x0RO9sd/PbqbQc6B7uOp/9EUlgWGpH49uzC7
	AJZT6kLd6tbtew96Td6X4XPegkqnV+88JVoL9WpxvlfmFPQ2ZHP0KzYq0l8MkLBT
	TTkEFg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwexsje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 04:32:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b423dcff27aso263839a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 21:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754022740; x=1754627540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yLNJqEgg1Sd977O4ZU1RM/AYukW1berh1aTC8vgdSTk=;
        b=vXDEifNHvghusoC0SBhb4acVYcVbarxuiH+wxj0NCMYfdCGBxnBspFocXittCbLLWX
         MYi61cm1CeW/DlPc/bMSt7CtpRIs0YMgl6+g5ukZbkQbggUX4YpVaHd64m5oCNHaWTQg
         kgJUrC06RbpwImTMBbK2mjeDKNlW5ZXhboky5v42jGce3EB/yT6YMqCeZ3PQtM9c6IhH
         TvDPpKxWkxAtVexzXT9AhdIUCnow7vWoXRtxf9NejlgFsCWmmsSSmsdiuGSSudHedQdk
         L5wBEz1UAY3sr8ObDP5yAlIQw1ogdTEn3g/Celd5GYDqK8mAqk/zdx5TPrNQM2catXNp
         pWLw==
X-Forwarded-Encrypted: i=1; AJvYcCVBJP0ZowdLPCJvD/Gvg8AqAVh+mJOFfQjv2WJXIB39NEL08RGhyCvBbl0C9LBN0XWJ+bHvCiceAz2Fxl1y@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx1rg8M2r5qK3azy/vNSef556CtakUmb4IBVQe9hGmrxXAk29l
	aRuDxJSAZu/loYyW1nKCbmKVHnOlMoTs40CR03epP7BIv8KXlIhldhfJeUQGTKcTria9SxQr80e
	2N8tjQlm5ZnN91EIaDGC3d3VJBAxvgZm8gTBrHN9Dsz7o943V58p6Thceh2j39t628FL9
X-Gm-Gg: ASbGncu7HzWcdP89o9MXFVs0LxPPyw9UGIA/brncVOcSZHjmFYrM2faUv8zlcs5sRXJ
	ITKevVAEmaYhnJPGM51Qf/YLqOUj1TnLqOEBEdkmTImuj5EoQF5mXW3LP4Pi61rC1np3+dbIJrz
	4B7nAGrw1DLyRuIETJZl5NS9Xyee8VgvGVhgHV+ceEHTBJCaadZGw+O0t+OATqvL/eRHmPxCWDI
	5WSyc+pwST9MIRQU5LE4ZWld2L3BpfTO/DNfp/Z18Wu19HFpHaM6RB7sbBH5Uwm92ohWgcXCBSF
	0W2WqplwDTu5TbDD+7M7WW0MI9VwK5ZFSygcgO2+2AxymlK8+WIhrxOvlYhUZ82xT1o=
X-Received: by 2002:a05:6a21:998b:b0:21a:da01:e0cf with SMTP id adf61e73a8af0-23dc0e32c0dmr19142858637.22.1754022740377;
        Thu, 31 Jul 2025 21:32:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyRx/Pl7BjdxFzVTQWc6hVw7LnXbmjumZvBjBAl4aA+8La5UD8cNfMne03gb7c1tgo+RC+vA==
X-Received: by 2002:a05:6a21:998b:b0:21a:da01:e0cf with SMTP id adf61e73a8af0-23dc0e32c0dmr19142810637.22.1754022739991;
        Thu, 31 Jul 2025 21:32:19 -0700 (PDT)
Received: from [10.217.216.26] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbcd00sm2994293b3a.60.2025.07.31.21.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 21:32:19 -0700 (PDT)
Message-ID: <784545d0-2173-4a8b-9d5d-bee11226351e@oss.qualcomm.com>
Date: Fri, 1 Aug 2025 10:02:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] clk: qcom: Add TCSR clock driver for Glymur
To: Abel Vesa <abel.vesa@linaro.org>
Cc: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-3-227cfe5c8ef4@oss.qualcomm.com>
 <aIoBFeo00PPZncCs@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <aIoBFeo00PPZncCs@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: W842fCMuz-j08E4zNXkk1BlehOTHvW7V
X-Authority-Analysis: v=2.4 cv=Wv0rMcfv c=1 sm=1 tr=0 ts=688c4355 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ai6KDVl1yJewkkMvyeoA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: W842fCMuz-j08E4zNXkk1BlehOTHvW7V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDAyOCBTYWx0ZWRfXzGWmJrJFkxSF
 sjJbEVOpuW/DTWyARUbdFdC2fgykSLp1AW3W+a0YacEYqsoC1JrMeFe9Mrl+uGcdJAD3FEeD8vZ
 fHRAXM69jbpX+imTEJ5Ilr0J8iktWw5RnBt/xb911PQN3AFWjeend8F9PEqfYE8f4jFxNnxEaG5
 bZUTYO1jie0QEopyZuyphsBV9p7lI12Mrop9dEBCR5oesVvdKhdvfn7M4Ey0vUOKGr3HyrbdLnW
 3DsHnt0T+v7BjWqP1K1Kb3OECux0VnLIVE/zVjYltNJ4Or/XECBKE50gHSSZGPgkQwzJD2Ts0gy
 Bv8LBv9wilgjkRgIMtq8WjidvLBeO+xsi6isq3rejSWEvfJ5nY6QH0KJW1lEuAZmxj7e2RK6SeE
 ZM50JweiYFOIPtb7fBJ/u8opYCEH6flf8xahyy8IfMVA7YduN0mXDrfrAx2SPOuArdTnJjjQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_04,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010028



On 7/30/2025 4:55 PM, Abel Vesa wrote:
> On 25-07-29 11:12:37, Taniya Das wrote:
>> Add a clock driver for the TCSR clock controller found on Glymur, which
>> provides refclks for PCIE, USB, and UFS.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/Kconfig         |   8 ++
>>  drivers/clk/qcom/Makefile        |   1 +
>>  drivers/clk/qcom/tcsrcc-glymur.c | 257 +++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 266 insertions(+)
>>
> 
> [...]
> 
>> +
>> +static struct clk_branch tcsr_edp_clkref_en = {
>> +	.halt_reg = 0x1c,
>> +	.halt_check = BRANCH_HALT_DELAY,
>> +	.clkr = {
>> +		.enable_reg = 0x1c,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "tcsr_edp_clkref_en",
>> +			.ops = &clk_branch2_ops,
> 
> As discussed off-list, these clocks need to have the bi_tcxo as parent.
> 
> Otherwise, as far as the CCF is concerned these clocks will have rate 0,
> which is obviously not the case.
> 
> Bringing this here since there is a disconnect between X Elite and
> Glymur w.r.t this now.


The ref clocks are not required to be have a parent of bi_tcxo as these
ideally can be left enabled(as a subsystem requirement) even if HLOS
(APSS) goes to suspend. With the bi_tcxo parent the ARC vote from
HLOS/APSS will not allow APSS to collapse.

If any consumers needs the clock rate, the driver should take the
BI_TCXO handle.


-- 
Thanks,
Taniya Das


