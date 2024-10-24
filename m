Return-Path: <linux-arm-msm+bounces-35741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 123D09AF2FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 21:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 365AD1C2157F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 19:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE1B22B656;
	Thu, 24 Oct 2024 19:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pcsxP+mt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7537E18BB88
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 19:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729799659; cv=none; b=FpREX6ItW/5VKDJ5S6sTXgFJI8nTlYcLx4Px5AboZcpIRMM50wuHyZ8giKD88AD/EJ065WzOJdstfb19fLrNXHETFdQ5okQNwzgjAVqymr678jdHuaOzuOGDUVrJTirI8tfZzLkzKZZplV2MdCQdPljTrzgSllgOlPL0aytKAqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729799659; c=relaxed/simple;
	bh=28Z77EQ2o5/OOD9oFbhvwjJaySwLp6sVPl4XMpwn6i0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/PQ4V5saRqaEW48n3CIjKC82L0BJIoxtJ0nrQaDroqyNvHDmElbIDeHUcmeNEi2hRzfI0Y0r+IHC8HAdCm7vINQmzba+ZZI5vIAShknl4l+Fo4dv9qo1Ds+UDAbNY1Q8NHNxOAUP781lg/FsZKLElH0XFA9yQTUm/GfSiTIeP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pcsxP+mt; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb49510250so14705411fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 12:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729799655; x=1730404455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oz0QfbFcBfrCj5V4z1JU4JGAn69rg5zGFkOEbcFhIzA=;
        b=pcsxP+mt8+Z/WgjHdCywvyCvSF368dxlzC9KrejN71i+Jtfgj3nf+ZjVIpbojoRZtL
         Svt8/sfrkjlRvn2r/ofv6g7F7cuyhJtRe9KAJ8SWOIgmTB5b2fHE2SjkiQLyCKR/WGfj
         w5amaplxouh29CAJYswyKVzwmeDbQfvoUooPaGJjNg3YLVLXs5hnRuHY4nOGjWylhMFY
         L3Bk+D05HxLeizi8NNwOQsDaX9DhMDWW3syQ/ts10/EcsaYAFDnc3aB6HjQHlhzHSU2E
         1w3euOnxBISl52TwR09M9+YL2YkNk6jG/QE+NEzl8HBeTvcWv0BMgecTsTXCjSo892eQ
         KrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729799655; x=1730404455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oz0QfbFcBfrCj5V4z1JU4JGAn69rg5zGFkOEbcFhIzA=;
        b=jTtKnM50Yvi5rv9jsvKHJWiRgXqEZKM57OlgngpyaP/BPjz3EV4anQSB0neHA8QouE
         KD1koKB5wRcH2fU+XN4W3t2PFCkZQfyb186Gs/AFw4ysFxlx4QKbGYkYuWEb5rTp2fgU
         uE4JykRaqQ4tdNvT6QNMWjFHr0QEcopdrHPsBUV+Vv1/Yn6aJL0fD8TX59ZYVLCx84nz
         aikVADi7SBVKk6s0v9DiYGndwXdTcnO7hfUvbYpXsNtDeRe/T2+FNtfEUoBLFOaJW/Ug
         NxODWasEwP1zmG8npjyMxZNZq6xFQMhgxYCaQl2MiLkhj+d/U/w3kH5blDq85L6wXzgD
         xKCg==
X-Forwarded-Encrypted: i=1; AJvYcCUTKCCt9WhsknpSjsEe+fqFskCkDEHf93fDpxlat9EApc6Pc03PvY+Kb6rbjfDE7BmpUOT+IgVkp2Zofdh2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5cy3i0wyuj656pNYpXezI0+mgNqJmX5ysRtOz2xZiEkJPDJyE
	wPVlFKG4RsPxGwSVETJaJLrq/q5AX+tqfwmEW/O3D6nxKUL/vkfl0UjSywVjqC8=
X-Google-Smtp-Source: AGHT+IEetrpZ1w47TpL4hhnY+i6tZmfDQ45ZKhPS6dYa8I3PZ+1oN5tmmUCGsnRy/WGozI18HYbBig==
X-Received: by 2002:a2e:be26:0:b0:2fb:4bee:47ec with SMTP id 38308e7fff4ca-2fc9d59ef88mr43668801fa.33.1729799654447;
        Thu, 24 Oct 2024 12:54:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ad60d8asm14707751fa.38.2024.10.24.12.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 12:54:13 -0700 (PDT)
Date: Thu, 24 Oct 2024 22:54:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, 
	conor+dt@kernel.org, arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 1/5] dt-bindings: firmware: Document bindings for QCOM
 SCMI Generic Extension
Message-ID: <4kovyp7655kwkznnem5e4mg2yjroc2x76vsyp6w4bm5n7tn5xy@rrz2ih2u4p2x>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-2-quic_sibis@quicinc.com>
 <rqa7g5hfsxozw6m4ke3jygijz5rp3lwu2fmqsebrjq6hsgb7nm@mxaiaddvuijk>
 <911483df-ee09-033d-7fae-4090bf8a3713@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <911483df-ee09-033d-7fae-4090bf8a3713@quicinc.com>

On Tue, Oct 22, 2024 at 12:43:09PM +0530, Sibi Sankar wrote:
> 
> 
> On 10/7/24 23:36, Dmitry Baryshkov wrote:
> > On Mon, Oct 07, 2024 at 11:40:19AM GMT, Sibi Sankar wrote:
> > > Document the various memory buses that can be monitored and scaled by
> > > the memory latency governor hosted by the QCOM SCMI Generic Extension
> > > Protocol v1.0.
> > > 
> > > Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> 
> Hey Dmitry,
> 
> Thanks for taking time to review the series!
> 
> > > ---
> > > 
> > > v3:
> > > * Restructure the bindings to mimic IMX [Christian]
> > > 
> > >   .../bindings/firmware/arm,scmi.yaml           |   1 +
> > >   .../bindings/firmware/qcom,scmi-memlat.yaml   | 246 ++++++++++++++++++
> > >   .../dt-bindings/firmware/qcom,scmi-memlat.h   |  22 ++
> > >   3 files changed, 269 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml
> > >   create mode 100644 include/dt-bindings/firmware/qcom,scmi-memlat.h
> > > 
> > > diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > > index 54d7d11bfed4..1d405f429168 100644
> > > --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > > +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> > > @@ -24,6 +24,7 @@ description: |
> > >   anyOf:
> > >     - $ref: /schemas/firmware/nxp,imx95-scmi.yaml
> > > +  - $ref: /schemas/firmware/qcom,scmi-memlat.yaml
> > >   properties:
> > >     $nodename:
> > > diff --git a/Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml b/Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml
> > > new file mode 100644
> > > index 000000000000..0e8ea6dacd6a
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml
> > > @@ -0,0 +1,246 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/firmware/qcom,scmi-memlat.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm SCMI Memory Bus nodes
> > > +
> > > +maintainers:
> > > +  - Sibi Sankar <quic_sibis@quicinc.com>
> > > +
> > > +description:
> > > +  This binding describes the various memory buses that can be monitored and scaled
> > > +  by memory latency governor running on the CPU Control Processor (SCMI controller).
> > > +
> > > +properties:
> > > +  protocol@80:
> > > +    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
> > > +    unevaluatedProperties: false
> > > +
> > > +    properties:
> > > +      reg:
> > > +        const: 0x80
> > > +
> > > +    patternProperties:
> > > +      '^memory-[0-9]$':
> > > +        type: object
> > > +        unevaluatedProperties: false
> > > +        description:
> > > +          The list of all memory buses that can be monitored and scaled by the
> > > +          memory latency governor running on the SCMI controller.
> > > +
> > > +        properties:
> > > +          qcom,memory-type:
> > > +            $ref: /schemas/types.yaml#/definitions/uint32
> > > +            enum: [0, 1, 2]
> > > +            description: |
> > > +              Memory Bus Identifier
> > > +              0 = QCOM_MEM_TYPE_DDR
> > > +              1 = QCOM_MEM_TYPE_LLCC
> > > +              2 = QCOM_MEM_TYPE_DDR_QOS
> > 
> > I'm sorry if this has been discussed and frowned upon, but can you
> > squash memory type into device node?
> 
> I don't think anyone had any strong opinions on how the
> nodes is to be named. We went with a generic node name since
> it could accomodate multiple instances of llcc or ddr in the
> future. We didn't want it be named ddr-0/ddr-1 and so on. So
> I'll continue to stick with the current naming unless you have
> a strong reason other than readability.

As I wrote in the other email, the memory types are not equal. They have
different properties, etc. Having non-generic names allows describing
that in schema.

Last, but not least, please consider how reserved memory nodes are
handled nowadays: they have non-generic names, each one describing the
purpose / kind.

> > protocol@80 {
> > 	ddr {
> > 	};
> > 
> > 	llcc {
> > 	};
> > 
> > 	ddr-qos {
> > 	};
> > };
> > 
> > > +
> > > +          freq-table-hz:
> > > +            items:
> > > +              items:
> > > +                - description: Minimum frequency of the memory bus in Hz
> > > +                - description: Maximum frequency of the memory bus in Hz
> > 
> > Does it make sense for the DDR-QOS type? Can we hardcode those values
> > and drop freq-table-hz from the DDR-QOS node?
> > 
> > Also, can we drop this completely by adding one extra OPP entry with the
> > minimum memory bus frequency?
> 
> the map table doesn't necessarily list all the supported
> frequencies. It was made that way so that the table is flexible
> enough that it doesn't have to be changed a lot across platforms.
> Hence a need for a separate property to list min/max freq.

Please use opp-supported-hw or other similar techniques to describe
supported frequencies.

> 
> > 
> > > +
> > > +        patternProperties:
> > > +          '^monitor-[0-9]$':
> > > +            type: object
> > > +            unevaluatedProperties: false
> > > +            description:
> > > +              The list of all monitors detecting the memory latency bound workloads using
> > > +              various counters.
> > > +
> > > +            properties:
> > > +              qcom,compute-type:
> > > +                description:
> > > +                  Monitors of type compute perform bus dvfs based on a rudimentary CPU
> > > +                  frequency to memory frequency map.
> > > +                type: boolean
> > 
> > This seems to be redundant. If there is no qcom,ipm-ceil property, then
> > it's qcom,compute-type, isn't it?
> 
> ack
> 
> > 
> > > +
> > > +              qcom,ipm-ceil:
> > > +                $ref: /schemas/types.yaml#/definitions/uint32
> > > +                description:
> > > +                  Monitors having this property perform bus dvfs based on the same
> > > +                  rudimentary table but the scaling is performed only if the calculated
> > > +                  IPM (Instruction Per Misses) exceeds the given ceiling.
> > > +
> > > +              cpus:
> > > +                $ref: /schemas/types.yaml#/definitions/phandle-array
> > > +                description:
> > > +                  Should be a list of phandles to CPU nodes (as described in
> > > +                  Documentation/devicetree/bindings/arm/cpus.yaml).
> > 
> > Which CPU nodes? I see that the examples list all CPUs here. Do we
> > really need them?
> 
> This observation is only valid for X1E where all the cpus have
> identical freq charecteristics. Even with this case we need to
> list them to handle cases where cpus gets disabled by the bootloader
> on lower cored X1E parts i.e. we use this to figure out the actual
> physical mask.

This should be a part of the description.

BTW, why do you need to remove bootloader-removed cores? Can you simply
ignore non-existing CPUs instead?

> 
> > 
> > > +
> > > +              operating-points-v2: true
> > > +              opp-table:
> > > +                type: object
> > > +
> > > +            required:
> > > +              - cpus
> > > +              - operating-points-v2
> > > +
> > > +            oneOf:
> > > +              - required: [ 'qcom,compute-type' ]
> > > +              - required: [ 'qcom,ipm-ceil' ]
> > > +
> > > +        required:
> > > +          - qcom,memory-type
> > > +          - freq-table-hz
> > > +
> > > +additionalProperties: true
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/firmware/qcom,scmi-memlat.h>
> > > +
> > > +    firmware {
> > > +        scmi {
> > > +            compatible = "arm,scmi";
> > > +            mboxes = <&cpucp_mbox 0>, <&cpucp_mbox 2>;
> > > +            mbox-names = "tx", "rx";
> > > +            shmem = <&cpu_scp_lpri0>, <&cpu_scp_lpri1>;
> > > +
> > > +            #address-cells = <1>;
> > > +            #size-cells = <0>;
> > > +
> > > +            protocol@80 {
> > > +                reg = <0x80>;
> > > +
> > > +                memory-0 {
> > > +                    qcom,memory-type = <QCOM_MEM_TYPE_DDR>;
> > > +                    freq-table-hz = /bits/ 64 <200000000 4224000000>;
> > > +
> > > +                    monitor-0 {
> > 
> > Hmm. Can we say that each memory type can have at most one IPM and one
> > compute aka "passive" memlat monitor? Does it make sense to use them as
> > node names and drop the extra monitor-M names?
> 
> Again this observation is valid only for X1E where the cpu freq
> across cpu's are identical across clusters and is not true for
> other mobile SoCs. So each memory can have more than 2 monitors
> i.e. atleast one active/passibe monitor for each cluster.

Description or commit message, please.

> 
> > 
> > > +                        qcom,ipm-ceil = <20000000>;
> > > +                        cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
> > > +                                &CPU8 &CPU9 &CPU10 &CPU11>;
> > 
> > Are CPU lists different between monitors? Can they be different? Can
> > they be different between different memory types?
> 
> same explanation.
> 
> > 
> > > +                        operating-points-v2 = <&memory0_monitor0_opp_table>;
> > > +
> > > +                        memory0_monitor0_opp_table: opp-table {
> > 
> > sensible names are better:
> 
> I think I just picked these names up from a cpufreq table upstream.

Doesn't mean that you can't be better than that :-D

> 
> > 
> > ddr_ipm_opp_table: opp-table {
> > };
> > 

-- 
With best wishes
Dmitry

