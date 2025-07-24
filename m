Return-Path: <linux-arm-msm+bounces-66415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD21B10101
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 08:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16916189A88B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 06:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C777D1FF5EC;
	Thu, 24 Jul 2025 06:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WbRRe7Rm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D87F9E8;
	Thu, 24 Jul 2025 06:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753339539; cv=none; b=oNOYAXU4aatfSHpnzIInnYTYJOl/S+04IW6ECOAs/0kdQ/p0H8Kj2qPV9W2O5j+xMjQngLfoxziltFdlsE7N5CtLMEQJi+fwg3sWGkgva1F7vm1GGZGyxl3XL6BwTBaCMio/N4DEuykb0aNW7dfus9kv/36XnQ8ORgE4qmslIhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753339539; c=relaxed/simple;
	bh=In2ZaHt9M+LWmQ0sSwKuoxXsnC1rS8lH2aElrRdeaQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YNp+25C4j9C0mREXPUEmUh+GTxHWQtfy3iuUoRmq6u/QIVHCRRoEdC/mMKGm4D6Q6obC9qv5bpSYb1YQ//reW/c6t+GTbsEwKxOqx0II5cIOwH8PzM5Pe8bXtXqgBtyh6Wc632dznY8SL8nPNbYqZydJbZ5JIgmAavnb3VgBdgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WbRRe7Rm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXPXQ010594;
	Thu, 24 Jul 2025 06:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+oE19LUWpup2wbKNnJtIWEuiKG44MZiibnge5c1NqQ0=; b=WbRRe7RmhSu4xDVs
	QuQf2+RFRDLCxoStGOu5CRWR3VJemOF3yR0PWzQSuf0UO5D1MzBTiyxe4r4dHo4i
	sZ/cmXMRKArnsGy182OQh+sli7iQe6ZplOjDvzbcYzbx8SETdyM03NKd/bQl9Dz7
	bbC4MdRM9WCmDh1I+Zle6YuUIshSHcIIUD3QXDxMFkuGiTlc3O/0oyCrutIsJT0Y
	6KoHtQ3F3zz80eVSMH800lrKqUb6oIG06u4kNE0I7nQx9h3GTNGP31pFkHryIuVq
	48ySOt9MMM5Gj5zEivSxUG6EjupNzIsvJQaEGxHuGAMwVKDyIhTibHA8cXoDY8r/
	CgPBjg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w8sgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 06:14:01 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56O6E00M023028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 06:14:00 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 23 Jul
 2025 23:13:58 -0700
Message-ID: <5ba35986-b65f-4558-9101-4efdf7a92033@quicinc.com>
Date: Thu, 24 Jul 2025 14:13:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable display support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250723-x1e-evk-dp-v1-1-be76ce53b9b8@quicinc.com>
 <bebf58c0-b340-4c2c-ab57-4be751d1d7b1@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <bebf58c0-b340-4c2c-ab57-4be751d1d7b1@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=6881cf29 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=6oUO4QyBuBcHVGqS9G8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA0MSBTYWx0ZWRfXyML+dQCw86gv
 hLi1HUgx6OsfIbI3hrIlc/HqMY1sgAR8XV170be0tfAwraK3YU8tIB3t72613QKyUPAwsnn++Vj
 dRMw1VW04UcNFbPejgx95ItF8RgrItH+cSGQW2TFSVi6PBfUyRi1Z83hJ+CSDnfS0T8HRCN9pAm
 qKcuDC8k2BuVvpCm8a6BvPmZTZUDie105VwA1ihIaSyLxem+juB5xZz4CwQIj+8E/9E0+QFdY9M
 yU6f2F9IfW/tG27CtEUT/7T+8vjRz1tHrSwfO1t2D+lO/OrnwZrqnn8bIEt11XG5NeiiUnL+Dir
 xZSRdsPA2A3ixUsgVSDix17M2N/zHG1MpPO7lYDL/jebHqTifrGT6qrWNwsl6iShQ6YfGjKSbZd
 JP4XLgjVJIFeLSEuIkYReFNmZQ34JZmWff9LviBNMTY1IljlzTTfjLUQ711srZa9z3pdUW7F
X-Proofpoint-ORIG-GUID: 2i_1AKeUkt0Z4NnzXvaZd7t_9T3ZvvyM
X-Proofpoint-GUID: 2i_1AKeUkt0Z4NnzXvaZd7t_9T3ZvvyM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=743 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240041



On 2025/7/23 19:38, Konrad Dybcio wrote:
> On 7/23/25 8:14 AM, Yongxing Mou wrote:
>> Enable DisplayPort support on all three USB-C ports of the
>> hamoa-iot-evk platform.
>>
>> Unlike most X1E-based boards, this platform uses FSUSB42 USB
>> switches for the USB0 Type-C port, while USB1 and USB2 rely on
>> Parade PS8830 retimers for Alt Mode switching.
>>
>> Support for the PS8830 retimers was already included in the
>> initial DTS, so this change adds support for the FSUSB42 switches.
>>
>> Due to limitations in the USB/DP combo PHY driver, DisplayPort
>> functionality is limited to 2 lanes instead of the maximum 4,
>> consistent with other X1E-based platforms.
>>
>> The platform also supports embedded DisplayPort (eDP) by default.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>> This change made top of initial DTS:
>> https://lore.kernel.org/all/20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com/
>> ---
> 
> [...]
> 
>> +	ports {
>> +		port@1 {
>> +			reg = <1>;
>> +			mdss_dp3_out: endpoint {
> 
> Please keep a \n between properties and subnodes
> 
Okay. will update next patch.
> [...]
> 
>> base-commit: 0be23810e32e6d0a17df7c0ebad895ba2c210fc4
>> change-id: 20250721-x1e-evk-dp-141e0df5593d
>> prerequisite-message-id: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
>> prerequisite-patch-id: 3c553b55d143eafc1036ce2e88df558ec61c4e83
>> prerequisite-patch-id: a4b2dabd376d32ecb159141c17113a8f3fc4ddfa
>> prerequisite-patch-id: 24bf2ada12dc10f9980ed2c56347e5b6f7964ebd
>> prerequisite-patch-id: c764e86c94055e56aaf9e701341bba52a54a998b
> 
> Having so many dependencies should raise your attention..
> 
> Konrad
Okay, will merge into initial DTS, and this will remove dependencies.


