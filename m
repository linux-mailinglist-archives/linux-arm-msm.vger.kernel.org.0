Return-Path: <linux-arm-msm+bounces-95522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HRWAAU2qWlk3AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 08:51:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D46320CF24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 08:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4EA4A30300C1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 07:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4CB532C94B;
	Thu,  5 Mar 2026 07:51:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A239032B981
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 07:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697089; cv=none; b=dzfUzz48JwQV0QS2mRoKaYxjmumtm9G+zVT55cYJiLO0qtRnPHI4vCETSJxywDggPj7zwgbVMWq8UtbMiNsCR6+u75FZbGR++jS/mM0NJUKf/1on9IWk63Y0aTZB3nhdCzBl9UfxgGpP8xgRyAohsU0Oj5jhlbrAEHM/wQ1zFjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697089; c=relaxed/simple;
	bh=1VrdyW7eBzn3eIzcJ/qwIsXSzypVzRQDxfUgekinKYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CJ6UG55+kc40A+saJki75auViTJ5esAzBoXbOSmtijrVRXx0t+uQP3ZBrtnGwvwLbAaStXN/YTa09P88vQqk3Pzi4iX0q7KYoQXJ5UiDkAA1iUDOM12A3up3wrSJNuDN7qulp1bSxHDSXkW+15jjsaf+4TbWm/pgr2fWbO0H/70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cb3825b0fbso757006485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 23:51:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772697087; x=1773301887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLWXJFRzKXYfvRWexgs1gCb/dTgnevi1M5AetCjur0g=;
        b=MsKls/inK2QFhNmaP4GeuXTVnJhn2gkA29xCGN4ByF4iZoX25gmbD7eHCpTCAleRCJ
         UHZuKoyyjmbwq3IXThim/AYNppz7ZzjfifxFcSllMv65PuavEAoR3MdnX2RTVbNxtHhG
         WuD7tphD2NIBfP4oUZnWOw1ZApXB4ii1yPNnr60SbYyWS+o+BoHD7XX9L+xk88pIfz1J
         1D7XOC2Ta9Si4ECcSB/VoDcuKxgnHyH9rv+NNJsqr/+3sR2Rilwm7J4F7WHEG7a5g+47
         wAeJZCF+/ljUVxl9KgXHKJTcHxE8XLC3c8cig7TgYHm11PVId5av8qAQE47mUVn/b6mh
         Lj4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvun5KP+e8ihcepSB+1fHmz5Z9ZZLP/G1471g8lwTxtDen81mvSzA564bMtmGz2WIh9IP6Mh4Xr5ewNOcv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7nQma7vqMvjhZwRV1YjRto5pmIKX8FGQeTZopPKiuJqa/9fM2
	6c7LRnveP2GVTMwlaX1+eGs5EotLoqoey4LPT6nk+nSThKWiTX5IsUk/IUrgxTNR
X-Gm-Gg: ATEYQzzZ5dGMfmmMdtuZoBE33WT9yyxinDy7H2yllJSsReJJMMqJoa0T0jxs/Xxlccv
	qDMKThMR3rkZkIKBbkXQBSyWCD6N9fep2jRnzBz2/wq9weeWLuJ/rKHdHEIIcSccVDPupIZxOF8
	cYu493LeHkHg0rJ5tYaGpIblgzv565BjGKHE0GW4od4wtejQysBry1t8P1Mr8+603+rSiUxgHAg
	Xg0b8+d9WS8o6PawgMPA+lH0Z8/HUayXYIBc7uhL1gTaHfJp8QfEPQJoz4F/OymyrIlVIrDxBWC
	1LLyxeS0IQTLcTrSBgNlNP+Nqt+DEGCb5a07pDXxLPHuMmY81D/kdwi+FbGTWZLweTv5+ivRLHD
	LR+TTX2EUQsZsfHzfkmqCNaPS5FwuLxoeVQleK/CWa0uaOTBT9iVweNng+mYcPJAXW3d7JIh2Qt
	JzeKyQiLoh3jWjoazh9BIlhwjFO82ydv2VwMhLWZYX1QiO3Mtp3VsFgRllZrhEMyJNJeaV9KZYn
	B4=
X-Received: by 2002:a05:620a:1922:b0:8c6:ab77:f970 with SMTP id af79cd13be357-8cd5af79e3emr651336885a.41.1772697087576;
        Wed, 04 Mar 2026 23:51:27 -0800 (PST)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf736cfasm1796240285a.49.2026.03.04.23.51.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 23:51:27 -0800 (PST)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cb40149037so804497285a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 23:51:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVtsslW3gOO8Gr2TMKp2g0ueaLaFvleD7zaApneA5DzjWaOpoV1DhN04oPfhjAOEdjJmbQBbShrZeANPuSq@vger.kernel.org
X-Received: by 2002:a05:6102:441c:b0:5f9:3a22:85a2 with SMTP id
 ada2fe7eead31-5ffaac72675mr2059267137.12.1772696734612; Wed, 04 Mar 2026
 23:45:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-6-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-6-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 08:45:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXA67BO8Umz8-4jRg1SLvtZUSEzK0p7WxSvomnBk+WiyA@mail.gmail.com>
X-Gm-Features: AaiRm52ziEM93YxO07h7pOV0rTYZnULijxTOwLRm9EW_k_lOxLulmwK4PITV2jw
Message-ID: <CAMuHMdXA67BO8Umz8-4jRg1SLvtZUSEzK0p7WxSvomnBk+WiyA@mail.gmail.com>
Subject: Re: [PATCH phy-next 05/22] phy: add <linux/pm_runtime.h> where missing
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 6D46320CF24
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,microchip.com,glider.be,gmail.com,sntech.de];
	TAGGED_FROM(0.00)[bounces-95522-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.969];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,nxp.com:email,mail.gmail.com:mid,glider.be:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> It appears that the phy-mapphone-mdm6600, phy-qcom-snps-femto-v2,
> phy-rcar-gen3-pcie, r8a779f0-ether-serdes and phy-rockchip-typec drivers
> call runtime PM operations without including the proper header.
>
> This was provided by <linux/phy/phy.h> but no function exported by this
> header directly needs it. So we need to drop it from there, and fix up
> drivers that used to depend on that.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

>  drivers/phy/renesas/phy-rcar-gen3-pcie.c       | 1 +
>  drivers/phy/renesas/r8a779f0-ether-serdes.c    | 1 +

For the Renesas parts:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

