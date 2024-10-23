Return-Path: <linux-arm-msm+bounces-35492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 272249ABAFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 03:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD9BC284ED4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 01:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E406F1804E;
	Wed, 23 Oct 2024 01:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P7izUHEU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACAB3A1DA;
	Wed, 23 Oct 2024 01:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729646855; cv=none; b=gPfvhYdDnHB59o1qkBXlRC0aE6QjIY+0Lcbwxwvi/g176B4XsSq4Y5ABT1WO6SsZCUi1IUE4pln0kSOwqTnyMR14sU4J7D0ZouTeDvuR4aWswhfxUWtAaH0NLfYzZ8VFfroyYhPOhwLWTpIWwNsCpZf65ldvji6+O3b47OcPdZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729646855; c=relaxed/simple;
	bh=xrcJV1wBdi4PSD5v+nU2WTeYJrdkdt4uIhqdftYfDp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fBGlHNt4w+Exc52pxw83keEEDr4LOisb65LnLaK0+WbfjDL2gAlPZpbVIJ078eERK8qXDsFivGPUj0r+WhKuFhVhdPEj6b/mxEC2olFr+xJC1KZ62EatoWToH9QuWO4l6zfQyFB7PPtzCTqkoK/hngobmh022sjXc0hkZI6OiGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P7izUHEU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLZxn2016064;
	Wed, 23 Oct 2024 01:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJHGPz9I1JQi6q+Es05Nzra/2//ln8aPy686WZGQwDk=; b=P7izUHEULLiRDOLu
	EdsBZYlPlzvcxEvbOzuEt0ygqwvQqvjML7Sgy8ktFwjIvRCf/ws7v+OxXzWxJ8Jq
	oWIF+xY3tBq5Xhz6IXeyULVubx1Mtqh7fcCucrOktkcuLjZJQV79e8vn8/qm+/Ug
	F+sXH3TxZCIBNnB2RLRnbzcA46wUo6OHKhRoRDYUitK+cU96eJdIpkkzm2RviESv
	NlYtJu/NkVmlq8VszF4T8cyHnItYdxZ29PrNEW5V0oQyl21Z3uSTvu4O+seAzuK2
	0ASW/lGrdH6ktIOSRilZ41mOg2ec+EshCwJatnftrSgQ+IYTlhbUrmJUITjnBAL6
	/BW1bA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3xgdqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 01:27:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49N1RTsM022705
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 01:27:29 GMT
Received: from [10.47.206.1] (10.49.16.6) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 18:27:28 -0700
Message-ID: <7c6c6343-a0f7-411f-aea4-c793317c164e@quicinc.com>
Date: Tue, 22 Oct 2024 18:27:27 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator: qcom-rpmh: Update ranges for FTSMPS525
To: Melody Olvera <quic_molvera@quicinc.com>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Trilok Soni
	<quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241021230348.2632381-1-quic_molvera@quicinc.com>
Content-Language: en-US
From: David Collins <quic_collinsd@quicinc.com>
In-Reply-To: <20241021230348.2632381-1-quic_molvera@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YGBSTUK04bkYHQovDlrnXgSh87u9G8uf
X-Proofpoint-ORIG-GUID: YGBSTUK04bkYHQovDlrnXgSh87u9G8uf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230006

On 10/21/24 16:03, Melody Olvera wrote:
> The FTSMPS525 regulator has several potential ranges,
> so update the ranges accordingly for SM8750.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index 6c343b4b9d15..272de7bc9c88 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -848,9 +848,10 @@ static const struct rpmh_vreg_hw_data pmic5_ftsmps525_lv = {
>  	.ops = &rpmh_regulator_vrm_ops,
>  	.voltage_ranges = (struct linear_range[]) {
>  		REGULATOR_LINEAR_RANGE(300000, 0, 267, 4000),
> +		REGULATOR_LINEAR_RANGE(1376000, 268, 438, 8000),
>  	},
> -	.n_linear_ranges = 1,
> -	.n_voltages = 268,
> +	.n_linear_ranges = 2,
> +	.n_voltages = 439,
>  	.pmic_mode_map = pmic_mode_map_pmic5_smps,
>  	.of_map_mode = rpmh_regulator_pmic4_smps_of_map_mode,
>  };

This configuration which specifies both LV and MV ranges should replace
the pmic5_ftsmps525_lv and pmic5_ftsmps525_mv configurations.  It should
then be used in the per-PMIC data tables below.

All FTSMPS525 type regulators physically support both LV and MV ranges.
However, the per-regulator selection of which range is used can only be
set by boot loader firmware and the configuration is locked in hardware
after initialization.  Unfortunately, the qcom-rpmh-regulator driver has
no mechanism to determine at runtime if LV or MV range has been set for
a particular regulator.  Additionally, that exact same regulator in the
same PMIC could be configured for the other range when used on a
different board (where the power grid has different requirements).

Listing support in a unified configuration for both LV and MV ranges
fixes the situation as it will work on all boards regardless of firmware
LV vs MV selection.  This also accurately captures the capability of the
regulator at a hardware level.

> @@ -1196,6 +1197,8 @@ static const struct rpmh_vreg_init_data pm8550vs_vreg_data[] = {
>  	RPMH_VREG("smps4",  "smp%s4",  &pmic5_ftsmps525_lv, "vdd-s4"),
>  	RPMH_VREG("smps5",  "smp%s5",  &pmic5_ftsmps525_lv, "vdd-s5"),
>  	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps525_mv, "vdd-s6"),
> +	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps525_lv, "vdd-s7"),
> +	RPMH_VREG("smps8",  "smp%s8",  &pmic5_ftsmps525_lv, "vdd-s8"),

These lines should not be added.  PMIC PM8550VS only has 6 FTSMPS525
regulators inside.

>  	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo515,   "vdd-l1"),
>  	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_nldo515,   "vdd-l2"),
>  	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo515,   "vdd-l3"),
> @@ -1205,7 +1208,7 @@ static const struct rpmh_vreg_init_data pm8550vs_vreg_data[] = {
>  static const struct rpmh_vreg_init_data pm8550ve_vreg_data[] = {
>  	RPMH_VREG("smps1", "smp%s1", &pmic5_ftsmps525_lv, "vdd-s1"),
>  	RPMH_VREG("smps2", "smp%s2", &pmic5_ftsmps525_lv, "vdd-s2"),
> -	RPMH_VREG("smps3", "smp%s3", &pmic5_ftsmps525_lv, "vdd-s3"),
> +	RPMH_VREG("smps3", "smp%s3", &pmic5_ftsmps525_mv, "vdd-s3"),
>  	RPMH_VREG("smps4", "smp%s4", &pmic5_ftsmps525_mv, "vdd-s4"),
>  	RPMH_VREG("smps5", "smp%s5", &pmic5_ftsmps525_lv, "vdd-s5"),
>  	RPMH_VREG("smps6", "smp%s6", &pmic5_ftsmps525_lv, "vdd-s6"),
> 
> base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17

Take care,
David Collins


