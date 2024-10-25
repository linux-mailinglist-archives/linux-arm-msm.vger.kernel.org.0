Return-Path: <linux-arm-msm+bounces-35781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B64C79AF921
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 07:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFE7A1C21C55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 05:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFC818C357;
	Fri, 25 Oct 2024 05:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m1q3PPHd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5792E81ADA;
	Fri, 25 Oct 2024 05:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729833466; cv=none; b=bP3gi0KEpIDH8xuMtf47P0bq9DmKarm9EQgA67KgUl5RndokfH2EhCn1Z2WkR9CndFUrfdUEEFevT5O5II+WjRUQ+G8wmVcMZoXGG026mY2/2V9nwyNlSIzr6ir98HA/ALxSkGKfl3dvBFjVbpUuVmaHouv6g61sIQ7a0/rlVAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729833466; c=relaxed/simple;
	bh=WIeoOwHdzwZU6laeq7pxWeMlbYzi8RFYOYWByP5CZRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lkxmVOjaUK7jCbTyJeVoOwOD/01gC16jgsZZ0ZAncq5VpfSEL7wrGc8/NMry2vd+J1F3yWNpGqdbQdD6Rk7aYq6xVepmmN4DRcprZkmvakRrqDZPtXnCcqYWcvWo56Rll/2k3KOuhf+/mayjc2gXP9cpPg4oIPDkrqYn9QCxxLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m1q3PPHd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ONGCmO009099;
	Fri, 25 Oct 2024 05:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R8mX4RrzjCuyjiGlo6UyEKtHU0PQ6yJvmukcTQmGc3I=; b=m1q3PPHdT5QUNCKk
	7+sUWmmzeCQhVBHcDhQV4NHMFemTPmv9Rgi0h6QtW0LO1kTFbxf/fxBtpYHecYZ/
	lNpoI+ixo6TVEkWhKTQ2Plks9zur8fkGnkWPOxsRiGxwyj5R0kPF82ifcd9Wumq+
	Mqlsnb+qpzDocvn89qI4lO5yKhPSwiDq0gxv4Tybbdu50RAmhSjb0HUz0F/qq8Gn
	lDjAIv7GM+344IBdV3hWLGNNOXv3OgI4w7A8kZOk3VvyZ7XrdUidU5oWuPtUcrYV
	D9fIhJ9fNDlEaZGkl/ITtbH1RGow5n8evIwxOKp4WC4czJT52pTk5PtxhkJymfys
	a1Lbyw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em43ft53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 05:17:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P5HQGZ004375
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 05:17:26 GMT
Received: from [10.216.47.134] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Oct
 2024 22:17:22 -0700
Message-ID: <88edd80a-7ad6-49b7-af16-55dde52daea3@quicinc.com>
Date: Fri, 25 Oct 2024 10:47:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add Devicetree support for USB controllers on
 QCS8300
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>
References: <20241011074619.796580-1-quic_kriskura@quicinc.com>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <20241011074619.796580-1-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: o8bBstMfe8TwVDDDtOcy9m-8BoMincHt
X-Proofpoint-ORIG-GUID: o8bBstMfe8TwVDDDtOcy9m-8BoMincHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250038



On 10/11/2024 1:16 PM, Krishna Kurapati wrote:
> This series aims at enabling USB on QCS8300 which has 2 USB controllers.
> The primary controller is SuperSpeed capable and secondary one is
> High Speed only capable. Both the High Speed Phys are Femto phys and the
> SuperSpeed Phy is a QMP Uni Phy.
> 
> Base DT Support has been added for both controllers while only one has
> been enabled on Ride Platform. The primary controller has been configured
> in device mode. The secondary controller will be enabled in host mode post
> addition of SPMI Node which allows control over PMIC Gpios for providing
> vbus to connected peripherals.
> 
> This series depends on the following series ACKed by upstream maintainers:
> Base DT: https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/
> 
> Bindings patches posted at:
> https://lore.kernel.org/all/20241009195348.2649368-1-quic_kriskura@quicinc.com/
> 
> DTBS Check has been done on the patches.
> 

Gentle ping for review.

Regards,
Krishna,

> Link to v1:
> https://lore.kernel.org/all/20241009195636.2649952-1-quic_kriskura@quicinc.com/
> 
> Changes in v2:
> Added quirk to use pipe clk as utmi clk for second controller.
> Added wakeup source for second controller.
> Modified commit text for DTS change.
> 
> Krishna Kurapati (2):
>    arm64: dts: qcom: Add support for usb nodes on QCS8300
>    arm64: dts: qcom: Enable USB controllers for QCS8300
> 
>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts |  23 +++
>   arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 168 ++++++++++++++++++++++
>   2 files changed, 191 insertions(+)
> 

