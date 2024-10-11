Return-Path: <linux-arm-msm+bounces-34164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F45B99ACA1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 21:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 011B528590C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 19:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1FF1CF7DB;
	Fri, 11 Oct 2024 19:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PDVU14dV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CD91CEAB1;
	Fri, 11 Oct 2024 19:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728674941; cv=none; b=MXP1qg5KKIDVxVZAY826lNJyBbsHDkBl02Og+89vEjYRHBGFeUQuD/3I1oxxBHRSUDJ02Fg+TvirLbCH1P2eL1C061nFuQxusGQXOJR/G1kG6eLIZfs4qen2qsgFvnXswbAmn1joyT68rIyJDzcUY60ybgRq4OIV1s7ekVThjzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728674941; c=relaxed/simple;
	bh=GVQjFwuYbCH7yjARIcIxxvv0rVZPVA9qarHpbXL4s9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oZU8KS94efumK3hC52OW5BSUx/Hkx1zOVfPJjZKywLIywvlioZ/irxTEWjdx+RT3u1WNv2lqFByjj15BzgI93hYKEky6MS/IkZXcgTWYy0DeXBMTMhpz29f9s4gfavRids9sWwEJQ3oLp19vwvMpqvUGOQJORxC2QcuOcp0wg3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PDVU14dV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BAA6at020701;
	Fri, 11 Oct 2024 19:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GVQjFwuYbCH7yjARIcIxxvv0rVZPVA9qarHpbXL4s9w=; b=PDVU14dVX80PHf9a
	9g9WsCdgfOqez4+ucjxEH1H/tBcFxYk9dDxjMPf83WeHYIjb/e1+1cPBCrAixEIn
	12L8TFvmK3EFbHVmImMp5x/K7Dj9Px82TGuDISL8WYH3qHKEY02MpqdogkRgnd8S
	7PqVLNFWaBH92eCBRlObIIZ89DndQtUoKCPl/Xb/aONTAOif+NERO+BSOON1L7ZY
	7lx+CbUztjfvKcA034RIu94+4aQApPMbPrpbBPIRxEweNFfM4oOASZg7HPD69syr
	kUmXQLUAkHigZwRwr7S1dPkamoHgAfyP6DQVTNexRvRzTXBN82TUxO0FbuUtQV1H
	pxa9yA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42721c9dgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 19:28:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49BJSh02008959
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 19:28:43 GMT
Received: from [10.48.240.152] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Oct
 2024 12:28:42 -0700
Message-ID: <b62a851c-ffb8-475a-9de1-1211a5a6b590@quicinc.com>
Date: Fri, 11 Oct 2024 12:28:41 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/4] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_viswanat@quicinc.com>, <quic_mmanikan@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>,
        <quic_gokulsri@quiconc.com>
References: <20240829134021.1452711-1-quic_gokulsri@quicinc.com>
 <20240829134021.1452711-3-quic_gokulsri@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240829134021.1452711-3-quic_gokulsri@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1-QFsvHruxnr1Omsoj49_EwZ2XTbfmpj
X-Proofpoint-GUID: 1-QFsvHruxnr1Omsoj49_EwZ2XTbfmpj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=663 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0 suspectscore=0
 spamscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110136

On 8/29/2024 6:40 AM, Gokul Sriram Palanisamy wrote:
...

> +++ b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
> @@ -0,0 +1,354 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2016-2018 Linaro Ltd.
> + * Copyright (C) 2014 Sony Mobile Communications AB
> + * Copyright (c) 2012-2018, 2024 The Linux Foundation. All rights reserved.

I'm currently vetting a proposed ath driver change that is dependent upon two
of yours, and my vetting tools ran on your patchsets as well. This is one of
several issues that my vetting tools flagged.

This last copyright doesn't look correct.

As of December 2021 Qualcomm stopped assigning copyright to the Linux
Foundation via the Code Aurora Forum. Any Qualcomm contributions after
December 2021 should be Copyright Qualcomm Innovation Center, Inc.

So I suspect this last line should be replaced with two:
> + * Copyright (c) 2012-2018 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.

