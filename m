Return-Path: <linux-arm-msm+bounces-27216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C39593F247
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B6971C21670
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 10:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B4E1419B5;
	Mon, 29 Jul 2024 10:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H9bVUJAH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D89B140378;
	Mon, 29 Jul 2024 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722247880; cv=none; b=CvxIeEgrHfG1IoSGHFF6vAsEZ7yAagUXiloNICBf+SzQ/JjTJ2pr3Z0SAasPTiKDH8ziTnjpoY+odirbzDnD0geVqpNvIdWh72xLuxZo4Y7WKbnfVgHL0SHaMV2M4BIHKqU2CrpYaA91xUCb/EpsaniSy9Mxukb4K9HE3rtfETk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722247880; c=relaxed/simple;
	bh=cBTbk0JqC4cQINVE/teHMlJmuLGUm05KYK2dHZZ7Mts=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kkVJcb8Rtgu6KdtBx8ZLNhYN0fGKrC9ef7ftPRzaHGXgEf5W90kSbZacQdgi1wBClp75HtPWIBSaZGq7jnXoAjFa6g/Kj16uIsY4t80rmxH+Qg1vG0V7Ir4y7dJSzRW4ePfxc9+eYZlx7dr8ESIvI5GzrTgsmUKJX3wyHXsoS3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H9bVUJAH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TAAcoW032347;
	Mon, 29 Jul 2024 10:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KlWEheS9lncz0vpgHiAiW34D7qgLzLgKDEmuK9IjYDg=; b=H9bVUJAH8PiFNLzL
	Cft47Y+x+STBbvOh7vSYOYNqSX213vZEQkh6Kk2YxJ8NqlFEyDhJGRUfmi3/1ySo
	5OkLL19NvMNxazwP3CR0abNX5sHOOJhJV2WNQnTk7if8nURLVQbOopFv1u7hbOGf
	vnAIHkIGYSXehcHWqLH9MHBZBv9ZEuXw8Y7jHFkLE+SjivgtzdF+tCYgXSxg3pG1
	BkLxvAMIjTmFc0ohBp4bFKoU2ZL8f1PT/cY465my6mHj0p9XMy1O0ChX6omKS1bN
	hvgtOL1r1kMYavnr4Mc5uh8ppnyjFNe8YvrVsWQas8B6kuvFDwyZJh+9hWCGJbQ/
	Ki1uDw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mpkeuxme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:11:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46TABEDR003862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:11:14 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 03:11:10 -0700
Message-ID: <6261e94c-8eb4-4f70-b0a3-966162a3e783@quicinc.com>
Date: Mon, 29 Jul 2024 18:11:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] phy: qcpm-qmp-usb: Add QCS9100 USB3 PHY compatible
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240709-add_qcs9100_qmp_usb3_uni_phy_compatible-v2-0-e83b9fc7b280@quicinc.com>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <20240709-add_qcs9100_qmp_usb3_uni_phy_compatible-v2-0-e83b9fc7b280@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rStQRxvGmSy-tS1XQFZQNYJuGveuSWTv
X-Proofpoint-GUID: rStQRxvGmSy-tS1XQFZQNYJuGveuSWTv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_08,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxlogscore=997 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290069



On 7/9/2024 10:41 PM, Tengfei Fan wrote:
> Introduce support for the QCS9100 SoC device tree (DTSI) and the
> QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
> While the QCS9100 platform is still in the early design stage, the
> QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
> mounts the QCS9100 SoC instead of the SA8775p SoC.
> 
> The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
> all the compatible strings will be updated from "SA8775p" to "QCS9100".
> The QCS9100 device tree patches will be pushed after all the device tree
> bindings and device driver patches are reviewed.
> 
> The final dtsi will like:
> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/
> 
> The detailed cover letter reference:
> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
> Changes in v2:
>    - Split huge patch series into different patch series according to
>      subsytems
>    - Update patch commit message
> 
> prevous disscussion here:
> [1] v1: https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
> 
> ---
> Tengfei Fan (2):
>        dt-bindings: phy: qcom,qmp-usb: Add QCS9100 USB3 PHY
>        phy: qcpm-qmp-usb: Add support for QCS9100
> 
>   .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        | 3 +++
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c                                | 3 +++
>   2 files changed, 6 insertions(+)
> ---
> base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
> change-id: 20240709-add_qcs9100_qmp_usb3_uni_phy_compatible-e7be2785197e
> 
> Best regards,

After considering the feedback provided on the subject, We have decided
to keep current SA8775p compatible and ABI compatibility in drivers.
Let's close this session and ignore all the current patches here.
Thank you for your input.

-- 
Thx and BRs,
Tengfei Fan

