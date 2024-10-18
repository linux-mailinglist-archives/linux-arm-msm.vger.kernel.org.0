Return-Path: <linux-arm-msm+bounces-34911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFE09A3951
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 11:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EE1D1C239CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 09:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EBC618E76B;
	Fri, 18 Oct 2024 09:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G3Yj21Bk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E26617DE36;
	Fri, 18 Oct 2024 09:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729242127; cv=none; b=WbEiuvpy5oCjDZ0zRcOx3GQzUQdkpUZP3RJKgRJ6kGop1czIeAgHZnHvqjLSdS/RQK4aTzXL8DVydOCmNEEi2/GnmV0JREdeHLCh+PnB1iEGX3L/Aq8JFR1cNV84cOCzsN8UjdC97EMf5rHAJBAbtRu6Ktf4fCba7ICHSeY6xmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729242127; c=relaxed/simple;
	bh=5zevuy9/0H8ybeszjdKv6ORtzNZwJb6hVxMXGIrm4Po=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IfhkmqschnYtr5uqUAyujuTeLf+sCmso3Scw5FohnwIc9F2yq5EYyYuhhlm62FbqloyjdLcN0NRTADHNBX1iMYcJI0wGgV8FP0Zi4yjpCY99Qje8f1qyQhqbFewOqCpb12+z8BzVijYhj36VcUWLPfUtlxEC8K3PuR0J5f1WVMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G3Yj21Bk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I6KYoF006874;
	Fri, 18 Oct 2024 09:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/xq50zskWssdL5cb4gep6QWqjz2fidOOlyXs84vf6mI=; b=G3Yj21BkASf/WL0Q
	uEMw/fAvBiQCuFSFAI+BmeiQ7dFCC8RBQCdnGWDYY+YkM6+Go+rfg/annN2edvpY
	S2fRg+3k/XfxGrMEbvxgBfHJkC81O/be+kH6Otuc4xxMbKbETYSk6ayeR+dudTcH
	yH4fIYubJQqsY2ni4JcfwVTnDoqy7rRZV9QDniIF8Qody6vjB8TnR39mCVohN6Yv
	6+iBY9mBeM11loxeR7Pp24XosRaRoZSq+/Zg64UP0oMrKro+tF6kZaV3woUIMNzJ
	8o6ZRQ8vjwgc8yd1ctehJlHocVVKUG2ktI/rvDoZa5s4VScc8+BtxjuSmODi3ORA
	Sri4Ag==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b5hstfgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 09:01:57 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49I91uuj025280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 09:01:56 GMT
Received: from [10.233.17.145] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 02:01:51 -0700
Message-ID: <684582c3-3559-4c54-8257-cb952bbfe2ec@quicinc.com>
Date: Fri, 18 Oct 2024 17:01:48 +0800
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
CC: Krishna Kurapati <quic_kriskura@quicinc.com>,
        Vinod Koul
	<vkoul@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        "Bjorn
 Andersson" <quic_bjorande@quicinc.com>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
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
From: Tingwei Zhang <quic_tingweiz@quicinc.com>
In-Reply-To: <CAA8EJprkq-Cct9Uk1Jwqc5Rn8mx8THTRgwCzDx=8ZgbCpwD7qw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GypxlSRqaNk_gTLWXB9lyjej6lAJ0ETH
X-Proofpoint-ORIG-GUID: GypxlSRqaNk_gTLWXB9lyjej6lAJ0ETH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180057

On 10/18/2024 4:06 PM, Dmitry Baryshkov wrote:
> On Fri, 18 Oct 2024 at 10:48, Tingwei Zhang <quic_tingweiz@quicinc.com> wrote:
>>
>> On 10/18/2024 2:27 AM, Dmitry Baryshkov wrote:
>>> On Thu, 17 Oct 2024 at 16:07, Krishna Kurapati
>>> <quic_kriskura@quicinc.com> wrote:
>>>>
>>>> Provide PHY configuration for the USB QMP PHY for QCS615 Platform.
>>>>
>>>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> After checking platform details,
>>>
>>> Unreviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> Please perform global s/QCS615/SM6150/ and s/qcs615/sm6150/
>>
>> QCS615 and SM6150 are different variants of the same SoC. QCS615 is an
>> IoT variant, while SM6150 is a mobile variant. We are currently adding
>> QCS615 SoC support to the upstream Kernel, as it is in an active
>> development stage and we anticipate many products based on this SoC. On
>> the other hand, the SM6150 is an older mobile platform that is unlikely
>> to be used in new designs. For a product introduction of the QCS615,
>> please refer to
>> https://docs.qualcomm.com/bundle/publicresource/87-83838-1_REV_A_Qualcomm_IQ6_Series_Product_Brief.pdf
> 
> Yes, I guessed so. It would have been nice if it was documented this
> way from the beginning.
> 
> Please note that we usually get support for the mobile SoC first. So
> in most of the cases devices use mobile compatible even for IoT
> platforms, see qrb5165, qrb4210, qcm6490 and other similar platforms.
> I simply asked to follow the established pattern.

Yes, we start from mobile variant for most of the platforms. There are 
some exceptions like sc7180 and sc7280 which we started from compute 
variant since they are widely used by compute platform on upstream 
Kernel. I think we have similar case here. QCS615 will be widely used by 
IOT products on upstream Kernel. We should have clarified this from 
beginning so there's no ambiguity.

> 
>>
>>>
>>>> ---
>>>>    drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>>>> index d4fa1063ea61..c56ba8468538 100644
>>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>>>> @@ -1123,6 +1123,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
>>>>           }, {
>>>>                   .compatible = "qcom,qcm2290-qmp-usb3-phy",
>>>>                   .data = &qcm2290_usb3phy_cfg,
>>>> +       }, {
>>>> +               .compatible = "qcom,qcs615-qmp-usb3-phy",
>>>> +               .data = &qcm2290_usb3phy_cfg,
>>>>           }, {
>>>>                   .compatible = "qcom,sdm660-qmp-usb3-phy",
>>>>                   .data = &sdm660_usb3phy_cfg,
>>>> --
>>>> 2.34.1
>>>>
>>>
>>>
>>
>>
>> --
>> Thanks,
>> Tingwei
> 
> 
> 


-- 
Thanks,
Tingwei

