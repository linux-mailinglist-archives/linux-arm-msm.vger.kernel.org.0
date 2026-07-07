Return-Path: <linux-arm-msm+bounces-117170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5SYqJYezTGqXoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:06:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96007718E1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:06:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Qr8xIagy;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117170-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117170-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3BC573022471
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 07:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37EC378D68;
	Tue,  7 Jul 2026 07:48:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7517B2E0938
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 07:48:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410485; cv=none; b=kVJ25SL6wMOqkMd/erJSsRrFtCV7tga1KrZ7s0yCo3r/JO3uFDzIQ+GkRbvoWo70Jkif+DF6a6oIBr8e9AXyhKG+RQ0Sr9cMqvUIJ3tIiqFAb/891AZh0CGkYJflIfzLdwIHyZImSgo5qnfRvrplguMZ1x6HaegwzjhVeqRl+wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410485; c=relaxed/simple;
	bh=fTELVgDPDDa/adOsZAcvFwbR5ckIe3CM0pZ25SuNlOs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TpVfgccABseHx5M1ItfPiz29dSSt1EH8JlNtT8lWV/frFAlhJvyWZQT3C5wmTywfFbtj9pI73UwyKZxyo0WHMoyofDwfV0hzdsfsjKJukwsAaeyF4JGgpTWEvbPjHndHLTaOThFqqRckJGRnhaPfiNgy63t6ggAb+NlN9y19WOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qr8xIagy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AB01F00ADB
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 07:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783410483;
	bh=fTELVgDPDDa/adOsZAcvFwbR5ckIe3CM0pZ25SuNlOs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Qr8xIagyx3ZvdFRwQDOyaVjrunJxWrC6+trHzfCOrWDL4efKaTczCRhRnaWpZPL9w
	 RlUUxoJX5bqH139t7TLcLBoqc2GKzxuzwhHJIEl09v/QjIpaAkmmmKdbFyETt/dHKA
	 gvh3wZot9pWH++z5987HPaaFNzkZJ4lkd4JLq7TiSHOUUoirbXRrp7XXl2kVq6Lxpg
	 JyBnnOCcxFfH296ICfguEed3znxsoqaQ5HS31bHn6YhmIJ5dPJkjTUSAbnssxnJ32I
	 bELdOIGLBvKV3GRyM67aheIoorsOD0CvmP7Bu2cqvOeRWhaVIA8tz8a7HpKWZ9LECP
	 CWIaVzf0v0JTA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39b0c6488e6so42536351fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 00:48:03 -0700 (PDT)
X-Gm-Message-State: AOJu0YxRIIFy/IgK7L1KuK9J4JWfFGV64//UiQZfp/Zy5w5iOrg5tONB
	lHN/zKr06DHn4n8jHUBtTBQoMJqxuc90YmmbUAE3ZUIHbCp77l6ewa3mxcZNSGnr0sDLdCfLo/Y
	CNpbhcvp1jovVA8qnU71vNSd9A835p6Q682Qgk4rYhA==
X-Received: by 2002:a2e:8a84:0:b0:399:7aad:889f with SMTP id
 38308e7fff4ca-39c60016efdmr6273461fa.27.1783410481786; Tue, 07 Jul 2026
 00:48:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 00:48:00 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 00:48:00 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 00:48:00 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeZ=9Oy9rCfugiivuTWNeZc6o5RBm3T_8_Q70RsbVyjkg@mail.gmail.com>
X-Gm-Features: AVVi8CdfTk0d0MBtBeXEYxHV0em1KoWufQbF_cpMl07Jy03GCTI7kHjFfQ2Uf_Y
Message-ID: <CAMRc=MeZ=9Oy9rCfugiivuTWNeZc6o5RBm3T_8_Q70RsbVyjkg@mail.gmail.com>
Subject: Re: [PATCH net-next v12 0/7] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Christophe Roullier <christophe.roullier@foss.st.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <rrendec@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,tenstorrent.com,lists.linux.dev,linaro.org,oss.qualcomm.com,googlemail.com,bp.renesas.com,kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,baylibre.com,oss.nxp.com,nxp.com,bootlin.com,glider.be];
	TAGGED_FROM(0.00)[bounces-117170-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,vger.kernel.org:from_smtp,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-sunxi@lists.linux.dev,m:linux-amlogic@lists.infradead.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:martin.blumenstingl@googlemail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavalla
 ro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:rrendec@redhat.com,m:martinblumenstingl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96007718E1A

On Mon, 6 Jul 2026 15:20:15 +0200, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> said:
> Add support for the firmware-managed variant of the DesignWare MAC on
> the sa8255p platform. This series contains new DT bindings and driver
> changes required to support the MAC in the STMMAC driver.
>
> It also reorganizes the ethqos code quite a bit to make the introduction
> of power domains into the driver a bit easier on the eye.
>
> The DTS changes will go in separately.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

There's one more comment to address by Uwe so there'll be a v13. For merging
strategy: there are no build-time dependencies between the PHY and MAC parts.
Vinod, Jakub: do you prefer me to split the series next time into its PHY and
MAC parts for integration?

Bart

