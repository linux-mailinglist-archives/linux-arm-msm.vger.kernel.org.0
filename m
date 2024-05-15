Return-Path: <linux-arm-msm+bounces-19894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FD18C6973
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 17:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65C99284BB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 15:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A6D155A52;
	Wed, 15 May 2024 15:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="IOeJVtlu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9A2155A59;
	Wed, 15 May 2024 15:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715786002; cv=none; b=eXsICKNpPYjPexfyvgI1DDMU1lgVIcU36WqXHARBsr7w9Lsm0ZIQiJrPnC1Sqaj44vUu5dxttlCcY7thS+FJYhrGiMsLVb4RWUGmurmTQwd1FxoiTkGBrs6mfpgSDpcmjK50kVUVn6JF/rLVTOQ+H6nQ9494kH5jccbDEvU+99s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715786002; c=relaxed/simple;
	bh=XBZfuj02Zl9OrcMLaFsUectUl18cI/gGovODQu/ccCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LmNtEI/9nsG1Edbp+Mv0520ehb7v+0NjVLsfyCEmlnNvinWcFOfQmCtFRFOrccalvOXPwgEdWep3PnkvCGwZ1JMqSxI97rnVVkBu0a2LGeBGiS9Z/84jpdON6RlMruLx+PgYRbEhsFtoQHe9b5IX3236++CO0UxFF7k8Gq+HCmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz; spf=pass smtp.mailfrom=z3ntu.xyz; dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b=IOeJVtlu; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=z3ntu.xyz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1715785594; bh=XBZfuj02Zl9OrcMLaFsUectUl18cI/gGovODQu/ccCs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IOeJVtluz2V1StordWuTnwVe3CKDAMeIwkF+qLZ4MaxQFPOsQ63JQiMUzdXIrM+gz
	 lYO2Gn6NUEfa5giuKWyoOtBBeDIxEG02TmMyn8pKxMNsG4bRff6yk6XOsVM5OFSBZB
	 3xmQnvFLswmT2343I6mDd0EfPJgqqbO0MnsO0miE=
From: Luca Weiss <luca@z3ntu.xyz>
To: Rob Herring <robh@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH RFC 1/2] dt-bindings: soc: qcom,smsm: Allow specifying mboxes
 instead of qcom,ipc
Date: Wed, 15 May 2024 17:06:33 +0200
Message-ID: <2729475.mvXUDI8C0e@g550jk>
In-Reply-To: <5087455.31r3eYUQgx@g550jk>
References:
 <20240424-smsm-mbox-v1-0-555f3f442841@z3ntu.xyz>
 <20240425161715.GA2759240-robh@kernel.org> <5087455.31r3eYUQgx@g550jk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Rob,

Any feedback on the below topic?

Regards
Luca

On Donnerstag, 25. April 2024 20:54:40 MESZ Luca Weiss wrote:
> On Donnerstag, 25. April 2024 18:17:15 MESZ Rob Herring wrote:
> > On Wed, Apr 24, 2024 at 07:21:51PM +0200, Luca Weiss wrote:
> > > The qcom,ipc-N properties are essentially providing a reference to a
> > > mailbox, so allow using the mboxes property to do the same in a more
> > > structured way.
> > 
> > Can we mark qcom,ipc-N as deprecated then?
> 
> Yes, that should be ok. Will also send a similar change to the other bindings
> that support both qcom,ipc and mboxes.
> 
> >  
> > > Since multiple SMSM hosts are supported, we need to be able to provide
> > > the correct mailbox for each host. The old qcom,ipc-N properties map to
> > > the mboxes property by index, starting at 0 since that's a valid SMSM
> > > host also.
> > > 
> > > The new example shows how an smsm node with just qcom,ipc-3 should be
> > > specified with the mboxes property.
> > > 
> > > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > > ---
> > >  .../devicetree/bindings/soc/qcom/qcom,smsm.yaml    | 48 ++++++++++++++++++----
> > >  1 file changed, 40 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smsm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smsm.yaml
> > > index db67cf043256..b12589171169 100644
> > > --- a/Documentation/devicetree/bindings/soc/qcom/qcom,smsm.yaml
> > > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smsm.yaml
> > > @@ -33,6 +33,13 @@ properties:
> > >        specifier of the column in the subscription matrix representing the local
> > >        processor.
> > >  
> > > +  mboxes:
> > > +    minItems: 1
> > > +    maxItems: 5
> > 
> > Need to define what each entry is.
> 
> The entry is (description from qcom,ipc-N)
> 
>   "the outgoing ipc bit used for signaling the N:th remote processor."
> 
> So you want me to add 5 times e.g.
> 
> - the IPC mailbox used for signaling the 0th remote processor
> - the IPC mailbox used for signaling the 1st remote processor
> 
> etc? I don't really have any extra knowledge on smsm to be able to write
> something better there..
> 
> Also what are your thoughts on this binding vs the alternative I wrote
> in the cover letter? I'm not really happy about how the properties are
> represented.
> 
> Regards
> Luca
> 
> 
> > 
> > > +    description:
> > > +      Reference to the mailbox representing the outgoing doorbell in APCS for
> > > +      this client.
> > > +
> > >    '#size-cells':
> > >      const: 0
> > >  
> > > @@ -98,15 +105,18 @@ required:
> > >    - '#address-cells'
> > >    - '#size-cells'
> > >  
> > > -anyOf:
> > > +oneOf:
> > >    - required:
> > > -      - qcom,ipc-1
> > > -  - required:
> > > -      - qcom,ipc-2
> > > -  - required:
> > > -      - qcom,ipc-3
> > > -  - required:
> > > -      - qcom,ipc-4
> > > +      - mboxes
> > > +  - anyOf:
> > > +      - required:
> > > +          - qcom,ipc-1
> > > +      - required:
> > > +          - qcom,ipc-2
> > > +      - required:
> > > +          - qcom,ipc-3
> > > +      - required:
> > > +          - qcom,ipc-4
> > >  
> > >  additionalProperties: false
> > >  
> > > @@ -136,3 +146,25 @@ examples:
> > >              #interrupt-cells = <2>;
> > >          };
> > >      };
> > > +  # Example using mboxes property
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +
> > > +    shared-memory {
> > > +        compatible = "qcom,smsm";
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +        mboxes = <0>, <0>, <0>, <&apcs 19>;
> > > +
> > > +        apps@0 {
> > > +            reg = <0>;
> > > +            #qcom,smem-state-cells = <1>;
> > > +        };
> > > +
> > > +        wcnss@7 {
> > > +            reg = <7>;
> > > +            interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
> > > +            interrupt-controller;
> > > +            #interrupt-cells = <2>;
> > > +        };
> > > +    };
> > > 
> > 
> 
> 





