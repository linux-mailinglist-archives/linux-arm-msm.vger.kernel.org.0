Return-Path: <linux-arm-msm+bounces-96678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFz4LOgpsGn/ggIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:25:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EA3251E69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F2C633E601F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9C938D6A7;
	Tue, 10 Mar 2026 13:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jyx8zu5k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XaCZ9SFy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C532E3876D3
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149613; cv=none; b=kabRzj9jCT5QqCKyvEroRW5xU1uDOCXi682zriAXZ912UK+dxEaKhVj7CVLo57izSX5La3q4WddAVwA1Se+knH3Bax3y9kLPp0d7ijhGmQO/7ysU7BoIWM1DpHffv19+fHl5cXXALndgU5/YAQuqicdEbH/jddqC1GT63GtG7jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149613; c=relaxed/simple;
	bh=ohlf204PBPyGkfGsfwjB4Rhue1MGahmTmkrmmngXz/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSgYGs04bf3oqV7z77y8EKJa5lpREKEKBfup9i0P3Rl3Ycyg2vHWpIkuVaL1S7ujtae+MAsJtIo4DzLPHZdh9si7YajSmyQbSCv8jH5fWnzecOc1L5FUq4Rm7qm1mHnGa5WDSrtTYTLPKhio1jQtBK7UZKd/PCvtvrtGSpsKdiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jyx8zu5k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XaCZ9SFy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACafZH963875
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eyn73kUkWiqNnNNT+/vwQ6yPvEiwRA7Z6RtRnIDL/oY=; b=Jyx8zu5kysUx+Cqa
	7c56vpi/wpeqlij6PFjnhpoEuX14b6StAUMOmacLO/swlipQIPFjA+HfrgrXTEM2
	6iiM/eJ5dyn0sOb22yxvon6OaHtTOZ676TXrmprqa46Ce0t+aBtFjuIZ7sfgxM1U
	FEDF0wU2Le+W7Ogd61pXyWGWIvVRhwZdRqrwm1sv0gc4VpzoJPD4IG+8K824zvIO
	GPazb7z0oEnjkaBIUTtI1vkelif/OunGwI2RTRD2WID2Ny0ScMWRtxY0ZBiLvqNV
	U7sbwuIAAggzXnuU9S9PzZPzejmtKHO7W3pRwOhVrfBCKqgisNiVEie5pbz2wqJH
	ponhqg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477kcrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:33:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb39de5c54so834339785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773149610; x=1773754410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eyn73kUkWiqNnNNT+/vwQ6yPvEiwRA7Z6RtRnIDL/oY=;
        b=XaCZ9SFyl00xYz6U8sTaltBtOVzcKW26pkWcOMhFYuZozth/8irrtUZZE6KBvWK+eq
         wEMmO2I8qWi76dvsORHPAGtaUu/bh/ys9MPCxvR2QaXQVgy10mS3scXJ9Z7NQo+gm4xq
         fVw9Qi5DcD8oayAUb84DjUGbHLvUwSZN5keixgx7E3pyoSU2M4qzMPj310R5iySPrZfk
         0C2STpJfn+j6nx/KKqDiLD2DYnh5xIS9/pzVk4uHl6BLNTyBi6+sN/78zJ9l67dlN32P
         nLf1Le6LdmL86IVayyzb+P3+pg4XjamiX/mOfm24k1xLlr8WvXN+9aeiloInvd9xTeBP
         NVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149610; x=1773754410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eyn73kUkWiqNnNNT+/vwQ6yPvEiwRA7Z6RtRnIDL/oY=;
        b=vrXPm1nJPq7iN8PdeKDC4+y1dOk6ihkaNyeGQb5ds9yesnOjPJzAJl9iO464cGjghw
         2j2de5a+v33L85lF3Vg2NklZPnk0FvZZomKT/BHC0R9LAEoRnlIYR/2sNsIh5bK7bFGX
         CH+lnL/M26b21FH3U8UtqAkIADnFIwddfQMs2ZFi4I9hpTWsvjTIa6omdM7XpEWmKHqI
         leWNplPw62nB6G49ZuU0VKq0jZiRM4JUw5/aMK2FnUwcH+0DO0BSRaDz7uab5FEvFkfH
         sYbNkZhnyGZd9CguK4AjWnaXuMrkNZqvC3hwtBaGhcxHbQF5AAkGqtcWeh2xdh+364Rl
         RZpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQz2j4Vl+8PzNWMDZ+pOuA5Pqa/FdK5IidbV+0UTY4evoChsiTaP88r134P08fYaSP/W2iieUNoGnqpvxP@vger.kernel.org
X-Gm-Message-State: AOJu0YwsbtoMC/6z44w1i+42EuTZcrRu6A0AK2bcv1bwNEA9ZnNynT1V
	l16vZOqhnqxyZ4vMUZJZpd7GHeTYHdcxVmfnx9VAf9ur7n1IzvRNiS/ELuGbDpA7DhuhFGJNKY7
	BBCpC6p4GXU/hRyK6Y6g2Q1/kWhtUw3wbiSHmiYLre93uaGBnq37RlesS5K7szl0s9Lhi
X-Gm-Gg: ATEYQzyzS2pDqNm2hBJnjgDrAyGCf4jTrfGEkYVL/ukMRNtcuirYdKr7XQg1yjrkS/I
	ZHeUB14MXJJXsZgE/azxDvJvkKyb7kNA0Wt9LWB0NBsii5eiVn8Prvb7rfOCeIm2AhhG1GClBPz
	swj5semlIzwhkQgEXukDnzdzSeGhmnFY8jAB4zE1XnwANTDDapS1wdPzDJsT5Js4gc183o7w0d+
	S+rw0U3WQ7bsCfBSZ4f9mG8MqzmgPayx0FzbC92G4At2TOGHJHIzkygTX8j+RlbDpVwbTTwHUCZ
	Pn6bCUyvGSMnckuT982Z4f/bSNk5fgzc1eEjfXEHnbNU+/o9Bqjviq5jeBD5zHmuCesLbmcxl+2
	HCJzR/DOxSBcq6vRYz2JCY67AcH5T2R0PhwR0L9NFskuyNUkf262lcbO5TYGrA1RRbxq2moVVK4
	Sycn4=
X-Received: by 2002:a05:620a:25d0:b0:8cb:3fa7:c4f0 with SMTP id af79cd13be357-8cd6d42bc36mr1491331685a.5.1773149609986;
        Tue, 10 Mar 2026 06:33:29 -0700 (PDT)
X-Received: by 2002:a05:620a:25d0:b0:8cb:3fa7:c4f0 with SMTP id af79cd13be357-8cd6d42bc36mr1491326785a.5.1773149609479;
        Tue, 10 Mar 2026 06:33:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f18902bsm477819166b.61.2026.03.10.06.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:33:28 -0700 (PDT)
Message-ID: <2f4f298c-5fc0-46e6-a1bb-4c37c21786da@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:33:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU
 nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20260305-gpucc_sm8750_v2-v5-0-78292b40b053@oss.qualcomm.com>
 <20260305-gpucc_sm8750_v2-v5-3-78292b40b053@oss.qualcomm.com>
 <67922413-af8d-4e75-aa49-079889576a73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <67922413-af8d-4e75-aa49-079889576a73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExOCBTYWx0ZWRfX+69AKM6D1En8
 WtktNkRmu0iUTRj8rzXGJ3Q8PyZaNekS5oFxTHVtdsWL/diBmMgCpX0pxdbBT70G28O3zIbsuT9
 RZC/6bJb0L22zu+qiltroX2Aml5aSMzYXS3BfjKbfoGOhJpDI+pVsYZoNfGDgrsjxKKAYk5cNLe
 KYh6XrSOemL9fjaTStS3D5e+CupJ/43Tx8+Q7RkBt+keD+T4eTR2lXtP04YaceZL/oBY+nLc1a9
 IJ8qovY38+Tbp1Fgxrd3bRqr6fEVDoeWli+MoDTd21b4rZeJANqazBMCTlFsQWNf8NdS4fxtLEG
 BPeMpkTsWoeEr8HG/LHaG0LdrhjEkM2iP1gLsKjFP0zwA3HJNIGX16JWI0QbuzcBtIaWCq8AEFM
 ZucYYeVsAzVEc8B3gpLDcbarz3fuFaoyDn4wBfA9g5q5L5T4xBC5N3qcDla48lDi5UPfUzN/mpT
 MxrggOh4jPoqkVY6VUw==
X-Proofpoint-GUID: f_pKFQuT3DxOcnZPbs8tPHIJ52rhWt2h
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b01daa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6F_KMvjuWJjJSnLB6NgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: f_pKFQuT3DxOcnZPbs8tPHIJ52rhWt2h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100118
X-Rspamd-Queue-Id: 00EA3251E69
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-96678-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,3da0000:email,3d90000:email,3d64000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/26 10:40 AM, Akhil P Oommen wrote:
> On 3/5/2026 4:10 PM, Taniya Das wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
>> is simply a separate block housing the GX GDSC) nodes, required to
>> power up the graphics-related hardware.
>>
>> Make use of it by enabling the associated IOMMU as well. The GPU itself
>> needs some more work and will be enabled later.
>>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 68 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 68 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> index f56b1f889b857a28859910f5c4465c8ce3473b00..0e7a343297e3f5d7a8189f50726dc6279078c21c 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> @@ -4,7 +4,9 @@
>>   */
>>  
>>  #include <dt-bindings/clock/qcom,rpmh.h>
>> +#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
>>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
>> +#include <dt-bindings/clock/qcom,sm8750-gpucc.h>
>>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>>  #include <dt-bindings/clock/qcom,sm8750-videocc.h>
>>  #include <dt-bindings/dma/qcom-gpi.h>
>> @@ -3001,6 +3003,34 @@ videocc: clock-controller@aaf0000 {
>>  			#power-domain-cells = <1>;
>>  		};
>>  
>> +		gxclkctl: clock-controller@3d64000 {
>> +			compatible = "qcom,sm8750-gxclkctl";
>> +			reg = <0x0 0x03d64000 0x0 0x6000>;
>> +
>> +			power-domains = <&rpmhpd RPMHPD_GFX>,
>> +					<&rpmhpd RPMHPD_GMXC>,
>> +					<&gpucc GPU_CC_CX_GDSC>;
>> +
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>> +		gpucc: clock-controller@3d90000 {
>> +			compatible = "qcom,sm8750-gpucc";
>> +			reg = <0x0 0x03d90000 0x0 0x9800>;
>> +
>> +			clocks = <&bi_tcxo_div2>,
>> +				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
>> +				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
>> +
>> +			power-domains = <&rpmhpd RPMHPD_MX>,
>> +					<&rpmhpd RPMHPD_CX>;
>> +			required-opps = <&rpmhpd_opp_low_svs>,
>> +					<&rpmhpd_opp_low_svs>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>>  		pdc: interrupt-controller@b220000 {
>>  			compatible = "qcom,sm8750-pdc", "qcom,pdc";
>>  			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;
>> @@ -4515,6 +4545,44 @@ tpdm_swao_out: endpoint {
>>  			};
>>  		};
>>  
>> +		adreno_smmu: iommu@3da0000 {
> 
> Should we move this node right after the gpucc node to sort based on
> address?

Yes, this might have been a rebase artifact

Konrad

