Return-Path: <linux-arm-msm+bounces-1798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC6C7F6F11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 10:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC8E8B20E45
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 09:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA683D9F;
	Fri, 24 Nov 2023 09:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jmyx1TIF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9BBED48;
	Fri, 24 Nov 2023 01:01:25 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AO6ptmO020283;
	Fri, 24 Nov 2023 09:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NGnhDR7j28cFRv3LX8e9alYaea5fVnn28Lkk2JCw0Ro=;
 b=jmyx1TIFvhD0N9nyuExx9moh+eh7ubq0zO37Ern1OICymJJQWuRg4FUUHKRKmrDiLoEx
 SPijU99Q8RPKo/ZnVYU7yzy7y/sz+btbmUCOQNqtYIXQncT/dDzY34hPtDEtWQKsCyrV
 kbD6DLj8QR9cqWoFx1p3mph/IW1Dod2w+i3AaAs3MCKrNGZSrhaSyNVQkj5E+bDDGPkb
 nBTyIwNIkpveY4RdY6R0dyjm9mm+P0O08wBVrITbox5WSdnv2I+pmcgisC9D+9TZDus0
 DGzCcT9nHRV/5LQuEMLvZn7AXFICiJ6HE+C9DA4b3Lp7Z6XYI4b3SrX1Y2CGZEN1mWm1 Vw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ujptr08db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 09:01:08 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AO917Iu010147
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 09:01:07 GMT
Received: from [10.216.4.60] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 24 Nov
 2023 01:01:00 -0800
Message-ID: <4fc27dbb-b0aa-437a-a48c-9deea236282d@quicinc.com>
Date: Fri, 24 Nov 2023 14:30:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 05/10] usb: dwc3: qcom: Refactor IRQ handling in QCOM
 Glue driver
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Andy
 Gross" <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi
	<balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_pkondeti@quicinc.com>,
        <quic_ppratap@quicinc.com>, <quic_jackp@quicinc.com>,
        <ahalaney@redhat.com>, <quic_shazhuss@quicinc.com>
References: <ZTY7Lwjd3_8NlfEi@hovoldconsulting.com>
 <cabf24d0-8eea-4eb5-8205-bf7fe6017ec2@quicinc.com>
 <ZTZ-EvvbuA6HpycT@hovoldconsulting.com>
 <fb5e5e1d-520c-4cbc-adde-f30e853421a1@quicinc.com>
 <ZTdqnSHq_Jo8AuPW@hovoldconsulting.com>
 <04615205-e380-4719-aff1-f32c26004b14@quicinc.com>
 <ZUz4RD3MjnLlPn6V@hovoldconsulting.com>
 <6d4d959c-b155-471b-b13d-f6fda557cfe0@quicinc.com>
 <ZVYTFi3Jnnljl48L@hovoldconsulting.com>
 <e0789695-43ee-4285-95e9-4cdee24d6ffe@quicinc.com>
 <ZV9XTU-q038BaWn3@hovoldconsulting.com>
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <ZV9XTU-q038BaWn3@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dhiMc7KSABAEms8HT0fsRkfLLl9S9wUb
X-Proofpoint-GUID: dhiMc7KSABAEms8HT0fsRkfLLl9S9wUb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_15,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxlogscore=546 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311240070

> 
>> I didn't add missing interrupts on sc8280xp because I see that current
>> interrupts present are working fine (I see ADB working and wakeup
>> working as well), but the interrupt vector numbers are off by "1"
>> between hs specifics and DT (both upstream and downstream). Will sort it
>> out and clean that target up later.
> 
> Which interrupt numbers are off by one here?
>   

My bad, this might be the confusion. The HW specifics say:

Controller-2, power_event irq:

SYS_apcsQgicSPI[812]		Vector-number: 843


Usually vector number = 32 + GIC number AFAIK.
By that logic, If vector number is 843, GIC_SPI number is 811 which is 
same as DT. Probably the GIC_SPI number is printed wrong. The DT matches 
(vector number - 32).

Sorry for mentioning that it is wrong. The DT entries are right and it 
is working on upstream.

The missing hs_phy_irq's have been put on the mail thread on this list 
before.

Regards,
Krishna,

>> [1]: https://patchwork.kernel.org/project/linux-arm-msm/list/?series=803412
> 
> I took a quick look at the series, and it looks like this will
> eventually clean things up a lot. We should probably define a generic
> order for the interrupts with the sometimes optional SS interrupts last.
> 
> Side note: It looks like the threading in that series is broken.
> Consider using git-send-email for sending series as it takes care of
> things like that.
> 

Usually I do git send-email for the whole out folder where the patches 
are present, but linux-usb list is common to all the patches in that 
case, even the DT ones. So to avoid that and to send patches to only 
relavant mailing lists, I did git send email individually on each patch 
which might have caused this issue.

Will make sure this won't happen again.

Regards,
Krishna,


