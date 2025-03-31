Return-Path: <linux-arm-msm+bounces-52866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5890CA762D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 10:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C8D17A2CD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 08:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507C581ACA;
	Mon, 31 Mar 2025 08:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JjhLup+Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B970038F80;
	Mon, 31 Mar 2025 08:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743411537; cv=none; b=hJqUmG9dqJw+ZXe1BZE/hDKbFZYyV+SnoWEH+aMSLiz3fxUWgf1GA2SDXNydQx4mXOq6nyCvaqDxU6eBUZQ9XaSM+WzujlGdMYXExa72jRI4bcSzhEFnF2eSZMg6XuFyIMnC8fh7nI/O+5Pg4JBJKpQ84nH9zFdTa7ZDbKRfGw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743411537; c=relaxed/simple;
	bh=ehR20YbGJsGjfG0ar/8lu1AY4PfXHfrgHoS614S9O6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iDP3LPMFhQXQb+eh65CMyvWy1Rhsd0ujdhMYTTVkRIHG4hfFqK647vOkQe56uHarqTFQXGDAWd+UAjPa5RkDq4QZQKy4vENoWeGCIaTIrp6W2BVo98fQmq4205r825RFa2o/8vNfCexmBiEFSilfCnUtRyez7uapjT44/NUHJe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JjhLup+Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6kalQ018068;
	Mon, 31 Mar 2025 08:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QV8GBKh3sQeIYtKF7q/MnzVhUuUgMdWKanrtEHlbBvg=; b=JjhLup+Q1j6zn7Zu
	IJBBfmvI8JBlW1OMz3G8WQlUT5RMncT4kAI2eiNUzxz/FmMyupqVf/tPeMz6/x3q
	GhSWMMiaY7BR5jA//84wjlsf3ui2zkGQghDPghlfkegKxcsu6YD++0LEvMQrFl7b
	qKqejzSsSWvyY5vK+rgbyUVNv55vRWQcELYws87NpLsjfuVcZ9m0o4wpShwu/X8F
	K2LTMy7ULqCi6SaDcDXtj86ilCUPSx6Eol5jDw9DTjzvx4SClyeH9P04VhYC57jQ
	0y4lF4f08LvhbTwyjMuUIWwG3zN5ZoqNZbrs4RBm/X6CGUwmLpn8abkikbyOVYxM
	ioGmcw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7tvc2ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 08:58:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52V8wieW002926
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 08:58:44 GMT
Received: from [10.233.19.224] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 31 Mar
 2025 01:58:40 -0700
Message-ID: <4c7059a0-46a0-424d-9068-60894c6cec1c@quicinc.com>
Date: Mon, 31 Mar 2025 16:58:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] phy: qcom: qmp-pcie: Add PCIe PHY no_csr reset
 support
To: <vkoul@kernel.org>, <kishon@kernel.org>, <p.zabel@pengutronix.de>,
        <dmitry.baryshkov@linaro.org>, <abel.vesa@linaro.org>,
        <quic_qianyu@quicinc.com>, <neil.armstrong@linaro.org>,
        <manivannan.sadhasivam@linaro.org>, <quic_devipriy@quicinc.com>,
        <konrad.dybcio@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250319094544.3980357-1-quic_wenbyao@quicinc.com>
Content-Language: en-US
From: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
In-Reply-To: <20250319094544.3980357-1-quic_wenbyao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OIon3TaB c=1 sm=1 tr=0 ts=67ea5945 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=7YptvZ3fydEw2Y-QB6AA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Kamf8tevKSEoCK18clT0CMX_0XkzY-0f
X-Proofpoint-GUID: Kamf8tevKSEoCK18clT0CMX_0XkzY-0f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503310063

On 3/19/2025 5:45 PM, Wenbin Yao wrote:
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
> Changes in v6:
> - Return -ENODATA instead of -EINVAL when init sequence is not available.
> - Link to v5: https://lore.kernel.org/all/20250226103600.1923047-1-quic_wenbyao@quicinc.com/
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
> base-commit: b18ac9a805efdbc2e2720dded42b1ed26acadb24

Hello, do you have any futher comments?

-- 
With best wishes
Wenbin


