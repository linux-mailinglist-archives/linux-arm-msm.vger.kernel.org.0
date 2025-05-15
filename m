Return-Path: <linux-arm-msm+bounces-58082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC850AB8B26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF25D17C10D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 15:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF00F21A42F;
	Thu, 15 May 2025 15:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWa4vlyv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53655219A9B
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323739; cv=none; b=d85gq6N7w2idOY9ZnayQVAqeWe/PDeRWS/eGMFaD5IV3/ASNvOyv4t1lDsRfR0LhktwWh/lL2jKAESOI7HFW11r/nRj9wiKCHDZ7A07L6Y7DjeYmZeVKnFntlkIwDMKTZEp8ZDYxgYVnIy8Fbn1HzDi6ITtrlTBHVPlnT9UI1Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323739; c=relaxed/simple;
	bh=HuDMhaU0RATL/TD57a38UuSJoa/rxM9NgiPso9Ov6Es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NX2mQlsYTtR9xKOYDT9MZHhBWkBIhvY4pdPr2NNncD+7Vlxc3IYipaCVdwEc9ECMFLpy3SryQJ3mK25AbtvmrdnqFzqRlCHVlqVektQ0buBY91Jx2yesCzNFZMAEx4/SgkzlaJgrwuvUZPCj2Xfu4cesO095AV3e1Znkm9U+0Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWa4vlyv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFEjD009131
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uhRouZS0uvAg73VXrnNZeOxAr2zt9QiKx0m+FD9Zv8w=; b=lWa4vlyvnSPQQmqa
	7j46ZEv/0SyU1wEOkQQiNsDI4q9s+OiavzmxmsyMvL2eDdvAGc43N4JC55229SRe
	47117yV5PyO7xGUtWIyseVTVXCFo5FWruiZA3Qm9ZZBvp2Kf/yKqnGdgDV5ZFsed
	8gkkodiRVqBwcJhLHfH1JW/ldydFhRyYFDQF5PlYrNJojQQDNhm0S4RHi90HVF7+
	qEOtG/+8jXxc2FMAmp5FiUQzIURlKn/+gpHOWM5IfMMoFOmTLIbsVl2Hqdcw3SQ+
	mxf0p3dgVJnsCqOpZ9yhqeZHUdmXb/Hv2N1OInQMRatyuBChYvrileBjq0WqMBHz
	pvzj2g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex6pf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:42:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8aab0a94cso1376026d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323734; x=1747928534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uhRouZS0uvAg73VXrnNZeOxAr2zt9QiKx0m+FD9Zv8w=;
        b=acSkaLzgzswEZGsM+x9l1iATKk9vUGPegMUcv04rnRVJXc45I2QgTuEi3DOnKJeS7f
         8V9PEEQ98aBafHZiGAk4K3kElr8/ZcnovAmF5swjD/8AZ1lNrZ1vT94piNGoE/c4yVCY
         /wtXZV8X6Pl+Kbv4QHV/+bzH2gpXhgfrwnL7ASfSNXVzMmdWO1wAgPcJsCyKH+QVJfN+
         oU90dBXyC8Obm71uqid04A3d+UkBo1C7txI2Xjo9OCD3XvfaDHghOGBIKkNG8KQCDf1a
         2JhZdtbXXOSWhva3dCr9j+JVaVFD1h27rnj7+kR3ixMvgR59j1znNjHbTyNOTH2vrRlZ
         sNTw==
X-Forwarded-Encrypted: i=1; AJvYcCUNKRe3Ba17C/IicIHCwc/FXTCXxhuHCmqXgBtDmhUinBxULGWX2HxQfLFS2qhoW8metdA7y8iF+OqcNjxU@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmid/Yvjk1ZyetAdUuRctjB6L8S9BDO1df+e+++/orGzY6h0i6
	rDI6cN0nE1/929aXiBFYpt/+lmbqDvXuDSg+jFXrmJ4z6sWf05C3uKfFXLiXHHEUPkXoCPAFH8F
	E9nFV79WZSkuJQr5xRNLii9vkoUd/fSllYmu9qI8XjduGd6cc79dcbe9SlbMvoU8PEVTq
X-Gm-Gg: ASbGncs+eTkNzTr8u8NrhjteBX5A01r2R32st1XJNt5sMN9ub5eE9nuQX66PEeIhgGP
	rjngqG4tQcNNWRhDOMAQQGZEwudRwNAhm6vioYdWNVsXA43KVtt0O7gjYAl/oKWS6rzs0kogmNR
	1tCY3e4mikehtdLMP2F9JgLPUNMbsM/XBX2fL686rKAiySp8zPEQm7QJK2ugZnotOW3i3LGXqYq
	8QJInd8iccGDlT2vIF5WvyYW8kqkNrPSvr3sjT7pt/axSD7sMCJakd/3K/uFLQz/T9VwLM3ko5+
	qwWtXAgmNnkSKZ1sIL0b6w/bQnMLSrrkC6NWthLHVBlq7zS38zGyhdLwAqD92gR4Lg==
X-Received: by 2002:ad4:5c6b:0:b0:6f4:c307:5e3d with SMTP id 6a1803df08f44-6f8b06f0c57mr1592316d6.0.1747323733814;
        Thu, 15 May 2025 08:42:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfvUSwb5Jv+bvNmLGRlaYTg/YTUTg0whxG7ImoPz57t5jBTuwWR5hdCmSnWAgzP4lkq4fbRg==
X-Received: by 2002:ad4:5c6b:0:b0:6f4:c307:5e3d with SMTP id 6a1803df08f44-6f8b06f0c57mr1591996d6.0.1747323733310;
        Thu, 15 May 2025 08:42:13 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d442069sm5528366b.103.2025.05.15.08.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:42:12 -0700 (PDT)
Message-ID: <62964e6f-3b09-427c-a71e-58aab3e22e42@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:42:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/18] clk: qcom: camcc-x1e80100: Move PLL & clk
 configuration to really probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-12-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-12-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NiBTYWx0ZWRfX2UrKGkqAk2kb
 CtdqUFRr25F0qZZVdcFICTWrjToRf/84wvVfQKBhJpnqSmldtmXLJf2ehuT+YckWVqQiU8WjVcN
 J4/MeiAYEPyPzFeeSdnBAPwCR+0VC4bmc/dYdqI46HeOMY54eqraA1KoYTH4grhEv9W882ehmp3
 9bsfc3LQQOCZgTeW4Jca+PbjDnCGyi+RV13NlTwVsTbqdptaFjO4HI1zVx6q8MAJsDALy+y06iN
 4AtaruEoD/187CYpHRid3UcfwkHsxsZNeyxFpBOMSrMTQsGOj37PM1W8l8Cwxa2BfBUM5SCdk+v
 K3Wiask1QWo1t7v+hCj3FkRPVZur77NPh8OlyGzR4FrLkf/Pp3trKvAVT7Y89UiAIHVDV9HvaDQ
 cV++Yx0mQLEZ0mNnKo5/dDVickSwJjJ0rEol8LiXXiY86RU17F3/qtVXH5NDArn5Wq1n3vuA
X-Proofpoint-ORIG-GUID: r7Q7Nrcwk-Fja5PHqwL5wk7k9Q8iIznj
X-Proofpoint-GUID: r7Q7Nrcwk-Fja5PHqwL5wk7k9Q8iIznj
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=68260b57 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=R-MJ-YjwOO2PQHfhffwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150156

On 5/14/25 9:08 PM, Jagadeesh Kona wrote:
> Camera PLLs on X1E80100 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management,
> PLL configuration and enabling critical clocks to qcom_cc_really_probe()
> which ensures all required power domains are in enabled state before
> configuring the PLLs or enabling the clocks.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # Dell Inspiron
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

