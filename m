Return-Path: <linux-arm-msm+bounces-1389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CBB7F3319
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 17:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EB07B21F11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 16:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA3759167;
	Tue, 21 Nov 2023 16:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E1EBCB;
	Tue, 21 Nov 2023 08:04:32 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6cd0a8bc6dcso3542776a34.2;
        Tue, 21 Nov 2023 08:04:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582672; x=1701187472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHWSZ/KZJKkzc0j50L+hOmQiyYp8HOj7xmv0toivCHY=;
        b=w0GaKyvMI/GasUtE5vfprH4ymGanHeBlqwDCjJPHbehOo/AIcGgK2/BrbDnfpnP/U+
         TXE0Ve6HZXX2QocCN76RW3lK2kUXTNobWyWe8fm+CqAorTEz+H0H2dxG0DH+R+HO48yr
         Y9Bn7pXpzeoDvqkQBjEp2L4djk++o47iDLsGMmzoW1rdIrfCsJJpX8IasPHwYZPelKmM
         ixb6cQZGhQUlCPN1KZfosqLvxFNakOlqXGLAyLyjEYNC/XC0CQFzAF0aJiKhDhgMWZmj
         QW+1jWFeJehmB86p8HOjTr97dGGGPyJW2OiZ+LOf+WuSZfJJknyNSf/evYf92mgt9iEc
         hnog==
X-Gm-Message-State: AOJu0YwmULucvZ9mhizFrSpfABRmYUl4GWpvca9MpJzeaWqYuhO+D7u+
	h+DesSFBYxt/QB5LuXQqpGt7Y3bOhm04bAx4
X-Google-Smtp-Source: AGHT+IEN1y9206WjviocR5GpChO7c4vNkBXQSv8mkPUBcR/v78OVG8iqpf4IOvPvw/oHqV7GHhOGoQ==
X-Received: by 2002:a05:6830:188:b0:6ba:865b:ca72 with SMTP id q8-20020a056830018800b006ba865bca72mr10945857ota.31.1700582671838;
        Tue, 21 Nov 2023 08:04:31 -0800 (PST)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com. [209.85.167.169])
        by smtp.gmail.com with ESMTPSA id g6-20020a4a5b06000000b0058a12a87a57sm1891449oob.17.2023.11.21.08.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 08:04:27 -0800 (PST)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3b83398d4a7so519018b6e.1;
        Tue, 21 Nov 2023 08:04:26 -0800 (PST)
X-Received: by 2002:a05:6808:1201:b0:3b2:ee79:c0fd with SMTP id
 a1-20020a056808120100b003b2ee79c0fdmr14276293oil.1.1700582665655; Tue, 21 Nov
 2023 08:04:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <19358871-009d-4498-9c13-90d5338b1e9f@amd.com> <76fa8f61-fe31-4040-a38d-cc05be3f4f17@linaro.org>
 <6c80a285-27fc-4d61-9eef-af4744a9decc@amd.com> <cc57dcf1-3c32-426e-920c-6f0741027797@linaro.org>
In-Reply-To: <cc57dcf1-3c32-426e-920c-6f0741027797@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Nov 2023 17:04:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVGyXizPw9Rggj8fQeNdbx3udRcsHFhz_sqYZzjN1CnZQ@mail.gmail.com>
Message-ID: <CAMuHMdVGyXizPw9Rggj8fQeNdbx3udRcsHFhz_sqYZzjN1CnZQ@mail.gmail.com>
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michal Simek <michal.simek@amd.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>, 
	Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Tue, Nov 21, 2023 at 1:36=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 21/11/2023 12:55, Michal Simek wrote:
> >>> device-tree specification v0.4. Chapter 2.2.1/Table 2.1 is describing=
 much more
> >>> valid characters for node names.
> >>> It means above description is not accurate or DT spec should be updat=
ed.
> >>
> >> Spec allows way to much. dtc doesn't.
> >> One thing is the spec, second
> >> thing is coding style.
> >
> >  From my point of view spec is primary source of truth. If spec is sayi=
ng name
> > can use upper case then I can use it. If upper case is not
> > recommended/deprecated because of whatever reason spec should be update=
d to
> > reflect it.
> > I know that DTC is reporting other issues but isn't it the right way to=
 reflect
> > it back to the spec?
>
> Then why aren't you putting Linux Coding Style into C spec? I do not see
> any relation between specification of the language and the coding style
> chosen for given project.
>
> Zephyr can go with upper-case. Why it should be disallowed by the spec?

I thought there was only One DT to bind them all?
IMHO it would be better to align DT usage of Zephyr and Linux (and
anything else).


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

