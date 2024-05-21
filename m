Return-Path: <linux-arm-msm+bounces-20168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2FB8CB564
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 23:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59E631F21357
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 21:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FF514831E;
	Tue, 21 May 2024 21:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dix/7OfU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B4115EA2;
	Tue, 21 May 2024 21:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716327151; cv=none; b=ja5x6jfTun1rdp6ecFP7K8SD0Ufmsboa4TkdGEbicm324QGBg9vA02cfdo288LxrkNe8XM+sukrRvRpBtxk6hz8fBQ4H5XlhiUu5fdmseNbV3YKMJv7yXAwC/5Usika2IsCvDJYdM0j0y0oUgBZlUuFeSpZtUWwyfkEjH2wDqfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716327151; c=relaxed/simple;
	bh=5oF/QDDDbA3fNERxopEj254W9nMEKDXznENW2Cmb9Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MDmi72qeXVkis/qE3yerrsJu7xFX3mU9Z0cGnXFS+kfn0ESlpAKQjQaFh7Flyw+p+kWXOMtOCVZatt30BAskzy8ktOi9YvpYeCOYXLHSkh6W+Gj678FOXJQB3mfeKFX8Ry1UlKvzaU7ED5Go+Npedt3coogujeGuqg5oofxNsW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dix/7OfU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F02EC4AF09;
	Tue, 21 May 2024 21:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716327151;
	bh=5oF/QDDDbA3fNERxopEj254W9nMEKDXznENW2Cmb9Fk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Dix/7OfU+1bzLXA6m95tX8CBgbWWUzVOQ1b3MqqvXrobrhmHSSyXgV/xyvunB7G8O
	 HvjSF8Y11IJRps8VjAUnh/EswDiXkMcFw0gudMrtm/g7Px4pG6Mr0ARUZfMdoQxRbL
	 uouYQFTwCKmQMrWLO4VaCFARaBnIAfRlUBpT5vfWjsoli31aeUyRoV9g4GMOupI/UC
	 Y1mOcIjdBtoBfgyexNvIGm1UeWIBoQrsOYpyne2XxaGI5ZhEqVHaK9TN/wt6oaPuq4
	 bGrZqaf0O7BW0HhZsndG+83eZDqYWgEzCrh63Ibd7ZPjrxbnLzW2OlJiSMUDL8M6eM
	 AZ3KDo7ZoSzcg==
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-de60a51fe21so143736276.0;
        Tue, 21 May 2024 14:32:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXVbdl6lZhjppPsLCfln6BLPpgPf8V9/GgChOJ+QvS4B6mXIpjIb7MURF4Sh28Dd7aviQ8p7T2xJj+d6zQAryAyztFtf+pY4QcxWUL6AVIAw5ZhixNN47E99mkClJBctraGwQsoanFIbvAvRYj1Fda3CyPIwfke6HDKn3GzNA3wzAy6bLS32pU=
X-Gm-Message-State: AOJu0YyqIm60CnNV0tDW7++ZTfPFB4Wt7OW73XYnw/opjdmVMaOtnSnr
	Aeea7FvvoXXas6sV1CqF4SYZJKIJgnbMUwTui02TBkOacYPKZIKUq+GAUG5O8lFqwQdFCuwZ2NV
	R/2kdXRTcXUNOHaxe5EFqu10U1Q==
X-Google-Smtp-Source: AGHT+IFCx0AP0MK1fSaEMjpMd+Lh/CTe/sD+hisRTflpwn6l7bIQeBHkW2WyYyvVoYiC8A2A3M856cY36WJLcHdt5wU=
X-Received: by 2002:a05:6902:523:b0:dcd:a9ad:7d67 with SMTP id
 3f1490d57ef6-df4e0bc9204mr458452276.8.1716327150210; Tue, 21 May 2024
 14:32:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
 <20240521-board-ids-v3-2-e6c71d05f4d2@quicinc.com> <20240521-bonfire-backboned-9ef33c10d447@spud>
 <20240521-unskilled-spindle-c4161092ae83@spud>
In-Reply-To: <20240521-unskilled-spindle-c4161092ae83@spud>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 21 May 2024 16:32:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJjvNfr_Vo7JNsBn6Fcv5r--ZqQTiforSLwrZ-z4_mURQ@mail.gmail.com>
Message-ID: <CAL_JsqJjvNfr_Vo7JNsBn6Fcv5r--ZqQTiforSLwrZ-z4_mURQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/9] dt-bindings: board: Introduce board-id
To: Conor Dooley <conor@kernel.org>
Cc: Elliot Berman <quic_eberman@quicinc.com>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Amrit Anand <quic_amrianan@quicinc.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Andy Gross <agross@kernel.org>, 
	Doug Anderson <dianders@chromium.org>, Simon Glass <sjg@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	"Humphreys, Jonathan" <j-humphreys@ti.com>, Sumit Garg <sumit.garg@linaro.org>, 
	Jon Hunter <jonathanh@nvidia.org>, Michal Simek <michal.simek@amd.com>, 
	boot-architecture@lists.linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 2:25=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, May 21, 2024 at 08:21:45PM +0100, Conor Dooley wrote:
> > On Tue, May 21, 2024 at 11:37:59AM -0700, Elliot Berman wrote:
> > > Device manufcturers frequently ship multiple boards or SKUs under a
> > > single softwre package. These software packages ship multiple devicet=
ree
> > > blobs and require some mechanims to pick the correct DTB for the boar=
ds
> > > that use the software package.
> >
> > Okay, you've got the problem statement here, nice.
> >
> > > This patch introduces a common language
> > > for adding board identifiers to devicetrees.
> >
> > But then a completely useless remainder of the commit message.
> > I open this patch, see the regexes, say "wtf", look at the commit
> > message and there is absolutely no explanation of what these properties
> > are for. That's quite frankly just not good enough - even for an RFC.
> >
> > >
> > > Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> > > ---
> > >  .../devicetree/bindings/board/board-id.yaml        | 24 ++++++++++++=
++++++++++
> > >  1 file changed, 24 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/board/board-id.yaml b/=
Documentation/devicetree/bindings/board/board-id.yaml
> > > new file mode 100644
> > > index 000000000000..99514aef9718
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/board/board-id.yaml
> > > @@ -0,0 +1,24 @@
> > > +# SPDX-License-Identifier: BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/board/board-id.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: board identifiers
> > > +description: Common property for board-id subnode
> >
> > s/property/properties/
> >
> > > +
> > > +maintainers:
> > > +  - Elliot Berman <quic_eberman@quicinc.com>
> > > +
> > > +properties:
> > > +  $nodename:
> > > +    const: '/'
> > > +  board-id:
> > > +    type: object
> > > +    patternProperties:
> > > +      "^.*(?!_str)$":
> >
> > Does this regex even work? Take "foo_str" as an example - doesn't "^.*"
> > consume all of the string, leaving the negative lookahead with nothing
> > to object to? I didn't properly test this with an example and the dt
> > tooling, but I lazily threw it into regex101 and both the python and
> > emcascript versions agree with me. Did you test this?
> >
> > And while I am here, no underscores in property names please. And if
> > "str" means string, I suggest not saving 3 characters.
> >
> > > +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > +      "^.*_str$":
> > > +        $ref: /schemas/types.yaml#/definitions/string-array
> >
> > Why do we even need two methods? Commit message tells me nothing and
> > there's no description at all... Why do we need regexes here, rather
> > than explicitly defined properties? Your commit message should explain
> > the justification for that and the property descriptions (as comments i=
f
> > needs be for patternProperties) should explain why this is intended to
> > be used.
> >
> > How is anyone supposed to look at this binding and understand how it
> > should be used?
>
> Also, please do not CC private mailing lists on your postings, I do not
> want to get spammed by linaro's mailman :(

boot-architecture is not private[0]. It is where EBBR gets discussed
amongst other things. This came up in a thread there[1].

Rob

[0] https://lists.linaro.org/mailman3/lists/boot-architecture.lists.linaro.=
org/
[1] https://lists.linaro.org/archives/list/boot-architecture@lists.linaro.o=
rg/thread/DZCZSOCRH5BN7YOXEL2OQKSDIY7DCW2M/

