Return-Path: <linux-arm-msm+bounces-59504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0ABAC4C48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 12:33:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73BFA16F101
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 10:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB33254841;
	Tue, 27 May 2025 10:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PJVpHPoG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400604315C;
	Tue, 27 May 2025 10:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748341987; cv=none; b=WMMo5OWWqKkU2qebvgh6h9Yoe5kowGBCPHEVCN7QpeiIQVdm4uJgGyc509UX9PXkpMfqVtQeEEjfW1xLOQd/eL83APn0OtowMGsmPysYCxLC90qnVhWDh6NwTveOppZ8pKnhcuu+0JHpM+fbsAkYgLzc6XZixIQv3582Yl0psd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748341987; c=relaxed/simple;
	bh=W731lq2hAxGG3qCtBDK9muoJsvSSgaxCULo/YjfoJXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TQ0BIIT90AyLzPQHymWjZk7DhaeNOnz+VB2EVmm6+zAIJdpxXH3J9obkBicES1RK4n8I4UpDp8sd2ZwdsL0O5eBSpeT1/C2kS3VArwV0KmYHvM7nemilwa6MTJOSsU/B3RTOis4qrNieW1lLrU4djh+ABui0conLoKM8vFqlhZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PJVpHPoG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R9U6Th003119;
	Tue, 27 May 2025 10:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8PfENmK9mIOVXA783yNGP60xEHgJgkgaI/jMIZJy+nY=; b=PJVpHPoG+046Lz6t
	Jed/LpeS4fWYI0Cn1O/EU4hL2I0VvrCjco1XvyqDCzj2XdBqHTjU863Uf9o8+IkR
	dl8fSdT0LjhuwTKS4z1O8gKls/S9L6qZJS9n41xaKgyd3X/P7yFR2l2oQH1hPNNP
	piVPexGl9dM+plUTwaf+t6LtQQywOibzay7sKluwDyzWc5+ipBrJS4AFp1bF/Umj
	X+O/s46pfaZ58Pw0u4yLjAInfkJBCO1ZVGp0ob3Fd/HrvSbHP15qbfgZ+eDwc5Jz
	zJGVoyHylW46MzBm7BbE3uBz96IoWnsmSFi5btYFx1jJovl7NHep9SVH/W5k37Iz
	LVhIkw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6b5pktc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 10:33:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54RAX29Y021986
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 10:33:02 GMT
Received: from [10.133.33.76] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 27 May
 2025 03:32:59 -0700
Message-ID: <9a156925-cf7b-4d2e-88a8-fdfed5528553@quicinc.com>
Date: Tue, 27 May 2025 18:32:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: disable the CTI device of the
 camera block
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Gan
	<jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250527015224.7343-1-jie.gan@oss.qualcomm.com>
 <5fbb515a-c3d0-4bbe-a689-41e730ecd952@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <5fbb515a-c3d0-4bbe-a689-41e730ecd952@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZcodNtVA c=1 sm=1 tr=0 ts=683594df cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=P-IC7800AAAA:8
 a=88YhVURmNkHMYQfLDy0A:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA4NiBTYWx0ZWRfX4plmMNyKoil8
 1byvRIDDnytCrzDwePuMhY6+CIN2H6rsrpbx7MjKsP0sX+64FwodmUqpN2tnt1XROTRDtnXcpuh
 cpwq8ob5Fn0elOCXcLuiWu0n0dvTDZM9JOSZqT9+utcrNv58+DT9M/HNc18q3Vx5lWCkw0s72rn
 5/qRSGbXBZAYx/MAu8o+iFBgOWlbcHlKrHvjfYAOHEubElsrgrdPN8yZNA6jpFl51QRijCnX6kR
 1/cC2Mf1atdl4kUYPfayV22sHhKtHtzifdivYrqlAu8uS/0TGczxZp1nmpQes/4rqTv4NAQm2lT
 oUQaqyzI04mnA8WAfCb5zJ5B7qSlGS0dk51UfBUviOk5jxYrokk4QAKFBEs0Kt2qduLV0AVgyM2
 W2M96qdz3quWAzdD4fCtgJoqbJG4PKNPVnM3FRT4wiarUKOwQ07rlPun7GibTvWpErLKxXN+
X-Proofpoint-GUID: 81dp-akhj6X1BAsipwBUcBbethaWxo8k
X-Proofpoint-ORIG-GUID: 81dp-akhj6X1BAsipwBUcBbethaWxo8k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 mlxlogscore=525 bulkscore=0 priorityscore=1501
 spamscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270086



On 5/27/2025 6:23 PM, Konrad Dybcio wrote:
> On 5/27/25 3:52 AM, Jie Gan wrote:
>> Disable the CTI device of the camera block to prevent potential NoC errors
>> during AMBA bus device matching.
>>
>> The clocks for the Qualcomm Debug Subsystem (QDSS) are managed by aoss_qmp
>> through a mailbox. However, the camera block resides outside the AP domain,
>> meaning its QDSS clock cannot be controlled via aoss_qmp.
> 
> Which clock drives it then?

It's qcom,aoss-qmp.

clk_prepare->qmp_qdss_clk_prepare
https://elixir.bootlin.com/linux/v6.15-rc7/source/drivers/soc/qcom/qcom_aoss.c#L280

Thanks,
Jie

> 
> Konrad


