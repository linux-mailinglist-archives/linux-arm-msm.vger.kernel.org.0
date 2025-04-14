Return-Path: <linux-arm-msm+bounces-54223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC14A87E64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 13:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AB4B3B62D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 11:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6CE2836B6;
	Mon, 14 Apr 2025 11:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QGvGnCCZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743F0283688
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 11:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744628780; cv=none; b=BZ0Z26S+NEqP1pwLlbvl/RRrfVH3aGkucPKmrzOFTXUPqxlAAbGy2cUhHyh3rSYPlH6zpR4b7VYp78Kk+kjLGToDG0Aek3OySBws4m01/LwAXYTgu15UOcrR5xw54TxkrHks7QdqWCrWDBc2kB+ZOvPefIP9A+d7qxnGQRuDNVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744628780; c=relaxed/simple;
	bh=URdKJ+AHNs6o/wAhmfdWR0l7K/ZgHKo6BnkRCORidBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p1xi1tdCGUOCFaVhQRmMAKYfwnS0TnVqtwOJzJ5HdYLv+3rQh+Pixf8sOYXft10x6RVito3tK1SDxxUaQBPO54NwfmqVR+P1L+C2Ph01m4ow3UCCVl46U/vqip7ikesMKPegtqSepTGuCm9sfefgZr7XoDj9kQjKoyRHOS6XnRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QGvGnCCZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99pCq016522
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 11:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VxpkeVTjvSpC0qaVooqmK/6bG6NaYWsjnRhT9FXlX+0=; b=QGvGnCCZWTme7asV
	3lR22BsNcwiWfQSUcAGJ9fglCC127MVH+qlTxaZ3jVKh267k8VYQPQEsGmRi7JZy
	m48e93L4X2TDLM19IOpi7jnYyDpjHXXVV3Gh0HflrOzzDVSxIDBaAZ5Bvjfq0z5N
	H1CDbuZ3eNBis4LqvFSqsSb4Sa2XoakV74uIC7eEmCsUO760opeIMc8wcRbYmq+T
	L/I5+jFKhtokse4EbfNLzBi177J3/O9p8WwgHeulJv+jy7bqhx0ikh75Nx/A0/27
	6C/mC1r0sCzqFWZdj3EKc8qhItCIYWaFRX/iPg5+nucfx394ezLvxnTOsXXy5aC/
	g9HMDw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69mbyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 11:06:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476695e930bso7789061cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 04:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744628776; x=1745233576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VxpkeVTjvSpC0qaVooqmK/6bG6NaYWsjnRhT9FXlX+0=;
        b=DTIzSMR2YzEHOgiowx2Ja4POFUffhbqhMRvxNENVBU08V4itOto1bIxkom8Jc/8GpG
         l/OW05MeOgKVlrqBnrhI0oijZ2bZDTmzMoALiEaXOIXzw5WRQ16s/x6Yl2PQwFvzbl2q
         N2pzrDbmUxMawoq3ZBavhWozGhbj2uF7x4LxY9spAYvez1G/E9iBPqw9LM75yBBJVIXo
         nxxennuuDvzl0N06tc9T5WNz9D8jHN6+kEqo/iVABf2R85oIN6gPqVPKZoOx+5+r9M0/
         fOY474BzBfDhT3ykcrScP5ysAr4NEY0/PUCVOJ59XN8F08Cu0So+bjVq5sIyO5171W5/
         gksw==
X-Forwarded-Encrypted: i=1; AJvYcCVkgGQLsTtt73WKt3VM7amlGZs7E1mofUE8yFH9ZYrBfO/1tN25ehebdaONcpwfWdZulYwKsdaFtqf5+eQ4@vger.kernel.org
X-Gm-Message-State: AOJu0YwATwPCZhjFAXL1oJ/fIJnWmnp+PBGSl1ScwpmOnG2btTilKKRr
	2quBUVnJJULvfKNKxWiqM1JEhULX2GqfDTVW/xqvI6uz/u5morDu7/WM+jFGhURIHWXhr7pDBP/
	i/6x+pAPYLKpjPHemAjnvrzm3E0Wh8Yuqh7RoFTK+IbAY2xmDMNARvDSh7HE9D0Qg
X-Gm-Gg: ASbGnct9YQWXt437Z2zFtJAyvbb6dGzZtx/U6qAvCnXMHk6+r2jGJZiSBYA6N6v7Dk5
	76AuNAwL2fZKfYa1b8hSA68kFRYZK+JjgunQA/mpJWfquPGhSpfw7VDG0vQjJqdjWhvmyHQsAVn
	KROdqMV1QFySmpQkakFztkYYYmmIHxyymGbz1Txm9M6cKScHF3+v/18CSkHCDDHlMZa8PVnMAJt
	j/WyZvjNuIpfYq5FhYku+33HJaIeprlvpDQ1WEB1O7S/53bjd/z0VJPLYnjJPVG85f7GSeggeW6
	B6IEM04iqLz4P1ivTxAG2Al153rvb7emf0TuR1CfjMiFxEiq4r1QtrmF2zLcBR+JtQ==
X-Received: by 2002:ac8:7d4d:0:b0:471:ea1a:d9e with SMTP id d75a77b69052e-479775c6474mr62864341cf.12.1744628776075;
        Mon, 14 Apr 2025 04:06:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKg1HoTgoelWtefrvI1IMbW0zWLG6Um1L9X1eshjTv4UMsryHztkYh5L1iMKx+xZ+eqyqURw==
X-Received: by 2002:ac8:7d4d:0:b0:471:ea1a:d9e with SMTP id d75a77b69052e-479775c6474mr62864151cf.12.1744628775572;
        Mon, 14 Apr 2025 04:06:15 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f068f09sm4675948a12.36.2025.04.14.04.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 04:06:15 -0700 (PDT)
Message-ID: <ce00f7e3-86a1-4fdd-9274-c1a9896c0f12@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 13:06:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs8300: Add cpufreq scaling node
To: Imran Shaik <quic_imrashai@quicinc.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das
 <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250313-qcs8300-cpufreq-scaling-v1-0-d4cd3bd9c018@quicinc.com>
 <20250313-qcs8300-cpufreq-scaling-v1-2-d4cd3bd9c018@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250313-qcs8300-cpufreq-scaling-v1-2-d4cd3bd9c018@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JyYa0ckiPJPrc-DQqzZDC2hJGXVFrYhV
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67fcec29 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Iaa4RHEoZgGHmfRl8fQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: JyYa0ckiPJPrc-DQqzZDC2hJGXVFrYhV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=858 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140081

On 3/13/25 7:03 AM, Imran Shaik wrote:
> Add cpufreq-hw node to support cpufreq scaling on QCS8300.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---

[...]

> +		cpufreq_hw: cpufreq@18591000 {
> +			compatible = "qcom,qcs8300-cpufreq-epss", "qcom,cpufreq-epss";
> +			reg = <0x0 0x18591000 0x0 0x1000>,
> +			      <0x0 0x18594000 0x0 0x1000>,
> +			      <0x0 0x18593000 0x0 0x1000>;
> +			reg-names = "freq-domain0", "freq-domain1", "freq-domain2";

Please turn these into vertical lists> +
> +			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dcvsh-irq-0", "dcvsh-irq-1", "dcvsh-irq-2";

Since these labels don't match the hardware anyway, please sort them by address

Konrad

> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
> +			clock-names = "xo", "alternate";
> +
> +			#freq-domain-cells = <1>;
> +		};
> +
>  		remoteproc_gpdsp: remoteproc@20c00000 {
>  			compatible = "qcom,qcs8300-gpdsp-pas", "qcom,sa8775p-gpdsp0-pas";
>  			reg = <0x0 0x20c00000 0x0 0x10000>;
> 

