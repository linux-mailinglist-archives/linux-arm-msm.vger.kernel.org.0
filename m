Return-Path: <linux-arm-msm+bounces-1526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A56647F497C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 15:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34FA6B20D4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 14:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39893AC27;
	Wed, 22 Nov 2023 14:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMWFROHs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5681CAB3;
	Wed, 22 Nov 2023 14:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284D4C433CB;
	Wed, 22 Nov 2023 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700664961;
	bh=KtNL8iqiwxX+GpchCheqctmEAkNmwKSHMEBfjYdIYfA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jMWFROHsemWBLYudu+R0KFIYjkxN+OYS38HYbkxT6hliS5CGuPtvyqBwurcxMxfnQ
	 /iN3YL36okDmIdjncXf6CWKc4rf8O5RV02aYb9qWyDrKmqvqm/vNIu3HkhuWeT/byG
	 gMFBvzQQ6JD+1VBQrIuZOTTBeZZ/pdLn6QIYXb/xDRVedL3Nk2GeL9oQ/FJUpiPx4c
	 NTAbUbdzD3N8IaaRzLSzjZMsx/fmb+z9cl6/NGCBsjj2C+2oWU0F1q6PRSkc4Xgm+C
	 RTVI4Py6HBGOEj3GlcUX2Dd9p6BnVMRypZVEJ82an8lWtodpAFFeQ5Pw7rxk9TlwFk
	 WARyK/6iZiACw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-507b9408c61so9468334e87.0;
        Wed, 22 Nov 2023 06:56:01 -0800 (PST)
X-Gm-Message-State: AOJu0YyH9B40FgS5+H85uU+KG97DNj5AQ4NMED8XMuC7K5ru7Qd8p8fk
	LsJnqj+IX9KEe009PR5BVaC/0vVxxwBstP0neg==
X-Google-Smtp-Source: AGHT+IEDtzsjOwck99QtWT4cq2cTvv6FyJkSzHZICZds9G5M/6EfSs1GNZZ86r1YlxgmzIe8zoQcthvqAgxSHpLL35E=
X-Received: by 2002:ac2:5e8d:0:b0:500:b63f:4db3 with SMTP id
 b13-20020ac25e8d000000b00500b63f4db3mr1826037lfq.35.1700664959349; Wed, 22
 Nov 2023 06:55:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <6b288a2e-d147-4bd3-b1d4-daf56295d939@gmail.com> <01f9ce3b-e6e5-4b05-bf7f-0b3a5f74910a@linaro.org>
In-Reply-To: <01f9ce3b-e6e5-4b05-bf7f-0b3a5f74910a@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 22 Nov 2023 07:55:46 -0700
X-Gmail-Original-Message-ID: <CAL_JsqL_caP2Adh5ntrHb24sXOY9x=TxvCSnnSCq--rm3B0FoA@mail.gmail.com>
Message-ID: <CAL_JsqL_caP2Adh5ntrHb24sXOY9x=TxvCSnnSCq--rm3B0FoA@mail.gmail.com>
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
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

On Wed, Nov 22, 2023 at 1:05=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/11/2023 14:50, Rafa=C5=82 Mi=C5=82ecki wrote:
> >> +Order of Nodes
> >> +--------------
> >> +
> >> +1. Nodes within any bus, thus using unit addresses for children, shal=
l be
> >> +   ordered incrementally by unit address.
> >> +   Alternatively for some sub-architectures, nodes of the same type c=
an be
> >> +   grouped together (e.g. all I2C controllers one after another even =
if this
> >> +   breaks unit address ordering).
> >> +
> >> +2. Nodes without unit addresses should be ordered alpha-numerically b=
y the node
> >> +   name.  For a few types of nodes, they can be ordered by the main p=
roperty
> >> +   (e.g. pin configuration states ordered by value of "pins" property=
).
> >> +
> >> +3. When extending nodes in the board DTS via &label, the entries shou=
ld be
> >> +   ordered alpha-numerically.
> >
> > Just an idea. Would that make (more) sense to make &label-like entries
> > match order of nodes in included .dts(i)?
> >
> > Adventages:
> > 1. We keep unit address incremental order that is unlikely to change
> >
> > Disadventages:
> > 1. More difficult to verify
>
> Rob also proposed this and I believe above disadvantage here is crucial.
> If you add new SoC with board DTS you are fine. But if you add only new
> board, the order of entries look random in the diff hunk. Reviewer must
> open SoC DTSI to be able to review the patch with board DTS.
>
> If review is tricky and we do not have tool to perform it automatically,
> I am sure submissions will have disordered board DTS.

I'm certainly in favor of only (or mostly?) specifying things we can
check with tools. I don't need more to check manually...

It wouldn't be too hard to get path from labels. dtc generates that
with -@ already. So I don't buy "we don't have a tool" if a tool to
check seems feasible.

Rob

