Return-Path: <linux-arm-msm+bounces-108387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yI3CLeoSDGoZVQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:36:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC9B579301
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAE4930D2676
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89EB53D8125;
	Tue, 19 May 2026 07:30:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEB73D8104
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 07:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175821; cv=none; b=d4AO/lyyW7FD1PhP/bipsZxKM5UQaUjH6aeSvnGd6n7A79npGmcBQJ8m2Xn0eMAzV8PD6psc/Lq5ZUW3jId7482tWn5R3dBN18YAgOB0aJLao90QQA2k4PXwNZH2/3s3k4G4hQS0R2JNDs/E8cRgazF3cDyD2Lbkf/FjcD7kefE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175821; c=relaxed/simple;
	bh=EP+l3Xsf/02TI72QB7nqXNUQUPtcxewjH2cpp+hAG40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B91/1NabQx64cw6mPoP6TQwS8F/Nv/kS2Sq+fcsiSt/BLQmjg6tRYgwX3Gw0Imc/+UmiaR5hrgHKc4aC6jtLzjtzbsUEYCY0Plv4XVJjlf7gw3XrC0VFaItyuYFQb3BWmhbfR8tO4oRHLBoCaH3Db171cs1ORMobC/PUM7K0Me8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5753a289955so1002716e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 00:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175819; x=1779780619;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1Ydpi64imhfiW3BOCP/037yrb9bXbwCDPHAO9TSn2c=;
        b=f+v4P4VyfdK2u/qM1fr7awS5q1EF30tk0MFYIzHHqi6cajGV14S/39fzb43FTIZK4M
         5l+Ze6B0hFIdLWjGtn1KaOk9cSQkEDrXyoctciVB5s5rwFEw/OI/+pdoQzmxqQSJholo
         kMojRTwTtXpq3YUn2WnpfDHW/2wwVR1WKkvktxlr5EzwDSguHsLzNQLFBlVpEa37Mqpf
         kAXDgbvZOXj4mm+UkoiMCech8OE5Iw/hAblLaxaOqWooPzevJwcNZ7xv5GNr/mE9qDPU
         qpU0Bzkigp2VVbFdy8KeXRrZbQ5DEMVw38B5i1kmKG4NxvDi0e4MIUN/otI3S4xuAJ6e
         RFRw==
X-Forwarded-Encrypted: i=1; AFNElJ9347uWbGmAnEmA7SJm8Zj/xItItQESGcIS/bAuyfKazEVHOyFjILC9zuEUNgjhTj643ppZmnKaW9gGToXk@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd4dVVb3HdBKSsFp9m0GRPhGp0CH3rjQrN0N5Es9ZH6aL+xij5
	uPSm7DPF58XEgkqlJZbeRkABpXl8ZQtnbXmsaWc23lG7/GmWC/K7QBPdwFXLjLGQ
X-Gm-Gg: Acq92OGpW+i1q6NrLSxR0enEPbOPs22fmx/eqUpLjrWz/WOhnaQeltfTHveC48CULB9
	EZiETg3nJfW98/691BJjnp55qSNvtwekRlaNQLA/gcasUhU7ZSV9dbedo9Ruij13PgYNDfPiZYd
	+yKR1I8Xoh19Isxp0ivxGhKIS2HPXYiHwVJGZ8Rl9yixPbAJz4ONBBjVyfbF5PAikBeceImmmP1
	AFF92ddTGeNllsm0sWM71LqxmtAEXURlCcJJLrcLBrxz7vCX+yrs5Zove2AG9zluCcL9clw54JG
	MGbysAipPLvYJQMViMC6jr1irXdcTehNa2kOqxrlMwCnt670xRYerFZlsti+c2Pt1CG809m/tH1
	lTSxTD7IYzWonPocTg/2E6zpYdvCG+ZQF22VupEfGatLibm5jZA3qpuAg0VeTql4EjG5LSHSjj5
	jrjEeLFNP/P1iqnFiOgdlw7rU7T7fFopzC20tKUmponxFa3rvCdw8jRPvd0xGk
X-Received: by 2002:a05:6122:887:b0:56f:1c32:bd07 with SMTP id 71dfb90a1353d-5760be3bf61mr10501366e0c.2.1779175819075;
        Tue, 19 May 2026 00:30:19 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760fa5bfb6sm7605681e0c.10.2026.05.19.00.30.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:30:17 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-631b313e3d0so901536137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 00:30:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9KFSv5jh1mWAfvOrLG3DJzZRyPWaH5Z6eTT/dNgVCBeJX3ot4xuPeskps+/BhpEOIOaxZWBuYcGdHnxkfc@vger.kernel.org
X-Received: by 2002:a05:6102:598d:b0:5ff:cee8:660c with SMTP id
 ada2fe7eead31-63a3fc94452mr8770872137.31.1779175816720; Tue, 19 May 2026
 00:30:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
 <20260512033750.3393050-2-linlin.zhang@oss.qualcomm.com> <20260514-clever-apricot-goose-acc827@quoll>
In-Reply-To: <20260514-clever-apricot-goose-acc827@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 May 2026 09:30:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUzraGnOxRU=9bsxBBBFtVqudMGisfcAegUzk+_OS2+eQ@mail.gmail.com>
X-Gm-Features: AVHnY4Lg6L73kxFzoZy6C0Wkwm0pix0KrxlB1EVn8QM9gs7VsfrBk977OYQBtOQ
Message-ID: <CAMuHMdUzraGnOxRU=9bsxBBBFtVqudMGisfcAegUzk+_OS2+eQ@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108387-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: 3DC9B579301
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 14 May 2026 at 14:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Mon, May 11, 2026 at 08:37:48PM -0700, Linlin Zhang wrote:
> > On sa8255p, resources such as PHY, clocks, regulators, and resets are
> > managed by remote firmware via the SCMI power protocol. As a result, the
> > ICE driver cannot directly access clocks and must instead use power-domains
> > to request resource configuration.
>
> Then how can it be compatible with qcom,inline-crypto-engine?

It is a pity there are such big differences between the SoC-integration
"hardware" description in DT of systems with and without SCMI.

For R-Car X5H, we proposed a difference approach[1].
Linlin: do you think this would be a viable solution for your platform?

[1] "[PATCH/RFC 00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping"
    https://lore.kernel.org/all/cover.1776793163.git.geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

