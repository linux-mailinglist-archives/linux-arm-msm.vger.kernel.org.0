Return-Path: <linux-arm-msm+bounces-25926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AA292E288
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 10:37:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 474F31C218C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 08:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA1A155A59;
	Thu, 11 Jul 2024 08:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="poOm60Fb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3341448DD;
	Thu, 11 Jul 2024 08:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686991; cv=none; b=e/U2BgIFWtn/etLnnW8CCErotbZIpi8IhtOJpy+ICPaj96RX5aaA2XO/poC6cs6OqpUjknEcbWDZLxGGO822xLMYcTabi7f2OPFnzwxS2jcQIQmy145muDcTIgh1s/pK01XHP4QVifGPYT033w79kJMcc8pZsPSXpB8JsnLDvvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686991; c=relaxed/simple;
	bh=mB/WJoLmsl0hlxMdUMMUitcXLbBmC2f+e1e17lLZS7Q=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HV88ssTiGkM9gJHBjpPj5KMzb+otQdzA6XqH2y/j0Q5zUU2EgT3e5WQ/PmQjKCt/QVAB+bLJ5YRipfdpryxEhXbvGxA7UDrk8nooHmAnL0bpOlm/rX32chpgxNEJxxiBRr97If7cJW8alHO2iw+qqQjBXKyl8GfmRx8sQIrof1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=poOm60Fb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B4miqI007121;
	Thu, 11 Jul 2024 08:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zi58ZuXxigeTAt/0Sr2nceZ0ysJWA8AUBGlnLIUl7x8=; b=poOm60FbAWUv+lRo
	XuVgtfAhh5X/QS1/1E1ZrpYhwDj18QDHoitomLq6KFkfYahUnMEI3LjI78MC/XFe
	bfxORIB+j/jFHpt8qP7hAPG8/6TgBR9BGbkEY7lpOwJ61zlnxbhGELqaOB0y1+M7
	RY6UK+b6YN7i3xh4ULKHS3s03+UktTRpUSJezOKQNrxIBbNNDoln95YKzdyYcXkA
	qysdtkfQvPAlCPRbso8rlI+iv7WscaYwRfIW9A4ljxR3u2sc6zuTGFRZrheYI9Xf
	wLp0qhu/fHeWb+CN27Xa9A43UpgG0kyCwrmeZMUao2G+RY3a1Tm3RE1hiGIPlcbZ
	1DaZBg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4091jdp1sx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 08:36:18 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46B8aHQg023320
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 08:36:17 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 11 Jul 2024 01:36:12 -0700
Date: Thu, 11 Jul 2024 16:36:07 +0800
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
Message-ID: <Zo+Zd96GHcQc5AnT@jiegan-gv.ap.qualcomm.com>
References: <20240705090049.1656986-1-quic_jiegan@quicinc.com>
 <20240705090049.1656986-3-quic_jiegan@quicinc.com>
 <208b3861-6898-4506-9152-c9d770ef1555@arm.com>
 <Zou7FA2Av7CJO+ds@jiegan-gv.ap.qualcomm.com>
 <Zou+fmUJoyzamWcw@jiegan-gv.ap.qualcomm.com>
 <6a23eb7f-2fad-4a44-bf7c-ab7f01c342f3@arm.com>
 <ZozR+c7ggXWFwyOG@jiegan-gv.ap.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZozR+c7ggXWFwyOG@jiegan-gv.ap.qualcomm.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SB04mKUxTJ5WK78mDOif25VS_4qVmwjQ
X-Proofpoint-ORIG-GUID: SB04mKUxTJ5WK78mDOif25VS_4qVmwjQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_05,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=2 spamscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407110059

On Tue, Jul 09, 2024 at 02:00:25PM +0800, JieGan wrote:
> On Mon, Jul 08, 2024 at 01:50:11PM +0100, Suzuki K Poulose wrote:
> > On 08/07/2024 11:25, JieGan wrote:
> > > On Mon, Jul 08, 2024 at 06:10:28PM +0800, JieGan wrote:
> > > > On Mon, Jul 08, 2024 at 10:41:55AM +0100, Suzuki K Poulose wrote:
> > > > > On 05/07/2024 10:00, Jie Gan wrote:
> > > > > > Add binding document for Coresight Control Unit device.
> > > > > 
> > > > > nit: This is again too generic ? corsight-tmc-control-unit ? After all
> > > > > thats what it is and not a *generic* coresight control unit ?
> > > > > 
> > > > coresight-tmc-control-unit is much better. We will check it.
> > > > > > 
> > > > > > Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> > > > > > ---
> > > > > >    .../bindings/arm/qcom,coresight-ccu.yaml      | 87 +++++++++++++++++++
> > > > > >    1 file changed, 87 insertions(+)
> > > > > >    create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
> > > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..9bb8ced393a7
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
> > > > > > @@ -0,0 +1,87 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/arm/qcom,coresight-ccu.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: CoreSight Control Unit
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
> > > > > > +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> > > > > > +  - Jie Gan <quic_jiegan@quicinc.com>
> > > > > > +
> > > > > > +description:
> > > > > > +  The Coresight Control unit controls various Coresight behaviors.
> > > > > > +  Used to enable/disable ETR’s data filter function based on trace ID.
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    const: qcom,coresight-ccu
> > > > > > +
> > > > > > +  reg:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  clocks:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  clock-names:
> > > > > > +    items:
> > > > > > +      - const: apb_pclk
> > > > > > +
> > > > > > +  reg-names:
> > > > > > +    items:
> > > > > > +      - const: ccu-base
> > > > > > +
> > > > > > +  in-ports:
> > > > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > > > +
> > > > > > +    unevaluatedProperties:
> > > > > > +      patternProperties:
> > > > > > +        '^port(@[0-7])?$':
> > > > > > +          description: Input connections from CoreSight Trace bus
> > > > > > +          $ref: /schemas/graph.yaml#/properties/port
> > > > > > +
> > > > > > +          properties:
> > > > > > +            qcom,ccu-atid-offset:
> > > > > 
> > > > > Why do we need this atid offset ? Couldn't this be mapped to the "port"
> > > > > number ?
> > > > > 
> > > > > e.g, input-port 0 on CCU => Offset x
> > > > >       input-port 1 on CCU => (Offset x + Size of 1 region)
> > > > If the first ATID offset remains constant, it appears to be feasible.
> > > > We will consider the possibility of this solution.
> > > We just checked the ATID offset varies across different hardware platforms.
> > > It defined as 0xf4 on some platforms, and some others defined as 0xf8.
> > 
> > What do you mean ? The offset where you apply the filter changes across
> > different platforms ? or different "tmc-control-unit" implementations ?
> > Is this discoverable from the device ? We could use different
> > compatibles for different "types" of the "devices". Simply adding
> > something in the DT is not the right way.
> 
> I got your point here. I believe we should consult our hardware engineers first to check it.
> We need to figure out the design of ATID offset from hardware perspective. Then we can
> propose an alternative approach, such as associating the offset with a compitable value,
> to resolve this issue.
> 
> > 
> > > 
> > > So I think it should be better to define it in device tree node.
> > 
> > No. See above.


Hi Suzuki

There is a new solution for CCU device. We would like to separate one CCU device into several helper
devices, each responsible for one feature of the CCU device.

For the data filter feature, we will define the address of the AITD Register that included by CCU in DT
as base address of the helper node. So the driver code can easily program the register field with the base address.
With this solution, we may need define several helper nodes in DT file to support different features for CCU and each
helper device needs a driver to support its behavior.

for example, ATID register for ETR0 with base address 0x10000f8: (tmp name used, TDFU for tmc data filter unit)

TDFU@10000f8 {
...
}

ATID register for ETR1 with base address 0x1000108:
TDFU@1000108 {
...
}

The CCU device supports various features and the data filter feature for ETR is one of those features. How to support
those features with one helper_enable function is a serious challenge. That's why we would like to separate it.
Meanwhile, This solution can also resolve the offset issue.

We are looking forward your opinions with this proposal.

Thanks!

> > 
> > Suzuki
> > 
> > > 
> > > > 
> > > > > 
> > > > > I believe I mentioned this in the previous posting too ?
> > > > Yes, you mentioned before. I moved it from TMC filed to CCU filed.
> > > > 
> > > > > 
> > > > > Suzuki
> > > > > 
> > > > 
> > 
> 
> Thanks,
> Jie
> 

Thanks,
Jie

