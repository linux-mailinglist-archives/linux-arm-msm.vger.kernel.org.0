Return-Path: <linux-arm-msm+bounces-45773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CC6A18CA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 08:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8CB9188A2C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 07:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B18C18FC86;
	Wed, 22 Jan 2025 07:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jdVhzhik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49A033991;
	Wed, 22 Jan 2025 07:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737530279; cv=none; b=bkiYB0lo91mWHrUqdf8NFEMQPQFdjjpSONXk7Nazjfc5D7MlLepM51OmUnqZ7BOvKFqkoeHVfb58RyPsBt/3Us0kUykywBZ1/VZ6b1rEXD62WEZrUoSOf+4wbgonDY41vhsB8tQXYxUWOdG+dVlxdj82uq58TwluPl0Yk8y8ie8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737530279; c=relaxed/simple;
	bh=nvxzusxcTGOudgyLTBF218zRe9XV7IzBS0QgUlwjYSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S2hW7NrCTomGnELMQBQAKxjbju7O38N5bboVfk+co8S0/le1L4nEmm2OVChPE7Fi/mb8MRF/cHL+6PXwqNRktpOK66Ft1mwShO8yQakgVkHYjrTN1fVtl3ycfv4x9V100AgdacIasIeG+A904HMnlcJiX+jAt5qLSkDQyPDY6vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jdVhzhik; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M4v7jo016650;
	Wed, 22 Jan 2025 07:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hQWCtf7PInicrDfp0nAasjIsePxmC5ygcZFbarK3vj4=; b=jdVhzhikUlaN9zwP
	xqFjJMcjbGJVsaW1irnTl3VaY/DYSaz/QOJkPm4vt28N3nsxGVybwU8CLTv7zRLl
	EePBLCBY2ONptDitKNgRDssii+JqusIzAm4svLw9jbqOct/m8vdtX/RJUGW8MsSm
	rrjwtTMmsWTfxnMuHzhxBEtpn4hnmaVvhXhUXm98BWjSmMXLbWQfR8C8qh07Jya5
	ky/xdVlOHuhYJFQQJ07lDOVEKi/Uufe63E4EVcDWeHrzniPWBOLx2KXN0HEOV0Pc
	murl0GhoBnfEwVRuq/7aWgZFARaJkqTn0XIdvqBttp3ntLVflDF1Y38tnqPh4Mmy
	ZXDUkQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44at3g09yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 07:17:46 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50M7Hj1N001838
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 07:17:45 GMT
Received: from [10.239.28.138] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 21 Jan
 2025 23:17:42 -0800
Message-ID: <a2cc5a5a-6cbd-7564-a8df-8af2a652de2f@quicinc.com>
Date: Wed, 22 Jan 2025 15:17:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <p.zabel@pengutronix.de>,
        <abel.vesa@linaro.org>, <quic_qianyu@quicinc.com>,
        <neil.armstrong@linaro.org>, <manivannan.sadhasivam@linaro.org>,
        <quic_devipriy@quicinc.com>, <konrad.dybcio@oss.qualcomm.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250121094140.4006801-1-quic_wenbyao@quicinc.com>
 <20250121094140.4006801-3-quic_wenbyao@quicinc.com>
 <CAA8EJppXQpDrdXzJsTE7HWs=POt7yFAw0JVZFabN6Ks3fhZiWQ@mail.gmail.com>
From: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
In-Reply-To: <CAA8EJppXQpDrdXzJsTE7HWs=POt7yFAw0JVZFabN6Ks3fhZiWQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: s9e3olYmDeQCkhQb6dolveUQsyVngebI
X-Proofpoint-GUID: s9e3olYmDeQCkhQb6dolveUQsyVngebI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_03,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220051

On 1/21/2025 6:36 PM, Dmitry Baryshkov wrote:
> On Tue, 21 Jan 2025 at 11:43, Wenbin Yao <quic_wenbyao@quicinc.com> wrote:
>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>
>> Currently, BCR reset and PHY register setting are mandatory for every port
>> before link training. However, some QCOM PCIe PHYs support no_csr reset.
>> Different than BCR reset that is used to reset entire PHY including
>> hardware and register, once no_csr reset is toggled, only PHY hardware will
>> be reset but PHY registers will be retained,
> I'm sorry, I can't parse this.
The difference between no_csr reset and bcr reset is that no_csr reset
doesn't reset the phy registers. If a phy is enabled in UEFI, its registers
are programed. After Linux boot up, the registers will not be reset but
keep the value programmed by UEFI if we only do no_csr reset, so we can
skip phy setting.
>
>> which means PHY setting can
>> be skipped during PHY init if PCIe link was enabled in booltloader and only
>> no_csr is toggled after that.
>>
>> Hence, determine whether the PHY has been enabled in bootloader by
>> verifying QPHY_START_CTRL register. If it is programmed and no_csr reset is
>> present, skip BCR reset and PHY register setting, so that PCIe link can be
>> established with no_csr reset only.
> This doesn't tell us why we want to do so. The general rule is not to
> depend on the bootloaders at all. The reason is pretty simple: it is
> hard to update bootloaders, while it is relatively easy to update the
> kernel. If the hardware team issues any kind of changes to the
> programming tables, the kernel will get them earlier than the
> bootloader.
With this change, we don't need to upstream phy setting for all phys
support no_csr reset, this will save a great deal of efforts and simplify
the phy driver. Our goal is to remove proprietary PCIe firmware operations
from kernel. PHY is just the start and will be followed by controller,
clocks, regulators, etc. If program table need to be changed, the place to
do that will be UEFI.
>
>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 91 +++++++++++++++---------
>>   1 file changed, 58 insertions(+), 33 deletions(-)
>>

