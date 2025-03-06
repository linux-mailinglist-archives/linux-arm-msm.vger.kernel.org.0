Return-Path: <linux-arm-msm+bounces-50510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA48BA54B21
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 13:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3F131703FB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 12:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F181F5FD;
	Thu,  6 Mar 2025 12:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AO/VPoA/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE0117583
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 12:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741265159; cv=none; b=i8s51kevrDaDcaNdEwVP2/gc/Rbh0iOnNwHYbGVNmT0Ex3nN7v+vOKb5RAv2RKXhmj8wqmvy16wyiHi9r+Ny0uI8Q+baXeFTPKArLYT5LBFRTKA4ZVVzaN5xUiDqUE4wa8gCqNfiyo9svsB1xks4KXR52bfNHD7rOAQx8Cp1nAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741265159; c=relaxed/simple;
	bh=BsuZfBy0o27rEroxO2CuiDchs3Er752NKZpUyYkv714=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSDnJ6nW9MVcgvBDZjssIuuhbNbw/N0bZIZIaU+Whakj0DLuiSOp6gy+I8DHPg4d9NbH3itzwU1aNEaywIUDijGR5VIDatMw587mtTaCFbeXk+qIoBf1Qtk+pJXyIaetLm0bMQF/5BOGXdOHcW352yHelRqIDPomknkoigbp2Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AO/VPoA/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52645Eiu031234
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Mar 2025 12:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FK/RHL8Gonc2grMn8KNItFyJCXiEsAQ2Rp7C6pvjJfo=; b=AO/VPoA/n4MpLdaF
	2W90/k/egkeQpg6kVjPmfdjnnvJ9rgyF+P/Br+kZ5/MBpWxjjt9EYbR5fbTj8aYN
	gspxQxFntaXVOaj2a300Lt1JYBQwUa3hRBfBdRHwb7uDiLCM3nfVah46j7aVuTgk
	WadBUa44+Wq0jtN/SGhuqsoD2ceKDb+g0WkkXcR2aHDW9lp/GOjPE0ME8ZAOTevI
	yWsoQkGxfXVHujT0sZnWQb8sRd+2Kw/YvMGSzYpmHsbLcX2vkFq101KvCMDxkD1u
	w6BoL+PR2wYUJNGk75TsZF/2XLjYVZIHABy+tcS0eZXxPu58FG4MvwZYdflXhoVt
	X2EuXA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4574ce9en8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 12:45:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c39555fafaso18435585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 04:45:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741265156; x=1741869956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FK/RHL8Gonc2grMn8KNItFyJCXiEsAQ2Rp7C6pvjJfo=;
        b=kbWsRFNYwyLq1ssBuB6Bnnea1Fzs8gt7HSSfoCgAbL1it87uoUSg32a6h7CwXfmidA
         D4t/r+V1Aup4xctH4C8Cax98gHf+gNIlyrjeEvqW+oy+V6GS6dR2mdyAfdJXiOD4xzYo
         0/yZvSIToiX0hhdRWD1UgLcKxEEO+7Bi5fb1e7JA9bQTNi0oUtJw0pve3ZmCgUIbrcpv
         VDqTASTEm/fxRA5rqS97R0P4pph4YXYBnpR4Z3X2JP1/sTwoSld0RJMRk5wZ0I67AOH4
         6V5MHSvwIKI3pI0UkMPZ0aVqLoVWUnOTGMUwp2a21eDn4gY+eOkLpzDkCdbsHRNaML36
         WrMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDxwTcNCLJ94SXqkwiEjyaji0avr5+ZJKVAk42/fVP2zYo1npHAcGImRnfXbh8UhS/ETKpzjQK5kZt5eqU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0QMocCZas1srpixGL7Xne+tC3TNDXZyMrbIbRLwq8x7n0VIRd
	De9gulFp3KMhqjWgI3eFQhTBvaZ7eQKqFWzTqUmf8bonmAs4nhrSJbxpWUD+9rKWVExyiFwMEF5
	mCpO/Blqbb4+s3vyx/NS2yJCHu70peOp6pyfRfjteTQ8+CSsqp5YXY8OX/Nu6beqb
X-Gm-Gg: ASbGncsfDQ/2Kcaveqcu7hSLSW9oDob2is33GSdy+71kmdgZi3+pOLFUBU7r6HBjDZQ
	oxPkm68GAJvRZwTQXLmWuX0at2Thn3OH0F7GlkFtzj9hiPfJmkWm7fjpYEg2u+rzAqQb/qKIPYt
	SdPhXrweA1eCWFVM90F8h4bqH0In+2Fl7KAnLNC3AcUGWQSQv5hYh1Pxm+HTyQeaOxtgprtH9JR
	wtIzuDUGZxFNxEQ3L1pTLELKRXBKhCu+pFnm04Hiaar29Q07NjURUKiIvZWnDbe15t7KIa1v3ZJ
	ITaMbSXrdQNdnfiqBOQwdd3Zt0fY7+Hgc9zViRz8h3Qsu3/RoUCbu8S3IzL3pRJE36g5Tw==
X-Received: by 2002:a05:620a:400a:b0:7c0:a898:92fd with SMTP id af79cd13be357-7c3d8ed6b93mr383224785a.13.1741265155831;
        Thu, 06 Mar 2025 04:45:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwnifr+rtFdEJ8n5ks+Pxlxph16AhZEdlNsHmeChu9nXmI4OJIKeebQYhCU0Lvokc2XaQP+A==
X-Received: by 2002:a05:620a:400a:b0:7c0:a898:92fd with SMTP id af79cd13be357-7c3d8ed6b93mr383221885a.13.1741265155393;
        Thu, 06 Mar 2025 04:45:55 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae57a84sm169205e87.62.2025.03.06.04.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 04:45:54 -0800 (PST)
Message-ID: <1aa77e2e-6bb0-425c-9b5a-64092f8df9a5@oss.qualcomm.com>
Date: Thu, 6 Mar 2025 13:45:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] clk: qcom: common: Manage rpm, configure PLLs &
 AON clks in really probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
 <20250306-videocc-pll-multi-pd-voting-v2-3-0cd00612bc0e@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250306-videocc-pll-multi-pd-voting-v2-3-0cd00612bc0e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EDyuZOAE0Db4ZzQJHIItP-_s5vY2Pwoc
X-Proofpoint-GUID: EDyuZOAE0Db4ZzQJHIItP-_s5vY2Pwoc
X-Authority-Analysis: v=2.4 cv=bNLsIO+Z c=1 sm=1 tr=0 ts=67c99904 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=yHIa6xKSslqa2ziMgBoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060097

On 6.03.2025 9:55 AM, Jagadeesh Kona wrote:
> Add support for runtime power management, PLL configuration and enabling
> critical clocks in qcom_cc_really_probe() to commonize the clock
> controller probe.
> 
> The runtime power management is not required for all clock controllers,
> hence handle the rpm based on use_rpm flag in clock controller descriptor.
> Also the power domains need to be kept enabled during pll configuration,
> hence attach all required power domains prior to calling get_sync() on the
> device.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

[...]

> + * struct qcom_clk_cfg - To maintain list of clocks that needs to be
> + *                       kept ON or misc clock register settings

I have some reservations about this name, particularly since 'clk_cfg'
has already been used in the msmbus/interconnect space..

Perhaps qcom_clk_reg_settings?

> + * @offset: address offset for clock register
> + * @mask: bit mask to indicate the bits to update
> + */
> +struct qcom_clk_cfg {
> +	unsigned int offset;
> +	unsigned int mask;

"u32"

also, to expand it, we probably want "field" and "val" to replace the
calls to regmap_update_bits in some drivers

I think we may keep this /\ struct for things like:

/* Enable clock gating for MDP clocks */
regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);

while keeping a separate u32 array of branch clocks to call
qcom_branch_set_clk_en() on - we would then use 3x less memory


> +};

> +
>  struct qcom_cc_desc {
>  	const struct regmap_config *config;
>  	struct clk_regmap **clks;
> @@ -39,6 +50,11 @@ struct qcom_cc_desc {
>  	const struct qcom_icc_hws_data *icc_hws;
>  	size_t num_icc_hws;
>  	unsigned int icc_first_node_id;
> +	struct qcom_clk_cfg *clks_cfg;
> +	size_t num_clks_cfg;
> +	struct clk_alpha_pll **plls;

Some ancient or "non-standard" SoCs have non-alpha PLLs, please rename
this to something like alpha_plls


Konrad

