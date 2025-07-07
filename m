Return-Path: <linux-arm-msm+bounces-63905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA9DAFAFA3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 11:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 447267B02A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 09:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C415A28D859;
	Mon,  7 Jul 2025 09:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1Vghicb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B84286412
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 09:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751880411; cv=none; b=c6aOBEbAfrqMtIraVa1gsaskpB4LUxKONTybnLAQtXBpBN7YmbQbSEYODCnvej2V3tIjt5lQwIl3WcgKb4119tCjZvTV2XD3bbKD1tymGld8GXCRDpi89YWu3Cfkm9iCExmWDb9IsV6Hpvupzq4llvjRotR1jzYBS364XMzjPCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751880411; c=relaxed/simple;
	bh=lpUWLfPohvcG8KFzHIdM95cA9JBZMwDUXeS0oz5m354=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9T+i5SLXuHN8GiEjvpUMhP1vP51N+cHPFdE/Dlb9IYoRIWpnlPIm2E/e3pMJaDMxGQrJ+5Jaupr/b/jUaGA9g4NcDHQp4PT+/eG93no5BWOXst7T5GFIpwEH3ifyCZOv21p40k5KikDjnU7C0VUkcGNhFF1DQW0sL+dn4/ueXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1Vghicb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566N6mqf018758
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Jul 2025 09:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5ACLvMD04WA0YF7cGMMn3ZsR
	RQXO56tBP9XFn+27tp8=; b=Q1VghicbjP9qRm0DXRuA7PXr87THvDT/nF4u+p4M
	/UPJTIYR+NCX3qzLuSM/w8rb7XkwCeEf7O01y0tTcQ7Ee9vBKzk8zM+EDVrbiAd9
	GFEvfpiGuZ1+fdnjqcxFaQAQpktA1DjZS2TGvpzom4ucRgW7XWv+/xeTOFKdvN5X
	RPDU6c/sQ18cp7/xB6R22oEH96Px1gTbaSdQbTov/CX+HQnY8i56nu0G64W7yeMi
	eZTRvEUh5F/O7/QFT8SvH3inuEMgufwv8W4r1+dK5UJkva7xwGTZYPzays2Mi+a8
	WgKAk6rNNGl+4e9VwaaLnlcEIDVmrKwF7ieF9jM8qNDfxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pun2bwm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 09:26:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c790dc38b4so496553085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 02:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751880408; x=1752485208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ACLvMD04WA0YF7cGMMn3ZsRRQXO56tBP9XFn+27tp8=;
        b=ZlOiTRBt62qLFtjvJ8aUFrkDimVCjo0PItv8pelSyfBaz11CXmZvkgRSJS6hkyT6AZ
         G9SXgG8kMCF0mv5ShznqmUTMuXoJQQk7RZbxi8YSe3q1JdTLsmoENpHlLa80dM0q3cVY
         KcwUNwWK5oUv61Sztn31XTSdiXs62c6MtNC6gTQMq/txaSx1YOm9/rpCSxMVFy8cqlet
         fj+UzRLNJ1nJWgUmhVx2mJzD6CHF90a0M7+lxZT3JkObMg6a3dUoloKKejtganNXnWS/
         yFE6H1OuMdjVfFeVK467pHxi0mRagh6vzedPh1w9I6I0oFqcMAmpABS3lpufYP/LoeP6
         saPA==
X-Forwarded-Encrypted: i=1; AJvYcCWGcZ1WFEAv2Y2PYKWtZTCsfFDGgEj6Y3GVAcREiUVrQKYDCpPvIT7vENsQvNv9tEvZUsS6zYdQxy2Kb7mv@vger.kernel.org
X-Gm-Message-State: AOJu0YxcEIDGCwVfvWHQ5nNPqCwSGSBPlwVGovLS5jXgvWz7zVBNxILM
	v62R7UTX+O8kxz2hLk50TE3TH04TD0NBnaob1sen138vcHBm8cDYnWWe3NWmK5e4ZafiH2sIyEL
	GKIG1sg1BiyM1Ocq/1utqvJTgxtop78Fm0EfDW769/ShNlrdCS2MNRiRtxVwLDwHt3GKR
X-Gm-Gg: ASbGncsTSF4FVKrD4rBuQ5KkXKqCWqUJwkWXsaTIODONijG4umHfFa237c0ou+pX01D
	xLtiqTl1s5g0jQfeJfex/skR5YH4iAPyd/vx+VuH0Ulb79ML5dgHeubxZDoMYEBjydgfMxwjJ5r
	kMoWhmWqJdQf9mrdtZXxZdFiigolVVaqEWd737nFVfBait17H5ODysbYh0/WDar/Vvdl5o/u6rD
	rXxbWdEIT9yZnoohtI95s7H/VxoHzj5N+FkZ7qq5FBoEtjuX9QHE1+h7bpi5zcDjGLsoQSRuMBc
	u+UH+yta4QkymBAxysNIZQwrbTBXH53e0BXzCxm746qaVFvNkuImoV0=
X-Received: by 2002:a05:620a:1727:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7d5dc6d1daamr1653790685a.23.1751880407856;
        Mon, 07 Jul 2025 02:26:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0cECjx1Uf+mlAgg/C5n1fBtG/LFQsvoOn0p8/ucLcry1XeXAF3J+XDAJNT9x0GNMUSikEyQ==
X-Received: by 2002:a05:620a:1727:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7d5dc6d1daamr1653787185a.23.1751880407184;
        Mon, 07 Jul 2025 02:26:47 -0700 (PDT)
Received: from trex (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b161e8e6sm108891495e9.6.2025.07.07.02.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:26:46 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 7 Jul 2025 11:26:45 +0200
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_dikshita@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
Message-ID: <aGuS1X+RfX38krpf@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-2-jorge.ramirez@oss.qualcomm.com>
 <76492de3-c200-535a-aa1b-c617ba6146f1@quicinc.com>
 <aGuOMrjfQBNYAjmF@trex>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGuOMrjfQBNYAjmF@trex>
X-Proofpoint-GUID: Mft4XEWxjliJWHzLAViliPjPPRABCWtM
X-Authority-Analysis: v=2.4 cv=GdUXnRXL c=1 sm=1 tr=0 ts=686b92d8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=DKyoZqHPbrAdFQiOrREA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Mft4XEWxjliJWHzLAViliPjPPRABCWtM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1NCBTYWx0ZWRfX502qK9MwaILU
 462P2VGR92b0J1H3DGnoRssVUyB7baSWm/SJ24poYtsvflshiosABLF60dg1DPvS5FpCaqnUMXz
 FyBTj9/s3ot1skXn36n80w0B+iwIchcqd9Nb17Zoi89oXMXkyBX29VPpikG/Q5fmyIpdCb4tEJa
 uw6G6O1p/VwXMNKEs92sHdeXVlUD+pQYNBjdeFedgYwHwfwL8u7E1QQA8PX/tcuK5d32BNXZ6xw
 aPaJT0tttl4iF1bpsWt6D7Nl46tueRflQtlzkCSjDKFLB1jpiR0Y4W5OPAdHkY8Itlfr6vRSM3N
 1OYIws9fO6JOGsM9Tfn0Bk6INCEZRJZeVUr2vURCclYZzhDlwPGIRXHv6kULeATeOk23gtPCmPJ
 62fDJaPTkhKd+GPwh3+0ERP4glp7O3NjBpi2/vvEWjqYr+phk1KdOctc6VsDFEI8uOH/4myG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070054

On 07/07/25 11:06:58, Jorge Ramirez wrote:
> On 27/06/25 17:36:43, Vikash Garodia wrote:
> > 
> > On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> > > Add a schema for the venus video encoder/decoder on the qcm2290.
> > > 
> > > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > ---
> > >  .../bindings/media/qcom,qcm2290-venus.yaml    | 127 ++++++++++++++++++
> > >  1 file changed, 127 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > > new file mode 100644
> > > index 000000000000..a9f89b545334
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> > > @@ -0,0 +1,127 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm QCM2290 Venus video encode and decode accelerators
> > > +
> > > +maintainers:
> > > +  - Vikash Garodia <quic_vgarodia@quicinc.com>
> > > +
> > > +description:
> > > +  The Venus AR50_LITE IP is a video encode and decode accelerator present
> > > +  on Qualcomm platforms
> > > +
> > > +allOf:
> > > +  - $ref: qcom,venus-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: qcom,qcm2290-venus
> > > +
> > > +  power-domains:
> > > +    maxItems: 3
> > > +
> > > +  power-domain-names:
> > > +    items:
> > > +      - const: venus
> > > +      - const: vcodec0
> > > +      - const: cx
> > > +
> > > +  clocks:
> > > +    maxItems: 6
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: core
> > > +      - const: iface
> > > +      - const: bus
> > > +      - const: throttle
> > > +      - const: vcodec0_core
> > > +      - const: vcodec0_bus
> > > +
> > > +  iommus:
> > > +    minItems: 1
> > > +    maxItems: 5
> > 2 should be good to support non secure usecases. 5 not needed.
> 
> ok

isnt it better to just leave 5 here - thinking of the future support for
secure buffers - and just update the dts?

> 
> > > +
> > > +  interconnects:
> > > +    maxItems: 2
> > > +
> > > +  interconnect-names:
> > > +    items:
> > > +      - const: video-mem
> > > +      - const: cpu-cfg
> > > +
> > > +  operating-points-v2: true
> > > +  opp-table:
> > > +    type: object
> > > +
> > > +required:
> > > +  - compatible
> > > +  - power-domain-names
> > > +  - iommus
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
> > > +    #include <dt-bindings/interconnect/qcom,qcm2290.h>
> > > +    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
> > > +    #include <dt-bindings/power/qcom-rpmpd.h>
> > > +
> > > +    venus: video-codec@5a00000 {
> > > +        compatible = "qcom,qcm2290-venus";
> > > +        reg = <0x5a00000 0xf0000>;
> > > +        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> > > +
> > > +        power-domains = <&gcc GCC_VENUS_GDSC>,
> > > +                        <&gcc GCC_VCODEC0_GDSC>,
> > > +                        <&rpmpd QCM2290_VDDCX>;
> > > +        power-domain-names = "venus",
> > > +                             "vcodec0",
> > > +                             "cx";
> > > +        operating-points-v2 = <&venus_opp_table>;
> > > +
> > > +        clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
> > > +                 <&gcc GCC_VIDEO_AHB_CLK>,
> > > +                 <&gcc GCC_VENUS_CTL_AXI_CLK>,
> > > +                 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
> > > +                 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
> > > +                 <&gcc GCC_VCODEC0_AXI_CLK>;
> > > +        clock-names = "core",
> > > +                       "iface",
> > > +                       "bus",
> > > +                       "throttle",
> > > +                       "vcodec0_core",
> > > +                       "vcodec0_bus";
> > > +
> > > +        memory-region = <&pil_video_mem>;
> > > +        iommus = <&apps_smmu 0x860 0x0>,
> > > +                 <&apps_smmu 0x880 0x0>,
> > > +                 <&apps_smmu 0x861 0x04>,
> > > +                 <&apps_smmu 0x863 0x0>,
> > > +                 <&apps_smmu 0x804 0xE0>;
> > update this accordingly.
> > > +
> > > +        interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
> > > +                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> > > +                        <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> > > +                         &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
> > > +        interconnect-names = "video-mem",
> > > +                             "cpu-cfg";
> > > +
> > > +        venus_opp_table: opp-table {
> > > +            compatible = "operating-points-v2";
> > > +
> > > +            opp-133000000 {
> > > +                opp-hz = /bits/ 64 <133000000>;
> > > +                required-opps = <&rpmpd_opp_low_svs>;
> > > +            };
> > This value is incorrect, fix it to 133330000.
> > > +            opp-240000000 {
> > > +                opp-hz = /bits/ 64 <240000000>;
> > > +                required-opps = <&rpmpd_opp_svs>;
> > Do you see other corners in the reference catalog as well, not just the
> > downstream code ? OR did you limit this as the usecase do not demand higher corner ?
> 
> there was an internal AR50_LITE presentation where only these two
> claimed to be supported - all of the others were not. so I went for the
> most restrictive option (ie, this one).
> 
> how do you want me to proceed then? should I just use IPCAT, or downstream?
> 
> 
> > 
> > Regards,
> > Vikash
> > > +            };
> > > +        };
> > > +    };

