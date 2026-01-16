Return-Path: <linux-arm-msm+bounces-89455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 481D1D372B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 18:18:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 046B030223B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 17:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B645033CE82;
	Fri, 16 Jan 2026 17:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WE07dgYP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BF6328B5B
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 17:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768583602; cv=none; b=jTiLuPuc29p8CXRZv0+D/wZliOFK0iDdohK4rV0bdPfx6fiy4yCtqiv8pPGKQ4RxiEC4jTMgjMRVC8AVnj/eC060JBjy8SVEGDdyAM22uySikL61RffgdBh6sAAI/D7mGHCnwXBF6Ays9s/g7tkuEHuVZ6MfPggzBd5MGKJti/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768583602; c=relaxed/simple;
	bh=eRYqR0sCNl0Tu2qKem4b18hzc+OZmtQiAcQb2U4ROYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RXvZ/h4Xb9Tuf9vfP2WMsIcOrmTv4zpHlWjT6EYkW1IXiHK59fsbQtlYgnC2EsMcxf6YWR5Fum2aEpNt2C9Cu6Ji+Ia8WoMJRT65ZEPJLovtcUliFYXeq2Yk4NZpGm45ltOXdBRKCU4p0+D/1K3dhd8n38at2bYqO5k0uJuMveA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WE07dgYP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38EB2C19424
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 17:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768583602;
	bh=eRYqR0sCNl0Tu2qKem4b18hzc+OZmtQiAcQb2U4ROYY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WE07dgYPtMh+iEmPUqJIwpwlx16Y309VZaWMmXXZ6uz2AOQ6uSR8nzMYFdEO1SHze
	 FGONKkBnkcPKDwEPw6wJgFbVrN38Y4d6J/N0syN8YRegLZ4wH4KJqOyzSjTOymexst
	 95XKxOPhWxBScbeqeE8lSQCxGThlEb7EoUifQfTxxm18M8zTuZlMT6IFZ8goHQdZsa
	 0C3xH5jK4rNNwW196Bt32nhLO0D1InBTeouRPTg438lCJ/NMh7X7dlEUuqfZ9uZz6w
	 H+Sad/72XWg7S5Ihy1NISXfX1waRnX7HIlt1sIPg/wJ+7+uJ5wMgfc+34WgEIMj4o5
	 AxletjXRB0nNA==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8719aeebc8so427166166b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 09:13:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX2KRG4eegAn0kVCq/y8KhjaLhhEyFVlWrMjNDOtIc5FHkGHxzTob9UzCSyfm29x2sUPejGLVQBxmCQDJN+@vger.kernel.org
X-Gm-Message-State: AOJu0YyXjpOFqfMDio+Wv+DL8q7AsqeIkWjYEavg3y0mjqS0iHYn2Bs4
	MGTLFJVjQX80vWZzPv+JTZvLdi00J77w/nSvmpn3dItxajmyqQqCLegX0+/jYwCk8ofMVnBa9GZ
	DXAc9zj9DJm+idSD0KMMPIBUXiPOmQw==
X-Received: by 2002:a17:907:972a:b0:b87:51d6:22fd with SMTP id
 a640c23a62f3a-b8792d27530mr333887066b.4.1768583600748; Fri, 16 Jan 2026
 09:13:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com>
 <20251031-knp-ipcc-v3-1-62ffb4168dff@oss.qualcomm.com> <20260116162057.GA1681736-robh@kernel.org>
 <af235d3c-cbf0-4cb9-af3b-37c1600d421c@kernel.org>
In-Reply-To: <af235d3c-cbf0-4cb9-af3b-37c1600d421c@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 16 Jan 2026 11:13:09 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJyRa-U03XvPNchpoyYNmSJQacrYs30yd=a_s-6PnppSw@mail.gmail.com>
X-Gm-Features: AZwV_QhpPDY5TdWqp-uUJoWm9FnhebFCSWh0tBr4jy39I3ojMHC23o9gZuyCiC4
Message-ID: <CAL_JsqJyRa-U03XvPNchpoyYNmSJQacrYs30yd=a_s-6PnppSw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: qcom: Add IPCC support for
 Kaanapali and Glymur Platforms
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 10:25=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 16/01/2026 17:20, Rob Herring wrote:
> > On Fri, Oct 31, 2025 at 12:41:44AM -0700, Jingyi Wang wrote:
> >> Document the Inter-Processor Communication Controller on the Qualcomm
> >> Kaanapali and Glymur Platforms, which will be used to route interrupts
> >> across various subsystems found on the SoC.
> >>
> >> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >> ---
> >>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 2 ++
> >>  1 file changed, 2 insertions(+)
> >
> > I guess no one is going to apply this, so I did.
> >
> > If your patches don't get applied, please chase the maintainers (Jassi)
> > to apply them.
>
>
> This or it is an effect of known problem with mailbox and interconnect
> subsystems - maintainers never send notifications of applied patches
> (neither publicly nor privately like Greg does), so you will never know
> if anything gets applied.
>
> This as well could be in the next silently (wasn't in 15th Jan, though).

Further investigation finds Jassi did apply this and 3 other patches.
Stephen reported a conflict on 1/6 with another Qcom patch
(conflicting with Bjorn's tree). No reply to Stephen, but *all* the
mbox binding patches were dropped.

Here's what was dropped:

f8f632c18c32 dt-bindings: mbox: add pic64gx mailbox compatibility to
mpfs mailbox
945dc11a38a0 dt-bindings: mailbox: qcom: Add CPUCP mailbox controller
bindings for Kaanapali
66b6e5daa915 dt-bindings: mailbox: qcom: Add IPCC support for
Kaanapali and Glymur Platforms
9a92e22740e6 dt-bindings: mailbox: mediatek,mt8196-vcp-mbox: add mtk
vcp-mbox document

Rob

