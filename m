Return-Path: <linux-arm-msm+bounces-111190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fGbrAEFsIWrkGAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:14:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 650F963FC54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:14:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SS+26SIH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111190-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111190-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDE06300FB56
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 12:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0813442E00A;
	Thu,  4 Jun 2026 12:09:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869BA41B343
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 12:09:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780574959; cv=pass; b=g+qSuXerMTGUKdwgXReBUCLsJhcKurjbPiGQM+lJ3DfViAmYgm+tFkST5UEXfj1y0JKlKMVESyouvbl8nwn7Q+RRoUGWHqu++3V83dmJ1rVR7WIFQqNe/nKh2KCmiIV4eXnmkrIcTMH+JEh+ogjp92drC6M8KfV53KqLwSoh95Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780574959; c=relaxed/simple;
	bh=uj4K88qc6lPcbN3Yc1wC9i/Igrgsbe/5UqnLXF7tFxw=;
	h=In-Reply-To:MIME-Version:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ssNlW/PsWYVItk78L/nYWakr/HHm8og3vvS2RTydKkMBpNMtc2eZ2ivRCKDoPLe3+kh9E1lpjy8zmLL92PLoiErsaUap4v/Jt2vp92S5NRXDFSdE6DYPJMG8HNfxqIGRZEnYOHC7KLV2FDJVAyUdtgCusOTQOdhI5F94IofpcpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SS+26SIH; arc=pass smtp.client-ip=74.125.224.54
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-65eb226b1ceso675921d50.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:09:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780574957; cv=none;
        d=google.com; s=arc-20240605;
        b=OUYxHUp1dkJYpREZmhC+806fmRHS8xIFDXeuQsWxmIweS4ujNt1XyFb6OuBQodXCfz
         0oV2/KCkfUyCmcZedt/QF2ocPGJ2ItMeZnuSMUGMAlDZsS4U4Chd4K+Z5wXuyfcBtRiW
         NKAlbDYkD3S6nuYT15E+QGRcIdIQ4C314xl7fUlNnrkrS3iokvzsWfBlZIlcb6Vtmrkp
         TT6Vy2EWgeJiErnLGcdY3kvdDVeSGvCXYF/myNEm3zs2wcO/ILp5u+hb84cqCjVpX9TN
         S26YThtPgULc2k6/maun8etPEnFFiPlyfV/cA8ZZyEltjAs0OaWsOsFRjjvDjPDqNCjQ
         y4lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:references:mime-version
         :in-reply-to:dkim-signature;
        bh=6ifSH017/6XeBpJ1mk56x+Yz6Ui1nA/vUxvuucn89y4=;
        fh=GXsznixhWUMwplZc6sthYpgX9PI23K3F3Re3cpn/hJo=;
        b=FGFeg4Xq3zv0nqIN5WuR9eQ363jj7SS/BvWy8nvGjtDIAbSnBIGE9Wi/m98E9uKIh5
         J5jsYWjEJzTqoDH2FTx28nXXts0G0RUEEejjgN3I9WvryLIZ4Ih7VCogD3On9KRFTklQ
         JdVL/2gEvGj9THbs4Y+Q8Pb5gxEC8lA/SnTR5Pa7/ZV/41Z/x8sZNCEfPCuAPe40E9YJ
         pc+qPvkAUFraIx30CQ8DxL6uX71nj6gTxQ4bODO6i2cX0nvxntWP6NSSadxISiLrmPmd
         SQ0HwYvlusFiBLoPyrgN9sxgnzP0r3gg+YfU4zSrgUH8gqPxglcl5j8WI490s2JlZfAz
         DeeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780574957; x=1781179757; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:references:mime-version
         :in-reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=6ifSH017/6XeBpJ1mk56x+Yz6Ui1nA/vUxvuucn89y4=;
        b=SS+26SIHrEnTCl1BZkXHSOrEkPe4W0Ol5RQudc9dU/rC3sx+nLUfIQyocnJxTVlYf+
         sqkts8xWA4OUjbDG5cQkV91E5D+LR1LiWPKRPpxmcIh0+JWbfc75VKTSx8vKmBXl5tcm
         CfmGDjn7QCVz+dY5GdeTuqG19N2PUICfF7eygp4iKviHEsVoqqQH5ktTjuHBhKv6LWZF
         HxhgTUajRR0IK4r26UZC2qvgw4SUHpEgWQfBgNpE5z3+WbZ0ongby2Ye2XEX39DeFepF
         PVdbNGZaAW4Cd1tQ+2SeHWgK/OToxe+7uW2XfYKLITM7D7xF2S4VulEbta/hFY9hWkXN
         75ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780574957; x=1781179757;
        h=cc:to:subject:message-id:date:from:references:mime-version
         :in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ifSH017/6XeBpJ1mk56x+Yz6Ui1nA/vUxvuucn89y4=;
        b=sjW20vbQtQIkUAd1SSDuzVYArpDqO5QeO2747jyc8XNnZMWVPI9jhOjLvrlwVwBeGl
         ax8J5uZfoc6/a7EZVDmGBLZ83R2zEIV5/atmwKd7Z+LlTc3o8bm5Aqmk0yaW/DWhaihC
         rLUOcvz4Ot1ME5TAjX87LfoQq6IYx44i3ubi7bFSr2XL2yQq1rrP8Et3nf48P2GXda9z
         3A1OHMoh/W3UuRJ/4P4wuLqBEojaGnhlnoIdMPIyx6iOZasNxfViTRdf1fDYCxZv978i
         BJka5g362y/p81tplFXA3WFJTyxUcgOlaNy4LTn0ZTJbkGVPiSsXl5BLEiN0+RgJgjwU
         /LbA==
X-Forwarded-Encrypted: i=1; AFNElJ9DkaCHm4WVKprWGZd1bkK5WiT2qccJLwZ5i9EZNfJBX8sPdJcAoH/igV5axkJ4qARhbpSafT/IoAFq9s4I@vger.kernel.org
X-Gm-Message-State: AOJu0YyfJzSZm4udgGO602hd/gAyPlqACc2wQCpSOmcnap7epQE4IVFR
	u8MgXIcRyrYs1mDFn3rmhv2C3ZKaA2sXC6ZWKoOpAuGBH8JRQqBQ2OVkGxRtC0LZLvNtb9N908n
	gy9y9QOExn0Vy5spOe0S4XYV74Fq0qvI=
X-Gm-Gg: Acq92OGgfTBSU0639RtMb/SWkkJvvAK1BhNKg9Arv/ARajljIFxeJPqiS3M7tgWJfLV
	u5TJ+/5mFNrhymlDhN4P39GtZzzv+emKfy0SeUx+17Od8U8MEkCtac6baPTNngXsHMxJ8N03mdL
	HWqFVaumMntrdmBzzGt4xiqLwQZWNJiBt329f5OUdDTafqPl7S9LmDMzowGRxefWJyjIYE9Qrs5
	tdxkNt1kMCVwAk/giHsAjzHGdjKrveK/Sd5Zl3ObCisR1D3IGd42pKu+GjY9eoI2Q0BOIlyfKge
	X15Tz5s2qD/69HwNNk8=
X-Received: by 2002:a53:edc1:0:b0:65e:b223:c15 with SMTP id
 956f58d0204a3-660dc561bf3mr5574275d50.49.1780574957417; Thu, 04 Jun 2026
 05:09:17 -0700 (PDT)
Received: from 922524751902 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Jun 2026 08:09:16 -0400
Received: from 922524751902 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Jun 2026 08:09:16 -0400
In-Reply-To: <76bb3e5b-e4fa-400c-b7fb-98f95c7a068a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
 <20260530-mutant-gecko-of-anger-ce8803@quoll> <76bb3e5b-e4fa-400c-b7fb-98f95c7a068a@oss.qualcomm.com>
From: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>
Date: Thu, 4 Jun 2026 08:09:16 -0400
X-Gm-Features: AVHnY4IchoeFwiwuUzc7MAm7ADNP4K3glOC3B0Du3JAMkFblKsf5YvA0cBqg6dg
Message-ID: <CAGyK6coCyziKzffGmj+fGs4U+mXEeYJ0Q2+z6xHCA+i=gop2oA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] PCI: qcom: Add PCIe support for upcoming Hawi SoC
To: Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-111190-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[manisadhasivamlinux@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:matthew.leung@oss.qualcomm.com,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manisadhasivamlinux@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 650F963FC54

On Wed, 3 Jun 2026 01:26:53 +0200, Matthew Leung
<matthew.leung@oss.qualcomm.com> said:
>
>
> On 5/30/2026 3:06 AM, Krzysztof Kozlowski wrote:
>> On Fri, May 29, 2026 at 01:10:07AM +0000, Matthew Leung wrote:
>>> This series adds PCIe support for the Qualcomm Hawi SoC. The Hawi
>>> platform features two PCIe controllers: one capable of Gen3 x2 operation
>>> and one capable of Gen4 x1 operation. The first patch adds the device
>>> tree bindings documentation for the Hawi PCIe controller, and the second
>>> patch adds driver support by enabling the Hawi compatible string in the
>>> existing qcom PCIe driver.
>>>
>>> This series depends on the following series queued on linux-next:
>>> - [PATCH v3 0/7] clk: qcom: Add initial clock controllers for the
>>>   upcoming Hawi SoC (Change-ID: 20260316-clk-hawi-1ad4cad36d6a:v3)
>>> - [PATCH v4 0/2] interconnect: qcom: Add support for upcoming Hawi SoC
>>>   (Change-ID: 20260311-icc-hawi-d6dc165f8935:v4)
>>
>> It cannot depend there it makes it unmergeable and untestable. I skip
>> review in such case, please follow standard documented practices about
>> decoupling independent works.
>
> Thanks for the feedback. On checking the dependencies, the changes are
> applied in their respective maintainer trees:
> - clk: applied to qcom/linux.git for-next, commit d6cd9d5692ba
> - icc: applied to djakov/icc.git icc-next, commit 07548b04dc36
>
> Both commits are present in my linux-next base-commit and have checked
> dt_binding_check passes cleanly.
>
> I can resend with the dependency references updated accordingly.
>

No. It will still break the pci tree when this series gets merged. Please
resubmit after v7.2-rc1.

- Mani

