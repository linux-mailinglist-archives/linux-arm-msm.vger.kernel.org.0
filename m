Return-Path: <linux-arm-msm+bounces-26517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C02F934670
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 04:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 908A1B21610
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 02:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96E425634;
	Thu, 18 Jul 2024 02:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QkIiwdjR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548EB1C36;
	Thu, 18 Jul 2024 02:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721270173; cv=none; b=nHnLgqnzHqYtNOIinymTtVT4gAGQwtX9wGBuyvOSw+v6vfA/E7MCCCylVtFtFdnd854GnffDvWzBXAFCew8pG47zyWTzWQeTriIP/KXIQ1Ln/uIrNVv3P8SuerH3BGpGvKcNrk5OcVME6LQjgN+g1iBSIxdbPd5ADGjBLrcYQZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721270173; c=relaxed/simple;
	bh=jYfile6BLXuxxZvJl2IOKY8q/TSvEzeBYd92ETBg8aY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mqzLswN7ELmzPN8vFZnsq1w1ER0cR9p3o/tLuYYOtMX5qJdCzwb1DADcVZZafLQMB63ARto87TRA/RYXF0IrC1Nv1h4kbBAaAot1dCDDI+dtSZwC/I+nt1qsPiSiW3YTU/NVvbMoB7mqvl2fGa8UscvGJ+mD/XMOAVLuBsWiYco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QkIiwdjR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46HFvS9M000402;
	Thu, 18 Jul 2024 02:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QrP0Gik79TXsMbZN+JGEdn/d8A0wV6R3kEAmU0q/c50=; b=QkIiwdjR7hw+IzhJ
	+TLwW6kVRBUTWPk5l/MaIsYeT7+AXmx7WKRTkwOZVQK+9uZ/EuZS2qyRqMAnMjlQ
	tlwRUyRCayrck5giE+peir0cm6nb59qRyDEFsnlr6LlMcGv3/QJlphRHA5hqaX85
	EV+a8Khi55L/hFBzZfz7MNh/5nKHYfhWeGOK0k0ad4R7ctfcrU9a8oJi7ricycd5
	tHbZIVQ3ALf4Ut8fmrd1jYYShArPeDZYrk1XT9PMiD/4tN5beNHr/JrwB8ZjTggD
	ELDDCmvBmuFigdBDH0+llkqqi25VbxDyXfCEGyaCfxUaTWKn7BRD3nRq8cVBMST1
	StywLQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfs44j3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 02:35:59 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46I2ZwZ1011125
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 02:35:58 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 17 Jul 2024 19:35:52 -0700
Date: Thu, 18 Jul 2024 10:35:48 +0800
From: JieGan <quic_jiegan@quicinc.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
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
Message-ID: <Zph/hEnRtIVZpzb5@jiegan-gv.ap.qualcomm.com>
References: <20240705090049.1656986-1-quic_jiegan@quicinc.com>
 <20240705090049.1656986-3-quic_jiegan@quicinc.com>
 <5f7cf9e4-cf1c-41d1-8985-3bcf1d943f08@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f7cf9e4-cf1c-41d1-8985-3bcf1d943f08@linaro.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0fWlt211FNuZbRp-wiurgVmgibZIZkaL
X-Proofpoint-GUID: 0fWlt211FNuZbRp-wiurgVmgibZIZkaL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_19,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407180016

On Fri, Jul 05, 2024 at 11:07:22AM +0200, Krzysztof Kozlowski wrote:
> On 05/07/2024 11:00, Jie Gan wrote:
> > Add binding document for Coresight Control Unit device.
> 
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> </form letter>
> 
> Or stop developing on some old tree. It's some sort of weird pattern in
> entire Qualcomm Coresight - everything developed on old kernels.
> 
> You must work on latest mainline or maintainer or linux-next tree, not
> some old Qualcomm tree. Your v5.15, v5.19, v6.4 or v6.8 or whatever you
> have there: BIG NOPE.
> 
> > 
> > Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> > ---
> 
> Subject: it never ends with full stop.
> 
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> >  .../bindings/arm/qcom,coresight-ccu.yaml      | 87 +++++++++++++++++++
> >  1 file changed, 87 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
> > new file mode 100644
> > index 000000000000..9bb8ced393a7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
> > @@ -0,0 +1,87 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/qcom,coresight-ccu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: CoreSight Control Unit
> > +
> > +maintainers:
> > +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
> > +  - Mao Jinlong <quic_jinlmao@quicinc.com>
> > +  - Jie Gan <quic_jiegan@quicinc.com>
> > +
> > +description:
> > +  The Coresight Control unit controls various Coresight behaviors.
> > +  Used to enable/disable ETR’s data filter function based on trace ID.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,coresight-ccu
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    items:
> > +      - const: apb_pclk
> 
> Drop _pclk
Hi, Suzuki,
As Krzysztof proposed, we have to change the clock name from apb_pclk to apb.
According to the new clock name, I updated the inline function coresight_get_enable_apb_pclk
to vote the clock with the new name.

Is that ok with the change? Or any other suggestions?

static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
{
        struct clk *pclk;
        int ret;

        pclk = clk_get(dev, "apb_pclk");
        if (IS_ERR(pclk)) {
                pclk = clk_get(dev, "apb");    //added line
                if (IS_ERR(pclk))
                        return NULL;
        }

        ret = clk_prepare_enable(pclk);
        if (ret) {
                clk_put(pclk);
                return ERR_PTR(ret);
        }
        return pclk;
}

> 
> > +
> > +  reg-names:
> 
> Please follow DTS coding style about order of properties.
> 
> > +    items:
> > +      - const: ccu-base
> > +
> > +  in-ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    unevaluatedProperties:
> 
> This was never tested and it cannot reliably work.
> 
> Sorry, this is waste of our time.
> 
> 
> > +      patternProperties:
> > +        '^port(@[0-7])?$':
> > +          description: Input connections from CoreSight Trace bus
> > +          $ref: /schemas/graph.yaml#/properties/port
> > +
> > +          properties:
> > +            qcom,ccu-atid-offset:
> > +              description:
> > +                Offset to the Coresight Control Unit component's ATID register
> > +                that is used by specific TMC ETR. The ATID register can be programed based
> > +                on the trace id to filter out specific trace data which gets into ETR buffer.
> > +              $ref: /schemas/types.yaml#/definitions/uint32
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
> > +    syscon@1001000 {
> 
> That's not a syscon.
> 
> > +        compatible = "qcom,coresight-ccu";
> > +        reg = <0x1001000 0x1000>;
> > +        reg-names = "ccu-base";
> > +
> 
> Best regards,
> Krzysztof
> 

Thanks,
Jie

