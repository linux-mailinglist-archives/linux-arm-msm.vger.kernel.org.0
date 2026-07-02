Return-Path: <linux-arm-msm+bounces-115898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JpaqDH86RmphMQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:16:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAB56F5BC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:16:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CM1pHfbL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115898-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115898-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D3A230557C9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1226C47D952;
	Thu,  2 Jul 2026 09:45:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC72747CC97
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:44:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985501; cv=none; b=RVvNza6o+gKK5Z7E8ZbGcpKVukdIVaANE+mZ9hWiUga7nnrnLiu21X2+SDA8rq3V65IxFYycpPXObXyoFSbGnq82WBynkLbKPhDXLDDI356H3UekCM3uWyiY0neC3blJhBflIBEcDC8fCIVRvXNqv1dhizGvgk+hu0IZ+Crz5Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985501; c=relaxed/simple;
	bh=ECZSUW9hSj34SFz4G8bfbFkApIByTwPPDgQgHBlg2lY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DxmmQsFDjbh3W1Wd12uGWLupT/mzqyOFeWmCTguUqjABqDdRmcpQsPFLmQInuZlXqFJrpLMw3cIUxtkHqGaBfJr/ghoMjHyqqQZiZbd7pWydwQcOLlWQ2yNJGcs3MBYIOwAe758IVY71rY83mWL1H16x7FHh2AP6iIqAXGYOc3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CM1pHfbL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC271F0155E
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782985498;
	bh=ECZSUW9hSj34SFz4G8bfbFkApIByTwPPDgQgHBlg2lY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=CM1pHfbLgxMYkSotRohphHAwfHiS2Jq6WgdNtLNVx9uS9WhtbtNpBou5sFbv3Zfbs
	 t4EYEkBRrQ2RPOdC3sKXIYU/bXdz1i/2PmuYsFxoCMwyYQGcvrEq342mZyLtAsgOpG
	 w/sfT7k5FjdRPizXj5j9sXzzoLSxaH4bXp0ZuISOJV1Aj9GCea4PDHBExCwb2cLFYk
	 vD2m1iI2wTjiyqshwUVGQuj011ZBWZgfKMQS8l8tVqa50gCgevokuKhUvpXzlG1EZ+
	 4tnuwDISjYXV/puQzCG1Qd5pr3KEdBJbwvMtN8gpQX6Ik/85EwSf3YqBWFGGYzSx4P
	 2QjvHhzDq8Dhw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39b1026e171so17382931fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:44:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpFWl3HSTzg9RbOsDzd5Xm+D1KVQEQ/ju0wGWDqp1VWDFtr3WpIzQ0pLZQv3wUnyADmWWQxeyW9LQiDDWS2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdw1JS/fz2Cl13+QqftZ8ceQJd8bOJhFuI8/NLGhSO+MA/QG8v
	o3FPgEKV0yfas8Jl46cbllADqa/f26+JDjdrkrztawTrAhwY2r0ZoY+MBef+ccu0Jjji4OqHb4a
	SVm10agqRk0zgGefRr8n54q7RdI96E7oHH/VSQZ4Kgg==
X-Received: by 2002:a05:651c:2129:b0:39b:128e:ae5d with SMTP id
 38308e7fff4ca-39b36e539cdmr10506381fa.9.1782985496830; Thu, 02 Jul 2026
 02:44:56 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Jul 2026 04:44:55 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Jul 2026 04:44:55 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
 <akOZFIowVvprnAMf@vaman> <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
 <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
Date: Thu, 2 Jul 2026 04:44:55 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfwB_51OLjX_19eagZ1m3UUM2iHny5rx6besR6+Np_A0g@mail.gmail.com>
X-Gm-Features: AVVi8Cfm4QcPsY-kBu80DyHJVbYDW8Jkdy81l2_sPTIAALqyBLBgGUF_GjAGTTs
Message-ID: <CAMRc=MfwB_51OLjX_19eagZ1m3UUM2iHny5rx6besR6+Np_A0g@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[48];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115898-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:rrendec@redhat.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-sunxi@lists.linux.dev,m:linux-amlogic
 @lists.infradead.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,tenstorrent.com,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBAB56F5BC8

On Thu, 2 Jul 2026 11:16:22 +0200, Geert Uytterhoeven
<geert@linux-m68k.org> said:
> Hi Bartosz,
>
> On Thu, 2 Jul 2026 at 11:12, Bartosz Golaszewski <brgl@kernel.org> wrote:
>> On Tue, 30 Jun 2026 12:23:16 +0200, Vinod Koul <vkoul@kernel.org> said:
>> > On 29-06-26, 16:51, Geert Uytterhoeven wrote:
>> >> > Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
>> >> > driver instead of the MAC driver where it was previously. Instead of cramming
>> >> > both HLOS and firmware handling into the same driver, I figured it makes more
>> >> > sense to have a dedicated, cleaner driver as the two share very little code (if
>> >> > any).
>> >>
>> >> I think you are mixing up DT bindings and driver implementation?
>> >
>> > Should the bindings change if we have different driver and firmware
>> > implementations? Isn't binding supposed to be agnostic of
>> > implementations..?
>>
>> I've thought about it some more and I believe this question is philosophical in
>> nature.
>>
>> sa8775p and sa8255p are *the same* hardware. I can flash different firmware on
>> the same Lemans Ride board and it becomes one or the other. Yet they are not
>> described by the same DTS and the bindings differ as well. I don't see why we
>> wouldn't allow the same approach for the this PHY.
>>
>> We treat it as different HW variant when it's managed by firmware - just like
>> we do with the rest of the SoC.
>
> DT describes hardware, not software policy.
>

I'll defer to DT maintainers then for that particular case because it affects
more than just this platform. For instance: Qualcomm Nord[1] is already being
upstreamed with a similar split into common parts and then sources specific to
the SCMI and non-SCMI variants - even though it's the same SoC.

Bartosz

[1] https://lore.kernel.org/all/20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com/

