Return-Path: <linux-arm-msm+bounces-108432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM54BLkvDGo4ZAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:39:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 591E757B6E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EB963050468
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F653EFFB6;
	Tue, 19 May 2026 09:32:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6DB409DE0
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 09:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183120; cv=none; b=rAUKGE+kunOoqU18vXPzWFYj/wfIOYJWy3U3a1GlJtJKbRBf+EJpwdChMA4r+ChC/4k2dZZ5fFkbkASVqw76cTFTY1FrA/YzSUBLtuCzx0DpvoXFGkgP/huyOy0QoNsBC8/wqffnlPtxmaN+ekkY1IjL4Hx0fF4CW69I/itYaTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183120; c=relaxed/simple;
	bh=Mf2XoqrYRO333qV0Pq7IeJWLfaeqZ4CVJGnnWh+JqPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a1up0m8kx8cs3v/jo5N3CM0gy6YtDJZNKdGWpiyOnjgwZUHn7gJ7kQzDgOFI6S6cgYTbEH2LXrUWDWbeszUNsHbEy91CgYXpIoS0yiqkTCImj2P1reOnW89DC+K3WHS4u5nNSpmIIuh8BX0VHU//DXTmi75zGIJJ04ncykWUKuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-57524e52a3dso2858645e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 02:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779183118; x=1779787918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7mLu0pQK6X8KnQDNiHLkRRuhxqkx65FdTGE5tLTcw8=;
        b=Np1PH0yQkb0h8YVujUEt4ap69zCPEBez1Wd1AtwkxKISeuRFazoGBCnrdLnoSmbe+P
         /l25exZ1of7OkLQaJ0Qw3SSrPqFl5KMoccSkqduIFTzyMwaUxkwRNHrZnXTBBg9tYjnt
         nG5GA6nIWJCf39/asH7ujM38rmNVlkDNQWsDBMvwwnccCC8aDn6yExWDF/9guOm8jKX1
         /XLVeucnbo1hG1aodd4vqrtIJVv7C3FFmYC7/HFesHYt2nsV4IpN54V0o96s65r02VZ8
         XIiFyUFB9z5dEtghEkTrGP77dIDqW1sPuD0V5pSMypCCW+4u8GDw9ZG1qBrsO2muLuDb
         9vSA==
X-Forwarded-Encrypted: i=1; AFNElJ9qw/3dxdxkLdQwpGSqK0nWCrimTC1OM7SgHIyWlin1mpDEDKrBqPdUVQJ97fXyNVXgLqaDzTOvffRxlEnD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5mvheK/VTJAcE9P/ESRmLG8nyKZulhhxkz7Cku94srEb4trF7
	PEnJ5NN2nN4pRv+Wm/xv9hcizmSTH74h/kYSe6DxEgQBl86+nQ4QXvrslxS8Y8Zj
X-Gm-Gg: Acq92OErl40iTTbqLNsSAmo5YAkabr6mprTDy/+bqtTInnrYOWdmby8vIjyhyR6eHyz
	QDsbCZqIRfas9nW9f3iPnYHwcAVmOWB4H1/v9lx9ZktNZ+HtYx/vsSDG3BQHP25hptdkR64ECmu
	TWD5ibS2xbya1YpWo28HytOELSV/CAeUWNX7IppLHeBvCbipiG5pBlcAZsZ5WnHch1w3ZXIO3Kl
	pV3WIox1GX8KmFuVyUMTkCwV78xdjo1Yk96H8kW1gS4Y4R5cNE0vUW+bvGD+/vt5GoqNAAuaURW
	a+zEeh0wqkxm6fmiEecwU3SORJL4MChOy5g3bmScENGM71xzCQFObS70os1urApYGsU+xxKR6Qp
	SYjlfYPo2A/gTpW1M+Ek2Yj1udsIqTS1e/So2CjcSTecUtdc+fMynEordcD6dIqr9NdFeTYWKaO
	3N6er08dgSU9vcvHDeKrdMH/tJdmOJ7hKCYUcQ3dp97HScWL9d+xmsljRqvNZi
X-Received: by 2002:a05:6122:d1e:b0:575:27de:3eab with SMTP id 71dfb90a1353d-5760c057c54mr11210456e0c.9.1779183118300;
        Tue, 19 May 2026 02:31:58 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760fae4264sm8021908e0c.17.2026.05.19.02.31.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 02:31:56 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-6313b7e3d03so1958508137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 02:31:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/dFeMwVyrMfenm3YHsMm2LHIz2fCrRpET20QbUBXoIaWJhGuvW0DulYDKG/x3zPJckcDR0HDJZb4amxTgb@vger.kernel.org
X-Received: by 2002:a05:6102:598d:b0:633:d7ec:153e with SMTP id
 ada2fe7eead31-63a3fc96982mr9701042137.28.1779183113287; Tue, 19 May 2026
 02:31:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
 <20260512033750.3393050-2-linlin.zhang@oss.qualcomm.com> <20260514-clever-apricot-goose-acc827@quoll>
 <CAMuHMdUzraGnOxRU=9bsxBBBFtVqudMGisfcAegUzk+_OS2+eQ@mail.gmail.com> <657a7b16-9036-42f9-b04a-503b5349f68a@kernel.org>
In-Reply-To: <657a7b16-9036-42f9-b04a-503b5349f68a@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 May 2026 11:31:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXoDx2MFDvWByvUS+d65Lj6EsiecVLz5apT4oBc_Lf8KQ@mail.gmail.com>
X-Gm-Features: AVHnY4Li7rFLZVAY1sX6NRmb7UDXsqvLWq9nv7KTFBeOAp2gXjwv7toqKRqt7Ng
Message-ID: <CAMuHMdXoDx2MFDvWByvUS+d65Lj6EsiecVLz5apT4oBc_Lf8KQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: crypto: qcom,ice: Add sa8255p support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linlin Zhang <linlin.zhang@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108432-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: 591E757B6E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

On Tue, 19 May 2026 at 09:37, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 19/05/2026 09:30, Geert Uytterhoeven wrote:
> > On Thu, 14 May 2026 at 14:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> On Mon, May 11, 2026 at 08:37:48PM -0700, Linlin Zhang wrote:
> >>> On sa8255p, resources such as PHY, clocks, regulators, and resets are
> >>> managed by remote firmware via the SCMI power protocol. As a result, the
> >>> ICE driver cannot directly access clocks and must instead use power-domains
> >>> to request resource configuration.
> >>
> >> Then how can it be compatible with qcom,inline-crypto-engine?
> >
> > It is a pity there are such big differences between the SoC-integration
> > "hardware" description in DT of systems with and without SCMI.
> >
> > For R-Car X5H, we proposed a difference approach[1].
> > Linlin: do you think this would be a viable solution for your platform?
>
> In the cover letter I see:
>
> "This means Linux can no longer perform various system operations (e.g.
> clock, power domain, and reset control)"

"... by accessing the hardware directly."

> I skimmed through the rest including bindings, and I do not see how you
> did it differently. Patchset is mixing multiple subsystems and topics,
> so it does not make easier to find what you meant.

The gist is in:
  clk: renesas: Add R-Car X5H CPG SCMI remapping driver
  pmdomain: renesas: Add R-Car X5H MDLC SCMI remapping driver

FTR, this is what we discussed in Tokyo last December.

> Can you point me directly how did you do it differently? And by "it" I
> mean what you comment here - "such big differences between ... "?

1. Describe the actual hardware in DT (+ a firmware property linking
   to SCMI)
   For sa8255p, that would be a clock controller device node.
2. Write Linux drivers that do not access the hardware directly, but map
   operation to whatever mechanism the SCMI firmware does provide.
   For sa8255p, that would be a clock driver that translates clock
   enable/disable to power domain on/off.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

