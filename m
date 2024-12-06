Return-Path: <linux-arm-msm+bounces-40644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B849E643A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 03:37:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BFCE188539D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 02:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32DD16132F;
	Fri,  6 Dec 2024 02:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M3PhDeVT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E99145A05;
	Fri,  6 Dec 2024 02:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733452657; cv=none; b=lqDLmxUiQsnYkBrAGQQL/15ZCYciXzE9cVeSeEWm6roFaPHLfW8yMrB4LAwYdepR9zgx5nF+1ZUeIrXwJ7IQ4y6hM+FSXeQR1RiF+F5TCXTIxrECnpCmY/TClJJg0xT8PLhrjDWDo4XaY4o/nBUE211fFeed43BQTdrE9CkJhRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733452657; c=relaxed/simple;
	bh=FbSwe14eb38grB9uW3LvxKjybeQCrOht4PdodHjbv+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fr8sgc3qZYLSFAGShcN3kn0qhnjwP22tIu8IS5F0QPCQD8xgJ0pGQw/DYwtuHlCgsuh2kO/bJn+2yGkoU3GOk34g8tZ6EJOYb4dRnwGeLff3PC0ryOE6iwOyvQ33bJ/zmrIlCVXnluN8Ys78Ta+dViEb5+eI5Kgw6ZKl0w36rDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M3PhDeVT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaFt4003703;
	Fri, 6 Dec 2024 02:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jb8iLPB5GfyIk7Ci0Qq6vj9qT1mHqgPhhTb6s4iHMwM=; b=M3PhDeVTACu9IkOz
	L99S8zeUWXiUx1Lp9YpIKuovQeF2ljlVwmBDIJ1b56AjTmsXJl83tk9Iu42c/J8G
	U3hTiZZf2CRNr+Vqv8FpNl0U1HWi7PR6CMN/TnaKaUZy0n3bP3VkXX744I1fpCk8
	y5x+svWD3JQ+K9qbwZ5CCjtqmGZwbC0f8sO3MvCxydsOGVWXrI41NtW7uUGNiXb+
	KG/sifbYDwz5IuFKKIoAPoOfXhiv1Bm1ocS6na7Xsw2gOycXhZ+H/NLoO6U9T87E
	3a9fd/NK6Ckout7lUyt22TCgbwviwVJvDHElM5vCLPO5krwuBn1Jy9EhSzBchoXO
	axSHGg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba0kjbmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 02:37:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B62bVaY002235
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 02:37:31 GMT
Received: from [10.233.17.145] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 18:37:27 -0800
Message-ID: <87c9ebb9-36b2-4891-8800-2896d6d9bbfc@quicinc.com>
Date: Fri, 6 Dec 2024 10:37:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Enable ethernet for qcs8300
To: Yijie Yang <quic_yijiyang@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20241206-dts_qcs8300-v5-0-422e4fda292d@quicinc.com>
From: Tingwei Zhang <quic_tingweiz@quicinc.com>
In-Reply-To: <20241206-dts_qcs8300-v5-0-422e4fda292d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: a-JkyvDQLg4FPm8T5eeu4TC5ookSvh-q
X-Proofpoint-GUID: a-JkyvDQLg4FPm8T5eeu4TC5ookSvh-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=554 spamscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060017

On 12/6/2024 9:35 AM, Yijie Yang wrote:
> Add dts nodes to enable ethernet interface on qcs8300-ride.
> The EMAC, SerDes and EPHY version are the same as those in sa8775p.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
> This patch series depends on below patch series:
> https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/ - Reviewed

Above series was already applied. I would say there's no dependency to 
block this series to be applied now. No need to respin for this but 
update the dependency status if a new version is required.

> https://lore.kernel.org/all/20241010-schema-v1-0-98b2d0a2f7a2@quicinc.com/ - Applied
> 
> Changes in v5:
> - Pad the register with zero for both 'ethernet0' and 'serdes0'.
> - Change PHY name from 'sgmii_phy0' to 'phy0'.
> - Link to v4: https://lore.kernel.org/r/20241123-dts_qcs8300-v4-0-b10b8ac634a9@quicinc.com
> 
> ---
> Yijie Yang (2):
>        arm64: dts: qcom: qcs8300: add the first 2.5G ethernet
>        arm64: dts: qcom: qcs8300-ride: enable ethernet0
> 
>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 112 ++++++++++++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/qcs8300.dtsi     |  43 ++++++++++++
>   2 files changed, 155 insertions(+)
> ---
> base-commit: c83f0b825741bcb9d8a7be67c63f6b9045d30f5a
> change-id: 20241111-dts_qcs8300-f8383ef0f5ef
> 
> Best regards,


-- 
Thanks,
Tingwei

