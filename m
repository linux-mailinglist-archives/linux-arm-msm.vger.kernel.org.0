Return-Path: <linux-arm-msm+bounces-34927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C059A3B6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 12:25:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D650A28586C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 10:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E5120124A;
	Fri, 18 Oct 2024 10:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YpvMh+kL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF8E1D0E36;
	Fri, 18 Oct 2024 10:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729247024; cv=none; b=Fw5+R0AaNGap/Nq9GVID9M002wL1CuxSBzlXaRx8POs8WQq7e9tznw4pB4F2TIykkSzpJXZfR2EpcO3XI7nQFmn4Z70bQZlOexazUOVYKCHrh/1VF815xggmDtnPQI+1y/rCn/htb5lu9/+XpxNRVgPD2KrquQ9oIK/0xBvhL1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729247024; c=relaxed/simple;
	bh=cu8iM3qloYhW73lJztVkKgCpFoh3lDpuTJlTVBDp4Pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ScCuonNOxQVuvUcaDgM7RnDdR8oFwhQk5ZNZuj1KutpopxyRDuzwI/rqtEIzrA+6LQTL6BFWnvE0MjNicN3rdgvV7O/78XKUdejAYWJxWPTENTr94Sk5DovXr5G63HAAvVd7umjYtO3zeuzHd6tVkhWxMwlQ9zBdoaIS8zUU5eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YpvMh+kL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I1gN5t022062;
	Fri, 18 Oct 2024 10:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0eQ/+mZ/DlkJ2oiZtADEUydVH3jecP10XpmJP5ZxTg=; b=YpvMh+kL2oJJo52u
	s45WDLnedKiAKIA2GFH4oUYMttj5WfmAw45CM+iZBu0X8F9PKHyZJl/rCr5cyzRK
	E7z2WT0H58T4XhpUi6pXnSXikY3h8SarsVsmJ+jfIGRa0ZBROo4bne48gDL3JAhi
	CrZFdD8SPMyfcxSp6Ha6mZySHvMHXBoTGp2hRNVsvXqiemfQDheK7g/TLmI/eECA
	nkdQKiEKEBmrldm83MdEfNKkePI+ti5l3IRT1DJmkZnTRVs9PsgvYiExc2Yn6nRm
	5FFC/h1puwcPNhpkJWis8G47sOjm5L8BZpwznnwRDnLdz5aGTBTAZCxP63HoQH8z
	bMrWuQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42be8c9c8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 10:23:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IANXFF016269
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 10:23:33 GMT
Received: from [10.216.0.54] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 03:23:26 -0700
Message-ID: <479f7aa2-0401-40d5-8e2f-d7512aeab0c0@quicinc.com>
Date: Fri, 18 Oct 2024 15:53:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] phy: qcom: qmp-usbc: Add qmp configuration for
 QCS615
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Tingwei
 Zhang" <quic_tingweiz@quicinc.com>,
        Conor Dooley <conor+dt@kernel.org>,
        "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>
References: <20241017130701.3301785-1-quic_kriskura@quicinc.com>
 <20241017130701.3301785-6-quic_kriskura@quicinc.com>
 <CAA8EJprcOU6qeJvHH+MVoPnQ+mGcos=pDOVBSeSUfBGw-KR6tA@mail.gmail.com>
 <aa68e5ab-86a6-430e-92d8-ed89b4eb37f7@quicinc.com>
 <CAA8EJprkq-Cct9Uk1Jwqc5Rn8mx8THTRgwCzDx=8ZgbCpwD7qw@mail.gmail.com>
 <684582c3-3559-4c54-8257-cb952bbfe2ec@quicinc.com>
 <l4wpt5qin3ezkowf3puvodrm5wjsptd4a32f4qrzcuuquo6kq6@j2orv5z5quln>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <l4wpt5qin3ezkowf3puvodrm5wjsptd4a32f4qrzcuuquo6kq6@j2orv5z5quln>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IpwPcAoJYgyVx804yfn7aMePnjv4O_g5
X-Proofpoint-ORIG-GUID: IpwPcAoJYgyVx804yfn7aMePnjv4O_g5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180066



On 10/18/2024 3:41 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 18, 2024 at 05:01:48PM +0800, Tingwei Zhang wrote:
>> On 10/18/2024 4:06 PM, Dmitry Baryshkov wrote:
>>> On Fri, 18 Oct 2024 at 10:48, Tingwei Zhang <quic_tingweiz@quicinc.com> wrote:
>>>>
>>>> On 10/18/2024 2:27 AM, Dmitry Baryshkov wrote:
>>>>> On Thu, 17 Oct 2024 at 16:07, Krishna Kurapati
>>>>> <quic_kriskura@quicinc.com> wrote:
>>>>>>
>>>>>> Provide PHY configuration for the USB QMP PHY for QCS615 Platform.
>>>>>>
>>>>>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>
>>>>> After checking platform details,
>>>>>
>>>>> Unreviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>
>>>>> Please perform global s/QCS615/SM6150/ and s/qcs615/sm6150/
>>>>
>>>> QCS615 and SM6150 are different variants of the same SoC. QCS615 is an
>>>> IoT variant, while SM6150 is a mobile variant. We are currently adding
>>>> QCS615 SoC support to the upstream Kernel, as it is in an active
>>>> development stage and we anticipate many products based on this SoC. On
>>>> the other hand, the SM6150 is an older mobile platform that is unlikely
>>>> to be used in new designs. For a product introduction of the QCS615,
>>>> please refer to
>>>> https://docs.qualcomm.com/bundle/publicresource/87-83838-1_REV_A_Qualcomm_IQ6_Series_Product_Brief.pdf
>>>
>>> Yes, I guessed so. It would have been nice if it was documented this
>>> way from the beginning.
>>>
>>> Please note that we usually get support for the mobile SoC first. So
>>> in most of the cases devices use mobile compatible even for IoT
>>> platforms, see qrb5165, qrb4210, qcm6490 and other similar platforms.
>>> I simply asked to follow the established pattern.
>>
>> Yes, we start from mobile variant for most of the platforms. There are some
>> exceptions like sc7180 and sc7280 which we started from compute variant
>> since they are widely used by compute platform on upstream Kernel. I think
>> we have similar case here. QCS615 will be widely used by IOT products on
>> upstream Kernel. We should have clarified this from beginning so there's no
>> ambiguity.
> 
> After offline discussion with Krzysztof, I'll lift my objection, so
> still Reviewed-by.
> 

Thanks Dmitry.

Can you help review patch-4 of the series. I made the changes you 
suggested on v1 (uppercase to lowercase and removing un-necessary re-inits).

Regards,
Krishna,

