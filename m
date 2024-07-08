Return-Path: <linux-arm-msm+bounces-25451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E4F929A65
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 02:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DC301F2126B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 00:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA39F639;
	Mon,  8 Jul 2024 00:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aoQGc6sb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45C55684;
	Mon,  8 Jul 2024 00:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720399703; cv=none; b=Y/BgkBtrSklwNLCZqG0n776E0Sb+JvYIBhC4GzAY4uMOLb5UQoBZYUeUm+rpVLLA46zf9QJPOgQdpyTlSOOgQTjuiK2WcmQWAh2jSUPNKna4/pASRbTNZgjp+6pNXDnqdfgaNRxG0e1dg+Ugvvk0hPgOLPncpNU+/b8FbF9TBik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720399703; c=relaxed/simple;
	bh=28uUHauElG4kRIPHgb3Gv6O7+8Mw+ehTL69pQmSacak=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2etFfqnHqBb5YN2I6d+qxGiE62OYkovarg0RIL7Ie2milUOcV03bHhZsy+FVPae41I0HTI2IdesfgD8qQGpQ1ME637S2DAp5jkHFwz3u5wJCiCk8BHJdOojKxbRdu+cCsZlXw6hZVQeBUKGlEHsDtxGcSW1eSbwdBEukBgFxtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aoQGc6sb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 467MDTgA022631;
	Mon, 8 Jul 2024 00:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V9Fy0A7HGbsdIM5Jqbh/su26
	p96DYdzSwSAYVJZX3mY=; b=aoQGc6sbRjfx1eHJ++fXAQI8HHh3TABWc5oMAzG9
	/q7Gqs6WlrNudH37WkxVmov+KxBORQnYs/Dmor0dB8CedmldK1gEboFI92G5hyXH
	KJCqOlPGm/kFjawXkIdVQF7D4ygqtpKJAtt9+gPJQndxoPCgT3/28MhtT2rP1VPw
	akWOncRK8wEvmuX7msNDinviA+r3MLtyW2aEPnGouddSZ04HymZ8Ku7l1AK2/ARY
	J7DkH4sd3heMMgm8WkxBqvhfE0ATljWIrs+XPvaI/WaNTqfFNbe7ovnbId+DYIB6
	K3Y9m9GPRpJfhv/8Vfcl995/Vt7uhjMnboUBn90iBtZhdQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406y77j7sw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 00:48:07 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4680m79p029594
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jul 2024 00:48:07 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 7 Jul 2024 17:48:01 -0700
Date: Mon, 8 Jul 2024 08:47:58 +0800
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
Message-ID: <Zos3PpAwytmRr1ED@jiegan-gv.ap.qualcomm.com>
References: <20240705090049.1656986-1-quic_jiegan@quicinc.com>
 <20240705090049.1656986-3-quic_jiegan@quicinc.com>
 <5f7cf9e4-cf1c-41d1-8985-3bcf1d943f08@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5f7cf9e4-cf1c-41d1-8985-3bcf1d943f08@linaro.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: P56hItJMp2gqx27Hdr-cVkiWjnyHRppi
X-Proofpoint-ORIG-GUID: P56hItJMp2gqx27Hdr-cVkiWjnyHRppi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-07_10,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407080004

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
> > +    items:
> > +      - const: apb_pclk
> 
> Drop _pclk
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
Sorry about that. I will re-check the dt-binding file.
 
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

