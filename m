Return-Path: <linux-arm-msm+bounces-49140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B508A419A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 10:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42D393AC9F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 09:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BAE724A041;
	Mon, 24 Feb 2025 09:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cz4ZzWXG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9F024292F;
	Mon, 24 Feb 2025 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740390895; cv=none; b=ubCrL6X/EOJ5HWzKJLGXPs09U5kgvafb2lLC+Ys+t79f2/2XXgJofT/jVvlO2770g/u1kaczn490xaGcNkbrZNulXfQNe8+vMe7ZRvMh8mjavzlDvbfVo2htynFTMPMPf2Zi5j0jyKPvE62D0yP6conitQwtWXmB5WZeSouYtTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740390895; c=relaxed/simple;
	bh=mqq9Uz8TFUp0gMepC1Su0V2uYRDL4Nxsb0ZZCNIomf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ox2o3Mv/FuCP/tPRXJeu6d1cuJAGCVS4xRme7IvTeMpcUN/QQou7B/aIZ6ufXERzCb5iLAPJi07WsOUfzBQTwyMElr7v1ffE2+6yNAMmYNADTysRyNmyehVW8qN/Ay0/NAKLTE/tfp5BpHxolcsBhsoSAQk7eU9e+z6MMHFh0FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cz4ZzWXG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O9N6Js007249;
	Mon, 24 Feb 2025 09:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m6+xl7S1QnQ4/NXjxzIqhVRz4yodGyeJpNrUChW2/P0=; b=Cz4ZzWXGO6rpRiEe
	7atB8K8CIWSy24bxFVaLayJ69T0EjUyxYvZpnoxf0kYQyjGvvSJ+DRsd1u2PPZVr
	tCilzMJ2Dm4LLbzic1sTNhi63cliv49v8cgrnncdHh01vITy5XZny1cAnvxrxyF/
	YliTfrg+S/FwYEfm10r9ILLoN87t1Sp7CgIjs+NMb92/GTCQPyI6AH/TH1IqRoRx
	gzNQ1Mo456diNl1hlc5lh/MDqXOHrpS7A1U5ituoPDcMDw+PyZt6AOhoC/wd1FLj
	hJXE5r0aC/LU4BqzifYSBER0T+FA6skrJw6mIdRXnVSdqJy7XgA3ecRFWVRHIH/Q
	1Hhlvg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5k64kpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 09:54:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51O9sMVH003185
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 09:54:22 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Feb
 2025 01:54:13 -0800
Message-ID: <03157f06-8e80-470c-bdee-ffbb31627a9c@quicinc.com>
Date: Mon, 24 Feb 2025 15:24:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/6] dt-bindings: clock: Add ipq9574 NSSCC clock and
 reset definitions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>, <p.zabel@pengutronix.de>,
        <richardcochran@gmail.com>, <geert+renesas@glider.be>,
        <dmitry.baryshkov@linaro.org>, <arnd@arndb.de>,
        <nfraprado@collabora.com>, <quic_tdas@quicinc.com>,
        <biju.das.jz@bp.renesas.com>, <elinor.montmasson@savoirfairelinux.com>,
        <ross.burton@arm.com>, <javier.carrasco@wolfvision.net>,
        <quic_anusha@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <netdev@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20250221101426.776377-1-quic_mmanikan@quicinc.com>
 <20250221101426.776377-4-quic_mmanikan@quicinc.com>
 <8936f8a7-5bc0-417b-a719-806f1ce0904b@oss.qualcomm.com>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <8936f8a7-5bc0-417b-a719-806f1ce0904b@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: d1Q0_KyU36FTHuO0yJLUPVpNbMt8b9Fg
X-Proofpoint-GUID: d1Q0_KyU36FTHuO0yJLUPVpNbMt8b9Fg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_04,2025-02-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=935 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240072



On 2/21/2025 5:19 PM, Konrad Dybcio wrote:
> On 21.02.2025 11:14 AM, Manikanta Mylavarapu wrote:
>> From: Devi Priya <quic_devipriy@quicinc.com>
>>
>> Add NSSCC clock and reset definitions for ipq9574.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> ---
> 
> [...]
> 
>> +  - |
>> +    #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
>> +    #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
>> +    clock-controller@39b00000 {
>> +      compatible = "qcom,ipq9574-nsscc";
>> +      reg = <0x39b00000 0x80000>;
>> +      clocks = <&xo_board_clk>,
>> +               <&cmn_pll NSS_1200MHZ_CLK>,
>> +               <&cmn_pll PPE_353MHZ_CLK>,
>> +               <&gcc GPLL0_OUT_AUX>,
>> +               <&uniphy 0>,
>> +               <&uniphy 1>,
>> +               <&uniphy 2>,
>> +               <&uniphy 3>,
>> +               <&uniphy 4>,
>> +               <&uniphy 5>,
>> +               <&gcc GCC_NSSCC_CLK>;
>> +      clock-names = "xo",
>> +                    "nss_1200",
>> +                    "ppe_353",
>> +                    "gpll0_out",
>> +                    "uniphy0_rx",
>> +                    "uniphy0_tx",
>> +                    "uniphy1_rx",
>> +                    "uniphy1_tx",
>> +                    "uniphy2_rx",
>> +                    "uniphy2_tx",
>> +                    "nsscc";
> 
> I see that the input clock is named rather non-descriptively, but maybe
> we should call it something like "bus" so that it has more meaning to
> the reader

Hi Konrad,

Thank you for reviewing the patch.
I will rename the 'nsscc' clock to 'bus' in the next version.

Thanks & Regards,
Manikanta.


