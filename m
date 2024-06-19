Return-Path: <linux-arm-msm+bounces-23174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C52290E312
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 08:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C534528519A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 06:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4210D5B1F8;
	Wed, 19 Jun 2024 06:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CrkW8fow"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B264A1D;
	Wed, 19 Jun 2024 06:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718777272; cv=none; b=gE05bmAy0EXYUianLaJko217lJ9RKMafgvJCgxHOMRk4f54OnPohPcD9JGOZrhXNDAmLuAFzDdTBP1zhNKLZ2Xi/F41HipX1xLReOwlvhxyoCLjUc98nboqrrYdcKtnAUSMO06vj2HgnTUCU0BoAX+l8AjoATkkIW/4i8QEnCjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718777272; c=relaxed/simple;
	bh=WuIBOIIgaWxcvAlVllH8+0R36WB2LMDjwfb0bq7+BX8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IB78FceoPXwuVFfNWEHAM7s/+CB/Kkdtp9VJ6YWc3iKKdfGq6KjccDH7b/h64TQJqZ+SALyf5oaT/j48QHMW8AjJShiQjTbRz+B9EFI5FVrzei/cCQhgGnSda92sFctTRa6n5fNOGIZF7oRQScN764EGKS3u7Tvz8SwbNkDq9ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CrkW8fow; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILaJwB010778;
	Wed, 19 Jun 2024 06:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IlvKpZ4pyfP2NxRn7Fhv6QH15CtofuBuVmBKSei2uDU=; b=CrkW8fow6kmfO1Tf
	jvCh65JKV2+3CuFllVxwrHQEGZ/PbSYu8gL5SxcZEUmxPFmrepl3EwKcMzGroeC1
	/YfTt2mGYDx9iNwh3XQXuOTpssZZoTtqZa6VM8RHqk2f3E01Fwhw5PdIPjyZUWuZ
	Jcao7RY+4xppHOlVkoRRj1dQZnf6Y7yxPJoJYyS2ouis32i7j/jFlQpowr618Zfa
	pgnBLj32pxKsS04qtWP6K45ZIrVTZZsQT4qYSdQpAqrOqUb98uXrt4frRgwIrGvh
	wEzxGHIKe4fsCx21/E3gKc5/2GxKc0SC+TDzaEKrLbDGkiwOdsLgjeKHVCMBZdKN
	xa7Aqg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuja2gt60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 06:07:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45J67bQa024452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 06:07:37 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Jun 2024 23:07:29 -0700
Date: Wed, 19 Jun 2024 14:07:24 +0800
From: JieGan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        <linux-arm-msm@vger.kernel.org>, <andersson@kernel.org>,
        <quic_yijiyang@quicinc.com>, <quic_yuanjiey@quicinc.com>,
        <quic_liuxin@quicinc.com>, <quic_yanzl@quicinc.com>,
        <quic_xinlon@quicinc.com>, <quic_xueqnie@quicinc.com>,
        <quic_sijiwu@quicinc.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: Add binding document for
 Coresight Slave Register device.
Message-ID: <ZnJ1nAByFKwoTl91@jiegan-gv.ap.qualcomm.com>
References: <20240618072726.3767974-1-quic_jiegan@quicinc.com>
 <20240618072726.3767974-2-quic_jiegan@quicinc.com>
 <67e6d553-80fe-41c0-9e7a-f809d11ae9bd@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67e6d553-80fe-41c0-9e7a-f809d11ae9bd@arm.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pmKq0FcpU0qwPhmNldiSw69BQUDeUaI9
X-Proofpoint-ORIG-GUID: pmKq0FcpU0qwPhmNldiSw69BQUDeUaI9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406190043

On Tue, Jun 18, 2024 at 10:56:16AM +0100, Suzuki K Poulose wrote:
> On 18/06/2024 08:27, Jie Gan wrote:
> > Add binding document for Coresight Slave Register device.
> 
> Is this a made up name of the driver ? CoreSight Slave Register
> device sounds nowhere near to what it does. If you have a proper
> name for the "IP" please use that.
We will reconsider the device name. Thanks for your reminding.

> 
> > 
> > Add a new property to TMC, qcom,csr-atid-offset, to indicate which
> > ATID registers will be used by the TMC ETR. Each TMC ETR device is
> > associated with four ATID registers that are continuous in address.
> > 
> > Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> > ---
> >   .../bindings/arm/arm,coresight-tmc.yaml       |  8 ++
> >   .../bindings/arm/qcom,coresight-csr.yaml      | 76 +++++++++++++++++++
> >   2 files changed, 84 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-csr.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
> > index cb8dceaca70e..295641a96c21 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
> > @@ -82,6 +82,14 @@ properties:
> >       $ref: /schemas/types.yaml#/definitions/uint32
> >       maximum: 15
> > +  qcom,csr-atid-offset:
> > +    description:
> > +      Offset to the coresight slave register component's ATID register
> > +      that is used by specific TMC ETR. The ATID register can be programed according
> > +      to the trace id to filter out specific trace data which gets through the ETR
> > +      to the downstream components.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> Why do we need this ? Could this not be inferred from the "input port" to
> which this ETR is connected on the CSR ?
> 
> e.g., input-0 : Offset 0
>       input-1 : Offset for Bank1
> 
We will try this suggestion.

Thanks,
Jie

> 
> 
> 
> > +
> >     in-ports:
> >       $ref: /schemas/graph.yaml#/properties/ports
> >       additionalProperties: false
> > diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-csr.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-csr.yaml
> > new file mode 100644
> > index 000000000000..16f97cbe3d4b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-csr.yaml
> > @@ -0,0 +1,76 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/qcom,coresight-csr.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: CoreSight Slave Register
> > +
> > +maintainers:
> > +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
> > +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> > +  - Jie Gan <quic_jiegan@quicinc.com>
> > +
> > +description:
> > +  The Coresight Slave Register controls various Coresight behaviors.
> > +  Used to enable/disable ETR’s data filter function based on trace ID.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,coresight-csr
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    maxItems: 1
> > +    items:
> > +      - const: apb_pclk
> > +
> > +  reg-names:
> > +    items:
> > +      - const: csr-base
> > +
> > +  in-ports:
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
> > +    syscon@10001000 {
> > +        compatible = "qcom,coresight-csr";
> > +        reg = <0x0 0x10001000 0x0 0x1000>;
> > +        reg-names = "csr-base";
> > +
> > +        in-ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +                csr_in_port0: endpoint {
> > +                    remote-endpoint = <&etr0_out_port>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg = <1>;
> > +                csr_in_port1: endpoint {
> > +                    remote-endpoint = <&etr1_out_port>;
> > +                };
> > +            };
> > +        };
> > +    };
> 

