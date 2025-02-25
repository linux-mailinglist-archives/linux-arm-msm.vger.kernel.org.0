Return-Path: <linux-arm-msm+bounces-49270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BB6A43B10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 11:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABC4F1749D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E48266F0B;
	Tue, 25 Feb 2025 10:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gvfi2A0i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E827626561F;
	Tue, 25 Feb 2025 10:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478116; cv=none; b=n/shZDFIP55ltiGcMresnJlqijLu9altQYeiu4Mx7N5USql8f4vgR4SYG9nIwApuvXUjKXkGffXHKjjbrEKpmzqVe9N9b6tQfY76naD4anYZmF8XZKjACe/Rc3CUYe/HW4wnKCsKjuVjmSBbggMl5XYn173RAJSgYSOt4qLFtaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478116; c=relaxed/simple;
	bh=uxyH/J7gXdAxPYjVH0HuLVYnTB8wRvjhOGdiitz2mmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ko5mFYYaMOg2FKeGesOXOvu7AydiRkAA15HfUeYVHqeXz3ccchOW6tR33zUTlv+6pIEbgwxTRHwidY7jV4XHOW8kHHRtiNi0FWRVJaGrLRMhUkvWLqGB6O8bihxHT8LEOGHPycRZxPXFeV31LoEWbJLGWi0VFMTa0xv2JxYWwS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Gvfi2A0i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8K7HU009785;
	Tue, 25 Feb 2025 10:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uxyH/J7gXdAxPYjVH0HuLVYnTB8wRvjhOGdiitz2mmw=; b=Gvfi2A0iZ/d4h9m3
	WJ+anG/SyAv+4NzPnMwcRt2ypg/olAVeuFP0Iu++c4QBB4BQseL4yMSoQToSTyO1
	QSX3n+WNLHWMHo8SIfTlmvIVHXzdvvM4Z9aoV4n2zhvtCz4a5hHWuEnHjmASUvAN
	nv/c9ZJNSZBx4BVa/aqNZnDDPBiU3ABdtVmUnVA0RilyxpifMRHyl1aeEly+EAnJ
	d8XHG38Un6GCONgxAga40MTiewW8qNLeB4OzumFtcR1zQ0Tiwh+ew50pYb1ibNg3
	m3CvgjnWieU3Z9eRXGXVwWk4YkfTPKi+mZEiZZvgCmBhmkQbzrq3eYZoeHu/7dJg
	tq7OIQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y3xngpuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 10:08:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51PA8L4Y025087
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 10:08:21 GMT
Received: from [10.239.29.178] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Feb
 2025 02:08:18 -0800
Message-ID: <4a672888-a90e-434c-b494-bb58b91c99a2@quicinc.com>
Date: Tue, 25 Feb 2025 18:08:03 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "Wenbin Yao
 (Consultant)" <quic_wenbyao@quicinc.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <p.zabel@pengutronix.de>,
        <dmitry.baryshkov@linaro.org>, <abel.vesa@linaro.org>,
        <neil.armstrong@linaro.org>, <quic_devipriy@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250220102253.755116-1-quic_wenbyao@quicinc.com>
 <20250220102253.755116-3-quic_wenbyao@quicinc.com>
 <20250224073301.aqbw3gxjnupbejfy@thinkpad>
 <7ffb09cd-9c77-4407-9087-3e789cd8bf44@quicinc.com>
 <ea5de507-1252-4ff3-9b18-40981624afea@oss.qualcomm.com>
 <20250224122439.njrcoyrfsisddoer@thinkpad>
 <eea55dfa-3dd3-488b-958c-cd20e18a7d7d@quicinc.com>
 <20250225081744.3aprpztylrdgs2cl@thinkpad>
Content-Language: en-US
From: Qiang Yu <quic_qianyu@quicinc.com>
In-Reply-To: <20250225081744.3aprpztylrdgs2cl@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pZOfpuD-SAPKU2o1hVWkVVh2d7ArKmx9
X-Proofpoint-GUID: pZOfpuD-SAPKU2o1hVWkVVh2d7ArKmx9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502250070


On 2/25/2025 4:17 PM, Manivannan Sadhasivam wrote:
> On Tue, Feb 25, 2025 at 04:06:16PM +0800, Wenbin Yao (Consultant) wrote:
>> On 2/24/2025 8:24 PM, Manivannan Sadhasivam wrote:
>>> On Mon, Feb 24, 2025 at 12:46:44PM +0100, Konrad Dybcio wrote:
>>>> On 24.02.2025 9:46 AM, Wenbin Yao (Consultant) wrote:
>>>>> On 2/24/2025 3:33 PM, Manivannan Sadhasivam wrote:
>>>>>> On Thu, Feb 20, 2025 at 06:22:53PM +0800, Wenbin Yao wrote:
>>>>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>>>
>>>>>>> Some QCOM PCIe PHYs support no_csr reset. Unlike BCR reset which resets the
>>>>>>> whole PHY (hardware and register), no_csr reset only resets PHY hardware
>>>>>>> but retains register values, which means PHY setting can be skipped during
>>>>>>> PHY init if PCIe link is enabled in booltloader and only no_csr is toggled
>>>>>>> after that.
>>>>>>>
>>>>>>> Hence, determine whether the PHY has been enabled in bootloader by
>>>>>>> verifying QPHY_START_CTRL register. If it's programmed and no_csr reset is
>>>>>>> available, skip BCR reset and PHY register setting to establish the PCIe
>>>>>>> link with bootloader - programmed PHY settings.
>>>>>>>
>>>>>>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>>>>>> Some nitpicks below.
>>>>>>
>>>>>>> ---
>>>> [...]
>>>>
>>>>>>> +     * In this way, no matter whether the PHY settings were initially
>>>>>>> +     * programmed by bootloader or PHY driver itself, we can reuse them
>>>>>> It is really possible to have bootloader not programming the init sequence for
>>>>>> no_csr reset platforms? The comment sounds like it is possible. But I heard the
>>>>>> opposite.
>>>>> PCIe3 on X1E80100 QCP is disabled by default in UEFI. We need to enable it
>>>>> manually in UEFI shell if we want.
>>>> IIUC this will not be a concern going forward, and this is a special case
>>>>
>>> I'm wondering how many *special* cases we may have to deal with going forward.
>>> Anyhow, I would propose to atleast throw an error and fail probe() if:
>>>
>>> * the platform has no_csr reset AND
>>> * bootloader has not initialized the PHY AND
>>> * there are no init sequences in the kernel
>>>
>>> - Mani
>> Hmmm, regardless of whether it's a special case, we can't assume that UEFI
>> will enable the PHY supporting no_csr reset on all platforms. It's a bit
>> risky. If we make such an assumption, we also won't need to check whether
>> the PHY is enabled by UEFI during powering on. We just need to check
>> whether no_csr reset is available.
>>
> I am not supportive of this assumption to be clear. While I am OK with relying
> on no_csr reset and bootloader programming the PHY, we should also make sure to
> catch if the PHY doesn't initialize it. Otherwise, the driver would assume that
> the PHY is working, but the users won't see any PCIe devices.
>
>> But it makes sense to check the exsitence of PHY senquence. How about
>> adding the check in qmp_pcie_init, if a PHY supports no_csr reset and isn't
>> initialized in UEFI and there is no cfg->tbls, return error and print some
>> error log so that the PCIe controller will fail to probe.
>>
> Sounds good to me.
I'm wondering is it necessary to add this check? In current PHY driver,
for PHY that doesn't suppot no_csr reset there is also no such check.
If a PHY supports no_csr reset and isn't init in UEFI and there is no
cfg->tbls, the worst issue is link training fail and PCIe controller will
also fail to probe. Adding sucj check seems not change the result.

Thanks,
Qiang
>
> - Mani
>

