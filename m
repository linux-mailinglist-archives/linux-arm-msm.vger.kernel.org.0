Return-Path: <linux-arm-msm+bounces-58188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FAEAB9930
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 11:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EA1E1BC4778
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 09:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C621FFC59;
	Fri, 16 May 2025 09:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lfJPf49d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B197E22DFA5
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 09:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747388711; cv=none; b=cGjqHr2DOEsclEuqVlwnJLJ0N1bH0dJvL2ylo8aDGbpsmkDKRKgeGuxVpgnzN2K/vkCymxzjak3FFX+DeZn0cXcHwtLe2uO6hZ1SdLuAfYbgO+AFxBtaF2wpli3CDGJd9HdwvnB/sYA92qyZgG0cGRy66SLnZ2eW//74NVcblVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747388711; c=relaxed/simple;
	bh=HzsJEBiPWk6eDqzxwMfoGQye5xmzJYeJbdlBljOdl/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LwTa3jtlCyb3hU9A2Ht9R42heacCpr+XVRiZAFqS6HUwP3MX1jchMAdcHxlj5H4PmiSZxvFKm5lBjCTvrnoYBI3HwDte2HalPqiUEDMXrGiy46jkJ2qPpe4QVCGHv7xUyl7J9f4TYqO5SUQbhia37NWRQJGhkKe31Vb9cCsVbYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lfJPf49d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G3Wmh1021314
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 09:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LDr4B1qSjg7htBqhVvqZsGzbBvRV/mFJiETbhY1xHpE=; b=lfJPf49d1DxmhEWS
	LZJ7IQPMhbQ16lyV+EJjNmmffXafF32XfqSTf5vvDnXjsnas/GCa3KRv5tFE3kKv
	TmpzvmSaDw9wyQ/VZ/It7wmk6Jup3WK0cE5wDPNmO/dUXsHAMHI6iMamb+1nWE60
	BCI5RyNrcwTsRbBhqSlPeJLvtSjMVKgfcCyJX66ZpUGd83AtIrRtwe/EckTS7ijm
	Hoqam4ndvtYS47qvK+Q4n14rZcrlB+mqUEFxBzHrtuu64veQAAta4u0HsHmEadnv
	0Ikm3/kgTI3AOJDWQ0XMGo/Uwqva3MBw3572du0aBHhGl1iLZLyD7v18R0TK46sx
	WPWQcw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew9bjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 09:45:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f6e697a894so2338256d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 02:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747388707; x=1747993507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LDr4B1qSjg7htBqhVvqZsGzbBvRV/mFJiETbhY1xHpE=;
        b=Bc5vjfk8hXiBHwgOmyilYvkCAghGIBAy9CH/evXs6+d5ESdyS3dIb6GijTVuu5DUki
         4j/1f2UEtPZqCnsQIHp6tvk7l0Z+QfvRlrHiC0y3P2myPnLjETvCCJTY6ePCDLyWlp3/
         wXX+KFPdcETT29XENZ6FIJldclwQGDlQaZNDn2jTLYf8L5Zv4t9eZ7DXLh8lqCWptsAm
         NQn/KLwqBTqegBJ25ULBVmP8IGoLrOtxMTTa6HYV2qB1M19rdU6HZUsi6QloacbCKjrD
         eLeq+pfy0S7INam8grrwXy7IVeS5pm65ZG7ovMmCjFn/Nwpxl9nWz28odxZ6PGYmcz26
         I2Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXEjJS09TIa+w1K0Qc02XHa3pu3WNz6Tk3+ft17DQzqulx68FcNiA+iYF0fcftYgF6/Q00OFagypO+K1bJA@vger.kernel.org
X-Gm-Message-State: AOJu0YwiQ8FRcw21dFeup1eSq2HBCMqaLk2l6UkedJcwLgBhFh0nm4Qi
	eRwhPG3DBhJ+jdHHkQiDt8P3xXvRuHJENjpNYC3PM/751TmQC7f/mtzf/1W3cg0Tz9gHX1jk7Jx
	pRi+HVcnVtk1pdNSp5yWPK0MviFcLKrln45xY1RVcQFq2cYrdlaIgO2uCZt1ugxhFdJWC
X-Gm-Gg: ASbGncv+vg6V5LdoTWXCkz6ohrhwb4li1gStznBXeJdwhxJQRgOhzUNKmXsIZjTa16e
	wSj6J1dzD3X8VZuUszjHlypipaW7Lrc+T2frZ1x7tt4vP1bkaihyABUpC7eg+4wdoCLDWQkDsdS
	aSrYCO5BJKwbCyEXcIjMtF1vApYKT56PJ8dOK80pr4zLnFjLXA4HmxNiM4SoWg5Kqeo3A9nKRiQ
	MmJdrTGIfidqd0vrLGgRBpamyK+/PyLqtaUp1FBmR6xjpwlxVQbFaNRGaZQmk+hG3mlfcGuXQzD
	Z/b+InZBr0Rt0AQeutiBdskIdhImdB71JHHOm7XHCXRN8BlUgHea37t2MSy0KMZ1dQ==
X-Received: by 2002:a05:6214:1c09:b0:6f2:c10b:db04 with SMTP id 6a1803df08f44-6f8b0835130mr18906336d6.1.1747388707498;
        Fri, 16 May 2025 02:45:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGukMfVX+YRjpGaoj2TadFrM/2CD6zQuISXBA2V8u8zEJ5cpewzlRZSW1tBbMSTsJkqcx5YSA==
X-Received: by 2002:a05:6214:1c09:b0:6f2:c10b:db04 with SMTP id 6a1803df08f44-6f8b0835130mr18906246d6.1.1747388707101;
        Fri, 16 May 2025 02:45:07 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06eab7sm127556766b.58.2025.05.16.02.45.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 02:45:06 -0700 (PDT)
Message-ID: <0097b07c-3a58-4b28-abca-3e6de70ecf25@oss.qualcomm.com>
Date: Fri, 16 May 2025 11:45:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: qcs615: Add IMEM and PIL info
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
References: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
 <20250516-add_qcs615_remoteproc_support-v3-4-ad12ceeafdd0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250516-add_qcs615_remoteproc_support-v3-4-ad12ceeafdd0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7fWG1OWJ4b4nHW6no5lR5tt3OLEHVsf0
X-Proofpoint-ORIG-GUID: 7fWG1OWJ4b4nHW6no5lR5tt3OLEHVsf0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA5MSBTYWx0ZWRfX2CpkV3VXJIBT
 v4lryIm8CuOENOQkfPYCFyyerEe6o2aZUFSuFIzHIzMrJ2bYiApG4lSQ7qUf7U+Robhg/lXNaqa
 X1NAvy9NnMAOYujrrvMzIA9AkVdnv43JU+6O6lM3S/OCWBFc8Z1m06/osBw2fcacPEBcX11In+A
 GBYY5NP5U8Y7EAoV9XK8OoaG6ECpOtvx+A8RBPno2PgqA3SKB++dfXyDzcu68PdxnjyOF5GQf2C
 nZOucRW4Mz1d+sCg7aLBqhMaNGapIQWKIN8ABqkK/aVuuHF1z8pLQIjqhsszm4ApU14kWk1CtwA
 roA9l56yAn8dw8POgVAv/q7Dlh5KJ+KP73Ef4W6+r1Pf6Ls+I6PlCdHvkFL5MsulQ3bRYnga301
 Q3GZzHOotnHCEsHcS9LgV8+W7JEpCzuoc4RkZzxKvYzsWzq/uu/H4wuY/LbXNaVsyTDtYQai
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=68270924 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=O_pLmbuslcfqJQTE_gUA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=898 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160091

On 5/16/25 5:27 AM, Lijuan Gao wrote:
> Add a simple-mfd representing IMEM on QCS615 and define the PIL
> relocation info region as its child. The PIL region in IMEM is used to
> communicate load addresses of remoteproc to post mortem debug tools, so
> that these tools can collect ramdumps.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index f922349758d11ec7fda1c43736a4bf290916e67f..dd54cfe7b7a6f03c1aa658ce3014d50478df5931 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -3290,6 +3290,20 @@ sram@c3f0000 {
>  			reg = <0x0 0x0c3f0000 0x0 0x400>;
>  		};
>  
> +		sram@146aa000 {

Please also update this unit address

with that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

> +			compatible = "qcom,qcs615-imem", "syscon", "simple-mfd";
> +			reg = <0x0 0x14680000 0x0 0x2c000>;
> +			ranges = <0 0 0x14680000 0x2c000>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			pil-reloc@2a94c {
> +				compatible = "qcom,pil-reloc-info";
> +				reg = <0x2a94c 0xc8>;
> +			};
> +		};
> +
>  		apps_smmu: iommu@15000000 {
>  			compatible = "qcom,qcs615-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>  			reg = <0x0 0x15000000 0x0 0x80000>;
> 

