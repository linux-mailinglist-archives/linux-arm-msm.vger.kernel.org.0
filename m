Return-Path: <linux-arm-msm+bounces-33406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 865A6992F84
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:37:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 386371F238E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BBE1D4353;
	Mon,  7 Oct 2024 14:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RahSImvC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E568C188588;
	Mon,  7 Oct 2024 14:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311843; cv=none; b=fIVAPtMuiOd8fYImGIg+aKajF39UW57RKPRMi75ZPbNjZK4kZdAnnMyH5fsw5lT/Cl+pnietEXcLhlHt52lWm4y4iAJtgdQ22H8bq7cD9NiiP02RGJVMZAHPm2udUiYgNViKwHlKP3h4/UgPbG/TNeQQTrNc5alcfcSz/rCtVMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311843; c=relaxed/simple;
	bh=PQBd4ZyJpwY+UYzMQdcq96al0+Oaadfgarg0/2UDdi8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5NLotLvmQK0iOF/nbezq4cbQaBryz5vx3TpDgP0iNlhUJXHJJ+rJy+3WVzo1wy6iTXHdAZ2fzd4f182oMoQYFa3SkOlU5h4MccsS97P3ues7V4VOFuOCm23omm0b10ACbsMrxk0R4o5oj5plaQ43qE55XpzNyPZl64B15UmmyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RahSImvC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497ESDdO003776;
	Mon, 7 Oct 2024 14:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nr8ntL29nq83RMnS527uHszP
	tMzlRgHfx+H0N0jfDd0=; b=RahSImvCPTBDB4CWw0aWbkMGYvCCwj+uZkNLYslm
	pB9FqeSGsXaWISyNKRmG1XC+NaAwfClQWSp30p3o4MuWotY85yp7Uh5DUg0w2K1l
	6MskHDWyf9YJ5in3A2b5ECRoS5bd/k3+kO38H0CiybwnFob3TO5oKp855wo8qZcY
	n4lxJrJyGozq8MMFBf9RLihubcPkviEKz8U8NphnQElM+nnHo4OxgYEO8r94+fnK
	csBjU7xWWxI/9Lo9+pRYZNDvmFI/cRQ39UQ0r5IuCQS3sMODWsNXoKuKiV0VcgVg
	XbOcmQSqJh5vv89VxfRvVmEOTcpnV1UAsfmqbKI2c5uTTA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xv6vesd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 14:37:15 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 497EbFOv013613
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 14:37:15 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 7 Oct 2024 07:37:10 -0700
Date: Mon, 7 Oct 2024 20:07:07 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <neil.armstrong@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Shiraz Hashim <quic_shashim@quicinc.com>
Subject: Re: [PATCH 3/6] remoteproc: qcom: Add helper function to support
 IOMMU devmem translation
Message-ID: <ZwPyE/rQOH181rqz@hu-mojha-hyd.qualcomm.com>
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
 <20241004212359.2263502-4-quic_mojha@quicinc.com>
 <83e23090-0390-4c2e-91e3-e222baaa889a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <83e23090-0390-4c2e-91e3-e222baaa889a@linaro.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xgcwnnmgVE3Tl4Kadex-ZQYuJlMy7sp6
X-Proofpoint-GUID: xgcwnnmgVE3Tl4Kadex-ZQYuJlMy7sp6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=589 mlxscore=0 bulkscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070103

On Mon, Oct 07, 2024 at 10:08:16AM +0200, neil.armstrong@linaro.org wrote:
> On 04/10/2024 23:23, Mukesh Ojha wrote:
> > From: Shiraz Hashim <quic_shashim@quicinc.com>
> > 
> > Qualcomm SoCs runnning with Qualcomm EL2 hypervisor(QHEE), IOMMU
> > translation set up for remote processors is managed by QHEE itself
> > however, for a case when these remote processors has to run under KVM
> 
> This is not true, KVM is a Linux hypervisor, remote processors have
> nothing to do with KVM, please rephrase.

Thanks, perhaps something like this,

"However, when same SoC runs with KVM configuration, remoteproc IOMMU
translation needs to be set from Linux host running remoteproc PAS
driver"

-Mukesh


