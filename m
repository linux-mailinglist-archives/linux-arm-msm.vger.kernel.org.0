Return-Path: <linux-arm-msm+bounces-442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 116D47E7AE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 10:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B5B11F20D3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 09:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3EC012B68;
	Fri, 10 Nov 2023 09:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dIIYD+yc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD4112B6B
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 09:32:39 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C182449C;
	Fri, 10 Nov 2023 01:32:37 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AA7gVJO023963;
	Fri, 10 Nov 2023 09:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=J8CUOcVNtXMG+Wdf+AgFdvrZxjQP6WHf4jYZkMvKEJo=;
 b=dIIYD+yc6YgAoOeHmHE6IvO8hiHFTijJRqXz9B3u0o5mrL91GcALQYnxpt1uE0+k51/e
 6A62aAhYyhdoU2q0nekhpV8rdcbekfEIV0pLKdujiTj9xtgXfZDqdfQGxUUfbR7d2v4n
 knfuxS5ZiPG45mPaXEUnwZGOFcgxV9FaA3i4T4anRGBXkHfhO2J0hPcGqpy5aNneX4C+
 sAljy3ODnH4B6GAIOD73DPfCEAotYu2J/YS+47GIx3CjCs9PHDEiN7WT0A82h6pfq9OO
 QoNLI/GCyne6LZEyVyDKgarmG0yGWnIEHHepKHfDq7xAspKQ9LUERsL93UuXzKJ4Fg// 3Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u8u2tuam2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 09:32:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AA9WIam010698
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 09:32:18 GMT
Received: from [10.253.32.19] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 10 Nov
 2023 01:32:13 -0800
Message-ID: <44554283-8436-2208-ab75-3e61d89dc96b@quicinc.com>
Date: Fri, 10 Nov 2023 17:32:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 6/7] phy: qualcomm: phy-qcom-qmp-ufs: Add High Speed
 Gear 5 support for SM8550
To: <neil.armstrong@linaro.org>, Can Guo <cang@qti.qualcomm.com>,
        <bvanassche@acm.org>, <mani@kernel.org>, <stanley.chu@mediatek.com>,
        <adrian.hunter@intel.com>, <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <junwoo80.lee@samsung.com>, <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "open
 list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
        open list
	<linux-kernel@vger.kernel.org>
References: <1699332374-9324-1-git-send-email-cang@qti.qualcomm.com>
 <1699332374-9324-7-git-send-email-cang@qti.qualcomm.com>
 <e4bafeaf-bbeb-4990-b6f2-497159995910@linaro.org>
 <c3fb1fa1-4ba6-613f-a545-79e0e4b2658f@quicinc.com>
 <10cbb859-bdbf-4763-9887-fa13003b58cd@linaro.org>
Content-Language: en-US
From: Can Guo <quic_cang@quicinc.com>
In-Reply-To: <10cbb859-bdbf-4763-9887-fa13003b58cd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pXi8uldaBjguBnCF2HeH4Bcf9NAS3uqM
X-Proofpoint-GUID: pXi8uldaBjguBnCF2HeH4Bcf9NAS3uqM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_06,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=849 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311100077

Hi Neil,

On 11/10/2023 5:17 PM, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 10/11/2023 10:03, Can Guo wrote:
>> Hi Neil,
>>
>> On 11/10/2023 4:47 PM, neil.armstrong@linaro.org wrote:
>>> Hi,
>>>
>>> On 07/11/2023 05:46, Can Guo wrote:
>>>> From: Can Guo <quic_cang@quicinc.com>
>>>>
>>>> On SM8550, two sets of UFS PHY settings are provided, one set is to 
>>>> support
>>>> HS-G5, another set is to support HS-G4 and lower gears. The two sets 
>>>> of PHY
>>>> settings are programming different values to different registers, 
>>>> mixing
>>>> the two sets and/or overwriting one set with another set is 
>>>> definitely not
>>>> blessed by UFS PHY designers. In order to add HS-G5 support for 
>>>> SM8550, we
>>>> need to split the two sets into their dedicated tables, and leave 
>>>> only the
>>>> common settings in the .tlbs. To have the PHY programmed with the 
>>>> correct
>>>> set of PHY settings, the submode passed to PHY driver must be either 
>>>> HS-G4
>>>> or HS-G5.
>>>
>>> I guess I'll need to rebase my SM8650 UFS PHY driver to support both 
>>> G4 and G5 modes
>>> at some point ?
>>
>>
>> Thank for reaching out. Yes, please.
>>
>> I can help review the PHY settings.
> 
> Ok I'll try rebasing on this serie and add G5 support.
> 
>>
>> BTW, are you enabling MCQ (by adding MCQ related DT) at the same time?
> 
> I tested MCQ but it triggers the same issues we have with suspend/resume 
> on SM8550 & SM8650,
> and the bindings are not present of the UFS qcom node.

Are you talking about suspend/resume fail with rpm/spm_lvl == 5? If yes, 
then Nitin and Naveen are working on fixing it.

If you have plan to enable UFS MCQ on SM8650 later, please let me know, 
I have some BUG fixes for it, we can co-work.

Thanks,
Can Guo

> 
> Neil
> 
>>
>> Thanks,
>> Can Guo.
>>
>>>
>>> Neil
>>>
> 

