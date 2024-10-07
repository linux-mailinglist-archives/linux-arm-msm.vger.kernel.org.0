Return-Path: <linux-arm-msm+bounces-33440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCD6993661
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 20:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C9E31F24257
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 18:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDCC21DE2A5;
	Mon,  7 Oct 2024 18:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c5Q+K2x5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5102E1D968B;
	Mon,  7 Oct 2024 18:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326359; cv=none; b=lciE6iDcIJ8P7nM2NEivngHn+Nslmyo7W2s/rA9gn0ErkuD3l3streCGHphlW+HBwBafMXYXvg9Yc3lyWaP+8h+8ekB9qq4LQdnBS53tpOdAWzoXDvJXeWMZiuuurKk21B6PFxP2ssmTbKNwOk7MtgfgwpD8cCpUI7NZrRaT3Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326359; c=relaxed/simple;
	bh=am3VSi952K0W4OlmfLrbiTkB5lXhyVslENYXyrOGRA4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQPl1Br6wRj9l6QmLkGtczqsHpFqYxCdo8oZwce++iOZwbrRme+jeW6quuz1T0CLUmZNURT452uW7YPZFBJpQ61XXnBrpT12boYD5K0DlwPskAWE7MoFJttY0WKb06L1YVtSn3civxmZ6hZxWqCOlR5Wcz8SjcWidexxcDQDIQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c5Q+K2x5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497EKiiN008866;
	Mon, 7 Oct 2024 18:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0blahXk/11FV3rkhZYHSPHao4ouylR0pzU6GjiRxdE0=; b=c5Q+K2x514Mc9fnR
	qBCurnCBRyF0u66m597nIRX72cu/9JSXJELc/11NQYxp14ySXM0qukBUUJQ7KXYr
	7FeF/FuMXIAFHXYc28db2XTzddwon14API0CpdK9rJN6T7gJ+nAjs5wR7E6k/ifJ
	5St2rdlxFIKVh/bEV+jobhK7vyKG/Cv+9BSMjnuzvX58qhg6TLMmaeL4L6SZR0rS
	er2ufBWyoDZ1uHbNnF8c7sUJNpazw6/t5VWuQFcMR6aO79U/NihJWeWXA7xLhS/T
	6GI4mGc/Xe+Qdj93teChKtR2Q9yoapJmYbmSl1yuPlIRKNVmtHtZCcYFVF4K+ONL
	43M/OA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xv6w3g0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 18:39:14 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 497IdD0K021057
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 18:39:13 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 7 Oct 2024 11:39:09 -0700
Date: Tue, 8 Oct 2024 00:09:05 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad
 Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/6] Peripheral Image Loader support for Qualcomm SoCs
Message-ID: <ZwQqyYNVLR2OU8jh@hu-mojha-hyd.qualcomm.com>
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
 <r4zkfioctmlatxkb4lqmfc7vk7cdenenihoicq2k37wvxeihss@gtkzxr26p6ei>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <r4zkfioctmlatxkb4lqmfc7vk7cdenenihoicq2k37wvxeihss@gtkzxr26p6ei>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hvkRFojiKz7RZvLToOHNcF9q5afeeT0G
X-Proofpoint-GUID: hvkRFojiKz7RZvLToOHNcF9q5afeeT0G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070129

On Sun, Oct 06, 2024 at 10:34:19PM +0300, Dmitry Baryshkov wrote:
> On Sat, Oct 05, 2024 at 02:53:53AM GMT, Mukesh Ojha wrote:
> > Qualcomm is looking to enable remote processors on the SA8775p SoC
> > running KVM Linux host and is currently trying to figure out an
> > upstream-compatible solution for the IOMMU translation scheme problem it
> > is facing when SoCs running with KVM. This issue arises due to
> > differences in how IOMMU translation is currently handled on SoCs
> > running Qualcomm EL2 hypervisor(QHEE) where IOMMU translation for any
> > device is completely owned by it and the other issue is that remote
> > processors firmware does not contain resource table where these IOMMU
> > configuration setting will be present.
> > 
> > Qualcomm SoCs running with the QHEE(EL2) have been utilizing the
> > Peripheral Authentication Service (PAS) from its TrustZone (TZ) firmware
> > to securely authenticate and reset via a single SMC call
> > _auth_and_reset_.  This call first gets trapped to QHEE, which then
> > makes a call to TZ for authentication. Once it is done, the call returns
> > to QHEE, which sets up the IOMMU translation scheme for these remote
> > processors and later brings them out of reset. The design of the
> > Qualcomm EL2 hypervisor dictates that the Linux host OS running at EL1
> > is not allowed to set up IOMMU translation for remote processors,
> > and only a single stage is being configured for them.
> > 
> > To make the remote processors’ bring-up (PAS) sequence
> > hypervisor-independent, the auth_and_reset SMC call is now entirely
> > handled by TZ. However, the problem of IOMMU handling still remains with
> > the KVM host, which has no knowledge of the remote processors’ IOMMU
> > configuration.
> > 
> > We have looked up one approach where SoC remoteproc device tree could
> > contain resources like iommus for remoteproc carveout and qcom,devmem
> > specific binding for device memory needed for remoteproc and these
> > properties are optional and will only be overlaid by the firmware if it
> > is running with non-QHEE based hypervisor like KVM.
> 
> Can you follow the approach that has been implemented for existing
> systems (ChromeOS) not using QHEE? See drivers/remoteproc/qcom_q6v5_adsp.c
> If this approach can not be used, please describe why.
>

I believe, drivers/remoteproc/qcom_q6v5_adsp.c does not follow TZ's PAS
method (Secure) of handling remoteproc that may be the reason it has
been kept separately from drivers/remoteproc/qcom_q6v5_pas.c . If we
keep this implementation align with current PAS driver we would acheive
more code reusability with less code change.

However, I am not against, if we want to keep this as separate driver
with qcom_q6v5_pas_common.c shared between the current pas driver
with QHEE vs this implementation with non-QHEE.

-Mukesh

> > 
> > - Patch 1/6 adds the iommus and qcom,devmem binding for PAS common yaml.
> > - Patch 2/6 and 3/6 add helper function to IOMMU map and unmap carveout
> >   and device memory region.
> > - Patch 4/6 adds a function to parse individual field of qcom,devmem property.
> > - Patch 5/6 add helpers to create/destroy SHM bridge for remoteproc
> >   carveout and to get memory from tzmem SHM bridge pool for remoteproc
> >   firmware metadata.
> > - Patch 6/6 enable all the required support to enable remoteproc for
> >   non-QHEE hypervisor based systems like KVM host via parsing the iommus
> >   properties and mapping/unmapping carveout and device memory based on
> >   it.
> > 
> > Komal Bajaj (1):
> >   remoteproc: qcom: Add iommu map_unmap helper function
> > 
> > Mukesh Ojha (2):
> >   remoteproc: qcom: Add support of SHM bridge to enable memory
> >     protection
> >   remoteproc: qcom: Enable map/unmap and SHM bridge support
> > 
> > Shiraz Hashim (3):
> >   dt-bindings: remoteproc: qcom,pas-common: Introduce iommus and
> >     qcom,devmem property
> >   remoteproc: qcom: Add helper function to support IOMMU devmem
> >     translation
> >   remoteproc: qcom: Add support to parse qcom,devmem property
> > 
> >  .../bindings/remoteproc/qcom,pas-common.yaml  |  42 +++++
> >  .../bindings/remoteproc/qcom,sa8775p-pas.yaml |  20 +++
> >  drivers/firmware/qcom/qcom_scm.c              |  29 +++-
> >  drivers/firmware/qcom/qcom_tzmem.c            |  14 +-
> >  drivers/remoteproc/qcom_common.c              | 148 ++++++++++++++++++
> >  drivers/remoteproc/qcom_common.h              |  38 +++++
> >  drivers/remoteproc/qcom_q6v5_pas.c            | 140 ++++++++++++++++-
> >  include/linux/firmware/qcom/qcom_scm.h        |   1 +
> >  include/linux/firmware/qcom/qcom_tzmem.h      |  10 ++
> >  9 files changed, 423 insertions(+), 19 deletions(-)
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

