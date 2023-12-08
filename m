Return-Path: <linux-arm-msm+bounces-3942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F1C80A2E4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 13:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27E6D28184B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3391C283;
	Fri,  8 Dec 2023 12:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k7fdtT5E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75021199F;
	Fri,  8 Dec 2023 04:15:05 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B8BBngr009546;
	Fri, 8 Dec 2023 12:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=84Cc+cs4mWLxWjEijA/iCSxp8CdOJhiE3inczZ/76mQ=;
 b=k7fdtT5EG4riH7s+A0QqatjvRUUqbZeROdaQFblzse6o6wSZkx/jL/7tu/tpPLh9iQPj
 hphr80P1+LPiLxpf5DI5U/KjWeel33z81A+HXBJftF/2LgJXovgFwYmfNe1iOs+bhivI
 yWOQ5daehdJd1gtGP/a4t0aEIqYzxe2ERzJ93JYLRKSvZ2MMnkSl/B2+RLOtH1HsT5Af
 Lfs2soRGw4+9FWy9Y/8vRlzxpJwKehQ9CwfQ56HnmCT0zFcDSv4D6LLOvdkVWvjU6D1K
 bDimQ51Md+XefURibdbhPF7wU5Wu0yjnOocDUNTbQ3lkl4sVPyWs4Af7LSXvSWGOs7/H 1g== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uuj96j1ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 12:14:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B8CEp1j029351
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Dec 2023 12:14:51 GMT
Received: from [10.216.26.153] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 8 Dec
 2023 04:14:45 -0800
Message-ID: <516aeb55-69ad-460c-9757-6ad8a203b693@quicinc.com>
Date: Fri, 8 Dec 2023 17:44:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] usb: dwc3: qcom: Rename hs_phy_irq to
 qusb2_phy_irq
To: Johan Hovold <johan@kernel.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Conor Dooley <conor+dt@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>
References: <20231204100950.28712-1-quic_kriskura@quicinc.com>
 <20231204100950.28712-3-quic_kriskura@quicinc.com>
 <ZXHkpwji_AzXMjfm@hovoldconsulting.com>
 <9d52fa8c-41d1-46a7-be89-5c1c11ca09b4@quicinc.com>
 <ZXHz-HYgVLbgFp2k@hovoldconsulting.com>
Content-Language: en-US
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <ZXHz-HYgVLbgFp2k@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SFyHIducnV-0mN69EJA_ZT_2NW7IOWjW
X-Proofpoint-ORIG-GUID: SFyHIducnV-0mN69EJA_ZT_2NW7IOWjW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_06,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 mlxlogscore=497 malwarescore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080102



On 12/7/2023 10:04 PM, Johan Hovold wrote:
> On Thu, Dec 07, 2023 at 09:17:32PM +0530, Krishna Kurapati PSSNV wrote:
>> On 12/7/2023 8:58 PM, Johan Hovold wrote:
> 
>>> Here too you should say something about why this won't break any systems
>>> booting using an older devicetree. Specifically, the QUSB2 PHY interrupt
>>> has never been armed on any system running mainline as those bits never
>>> made it upstream.
>>>
>>> So an alternative to this could also be to just drop the QUSB2 PHY
>>> interrupt handling from this driver for now. >
> 
>> So, are you suggesting that we drop the whole patch ?
> 
> No, I meant that an alternative could be to drop the current hs_phy_irq
> handling from the driver.
> 
>> I assume if the older kernels are using old DT, they would be using an
>> old driver version too right ?
> 
> No, and this is part of the devicetree ABI as we discussed the other
> week.
> 
> You should generally be able to continue booting with an older devicetree
> on a newer kernel (even if newer functionality may not be enabled then).
> 
>> Is there a case where DT is not updated but driver is ? Because if we
>> drop this patch from series, targets with updated DT's would break.
> 
> Actually they would not due to the fact that the QUSB2 PHY interrupt is
> currently never armed in the PHY (and the interrupts are looked up by
> name and are considered optional by the driver).
> 
> But simply dropping this patch is not an option here. I'm fine with this
> patch as it is, but the reason we can merge it is that those interrupts
> are currently not actually used. Otherwise, this would break older
> devicetrees.
> 
> But this also means, we could consider dropping the current hs_phy_irq
> handling altogether.
> 
> Hmm. Looking at the qusb2_phy_runtime_suspend() again now I see that the
> interrupt is actually armed on runtime suspend, it's just that it is
> configured incorrectly and would wakeup immediately if someone ever
> exercised this path.
> 
> Specifically, the bits that would set those PHY_MODE_USB_HOST_HS modes
> (that should never have been merged) never made it upstream so this code
> is just dead code currently. I said before I'll look into ripping this
> out, but yeah, I'm swamped with work as usual (and it has been sitting
> there dead for years so there's no rush).
> 
> So to summarise, the QUSB2 wakeup handling is incomplete and broken, so
> we won't actually make things worse by renaming the interrupts. If this
> was working, we would need to continue supporting the old names, though.
> 

Thanks for the review. Since renaming the interrupts won't be an issue, 
I will keep this patch as is in that case in v3.

Regards,
Krishna,

