Return-Path: <linux-arm-msm+bounces-1451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7127F409A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 09:53:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E00181C208CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 08:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E9B2D63D;
	Wed, 22 Nov 2023 08:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 006D4E7;
	Wed, 22 Nov 2023 00:53:34 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5cb8440a23cso17955347b3.3;
        Wed, 22 Nov 2023 00:53:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700643214; x=1701248014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKNq1+43WKmgnPE7SgZwNlFfmw6va9njWwTwjft8dSg=;
        b=QwE52vPyOiBctpydRMaJ/vB9fdJLfRYOc9yp3pNCrIyvN9Thsa/ext7I53lT4fEjpa
         w3XD/4EueWiEetn3oPwC4bId3dYfZR3UJPwUoeiT15jMd4fleG/N/zV/qDH/F9crUMY0
         0miNUf15GOW5T5Hfqm7dv0UxnskGGV+qAg1K6kppvkckB6Su7OxaWXDqKR4jFp1/SBAi
         AfCmg0JLIdMaFVvpRYogIFaE0E208SK7Mr91y0rNwutIkT5N8/Ktj0K3RbngviZPgqbM
         iEJKcU2ZF3DTXEoe8jkJpwin/8Rf/ZO60hSziuBi1ju1YjcDeynheaEPEE5+sklR0zJ3
         Zaug==
X-Gm-Message-State: AOJu0YzJtx2wrNgKnJghd0IS4cW62OrHbA0Nltgvf5l2VkfTYtO/fsND
	6m0lUF08BjYrcw6PgREp4NMCeEYw0/vB0Q==
X-Google-Smtp-Source: AGHT+IG58eMsiGJRba5wPiNE7gijHmwkDnv1K6+XrAaPEKYNek+gXYei9LsToLEt3dLyTOiUhEMSYg==
X-Received: by 2002:a81:9403:0:b0:58a:83cd:115d with SMTP id l3-20020a819403000000b0058a83cd115dmr1608205ywg.50.1700643213980;
        Wed, 22 Nov 2023 00:53:33 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id u74-20020a0deb4d000000b005c5b70aa8acsm3551669ywe.98.2023.11.22.00.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 00:53:32 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d9cbba16084so5975886276.1;
        Wed, 22 Nov 2023 00:53:32 -0800 (PST)
X-Received: by 2002:a25:218a:0:b0:da0:48df:cafa with SMTP id
 h132-20020a25218a000000b00da048dfcafamr1276867ybh.16.1700643211907; Wed, 22
 Nov 2023 00:53:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <6b288a2e-d147-4bd3-b1d4-daf56295d939@gmail.com> <01f9ce3b-e6e5-4b05-bf7f-0b3a5f74910a@linaro.org>
 <CAGb2v64Vf5dDwq=KTrxwc=+w+0KUD2KVPMjmHg68Y_yukES5dQ@mail.gmail.com>
 <7232a48b-b9ad-44b5-ae6a-d12dad70b3c4@linaro.org> <58a9caacc1226c7c3a2bdfe73ef1791f@manjaro.org>
 <cc4c789c-b595-41eb-b543-9e03549c6e61@amd.com>
In-Reply-To: <cc4c789c-b595-41eb-b543-9e03549c6e61@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Nov 2023 09:53:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWm-gRPHeHyuX3_eR+9chJEw3iiZwCNBnoiRPHzoMAs6w@mail.gmail.com>
Message-ID: <CAMuHMdWm-gRPHeHyuX3_eR+9chJEw3iiZwCNBnoiRPHzoMAs6w@mail.gmail.com>
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
To: Michal Simek <michal.simek@amd.com>
Cc: Dragan Simic <dsimic@manjaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, wens@kernel.org, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>, 
	Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Wed, Nov 22, 2023 at 9:50=E2=80=AFAM Michal Simek <michal.simek@amd.com>=
 wrote:
> On 11/22/23 09:29, Dragan Simic wrote:
> > On 2023-11-22 09:21, Krzysztof Kozlowski wrote:
> >> On 22/11/2023 09:09, Chen-Yu Tsai wrote:
> >>> On Wed, Nov 22, 2023 at 4:05=E2=80=AFPM Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> On 21/11/2023 14:50, Rafa=C5=82 Mi=C5=82ecki wrote:
> >>>>>> +Order of Properties in Device Node
> >>>>>> +----------------------------------
> >>>>>> +
> >>>>>> +Following order of properties in device nodes is preferred:
> >>>>>> +
> >>>>>> +1. compatible
> >>>>>> +2. reg
> >>>>>> +3. ranges
> >>>>>> +4. Standard/common properties (defined by common bindings, e.g. w=
ithout
> >>>>>> +   vendor-prefixes)
> >>>>>> +5. Vendor-specific properties
> >>>>>> +6. status (if applicable)
> >>>>>> +7. Child nodes, where each node is preceded with a blank line
> >>>>>> +
> >>>>>> +The "status" property is by default "okay", thus it can be omitte=
d.
> >>>>>
> >>>>> I think it would really help to include position of #address-cells =
and
> >>>>> #size-cells here. In some files I saw them above "compatible" that =
seems
> >>>>> unintuitive. Some prefer putting them at end which I think makes se=
nse
> >>>>> as they affect children nodes.
> >>>>>
> >>>>> Whatever you choose it'd be just nice to have things consistent.
> >>>>
> >>>> This is a standard/common property, thus it goes to (4) above.
> >>>
> >>> It's probably a mix, but AFAIK a lot of the device trees in tree have
> >>> #*-cells after "status". In some cases they are added in the board
> >>> .dts files, not the chip/module .dtsi files.
> >>
> >> Existing DTS is not a good example :)
> >>
> >>>
> >>> +1 that it makes sense at the end as they affect child nodes.
> >>
> >> I still insist that status must be the last, because:
> >> 1. Many SoC nodes have address/size cells but do not have any children
> >> (I2C, SPI), so we put useless information at the end.
> >> 2. Status should be the final information to say whether the node is
> >> ready or is not. I read the node, check properties and then look at th=
e end:
> >> a. Lack of status means it is ready.
> >> b. status=3Ddisabled means device still needs board resources/customiz=
ation
> >
> > I agree with the "status" belonging to the very end, because it's both =
logical
> > and much more readable.  Also, "status" is expected to be modified in t=
he
> > dependent DT files, which makes it kind of volatile and even more deser=
ving to
> > be placed last.
>
> I am just curious if having status property at the end won't affect
> execution/boot up time. Not sure how it is done in Linux but in U-Boot at=
 least
> (we want to have DTs in sync between Linux and U-Boot) of_find_property i=
s
> pretty much big loop over all properties. And status property defined at =
the end
> means going over all of them to find it out to if device is present.
> Not sure if Linux works in the same way but at least of_get_property is d=
one in
> the same way.

As the default is "okay", you have to loop over all properties anyway.

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

