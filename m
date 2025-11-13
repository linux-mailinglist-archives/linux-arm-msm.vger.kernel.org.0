Return-Path: <linux-arm-msm+bounces-81526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BB450C55E8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 07:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BBB614E4253
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 06:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8910F3203AF;
	Thu, 13 Nov 2025 06:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJlZziOi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFA028852B
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 06:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763014596; cv=none; b=h6oK+Pg53J3ZNxHOgvxylFe9POri5rQY77jw1IjMw8SleoRtosXZgqCdeKjJclvoK0b4H70YTXkx7D2L4i69KONfH9Uf5ROOMmQ4e1fbowDfTgpVxAfK9ZKM7+9vQKXrHKjEP4M3rBRmefObHBp/F+NHdVliSN2/0hh7n6a9mXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763014596; c=relaxed/simple;
	bh=vXr4z/5AmuKDK9MkRAtVv/b3MT7Gq4lxxIUxD2UqhlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c/xzWuRdlo4IRKVwENlAu7CUhGHet6n1y1s1pieJQCZljMcQ+2r/HpzET8G1cU+CdFnFeutki445kzemeAxZTITxhysqVKqIW+W4G5+guCTWd85LvYoiBrbng81/IEmOYGNSWYc14CYfELiAccB87gV3vO8g1XFiqSJs9aitq18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJlZziOi; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-63c489f1e6cso765606a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 22:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014593; x=1763619393; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXr4z/5AmuKDK9MkRAtVv/b3MT7Gq4lxxIUxD2UqhlA=;
        b=MJlZziOiocbfn5p0sDIcqn8JGRhvZP3lJsp1vTWYcMKjSxcjSIQFJ5rG2R6P8cyDpk
         ABlOisRQrYZswEP9oBzX2mx4xZxHeggANTywM1wg0x+etQHxV5o/QVhNTF/0O2priB/5
         OyXdu3dSPuMwDbvZE2lnjLxC0sqv4lv2zgt5j2X43/IAr4nEGeYPV9fFQc8C1CJF/P6D
         nZ3XrjxaeFm2xmM/7njUxNZXknWIaRHShi6SlXO/bgpk0V6QaCynkfN9LZurFOF7YSu0
         u9W5vJ90WWUz4/i1XUvp2gkrjTXzRj+OX47zRl3lnvSq6oF8zNbZ94XYfxzjkJSadRf+
         hrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014593; x=1763619393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vXr4z/5AmuKDK9MkRAtVv/b3MT7Gq4lxxIUxD2UqhlA=;
        b=k64JYPJwAcRCkwsUKjlpeBQa0QUktPyaQePzI3fu5bl2qYBa1JSLYsC8yFotopjRdG
         ci28L4zZzV6MPG1PTLyWp/wHHHCy2fa3XDSGWFNdq/5WUO4AuEHqspbizIAE4JGNvco3
         DZDacnNvLDKzFoDM37m1VTkP59Yye7Ik5CFitC7H1+i1bao78aPRh6AfsKTi2HASb6aO
         PaFpKROrz6hAXOGOpdvaWRj/OZ1Nn71E9XyDtVc6yVLG6b4vZM3PEQMia09gqZtOSDmg
         Y394zW/TYes7GLhGx29pIukkCULhK0fuU5uaPLMCuD8JMcu1W+m3pSxLyRqiBzVGri/Y
         CTEA==
X-Forwarded-Encrypted: i=1; AJvYcCUck6AsRgvFCsapofsucQ9v4cSUagE8FiZNF0KIie30uxhEieGl70kBhthJouLiHosmZGeDFa0Dm9hkkypv@vger.kernel.org
X-Gm-Message-State: AOJu0YyYoG3SB7xXFe1al9DVbKnhgUyQbMWdiXJAl1Jvi9tqlF4zs12A
	tUVuUisTEdS2zNXeGSz1R7Tduf+qOwNaYYUkTw5bjO+mVsIkJ2CuxGNzd9TpPb90H7uBno42zir
	+NrZNS5SJcFU6maldpU7BFntMvkFlYjo=
X-Gm-Gg: ASbGncu8PmNj8P4i/9+IgTqGXTene3+lWVa0cGEsF9jWVy4dar8xs0oPaw6ukXRLtTh
	HOu/NIahaCaMnSQEtGLjo+7/OtxTpI68MH9SPltk1cpZTqtlM7PW24S16XgY/7SvovmuFiexEgM
	gCFzhw8eAgWcI3BRV+nEOiuUwmZrvq2nGmEXpeGG5Mke4BDdWf/E8Zkd2QaP6ELgPWZ1gN/fqkR
	S+Nu/y294v6HsT5aEs8MRAZsAdwltZ4jw+mJLwrTp7Vkxf1u7ZVQgrX588=
X-Google-Smtp-Source: AGHT+IF0lUMHUkosIjNcmT2zVA/YLbM9CDi0kMvQoY+mWAyW3yJ8I1hbIvOE8r577BhAUOnw4TrJG1tWSe9ZriSdU30=
X-Received: by 2002:aa7:db42:0:b0:643:eae:b1b6 with SMTP id
 4fb4d7f45d1cf-64334cf0ec9mr1146356a12.12.1763014593016; Wed, 12 Nov 2025
 22:16:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110112947.2071036-1-krishna.chundru@oss.qualcomm.com>
 <aRHdiYYcn2uZkLor@wunner.de> <enri4affdgq4q5mibnmhldhqqoybqbdcswohoj5mst2i77ckmu@dwlaqfxyjy3w>
 <CANAwSgQcMDXitA2RLbFsD_v2KoOQMcHywxcxNs-ab-O2JddAuQ@mail.gmail.com> <vnfjiakbgw3s7dxqh3zriifxjoqcjhshat3hrnikebpa57yh3k@erc4nb5enqes>
In-Reply-To: <vnfjiakbgw3s7dxqh3zriifxjoqcjhshat3hrnikebpa57yh3k@erc4nb5enqes>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 13 Nov 2025 11:46:16 +0530
X-Gm-Features: AWmQ_blPalLirVu2H6vvDa6N8fgBoN3hOKiij4FJp2bVsL0Z_mFude8G2oo5hRc
Message-ID: <CANAwSgR+aaAreZABqXO+0tDW67LnWZzLoU=tXwUi1eN7krceiw@mail.gmail.com>
Subject: Re: [PATCH v2] schemas: pci: Document PCIe T_POWER_ON
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, andersson@kernel.org, robh@kernel.org, 
	manivannan.sadhasivam@linaro.org, krzk@kernel.org, helgaas@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	lpieralisi@kernel.org, kw@linux.com, conor+dt@kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree-spec@vger.kernel.org, quic_vbadigan@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Manivannan

On Thu, 13 Nov 2025 at 11:21, Manivannan Sadhasivam <mani@kernel.org> wrote=
:
>
> On Thu, Nov 13, 2025 at 10:46:59AM +0530, Anand Moon wrote:
> > Hi Manivannan
> >
> > On Thu, 13 Nov 2025 at 10:01, Manivannan Sadhasivam <mani@kernel.org> w=
rote:
> > >
> > > On Mon, Nov 10, 2025 at 01:41:45PM +0100, Lukas Wunner wrote:
> > > > On Mon, Nov 10, 2025 at 04:59:47PM +0530, Krishna Chaitanya Chundru=
 wrote:
> > > > > From PCIe r6, sec 5.5.4 & Table 5-11 in sec 5.5.5 T_POWER_ON is t=
he
> > > >
> > > > Please use the latest spec version as reference, i.e. PCIe r7.0.
> > > >
> > > > > minimum amount of time(in us) that each component must wait in L1=
.2.Exit
> > > > > after sampling CLKREQ# asserted before actively driving the inter=
face to
> > > > > ensure no device is ever actively driving into an unpowered compo=
nent and
> > > > > these values are based on the components and AC coupling capacito=
rs used
> > > > > in the connection linking the two components.
> > > > >
> > > > > This property should be used to indicate the T_POWER_ON for each =
Root Port.
> > > >
> > > > What's the difference between this property and the Port T_POWER_ON=
_Scale
> > > > and T_POWER_ON_Value in the L1 PM Substates Capabilities Register?
> > > >
> > > > Why do you need this in the device tree even though it's available
> > > > in the register?
> > > >
> > >
> > > Someone needs to program these registers. In the x86 world, BIOS will=
 do it
> > > happily, but in devicetree world, OS has to do it. And since this is =
a platform
> > > specific value, this is getting passed from devicetree.
> > >
> > According to the RK3588 TRM Part 2, the DSP_PCIE_L1SUB_CAPABILITY_REG (=
0x4)
> > It is a commonly configurable parameter, It can be tuned on for the
> > Rockchip platform.
>
> T_POWER_ON is a generic value defined in the spec. All compatible platfor=
ms
> should support setting this value through 'L1 PM Substates Capabilities'
> register or by platform specific register.
>
Ok, Thanks.
> > > - Mani
> > >
> > > --
> > > =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=
=A9=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=
=AE=E0=AF=8D
> > >
> > Thanks
> > -Anand
> >
> > I could not apply this patch
> >
> > $ git am ./v2_20251110_krishna_chundru_schemas_pci_document_pcie_t_powe=
r_on.mbx
> > Applying: schemas: pci: Document PCIe T_POWER_ON
> > error: dtschema/schemas/pci/pci-bus-common.yaml: does not exist in inde=
x
> > Patch failed at 0001 schemas: pci: Document PCIe T_POWER_ON
> > hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
> > hint: When you have resolved this problem, run "git am --continue".
> > hint: If you prefer to skip this patch, run "git am --skip" instead.
> > hint: To restore the original branch and stop patching, run "git am --a=
bort".
> > hint: Disable this message with "git config set advice.mergeConflict fa=
lse"
>
> This is a dtschema patch, not Linux kernel.
>
Ok, got that.
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
Thanks
-Anand

