Return-Path: <linux-arm-msm+bounces-49397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B7CA453D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 04:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A3D819C02BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 03:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C15122541D;
	Wed, 26 Feb 2025 03:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pEPN86dz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EAC18D626;
	Wed, 26 Feb 2025 03:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740539556; cv=none; b=YdeewpRR/f9NILIi2o7WjEaRMkDySe8I/8DhBki8DOj4yzmm7jGdwTJKvp3GwKY3/duDNtCeXUvrDrfUDju9x5XbGTIROKQzo0zOvQ4pU1/9HbboWAWGjGVfQu4sIgXlmX7feC7Savtink7FYiKCfzwQpGrbCKwRQekF3LjzgSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740539556; c=relaxed/simple;
	bh=SKtM2MG3KETATLlqcoKJRNLbIZzBAj4Jgle7llgpepU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LCeie5DWjx8Un/XZhxFdbm+EPkHP9qjPw84t1ISkupZiekWIBqZoX8wgYHiEbg2wHqt3028z3ty/Rr2M3HohUVyDgM6M0/lRyO8kkI15VlUmkz7PjQAW4UscCLEZ7/+yOsMGA8KtnAcFt5Lqvknl0ogcmoGf4EP7SQSNPCgaQWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pEPN86dz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMclDT000855;
	Wed, 26 Feb 2025 03:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKtM2MG3KETATLlqcoKJRNLbIZzBAj4Jgle7llgpepU=; b=pEPN86dzQb8UKyAM
	RHimu1AWThWE/hRyrXEQQzl0mE6p2QnacLr/X4osSs8vVLJIJDvCVErlLYgQWhyD
	P4TyOXknb3Rsb5gttEF8gA5EmoCGIwgCJ4sdc0ZnzbahyQbBjItjmtXVLIcEmetx
	ylKj8T82p++40XQURj0RgvmfUiUhL3y1iVCel5pMkz46MsI2KjaWR2p6vmzzYWkE
	s917Qe7Q6Qm1fwHQ0fmQh+MRKz0S4mGqMC+kfWeMTgJ5+YCKffLb1sDNlL6kRUWb
	Tl4+V588Q09rnCejFbyuobUhu2wGEda6O73DigC+rN2cipwNHxKsXCzmk05C+CW7
	VV9Rdw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451pu98hag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 03:12:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51Q3COxS006447
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 03:12:24 GMT
Received: from [10.239.29.178] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Feb
 2025 19:12:20 -0800
Message-ID: <47f5ab83-d25f-4132-83a6-38236575510c@quicinc.com>
Date: Wed, 26 Feb 2025 11:12:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "Wenbin Yao
 (Consultant)" <quic_wenbyao@quicinc.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <p.zabel@pengutronix.de>, <abel.vesa@linaro.org>,
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
 <4a672888-a90e-434c-b494-bb58b91c99a2@quicinc.com>
 <zppwzqdi5xbggurbqho6ivuorvlubldpjw3pyw2fdgrap4nrhp@5otsko6o5cv3>
Content-Language: en-US
From: Qiang Yu <quic_qianyu@quicinc.com>
In-Reply-To: <zppwzqdi5xbggurbqho6ivuorvlubldpjw3pyw2fdgrap4nrhp@5otsko6o5cv3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JxTPftwjFwrazOXSMYzFrhgIQ1L4FHpx
X-Proofpoint-ORIG-GUID: JxTPftwjFwrazOXSMYzFrhgIQ1L4FHpx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260023


On 2/25/2025 7:46 PM, Dmitry Baryshkov wrote:
> On Tue, Feb 25, 2025 at 06:08:03PM +0800, Qiang Yu wrote:
>> On 2/25/2025 4:17 PM, Manivannan Sadhasivam wrote:
>>> On Tue, Feb 25, 2025 at 04:06:16PM +0800, Wenbin Yao (Consultant) wrote:
>>>> On 2/24/2025 8:24 PM, Manivannan Sadhasivam wrote:
>>>>> On Mon, Feb 24, 2025 at 12:46:44PM +0100, Konrad Dybcio wrote:
>>>>>> On 24.02.2025 9:46 AM, Wenbin Yao (Consultant) wrote:
>>>>>>> On 2/24/2025 3:33 PM, Manivannan Sadhasivam wrote:
>>>>>>>> On Thu, Feb 20, 2025 at 06:22:53PM +0800, Wenbin Yao wrote:
>>>>>>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>>>>>
>>>>>>>>> Some QCOM PCIe PHYs support no_csr reset. Unlike BCR reset which resets the
>>>>>>>>> whole PHY (hardware and register), no_csr reset only resets PHY hardware
>>>>>>>>> but retains register values, which means PHY setting can be skipped during
>>>>>>>>> PHY init if PCIe link is enabled in booltloader and only no_csr is toggled
>>>>>>>>> after that.
>>>>>>>>>
>>>>>>>>> Hence, determine whether the PHY has been enabled in bootloader by
>>>>>>>>> verifying QPHY_START_CTRL register. If it's programmed and no_csr reset is
>>>>>>>>> available, skip BCR reset and PHY register setting to establish the PCIe
>>>>>>>>> link with bootloader - programmed PHY settings.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>>>>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>>>>>>>> Some nitpicks below.
>>>>>>>>
>>>>>>>>> ---
>>>>>> [...]
>>>>>>
>>>>>>>>> +     * In this way, no matter whether the PHY settings were initially
>>>>>>>>> +     * programmed by bootloader or PHY driver itself, we can reuse them
>>>>>>>> It is really possible to have bootloader not programming the init sequence for
>>>>>>>> no_csr reset platforms? The comment sounds like it is possible. But I heard the
>>>>>>>> opposite.
>>>>>>> PCIe3 on X1E80100 QCP is disabled by default in UEFI. We need to enable it
>>>>>>> manually in UEFI shell if we want.
>>>>>> IIUC this will not be a concern going forward, and this is a special case
>>>>>>
>>>>> I'm wondering how many *special* cases we may have to deal with going forward.
>>>>> Anyhow, I would propose to atleast throw an error and fail probe() if:
>>>>>
>>>>> * the platform has no_csr reset AND
>>>>> * bootloader has not initialized the PHY AND
>>>>> * there are no init sequences in the kernel
>>>>>
>>>>> - Mani
>>>> Hmmm, regardless of whether it's a special case, we can't assume that UEFI
>>>> will enable the PHY supporting no_csr reset on all platforms. It's a bit
>>>> risky. If we make such an assumption, we also won't need to check whether
>>>> the PHY is enabled by UEFI during powering on. We just need to check
>>>> whether no_csr reset is available.
>>>>
>>> I am not supportive of this assumption to be clear. While I am OK with relying
>>> on no_csr reset and bootloader programming the PHY, we should also make sure to
>>> catch if the PHY doesn't initialize it. Otherwise, the driver would assume that
>>> the PHY is working, but the users won't see any PCIe devices.
>>>
>>>> But it makes sense to check the exsitence of PHY senquence. How about
>>>> adding the check in qmp_pcie_init, if a PHY supports no_csr reset and isn't
>>>> initialized in UEFI and there is no cfg->tbls, return error and print some
>>>> error log so that the PCIe controller will fail to probe.
>>>>
>>> Sounds good to me.
>> I'm wondering is it necessary to add this check? In current PHY driver,
>> for PHY that doesn't suppot no_csr reset there is also no such check.
>> If a PHY supports no_csr reset and isn't init in UEFI and there is no
>> cfg->tbls, the worst issue is link training fail and PCIe controller will
>> also fail to probe. Adding sucj check seems not change the result.
> Failing the training is a random error which can mean a lot, e.g. the
> missing voltage rail. An explicit check is beneficial, it helps
> developers (and users) to better understand the reason of the failure.
In the struct qmp_phy_cfg, tbls is not a pointer, we can't directly check
if tbls == NULL to determine if the PHY init sequence is available. Can we
add a separate patch to change the definition from
"const struct qmp_phy_cfg_tbls tbls" to
"const struct qmp_phy_cfg_tbls *tbls" like tlbs_rc and tbls_ep, even though
this will affect all platforms?

