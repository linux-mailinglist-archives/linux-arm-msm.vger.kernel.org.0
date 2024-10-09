Return-Path: <linux-arm-msm+bounces-33698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC420996CAD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 15:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 621CF1F21510
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 13:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5A01991D0;
	Wed,  9 Oct 2024 13:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eLJWPUsl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326F3192D6E;
	Wed,  9 Oct 2024 13:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728481853; cv=none; b=rbzwkVmVPe6hmm7fwWMOfwHJuCWS+ar3P4i3Fi4AIhyOih8Rdv7/fMMnPbXnyBU3JmJ24wJ70rp4fRbDt3pBZVEu7/gvVG9OwmG46uBtE0ySwCjkvylox4O9f9h5IN9WDWPTCP7zTNa7sB+5VBZP4bNpp5TIoB0lzijRMRyDFhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728481853; c=relaxed/simple;
	bh=X4TnJTxurWziK3v3Zy4Trv0kJnJ555qg9MbV8sv+F3k=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jt+D/uDpKm2zqaDiJXYJfo4HhXe99GqnRohcN8wsR2Wavwte23cm4JYOQn5/xz+zRTadoyw5sv/Vlq86EHzqLV3lEezEkiR4pfF4DR0CSPPLrTta/Nan+LW2hgGPIdLYf6djtp+3KGihYt/gYP4rqZmzZznlVr8rJ1IP4jcCE5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eLJWPUsl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4999eghH018007;
	Wed, 9 Oct 2024 13:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ID8IcFr7c2RC5aq4yF6GSz9+xbNb2bvDWiborrw7cI8=; b=eLJWPUslPRQX0alg
	2A6AYfHcjIaeUM8mhB2yZHA83Dk7yeZC22TrHXxO72m6j/HE+zipxkncNKN4o8Vd
	UFG429Uvqimn/7LLx2g2EZP7BDcVAEBvbZ/exKgV8+HMRnoKVFFlIkuOjQC89mS+
	yM1QnFu6awSlU5i0WJCYvmv3znP/TC8pUcVL5GZIPmHP2cFJwU3AWS8TJfWQbyNY
	nRuHtuapNqzIO5+NxiklJPRPl6pRmRR9QAUQSqomq8txJFoNGsFWgdEixztRVX/R
	ZDXtMTr2qlbdd12Rg4Disa2+qFm4OnCCIMtG5jYxe/WqiKfDQla+38FqCGB7ZBH+
	+ZdFGA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425c8qtgsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 13:50:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 499Doj18004436
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 13:50:45 GMT
Received: from hu-shashim-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 06:50:41 -0700
Date: Wed, 9 Oct 2024 19:20:37 +0530
From: Shiraz Hashim <quic_shashim@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Mukesh Ojha <quic_mojha@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/6] Peripheral Image Loader support for Qualcomm SoCs
Message-ID: <20241009135037.GG1421305@hu-shashim-hyd.qualcomm.com>
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
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ehSCrUS4Kdc-uj4lTyzCEbgCBpqjt1a3
X-Proofpoint-ORIG-GUID: ehSCrUS4Kdc-uj4lTyzCEbgCBpqjt1a3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 phishscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410090086

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

The intent is to reuse same PAS based remoteproc implementation
assisted by TZ with or without QHEE while qcom_q6v5_adsp.c caters to
independent control at Linux.
So it better suites to support it from qcom_q6v5_pas.c .

regards
Shiraz

