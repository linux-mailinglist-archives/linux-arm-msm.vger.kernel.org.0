Return-Path: <linux-arm-msm+bounces-43345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D6B9FC95A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 08:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56B901883478
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 07:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A58914C5AF;
	Thu, 26 Dec 2024 07:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kEXcGhlm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5697E12B71;
	Thu, 26 Dec 2024 07:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735196802; cv=none; b=VFCP9EHAXxgWUcP4KEYbDIoPSAjCqe9N0ZKGWrDl+8TbxpNH0qfDUlkBj3umua6BJFO0xYF8YLuMzmJxnjI5LSMTVeK0O6gghBdhhVeKPXVoO8w3tvGG3Ll0S3O6F/GyrS5uAZ1+v70hgkZX2S8zq+RIPgwA+FLgKWrnuCWJ3HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735196802; c=relaxed/simple;
	bh=pEM8irB10Ema+6TlLRE2kdz1l0WA/w2TEBQaDq5dgTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=D1MlJ6Q54VzoxYlHWbJEz+ESid8i9OM8khGA5+VhA3wd1/SPbM/yABujcCIVHRgxNyhjqe+GjlYbJSGU828QdqpcPVuahGgoqeLR//w5h92lUAHVWgP2BxoGHHmX25qAJ3XzGGfbVKmIlhtiv4r6lT2GG1fP5zxqfrNnKWX3g74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kEXcGhlm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ5alVT003480;
	Thu, 26 Dec 2024 07:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YeLxuuzatsnjAvtIwd7IxDMn6VpPy/R42vPI1syTlJA=; b=kEXcGhlmeZEU7qzB
	5KUsRpQw4oXFAziLdIKU5i82vFY1IKskalk5xDqadcAggsmDBdbtUy6rxECTnO2g
	TkCs5WZng7JafVdnpQsDVQwxwX2cBTejYocTNjtIULvaj5/vi3BxlnauDEMVANxc
	I07BIaJrY6gxwMdN0W6igoEfw/HzU20xM3LdIFGdFA4nJdYEJeC+mpaLVzaciifj
	+/4jMWQNu4fu2VTN5OkOXHUhPfTzYKAR88xEvY6DhTRo91vhu/y3xU1jL+88O/5n
	AK8Z08m6KWiVo5llrZQOnrqEs3ECwJC+rdhaLxGlUc+VCfzvhGGRzKU7S5EWXjjy
	3dXCOQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43s159gda5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 07:06:36 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQ76Zs0003766
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 07:06:35 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Dec
 2024 23:06:32 -0800
Message-ID: <9a42ba40-9984-4c19-8de4-f814d27cb20d@quicinc.com>
Date: Thu, 26 Dec 2024 15:06:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs8300-ride: Enable Display Port
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Ritesh Kumar <quic_riteshk@quicinc.com>
References: <20241127-dp_dts_qcs8300-v1-0-e3d13dec4233@quicinc.com>
 <20241127-dp_dts_qcs8300-v1-2-e3d13dec4233@quicinc.com>
 <466ea213-5f20-4a9f-a9dc-751756792845@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <466ea213-5f20-4a9f-a9dc-751756792845@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: n1VYVQw24Bor3BsI94vTPd9uMzAbp6Ko
X-Proofpoint-ORIG-GUID: n1VYVQw24Bor3BsI94vTPd9uMzAbp6Ko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260061



On 2024/12/6 5:46, Konrad Dybcio wrote:
> On 27.11.2024 11:45 AM, Yongxing Mou wrote:
>> Enable DPTX0 along with their corresponding PHYs for
>> qcs8300-ride platform.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
> 
> [...]
> 
>> +
>> +	dp0-connector {
>> +		compatible = "dp-connector";
>> +		label = "DP0";
>> +		type = "full-size";
> 
> I was surprised to see it but yeah this is real
> 
>> +
>> +		port {
>> +			dp0_connector_in: endpoint {
>> +				remote-endpoint = <&mdss_dp0_out>;
>> +			};
>> +		};
>> +	};
>>   };
>>   
>>   &apps_rsc {
>> @@ -223,6 +235,30 @@ &gcc {
>>   		 <0>;
>>   };
>>   
>> +&mdss {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp0 {
>> +	status = "okay";
> status should be the last property
> 
got it. thanks for ponit it.
>> +
>> +	pinctrl-0 = <&dp_hot_plug_det>;
>> +	pinctrl-names = "default";
>> +};
>> +
>> +&mdss_dp0_out {
>> +	data-lanes = <0 1 2 3>;
>> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>> +	remote-endpoint = <&dp0_connector_in>;
>> +};
>> +
>> +&mdss_dp0_phy {
>> +	status = "okay";
>> +
>> +	vdda-phy-supply = <&vreg_l5a>;
>> +	vdda-pll-supply = <&vreg_l4a>;
> I couldn't find the reference for these, so I have to trust you
> 
yes, this two power can work for qcs8300.and we verify it.status also 
should be last property?
> Konrad
> 


