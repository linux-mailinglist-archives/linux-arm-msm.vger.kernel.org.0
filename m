Return-Path: <linux-arm-msm+bounces-2432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 814E97FD59E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 12:27:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20AF11F20FA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 11:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F4A1C6BA;
	Wed, 29 Nov 2023 11:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BexiC6xL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 325121BCB;
	Wed, 29 Nov 2023 03:27:33 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT6TT0G029911;
	Wed, 29 Nov 2023 11:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=yP8eKcgfAElCvOmXHkr60HKJJdtU1JjT7uWox8Q0nPQ=;
 b=BexiC6xL1H6UvTI3zgKcZvPfulV9ZOiglfaveRMtCc+lrgOesUu+uM8jJI9x9fJshxRy
 fgVR8cnfHYfLofTBT3r9UwSwZLI1bm3MxcuIdaob40K6em5Uhvy7am1Ckq7tAj4iSxZg
 U+BPkoX820N/s4O+Srlj3UVnYOzbFWNgUgVYW2sQiO1bI8zyI7AuoYV20BnHZyyggqH5
 rVA2YObE7vXvyc54y6oSFnkl9mr/DlTMF5xM/b+hZZzo8h/oIgCN7+k+q6qEK1+VrbzS
 CXyTnK78OiRlPjDJrMjBuH573ztFELgDfF6U6UnKAu8noZQz5ffO+EqWKWCbObWQK08W yQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3up02xrr09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 11:27:06 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ATBR4Iq029105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 11:27:04 GMT
Received: from [10.218.17.183] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 29 Nov
 2023 03:26:57 -0800
Message-ID: <474a8942-e22f-4899-acb9-f794d01fdfe9@quicinc.com>
Date: Wed, 29 Nov 2023 16:56:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: update Rx clk divider for 10M SGMII
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu
	<joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>
References: <20231124050818.1221-1-quic_snehshah@quicinc.com>
 <ZWBo5EKjkffNOqkQ@shell.armlinux.org.uk>
 <47c9eb95-ff6a-4432-a7ef-1f3ebf6f593f@quicinc.com>
 <ZWRVz05Gb4oALDnf@shell.armlinux.org.uk>
 <3bf6f666-b58a-460f-88f5-ad8ec08bfbbc@quicinc.com>
 <ZWRp3pVv0DNsPMT7@shell.armlinux.org.uk>
From: Sneh Shah <quic_snehshah@quicinc.com>
In-Reply-To: <ZWRp3pVv0DNsPMT7@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ihd05gQVYWQ5L930kHs45XYlLcwDm_lx
X-Proofpoint-GUID: Ihd05gQVYWQ5L930kHs45XYlLcwDm_lx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_09,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=668 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311290085



On 11/27/2023 3:35 PM, Russell King (Oracle) wrote:
> On Mon, Nov 27, 2023 at 03:17:20PM +0530, Sneh Shah wrote:
>> On 11/27/2023 2:09 PM, Russell King (Oracle) wrote:
>>> On Mon, Nov 27, 2023 at 11:25:34AM +0530, Sneh Shah wrote:
>>>> On 11/24/2023 2:42 PM, Russell King (Oracle) wrote:
>>>>> The next concern I have is that you're only doing this for SPEED_10.
>>>>> If it needs to be programmed for SPEED_10 to work, and not any of the
>>>>> other speeds, isn't this something that can be done at initialisation
>>>>> time? If it has to be done depending on the speed, then don't you need
>>>>> to do this for each speed with an appropriate value?
>>>>
>>>> This field programming is required only for 10M speed in for SGMII mode. other speeds are agnostic to this field. Hence we are programming it always when SGMII link comes up in 10M mode. init driver data for ethqos is common for sgmii and rgmii. As this fix is specific to SGMII we can't add this to init driver data.
>>>
>>> I wasn't referring to adding it to driver data. I was asking whether it
>>> could be done in the initialisation path.
>>>
>> No, IOMACRO block is configured post phylink up regardless of RGMII or SGMII mode. We are not updating them at driver initialization time itself.
> 
> What reason (in terms of the hardware) requires you to do this every
> time you select 10M speed? Does the hardware change the value in the
> register?
> 
Yes, the hardware changes the value in register every time the interface is toggled. That is the reason we have ethqos_configure_sgmii function to configure registers whenever there is link activity.

