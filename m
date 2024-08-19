Return-Path: <linux-arm-msm+bounces-28927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 497899560F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 03:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36D811C213C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 01:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E784F1BC2F;
	Mon, 19 Aug 2024 01:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="filQ5NM+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D47F8BF0;
	Mon, 19 Aug 2024 01:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724032200; cv=none; b=rl5PDpS49ktv0jaEi5YWezeEGXbNEzYjmUnsh2FiKkRG4WWjhacyBTfp1uIptgNHwwJY/yELjfz35pWKGCFnroH305gACrvPOvSQUldyGowSyQu3i4XVMpS7vU+EbWtEgPBmQOihejuRW6Ysi6mpR4Ql7f/PzmGH/LuQt3SsfB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724032200; c=relaxed/simple;
	bh=tcbtkDE3V7EuBdyDRwwcYx7oLKNfCX+wAgKuyAaHwfY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5OucidxvSaJEfABnWpNKcS4LoLVkDi/n2K/yshsnrJCvBLRQh3t84HjDAEGYeMTnOI6AzIOOpXIeeKr0UA+d/SBHjAoHdLt3wtVzv1Vex+INNEHwBhNiMKLy4iDRgEUULFZbCLCulow3GjQ72WAC5aSYWu1kyZSQ2eC07k5tB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=filQ5NM+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47IMvHRu002666;
	Mon, 19 Aug 2024 01:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B/oAQdAlYc+fVzegRfsOmC0hhMJRAvBOn3QYApnrE10=; b=filQ5NM+pgDf/HmF
	bH/Wm2S3xDJzIZ/+lNTsHanHTfSH6veE49CIybDziOpSV4ZPztkQQtvz//MjMSqT
	Lhn49T38cqeRCvm3MmOZWE334SvxyS5lxQh4isK5953xZO9A4zA/1Ha69dY/wAxm
	RrZtYIl75GjbfVIJ6SFOjVzgUkWVk+Y6cr68q+pM3zq0sYDG9WkGzWlwJAJ6xWZb
	HD21hVy+odr30hvc6b3/NUc29mMfHPZeuB1NSG9f7CT531KWaVOLl8nhsgRhjrZE
	GG61trKndwcKS+bszPdB9dE+CNabfW+UmJ/rGFBTuBxE9hZa3K/RiWdi4RVH9jNh
	RthmtA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412m32jn6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 01:49:26 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47J1nP63011694
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 01:49:25 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 18 Aug 2024 18:49:19 -0700
Date: Mon, 19 Aug 2024 09:49:15 +0800
From: JieGan <quic_jiegan@quicinc.com>
To: Rob Herring <robh@kernel.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
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
Message-ID: <ZsKkm/Pz0GYtH2Gl@jiegan-gv.ap.qualcomm.com>
References: <20240812024141.2867655-1-quic_jiegan@quicinc.com>
 <20240812024141.2867655-4-quic_jiegan@quicinc.com>
 <20240818142834.GA27754-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240818142834.GA27754-robh@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FgV4sntAx5nC7_nJHd9ivOvQFGfo_Asd
X-Proofpoint-ORIG-GUID: FgV4sntAx5nC7_nJHd9ivOvQFGfo_Asd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-18_24,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190011

On Sun, Aug 18, 2024 at 08:28:34AM -0600, Rob Herring wrote:
> On Mon, Aug 12, 2024 at 10:41:39AM +0800, Jie Gan wrote:
> > Add binding file to specify how to define a Coresight TMC
> > Control Unit device in device tree.
> > 
> > It is responsible for controlling the data filter function
> > based on the source device's Trace ID for TMC ETR device.
> > The trace data with that Trace id can get into ETR's buffer
> > while other trace data gets ignored.
> > 
> > Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> > ---
> >  .../bindings/arm/qcom,coresight-ctcu.yaml     | 79 +++++++++++++++++++
> >  1 file changed, 79 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> > new file mode 100644
> > index 000000000000..7a9580007942
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> > @@ -0,0 +1,79 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/qcom,coresight-ctcu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: CoreSight TMC Control Unit
> > +
> > +maintainers:
> > +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
> > +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> > +  - Jie Gan <quic_jiegan@quicinc.com>
> > +
> > +description:
> > +  The Coresight TMC Control unit controls various Coresight behaviors.
> > +  It works as a helper device when connected to TMC ETR device.
> > +  It is responsible for controlling the data filter function based on
> > +  the source device's Trace ID for TMC ETR device. The trace data with
> > +  that Trace id can get into ETR's buffer while other trace data gets
> > +  ignored.
> 
> Nowhere is TMC defined.
The Coresight TMC control unit(CTCU) connected to Coresight TMC device via replicator and
works as a helper device to TMC device.

The in-ports listed below illustrate their connection to TMC devices.

> 
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,sa8775p-ctcu
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: apb
> > +
> > +  in-ports:
> 
> Use 'ports' unless you have both in and out ports.
The ‘in-ports’ and ‘out-ports’ properties will be parsed by ‘of_coresight_get_port_parent’
and their relationships to other devices will be stored in the coresight_platform_data structure.

for example:
struct coresight_platform_data {
	int nr_inconns;
	int nr_outconns;
	struct coresight_connection **out_conns;
	struct coresight_connection **in_conns;
};

https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/hwtracing/coresight/coresight-platform.c#L147

> 
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    patternProperties:
> > +      '^port(@[0-7])?$':
> > +        description: Input connections from CoreSight Trace bus
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - in-ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    ctcu@1001000 {
> > +        compatible = "qcom,sa8775p-ctcu";
> > +        reg = <0x1001000 0x1000>;
> > +
> > +        clocks = <&aoss_qmp>;
> > +        clock-names = "apb";
> > +
> > +        in-ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +                ctcu_in_port0: endpoint {
> > +                    remote-endpoint = <&etr0_out_port>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg = <1>;
> > +                ctcu_in_port1: endpoint {
> > +                    remote-endpoint = <&etr1_out_port>;
> > +                };
> > +            };
> > +        };
> > +    };
> > -- 
> > 2.34.1
> > 
> 

Thanks,
Jie

