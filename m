Return-Path: <linux-arm-msm+bounces-33809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA17C9980A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 10:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE1401C27B5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 08:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF061EABA0;
	Thu, 10 Oct 2024 08:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B7+Vftnm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13A31EABA4;
	Thu, 10 Oct 2024 08:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728549071; cv=none; b=RdjvLCvxaU3tddw/ad8KTaufKlCDm+oVg+7WHNCuvrLHXl3SIRKtOfBL2tsidq1QbtkhO98tfo/suiNe0n2qB1kMujsRO4WDBYKB25hZ5tH6oSG3OK3fyqKcjCXiYaEWucXu9qG3ck6n0xon6XfvUlCicn3aNJj930QObxsIBRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728549071; c=relaxed/simple;
	bh=ytncaiCt8F/wqv7NZqQIScCmZV4BCQrJ5NbBCe/Ra3A=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZeWQiI2nt4Xbb1WFgsk1X2F5Df10/K6agQ1hU4MDoydN4Xu/5YAaLfq5pNC2HUHz7959hO+Px2pOsyMECAXik3KUPcjTSf2Z8fFD4hBNh16rq6iJUmiNhx5X8pgsKQIvYyGlV6DZji0tCzmm60rpCHznEsmW0KySUp7EIMQZmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B7+Vftnm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1bLCH011352;
	Thu, 10 Oct 2024 08:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TlM9K4SQb0WMGVAdMkXY7Bl1yUy+AsFYLAamIDAmyhA=; b=B7+VftnmgH00r3yx
	GQzahN17zBdg8Zs0D6Lk4q7RLD7TBC9zdPhLcJRmo8VbhvKT37g5MbE5yTXavKwD
	n0K7KTE6E+G6NwJm3GpNcVdiCnn/ZikUVHDRhaYJArnOlA+zHQ3z0Wz0V6x/0YYq
	ciR37VVPRbLn/Kzg37FoxYdS2imW8isxzIHfWyB//b729hgttkCLZX63oe5kMlb7
	GiiE9x0liTK/TpyOkhh8eUSOhh6wlvAa5jK7WuJOqo+NSFPgMy3S7GbWAIZtmuuc
	2MFKSrW4QwWiUWZ6M+2g9xGKmWmFEQiV5Cq4xwqrAdULOiU34FTSCdHXGE75jnJS
	Tp827A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425xthst86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 08:31:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A8V3wa029187
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 08:31:03 GMT
Received: from hu-shashim-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 01:30:59 -0700
Date: Thu, 10 Oct 2024 14:00:55 +0530
From: Shiraz Hashim <quic_shashim@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Mukesh Ojha
	<quic_mojha@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Mathieu
 Poirier" <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: remoteproc: qcom,pas-common: Introduce
 iommus and qcom,devmem property
Message-ID: <20241010083055.GI1421305@hu-shashim-hyd.qualcomm.com>
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
 <20241004212359.2263502-2-quic_mojha@quicinc.com>
 <pt5x7miszg3vrqjimhdfesxghnpdsu4zzdr37vcmuze7yccmkn@twjeb5cfdqph>
 <ZwP/tA06k6we7uUh@hu-mojha-hyd.qualcomm.com>
 <CAA8EJpqay7Nryb5HwwHE1+iiMXKUvqi-djmCsYN8fxigt-s-tQ@mail.gmail.com>
 <20241009140419.GH1421305@hu-shashim-hyd.qualcomm.com>
 <f94de63b-2ca3-4749-b008-b47d6df8e1ff@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f94de63b-2ca3-4749-b008-b47d6df8e1ff@kernel.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rx0oi2yUyGUX1RV8z12l6UaBETxNyn9z
X-Proofpoint-GUID: rx0oi2yUyGUX1RV8z12l6UaBETxNyn9z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1011 mlxlogscore=900 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410100055

On Thu, Oct 10, 2024 at 09:15:59AM +0200, Krzysztof Kozlowski wrote:
> On 09/10/2024 16:04, Shiraz Hashim wrote:
> > On Mon, Oct 07, 2024 at 06:25:01PM +0200, Dmitry Baryshkov wrote:
> >> On Mon, 7 Oct 2024 at 17:35, Mukesh Ojha <quic_mojha@quicinc.com> wrote:
> >>>
> >>> On Sun, Oct 06, 2024 at 10:38:01PM +0300, Dmitry Baryshkov wrote:
> >>>> On Sat, Oct 05, 2024 at 02:53:54AM GMT, Mukesh Ojha wrote:
> >>>>> From: Shiraz Hashim <quic_shashim@quicinc.com>
> >>>>>
> >>>>> Qualcomm’s PAS implementation for remote processors only supports a
> >>>>> single stage of IOMMU translation and is presently managed by the
> >>>>> Qualcomm EL2 hypervisor (QHEE) if it is present. In the absence of QHEE,
> >>>>> such as with a KVM hypervisor, IOMMU translations need to be set up by
> >>>>> the KVM host. Remoteproc needs carveout memory region and its resource
> >>>>> (device memory) permissions to be set before it comes up, and this
> >>>>> information is presently available statically with QHEE.
> >>>>>
> >>>>> In the absence of QHEE, the boot firmware needs to overlay this
> >>>>> information based on SoCs running with either QHEE or a KVM hypervisor
> >>>>> (CPUs booted in EL2).
> >>>>>
> >>>>> The qcom,devmem property provides IOMMU devmem translation information
> >>>>> intended for non-QHEE based systems.
> >>>>>
> >>>>> Signed-off-by: Shiraz Hashim <quic_shashim@quicinc.com>
> >>>>> Co-Developed-by: Mukesh Ojha <quic_mojha@quicinc.com>
> >>>>> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> >>>>> ---
> >>>>>  .../bindings/remoteproc/qcom,pas-common.yaml  | 42 +++++++++++++++++++
> >>>>>  .../bindings/remoteproc/qcom,sa8775p-pas.yaml | 20 +++++++++
> >>>>>  2 files changed, 62 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> >>>>> index 63a82e7a8bf8..068e177ad934 100644
> >>>>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> >>>>> @@ -52,6 +52,48 @@ properties:
> >>>>>      minItems: 1
> >>>>>      maxItems: 3
> >>>>>
> >>>>> +  iommus:
> >>>>> +    maxItems: 1
> >>>>> +
> >>>>> +  qcom,devmem:
> >>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> >>>>> +    description:
> >>>>> +      Qualcomm’s PAS implementation for remote processors only supports a
> >>>>> +      single stage of IOMMU translation and is presently managed by the
> >>>>> +      Qualcomm EL2 hypervisor (QHEE) if it is present. In the absence of QHEE,
> >>>>> +      such as with a KVM hypervisor, IOMMU translations need to be set up by
> >>>>> +      the KVM host. Remoteproc might need some device resources and related
> >>>>> +      access permissions to be set before it comes up, and this information is
> >>>>> +      presently available statically with QHEE.
> >>>>> +
> >>>>> +      In the absence of QHEE, the boot firmware needs to overlay this
> >>>>> +      information based on SoCs running with either QHEE or a KVM hypervisor
> >>>>> +      (CPUs booted in EL2).
> >>>>> +
> >>>>> +      The qcom,devmem property provides IOMMU devmem translation information
> >>>>> +      intended for non-QHEE based systems. It is an array of u32 values
> >>>>> +      describing the device memory regions for which IOMMU translations need to
> >>>>> +      be set up before bringing up Remoteproc. This array consists of 4-tuples
> >>>>> +      defining the device address, physical address, size, and attribute flags
> >>>>> +      with which it has to be mapped.
> >>>>
> >>>> I'd expect that this kind of information is hardware-dependent. As such
> >>>> it can go to the driver itself, rather than the device tree. The driver
> >>>> can use compatible string to select the correct table.
> >>>>
> >>>
> >>> IIUC, are you saying that to move this into driver file and override the
> >>> compatible string via overlay ?
> >>
> >> Ideally we should live without compat overrides. On the other hand,
> >> sc7180 and sc7280 provide an example of doing exactly that.
> > 
> > I am not sure if there can arise a case where updated adsp firmware
> > for particular board(s) may require additional access.
> > 
> > Having it in device tree adds a convenience to deal with such
> > variance. 
> > 
> 
> That's a downstream argument... Just look at the downstream DTS.
> Everything, even software properties, can be added to DT, right?

I was thinking this binding is similar to iommu-addresses approach,
however that is under reserved-memory enumerating memory regions.

regards
Shiraz

