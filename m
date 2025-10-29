Return-Path: <linux-arm-msm+bounces-79400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAE6C196EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2680646202B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 09:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1EC32AAB2;
	Wed, 29 Oct 2025 09:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wPGfSKT/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FF032AAC1
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761730794; cv=none; b=KQkZJYNGiCA3mWS/E+9v7HU8nPdtnwnMaD+V5MZLVvQMqv21g+gC+lv6kVhWPE8DuLlSnRwRdIJrrugquJ3G/Jz5j7v1OausEi+4Tb47zltXpVixc9nFV4F4wWLDxetk+2KiJoUu8x2ctwrgNT3N7MeNMEKNKmGhS5faJIuOALo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761730794; c=relaxed/simple;
	bh=urnwJ0948OZAY6zDTK8e1ZFZ719514SR28lbeFJUqg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RJT+jU97mnLlTaLDBYZI/OYAhaGrThTi4A1tTU7JhqkGA+crAv+Sjt26sbRNGAIuy28lyoFpVnqFzKAg6/IFKC4E0FerFlFo7uO4Za2o7xI/Sz6zPj8EHALE+6FwG5Bwb3z7SpKzrfbGJ4ICYpWDG0Cba2fo1mFje4K8g5wIq2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wPGfSKT/; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-89ed2ee36b0so492508085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761730791; x=1762335591; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R+Rd5gslE+ZFZnAsPLhh3hhVOGomUEHbHKD97n8UNP4=;
        b=wPGfSKT/hLUQDLu+IM3dvya6BTa5HIRiJPDXeQcIRHMMcvN9nJ5dTwWnUtnZ1MyQBJ
         Ua2wkI3GDO8rRgOSa7zUo9Or7bg2WOTlpnxlI87SmPbgbaRsFEm6X8Yu16nYgsruQKIH
         i4hw0qlda5N3rRGJ6gpqFzw/kOlownOZNCZ6KAkNoMt9t0MKU5Y6azqhQ8ODiYgu6U9y
         O98EmsmxIzQqbxN2Hgmb7Nz+/GbeMwu+K00X9F2VSQEC8Fu3ptm9qPO50lnKb98lA4fb
         XMNQ/c1dJZV4EPcZH7TYSe8VJpuVfR/UUepm3qvFrM6f3BZgatuZ7pyDLk1MyG92oAgY
         g5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761730791; x=1762335591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+Rd5gslE+ZFZnAsPLhh3hhVOGomUEHbHKD97n8UNP4=;
        b=iX/pJqJSuP4JSpoNnuIy0CghNzHvVoy2mA5HkG71kC/5EXmphO0ra85DeGQrRhg5j/
         bZmhztJBA8TB/wE6//S9SnKs+URnwQ6KRPcHDE6jD7mQxj2gEFpSZdMr2SQrA/AK7wl0
         FoxOaB3UdoFm5v5EVFfCxsDUW/Q3sB+NPTXppAy1o8PN+Z8xDn5d1SMlS9XVkwKfDbus
         sDtme2MQdoGvdBupTZhMNdgWfSwTyqRzAgeGPWgs4DZuQTBmIqa8WDZKaHAYnFQ1oOza
         FqK68gqz1dMd0BRso2qpmJ0aVL1DRigC2CX0VxmHbUH40mGumx2EWY2vWaOgIPymi/6E
         usQw==
X-Forwarded-Encrypted: i=1; AJvYcCWsgqFszdX+GhfL/KqZX51O/mgYssGElJJe/tb2vvFGx5zjXjolL7aVTT7F2KuevdLo8oV82IBXHgEiyHJ2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6PMUjeIKiVMdqng22F9c6QRQyRBlml2VqqOnQgP0125jlj3Ml
	jS5xgiB2uAnEYakxhDKBi+VV9unw1cxVxQji6Nb/antvu1mBoVQIBPthxVPpL8HspFzJeFoPhrt
	hN11jczAwPmrSyaKSwEpf5AYdcrSThwUc9iCq0xzmtQ==
X-Gm-Gg: ASbGncu1csQzjyR9u7fDjpW+E0AER90QZv6kwU06n9c03Og7aPLB+13DgP+YX02dJ/q
	0G3/UaNJ1ZL0qaRRF+wVPQmZPD6qUiF9G18NIHqdGlamRB8TJjilfi8UY0inVBBnlbG4RGKJL7r
	nhNKdiiIqAWBbFldt/GS3zzF1ffeuaDlQYETZTPYBNidTpFSUME3cvSJtUyMH0BQG0tV6Z/zDIp
	JfgL8hA3G2BA6q/AOa1GFF5GCLZw9m9NJbDfRz/Cxa5QIT9DVZLHK4R+PKWI/3rcdpWnzGZu+K7
	LbEhJjyFYNbsckLXc0VsrzBOQgk5
X-Google-Smtp-Source: AGHT+IHqXSf1MiiiqnfsW/ioS/jj/mhb/BAEdrr3nKBvzCE+jcWgD9EFD8HQohkXivlPjhP7YZ3CSvcZ9+eiOBWkEyk=
X-Received: by 2002:a05:620a:3704:b0:813:31ad:bf3d with SMTP id
 af79cd13be357-8a8e436119dmr303015885a.12.1761730790824; Wed, 29 Oct 2025
 02:39:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
 <20251027-cpu_cluster_component_pm-v1-1-31355ac588c2@oss.qualcomm.com> <20251028-enigmatic-astonishing-husky-f2c47a@kuoka>
In-Reply-To: <20251028-enigmatic-astonishing-husky-f2c47a@kuoka>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 29 Oct 2025 09:39:39 +0000
X-Gm-Features: AWmQ_bkH9LQFvaEP4xZtRhiFYXppvNFKfWjaQQ7mkEY-rNttgjUoHB7gFuBi_fs
Message-ID: <CAJ9a7Vg1jR=UBWwQanvyW_-ucXQ1HWQha47oJCUL6vkfQwgpKQ@mail.gmail.com>
Subject: Re: [PATCH 01/12] dt-bindings: arm: coresight: Add cpu cluster
 tmc/funnel/replicator support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 28 Oct 2025 at 09:09, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Oct 27, 2025 at 11:28:03PM -0700, Yuanfang Zhang wrote:
> > Add the following compatible strings to the bindings:
> > - arm,coresight-cpu-funnel
> > - arm,coresight-cpu-replicator
> > - arm,coresight-cpu-tmc
>

These are redundant - the actual hardware has not changed - what has
is how the device is powered up / down on the system

> We see that from the diff. Explain here the hardware instead.
>
> >
> > Each requires 'power-domains' when used.

So why is this not used to adjust the power handling in the driver? Or
another attribute.
Look at the CTI bindings - these can be associated with a CPU or be a
system CTI - we look at the cpu attribute to differentiate, not have
two separate compatibles.

Regards

Mike


> >
> > Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> > ---
> >  .../bindings/arm/arm,coresight-dynamic-funnel.yaml | 23 +++++++++++++++++-----
> >  .../arm/arm,coresight-dynamic-replicator.yaml      | 22 +++++++++++++++++----
> >  .../devicetree/bindings/arm/arm,coresight-tmc.yaml | 22 +++++++++++++++++----
> >  3 files changed, 54 insertions(+), 13 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> > index b74db15e5f8af2226b817f6af5f533b1bfc74736..8f32d4e3bbb750f5a6262db0032318875739cf81 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> > @@ -28,19 +28,32 @@ select:
> >    properties:
> >      compatible:
> >        contains:
> > -        const: arm,coresight-dynamic-funnel
> > +        enum:
> > +          - arm,coresight-dynamic-funnel
> > +          - arm,coresight-cpu-funnel
>
> Keep alphabetical sorting. We asked this multiple times already.
>
> >    required:
> >      - compatible
> >
> >  allOf:
> >    - $ref: /schemas/arm/primecell.yaml#
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: arm,coresight-cpu-funnel
> > +    then:
> > +      required:
> > +        - power-domains
>
> Just move the allOf to the bottom like in example-schema.
>
> > +
> >  properties:
> >    compatible:
> > -    items:
> > -      - const: arm,coresight-dynamic-funnel
> > -      - const: arm,primecell
> > -
>
> Why do you remove this?
>
> > +    oneOf:
> > +      - items:
> > +          - const: arm,coresight-dynamic-funnel
> > +          - const: arm,primecell
> > +      - items:
> > +          - const: arm,coresight-cpu-funnel
>
> Hm? Why do you need custom select if this is not primecell? And nothing
> in commit msg explains why this is not primecell anymore.
>
> You have entire commit msg to say something useful, WHY you are doing
> this, WHY you are doing it DIFFERENTLY. Don't say what you did - that's
> obvious, we are capable of reading diffs.
>
> Best regards,
> Krzysztof
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

