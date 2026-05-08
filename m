Return-Path: <linux-arm-msm+bounces-106678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OGdAIHT/Wl2jgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 14:13:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F204F62FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 14:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2FA9D300B86A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 12:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA223DC4B1;
	Fri,  8 May 2026 12:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i5Vz0apS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAC03DB652
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 12:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778242204; cv=none; b=BBzwPJZNuvFliQhstjiepk7PJGa31GF0VO+i334AhNbXs0UhyFQ9ML1PG0VV38Gx0Fdwjfo9U3irL9d02laVpmE8KWxJwwPy2xEvl70FbzhLAAUszdqRZ2Xsyf/VC2ZJX8kb9jSC5znUy5DKNzZLxFq8f8t71Hr9x7jVxMnfCHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778242204; c=relaxed/simple;
	bh=CyyycdNhDeZNVbLgvDsTXt8Zz5rvS5/EVDmp6oyWdzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RRGNSOMIx69JrU2DNZduBvYFOvhoatyrjM/5Shh9j671GzvrMNqoq1psMUoCrhtOcl7EdQ9smyBMsp7H5T1UnSbO3ZlBc83ge6NdcApLgybKRusNCY9/rmTmze1KJK9O+nuNmRPg4+hTrhhhQl2IwcZE+aHTiyJGcxWjwSP3a24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i5Vz0apS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A936C2BCB0
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 12:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778242203;
	bh=CyyycdNhDeZNVbLgvDsTXt8Zz5rvS5/EVDmp6oyWdzw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i5Vz0apSm46UWI4XCn2yCTZ8Q5WtWf7hzEGE776lPuI301XFnTeeHm/858yrYK2AD
	 UJzkehqVFgZ49RyvPUQRw+BwvfQ+Q0w6GbENQQX1N8EVpjbfznec8Lbk7X7UqEe4zd
	 ftCZTFcVNgGSj1eovJkO8HcxGTExDY9Lklg0UgDOiUcDE0fEg9yX5v5pqsUI+NAC9t
	 5TnKaqnmETYiVsHu8wATfYXzEt3h9+xaldROJsD9x6tcyKmKZMyOCxb5bG2OBt5voD
	 6rd5I3hF4reDHc6DJF8dNrQNeXiBp+FMyGv16YDLiK5k+OK0//pk7IEVQL7YH0PHne
	 mZFEXZSJ48eXg==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-67c2b4809baso3542079a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 05:10:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/qJMbkKsQDUKtesEgntjPg7slKI2nF7/B79i5MAE0NULa1BRjouM/BHhiqnF9uyH9/ZIxgsigpGHBJxaig@vger.kernel.org
X-Gm-Message-State: AOJu0YwD+n+W/+qG97rbzb2yFPQIdByEAdxY0GGiyowwSr6f5iPogGpg
	cRGD7xgF9YxKvXiJLnUWmo91GlYDvkfyYwjRxHjXwzrKdP9IuBXjQdOWdJ8mQx3ZYBMm7FBHLZL
	VOZmrtKq3vgBfLdb3YojIoLQZ+FDDCg==
X-Received: by 2002:a05:6402:4558:b0:67c:9609:eb79 with SMTP id
 4fb4d7f45d1cf-67d642c252amr4835587a12.17.1778242202258; Fri, 08 May 2026
 05:10:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-2-mukesh.ojha@oss.qualcomm.com> <c0def708-4d95-4398-8a20-8d4a7533fcf1@oss.qualcomm.com>
In-Reply-To: <c0def708-4d95-4398-8a20-8d4a7533fcf1@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 8 May 2026 07:09:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJNn=k64unun=k+3FOem74x452WuXKS7fZCL0Vxmcy9Uw@mail.gmail.com>
X-Gm-Features: AVHnY4JeIYIMdPva8pT_Wso0HT3Co9MhBZNkN-H-UIxL7M8MWA9GI56h3ZWhTFs
Message-ID: <CAL_JsqJNn=k64unun=k+3FOem74x452WuXKS7fZCL0Vxmcy9Uw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: firmware: qcom,scm: Add minidump SRAM property
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 71F204F62FC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-106678-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On Fri, May 8, 2026 at 5:50=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/7/26 10:07 AM, Mukesh Ojha wrote:
> > On most Qualcomm SoCs where minidump is supported, a word in always-on
> > SRAM is shared between the kernel and boot firmware. Before DDR is
> > initialised on the warm reset following a crash, firmware reads this
> > word to decide if minidump is enabled and collect a minidump and where
> >  to deliver it (USB upload to a host, or save to local storage).
> >
> > Add 'sram' and 'sram-names' properties to the SCM binding to describe
> > a region in always-on SRAM where the minidump download destination
> > value could be written. Boot firmware reads it before DDR is initialise=
d
> > on a warm reset to decide where to store the minidump either to host
> > PC or to on device storage.
> >
> > Most of the Qualcomm SoC supporting minidump supports this, added the
> > kaanapali SoC for now.
> >
> > Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  .../bindings/firmware/qcom,scm.yaml           | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b=
/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > index 7918d31f58b4..6813081fd74a 100644
> > --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> > @@ -127,6 +127,22 @@ properties:
> >            - description: offset of the download mode control register
> >      description: TCSR hardware block
> >
> > +  sram:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description:
> > +      Phandle to a region in always-on SRAM used to store the download
> > +      mode value for boot firmware to read before DDR is initialised o=
n
> > +      the next warm reset.
> > +    maxItems: 1
> > +
> > +  sram-names:
> > +    items:
> > +      - const: minidump
> > +
> > +dependencies:
> > +  sram: [ sram-names ]
> > +  sram-names: [ sram ]
> > +
> >  allOf:
> >    # Clocks
> >    - if:
> > @@ -229,6 +245,18 @@ allOf:
> >        properties:
> >          memory-region: false
> >
> > +  - if:
> > +      not:
> > +        properties:
> > +          compatible:
> > +            contains:
> > +              enum:
> > +                - qcom,scm-kaanapali
>
> This list will grow super large - like mentioned in the commit message,
> to list almost all platforms.. I don't know if it makes sense to limit
> this. Krzysztof/Rob?

Probably not. If sram is not valid for a platform, you'd have to go
out of your way to first add it and to have any effect if you did.

Rob

