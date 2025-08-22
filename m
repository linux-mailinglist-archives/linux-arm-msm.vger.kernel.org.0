Return-Path: <linux-arm-msm+bounces-70389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C858B31675
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 13:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9E7C7B983B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB792EF657;
	Fri, 22 Aug 2025 11:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PA0BE+25"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4627A2C029E;
	Fri, 22 Aug 2025 11:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755862772; cv=none; b=N5iycwLhDK4vHwWDelh9knmxpvByf0hJwEewHUrD3JXJLjZlxvd/f6ou1HlW2zVTev6kPL/dVPMExYU8IzZ1dHHVLQwSfdc9QQ2slrgGZWWLaMSQzG9iSHLUw08qSqzzbQqp9cp7EoA9IngGk3yQzXFJzp+WasVaRDtJS0XB+00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755862772; c=relaxed/simple;
	bh=uvNUTxYl0XwoSMHXMw1EfB7DGYUW4T7Op0LDyNvMkHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JBuTRLYOTVtizV002OeiT46xUZGQMfDEFI9IWMmFNSXuiKjke+GNnddY4VDDKsswtYmUKhv/zgvPXCJ3j9jlysWOoMe0Lc+j/GhndkUHnky//gPpnczNhmn9LbnEckqe6ohvT0vCDtdoTBOdNxBJ93kqMeLBRcRt5xVWJC6phEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PA0BE+25; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UT1Z001157;
	Fri, 22 Aug 2025 11:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	URe68+m74VE3wYAAfDXp6vPIEBqNgHCchsFwNybDTMw=; b=PA0BE+25E4zHlDjI
	dw6k83kUsW8gx9p9bI4R+fBMKHwb8jsYBOQU2Ub0iRYjZK3PEy35f88YjE35oONu
	tCabbQwt+9CKPX5wnPbeprOMhxdxMnoHqMhmLce/2yJ4zBX2UOkQNz6iBL6gDOrq
	GFG/IaYU7GMudW1YNUAd+PMjM8vjr3NzoJqhlK7DXD4uM9fryMNF7kmniOWN9GN8
	COCszUXVFIXyq7PEpV6QxWV71hFNaolLwuYvBr7X4x8op2wsYFVuroXcJvO3dcZh
	JiYIb6kxQ8+jioppS6VPm5jpDh6SL/Dp6LMGqMjsPjdsMhZx4wdQ7+nv8AYwfeau
	ByF7Kg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52992m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 11:39:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57MBdLcj009520
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 11:39:21 GMT
Received: from [10.216.22.206] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 22 Aug
 2025 04:39:18 -0700
Message-ID: <61070746-431d-4adf-9e68-7ae9646a44c9@quicinc.com>
Date: Fri, 22 Aug 2025 17:09:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/2] phy: qcom-qmp-ufs: Add regulator loads for SM8650
 and SM8750
To: Manivannan Sadhasivam <mani@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250819222832.8471-1-quic_nitirawa@quicinc.com>
 <20250819222832.8471-3-quic_nitirawa@quicinc.com>
 <ger4kizeltjwalfuwu4dpfjiskrv2okgo5c7d6n3pb24yaxgfo@nkcndblyx3il>
 <xir3u3hlmcvfu6uasijz6g2oialoasmuu4bno6ctxpscqcebz6@6kw6xpm5bxbd>
 <761c97bb-ee90-4ace-acd3-08349831aade@oss.qualcomm.com>
 <2635ced4-b91f-4c79-ae2a-079f06bbb8a9@quicinc.com>
 <pp3hr3kssytyfuuesdfrzdo6hm6e3tjlahla53mlmydetsgxdy@wmxwkatf7lvr>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <pp3hr3kssytyfuuesdfrzdo6hm6e3tjlahla53mlmydetsgxdy@wmxwkatf7lvr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5v7xh36p9XeVI0fn4RteLWNjKdl2vSH_
X-Proofpoint-ORIG-GUID: 5v7xh36p9XeVI0fn4RteLWNjKdl2vSH_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX9EuZ9Z/NdqLp
 VvVDGpm0X7MsRJ6EG1xN8EhtTsaFAIh+8hCT0c4+XUJhN3Ek7CA85CW3kEB7mCzpwp+vETeIx9d
 WNeYb9z2lzu3rplil9FJ351Md4uPAiUe0gjaDEwRxVHu6GjJzOnMjPE0hzICbBbLYtvnO0z3dh3
 i9wRGLa+9Aaoo6pLxGbmnt8cfjTcZN5WdmCl6flXk6DfV5v3u3IPw8XMGlaZYut+bSbGJvsb7Jy
 e5+AHX64kBBgbgZ4oTe90D1aDqgVMprtP2gazRrtb2qawzgZhSLjpJvLKsqt8ZW8czGkFktTzBP
 VXouk+E37EA+fNiOKmUUpFJUcLTQIfe2KcGMpq16U0F6sjR99uXLb8MSyr3cE4rtrk0zr0BeCef
 k8WNI0fl8UvIeBbdrZAvtI7cuaK+eA==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a856ea cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=GElOo5Rt_zXM7e0JAJwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 8/22/2025 4:26 PM, Manivannan Sadhasivam wrote:
> On Fri, Aug 22, 2025 at 02:53:31PM GMT, Nitin Rawat wrote:
>>
>>
>> On 8/22/2025 2:45 PM, Dmitry Baryshkov wrote:
>>> On 22/08/2025 11:53, Manivannan Sadhasivam wrote:
>>>> On Wed, Aug 20, 2025 at 03:49:31AM GMT, Dmitry Baryshkov wrote:
>>>>> On Wed, Aug 20, 2025 at 03:58:26AM +0530, Nitin Rawat wrote:
>>>>>> Add regulator load voting support for SM8650 and SM8750 platforms by
>>>>>> introducing dedicated regulator bulk data arrays with their load
>>>>>> values.
>>>>>>
>>>>>> The load requirements are:
>>>>>> - SM8650: vdda-phy (205mA), vdda-pll (17.5mA)
>>>>>> - SM8750: vdda-phy (213mA), vdda-pll (18.3mA)
>>>>>>
>>>>>> This ensures stable operation and proper power management for these
>>>>>> platforms where regulators are shared between the QMP USB PHY and
>>>>>> other IP blocks by setting appropriate regulator load
>>>>>> currents during PHY
>>>>>> operations.
>>>>>>
>>>>>> Configurations without specific load requirements will continue to work
>>>>>> unchanged, as init_load_uA remains zero-initialized when .init_load_uA
>>>>>> is not provided.
>>>>>
>>>>> Can we please get configuration for the rest of the platforms?
>>>>>
>>>>
>>>> Only if the rest of the platforms require setting the load... It is
>>>> not very
>>>> clear if the older platforms share the regulators with other IPs or not.
>>>
>>> Yes, they are usually shared. USB. PCIe and DSI frequently sit on the
>>> same voltage rails.
>>
>> Yes, it’s typically shared across multiple clients.
>>
>> However, as I mentioned earlier, in the current upstream codebase, the
>> "regulator-allow-set-load" property is defined only for SM8750 and SM8650
>> within the PMIC PHY and PLL device tree nodes. This means that even if the
>> UFS PHY driver is updated to vote for this configuration on other platforms,
>> it will have no effect, as the property is not supported there.
>>
> 
> Which means:
> 
> 1. Those platforms are still prone to this stability issue.
> 2. Only UFS is setting the regulator constraint, but not other drivers sharing
> the same regulator.

You understanding is correct.

> 
> IMO, both cases are bad. At leat, you can update the UFS driver to set the load
> now and later on add the DTS property as a follow-up series for those platforms.


sure will take care of this.>
> - Mani



> 


