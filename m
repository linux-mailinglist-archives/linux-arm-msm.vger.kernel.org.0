Return-Path: <linux-arm-msm+bounces-33412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD0699315F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 17:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D364AB28D8C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 15:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE431D86DC;
	Mon,  7 Oct 2024 15:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gxYaGbRV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CC018BBB2;
	Mon,  7 Oct 2024 15:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728315330; cv=none; b=K+3Vc8oj4yqllYMPGhHDfv3+kpNSZyaG+qdRWZlhI9TufmKXCyn4/yaOaSizD2KSHtf6zNGW5Yne94Ix8tjhRijv/Sxr+32zl+5PF/zTPXj2quCfmFOpOV/WzMQSGbEUUCu4vMfgg23oX1gq/0PEBnjr9NagKEhdjHntENhZdQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728315330; c=relaxed/simple;
	bh=vmDcUWR28r4GCm7mjHQRvGrAOByN1ZiGI13saHCCk4E=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BN6yf5lZ3e05PIYYoEKyLa2p3r30hoSo0A6QgrmV/tdcvUrYGpjCH3eqIjhYNV9D0k6MqRlmjvXeD2D4rqTAykvsDCGnL6vyAzeWKYt5L+ixx0+McvODi2wCvdDvJ4jZ6ah600ToR3Z4e/OXBdkdz8RNGvgENfyvOtr17693+XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gxYaGbRV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497F6f9t003930;
	Mon, 7 Oct 2024 15:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T8D5E2ZeSNmgSSEISntkVqY99/wGIdZ25++9fHbZMf4=; b=gxYaGbRVPGhIgP4C
	mDcAw4e98KHBNTSC/sD807WG+v4Iy1YHGjYW9bCijZcQP7ehjB2T9uShgn79YIvq
	/eOwuRxReArKf9AwZBEtt2MN0ac84w6zxtgibC5Eiua2sOGqVnRE0+STWrNJPb25
	WgpTqTRrEoJ+BOnRww6PdZYApYi/nsk3ivSYSQpoaKYgJILQHjf+opVausS71FQe
	9GhIr/8LqgdjY2G9B1nDrkjENoBtMQnwcz5Hc9OTaxkLeHRrJpSEH1FoErgAIXrY
	CipCpo4Cs5mU277nfXIGd3zwULKJohyPCBN5COYoPrO8RSFKuHYgvoveZ+SZwZus
	kmcavQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xv6vn66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 15:35:24 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 497FZO07024422
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 15:35:24 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 7 Oct 2024 08:35:20 -0700
Date: Mon, 7 Oct 2024 21:05:16 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Subject: Re: [PATCH 1/6] dt-bindings: remoteproc: qcom,pas-common: Introduce
 iommus and qcom,devmem property
Message-ID: <ZwP/tA06k6we7uUh@hu-mojha-hyd.qualcomm.com>
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
 <20241004212359.2263502-2-quic_mojha@quicinc.com>
 <pt5x7miszg3vrqjimhdfesxghnpdsu4zzdr37vcmuze7yccmkn@twjeb5cfdqph>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <pt5x7miszg3vrqjimhdfesxghnpdsu4zzdr37vcmuze7yccmkn@twjeb5cfdqph>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XsO2qa38GjycV4QpXfsqKnxdo7dq3tT4
X-Proofpoint-GUID: XsO2qa38GjycV4QpXfsqKnxdo7dq3tT4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=504 mlxscore=0 bulkscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070110

On Sun, Oct 06, 2024 at 10:38:01PM +0300, Dmitry Baryshkov wrote:
> On Sat, Oct 05, 2024 at 02:53:54AM GMT, Mukesh Ojha wrote:
> > From: Shiraz Hashim <quic_shashim@quicinc.com>
> > 
> > Qualcomm’s PAS implementation for remote processors only supports a
> > single stage of IOMMU translation and is presently managed by the
> > Qualcomm EL2 hypervisor (QHEE) if it is present. In the absence of QHEE,
> > such as with a KVM hypervisor, IOMMU translations need to be set up by
> > the KVM host. Remoteproc needs carveout memory region and its resource
> > (device memory) permissions to be set before it comes up, and this
> > information is presently available statically with QHEE.
> > 
> > In the absence of QHEE, the boot firmware needs to overlay this
> > information based on SoCs running with either QHEE or a KVM hypervisor
> > (CPUs booted in EL2).
> > 
> > The qcom,devmem property provides IOMMU devmem translation information
> > intended for non-QHEE based systems.
> > 
> > Signed-off-by: Shiraz Hashim <quic_shashim@quicinc.com>
> > Co-Developed-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > ---
> >  .../bindings/remoteproc/qcom,pas-common.yaml  | 42 +++++++++++++++++++
> >  .../bindings/remoteproc/qcom,sa8775p-pas.yaml | 20 +++++++++
> >  2 files changed, 62 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> > index 63a82e7a8bf8..068e177ad934 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> > @@ -52,6 +52,48 @@ properties:
> >      minItems: 1
> >      maxItems: 3
> >  
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  qcom,devmem:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    description:
> > +      Qualcomm’s PAS implementation for remote processors only supports a
> > +      single stage of IOMMU translation and is presently managed by the
> > +      Qualcomm EL2 hypervisor (QHEE) if it is present. In the absence of QHEE,
> > +      such as with a KVM hypervisor, IOMMU translations need to be set up by
> > +      the KVM host. Remoteproc might need some device resources and related
> > +      access permissions to be set before it comes up, and this information is
> > +      presently available statically with QHEE.
> > +
> > +      In the absence of QHEE, the boot firmware needs to overlay this
> > +      information based on SoCs running with either QHEE or a KVM hypervisor
> > +      (CPUs booted in EL2).
> > +
> > +      The qcom,devmem property provides IOMMU devmem translation information
> > +      intended for non-QHEE based systems. It is an array of u32 values
> > +      describing the device memory regions for which IOMMU translations need to
> > +      be set up before bringing up Remoteproc. This array consists of 4-tuples
> > +      defining the device address, physical address, size, and attribute flags
> > +      with which it has to be mapped.
> 
> I'd expect that this kind of information is hardware-dependent. As such
> it can go to the driver itself, rather than the device tree. The driver
> can use compatible string to select the correct table.
> 

IIUC, are you saying that to move this into driver file and override the
compatible string via overlay ?

> > +
> > +      remoteproc@3000000 {
> > +          ...
> > +
> > +          qcom,devmem = <0x82000 0x82000 0x2000 0x3>,
> > +                        <0x92000 0x92000 0x1000 0x1>;
> > +      }
> > +
> > +    items:
> > +      items:
> > +        - description: device address
> > +        - description: physical address
> > +        - description: size of mapping
> > +        - description: |
> > +            iommu attributes - IOMMU_READ, IOMMU_WRITE, IOMMU_CACHE, IOMMU_NOEXEC, IOMMU_MMIO
> > +          enum: [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24,
> > +                  25, 26, 27, 28, 29, 30, 31 ]
> 
> Attributes should definitely be defined and then the DT should use
> defines rather than the raw values.
>

Ack.

-Mukesh


