Return-Path: <linux-arm-msm+bounces-33093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FB798FFBF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 11:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30B88283F0C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 09:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33611448E6;
	Fri,  4 Oct 2024 09:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OkXW/8ag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EB7139E;
	Fri,  4 Oct 2024 09:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034255; cv=none; b=GTNR00Rk94hx+ApjTsfWuv0NslPR0i/rkjNU71U0AHSqwPa5umb7o2Wpw3DUSq1DJs1mU+hADer5kqkpD/2sFHycdgDUlvPq4H3hvXxJbAV73EsV3UlEtKG56kOQ4F6nlZjDL5qI86T/zpyOeo0x2lzqhBko+zKw3F62ukDmY7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034255; c=relaxed/simple;
	bh=Gcz3sMjFLBwD5FmA9YpclrfP1tPne1eXHw/7bpVyGJg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=ZZCn0lItX4gzD7X1MZuPevF4CEa13D5HIeR5vmy21moKAfv0J6G2A7Lco6LPF0xBF6UFKZNTP+xvlADnkIlDwU1mBWOBe+fPj/helRKXghaS+qrnZsaWMf//xwAY8gMTZmVBDIvNSy8pLSbLvA6LtUvKtJwbreFLC8grCllCcmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OkXW/8ag; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 493Hxlep021973;
	Fri, 4 Oct 2024 09:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SlbT/U1mBNzm2xPDe2oqP96tlqxzX5r2KQI4W6SNklM=; b=OkXW/8agxrxeXgpG
	hyEeO23KJqJ0mQR7h52u1g+8w2PWyVbssX+Ilr6h8LZfaILf0QkZBsiseBL9Za4r
	XJ4/xmsJWFGrzjton71VXAYiHZOJlA3iSL8Ha455PRzT2rZbTVJTE1Ja2Ws8DTCW
	rjm7Nr6c83YryGLI+OSyjHNT8pZBTTI6dfWLW+7bKOp2EGiZcmGs0wTZ6kySRYc3
	McYeoHiYrML1Y5MevNCz+fpKXbZilKTZopzDPy9NgM1rY06k+dDSOdjd7Dcq+gHv
	2bzQIffG4lrZ83wor+zrUJtyuNaZ1vcahyUzPQdjvn6FDQYBM5cYlZhmkUBt2uUR
	3wbSjw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205ksn1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 09:30:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4949Ummx016879
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 09:30:48 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 02:30:43 -0700
Message-ID: <09dcc7c8-8ac7-4931-be73-f4aa767dd5e9@quicinc.com>
Date: Fri, 4 Oct 2024 15:00:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] dt-bindings: clock: qcom: Add SA8775P camera clock
 controller
From: Taniya Das <quic_tdas@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        <quic_imrashai@quicinc.com>, <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
References: <20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com>
 <20240816-sa8775p-mm-v3-v1-3-77d53c3c0cef@quicinc.com>
 <57672tyb6pij3h7ensq4itbhnw3lr4wahfttc2fdcj4twbqpta@pwskxpet4nsh>
 <5d6c455f-7fbc-4e2f-a537-907f26a4ef59@kernel.org>
 <40dc7c1a-9f27-45a3-ad8d-0e9989894574@quicinc.com>
Content-Language: en-US
In-Reply-To: <40dc7c1a-9f27-45a3-ad8d-0e9989894574@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2cRzkSZ42TjgADKJEQO6ChRBLVKtv5AO
X-Proofpoint-ORIG-GUID: 2cRzkSZ42TjgADKJEQO6ChRBLVKtv5AO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=994 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 bulkscore=0 mlxscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040068



On 9/13/2024 10:32 AM, Taniya Das wrote:
> 
> 
> On 9/6/2024 5:54 PM, Krzysztof Kozlowski wrote:
>> On 18/08/2024 20:02, Krzysztof Kozlowski wrote:
>>> On Fri, Aug 16, 2024 at 12:01:45PM +0530, Taniya Das wrote:
>>>> Add device tree bindings for the camera clock controller
>>>> on Qualcomm SA8775P platform.
>>>>
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Un-reviewed.
>>
>> We achieved consensus allowing sa8775p to stay, but now Qualcomm changes
>> point of view and insists on new approach of dropping sa8775p. Therefore
>> this change does not make much sense in the new approach.
>>
> 
> Krzysztof could you please re-review the patches again? As I understand 
> the that Qualcomm will support both SA8775p and QCS9100 in Kernel. 
> There’s no plan to drop SA8775p support. These two SoCs will keep 
> compatible.
> 
Krzysztof, Could you please help reviewing the patches again?

-- 
Thanks & Regards,
Taniya Das.

