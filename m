Return-Path: <linux-arm-msm+bounces-57363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8082AB0B66
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 09:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A120A1BC0370
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 07:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E3726FD9A;
	Fri,  9 May 2025 07:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DlNYwqh7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C895C8F64;
	Fri,  9 May 2025 07:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775072; cv=none; b=LWgLtyPZ6aZZU+uUT16iU5QC6V/ZkzibBy+yBc6SA68kwu+jyFzdtb0Yr02Yh/jOU3yE4TV4F9mnaOhATpWwp91Th2gIz8bzup1FFcsXeyvorZUzI9vhwjQJRL+XIrZylHn62S80X6doqtx9b6X6YxcWgesFeVaIoM9tsuqic8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775072; c=relaxed/simple;
	bh=AsOQiZowrHZO57yDS+tweanBuw1vdT/W756NHlVfvz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UqvTsbHYyeHlUjSD4+c2Qxh83J/ynG5HAMBlEbBKXt7EMHeExutfZM+sezpEJ3VVSbQf/tea/lqWUjF/DxvAPYLc3Yyngtrl3DFBTjc02b8yIldn3yO6iwETmg+rxzzMxqFaTZ6p02xwxeWHqQbtn2P31A4bc4IBfd9P/SwnBQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DlNYwqh7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5492TlqG008438;
	Fri, 9 May 2025 07:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sGMGh3kCZ7DtAL6Rxf5lFibuPBZrYKW2j8RTxCTZsgw=; b=DlNYwqh7oj8gvKqH
	DDUyk0cS5CSDEXgYydnhnQFKzJQ4ZXTlfSSFyAHdnDsAy0nY6ydVbFAuRLPoHWVw
	yS2Dsnoe1AEXModCSEajo2AoBZ21AsO8jczgqvQm+oINtb7I75iGs1Jn/8UuBiI8
	XOq5RwedFOP+alrfeorNaeJORjpMPsRKhDPVoGcFdfcmuLuo87jzFlE2926qIpJR
	EzbfW2FWW5KyDis3gvexmqig0f8AsyNt/7uwfRC9pRpWK3awjSt+XyratYONo3C3
	HMdHw0/gNGUYvTXIh7btYioAG7YAVpa6g5Zk011phdgyTgN3wCGhsrWydLZz6Kn+
	6F1hXQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5bra2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 07:17:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5497HVn8004237
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 07:17:31 GMT
Received: from [10.239.29.178] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 May 2025
 00:17:27 -0700
Message-ID: <c73881f8-cdb4-417e-885d-2c3787c05f6f@quicinc.com>
Date: Fri, 9 May 2025 15:17:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] arm64: qcom: x1e80100-qcp: Add power supply and
 sideband signals for PCIe RC
To: Wenbin Yao <quic_wenbyao@quicinc.com>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <sfr@canb.auug.org.au>,
        <linux-phy@lists.infradead.org>
CC: <krishna.chundru@oss.qualcomm.com>, <quic_vbadigan@quicinc.com>,
        <quic_mrana@quicinc.com>, <quic_cang@quicinc.com>
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
Content-Language: en-US
From: Qiang Yu <quic_qianyu@quicinc.com>
In-Reply-To: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681dac0c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=FpayjJl1TS02Lq9UJb0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: i-i7M-MlIasT-BRoraL81VBVP0YA3GLJ
X-Proofpoint-ORIG-GUID: i-i7M-MlIasT-BRoraL81VBVP0YA3GLJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA2OSBTYWx0ZWRfXz0WePNma9Pg+
 4N9HFahuDHQyQeO3tNfawZBQhErgz5JhUBiSM+fBCyWkWcKWq8pRSkkI8PmnJOCG7jPL7hUeZy2
 IPVnNSmxfh7QZW6ka+kjX5nuVA2hJHFiszdsLZ8zgyL3M1mbGDG1zpi8Ej3qRTLQas8X1h8ud/y
 iCTh71VsXcwAeadj+8PQ3LAFSBss3dO4o6sZkAx85aJcyXvTSO8iyHvyndHKCOHbO/XmqGfYXjI
 OXbBuMgHGoFyAuSf2FUBOyfTMQAodg7aRciChku2i4U3n2+W6WWsz7q3XvrjNQruPBLoE87Vsui
 MEry5fH0SE/Lno2VIe2nzJajQtXkTYMiVsnOOawL6WtAjPEU4ttD7hEgal+ENddgXgji0xkUL55
 SXYl2fZmduHnGYwd5RVQdgj6hrQNpZbn73P1mp+IRbDUwZD8mY5+X06P+HHFwGW6sXX7FbrG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_02,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090069


On 5/8/2025 4:15 PM, Wenbin Yao wrote:
> The first patch enables the PCI Power Control driver to control the power
> state of PCI slots. The second patch adds the bus topology of PCIe domain 3
> on x1e80100 platform. The third patch adds perst, wake and clkreq sideband
> signals, and describe the regulators powering the rails of the PCI slots in
> the devicetree for PCIe3 controller and PHY device. The fourth patch adds
> qref supply in dts nodes of PCIe PHYs. The fifth patch requests qref supply
> for PCIe PHYs.
>
> The patchset has been modified based on comments and suggestions.
>
> Changes in v3:
> - Replace PCI_PWRCTL_SLOT with PCI_PWRCTRL_SLOT in Patch 1/5.
> - Kepp the order of pinctrl-0 before pinctrl-names in Patch 3/5.
> - Add Patch 5/5 to request qref supply for PCIe PHYs.
> - Link to v2: https://lore.kernel.org/all/20250425092955.4099677-1-quic_wenbyao@quicinc.com/
>
> Changes in v2:
> - Select PCI_PWRCTL_SLOT by ARCH_QCOM in arch/arm64/Kconfig.platforms in
>    Patch 1/4.
> - Add an empty line before pcie3port node in Patch 2/4.
> - Rename regulator-pcie_12v regulator-pcie_3v3_aux and regulator-pcie_3v3
>    in Patch 3/4.
> - Add Patch 4/4 to describe qref supply of PCIe PHYs.
> - Link to v1: https://lore.kernel.org/all/20250320055502.274849-1-quic_wenbyao@quicinc.com/
>
> Qiang Yu (5):
>    arm64: Kconfig: enable PCI Power Control Slot driver for QCOM
>    arm64: dts: qcom: x1e80100: add bus topology for PCIe domain 3
>    arm64: dts: qcom: x1e80100-qcp: enable pcie3 x8 slot for X1E80100-QCP
>    arm64: dts: qcom: x1e80100-qcp: Add qref supply for PCIe PHYs
>    phy: qcom: qmp-pcie: add x1e80100 qref supplies
>
>   arch/arm64/Kconfig.platforms              |   1 +
>   arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 121 ++++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi    |  11 ++
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c  |  37 ++++++-
>   4 files changed, 165 insertions(+), 5 deletions(-)
>
>
> base-commit: 0a00723f4c2d0b273edd0737f236f103164a08eb
Hi

Can you please review patch[1/5], patch[2/5] and patch[3/5] first, QREF
patch need more discussion, but it will not affect the PCIe function.

-- 
With best wishes
Qiang Yu


