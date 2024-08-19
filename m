Return-Path: <linux-arm-msm+bounces-28951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51441956608
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 10:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C42AD1F24EBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 08:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D8415B55E;
	Mon, 19 Aug 2024 08:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kAVrJNO5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9C51BDE6;
	Mon, 19 Aug 2024 08:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724057540; cv=none; b=ilWCCx7/yehCge5ggASOBMnd0BbwUsw3LXfIMItSYGL31ktBOSAtRJmZIGGT0shcp208GjXAqpEfWK87hqqUFPOtPsAi1rBObQqTRXMeVPFhfeqtXiNSob34KmFpGwKa7Q3LwS6qIeb1aU2k7ZpDYCY1nrfFw0cnaLA4AmH7zRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724057540; c=relaxed/simple;
	bh=vQf95RWwbIyuRDbTM2efRRBpBq2gM3PH2L48uDQLiuw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPeE4wLl2vL/3vZC8BJy9Nn5JiSqIJLsxEs172Q9gkPnVYyut5wjUZU3woZrvnwl2yd+QArzVEPhEKlA5yFtwq9feugOuZGAL0Dx8AejkUHQjFTpaDTsIZ9I+QHkXIoi3XpVicXsDVyFLXE1r43n5rUPBjgI3jz/M4bDsIFagso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kAVrJNO5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47J0g0DS014401;
	Mon, 19 Aug 2024 08:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SzCwS7QNlEIxcBmhnNJGNnNT83kP0LndfQN7r9VYfzg=; b=kAVrJNO5VSRA3Yfd
	t6lXkwHW/XwSDHLE1QS5B0j/sqgMSpOD0KNvOVEWNSP6HYHJ5VZOKKoZySYDNHmU
	dBYyFwRF80qbRwRmOg6XdEtwNUJVr4pHmVeSi/09ILfilkHjvl73oo1PlYRxX85A
	dbnW/ewyzljbzREhb2kEYVGQYG1F76z+/IQurz5DDE3JMw7xw9Ked1ryc8Dlkfty
	9OzTRudpQYjj//OD3d4tAP0siIUvtj2qvf2Vr22L3UH3WF8fY6CbAmUqOJckifNw
	zfAlk2ky3s7XTBn8v+Bvvqr4QOGEbWCrExe8ez6d3Zl8Fukm9/AHMI++NQdGdLIc
	nnIPsA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412mmekdrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 08:51:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47J8poEK001566
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 08:51:50 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 Aug 2024 01:51:44 -0700
Date: Mon, 19 Aug 2024 16:51:40 +0800
From: JieGan <quic_jiegan@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        "Tao
 Zhang" <quic_taozha@quicinc.com>,
        Song Chai <quic_songchai@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: arm: Add Coresight TMC Control Unit
 hardware
Message-ID: <ZsMHnKKvOey4SA1O@jiegan-gv.ap.qualcomm.com>
References: <20240812024141.2867655-1-quic_jiegan@quicinc.com>
 <20240812024141.2867655-4-quic_jiegan@quicinc.com>
 <20240818142834.GA27754-robh@kernel.org>
 <ZsKkm/Pz0GYtH2Gl@jiegan-gv.ap.qualcomm.com>
 <9d9704ed-6ef8-4920-9874-29e0a815e2ba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d9704ed-6ef8-4920-9874-29e0a815e2ba@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: o7jeiQiUQJah3lHZXkR4lCvm1Y1xekY9
X-Proofpoint-ORIG-GUID: o7jeiQiUQJah3lHZXkR4lCvm1Y1xekY9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_07,2024-08-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 mlxlogscore=999 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190063

On Mon, Aug 19, 2024 at 08:25:33AM +0200, Krzysztof Kozlowski wrote:
> On 19/08/2024 03:49, JieGan wrote:
> > On Sun, Aug 18, 2024 at 08:28:34AM -0600, Rob Herring wrote:
> >> On Mon, Aug 12, 2024 at 10:41:39AM +0800, Jie Gan wrote:
> >>> Add binding file to specify how to define a Coresight TMC
> >>> Control Unit device in device tree.
> >>>
> >>> It is responsible for controlling the data filter function
> >>> based on the source device's Trace ID for TMC ETR device.
> >>> The trace data with that Trace id can get into ETR's buffer
> >>> while other trace data gets ignored.
> >>>
> >>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> >>> ---
> >>>  .../bindings/arm/qcom,coresight-ctcu.yaml     | 79 +++++++++++++++++++
> >>>  1 file changed, 79 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> >>> new file mode 100644
> >>> index 000000000000..7a9580007942
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> >>> @@ -0,0 +1,79 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/arm/qcom,coresight-ctcu.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: CoreSight TMC Control Unit
> >>> +
> >>> +maintainers:
> >>> +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
> >>> +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> >>> +  - Jie Gan <quic_jiegan@quicinc.com>
> >>> +
> >>> +description:
> >>> +  The Coresight TMC Control unit controls various Coresight behaviors.
> >>> +  It works as a helper device when connected to TMC ETR device.
> >>> +  It is responsible for controlling the data filter function based on
> >>> +  the source device's Trace ID for TMC ETR device. The trace data with
> >>> +  that Trace id can get into ETR's buffer while other trace data gets
> >>> +  ignored.
> >>
> >> Nowhere is TMC defined.
> > The Coresight TMC control unit(CTCU) connected to Coresight TMC device via replicator and
> > works as a helper device to TMC device.
> 
> Did you understand the feedback or just responding with whatever to get
> rid of reviewers?

Sorry for the insufficient clarity in my response, I am just misunderstood the feedback and try
to explain the relationship between TMC and CTCU device.

I will add the TMC description to explain what TMC is as shown below:
The Trace Memory Controller(TMC) is used for Embedded Trace Buffer(ETB), Embedded Trace FIFO(ETF)
and Embedded Trace Router(ETR) configurations. The configuration mode (ETB, ETF, ETR) is
discovered at boot time when the device is probed.

> 
> > 
> > The in-ports listed below illustrate their connection to TMC devices.
> > 
> >>
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - qcom,sa8775p-ctcu
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  clocks:
> >>> +    maxItems: 1
> >>> +
> >>> +  clock-names:
> >>> +    items:
> >>> +      - const: apb
> >>> +
> >>> +  in-ports:
> >>
> >> Use 'ports' unless you have both in and out ports.
> > The ‘in-ports’ and ‘out-ports’ properties will be parsed by ‘of_coresight_get_port_parent’
> > and their relationships to other devices will be stored in the coresight_platform_data structure.
> > 
> > for example:
> > struct coresight_platform_data {
> > 	int nr_inconns;
> > 	int nr_outconns;
> > 	struct coresight_connection **out_conns;
> > 	struct coresight_connection **in_conns;
> > };
> > 
> > https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/hwtracing/coresight/coresight-platform.c#L147
> 
> and? If you respond with some unrelated argument, we will respond with
> the same: Use 'ports' unless you have both in and out ports.

Sorry for the insufficient response.

The Coresight driver prefers using ‘in-ports’ and ‘out-ports’ instead of the ‘ports’ property, as each
Coresight component needs to specify its input and output directions.

The Coresight system operates by integrating all Coresight components and construting its data flow path
based on the defined directions. 

Consequently, the data flow direction cannot be determined when utilizing the ‘ports’ property in the
Coresight system.


> 
> Best regards,
> Krzysztof
> 

Thanks,
Jie

