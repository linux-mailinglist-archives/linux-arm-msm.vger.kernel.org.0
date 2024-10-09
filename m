Return-Path: <linux-arm-msm+bounces-33626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C43D996106
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 09:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFA091C21B31
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 07:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC55B17E010;
	Wed,  9 Oct 2024 07:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Bd8c4SpO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F72E84E18;
	Wed,  9 Oct 2024 07:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728459552; cv=none; b=JW4Ps1yKb81QZCNF8Bp1YMIIeGAqQnvfAP++yU7yN8nXaaJawJCThUh87VcgcJc+8mGL1qcGrbJflwb/4kYutrEqG1RhZHUyFS5U+GBBtRCiacNXKKhvm8Nn32NEuAZ34IprIg3kkhM4yEsFvl82+Nx5Pmjm9Tn624f0DkZCEpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728459552; c=relaxed/simple;
	bh=BOTh+SM9Mx8xc69ATKWV5J5h+ivzwBN4pcInFOnwbBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZIE6dRJBsnfcXhpK9GzpQQaHDebbbzFrnIDyAXiz9sdpxLB5RUk8BvJLQZ5jjKodEgV8Sicdq1zEJiNljmder7QMEjB+qbf57WGnGg9ZfTU/tfOyNMQdkkIMHX62nJ7o8OcVdlIEurPu+lG5+YCxRifgk87Cyj9v2EZ4wN9iUHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Bd8c4SpO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4995C0hO001017;
	Wed, 9 Oct 2024 07:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	an3ZLA/8YORWgwvKtRb94EOa+uQ0Kp7b3RNblvUzcAg=; b=Bd8c4SpOBxhV6/zm
	tvGKNKZBTLtbFGnLF+F0Tu6WyDfCXosUHJHwau0XdOrIHdT0dF3+vrQAPIMeM+54
	n90PmC1zBxpRVO2HaJlwkJYKHgNnTlGhQucYAi8xPLfXCnr563ELlxvYXZd91fke
	eVdMzy5pRI9nbh5koPYAZafJjO1+UxK6tCptxbRDc5TAzuecYH3T1G5Lw71Np9jS
	xgnYlSc0twvqNMxkWlDUR5Js9Rk71NlCukXH3FD8wCaqDTAo5jTcLpsHXnKogfVm
	qMKO9DH1uitYc/45aQpvXXtk/Kbi6jM3h6t3w7x2wtW2/u8FNQ2xWuLA1lKVKCm2
	l9Agxg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424wgs3xg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 07:38:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4997cjAL003184
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 07:38:45 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 00:38:37 -0700
Message-ID: <158872a1-abcf-472f-bfa7-3f330d3c56e4@quicinc.com>
Date: Wed, 9 Oct 2024 13:08:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 7/7] arm64: defconfig: Build NSS Clock Controller
 driver for IPQ9574
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Devi Priya <quic_devipriy@quicinc.com>, <andersson@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <p.zabel@pengutronix.de>,
        <richardcochran@gmail.com>, <geert+renesas@glider.be>,
        <neil.armstrong@linaro.org>, <arnd@arndb.de>,
        <m.szyprowski@samsung.com>, <nfraprado@collabora.com>,
        <u-kumar1@ti.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <netdev@vger.kernel.org>, <konraddybico@kernel.org>
References: <20240626143302.810632-1-quic_devipriy@quicinc.com>
 <20240626143302.810632-8-quic_devipriy@quicinc.com>
 <rlqrgopsormclb7indayxgv54cnb3ukitfoed62rep3r6dn6qh@cllnbscbcidx>
 <134665ba-8516-4bca-9a56-9a5bbfa71705@quicinc.com>
 <kfmn6pixbrhaagll56z3ug7bfqrp6f47rd4m6qo6bidu3dfcew@r26q6aabut54>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <kfmn6pixbrhaagll56z3ug7bfqrp6f47rd4m6qo6bidu3dfcew@r26q6aabut54>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AGt1Lo6XjnbRb7phW0j0UD9H90UE21tj
X-Proofpoint-ORIG-GUID: AGt1Lo6XjnbRb7phW0j0UD9H90UE21tj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=772
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1011 adultscore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090049



On 10/6/2024 10:13 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 04, 2024 at 01:26:27PM GMT, Manikanta Mylavarapu wrote:
>>
>>
>> On 6/26/2024 11:44 PM, Dmitry Baryshkov wrote:
>>> On Wed, Jun 26, 2024 at 08:03:02PM GMT, Devi Priya wrote:
>>>> NSSCC driver is needed to enable the ethernet interfaces and not
>>>> necessary for the bootup of the SoC, hence build it as a module.
>>>
>>> It is used on this-and-that device.
>>>
>>
>> Hi Dmitry,
>>
>> Sorry for the delayed response.
>>
>> NSSCC driver is needed to enable the ethernet interfaces present
>> in RDP433 based on IPQ9574. Since this is not necessary for bootup
>> enabling it as a module.
> 
> Commit message, please.
> 
Hi Dmitry,

Okay, sure.

Thanks & Regards,
Manikanta.

