Return-Path: <linux-arm-msm+bounces-39507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 064139DBE94
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 03:13:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2A301636A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 02:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D9F14B08E;
	Fri, 29 Nov 2024 02:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iBdWL6Gn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6593313B7A3;
	Fri, 29 Nov 2024 02:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732846434; cv=none; b=lYsGSVXvKg+XdxQoH3yDDCO+p+0vNoTP09SuMvveqSvkQqprSayMBVU0mrathxBXiz5ARqDAq9vd2wHI+7eFxhM7/R38ScpkL17gIu2Cs+aV/GN2mWoOGXcPeVW0OgQfH9mUcGCVrzQAfR+GdBlAnmfH2GH60l8EuV3HZzPrsmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732846434; c=relaxed/simple;
	bh=jsc202lH658qj7m+xDwtTzBdXlWrhCTp6QUe0tRE8ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nH8Esw6Z8BBvCmtzjC4i1Hu94n6cGxI2uIhPXp5Kvh0q+Jr9+H9e2E4Rl6OjAOa1wy9fwDYq+KGQFgtpes6xbCqiHC2w1ghfwmYnFEmbhh1wd/IdvBYbZ2cTeMSrWFbC15uWlakuro8SRVt5rSHKVXV/FOfTeoBMt+F/ESSPlKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iBdWL6Gn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASMP2Uh008881;
	Fri, 29 Nov 2024 02:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KdWZJrSmE34lrf8qJjSprIDOwg++Dhz+LXVBGkm8CrM=; b=iBdWL6GnDOFsHBHF
	CjfXIX8y4iszWlOwD9gAtv/5LyLvL4PImdoFLVA9uoTq1tMohX5UMRjfJLTl/6vR
	lQQqgtQtJ2Hn8zE8z5VAmv8qXsOCrmR/5/9n4ibaIyi24lRlKCLfuou6pFHc+yoi
	Yq2spZg93h+iVdqIDwOXlEr/F1m/qTfraUZZW6Tlu1yYUV7xhoqzewxAuiyLpzr8
	+O+ffzIklklVYr8nl1ry6tkFdIRB9jcD7CCP7/oPfm/JP3ts7VQWbQ7/0RR8kvj4
	HxfG22FXfwvesppw7xnBPfZbq4kv3v9clOhHMX+Np9HuFEATY2wnFYkXR9cFmYre
	9fa0Sw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xy43gr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 02:13:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT2Dkv9025078
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 02:13:46 GMT
Received: from [10.239.28.11] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 28 Nov
 2024 18:13:42 -0800
Message-ID: <1117756e-a548-4e9d-9e91-116bec43fd2e@quicinc.com>
Date: Fri, 29 Nov 2024 10:13:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] dt-bindings: net: Add QCA6698 Bluetooth
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Marcel Holtmann
	<marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Balakrishna Godavarthi
	<quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
CC: <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20241128120922.3518582-1-quic_chejiang@quicinc.com>
 <20241128120922.3518582-3-quic_chejiang@quicinc.com>
 <bd4cb046-f0c1-4044-897c-00f30c6e84d2@kernel.org>
 <ca1dbeee-c61f-4309-ae4e-a599b4c245d5@kernel.org>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <ca1dbeee-c61f-4309-ae4e-a599b4c245d5@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iR_-IPNxRIrxYvzJ_pAHHeLmWIrnVROe
X-Proofpoint-ORIG-GUID: iR_-IPNxRIrxYvzJ_pAHHeLmWIrnVROe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411290016

Hi Krzysztof,

On 11/28/2024 10:41 PM, Krzysztof Kozlowski wrote:
> On 28/11/2024 15:41, Krzysztof Kozlowski wrote:
>> On 28/11/2024 13:09, Cheng Jiang wrote:
>>> Add the compatible for the Bluetooth part of the Qualcomm QCA6698 chipset.
>>
>> <form letter>
>> This is a friendly reminder during the review process.
>>
>> It seems my or other reviewer's previous comments were not fully
>> addressed. Maybe the feedback got lost between the quotes, maybe you
>> just forgot to apply it. Please go back to the previous discussion and
>> either implement all requested changes or keep discussing them.
>>
>> Thank you.
>> </form letter>
>>
>> Respond to the comment and then implement it.
>>
>> Also, version your patches correct and provide changelog. This is v2,
>> not v1.
> 
> Wait, no, it's even v3 or v4. You just ask us to the same work twice,
> don't you?
Sorry for this. So the version number should be increased even 
solution/implementation is changed? Will follow the rule.  
> 
> Best regards,
> Krzysztof


