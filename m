Return-Path: <linux-arm-msm+bounces-28498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6E0951A73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 13:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6BB32849B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 11:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75911AC43C;
	Wed, 14 Aug 2024 11:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UGiJFEib"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD2433D8;
	Wed, 14 Aug 2024 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723636593; cv=none; b=C+1Wl82Uc0mkqVBfAXV+1AIkuWN5o/uySJZELIeJbC/qVerq9b5siDCD7IjLvqa8pSuhf6tNgi5awZlDNukZNfvPy5SxRzM9MeFzvVvKQdl44dVGaBWmqVRm230gtV8mhhIIQepik4c/fBAgCQdqy66RajaxMswdzi6NzYOXiUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723636593; c=relaxed/simple;
	bh=1pcCy06X3XbMgVaEopGN1aTnxVo2DftWo39dMIi8bpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d+EwZSP5j91bE3ikSJEmdHdxh1UbTqXPwByrv/j6MZ0XYn3tGzzMNoXpBnYXN0h2dfoyuPN9mJ/+LMbP/WcoASuhHeh34oNZtKPI31tPbBXNWnTSpzouLJQrovSFdtGL/nek248Q7cVVpmF2H0f0uOoJaM7F6rJXZ1Vaa57ZqwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UGiJFEib; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47E2jNRa022989;
	Wed, 14 Aug 2024 11:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4YToA3MU1ziHG4HRyBfMBtVKHWNo6YWvtdnBJiO9td0=; b=UGiJFEibEA5HJJpy
	rqSBqC18TGSDxYSenH8UTKoscTSquiFF0gJCEiMBGfETL0yFW6uNyYwVlbjpoCFY
	ROvUH1CEbAn81Cp1U0LhmtUfQqNV3i0J9mKE3urhzyNLFainGqTncKPwL+A2ox4j
	u3S6E3SX1r5oRGrnaVllnLC99L+R8kAeMZB1jPtpHB25pHwN18Qfg52/dIQYAlRI
	deWSe5OrDQ6geLEhiZh3KozSXiR9JWQ3RrJy8lhRuhX5OdSM6ZrCSfavBAurcIvX
	hFsanySn4SQKgb3t7W1ED5w1pZ23mH/D3b9vPeHufBRJHe0VZ+F1ZMSgHlLlZaXz
	Bs3YPw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 410m291b2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 11:56:23 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47EBuMIc004657
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 11:56:22 GMT
Received: from [10.233.18.82] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 Aug
 2024 04:56:19 -0700
Message-ID: <81b60725-f744-4b40-9450-e881397c2ddf@quicinc.com>
Date: Wed, 14 Aug 2024 19:56:17 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100: Add USB Multiport
 controller
To: Konrad Dybcio <konradybcio@gmail.com>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
CC: Marijn Suijten <marijn.suijten@somainline.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Krishna
 Kurapati" <quic_kriskura@quicinc.com>,
        Konrad Dybcio
	<quic_kdybcio@quicinc.com>
References: <20240809-topic-h_mp-v1-0-3c5f468566d8@quicinc.com>
 <20240809-topic-h_mp-v1-2-3c5f468566d8@quicinc.com>
 <21fffb71-d559-4973-8028-d9c9b9f67001@quicinc.com>
 <3077d600-c570-407a-87eb-6926a67636f9@gmail.com>
Content-Language: en-US
From: Song Xue <quic_songxue@quicinc.com>
In-Reply-To: <3077d600-c570-407a-87eb-6926a67636f9@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oTIIJTPogr3mwlPBdKQRiw32Cd6K7MNm
X-Proofpoint-ORIG-GUID: oTIIJTPogr3mwlPBdKQRiw32Cd6K7MNm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_08,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140084



On 8/14/2024 6:24 PM, Konrad Dybcio wrote:
> On 14.08.2024 12:08 PM, Song Xue wrote:
>>
>> On 8/9/2024 9:18 PM, Konrad Dybcio wrote:
>>> X1E80100 has a multiport controller with 2 HS (eUSB) and 2 SS PHYs
>>> attached to it. It's commonly used for USB-A ports and internally
>>> routed devices. Configure it to support such functionality.
>>>
>>> Signed-off-by: Konrad Dybcio<konrad.dybcio@linaro.org>
>>> ---
> 
> [...]
> 
>>> +
>>> +                phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>,
>>> +                       <&usb_mp_hsphy1>, <&usb_mp_qmpphy1>;
>>> +                phy-names = "usb2-0", "usb3-0",
>>> +                        "usb2-1", "usb3-1";
>>> +                dr_mode = "host";
>>
>> Why do we add the dr_mode definition in dtsi file rather than in corresponding board dts file?  Could we follow the node "usb_1_ss1_dwc3"  in x1e80100-crd.dtsi?
> 
> That is because the MP controller is host-only and it doesn't make sense
> to ensure the OS of that in each board file separately. That's also how
> it's done on other platforms with a MP controller description.
> 
>>
>> BTW, how do we verify the function of  multiport controller？From my test on x1e80100-crd,  the eusb6 which is from usb_mp_hsphy1 attaches the third-party repeater, do we need a new repeater node/driver to verify the function of eusb6?
> 
> I have a X1E Surface Laptop 7 with a USB-A port with a NXP PTN3222 in
> front of it. Tested with a smoke test, with both SS and HS USB-A devices.
> 
What is detailed information on smoke test.
 From my end, I also have two questions.
1. I found the usb_mp_hsphy1 is using the driver "phy-qcom-snps-eusb2". 
However, the driver requires a repeater node from DT. At present, we 
don't have the node or driver for NXP repeater and it is not working on 
eusb6 to detect the NXP repeater. So, is it possible for us to have 
complete function involving with MP DT and repeater node for CRD board, 
and then we push patches together?
2. The usb_mp_dwc3 node has four phys. When enabling the driver for the 
node, we must need enable all four phys in borad's DT. Howerver, if the 
board is only using one phy like eusb6, is it suitable to enable other 
three phys?

Regards,
Song Xue
> Konrad

