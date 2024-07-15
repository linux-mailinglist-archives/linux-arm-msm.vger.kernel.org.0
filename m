Return-Path: <linux-arm-msm+bounces-26134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5629A931091
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 10:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6AA51F2266A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 08:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5447B188CAD;
	Mon, 15 Jul 2024 08:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CTr606fP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D86188CAB;
	Mon, 15 Jul 2024 08:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721033201; cv=none; b=nTnglIq4VzBWa7V3qY0/nmwtQ11p18gAJJQM8dexP14uib6mEub+PgMkj+AfpUUPZn/0vwiVrb+WD9lmQM2tlVjUNW+6NAPfeCLOOxmwW6XmZIGBg4yN2R+1TpqHWsCQpvQVL2bNEJDE9nvXenJwX61x8SaPRFwUhbiP7BODEyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721033201; c=relaxed/simple;
	bh=gvPztlE04bwHbvnjt2UEo4JzGvWnKRKiwj+4oyqmycw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuoxDORsIdBgPNxObPt9PYW833MXaBhm9ddMgh9HTnFuTJc3tcsurzZCypQJxmSa/QAoffi9RQsx0L+p/SnMu5BrwAerTu8ee69rwBHLIpm6ocM/ZiNViWczSk3y5jB4r6Bj8kg18j1gs8s1Ih9ujl7S5bODsKBXlT03f5lJ9BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CTr606fP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46F2debH004463;
	Mon, 15 Jul 2024 08:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4XGHReCwz31Nr7T8i6dLxfKXDzDbTOf8X6lfMu4jhNk=; b=CTr606fPEq4hFxpb
	VN7LAuERCxxJVVU2BGqjbRNV6AKABInc+QkooBasQDb32MXHiJHPp6DSRe008SMU
	6zBoTUXpFJUgDsXApzWbrFSE4HE6iHwlz0shDJFPj4LGVjBAua7fTgwBdb71Y5WJ
	LQa6W1e1Ln1bM5kmyNI98UHD01m91LwPs+vqlD6QxYl5IA2wZzl0t44G2Hbne7Xp
	Lx7OKH2UtgbkjUgqArry+bDUDsGsQlWFopJumeNX8PqvBFPrzDGROICm5IhhxVwk
	0GTt80FdafGTv4N8pG4wT4HnvgIVN+Uinhpk0RrVvP7v0qPeU4g0iEf2zHJtnspN
	TicgTg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bhy6u89r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 08:46:25 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46F8kOIE015100
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 08:46:24 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 15 Jul 2024 01:46:18 -0700
Date: Mon, 15 Jul 2024 16:46:13 +0800
From: JieGan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>, "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        James Clark <james.clark@arm.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        "Tao
 Zhang" <quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Song
 Chai" <quic_songchai@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: arm: Add binding document for
 Coresight Control Unit device.
Message-ID: <ZpTh1VEmeTHNxZVx@jiegan-gv.ap.qualcomm.com>
References: <20240705090049.1656986-1-quic_jiegan@quicinc.com>
 <20240705090049.1656986-3-quic_jiegan@quicinc.com>
 <208b3861-6898-4506-9152-c9d770ef1555@arm.com>
 <Zou7FA2Av7CJO+ds@jiegan-gv.ap.qualcomm.com>
 <Zou+fmUJoyzamWcw@jiegan-gv.ap.qualcomm.com>
 <6a23eb7f-2fad-4a44-bf7c-ab7f01c342f3@arm.com>
 <ZozR+c7ggXWFwyOG@jiegan-gv.ap.qualcomm.com>
 <Zo+Zd96GHcQc5AnT@jiegan-gv.ap.qualcomm.com>
 <8a7c65dc-fef8-47ee-bd7a-d7f20db4f6b5@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a7c65dc-fef8-47ee-bd7a-d7f20db4f6b5@arm.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6dgFmrgDB8x6hgiU6Fw1isJqKkRcPEvm
X-Proofpoint-ORIG-GUID: 6dgFmrgDB8x6hgiU6Fw1isJqKkRcPEvm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_03,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407150069

On Thu, Jul 11, 2024 at 10:32:17AM +0100, Suzuki K Poulose wrote:
> On 11/07/2024 09:36, JieGan wrote:
> > On Tue, Jul 09, 2024 at 02:00:25PM +0800, JieGan wrote:
> > > On Mon, Jul 08, 2024 at 01:50:11PM +0100, Suzuki K Poulose wrote:
> > > > On 08/07/2024 11:25, JieGan wrote:
> > > > > On Mon, Jul 08, 2024 at 06:10:28PM +0800, JieGan wrote:
> > > > > > On Mon, Jul 08, 2024 at 10:41:55AM +0100, Suzuki K Poulose wrote:
> > > > > > > On 05/07/2024 10:00, Jie Gan wrote:
> > > > > > > > Add binding document for Coresight Control Unit device.
> > > > > > > 
> > > > > > > nit: This is again too generic ? corsight-tmc-control-unit ? After all
> > > > > > > thats what it is and not a *generic* coresight control unit ?
> > > > > > > 
> > > > > > coresight-tmc-control-unit is much better. We will check it.
> > > > > > > > 
> > > > > > > > Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> > > > > > > > ---
> > > > > > > >     .../bindings/arm/qcom,coresight-ccu.yaml      | 87 +++++++++++++++++++
> > > > > > > >     1 file changed, 87 insertions(+)
> > > > > > > >     create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
> > > > > > > > 
> > > > > > > > diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000000..9bb8ced393a7
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
> > > > > > > > @@ -0,0 +1,87 @@
> > > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > > +%YAML 1.2
> > > > > > > > +---
> > > > > > > > +$id: http://devicetree.org/schemas/arm/qcom,coresight-ccu.yaml#
> > > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > > +
> > > > > > > > +title: CoreSight Control Unit
> > > > > > > > +
> > > > > > > > +maintainers:
> > > > > > > > +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
> > > > > > > > +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> > > > > > > > +  - Jie Gan <quic_jiegan@quicinc.com>
> > > > > > > > +
> > > > > > > > +description:
> > > > > > > > +  The Coresight Control unit controls various Coresight behaviors.
> > > > > > > > +  Used to enable/disable ETR’s data filter function based on trace ID.
> > > > > > > > +
> > > > > > > > +properties:
> > > > > > > > +  compatible:
> > > > > > > > +    const: qcom,coresight-ccu
> > > > > > > > +
> > > > > > > > +  reg:
> > > > > > > > +    maxItems: 1
> > > > > > > > +
> > > > > > > > +  clocks:
> > > > > > > > +    maxItems: 1
> > > > > > > > +
> > > > > > > > +  clock-names:
> > > > > > > > +    items:
> > > > > > > > +      - const: apb_pclk
> > > > > > > > +
> > > > > > > > +  reg-names:
> > > > > > > > +    items:
> > > > > > > > +      - const: ccu-base
> > > > > > > > +
> > > > > > > > +  in-ports:
> > > > > > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > > > > > +
> > > > > > > > +    unevaluatedProperties:
> > > > > > > > +      patternProperties:
> > > > > > > > +        '^port(@[0-7])?$':
> > > > > > > > +          description: Input connections from CoreSight Trace bus
> > > > > > > > +          $ref: /schemas/graph.yaml#/properties/port
> > > > > > > > +
> > > > > > > > +          properties:
> > > > > > > > +            qcom,ccu-atid-offset:
> > > > > > > 
> > > > > > > Why do we need this atid offset ? Couldn't this be mapped to the "port"
> > > > > > > number ?
> > > > > > > 
> > > > > > > e.g, input-port 0 on CCU => Offset x
> > > > > > >        input-port 1 on CCU => (Offset x + Size of 1 region)
> > > > > > If the first ATID offset remains constant, it appears to be feasible.
> > > > > > We will consider the possibility of this solution.
> > > > > We just checked the ATID offset varies across different hardware platforms.
> > > > > It defined as 0xf4 on some platforms, and some others defined as 0xf8.
> > > > 
> > > > What do you mean ? The offset where you apply the filter changes across
> > > > different platforms ? or different "tmc-control-unit" implementations ?
> > > > Is this discoverable from the device ? We could use different
> > > > compatibles for different "types" of the "devices". Simply adding
> > > > something in the DT is not the right way.
> > > 
> > > I got your point here. I believe we should consult our hardware engineers first to check it.
> > > We need to figure out the design of ATID offset from hardware perspective. Then we can
> > > propose an alternative approach, such as associating the offset with a compitable value,
> > > to resolve this issue.
> > > 
> > > > 
> > > > > 
> > > > > So I think it should be better to define it in device tree node.
> > > > 
> > > > No. See above.
> > 
> > 
> > Hi Suzuki
> > 
> > There is a new solution for CCU device. We would like to separate one CCU device into several helper
> > devices, each responsible for one feature of the CCU device.
> > 
> > For the data filter feature, we will define the address of the AITD Register that included by CCU in DT
> > as base address of the helper node. So the driver code can easily program the register field with the base address.
> > With this solution, we may need define several helper nodes in DT file to support different features for CCU and each
> > helper device needs a driver to support its behavior.
> > 
> > for example, ATID register for ETR0 with base address 0x10000f8: (tmp name used, TDFU for tmc data filter unit)
> 
> That looks like a hack to me and don't prefer that and there would be
> multiple mappings for a single device and that could complicate device
> resource accounting.

This solution dropped. We will consider another proper solution to address the issue.

> 
> > 
> > TDFU@10000f8 {
> > ...
> > }
> > 
> > ATID register for ETR1 with base address 0x1000108:
> > TDFU@1000108 {
> > ...
> > }
> > 
> > The CCU device supports various features and the data filter feature for ETR is one of those features. How to support
> > those features with one helper_enable function is a serious challenge. That's why we would like to separate it.
> > Meanwhile, This solution can also resolve the offset issue.
> > 
> > We are looking forward your opinions with this proposal.
> 
> We need to know what other functionalities are supported and how that
> will be used ?
>
Sorry for the late reply.
I will introduce the features expected to be merged into the community.

Excepts for data filter feature for ETR, there are three more major features supported by CCU:
1. Byte counter: It is responsible for moving trace data from ETR buffer to main memory(e.g. main DDR RAM or SD card) to prevent
older trace data from being overwritten by newer data. There is a register named QDSS_CS_QDSSCSR_ETRIRQCTRL in CCU device that
controls this feature. The value of this register defines the number of bytes that when moved by the ETR AXI interface. The system will trigger
an interrupt to transfer the data when the data amount exceeds the specified value. ETR must be enabled when use this interrupt function.

for example, When the value 1000 is set in the register (in binary), it indicates that the data amount is 64 bytes.
The interrupt is triggered when the data amount exceeds 64 bytes.
(Binary 1000 equals 8 in decimal. Multiplying this by 8 gives a data amount of 64 bytes.) 

Here is the link for the patch series for Byte counter feature.
https://lore.kernel.org/linux-arm-msm/20230813151253.38128-1-quic_jinlmao@quicinc.com/

2. MSR for TPDM: QC introduced a feature called Switched Always on Debug(SWAO). The component AOSS that utilize the SWAO have designed with 4 CMB TPDM
and 1 DSB TPDM units. Control of bus selection that will reach TPDM CMB are done through CCU.
The registers that designed to control the bus selection:
CS_SWAOCSR_TPDM_PRIO0_CMB_CONTROL
CS_SWAOCSR_TPDM_PRIO1_CMB_CONTROL
CS_SWAOCSR_TPDM_PRIO2_CMB_CONTROL
CS_SWAOCSR_TPDM_PRIO3_CMB_CONTROL

for example, the value programmed into the register represents:
00000 for BCM
00100 for DDRAUX
01000 for VRM
...

3. Direct to USB(D2USB): There is a register called CS_QDSSCSR_QDSS_DIR2USB in CCU to control the D2USB feature. When sets, the data in ETR will directly
output to the USB over the existing system bus infrastructure.

Besides, the CCU also support some features like timestamp, Hardware Event Control for STM.

> In the worst case, you could define register bases for each port in the
> CCU device node.
We will consider this solution as plan b that we do not anticipate implementing.

> 
> TDFU@.. {
> 	reg = <base-address 4K>
> 
> 	<I don't know the standard property name for> =
> 	List of {
> 	<port number>, <Offset from base>,
> 	}
> }
> 
> Suzuki
> 

Thanks,
Jie

