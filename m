Return-Path: <linux-arm-msm+bounces-73311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AECB54AB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 13:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 838BF1775A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 11:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0280A2FF142;
	Fri, 12 Sep 2025 11:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZ8d9YlT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0010C2FF15E
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757675301; cv=none; b=HSQNKTBRD3zGv9YPF2bTzYN8BSPs/P6V6wznDS9Z1N8GH1oIExHLjkcezJ8zHNkQu+k3KZ73NemMpCmNxxb5gk563idh0H1xXvqEWchZI1Mx/3Y2Ht3L/vAeKSRX6jDcFD+up8MjTkbopVemS+5GyinCPqV5WkLaa9dwya3FQB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757675301; c=relaxed/simple;
	bh=SdMLcvVYFfT8vLpy1kmVurQSEeQL47wxS31jcgfF/pI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EiUCspAqZqAkv6Jud2jfHTkliVVoULcNuT3LEggoup49966F+YI4/G5+dtEhcv+rGAEp3jdE/YkT47ExB1GeQ9PglqXPn/R9IQNuMbgTY2zX9sPoC7ml+4FniFk9K9HeBVOi1Est3lspbzzv7HzWvBr59/Mx2APOgjJyWJy5kKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZ8d9YlT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fD4F017429
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uokk/WWg6coArADdOgc7mvwj7p78n+lj8V4PK0/8Pc4=; b=ZZ8d9YlTOOStIca8
	NM5xJlgS34cKzY8iFqmNHBzCpqgK3kO9FoIteJeIwXRKlUb4Y5eD/D3V5FIwMB+K
	ymjRCNqfjf+KBe8ZydDlVbq1n0zPQo3vu1vPcCSo1HPbVE0tsqayPaIRA/HKAuIB
	z4slbvYJsmQ2DNMsJ2rJlsvsaXfBy3eqfDAHliUuKa7uIM5ry/cx2ZyiOgYICA8P
	30cFNOcdeEteEfG/eS25So3gEJyAw/bxBS1S9q9y3N/I105ntrZqVSG5iyL5wGf+
	+Pf0hCYhzbTCZvDis7UYH8RH6dOFxLWPjpX0ZxnWmCa4muHG0/mAT1Hf4SxlW18c
	5753Lw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8ug9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:08:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-81c430ef6ccso55532385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757675297; x=1758280097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uokk/WWg6coArADdOgc7mvwj7p78n+lj8V4PK0/8Pc4=;
        b=sVhF6LqrAPHF07oqxQJ2jWBZjSKLS65kEeiYWn32qeduE3x7kSsw9QMnGngig1t47F
         EyA4F/mMIW7toL2a7IWuFXf96MxCmRUly67sw2Nrf/uUzvEYvKWHveLQRo4i09EWc9aI
         atfZtzX+726Vqu+eYTBOQPA5LmEYB8P73qpGVir817RXnTVihe7ks07WJU7nrbjWTl7F
         uCnTPZPLqZFYDBi04mkIL7giRuXtvadxP1nbqsXNsO/7TGQ4YaUcDVomhiPk6Rlylx0J
         KEFndQ/XbyamBi2X9gWWbRVCFE3HPgHCc8uIEuDJuI0NIp76sLFNK49RxGIlg/+FOFKY
         NrZg==
X-Forwarded-Encrypted: i=1; AJvYcCVlzdZKJAcNBMOnHZqk2FoAHJzWQI45lXDgkSV6djo/zOf2RZWd+AfpR2bdZQj1r0RFmCTQy65RDdQwqX0D@vger.kernel.org
X-Gm-Message-State: AOJu0YyVmXBQ7cln8VlxFrHhDtK9N7pUgrw6P2pmaoB2WNXfFDmL//My
	rip4F/02IXLcl9btcAMfsepwTLJVps6EwiaSgH7TnG34MD3LguRCUVrta3r3GP9KmBueT8Yvwle
	N7ZLxYBSFnCdzlRIDX3w6uz+ZDNwoI2k2sJ47sYOFAJ11kfrg+28zmdS5nhGCw9o66VVX
X-Gm-Gg: ASbGncuKlDIndYn+BbmgKkqhNDMIa5wEyLlCCSjysbGA+nU/V80TpD8QOIyDxHPauHF
	CZztxq502NgOnrr6jT6uKB6azONzb+yEZMQVi/lQovqzXWw9OrdeJ1HOOrJXPWehPCAoluK2z5c
	Gsg5dwh2oyj18RnBF4Ht9N+jlMoVKx9cIQ13CVDDIobAvzxxoIvFZCT8bskg3kT48FYNte4WlSf
	ySDDYTH0HRRzLQD6isKrrfpHSvS1V0A8tPT8Bmjyksr/K4G0PgdmRSBBKbfjWQhDvZGgir/ejyK
	VeLk/hxCkN4qFL/PJVx9hvGnJawSXmz/MpQf9NsedGZC8toZlPi6quqzt0Up1S/FrnR/KFzGQZU
	YWSWfc7TDXQ1JLzi6dQBrLw==
X-Received: by 2002:a05:622a:205:b0:4b5:eaee:1c04 with SMTP id d75a77b69052e-4b77ce87c27mr21934411cf.0.1757675297017;
        Fri, 12 Sep 2025 04:08:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4jHhw/0hyABv8RVQp3e5MRh69QWXm/R7Xr8cosuIOallnrpV/vm6x9Sn/KbICuXgxrabMlA==
X-Received: by 2002:a05:622a:205:b0:4b5:eaee:1c04 with SMTP id d75a77b69052e-4b77ce87c27mr21934001cf.0.1757675296567;
        Fri, 12 Sep 2025 04:08:16 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62eead54362sm614906a12.36.2025.09.12.04.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 04:08:16 -0700 (PDT)
Message-ID: <503e1fde-39ea-4107-947b-18b705f2bc51@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 13:08:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] clk: qcom: videocc-sm8750: Add video clock
 controller driver for SM8750
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
 <20250829-sm8750-videocc-v2-v2-3-4517a5300e41@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250829-sm8750-videocc-v2-v2-3-4517a5300e41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX6VGADbzLZ0aB
 Fxe20vkHafg2kwdsqiziK5/IEzLtB5f9tr62WdAs5F//EnP1/6+Z5UZNyLfhavmzxhdIDiGRLTO
 BNOt6UE39wwOcVo8RWO4pDMM1KQ2GKCDehSJxhRY245DQKvPPtIkjddWekQsMyc3Xcd7AF7UoIg
 Jw7p4yJvgXNmdGQBlCoftxbZnPAIYzPGJnRZSX8Svel9OV3dTXauyPxZAPV9pCZks6f6Hlvr465
 F6RfW9i9nLWpN01qUB6tSjkObfhXlsGyMzqSKEglnhZnOrDB6patagMsCoTSnkr8pTUmmiqwxvy
 H/QVmzKKrkSuh0fqa+LzzI3SptrHKgDUBHBnV8jiYlWDvd4yfnVKjZASVMkElFjnKgUdE1jNdEr
 RCn86VvP
X-Proofpoint-ORIG-GUID: TI4VK2XsOoIhkHxWJ1g_kkWPyjxxcqOG
X-Proofpoint-GUID: TI4VK2XsOoIhkHxWJ1g_kkWPyjxxcqOG
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c3ff21 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=MRVLr9g2OpiS_xmof_MA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

On 8/29/25 12:15 PM, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on SM8750 platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +static int video_cc_sm8750_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +	int ret;
> +
> +	ret = devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	regmap = qcom_cc_map(pdev, &video_cc_sm8750_desc);
> +	if (IS_ERR(regmap)) {
> +		pm_runtime_put(&pdev->dev);
> +		return PTR_ERR(regmap);
> +	}
> +
> +	clk_taycan_elu_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
> +
> +	/* Update DLY_ACCU_RED_SHIFTER_DONE to 0xF for mvs0, mvs0c */
> +	regmap_update_bits(regmap, 0x8074, 0x1e00000, 0x1e00000);

regmap_update_bits(..., GENMASK(x, y) /* full field width */, 0xf)

would be easier for the next person to check against docs in case this
needs to ever change or be validated
> +	regmap_update_bits(regmap, 0x8040, 0x1e00000, 0x1e00000);
> +
> +	regmap_update_bits(regmap, 0x9f24, BIT(0), BIT(0));

The register description mentions a ticket which I believe says this
is not necessary in production hardware

> +
> +	/*
> +	 * Keep clocks always enabled:
> +	 *	video_cc_ahb_clk
> +	 *	video_cc_sleep_clk
> +	 *	video_cc_xo_clk
> +	 */
> +	regmap_update_bits(regmap, 0x80a4, BIT(0), BIT(0));
> +	regmap_update_bits(regmap, 0x80f8, BIT(0), BIT(0));
> +	regmap_update_bits(regmap, 0x80d4, BIT(0), BIT(0));

Please use the new _desc infra

Konrad

