Return-Path: <linux-arm-msm+bounces-74014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F2CB82B05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 04:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 711C3488574
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 02:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290451F4C8C;
	Thu, 18 Sep 2025 02:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="la9pR+Bl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CAF1C4A2D
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 02:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758163897; cv=none; b=gx5xD+8EFwiSd2hdE/0oeoZ+LzsBE3fMZ8G39gkDTKGdXs8xpEMPlg2ZDZ95wA5E9qWwiGvlRTTgDYdMO6PsmkCmklaQXYXU3qFULgBcLQ9s9if6PU4e70k3XeDoKEVh8/Hw2La1CrvRHL1CmbSGaFExacs08yyvqaegwidEdnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758163897; c=relaxed/simple;
	bh=WcSRvEvShhrqbxNvzLtiCjssybnUH82Y+EQUkkK4AkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4DK0SfkBDsByVLbzfSuCoEiJZoFhKjlpfntpXWFsIpmEnUWoaJNqNdXsEcsk8Nd7/na3o0mHxm62JazF3nMXg1NDcCeJXKsAHHgsNaI7h/pxsigdVIMr5slT7rwwJsLDMk2LBl7ef9xTiTEKtoKpqEIL7Xi+LmdC9z+RohBKv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=la9pR+Bl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I2pM0H019548
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 02:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fgecCebfDJtpE3JoBpenuay0Bs5D6Xykj3YET5V/PY8=; b=la9pR+BldbY1vaar
	z2ZOcpik7u9tIlKZiJvBbA9VeNGYARVhcmkrJowjycZL6wbInfwlv2zl+ZiCjaqn
	QZRDTZeAzsNpa3RQOGjAA2EPuq2qPgOGIDGzQqnbR0MrD7Irko5v64FWHZJmHCtc
	6tigV/dNKYaXzM6qk/j8wbpckq1CTRow47BYmA+AXC4FSgZ/KfiTWOtZFPCh6eeX
	0U4TVstOEz/r6gCTphdgxh6crAuReFj7aP0FKuSQGA7kxsPWjrR8RYTHsZ5DFxpr
	v9BzvTyZcCefnD5wd6motgT6CdM5zkRIvfKNJpsn51OhYEOFEmfhapQ2TgOdDW58
	0oMqCg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy1vrac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 02:51:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b54fdfd5045so395328a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 19:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758163892; x=1758768692;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fgecCebfDJtpE3JoBpenuay0Bs5D6Xykj3YET5V/PY8=;
        b=fctYi6sfvsTTv38tAKy6fQOp+aoOcKhxpEibmbDlRORS1tnzB3M9ltb2vjZVHaa5tJ
         cJMKo7AEPLCBJ1KOAkPAlR1VH8kZH7jGMKa59n0tWdOcO6x8dR/v9LXNAphBXD7zXRkJ
         b9egglJVtl1LbL8hEejsHwkh00G9Yyw6JIvb25WFr/UWJYjnATmRGXKF9X3DtO8hy+hY
         JuNbkRW00/gIqmKWkmaUF1zb5P1SIFpXxW8HYTJtO0EsWQYVEbzo9/JVtIDNJQ8ACu/s
         9CwSDp2G/Xjo6aTXdzDAyWshxd9oUutI52DFXrUrtbbHyqDvuu5PuQGyUkL5k59mkMSN
         jGjg==
X-Gm-Message-State: AOJu0YyhnAclS4w/V2QVqz1hw2By7SIOtWikxzIvBhnWbhMcCcfrUNA0
	5qhFr/J4NPlsrMIRxq+eKePxh62CWBAk7aXu4A1ffpCG7UBUyBya10C5OPIRO+tsansQUK5N52G
	lQItWF37yoNy5B7DeB/D+BzLGt5ZXDXFexKcVUSxmmxG6iMQSTT7wiuOnkrcd+ywTdwS5xhXgaA
	je
X-Gm-Gg: ASbGncu9oTJD9JaZ3SXnWnFxXeSVm3ZcbTUENNYTucTrSawuwgge2OSNCj2CSsc7YMg
	qFy9x3w1aBivm57rgLJHXpUG1dK7kcy/Am+z4DiAFQLpXZhI1RjDB6sgKYScP1tkvvd0HcLuubr
	fnhStJfe4opM4tVRjsjCtykfd124fRMSI6WWrxQuz74yv6xEGk9PvmXSPbcCpA3ZZIokto40lea
	6tGLeYrQuC/AUYJK5QoB13i102gh0ivGGU67txTfEtOyCkbcScaNImnyUBVaekTJyN8Ud0dK2e0
	ehu38Mar3zUtFujvmgAYzY9Rrtb9FmfSWEi46cNc4gMubpWmxCsk+bTh9Wznk+f7KpaKXCrJlLt
	I3LkUHn4U14PRYmgCPUFZDRH9UbZR
X-Received: by 2002:a05:6a20:548d:b0:24f:f79d:66a8 with SMTP id adf61e73a8af0-27a96a993f3mr5835794637.24.1758163891904;
        Wed, 17 Sep 2025 19:51:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO8+Yv7Mvypcl39Oo+6RrtTJ5B0aTO0XwTIkdwLESldoizSlNvP5sGd7bDmK1hg4lFmJhW6A==
X-Received: by 2002:a05:6a20:548d:b0:24f:f79d:66a8 with SMTP id adf61e73a8af0-27a96a993f3mr5835757637.24.1758163891401;
        Wed, 17 Sep 2025 19:51:31 -0700 (PDT)
Received: from [10.133.33.24] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff435325sm869595a12.43.2025.09.17.19.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 19:51:30 -0700 (PDT)
Message-ID: <f16f14ab-ff11-42a2-b63b-ed28e85d620b@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 10:51:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 0/5] pci: qcom: Add QCS8300 PCIe support
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, jingoohan1@gmail.com,
        mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
        bhelgaas@google.com, johan+linaro@kernel.org, vkoul@kernel.org,
        kishon@kernel.org, neil.armstrong@linaro.org, abel.vesa@linaro.org,
        kw@linux.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com,
        Ziyue Zhang <quic_ziyuzhan@quicinc.com>
References: <20250908073848.3045957-1-ziyue.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
In-Reply-To: <20250908073848.3045957-1-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WiCzOl9JDMiCxMOZhBpyoBfcctq_YiQQ
X-Proofpoint-ORIG-GUID: WiCzOl9JDMiCxMOZhBpyoBfcctq_YiQQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX9ZejGZpZN1If
 1QWYN8yshyNEX0fC9ngu5fMYCrWYLeE7ouCvrKXiIL4bMNudUBjkbKXnlBcZtam2sTX3P9l9z1P
 mDrVY/xu3ZNcWCHZwONFh7izWKUYR2fqzWg7M57T2Mq72OLiYFYmfr2LVOPctS7wgRmEkA/vb6s
 IMK/8bm4xrzHBIhOVGbtrF0IoTw7thAtitsNzbiRiOlcS5r263O5pforgqrkdu+uAAmOAMholcl
 eTQ1yKMS4pkumPQX7tJTYw7GVsmWjoMoTOGIoLGkh/9ZACtSmh6yW3rdJaRGM789WnBXrzS08Mj
 FDdkmI8cV7Kjak854B2tvjA+McSHbvjBOmRQBysFvrrRCJovPVA3+NemX7gmgdQXjj1gjOHjnME
 GFk6NCF6
X-Authority-Analysis: v=2.4 cv=cf7SrmDM c=1 sm=1 tr=0 ts=68cb73b5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8 a=IHEL40AIkIxnPEiLsFYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202


On 9/8/2025 3:38 PM, Ziyue Zhang wrote:
> This series depend on this patch
> https://lore.kernel.org/all/20250826-pakala-v2-3-74f1f60676c6@oss.qualcomm.com/
>
> This series adds document, phy, configs support for PCIe in QCS8300.
> It also adds 'link_down' reset for sa8775p.
>
> Have follwing changes:
> 	- Add dedicated schema for the PCIe controllers found on QCS8300.
> 	- Add compatible for qcs8300 platform.
> 	- Add configurations in devicetree for PCIe0, including registers, clocks, interrupts and phy setting sequence.
> 	- Add configurations in devicetree for PCIe1, including registers, clocks, interrupts and phy setting sequence.
>
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---
> Changes in v13:
> - Fix dtb error
> - Link to v12: https://lore.kernel.org/all/20250905071448.2034594-1-ziyue.zhang@oss.qualcomm.com/
>
> Changes in v12:
> - rebased pcie phy bindings
> - Link to v11: https://lore.kernel.org/all/20250826091205.3625138-1-ziyue.zhang@oss.qualcomm.com/
>
> Changes in v11:
> - move phy/perst/wake to pcie bridge node (Mani)
> - Link to v10: https://lore.kernel.org/all/20250811071131.982983-1-ziyue.zhang@oss.qualcomm.com/
>
> Changes in v10:
> - Update PHY max_items (Johan)
> - Link to v9: https://lore.kernel.org/all/20250725104037.4054070-1-ziyue.zhang@oss.qualcomm.com/
>
> Changes in v9:
> - Fix DTB error (Vinod)
> - Link to v8: https://lore.kernel.org/all/20250714081529.3847385-1-ziyue.zhang@oss.qualcomm.com/
>
> Changes in v8:
> - rebase sc8280xp-qmp-pcie-phy change to solve conflicts.
> - Add Fixes tag to phy change (Johan)
> - Link to v7: https://lore.kernel.org/all/20250625092539.762075-1-quic_ziyuzhan@quicinc.com/
>
> Changes in v7:
> - rebase qcs8300-ride.dtsi change to solve conflicts.
> - Link to v6: https://lore.kernel.org/all/20250529035635.4162149-1-quic_ziyuzhan@quicinc.com/
>
> Changes in v6:
> - move the qcs8300 and sa8775p phy compatibility entry into the list of PHYs that require six clocks
> - Update QCS8300 and sa8775p phy dt, remove aux clock.
> - Fixed compile error found by kernel test robot
> - Link to v5: https://lore.kernel.org/all/20250507031019.4080541-1-quic_ziyuzhan@quicinc.com/
>
> Changes in v5:
> - Add QCOM PCIe controller version in commit msg (Mani)
> - Modify platform dts change subject (Dmitry)
> - Fixed compile error found by kernel test robot
> - Link to v4: https://lore.kernel.org/linux-phy/20241220055239.2744024-1-quic_ziyuzhan@quicinc.com/
>
> Changes in v4:
> - Add received tag
> - Fixed compile error found by kernel test robot
> - Link to v3: https://lore.kernel.org/lkml/202412211301.bQO6vXpo-lkp@intel.com/T/#mdd63e5be39acbf879218aef91c87b12d4540e0f7
>
> Changes in v3:
> - Add received tag(Rob & Dmitry)
> - Update pcie_phy in gcc node to soc dtsi(Dmitry & Konrad)
> - remove pcieprot0 node(Konrad & Mani)
> - Fix format comments(Konrad)
> - Update base-commit to tag: next-20241213(Bjorn)
> - Corrected of_device_id.data from 1.9.0 to 1.34.0.
> - Link to v2: https://lore.kernel.org/all/20241128081056.1361739-1-quic_ziyuzhan@quicinc.com/
>
> Changes in v2:
> - Fix some format comments and match the style in x1e80100(Konrad)
> - Add global interrupt for PCIe0 and PCIe1(Konrad)
> - split the soc dtsi and the platform dts into two changes(Konrad)
> - Link to v1: https://lore.kernel.org/all/20241114095409.2682558-1-quic_ziyuzhan@quicinc.com/
>
> Ziyue Zhang (5):
>    dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Update pcie phy bindings
>      for qcs8300
>    arm64: dts: qcom: qcs8300: enable pcie0
>    arm64: dts: qcom: qcs8300-ride: enable pcie0 interface
>    arm64: dts: qcom: qcs8300: enable pcie1
>    arm64: dts: qcom: qcs8300-ride: enable pcie1 interface
>
>   .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       |  17 +-
>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts     |  84 +++++
>   arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 310 +++++++++++++++++-
>   3 files changed, 394 insertions(+), 17 deletions(-)
>
>
> base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
Hi Maintainers,

It seems the patches get reviewed tag for a long time, can you give this

series further comment or help me to merge them ?
Thanks very much.

BRs
Ziyue

