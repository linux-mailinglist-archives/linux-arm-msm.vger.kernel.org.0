Return-Path: <linux-arm-msm+bounces-36133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D159B2ABB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 09:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E32E1B2186D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 08:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52039192B6D;
	Mon, 28 Oct 2024 08:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ib0UXH09"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD27155C97;
	Mon, 28 Oct 2024 08:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730105348; cv=none; b=pZjCa3IdbOkZw7GiOsVtBkkuP2pk4bnCJmLuG8GNmzUoY1Ku0adBgNdEIz8t4dvw0CpxpeBK+ZbyzaySdOlsC3M4jmc8aTI8zxEpXasMYvC5j3qpbQM7Zvtwk2GyuGwrQbrUy7Kt3ZedODJJJohrrUkE2pLMQRuQ3TQa+TBuw7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730105348; c=relaxed/simple;
	bh=7PxgSw/akMYko5SyYsxZgA7NTgKLgY5bKlaq0CJ//0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YUiBrM5py5aDCUppCW95dJeBnw5BOD9tPBkVXc2gHiDnJVm6hopogVQwcvTbRFTvpZQ7Z4IvgPgAtj8HlAUYmcAHWZPbfqidZnTQwCdAxD+zr/9RzrZnRJ7Z9VDWyKay31UBWjdqDyJtKDxBcMs7p2I4KvOgfr/rsS+d2ka33hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ib0UXH09; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49S0lxfd012773;
	Mon, 28 Oct 2024 08:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xnfsDLfAcy0xs+Ib+1LXqGkoNQEutpdNsJyjqT4hOUg=; b=ib0UXH09/wfo9CFW
	6TPTjHluLyBmbML9cVmIX0syXX40kyzM6xnnTF0fxtVjDgiCAtL+ZAWNZnfj72Ms
	LzRIzjXfhAZHEiVUECd6+ohgCTRuI4ND6So8IwXn4ya1LnFUs4jj1rPr3U0N5/hC
	NvQPAmcUM+5r94avoY63+O5IXCzK2s2RWBSAP/XdWTpR/a/fBpT1mrs1QOJnwNWr
	9YBl43gm5ug6ip6mdVy7VdE7VAbkNLCpPFFgdIaYbyI8cWAAwSKdsQlqN4knq24B
	rgA6PuhLTcbb6w0W5J+QmzduNVdauY9ZqNqbYufXw7vq4W/Byo0YE/gf1vfwIi3V
	U21PtQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grguc7cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 08:48:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S8mwv5027185
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 08:48:58 GMT
Received: from [10.204.67.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Oct
 2024 01:48:54 -0700
Message-ID: <e7543055-316e-447e-ab0e-15d2fdd19dca@quicinc.com>
Date: Mon, 28 Oct 2024 14:18:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8775p-ride: Enable Display
 Port
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_riteshk@quicinc.com>,
        <quic_vproddut@quicinc.com>, <quic_abhinavk@quicinc.com>
References: <20241008112516.17702-1-quic_mukhopad@quicinc.com>
 <20241008112516.17702-3-quic_mukhopad@quicinc.com>
 <zluuezrywecffsh3f7yzrtvd2sa3nyzl52sk6bluvjch5icvuu@noecozosseko>
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
In-Reply-To: <zluuezrywecffsh3f7yzrtvd2sa3nyzl52sk6bluvjch5icvuu@noecozosseko>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YIEaWtOzvrYn677-lv3od6rHeh-hUsEN
X-Proofpoint-GUID: YIEaWtOzvrYn677-lv3od6rHeh-hUsEN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=755 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410280071


On 10/8/2024 5:46 PM, Dmitry Baryshkov wrote:
> On Tue, Oct 08, 2024 at 04:55:16PM GMT, Soutrik Mukhopadhyay wrote:
>> Enable DPTX0 and DPTX1 along with their corresponding PHYs for
>> sa8775p-ride platform.
> What is connected to those DP lanes? If they are routed directly to the
> DisplayPort connectors, please add corresponding devices (see
> dp-connector).


We are defining the functionality of gpio101 and gpio102 as "edp0_hot" 
and "edp1_hot"

respectively. This ensures that the hot plug will be directly routed via 
the display interrupt

line "mdss0" to the display port driver and no external dependencies on 
dp-connector is

necessary.


>   
>> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 54 ++++++++++++++++++++++
>>   1 file changed, 54 insertions(+)
>>
>>

