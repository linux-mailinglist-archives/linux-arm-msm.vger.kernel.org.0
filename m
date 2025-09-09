Return-Path: <linux-arm-msm+bounces-72786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ECCB4FE13
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 15:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D94F85E4E8B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 13:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E7B338F36;
	Tue,  9 Sep 2025 13:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ojpuLWI/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64A0342C91
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 13:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757425554; cv=none; b=Y1T17xDVpFhSxCw6tD3Hclsbx55ytMqpoJOEtLnWl6N2KybkRk8lYqmkFN66GWKL9Y5rxgbY5yRsvMVwPENiWXWCaAK2n1fkb4mcQ4zQqlBxvFIS6SHWZAwOJ6Q0z9IcPf8V9Nu4UJ8iXVcw6KngPbeYA5ULDDPKEfBpbsnDjMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757425554; c=relaxed/simple;
	bh=f8iTI5TMMdpEw/sT0b2613CiwUc4tfz3GQE8z1ur25c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b7xm3Oym/MAYrWNmUj6LU5JReAhntuRNb2ycmTPpVyFnzaDGf5B6ydskWqwk2frhRq19WIRLmSI4aqgK6Ea0PYFFUanKFiaRY//BmvbYuYKBAh3s4Slc9+RFcDS+9KOy4vjbrng3oUSJh0tLf0jzaQWtFZidDJ9jS8ZP1D6fo+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ojpuLWI/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LhrW029929
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 13:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HtGgkybPm6v0URRLFra4Jz238QIDHfHOy7Lnfw1I7jY=; b=ojpuLWI/i/8rSiLF
	PgiIWFM8nkWUz1lFRxSdfSPkqpjx7ZZT+kmzidsQYFlscsuU6w2SY9cyRYaooE3E
	ptoNqi+5sNeEb4staNh0kx46MBRGmsbYyPrVrEYY5WORfuMMbglSMBT3ozl9lVBn
	z5zYXhM+VWba4/FTPj16RPPoKGJRqWZ1v7gD1hyJ9QawZfhbHOUH8hRNfma59hz9
	WkQjGf1vgygkjBrijmeBjjObrZuT11rIKe7AtXl74mjKPun427GNvMZeZ522OUxo
	0v0oYx1PqN8y3bRrOFqGIO+FUiHH5HXGF9w07sKa7scU32TpI17pe+Zy7Tcr0jpx
	gTW5XA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37vuvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 13:45:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7724688833bso5999405b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 06:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757425551; x=1758030351;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HtGgkybPm6v0URRLFra4Jz238QIDHfHOy7Lnfw1I7jY=;
        b=n+CEL2LaIzlsVnr4fodyZOMDfFPi0aSqtlgLiqOsM6mioslUhwmoBI7xuvpyv3tvgg
         98wXn7mnD9OAkKRy944g1nutQNYg3dJHgXLXZLt6485wf4U7o2vtqJ14/WdeKJpq1kXS
         eWEX6PAP8HAKOY8mjgExX887D1SgFkX4u5cdcpwRVQsETnSgws24Fd19WQo7OomAvmhX
         llMqZXO66Eil8irYGEVasJAQq877KWWTtM5E+0kL2FlCMY5qR40hWRD2Ww4Vo9aQxXBe
         VjKCLj5oTx80I6jy9NNz0NWMsO9I3qoCLlGa8NthnnQ8uRLSUHpfNJCqsHEcFx045jLA
         z/QA==
X-Forwarded-Encrypted: i=1; AJvYcCXtBGDH9xrLy1+FImevIfD22lkDILF5JJI1uSLqpvyqB73breMKJYQTkkCOyIKH0C2U8O/atnfkvW3jkHyk@vger.kernel.org
X-Gm-Message-State: AOJu0YzATm0vCYP0HpQ//xox0EanalvmoWTWJ8ElK7vxaB1La4wgZ1bW
	kpn277RRc0H4deWCfJwY0+J+C1l2HrGoujeBjqt8E9yWrVuJiyU8D43Q6trRFW3+OO9n+2DmU/w
	b2yqns5A2o6R+O/0r4HSLP34TVgQFT1KNvxOHqT3zT13iTbF9tkYcaF4VwNg88RZh2Tzu
X-Gm-Gg: ASbGncsSXIFVPPKJUOYYD2p9Dm1q14HpwtXLxqJoMMwX3PS/8CQJly/V2QiXSK80PUe
	EtTLCuRTTHnUJxjNPc3gA7IQZgjYxiWN50U8mPk0jj3taKB5lSxjm1KpysIdQSP/A63hEJPGOQq
	CGN09FvFfdunNpm3ps9DkqJJtU8ecJkRYJ7+fyhWtYVNkzLT2xzHXrFNUzNukwDm6Q+UgOmQ9Oy
	HM3QmSwNQ6OEVojf2wv/cvdQDYGfZnyebgsU2FbaJ7UM6JWyrIbxtQFl+jz3PTa9g7wHHYtdyU9
	Nezw8iEloUVw3TtxFukCYA8Bc9QYsjtR1dyYyjg4rwYvuoVSRhcqpi1rmok/BQ==
X-Received: by 2002:a05:6a00:13a2:b0:772:48c5:c761 with SMTP id d2e1a72fcca58-7742dcccbd2mr13013034b3a.10.1757425550846;
        Tue, 09 Sep 2025 06:45:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6cvRFc+/YxS+v49Zyl4iRKsKHIagabDncXnmXjWPenP1jekeJK1Igj52NaYuVapCTIrXssQ==
X-Received: by 2002:a05:6a00:13a2:b0:772:48c5:c761 with SMTP id d2e1a72fcca58-7742dcccbd2mr13012985b3a.10.1757425550288;
        Tue, 09 Sep 2025 06:45:50 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7746612d9c5sm2237291b3a.34.2025.09.09.06.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 06:45:49 -0700 (PDT)
Message-ID: <87e8c438-63d0-4f00-b147-4783ad208ab3@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 19:15:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-3-97d26bb2144e@oss.qualcomm.com>
 <f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aHqB8jMM7veQ1hvRBE95ogt0qpkkNIcf
X-Proofpoint-GUID: aHqB8jMM7veQ1hvRBE95ogt0qpkkNIcf
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c02f90 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=2iJ5yM1ecYHLd0rZiA0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfXwzyF6bOSQUSG
 7Wgz6lGg0S9jHWjbBy03Wpag9c7a7DE6ybt7OGOnZ7JkIFZ0JQnqqFpblyoRuwXHp7nC/RxV2QB
 KU18rFOuT/Q/qtJw9r4pstj5wbC3qRcXBZ/UJprMdSAFA+rhMLIws1++Rob0lL+AYq6Kucyy195
 Z1O7QT1/kmKyP6lp5G3gwIm/WRomP4khUsOI+RO+7NDVeotNJnfZRS2ijGK7rMoZzlQK717S6qN
 2UYOhVZyKMMeGSXyJQQI0sPZaMcEh3gB9KGjb7nW2NseCUic3naAzFhJdMwZW/vsNSXscvYCbsM
 l8uJNqwOyebJ5KxxLa8pNR7sCrTDcQQlN59T/rUfQQKoZ+TvBpj9yG4Yh+FCu7VjEWg984oj2Qi
 +WWeaU0R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

On 9/3/2025 5:56 PM, Konrad Dybcio wrote:
> On 8/21/25 8:55 PM, Akhil P Oommen wrote:
>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>
>> Add gpu and gmu nodes for sa8775p chipset. As of now all
>> SKUs have the same GPU fmax, so there is no requirement of
>> speed bin support.
>>
>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/lemans.dtsi | 116 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 116 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..8eac8d4719db9230105ad93ac22287850b6b007c 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> @@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
>>  			#mbox-cells = <2>;
>>  		};
>>  
>> +		qfprom: efuse@784000 {
>> +			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
>> +			reg = <0x0 0x00784000 0x0 0x2410>;
> 
> len = 0x3000

My bad. I missed these additional comments in this thread. Will extend
this range to keep it 4K aligned.

> 
> [...]
> 
>> +		gmu: gmu@3d6a000 {
>> +			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
>> +			reg = <0x0 0x03d6a000 0x0 0x34000>,
> 
> This bleeds into GPU_CC, len should be 0x26000
> 
>> +			      <0x0 0x03de0000 0x0 0x10000>,
>> +			      <0x0 0x0b290000 0x0 0x10000>;
>> +			reg-names = "gmu", "rscc", "gmu_pdc";
>> +			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "hfi", "gmu";
>> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
>> +				 <&gpucc GPU_CC_CXO_CLK>,
>> +				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
>> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>> +				 <&gpucc GPU_CC_AHB_CLK>,
>> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
>> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
> 
> This clock only belongs in the SMMU node

Not really. This is recommended for A663 GPU like other A660 based GPUs.
I know it is not intuitive. Similarly, we used to vote GMU clk for GPU
SMMU earlier.

> 
>> +			clock-names = "gmu",
>> +				      "cxo",
>> +				      "axi",
>> +				      "memnoc",
>> +				      "ahb",
>> +				      "hub",
>> +				      "smmu_vote";
>> +			power-domains = <&gpucc GPU_CC_CX_GDSC>,
>> +					<&gpucc GPU_CC_GX_GDSC>;
>> +			power-domain-names = "cx",
>> +					     "gx";
>> +			iommus = <&adreno_smmu 5 0xc00>;
>> +			operating-points-v2 = <&gmu_opp_table>;
>> +
>> +			gmu_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-200000000 {
>> +					opp-hz = /bits/ 64 <200000000>;
> 
> 500 MHz @ RPMH_REGULATOR_LEVEL_SVS, 200 isn't even present in the clock driver
> 

Ack. I guess this is fine. Hopefully GMU won't explode. :)

-Akhil

> Konrad


