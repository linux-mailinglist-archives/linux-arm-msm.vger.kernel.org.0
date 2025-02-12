Return-Path: <linux-arm-msm+bounces-47756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D20A325E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 13:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C85883A7181
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 12:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633C3207DE3;
	Wed, 12 Feb 2025 12:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWXfI/gg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19E2205ADA
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 12:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739363481; cv=none; b=vDsIEkTeGtrKYKjUGb5ceI+WzjUHa2rF3UADi7TANzFlLwpJl4zPipXd7zWxCwEIf2UkXVF6TX6xBaUJgs3K3zCcufxUdJgaBp8SldjISKcNoIIa8Zq9lXVcJxYqWIC3UwsO4IuQiBGa55OuASOmSzMvaBpAGc455uNjXKAO0GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739363481; c=relaxed/simple;
	bh=Sw1RFIbdqvrDRq7bfSltP8qjVVO6vDoRF2ckQpcllAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GXt43cjtPq2eeQbiV9+WvVwBJ/cLzPjB27roN4WbwdV4B1WMrokGNljX1B4b+5SF43Z6xx8rm/frmBm+6mOQ7uMr+YgVw56jbxPrZF+42PEjU30oSV9ZMM5pH8q4tLT2KA/TSgZnHqaEXcdd1nK+uE5wn0LuyOmgNwo4qW7cyv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JWXfI/gg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C8iJmm023543
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 12:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z9QWP7el2uTNGDTDFC9ZQXgQQlgrevRr41237WlNeGk=; b=JWXfI/ggiqNKNmS/
	YWsRJn++HeoY5nZRTzyAIfcML1aGECSLeVlvdpeX9Kl8X78XWd2PG+UUq9rbpmbH
	IFnJVocRbbLJaj4Q0FbSfs+y8kMx0cqyzSmSHqAFNORcr7QWXB7RgSkvyBIjqOAj
	mnRdsxadBh6Ul5Cy4MAdswc/egdbPZXiR7jrkv+F4B5Bl2Yn/snujutJcftTR5pL
	azAgMCtsUJGJDhDENTX7j5oB+OSW+HEPWVjuv2RTptQ9plvuf5C7EavRPowkIS5R
	topsOqGrkHNVfpkLe1MRVOEV5K+mbp64auKR49LxaBmOw7JZtENPqFELlTTFouYB
	0Js1NQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0gv34ha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 12:31:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c05239c607so85124585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 04:31:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739363477; x=1739968277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z9QWP7el2uTNGDTDFC9ZQXgQQlgrevRr41237WlNeGk=;
        b=DsNHXTIHBmRM1CRw6O/1fCEjenbbVfQXZGENXr2SWbldR/dUNz7hNfKAm+Rxt3hpda
         pPmp6vLBsMd3K6AWQS0IuyP0CQlsmFAtLhEq4vzOufHnf+soqRS45B0rj/g7SWM0hf1b
         NZiWE3Vb6TMBuSUTYLV7+Tg0Kr3+2sCy96VBhmxewqpD8YOSLzB4ZDwDpkVP79tDZ7bU
         DOA70lxKtxtY7+hCyO7YW1LVfNsYGF6AZ+A+v5sssHZHZ8n2ZnmZJft7ZbhODncofCkD
         HAShVN3cykPc1oxomIsdrFv9VoSZzy8y5/DaOxPA6tJJx8ADhQKhUYYn8WSD1PR2goVp
         BvNg==
X-Forwarded-Encrypted: i=1; AJvYcCX/43G6j360T6WLaunrzRw0NNPieNZtWTsRvdwlnfwwukBD9luIelf7cWD90wxyP00aFYh/bct2IVi2bsHl@vger.kernel.org
X-Gm-Message-State: AOJu0YwnZq++OEcDaLwRLn63ZPi0RUYm6+cIKByomZ6ulOqoJGPG2LqP
	/8EEI8hHP/yNzIqVf2vnoEdMXIKegPqy4zYy7b60kCeRZj00lnUoXpF1eCVoMDHJ74j1Q1Gej7X
	VqIoQaITNtstD468N4qiIXhgS877yq+kRu0D0/CtPatRmSAeBkXbBaB2dcgt4VtgTq8UiHeVj
X-Gm-Gg: ASbGncvroqdA+dPgmCqEfQtNI3kqztyuTvigDso0v8mpAIe42ct/CZigV2+cv5YomkP
	C9XAQ9FvG/SWHZvtbQJgVcn2d6LVQFp0i2OvAJ/6FWs/BV5G/UW7fc/h/6pjKU3ZCUlKd+Gu8RF
	ZxBal122+KyNJxNdPCVN1LSjDfcpYuNkdhC2wbwY7HSPiOlS06aE/kWdPDTVhgb8OZH3THHiFnz
	zukttBfZGZjJheI5Gmc5IwW1mI5NyAmjZzB8OKUibSR4UBkrq4CEw7JdIh+iaGHr8B7zdK7z2Ul
	YF+/KEt9GFlF2QpC1vmx4HNzy9Q3f8CM1arZtSxawfZZV9VLXLfuKv7vVQQ=
X-Received: by 2002:ac8:5e12:0:b0:461:6599:b9a with SMTP id d75a77b69052e-471afed742emr15470371cf.11.1739363477348;
        Wed, 12 Feb 2025 04:31:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErWOtL+nvjIK8RRyMck6iXi+gOM2odNA1cVHLBMNOsJmA3Eug1vozAeeSyQTd4pelT5p9Ang==
X-Received: by 2002:ac8:5e12:0:b0:461:6599:b9a with SMTP id d75a77b69052e-471afed742emr15470061cf.11.1739363476836;
        Wed, 12 Feb 2025 04:31:16 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab78aab804csm1101878666b.3.2025.02.12.04.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 04:31:16 -0800 (PST)
Message-ID: <93f1f01e-e6b4-4dc2-9485-aba168c6d88c@oss.qualcomm.com>
Date: Wed, 12 Feb 2025 13:31:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] phy: qcom: pcie: Determine has_nocsr_reset
 dynamically
To: Philipp Zabel <p.zabel@pengutronix.de>,
        Wenbin Yao <quic_wenbyao@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
        quic_qianyu@quicinc.com, neil.armstrong@linaro.org,
        manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250211094231.1813558-1-quic_wenbyao@quicinc.com>
 <20250211094231.1813558-2-quic_wenbyao@quicinc.com>
 <6c38b6e028858662aa5d45f4a14b993860b73cc0.camel@pengutronix.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6c38b6e028858662aa5d45f4a14b993860b73cc0.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8ReRWZKdokgcygtAmL323uQJxCJ4tKp4
X-Proofpoint-GUID: 8ReRWZKdokgcygtAmL323uQJxCJ4tKp4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502120097

On 11.02.2025 10:53 AM, Philipp Zabel wrote:
> On Di, 2025-02-11 at 17:42 +0800, Wenbin Yao wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Decide the in-driver logic based on whether the nocsr reset is present
>> and defer checking the appropriateness of that to dt-bindings to save
>> on boilerplate.
>>
>> Reset controller APIs are fine consuming a nullptr, so no additional
>> checks are necessary there.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> ---

[...]

>>  static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
>> @@ -4203,11 +4196,14 @@ static int qmp_pcie_reset_init(struct qmp_pcie *qmp)
>>  	if (ret)
>>  		return dev_err_probe(dev, ret, "failed to get resets\n");
>>  
>> -	if (cfg->has_nocsr_reset) {
>> -		qmp->nocsr_reset = devm_reset_control_get_exclusive(dev, "phy_nocsr");
>> -		if (IS_ERR(qmp->nocsr_reset))
>> +	qmp->nocsr_reset = devm_reset_control_get_exclusive(dev, "phy_nocsr");
>> +	if (IS_ERR(qmp->nocsr_reset)) {
>> +		if (PTR_ERR(qmp->nocsr_reset) == -ENOENT ||
>> +		    PTR_ERR(qmp->nocsr_reset) == -EINVAL)
> 
> Why is -EINVAL ignored here?

If the NOCSR (partial) reset is missing, we can still assert the "full" reset
and program the hardware from the ground up. It's also needed for backwards
dt compat as not all platforms described it when originally added.

> Without this you could just use
> devm_reset_control_get_optional_exclusive(), which already turns -
> ENOENT into NULL. That seems to me the correct thing to do, as from
> driver point-of-view, this reset control is optional.

Good point, I forgot _optional_ was a thing in the reset framework

Konrad

