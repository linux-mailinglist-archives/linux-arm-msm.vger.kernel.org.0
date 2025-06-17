Return-Path: <linux-arm-msm+bounces-61522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C5AADC09C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 06:30:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43D723B11BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 04:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9191ACEDC;
	Tue, 17 Jun 2025 04:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XWKvOAnn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ACB19DF7A;
	Tue, 17 Jun 2025 04:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750134620; cv=none; b=M8lo5ifml5qkYn6bb+IAdY2ibzBpzq91WDKYzgMKrqwtUoaoEB/u4hzZGy8JORCZpQ5WOXEtB+6+DuyeTyQU29PyH+RyP/C8ix1AE4mD6rpGyH03YSL+RA78XT0roBoRkvJZ3nqcPF/L10iL2ZW/8UOPNwFBbliG9biJMtje23I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750134620; c=relaxed/simple;
	bh=1q91GkQwmwkJe2N1Q451I/4ntxh/AWo/HgCV0Okp15Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aHPbxhV2vY88e1MOQ2G5ioYZKkdizpNvggbgN+Yil96trwHn4IyslT0vzQ+K5yPMh/htHohDIRyamReIIKN33LITZ5X5fGRlYiN47QeACmaCBqy2+rJZPkk5p7RZ3C/Wj98wwaJDOPYd3swXpck3CFjD1h6l/WYBj0G5g3zE5nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XWKvOAnn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHOG8p002991;
	Tue, 17 Jun 2025 04:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HDW7D7+uYyvCn2FKwUs7ZQqOu73VYzjex5OSChvIbjc=; b=XWKvOAnnZVte//nW
	vqCfGdM4aBkQSWhfFJuKRaIonJ5nCJVU/cIGPyPRe6/fUzaPBMZeEe1CrJ8To+vJ
	lCQhlhNCWicNrZR/kfPpfTKtWBR6XoEV6AFpCD3N0+ZHOuspXW1n2RzOIdKFfDkq
	p1VP8IgAIpKD7+30rNG2tMcUKOpN+Ocd5uBgr2XrG5GUG0gAHX1Mn0bz4n8QxdE6
	HlN+1hWfyE8PY9D3O5isdE/xE6uBg7QyihlF7VxPFFG18GJsQMSyQOoWNaWduTml
	d5Um0eAuL2jbKcOwYvpRvLV4ki9GBl+rIt8IHaXnYzRpoRLTkuko3ka8veR7cmbv
	j165EA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag232yp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 04:30:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55H4UDKc020798
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 04:30:13 GMT
Received: from [10.217.199.111] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Jun
 2025 21:30:09 -0700
Message-ID: <b6f4ccc6-5157-4076-aba1-7bd21c53ab19@quicinc.com>
Date: Tue, 17 Jun 2025 10:00:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs615: Enable TSENS support for
 QCS615 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>, <amitk@kernel.org>,
        <daniel.lezcano@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <=linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>
References: <20250613112402.2203617-1-quic_gkohli@quicinc.com>
 <20250613112402.2203617-3-quic_gkohli@quicinc.com>
 <a1077f88-b17c-48b7-b87a-06331b0bfaa7@kernel.org>
Content-Language: en-US
From: Gaurav Kohli <quic_gkohli@quicinc.com>
In-Reply-To: <a1077f88-b17c-48b7-b87a-06331b0bfaa7@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6izcmyklNmsJRTrjXix4nCEJZ3c_Y9So
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=6850ef56 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=UXIAUNObAAAA:8
 a=COk6AnOGAAAA:8 a=pdgr3DADYXGs-4q4n7cA:9 a=QEXdDO2ut3YA:10 a=bFq2RbqkfqsA:10
 a=a1s67YnXd6TbAZZNj1wK:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDAzNSBTYWx0ZWRfX+l5qISNJ+EBg
 4NQeYXwi6dmoYBHxfdOXBtGjDryhNmV+yOKS2DLeWHzjLjUqx4bRnSX6YkWgrslZ2Oe9CxinfNy
 ja2kzSUOEeUGFyqv6H6zeLNtHIlPLONj52jNHE/u5Z70aY9UN4hC+CjvCqyEjOKF7eEohkzDQxh
 vYmDzbejwS2fe+SLcp2MdOb6qzg3gik3QaWTnUK5PuJbk6e6NlWqHwwVganaNII+j5FR4ZsTq8I
 Jzpas5oU9ni26T494QUS/M6UWTjEEciqXWsXHaMTdewWYKyN5VnYwIt7gZP+D6PCHpYla+0I7zk
 fGDQXjtL8OSbEZHqXRRgsEuvgZAMrKo3yscnlwUnm2GDTMsRD1MxoqBz6Qb2l/+rto6Wxf7FgKA
 +aR9CJhVRSn579QUt9PuEXWQq9BVr4d3SSDRjA1mVODKn86ovyI4xboS4nDy/nIiityTUc/E
X-Proofpoint-GUID: 6izcmyklNmsJRTrjXix4nCEJZ3c_Y9So
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1011 mlxlogscore=834 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170035



On 6/13/2025 6:12 PM, Krzysztof Kozlowski wrote:
> On 13/06/2025 13:24, Gaurav Kohli wrote:
>> Add TSENS and thermal devicetree node for QCS615 SoC.
>>
>> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index bb8b6c3ebd03..fda8b8638718 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -3692,6 +3692,17 @@ usb_2_dwc3: usb@a800000 {
>>   				maximum-speed = "high-speed";
>>   			};
>>   		};
>> +
>> +		tsens0: tsens@c222000 {
> 
> Don't send us downstream. Node names should be generic. See also an
> explanation and list of examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> 
thanks for review & comment, will fix the naming.
> Best regards,
> Krzysztof
> 


