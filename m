Return-Path: <linux-arm-msm+bounces-33513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09301994477
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 11:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFED12840E3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 09:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7B818C922;
	Tue,  8 Oct 2024 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iQ6TFrB8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62BF184551;
	Tue,  8 Oct 2024 09:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728380350; cv=none; b=DmntDA+4wZknXvWYXc+YrJYfdFKbPalW3XED2hgFJiS0cmrxFLr2Anoy8P97qNQ5cPkNN5RloEECJ35+xiWhm4DNeo4fKTzSZFY7C8dDkcNwVKBNP9RPMcTap7LfbGrGk4SsBncFTEqsW+9TC5th5vEEanCSZ9Vv5wAUSRSCOJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728380350; c=relaxed/simple;
	bh=9z/cJJVc5YTvNuiK49ul3aPqJ+/9WhArwBDPx5yF/Kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GkgXVQkLpSuoM8SjuUFATYf3E1fjjd3yPR7B18K2a090TLfKW8D3Tb5iyn0fj10686h3dMlITKhoIJMEob8NUOi1RDRZp87tq28vBaRIupqgX2b6QJMkkn29IyzrQSzLqJtxe/FKE0TPZTZOsd+Mr/lxM5DK6vFnu7ysIKPe8V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iQ6TFrB8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4986in9T026816;
	Tue, 8 Oct 2024 09:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a3T3UzKLu9ltViqwnfnBybuDfhJZbIfLFf2Zb3zliP8=; b=iQ6TFrB8iPIW/nNU
	JK2KRjxrkFtKoaM8kk+Ria4E0mv70ixlHZPEk9ENB5H+7/txpcPzkCu/+UC4fOk+
	IAlw120zml3/dTUZ/k3V8rU8eaYQ9rRlpRADLhVG2qHeZ6q5RFRHrKQ9b9DzXHGz
	9v61fFmGnpE4H7CwweCJGsWY+bEksc1a+HaqxKrbV7QLC8wrEgTPXe4QUr5G9Zyq
	Pv1K0Fv9eEIRN/DErUsnBpcs+Mhs+mYMFR4mxvaw41y+XqmqaACO9l08IBkOHZk5
	P1oxM5NNj2U3hBCnkBCecPSdx0Om7IVIj5bSqOtKsk/tfl/s7v/GGq9ACAAz0N5o
	Gj3l6A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xq9xwhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 09:39:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4989d3ko023539
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 09:39:03 GMT
Received: from [10.217.216.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Oct 2024
 02:38:59 -0700
Message-ID: <b900d558-8ab0-436f-87bd-7a3d83e3dea0@quicinc.com>
Date: Tue, 8 Oct 2024 15:08:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490: Allow UFS regulators load/mode
 setting
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_kamalw@quicinc.com>,
        <quic_jprakash@quicinc.com>
References: <20241004080110.4150476-1-quic_kotarake@quicinc.com>
 <jid5coqe4tpsafbi2haem6ye4vrpwyymkepduxkporfxzdi6cx@bfbodoxoq67l>
Content-Language: en-US
From: Rakesh Kota <quic_kotarake@quicinc.com>
In-Reply-To: <jid5coqe4tpsafbi2haem6ye4vrpwyymkepduxkporfxzdi6cx@bfbodoxoq67l>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1euXo7adzyRVhTVUxUO76-tQsoulUmOF
X-Proofpoint-GUID: 1euXo7adzyRVhTVUxUO76-tQsoulUmOF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=843
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080063



On 10/7/2024 1:37 AM, Dmitry Baryshkov wrote:
> On Fri, Oct 04, 2024 at 01:31:10PM GMT, Rakesh Kota wrote:
>> The UFS driver expects to be able to set load (and by extension, mode)
>> on its supply regulators. Add the necessary properties to make that
>> possible.
>>
>> While at it, UFS rails have different voltage requirement for UFS2.x
>> v/s UFS3.x. Bootloader sets the proper voltage based on UFS type.
>> There can be case where the voltage set by bootloader is overridden
>> by HLOS client.
>>
>> To prevent above issue, add change to remove voltage voting support
>> for dedicated UFS rails.
> 
> add change to remove smth doesn't sound correct to me.
> Please don't depend on the bootloader and describe hardware > configuration. If there can be two types of IDP boards and you can not
> identify the voltage via other means, please create something like
> qcm6490-idp-ufs3.dts. Please add proper Fixes tags.
> Last, but not least, as Bjorn wrote, please split into two patches.
> 
sure, i will split the change into two.

Since we can’t differentiate IDP boards based on UFS versions while 
loading the DT and we have only single board ID for the IDP's, it’s not 
possible to create separate UFS-based DT files like qcm6490-idp-ufs3.dts 
and ufs2.dtsi... etc.

And also UFS driver does not vote for voltage on UFS rails & they just 
vote on load only.
Hence to support both UFS 2.x and 3.x, we need to remove the voltage
min/max voting. if add the min and max voltages in DT, then those
initial voltage set by bootloader is overridden by regulator
framework with min voltage specified in DT.

Note: Bootloader have capability to detect the UFS version (where as 
HLOS does not have that capability)

Thank you for quick review!!
>>
>> Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> index 84c45419cb8d..8a4df9c2a946 100644
>> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>> @@ -258,13 +258,15 @@ vreg_l6b_1p2: ldo6 {
>>   			regulator-name = "vreg_l6b_1p2";
>>   			regulator-min-microvolt = <1140000>;
>>   			regulator-max-microvolt = <1260000>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
>>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>   		};
>>   
>>   		vreg_l7b_2p952: ldo7 {
>>   			regulator-name = "vreg_l7b_2p952";
>> -			regulator-min-microvolt = <2400000>;
>> -			regulator-max-microvolt = <3544000>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
>>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>   		};
>>   
>> @@ -277,8 +279,8 @@ vreg_l8b_0p904: ldo8 {
>>   
>>   		vreg_l9b_1p2: ldo9 {
>>   			regulator-name = "vreg_l9b_1p2";
>> -			regulator-min-microvolt = <1200000>;
>> -			regulator-max-microvolt = <1304000>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
>>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>   		};
>>   
>> @@ -467,6 +469,8 @@ vreg_l10c_0p88: ldo10 {
>>   			regulator-name = "vreg_l10c_0p88";
>>   			regulator-min-microvolt = <720000>;
>>   			regulator-max-microvolt = <1050000>;
>> +			regulator-allow-set-load;
>> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM RPMH_REGULATOR_MODE_HPM>;
>>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>   		};
>>   
>> -- 
>> 2.34.1
>>
> 

