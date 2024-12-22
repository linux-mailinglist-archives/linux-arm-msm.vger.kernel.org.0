Return-Path: <linux-arm-msm+bounces-43075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0269FA504
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 10:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2655164A98
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 09:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BBF18859A;
	Sun, 22 Dec 2024 09:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDvyJf2G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E46A2D;
	Sun, 22 Dec 2024 09:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734860477; cv=none; b=oxFQ/KQzwdqKgyFTlGLvNL9WNYO0N1ukXbD5pBD7Kqx+R7tvCM4/2N+lRu2sPxDaozgv7XNA1hqh+J2dOSgkAKbktFgUdAhOlvwvHFuWrAeKWPOhGqpO9J2jZ4IW51Qbw1mbPKWFW/2Ginan047XN6rNikip3VYFcazJK6IdvuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734860477; c=relaxed/simple;
	bh=4vNUwS5Gm+JncTKiGMk/8bmFD2dtvzK12MY8RWlLzcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RDldEh5ttiGQC+2UVcCFBGyYigoaZ2uGoVazpQOi41vwIL2K7uwj8q/z61Z/q2azzG6tlu2ckIPe3v8Ct1Yqt1y27QAiDinrvcngdQsoE3FWDa5lUBYQXrEkIfOw0+VW+3AGudgsy/TNrIHEUtNC1lKOehI6EIcCtk2491xso0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDvyJf2G; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-29fb532b668so908663fac.0;
        Sun, 22 Dec 2024 01:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734860475; x=1735465275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ywcz1XGAqMPO58RLFF0U/ywOIQFLprEJJcNwPe8+up4=;
        b=VDvyJf2GGn56rjRNSXEm62+EsTBvQ/SsPgMsSxjVvhoQjeK6USpbKWoLE85wNwOecQ
         xI0RxPu7zwb6yTOcke4qvuRwL3U+UwYSXTyLvw7M4UsbeUYKWYUzstCYzgrV6+1C/4Hn
         P1qAxyFzXUrkG/9Wn1bQu/55ODoEKtp45p+fUkiVCWIPDCMKWMTkkqIuYg9NJqsK5eJq
         o+FutUK2Gj3n2IIxXQp8FrLevHsDa3XvHkD1JDsYC23U9tMFYTNBjeiB1RkIN8jCLAo7
         tyATqDg+lT9uc5mH4utqYbA/j7JuWJq1mcO22OZxFyGEB+uXcnwgWGHAncB1NLlutKFJ
         4T2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734860475; x=1735465275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ywcz1XGAqMPO58RLFF0U/ywOIQFLprEJJcNwPe8+up4=;
        b=bLGQXgOabPVKjSC/nroQRQY8yi90KuPcKTUDc08WaSQgTzQA9di9me6d/o30vdVjJi
         zYz1hJJtG2gYUQ19fgylmim7YWloWtr38TBC0qGHbjiW4xxUxDleIrqmlNQTJIMjTTUt
         rvssK87Wjn816aP41rKTUflOMsB8tq2FFPoMB1UqQXtoH5H+h5mJZOjR+3RXLgxcQ7et
         qOqByXdEu2xHDMXjirbT/iQsi+1PH56Zb9gZ4fB8dKhdA4iRL2kOIQYRh6IusSLCEWu6
         B36I0dD4BZstrNAki5rPwsFSuzNZ5NKzjLQMXaN68mTeW/7On4C4zmkO9Eof/rI/baxO
         m1pw==
X-Forwarded-Encrypted: i=1; AJvYcCVTA8fnmwsaaYB/OUvClRcOKMAKeA5S9a5eZuPdpVyxNNMUSfIsG7N4bFbCRcdvcS9pyeX0hugDw6H+m/gi@vger.kernel.org, AJvYcCWTmPXAIrSyxv5YqVYfzIMjlli9v+ZmQ1OFoVzv6QwuYHsf8czIFS0pYa9wdmZZ0hH6LXHhefa5YX7C@vger.kernel.org, AJvYcCX9+ypvBmDF8LjeJLnmosuy9TrGBBgLkdby63cJz1+qi64AWd54E/h3mYXYIzhICWNlCzluE/+rGeua5aMhIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1C253No10k+z1u9pQXXAXi51Orjkj2Id2qX+wOeUErvBor5tt
	ebrz99KmWs30jW6bqkP/IwivtwXaaonJB+g8iQNKFdH0IDvar/EjhOziJfBN64qEfGr0xl4uos7
	26vXBNtIibf80++CUmGCyxVxgzug=
X-Gm-Gg: ASbGncsIAsucizVvXCPMN4AEI0jDGFTY+YdBCWUWu5DMqyx+Uoxc0+GhndFvmRPYDnX
	q3MduQsffCgR4thrHk/PNHBidJ/T5fkbsWYTeAFA=
X-Google-Smtp-Source: AGHT+IFT6tcQ2xd+4dRmJsUBrmSuf1Ghzyk3sYjHwklOohAY0o0pMcGfRE9iW/LtcmCJKQJEv7ffZASJhVP3YB8vNq0=
X-Received: by 2002:a05:6870:8dce:b0:29e:2801:43e6 with SMTP id
 586e51a60fabf-2a7fb168b5amr5015220fac.23.1734860475322; Sun, 22 Dec 2024
 01:41:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
 <tma7q7lfskdr7myfoeene7o27g7nhc5ca66kpmnqvgksv5oxqv@ziefqqp5khic>
 <57515c0f-caa0-4651-96cf-dde75a13937f@kernel.org> <CAO_MupJNuK2UyXEPdr-xufWotbP-EmHyUk81YiTwaQR=WccSEA@mail.gmail.com>
In-Reply-To: <CAO_MupJNuK2UyXEPdr-xufWotbP-EmHyUk81YiTwaQR=WccSEA@mail.gmail.com>
From: Maya Matuszczyk <maccraft123mc@gmail.com>
Date: Sun, 22 Dec 2024 10:40:39 +0100
Message-ID: <CAO_MupJDPTDtwY+XsQZ_v=T6FNqdMuyxoQmDFrh2Liqajn24Rw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: platform: Add bindings for Qcom's EC
 on IT8987
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

niedz., 22 gru 2024 o 08:55 Maya Matuszczyk <maccraft123mc@gmail.com>
napisa=C5=82(a):
>
> niedz., 22 gru 2024 o 07:40 Krzysztof Kozlowski <krzk@kernel.org> napisa=
=C5=82(a):
> >
> > On 22/12/2024 07:33, Krzysztof Kozlowski wrote:
> > >> +properties:
> > >> +  compatible:
> > >> +    oneOf:
> > >> +      - const: qcom,x1e-it8987-ec
> > >
> > > That's not a SoC, so I don't understand:
> > > 1. referring to the SoC,
> > > 2. Having this alone and as fallback.
> > >
> > > It does not look like you tested the bindings, at least after quick
> > > look. Please run 'make dt_binding_check' (see
> > > Documentation/devicetree/bindings/writing-schema.rst for instructions=
).
> > > Maybe you need to update your dtschema and yamllint. Don't rely on
> > > distro packages for dtschema and be sure you are using the latest
> > > released dtschema.
> >
> > BTW, for sure Qualcomm did not develop/create it8987, so it cannot be
> > used here. Come with specific compatible for this given, one product:
> > embedded controller on one Lenovo laptop and use it also as filename.
>
> Under these assumptions:
>
> - Qualcomm developed the firmware running on the IT8987 in most x1e machi=
nes
> - IT8987 is also used in other machines with a non-compatible firmware
> - The driver name should reflect the assumptions
>
> I think the name qcom,x1e-it8987-ec is not the worst name for it, as
> "ite,it8987-ec" would imply compatibility with other devices running
> non-compatible firmware,
> and names specifying only the device wouldn't reflect the "firmware is
> based on what qcom did and it's driven the same way" part
>
> Which other names do you think would fit this better?

In case it wasn't clear:
This was a genuine question - I have no idea how to name this driver
and this was the best I could come up with

>
> >
> > Best regards,
> > Krzysztof

