Return-Path: <linux-arm-msm+bounces-75103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFDAB9F54F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 14:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3174516BC44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159B91E0DEA;
	Thu, 25 Sep 2025 12:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqA18vdS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36131DF742
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758804424; cv=none; b=SYqo/m9/pufj2LS6IqgYH0QDPIszA33vbRSAQuHkBDQq6G/52DlyoMEmtR8WJYQDJK7sxikfngZU6advbqawNjt3ipG4TvYiNmanjkdhUyIAld4terATVQIHAK59F5G79AZuaMrL+hIAHhvb7qyATNlnQzjN0bes6x0ScDEv5CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758804424; c=relaxed/simple;
	bh=Sf3l9CHT01uRYsHEl0V9vF5wYANn0cN2l7qyPLMGwTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eeqwQOqCOt9jkeKZG4UPg3jsEuPehM6UonaHKswlysJFA5kyadwqP+s0qW7EWh/N+W6/+Bm8JlBcC911CGzY0aEZ/cqZwsLeQzyy5L/hRhiKIMYbbPFrpAc8jXoFqY0scArfl3+6GFQfoNnEMpEKKOWZIUTAgSG+enhUqnZXbJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqA18vdS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PAC9il017430
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m4djSLZXtAvXlpgvFemWia+EmnebRJaAYcpun5RmN1I=; b=jqA18vdS63rgkH/K
	9+QNA3ax73bNrzpf2zfelbtIBPv4o2/DH89fghA6RWHiuJU8cfIM9dyshIvvTnrJ
	jn6EYeC1f0eXlgPmx87Qg1xdMvc4gqciVdiAe7In+xzeeoRK4n06NJZZycesxz5+
	tNeGsPb7julQXchhf+ha9QcGFdXvfLFqRClCEgVTCMKOyKZZllXLCpOgKNvZLEqW
	KU2kbYpMkW0TczT4mz63TY5PzV/U2AUYh6+3hsfkUXLOIbh7gHZGN7pt2o4fRoit
	bMOCdXa/TitRujTI3m+dwRzoPrxaXKB6Kyp0/jTmuLez0EdnyISLAIit+Psmu1xC
	s0IwuA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvk1em3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:47:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-82b15c1dca8so36158285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 05:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758804420; x=1759409220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m4djSLZXtAvXlpgvFemWia+EmnebRJaAYcpun5RmN1I=;
        b=ZFFfGexRMqglwNUiGuVHfIAfwaoGG7rNx1bvRv7/Jj8QZl/H7bru84DNgqAXGeL8RT
         LMLU4E7rO5clogNYWaPwwsDwbT0f53JB0Py8GMxvq8J1oLpwVMnckWf3UCYpN+3+I4jC
         LbKU9TI95+m14ufpidhCjnJ9Mz84GRf8Z432/9VWTeIRoU3orGnv1Ed29LbnbZHYdFUQ
         O1SCYE7UMp58GNoD14RZ3qBgRe2QrzFl26zWQB0NrAwXVs+QyiNyL0ZSAH/N9skWCkkL
         6tz5kghb8qfC3GD5LwKkd0tBAyxa2TScUzYd8tO2OGiYnPd1fO+8SL4a4QZ5uKAP3vim
         lYhw==
X-Gm-Message-State: AOJu0YyTncpLyGwRpZfFp8C+KFkHooOxZdR1K3znhdac9BGi8xYWugep
	HXPxoD2iIwG9SOsqMLdveZGYhHCrV5TARcIwpnf68CmP2DfrS6DUNSuFvr/x3Ryr95f+SF0X2p3
	KYDO9IRMtEInyjJbYtkt/HGq5yp2aw2znrzMxNLsykBbuXRBpfSzZ5KC3EGz2NrcZHcVy
X-Gm-Gg: ASbGncuQigu3o9qx3KvbTueW1AnStfYpShdIAjfTlrWphHBGAUgFG9lpy+OtntGf2hL
	e+aQL+hiFfxpGVj5zxhe8udwxKqFWQwAKXLrxadmrvIMsUCIrVLTVoGzUeuG3IWWh5gz1SOh1d9
	Yui9eckYmcMHTcQHLfIleaYk8ryZlJA3ZrY3F0c+iry+hYznO1n0k44Ld7Ufce6Ed5B3Yupx+on
	EnYiZkeZqBph2EEOnW+IqQEZSfQqU8ZsxqhofTX5BJS5witpbd7UCU/Qm5sFL8bBCb0uLUVkEbE
	pFTOKEcMRy6RBVu0hpxoHCRjFUL0LYNx3gNs6yIhO3CfuLHvy+K3HIFY7gGZbA98xJs3Gb0TzH7
	l3DSQioCrpFkpoWo1r4l1DQ==
X-Received: by 2002:a05:620a:1727:b0:84d:f048:d795 with SMTP id af79cd13be357-85ae0dc2b92mr287455385a.5.1758804420217;
        Thu, 25 Sep 2025 05:47:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFb6/eSVSPaLmQN76rHLSNw8JAIbpMfof7DPaUmUXWN6Zyw726mb2YnBoPc4+zEUrPWqel5g==
X-Received: by 2002:a05:620a:1727:b0:84d:f048:d795 with SMTP id af79cd13be357-85ae0dc2b92mr287452085a.5.1758804419583;
        Thu, 25 Sep 2025 05:46:59 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353efa4c35sm160873566b.26.2025.09.25.05.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 05:46:59 -0700 (PDT)
Message-ID: <25deb71e-f3dd-4766-b520-07ae72055e99@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 14:46:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] clk: qcom: clk-alpha-pll: Add support for controlling
 Rivian PLL
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
 <20250924-knp-clk-v1-9-29b02b818782@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-knp-clk-v1-9-29b02b818782@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XpofCkE9rHroYu1AjrSU8QN1y7aoGUi3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX8FjHxN87T7L8
 iYTds90AB6EWjsaXvu+rpVHaeFLVvV50pRukJZb0/CS5n2cGX0ULUZQLdfGSS/xgdUseETFfLgu
 uMl7RmQQYbkLqDfziJKzM4nekfuZzyJLWh74vnbbe27TQ+uDL4y0rLbFe2sX1fXccuTPOheKXxK
 s5SQAsdtpfEMt4n8Owyponmf96ym7E/rVYQ90X/DRXF3piMSLQEN8VfAmEgtdBw7h9+b52v3hHa
 RIkvNXcA9mK689HGSjEB7OiVzy3UZsKp18zN81so7lSVIAnAhsg5lJEnFQKrIHrJlOSkVSJylxE
 jCjCcMiEFA4069E//zjpKPCoEUYoXKfKHGEHpj5bvI013mYARqFCXYFhWfjWEAR617XFncSuFkD
 q8DgglUU
X-Proofpoint-GUID: XpofCkE9rHroYu1AjrSU8QN1y7aoGUi3
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d539c5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=4MofXZx8MfQD9CL7cgkA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

On 9/25/25 12:59 AM, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add clock ops for Rivian ELU and EKO_T PLLs, add the register offsets
> for the Rivian ELU PLL. Since ELU and EKO_T shared the same offsets and
> PLL ops, reuse the Rivian EKO_T enum.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

