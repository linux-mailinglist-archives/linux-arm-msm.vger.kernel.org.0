Return-Path: <linux-arm-msm+bounces-36613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FF89B845A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 21:29:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 430DFB20E1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 20:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF191CB51C;
	Thu, 31 Oct 2024 20:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Mz2/udmU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EBD1A2562;
	Thu, 31 Oct 2024 20:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730406548; cv=none; b=hKjhIwk635kP9TeR6EPzCfp1hP5kIoVOQHCBZsneoN4YPj5VDS06Uh7tqhWjccN5buiF0tkPcgLHfG1Jf98PHCtPjk9Vo5dFdR6KNZnFksNuSHsennsYNLQe0Bjhtp//NRDe5vzgT88KxOq9JdvcT84yPFCN1K5dUN2sBQt062E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730406548; c=relaxed/simple;
	bh=1NAQqoEoU5/vGXOsKRWEJNvxjIIvHcDzT0+RaY2sUcI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FuVr90pfa2D1VmaUT2PDD0ndXo1+/oxkgAdWIPpiHf/T1MHU9HGd5vV5972P9pCzTvzYQ+uVc9V1hJi0jQ5wTQrKMqPNDSUO6Cv+7Erbb+fPAwfeo+RE+CXAMk5ZHL/ROw/ZHEeneZ123bXFxkuQgs9uTyu1OLMoWwd39bzXFYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Mz2/udmU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VCYKpI004019;
	Thu, 31 Oct 2024 20:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uMNmbClPpRYvqKTvdwHk7cmf
	TLGMSr/S0IQVf5aIJJ4=; b=Mz2/udmUXGhUJyaLOKFyvKH/i6cDyr6gpKNYqJou
	70gdGKEsewdz+NG5sdJQuquA4/ovE56HVFrtuCGmHQOc1a06dEbpMIpzsZNMajCK
	EJHO7TxYIRrCb4zg8m1cnAAeVT8V7gGQ0kMc5biNnqTRSMlRy4nD2vBMfbmtJyUW
	UQf4RInhHwKoZ9fjlFdB7Dg6B6n3OLbnX0/LoDn2i3Yh9NSpTD3pKIrBTaAi4Mma
	Ixw1HrIIMi8+1PeHnZuDpng7aK/bq7s7AaluIC/bk1pyyQRCVYnS1FRyy3xhLYrf
	FACDFngS1VdX1n0NV0KHRtMuNbugJ/jBmF1Slg2FhuqzLg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kns3mq8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 20:29:02 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49VKT1Ui030753
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 20:29:01 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 31 Oct 2024 13:28:58 -0700
Date: Thu, 31 Oct 2024 13:28:58 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Tingguo Cheng
	<quic_tingguoc@quicinc.com>,
        <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs615-ride: Enable PMIC
 peripherals
Message-ID: <20241031115300700-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-0-f0778572ee41@quicinc.com>
 <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-2-f0778572ee41@quicinc.com>
 <j4ggfrynyoriseef5r5x6uwgo6cespll2np7uitc64yagoa6pz@r3ro2cpqrrry>
 <38cceae8-5203-4057-bd8b-f20fe3656474@quicinc.com>
 <CAA8EJprYHjYVM58e7i7Sxj64DSth4hhW_cUZ3hGqX7u0ecZFQg@mail.gmail.com>
 <ad9c7e47-8a7b-4aee-8d88-cabf42ec3298@oss.qualcomm.com>
 <csxhtspv4klk3yrdqx4rkoag3ssaagim74nvdpglijkqzfux4d@btniilyxnnwm>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <csxhtspv4klk3yrdqx4rkoag3ssaagim74nvdpglijkqzfux4d@btniilyxnnwm>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ug-cRTnA1zVwyId4jz-94oENzCbvOI7s
X-Proofpoint-ORIG-GUID: Ug-cRTnA1zVwyId4jz-94oENzCbvOI7s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 spamscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310155

On Mon, Oct 28, 2024 at 03:14:49PM +0200, Dmitry Baryshkov wrote:
> On Mon, Oct 28, 2024 at 02:09:45PM +0100, Konrad Dybcio wrote:
> > On 28.10.2024 10:41 AM, Dmitry Baryshkov wrote:
> > > On Mon, 28 Oct 2024 at 10:40, Tingguo Cheng <quic_tingguoc@quicinc.com> wrote:
> > >> On 10/28/2024 4:23 PM, Dmitry Baryshkov wrote:
> > >>> On Mon, Oct 28, 2024 at 04:03:25PM +0800, Tingguo Cheng wrote:
> > >>>> Enable PMIC and PMIC peripherals for qcs615-ride board.
> > >>>>
> > >>>> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> > >>>> ---
> > >>>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 15 +++++++++++++++
> > >>>>   1 file changed, 15 insertions(+)
> > >>>>
> > >>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> > >>>> index ee6cab3924a6d71f29934a8debba3a832882abdd..37358f080827bbe4484c14c5f159e813810c2119 100644
> > >>>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> > >>>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> > >>>> @@ -6,6 +6,7 @@
> > >>>>
> > >>>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > >>>>   #include "qcs615.dtsi"
> > >>>> +#include "pm8150.dtsi"
> > >>>>   / {
> > >>>>      model = "Qualcomm Technologies, Inc. QCS615 Ride";
> > >>>>      compatible = "qcom,qcs615-ride", "qcom,qcs615";
> > >>>> @@ -210,6 +211,20 @@ &rpmhcc {
> > >>>>      clocks = <&xo_board_clk>;
> > >>>>   };
> > >>>>
> > >>>> +&pon {
> > >>>> +    /delete-property/ mode-bootloader;
> > >>>> +    /delete-property/ mode-recovery;
> > >>>
> > >>> Why?
> > >> Because boot modes will be supported on PSCI module from another patch,
> > >> reboot-modes are required to remove from PMIC side.

I don't know why "required to remove" is here. We *could* continue to
program the SDAM from Linux.

That being said, I don't know that the firmware/bootloader from the
QCS615 Ride has the concept of "reboot to recovery" since it's not an
Android ecosystem. I'd let Tingguo comment on it.

> > 
> > Do we know whether the PSCI call does the same thing under the hood?
> 
> It might be writing to the SDAM. For example, SAR2130P also uses PM8150
> and, if I'm not mistaken, SDAM for reboot mode.
> 

Yes, PSCI does the same thing under the hood.

What is going here is that we have introduced the SYSTEM_RESET2 vendor
resets in some firmwares which run on boards that use PM8150. Based on
context here (IOW: I might be a little wrong on the details), I guess
QCS615 Ride is being added to Qualcomm Linux stack, which has newer
firmware that supports using the SYSTEM_RESET2 vendor resets.

IMO, we should move the mode-bootloader/mode-recovery properties out of
pm8150.dtsi and into the applicable board.dts. As Bjorn mentioned, the
interpretation of the cookie values is specific to the board's firmware,
not the the pmic*. Tingguo, can you submit patches to do that?

Regards,
Elliot

*: In general, the cookie values are consistent. Some values are only
applicable on automotive board or mobile board though (or IOT).


