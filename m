Return-Path: <linux-arm-msm+bounces-41897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 757649F04A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 07:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27AF2283737
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 06:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B79518A6BC;
	Fri, 13 Dec 2024 06:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J5SftBCY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EED21547CC
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 06:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734070350; cv=none; b=lAE5EYEJQJs3cfyVtYTZWRzIWAfDUbyUlmnduu+7+d+a7kA1o2SnxJ+R1/9nBQh86OI2bibbdFB+i+MrRo6nPMHoX9mC3gSOyk+cQQaUPEW7eC5l5ij+yPaIVZknx1fwkNDphVqlqBlI+IKdzvSyXyMhgyFn0uVDQHR2whnVVSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734070350; c=relaxed/simple;
	bh=Fd3/VWN2N6P5eVMa35mdJbmYGdNDz/fHyVveuRA/u8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RGr+op7Q6q7CYIFLfIBurr5i6ClrAc2ZGNu+5GA+K1GmOAW6cYkhvLvhOtHFKW9XAPvPl4pzWlshcoYACEy7rHG22jnNuldymQtgktRlhwcBrXWY4RxU0TIW59r4LRwOK+qbvxbHVgk6qJIZPqbIMUWyJSE9AYEeqWbxRg1oM8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J5SftBCY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCGT93A026852
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 06:12:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wwe1OOBMeBw4pTIdS1aMnLDqOgTpzuUj5DXnIN3oiDk=; b=J5SftBCY/6zqvHzO
	PPYIRDshHwrZ0dGhsQhW9Q1Znb1MHMRIZL/7VOE2W73k7XEXolLgoowsT7rbNqYI
	yXTDO3mZgvIir/3TN0u5wcx4BZHBy5DmPg0VFKs3JWVtcaI3ZpirI5RJdHSNSDs8
	y8aandTof1iuouz2nhbVglwe273TJn44BujdKvWM0cf8y/99lR8yTWOeAApVM35I
	DuhLJdVSMosvyVc+ml1cEB4fjTXrcBZQVcm3z53G/giIzWOSB+PO18NXQEO4Xd/w
	5vLAn/bsFJF/ub1F8rkol0KTh9l9lVPVxofXMhDZBvDBUoRzBnaAr5ESOsi5lMPL
	ZYdQgg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd40n8x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 06:12:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2167141e00eso13704585ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 22:12:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734070346; x=1734675146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wwe1OOBMeBw4pTIdS1aMnLDqOgTpzuUj5DXnIN3oiDk=;
        b=gUyrdd6SVOIK8SFc9y0QjqlUHtwYSeD2u8siYWbKreiSpEHgr1DngHRQIvmnuApRdl
         shZDzEZzKqlR/W8GvAypPabhEKW/ZMdMG2MDd8DEaOtRqnGvgMk3bLmUEMoSR+l4ocIg
         hMLJH3Vq/eSz/nOwjz5fb81XpGLYorexPLHYIzlTs2da68YsESIuMGOICmfu3qqi7sL1
         RLb+ZZKU4/Pj3WW3x74fGDzrILLZTGlwZKPxPMl18C9dnw6/r9AtF0iJ75q+BN3kLZ6K
         NFXNcWKE/DFaNY+M6HRsT/zEwOwTZhfm3uR4YEWNOKASz2kIG+Q9xaOJqGsbEWsF2GPB
         5npA==
X-Gm-Message-State: AOJu0YzvBjoMdlRTdRcSg+WG1LKTwmIGOTRCEXQYeydsxsMjJQkXmdOz
	v0JsKnE9WSi05HbaHBj1cNn+xBr+8EahVVdv2kS4AfuGqCOwwEvJLyZAKiVJtfXtxNaaqRiepQS
	GomHZ1SBRaPjpU1I7+LCgM/8WaLCSAvt7Gih2TApCPdXNbzRX2yqnnQA2W+PFIv1I
X-Gm-Gg: ASbGncvag1/pL+2mRhsxWjrCJFcNYqRRdbcpfA6kBTD9QFbJsM+EQFukjSUYGASuRZQ
	Fvqjq4s5B8TZyDZatqyul7JIPJ1zwvCVazOnFVJXBna/b/YwhWby+1Xn3TpLZP1qjXPf9bOZ+Ao
	QY5Je6Q523Kb+5X0MPKJ4S845v5qexu0EuFsGMEL6pw09FqcbEJE6UElOEbyIuTuMyCq2jjPImq
	ESWNImzuAw/BB+wXs2vz9RTCGnpRI868G0E79Bq1BAGqfmoZ7QHD8R4AYIIY5mDHAfO70Ts8mdT
	vazLwVhIeNmd
X-Received: by 2002:a17:902:e883:b0:216:725c:a11a with SMTP id d9443c01a7336-218929994ccmr23468375ad.10.1734070346482;
        Thu, 12 Dec 2024 22:12:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwZo0qz6/vneMrabgMrN7CpSW2+2zGTs7N3GavcOTZPNZVDSST77pmI8yugosIUdToCQZjnA==
X-Received: by 2002:a17:902:e883:b0:216:725c:a11a with SMTP id d9443c01a7336-218929994ccmr23468155ad.10.1734070346118;
        Thu, 12 Dec 2024 22:12:26 -0800 (PST)
Received: from [10.92.163.196] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2161e5a6f23sm112693745ad.266.2024.12.12.22.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 22:12:25 -0800 (PST)
Message-ID: <b7452fd4-cd9c-4e09-8524-ecc4b60ae90d@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 11:42:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: Add support for secondary USB
 node on QCS615
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20241211-add_usb_host_mode_for_qcs615-v2-0-2c4abdf67635@quicinc.com>
 <20241211-add_usb_host_mode_for_qcs615-v2-1-2c4abdf67635@quicinc.com>
 <5943f27b-1123-44b3-b93d-56fc45512d3b@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <5943f27b-1123-44b3-b93d-56fc45512d3b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ywwFsKMZp4extIS12cwOoAy0UVqFOcJu
X-Proofpoint-ORIG-GUID: ywwFsKMZp4extIS12cwOoAy0UVqFOcJu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130043



On 12/12/2024 11:40 PM, Konrad Dybcio wrote:
> On 11.12.2024 9:26 AM, Song Xue wrote:
>> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>
>> Add support for secondary USB controller and its high-speed phy
>> on QCS615.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> Co-developed-by: Song Xue <quic_songxue@quicinc.com>
>> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 76 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 76 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index b8388dcca94cd8f4e6f1360305d5f6c7fff4eec3..651c6c8b8bc40886139fa235874e834928e14e77 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -3079,6 +3079,20 @@ usb_1_hsphy: phy@88e2000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		usb_hsphy_2: phy@88e3000 {
>> +			compatible = "qcom,qcs615-qusb2-phy";
>> +			reg = <0x0 0x088e3000 0x0 0x180>;
>> +
>> +			clocks = <&gcc GCC_AHB2PHY_WEST_CLK>, <&rpmhcc RPMH_CXO_CLK>;
>> +			clock-names = "cfg_ahb", "ref";
> 
> Having this be a vertical list would be nice
> 
> Nonetheless, this looks good and the magic numbers all line
> up with what the computer tells me. You may want to check
> with Krishna Kurapati whether snps,parkmode-disable-ss-quirk
> here as well.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


Thanks for the review Konrad.

This is HS only controller and this quirk is not necessary.

Regards,
Krishna,

