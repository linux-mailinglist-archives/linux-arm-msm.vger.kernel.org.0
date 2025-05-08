Return-Path: <linux-arm-msm+bounces-57272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A270AAFD66
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B32A47BB27C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 14:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF4E274FF0;
	Thu,  8 May 2025 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BZTj44Lv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FE027511B
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 14:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715230; cv=none; b=P7q9yShcFV1pucJD8+UvRPr7mB0IvUOpjZ2lmTPdUMnhZvv9M8CIR2kWLZ8cT4l0X7oc5ycotYp7EFLmyqgRUSJEq0DDaYLh6Pja7ZDoI1r5Z4wD2oOVEHkcJK9O6OV5/jVmSX9XtpPm4+dR9p+++Y7X1Mx/GYGokIELv9VZgec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715230; c=relaxed/simple;
	bh=w/IRPkoqI29om20GziWR6uLh/++CAuBf10WI0YmJ+ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G7JG8rszNBFhvCuYz2vzm5dwHW731j6VcWRsVN28LZY/YKmFiPyoOk6bN7pleF9xJnYotRCmX9cW1Nq1bX9doRQMGSxq1FaFJWhz3S1R09zQeKBKU9n7D1fl7z/mIewyUhd48hkBmP1e2QboFcnkhRLPXXRyzLFVnO+SxrJ0bHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BZTj44Lv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548D7QZ9014411
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 14:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XILZM7Gn5eaJwNn51SrBifians0biwpZ5P5rKKRfJL0=; b=BZTj44LvDUht/smb
	ldixBceDdCVkQWBtkAn0daOovnKWgqpvtfhJbe64PuLA6fJKhXR1vf/NjFZzsdtE
	/bPK3osOJj36Xa8GTQXrh0y98wYi25tP/7YolhJIStoXrjGV7bVIMeFBQloADyow
	m1Zzckm98huWiLU/Vq+UdJyssaXzh6ojOnShTAk88e0vcO4ww/+KY1v9rMz5I7+A
	7IfNtMzCwebiZrVzRylx2Fhae7ibCps9OgvswfiMrRpGRiIauPESIR5Tt4b91eW+
	oeem+sZ0X6eO5KRg6b+DGSX8HpvsRmmltlmKSQIEMnThifHCyeKlmOjQDF9O0su7
	yKMjNQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4hp1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 14:40:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5530c2e01so27076585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 07:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715227; x=1747320027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XILZM7Gn5eaJwNn51SrBifians0biwpZ5P5rKKRfJL0=;
        b=WONaAmiSiZdFHNyshK+VVihkqZqh20GHM64KqqeFkTfDmhuA9Qcz7jv+cGD7kJR422
         8vi5V47p3wcdCPbe//BUs5yH1/qObX1ASrPHC3hXVxhIUOF66cD7l3dBt2FGKPFHHCfe
         35B/+gSlqLVASt9Vm38Z4SO213jFJGfHbZN01jGK6b7ouCgllfVMpj60JVG/08vnfCRY
         /zz+CDicpq1mV55Ctb7SFvu9h1rxJxhXBT9QH4NZL/s4Lo+mrQ297UXwgga5LP1k1yk6
         OXtofqHbP/+6a3wx2ZToR4hn8pTZDV16F3vYpLu9h57LxqvGUcG24XaLwlV/MvI/j2y5
         +YaA==
X-Forwarded-Encrypted: i=1; AJvYcCUDP1PaepXQLPMjtEBxUetoQw0mbL4+b2By7sZyBEKSyWZi078nirj/JTFztyPrCos2QadoUMHngxP85zAF@vger.kernel.org
X-Gm-Message-State: AOJu0YzpIVbc3j1E6V581BJ4UuMOIqMMM55UTFi/FbgTP/I8tAeQ2LLj
	Fxaq6Lj5Y6AUzwRECEfs/M6gSlh9MbvznZgj9up2pc+mWgo54bkuYqEA1yoS3o+q2SrZ4Fz5VMr
	N+D2sRa8VfJ2eZNrJ6tutI0KpKVy6cebEkTWhkTtBZLKHM7jjS4iTCFwhkLtKRU4x
X-Gm-Gg: ASbGncuFfTNmTzxXpmSwo4M1/ffi/A6XuIhbAa+hfkXcmcXw8QcRPpX166lxUFp3thC
	6mlNyS5rT5qeZil/YWyfv4RRn/V4ds9CrYMT5AVBLPXLLEQ1tLGQTa62cXr/z1qNhbq0cZCyiBL
	70238idllbRoEKcvU8KjzPwPjoOlUJ4/BbqefVFLcV/ZQt9iyr5H8DI5g/trvOtpd4QWAL8zwj9
	C1HW3Hjp19Upb7c2QZbw+PNbxEWcpRdUPKdPjzrJzeyu0lQ/MT7Tmws1lgM8L3GVsyInOIlYwlX
	iX2DFfcGcHrcBcH2r9AO6BpwAVTVOjDP96iMSLbqBgwy0AzkCjqdcXXi8EYaaSQ1sDw=
X-Received: by 2002:a05:620a:414d:b0:7ca:d38c:5d8b with SMTP id af79cd13be357-7caf7267bf5mr402758185a.0.1746715227018;
        Thu, 08 May 2025 07:40:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT72bwxRsnCw6X+H7BXkoHxOCMnrHK7Khu5jQoHo0XXuFugh3AhL43OS8kDS21FFjGTDgXLA==
X-Received: by 2002:a05:620a:414d:b0:7ca:d38c:5d8b with SMTP id af79cd13be357-7caf7267bf5mr402756585a.0.1746715226531;
        Thu, 08 May 2025 07:40:26 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18914740esm1092006566b.31.2025.05.08.07.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:40:26 -0700 (PDT)
Message-ID: <a8a1aa0e-f53d-4a77-9199-958878563b9f@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:40:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: qcs615: Add mproc node for
 SEMP2P
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
        linux-kernel@vger.kernel.org, Kyle Deng <quic_chunkaid@quicinc.com>
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
 <20250507-add_qcs615_remoteproc_support-v2-3-52ac6cb43a39@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250507-add_qcs615_remoteproc_support-v2-3-52ac6cb43a39@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: etvpqpR08W_v_BO4LMLR8F4qk1kyTMps
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681cc25b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=NOOO9hkfg8HFgf3i-E8A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyNSBTYWx0ZWRfX6PWD3+Gygt+u
 Jzyr+G1SkLYaI+nFo9dBpZ8WRJevQ1dp/iVmGYdjnzpX0F6sIjIrDNYfhfMwxRytJ1gMwfc04Io
 GPvFK+KyO6XeFRavCHkfGGAIbZc6JpEOlMlZkxhsVBKnAFJRSJHiFR7Cm1ppzAdkwihFNwEowyR
 DL2XynWoiMp3hUnxGGJDJ2E3UAQablPDsQ1F6DxDll3I8q+XmG2P29KPHaOuxkxXuzW6xzOykyh
 wmwcHC++Q5RasBnojuhlxf3rKCkjT+WUvnhmJxAPJADMaVIsdATWzBhLnDCN2eLayUa3yPXcsej
 /cenMixi1nlQ5N+dEG+nozZvM90naTduL/ZRsa8HYlD4KruhBdCSHhw4oJrEpXbsxgZlJg141eB
 d9p7kMdg0CttGbawMlCQXWbSoX0SXGDIbubEECtW1GjYaNCC60P3woh5en804YhYZeNzCWfK
X-Proofpoint-ORIG-GUID: etvpqpR08W_v_BO4LMLR8F4qk1kyTMps
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080125

On 5/7/25 12:26 PM, Lijuan Gao wrote:
> From: Kyle Deng <quic_chunkaid@quicinc.com>
> 
> The Shared Memory Point to Point (SMP2P) protocol facilitates
> communication of a single 32-bit value between two processors.
> Add these two nodes for remoteproc enablement on QCS615 SoC.
> 
> Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 43 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 7c377f3402c1..53661e3a852e 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -332,6 +332,49 @@ mc_virt: interconnect-2 {
>  		qcom,bcm-voters = <&apps_bcm_voter>;
>  	};
>  
> +	smp2p-adsp {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <443>, <429>;
> +		interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
> +		mboxes = <&apss_shared 26>;

26 will poke at the SLPI instead

Konrad

