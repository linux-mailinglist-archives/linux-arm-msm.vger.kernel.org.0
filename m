Return-Path: <linux-arm-msm+bounces-25546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2705F92AFA9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 08:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79F62B21658
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 06:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4FF80604;
	Tue,  9 Jul 2024 06:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NI8LapIW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85E05339D;
	Tue,  9 Jul 2024 06:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720504850; cv=none; b=pIgajN69ZeaFgWQ4TPWzi1D8AzOuK2KB7SSShN9SnaPVo9M8wettu5WRMypPDSi6QGg+Cw/VWJbev0QkRpyIUd5zYPT4p/FKg4tbqNugDAdGHzvRejRr7e4cYDEvKoNIKnsRGlFsGHDF0MFjNKO/t4qLsIZ5jWUjaVW9QY5sqgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720504850; c=relaxed/simple;
	bh=hjo2DLxSVKEqpZXVDhdwsCzO3AyM4+NtJLwZKcK8wqc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQRd8D2PtXlVtYiQiKEXjYn+o32hUhr7VCn/113w7dOQ0R4YN+wM94+n+QraTL5xzhfvCaBimbQGOEBKiUGZpuxFBLBWrUgMA1YBW1k0B7K+LidUTyKLkRA++VV4TLVnR+6UOA0uIuMVtQPUeS4+nI52xQG+368UVlKEuc57/Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NI8LapIW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468MJuWF024959;
	Tue, 9 Jul 2024 06:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZNMoIVjvW5pkII4iV8e8ZjeETHbT5ZeYlpUo4OAsFo=; b=NI8LapIWg4RJ5x9T
	Y6i0130mJ+ufN09x9AdDpiEt8nnrtUX9CxQt2m2s1LS98+a+kLQ2koXf7mMOmKCX
	qxEW+f3OhDAAw8Ogb0MndX87NFFSQvH8PpmLlR/9CLYk8oF+FKh/8WzwTjo41i5Z
	9PUxGROhgtZtwl0+5zy/IiTvV1KqgmKmfqm41K5MDO68pRQRnFQAjZWVU7fVbVvl
	ozxsbK9b2H+ZAk4mAubwK9qiY/Rn7LAQJSojlZ8zhvi9ro8x8Jv5tNqJDBNCCLw1
	cmJtZItadBFQSaHFeBUaYHAhI+QujHNv5PBOgcwf75wt0ClVWChnEdrChT+9CiAy
	S8K+Qw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406x515kv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 06:00:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46960YZm009965
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 06:00:34 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 8 Jul 2024 23:00:29 -0700
Date: Tue, 9 Jul 2024 14:00:25 +0800
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
Message-ID: <ZozR+c7ggXWFwyOG@jiegan-gv.ap.qualcomm.com>
References: <20240705090049.1656986-1-quic_jiegan@quicinc.com>
 <20240705090049.1656986-3-quic_jiegan@quicinc.com>
 <208b3861-6898-4506-9152-c9d770ef1555@arm.com>
 <Zou7FA2Av7CJO+ds@jiegan-gv.ap.qualcomm.com>
 <Zou+fmUJoyzamWcw@jiegan-gv.ap.qualcomm.com>
 <6a23eb7f-2fad-4a44-bf7c-ab7f01c342f3@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a23eb7f-2fad-4a44-bf7c-ab7f01c342f3@arm.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: trjAZkAn4ZYR64ibuTE1bySz6OSnYcMy
X-Proofpoint-ORIG-GUID: trjAZkAn4ZYR64ibuTE1bySz6OSnYcMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_15,2024-07-08_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=1
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090038

On Mon, Jul 08, 2024 at 01:50:11PM +0100, Suzuki K Poulose wrote:
> On 08/07/2024 11:25, JieGan wrote:
> > On Mon, Jul 08, 2024 at 06:10:28PM +0800, JieGan wrote:
> > > On Mon, Jul 08, 2024 at 10:41:55AM +0100, Suzuki K Poulose wrote:
> > > > On 05/07/2024 10:00, Jie Gan wrote:
> > > > > Add binding document for Coresight Control Unit device.
> > > > 
> > > > nit: This is again too generic ? corsight-tmc-control-unit ? After all
> > > > thats what it is and not a *generic* coresight control unit ?
> > > > 
> > > coresight-tmc-control-unit is much better. We will check it.
> > > > > 
> > > > > Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> > > > > ---
> > > > >    .../bindings/arm/qcom,coresight-ccu.yaml      | 87 +++++++++++++++++++
> > > > >    1 file changed, 87 insertions(+)
> > > > >    create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..9bb8ced393a7
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
> > > > > @@ -0,0 +1,87 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/arm/qcom,coresight-ccu.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: CoreSight Control Unit
> > > > > +
> > > > > +maintainers:
> > > > > +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
> > > > > +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> > > > > +  - Jie Gan <quic_jiegan@quicinc.com>
> > > > > +
> > > > > +description:
> > > > > +  The Coresight Control unit controls various Coresight behaviors.
> > > > > +  Used to enable/disable ETR’s data filter function based on trace ID.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: qcom,coresight-ccu
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  clocks:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  clock-names:
> > > > > +    items:
> > > > > +      - const: apb_pclk
> > > > > +
> > > > > +  reg-names:
> > > > > +    items:
> > > > > +      - const: ccu-base
> > > > > +
> > > > > +  in-ports:
> > > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > > +
> > > > > +    unevaluatedProperties:
> > > > > +      patternProperties:
> > > > > +        '^port(@[0-7])?$':
> > > > > +          description: Input connections from CoreSight Trace bus
> > > > > +          $ref: /schemas/graph.yaml#/properties/port
> > > > > +
> > > > > +          properties:
> > > > > +            qcom,ccu-atid-offset:
> > > > 
> > > > Why do we need this atid offset ? Couldn't this be mapped to the "port"
> > > > number ?
> > > > 
> > > > e.g, input-port 0 on CCU => Offset x
> > > >       input-port 1 on CCU => (Offset x + Size of 1 region)
> > > If the first ATID offset remains constant, it appears to be feasible.
> > > We will consider the possibility of this solution.
> > We just checked the ATID offset varies across different hardware platforms.
> > It defined as 0xf4 on some platforms, and some others defined as 0xf8.
> 
> What do you mean ? The offset where you apply the filter changes across
> different platforms ? or different "tmc-control-unit" implementations ?
> Is this discoverable from the device ? We could use different
> compatibles for different "types" of the "devices". Simply adding
> something in the DT is not the right way.

I got your point here. I believe we should consult our hardware engineers first to check it.
We need to figure out the design of ATID offset from hardware perspective. Then we can
propose an alternative approach, such as associating the offset with a compitable value,
to resolve this issue.

> 
> > 
> > So I think it should be better to define it in device tree node.
> 
> No. See above.
> 
> Suzuki
> 
> > 
> > > 
> > > > 
> > > > I believe I mentioned this in the previous posting too ?
> > > Yes, you mentioned before. I moved it from TMC filed to CCU filed.
> > > 
> > > > 
> > > > Suzuki
> > > > 
> > > 
> 

Thanks,
Jie

