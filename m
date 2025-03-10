Return-Path: <linux-arm-msm+bounces-50789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A757A58EBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 09:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72996188D49B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 08:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B352236F4;
	Mon, 10 Mar 2025 08:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pb2Ky157"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C8E223308;
	Mon, 10 Mar 2025 08:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741597140; cv=none; b=AWbb66vQD7KngUC+R+T8YF450Vz5a0GIDXUHCl0AqTNpHBRd1dhN4Ky+bZFCYB/yoF/YGs5JQwRtmZWm153wTghPko10YWSZctGoKjRrGGWIc/GLqGQjrjMg24GeuRdL9EEXXdQiYzKgQyihlqf1BlqndhKSL3Z8Lesxhy9Eh6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741597140; c=relaxed/simple;
	bh=KIM3t3dN6h/fqGn9hUl2zN2xK77J0d1+U2gTRG47DLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=g15T1YZOloz6Qs17mF3m8TdmuHmRe95aA4CTexAPA0LUvc7Ec+egmXZHlyJZZtVLL7lidByF1mR+b/1M5JqMUSzvMbNrF9Ri/wxfzl0BEJjHC5ZeldZIIAGUY3dowsbbpxA5hDgdoRQqX1KYI4K8+grEfeXC0zXyj/uE2RCUIc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pb2Ky157; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 529MIZZ1010474;
	Mon, 10 Mar 2025 08:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m2upaeJf0rzuqnQovlmbtPWsRA0OgIqAkIFQGolBRPI=; b=Pb2Ky157GjAGMryS
	Y/qoSHlos2TE3uVvKC5+RVCkkUJMXfZ1VaF8X85HZ0udYub00Ep9CyA2wm8lyQ5e
	nz5vv23a6cvCiSVNa8b76HKjoJovsDz8XjKAJLp24NVX0ZTaXHk1zis6Xk7E1G8s
	Zwai01MI2UnZBryHF4Xd2puXRecycz7F5VG2PKJVQlRkUhpfLYIh1w5Jt/2c+yTb
	J+cOVML3HuexY25Gr4nanARPFXzikA/DOEeuC6TRholHFVJZ3+fRZUVRNfALJ6jn
	Zbs1Sofwn9+NlzFT3gt2geBlUx6qsAQH/4XGigtDODYsebMzuXD9xYDKE+jKQVaE
	tczxzw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f6ac8ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 08:58:48 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52A8wl9C023922
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 08:58:47 GMT
Received: from [10.239.28.138] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Mar
 2025 01:58:44 -0700
Message-ID: <e556e3c9-93ee-494a-be35-9353dc5718e4@quicinc.com>
Date: Mon, 10 Mar 2025 16:58:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] phy: qcom: qmp-pcie: Add PCIe PHY no_csr reset
 support
To: <vkoul@kernel.org>, <kishon@kernel.org>, <p.zabel@pengutronix.de>,
        <dmitry.baryshkov@linaro.org>, <abel.vesa@linaro.org>,
        <quic_qianyu@quicinc.com>, <neil.armstrong@linaro.org>,
        <manivannan.sadhasivam@linaro.org>, <quic_devipriy@quicinc.com>,
        <konrad.dybcio@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250226103600.1923047-1-quic_wenbyao@quicinc.com>
Content-Language: en-US
From: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
In-Reply-To: <20250226103600.1923047-1-quic_wenbyao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=WsDRMcfv c=1 sm=1 tr=0 ts=67cea9c8 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=7YptvZ3fydEw2Y-QB6AA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: j-lWSNpmGh4X7HbiHVLoRMxg8XcSMW_8
X-Proofpoint-ORIG-GUID: j-lWSNpmGh4X7HbiHVLoRMxg8XcSMW_8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_03,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100070

On 2/26/2025 6:35 PM, Wenbin Yao wrote:
> The series aims to skip phy register programming and drive PCIe PHY with
> register setting programmed in bootloader by simply toggling no_csr reset,
> which once togglled, PHY hardware will be reset while PHY registers are
> retained.
>
> First, determine whether PHY setting can be skipped by checking
> QPHY_START_CTRL register and the existence of nocsr reset. If it is
> programmed and no_csr reset is supported, do no_csr reset and skip BCR
> reset which will reset entire PHY.
>
> This series also remove has_nocsr_reset flag in qmp_phy_cfg structure and
> decide whether the PHY supports nocsr reset by checking the existence of
> nocsr reset in device tree.
>
> The series are tested on X1E80100-QCP and HDK8550.
>
> The commit messages of this patchset have been modified based on comments
> and suggestions.
>
> Changes in v5:
> - Add a check whether the init sequences are exist if the PHY needs to be
>    initialized to Patch 2/2.
> - Link to v4: https://lore.kernel.org/all/20250220102253.755116-1-quic_wenbyao@quicinc.com/
>
> Changes in v4:
> - Add Philipp's Reviewed-by tag to Patch 1/2.
> - Use PHY instead of phy in comments in Patch 2/2.
> - Use "if (qmp->nocsr_reset)" instead of "if (!qmp->nocsr_reset)" in
>    function qmp_pcie_exit for readability in Patch 2/2.
> - Use goto statements in function qmp_pcie_power_on and qmp_pcie_power_off
>    for readability in Patch 2/2.
> - Refine the comment of why not checking qmp->skip_init when reset PHY in
>    function qmp_pcie_power_off in Patch 2/2.
> - Link to v3: https://lore.kernel.org/all/20250214104539.281846-1-quic_wenbyao@quicinc.com/
>
> Changes in v3:
> - Replace devm_reset_control_get_exclusive with
>    devm_reset_control_get_optional_exclusive when get phy_nocsr reset
>    control in Patch 1/2.
> - Do not ignore -EINVAL when get phy_nocsr reset control in Patch 1/2.
> - Replace phy_initialized with skip_init in struct qmp_pcie in Patch 2/2.
> - Add a comment to why not check qmp->skip_init in function
>    qmp_pcie_power_off in Patch 2/2.
> - Link to v2: https://lore.kernel.org/all/20250211094231.1813558-1-quic_wenbyao@quicinc.com/
>
> Changes in v2:
> - Add Abel's and Manivannan's Reviewed-by tag to Patch 1/2.
> - Refine commit msg of Patch 2/2.
> - Link to v1: https://lore.kernel.org/all/20250121094140.4006801-1-quic_wenbyao@quicinc.com/
>
> Konrad Dybcio (1):
>    phy: qcom: pcie: Determine has_nocsr_reset dynamically
>
> Qiang Yu (1):
>    phy: qcom: qmp-pcie: Add PHY register retention support
>
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 86 +++++++++++++++++-------
>   1 file changed, 63 insertions(+), 23 deletions(-)
>
>
> base-commit: bcf2acd8f64b0a5783deeeb5fd70c6163ec5acd7

Hi, do you have any futher comments?

-- 
With best wishes
Wenbin


