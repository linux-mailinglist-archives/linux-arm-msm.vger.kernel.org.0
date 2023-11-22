Return-Path: <linux-arm-msm+bounces-1447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 778887F4014
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 09:28:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3312E281108
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 08:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688CD2D045;
	Wed, 22 Nov 2023 08:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA2B193;
	Wed, 22 Nov 2023 00:28:43 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5cb9407e697so15301867b3.3;
        Wed, 22 Nov 2023 00:28:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700641723; x=1701246523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gha+lhz98cqfqHPVBYNZIJYx9aE1nB2ARipNu2FhWYQ=;
        b=E4CX+G9g6PMBq61+FezDEPrbc3vEMCVfhrQTs9NqW3enepgaYnNsvjNWl91m/RaMll
         +zJqdWfnnTtRh8lI1nSjLcC7TmAGBmocoGlFGHAACas8nvTHcRKvlHj0ep75d1VT7HxZ
         m1yXtHOWxUkkq9qEK+jOGCSpv2+Cd9HEGAPHI93g+cv9UX0XHNVUGbjcQQ7o8O2vG/xm
         gF1hQLsOcMKDhIpkEQe8+8/tVmoXzMk7mY5A+f0UOPXMBtoblIRAytLx6DdAqTxVgjiS
         qQ1vtJhLuVXLXVq5BKsxjgYH4GAKeX150RjWHoeGsCbYvkkfhZQpiMbQ0hs063Y6cIVj
         G+CA==
X-Gm-Message-State: AOJu0Ywl5qIYuFLG8PMVq1y22KseVkIW2KYTy2PY01gBWVZGJOE2wp1A
	WYPAMxwSVxp5QpBqn3DDClOsA4OchKlEeQ==
X-Google-Smtp-Source: AGHT+IEDd6gxY4RmAFhZrkL023ZMiEGHsqttYS6oXMquTmdAHMJsY/sNAABm26MBC5bKMVihW7F9ow==
X-Received: by 2002:a0d:d547:0:b0:5b3:26e1:320c with SMTP id x68-20020a0dd547000000b005b326e1320cmr1478260ywd.40.1700641722909;
        Wed, 22 Nov 2023 00:28:42 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id a190-20020a0dd8c7000000b005a8d713a91esm3559623ywe.15.2023.11.22.00.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 00:28:41 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-da3b4b7c6bdso6358915276.2;
        Wed, 22 Nov 2023 00:28:41 -0800 (PST)
X-Received: by 2002:a25:cec5:0:b0:d9b:dae4:63fa with SMTP id
 x188-20020a25cec5000000b00d9bdae463famr1414014ybe.34.1700641720963; Wed, 22
 Nov 2023 00:28:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <6b288a2e-d147-4bd3-b1d4-daf56295d939@gmail.com> <01f9ce3b-e6e5-4b05-bf7f-0b3a5f74910a@linaro.org>
 <CAGb2v64Vf5dDwq=KTrxwc=+w+0KUD2KVPMjmHg68Y_yukES5dQ@mail.gmail.com> <7232a48b-b9ad-44b5-ae6a-d12dad70b3c4@linaro.org>
In-Reply-To: <7232a48b-b9ad-44b5-ae6a-d12dad70b3c4@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Nov 2023 09:28:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXDUF7i9GdXSyHbmUtwmCCXf-sXQDbrGAKTtQ9=TSNFjA@mail.gmail.com>
Message-ID: <CAMuHMdXDUF7i9GdXSyHbmUtwmCCXf-sXQDbrGAKTtQ9=TSNFjA@mail.gmail.com>
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: wens@kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>, 
	Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michal Simek <michal.simek@amd.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 9:21=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 22/11/2023 09:09, Chen-Yu Tsai wrote:
> > On Wed, Nov 22, 2023 at 4:05=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >> On 21/11/2023 14:50, Rafa=C5=82 Mi=C5=82ecki wrote:
> >>>> +Order of Nodes
> >>>> +--------------
> >>>> +
> >>>> +1. Nodes within any bus, thus using unit addresses for children, sh=
all be
> >>>> +   ordered incrementally by unit address.
> >>>> +   Alternatively for some sub-architectures, nodes of the same type=
 can be
> >>>> +   grouped together (e.g. all I2C controllers one after another eve=
n if this
> >>>> +   breaks unit address ordering).
> >>>> +
> >>>> +2. Nodes without unit addresses should be ordered alpha-numerically=
 by the node
> >>>> +   name.  For a few types of nodes, they can be ordered by the main=
 property
> >>>> +   (e.g. pin configuration states ordered by value of "pins" proper=
ty).
> >>>> +
> >>>> +3. When extending nodes in the board DTS via &label, the entries sh=
ould be
> >>>> +   ordered alpha-numerically.
> >>>
> >>> Just an idea. Would that make (more) sense to make &label-like entrie=
s
> >>> match order of nodes in included .dts(i)?
> >>>
> >>> Adventages:
> >>> 1. We keep unit address incremental order that is unlikely to change
> >>>
> >>> Disadventages:
> >>> 1. More difficult to verify
> >>
> >> Rob also proposed this and I believe above disadvantage here is crucia=
l.
> >> If you add new SoC with board DTS you are fine. But if you add only ne=
w
> >> board, the order of entries look random in the diff hunk. Reviewer mus=
t
> >> open SoC DTSI to be able to review the patch with board DTS.
> >>
> >> If review is tricky and we do not have tool to perform it automaticall=
y,
> >> I am sure submissions will have disordered board DTS.
> >>
> >>>
> >>>
> >>>> +Example::
> >>>> +
> >>>> +    // SoC DTSI
> >>>> +
> >>>> +    / {
> >>>> +            cpus {
> >>>> +                    // ...
> >>>> +            };
> >>>> +
> >>>> +            psci {
> >>>> +                    // ...
> >>>> +            };
> >>>> +
> >>>> +            soc@ {
> >>>> +                    dma: dma-controller@10000 {
> >>>> +                            // ...
> >>>> +                    };
> >>>> +
> >>>> +                    clk: clock-controller@80000 {
> >>>> +                            // ...
> >>>> +                    };
> >>>> +            };
> >>>> +    };
> >>>> +
> >>>> +    // Board DTS
> >>>> +
> >>>> +    &clk {
> >>>> +            // ...
> >>>> +    };
> >>>> +
> >>>> +    &dma {
> >>>> +            // ...
> >>>> +    };
> >>>> +
> >>>> +
> >>>> +Order of Properties in Device Node
> >>>> +----------------------------------
> >>>> +
> >>>> +Following order of properties in device nodes is preferred:
> >>>> +
> >>>> +1. compatible
> >>>> +2. reg
> >>>> +3. ranges
> >>>> +4. Standard/common properties (defined by common bindings, e.g. wit=
hout
> >>>> +   vendor-prefixes)
> >>>> +5. Vendor-specific properties
> >>>> +6. status (if applicable)
> >>>> +7. Child nodes, where each node is preceded with a blank line
> >>>> +
> >>>> +The "status" property is by default "okay", thus it can be omitted.
> >>>
> >>> I think it would really help to include position of #address-cells an=
d
> >>> #size-cells here. In some files I saw them above "compatible" that se=
ems
> >>> unintuitive. Some prefer putting them at end which I think makes sens=
e
> >>> as they affect children nodes.
> >>>
> >>> Whatever you choose it'd be just nice to have things consistent.
> >>
> >> This is a standard/common property, thus it goes to (4) above.
> >
> > It's probably a mix, but AFAIK a lot of the device trees in tree have
> > #*-cells after "status". In some cases they are added in the board
> > .dts files, not the chip/module .dtsi files.
>
> Existing DTS is not a good example :)
>
> >
> > +1 that it makes sense at the end as they affect child nodes.
>
> I still insist that status must be the last, because:
> 1. Many SoC nodes have address/size cells but do not have any children
> (I2C, SPI), so we put useless information at the end.
> 2. Status should be the final information to say whether the node is
> ready or is not. I read the node, check properties and then look at the e=
nd:
> a. Lack of status means it is ready.
> b. status=3Ddisabled means device still needs board resources/customizati=
on

+1 for status at the end (before children), so it's easy to find.
Also, reality can look like the example in the bindings, with an optional
status property appended.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

