Return-Path: <linux-arm-msm+bounces-55101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F666A98584
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 11:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74E11443A5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4C3190472;
	Wed, 23 Apr 2025 09:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgnmXYJS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E618025C831
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 09:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745400623; cv=none; b=OQ9DRkUGEMKErcgzKZVfYSGkwAJJC1/RGyXiLXfDUob96igUK65KP9Bdk3HBx/zv/hBvGiZFeMNRW8inHihEcGN5o+hagAK952lgkRhYZHFwc+no1vOB25g13lKhLJChUNfh5G6bCsiZIEhEXlqy6AoW+LkRxTchSuTVRrh7CB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745400623; c=relaxed/simple;
	bh=KhFXpabGbKqNKN4jEUG3Gsr5KqeWcLFALNi2Exu7Wds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X7qawknhnP/i7YAPsiz9s3Niv1KQS6sQsjXjYFIABotVrv60Fyo7oZu+6VCXymzeirTaqGSXd2/DJcIsZGKviRsf9R9i2NnRQsIbD1nQKFl9yrSZ9q1XXJp7LGxErwUIb2wGLuDDx2uLePXChPkSXQGkglQ8opiOALqcFF68+1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgnmXYJS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i8QO003039
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 09:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g2RfEZO7YG6Zogn9SRD/U/qedhxSt7eBAmsr8vFvW5k=; b=QgnmXYJSKwgcFXRp
	LhBCvmJXZ5d7xPDhYd+3oF5I3LJ8aKjEDbeCLieplaaETwY9tftj0IAY8p6fWVEB
	4g8LJNoEHNwhk8/pszTNS2l4TZhPwYzgmgDydUoaCbo5ca6zlgELuJlcGbYlq/ID
	ouR+/py33AXNb/mdGqNPkF6Tyt9NfT2B8Tm+UCpv3lCsVwDXisixz6lCynkgUSwF
	uDBiqVbD7b7ITh8XfETbgYmOO8FtHQnKKhczf1ukBu8YUxAf2Zl7mjH+EftPAZuz
	dZ5+b/ZNHYT12jl/0Go3G75SP+lKOIRGPg1TsgWwyDfq7XGYWq+KrSRhY7hVreWL
	ro8QaA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy1m1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 09:30:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4768b27fef3so9301301cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 02:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745400620; x=1746005420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2RfEZO7YG6Zogn9SRD/U/qedhxSt7eBAmsr8vFvW5k=;
        b=GZd2/DCdny2p436p/RHsvqAzeybHrQQzRoWAdQHer00ft1T7zNk5hn+YutEPW5HuAG
         kv2ll5p6h7uS9xhOmD5pXnegAxSzOm3gv2Irz7zEwVbeFM747SmVjrx/51CKkq77I5Os
         fDTS0X73QQz5SD1SihvZW39Ql44QXONcj5FUadgXdRRf1wgUDq4RJH1QkXkyN1cB8H/k
         9VK5YbQ52KCqeDcFVj+yGyXuA/e6NDUsBlpu9ggL+mclQGkzTz1g7pXJZegnQfeR+YqI
         TNJeElvCFyox9JmZH4KJSFqRhPqS2GS04Ea0/WrKV2e3cYV1gETdWj7rriSZLwghu4Pe
         IpdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUlNZLqOs8vMA+dpDHkbkHXngBMFemLxV7pqOo0QJlQpg9/2oNLeYabXQWw8n8x13bZH4MYdvVgId4K7Yj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2QFdpOeO9K1hG1pg6pS/Tby1/ac0Hi+wqGBPhYEAa5uKzVfsS
	X9A4kHMTcfSFjd0XDl7WPdUpjUYdcq9DbY14J6P5RHZyj5v4sYudCGviq4Iyd1OomgVb/Jz/PgM
	V4j/cv4/Yv3WtJOXDIpcpYfz+FuLYjyQZSmg0TmBIKpFl877rXpWYrfUi9qvQLmBh
X-Gm-Gg: ASbGncul6hAPGlMkbbfb/NkEUCLJN+GFVegW49ZTQOTYfaBZRUNY+ac9FElwGFEu0t3
	9+MzaNDmynKrgTwN5/UyOyqbcSXa+cxr4joSFBv2id9lMcngEZIpBI0fOLPA5XvfzMwJKUxmrlc
	sc+fiz8ad3a+FIPlHrJ64/P/udlH1PClshLhfRR8l2mJYud7tl7VaHmixumSTG/I6GR7s7irePd
	v5Arr7xwPPzB8FjlUCOPIXL3//oqQ+XXu8sc8scld2HzTrMU1DvudxttotP9vYifwTZHr4pn6kX
	DjfqkbjgZh3Jkfo89zqDLHoMydWx+8FNBNnCbL8GQ8sQOyR/RjEzreTBF98UU9Ah7Cw=
X-Received: by 2002:a05:622a:8e:b0:476:ad95:c08 with SMTP id d75a77b69052e-47d1be7947cmr13214311cf.5.1745400619905;
        Wed, 23 Apr 2025 02:30:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5vFPCb0l6vMoBMz9fXqDHwfp0G7G6fbQNsGjj/FVClyK0wqBPS0xHQBBimDr76TPecV1jSQ==
X-Received: by 2002:a05:622a:8e:b0:476:ad95:c08 with SMTP id d75a77b69052e-47d1be7947cmr13214091cf.5.1745400619353;
        Wed, 23 Apr 2025 02:30:19 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f62557a151sm7209483a12.32.2025.04.23.02.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 02:30:18 -0700 (PDT)
Message-ID: <b8bde418-450a-42ce-8d39-098d5c10e2a4@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 11:30:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: qcs615: Add IMEM and PIL info
 region
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
 <20250423-add_qcs615_remoteproc_support-v1-4-a94fe8799f14@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250423-add_qcs615_remoteproc_support-v1-4-a94fe8799f14@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA2NCBTYWx0ZWRfX7QQoQDHbWdS1 rfxk1DCEu6r2NuLG7XTCaaDBCvwtyjx0CbMYwvvetwQtZ0emQCSjXU6II5RcSfcg90B+n6j5tQy LEwZxQjfYvfvycaRoo/ZBmIqNnat1MIVncHVyaf+zNch8etf7IgL7p04B6KJ3QahvpVxS3JDnn4
 wbVNkepRNf+wGMd6UllLDeb/nHn8O6D5KBYPC62N80g+Clm68tyLmcnksJq6x+Rz7BWEfMt0pIp 6sLQGXQPMVmd6BBG9cJi9ywzayCpoWpVAtQk4s7LtsPpTb/J/TTz127/XgsP1Z9WcDyGbAx9n0M mXmGI/arAQvB2wJXDtJiR9G/ajsLeCYh0WKUu7rQTki0xx805VETs/hn3z8dOUZcYsxtXXHJzc7
 OlAMct2IqtvAfpDZxDukkYdzU5aiwwMfBIbq9rkBJXqTnS5ERQ6D9Z3s3wla/cUEr6xdZxCr
X-Proofpoint-GUID: oO4wLiki_k_9xDFg7d_hKprjia_381ld
X-Proofpoint-ORIG-GUID: oO4wLiki_k_9xDFg7d_hKprjia_381ld
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=6808b32c cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=SE4aMjCliAL7rhkqCSYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_06,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=800 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230064

On 4/23/25 11:17 AM, Lijuan Gao wrote:
> Add a simple-mfd representing IMEM on QCS615 and define the PIL
> relocation info region, so that post mortem tools will be able
> to locate the loaded remoteprocs.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index ab3c6ba5842b..fe9fda6b71c4 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -3297,6 +3297,20 @@ sram@c3f0000 {
>  			reg = <0x0 0x0c3f0000 0x0 0x400>;
>  		};
>  
> +		sram@146aa000 {
> +			compatible = "qcom,qcs615-imem", "syscon", "simple-mfd";
> +			reg = <0x0 0x146aa000 0x0 0x1000>;
> +			ranges = <0 0 0x146aa000 0x1000>;

IMEM is a lot bigger than what you describe here

Konrad

