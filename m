Return-Path: <linux-arm-msm+bounces-105086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OM3PBxYq8WnTeAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 23:43:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2C848C603
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 23:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CBFB3015E2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 21:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1653C5DDC;
	Tue, 28 Apr 2026 21:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RtM7H2al"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3663B52FE
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 21:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777412617; cv=pass; b=Wax1A7NxqQAp5x+edpBHwI6d9uOE71cxqN44pxSNH5AMIxGnVbJrwmVlQXJDVjyn9g/UxKMISr3hVum4XstTBPiP4wtYfEkB/pCh+ThyIlq2z9M+jpXdjE/mehipM7191gwQKBP4N7Oz62Ujsv1sfX0p86/EYagTumZ3Avi1xBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777412617; c=relaxed/simple;
	bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iz3e+OObemmXR4jvzEk/r+SxQX0Mm2XZ5xG7RS55F7Rt7GrATtNp2FR5l3c6UqIaLHLvKF55rpCkLz4elNs4dVQYlmC+KKmtFNsRAMNtlMvz5hYqx2PDXV/WQ+m3BTUgWNzjNtqmEseo7kS2Seu1r3h28a25mYpjLQnQ7f0thM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RtM7H2al; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so5165e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777412614; cv=none;
        d=google.com; s=arc-20240605;
        b=Ueq3FRnLupV+8y+0BJLIcmdHAdbZ+8jdxoCywTaWlAan42lYagFSLcwZ6IDoV3O5hM
         Aj73oAfmHjBXb3NtYTzN7NOeikxn6TkiUchpCfuRGudy78V7Zh8tEInkXWqk+Zff0klh
         C+iah4xxJFr29vvbFO9/sdrVjE58C4y0hwom8fJDxv/H0LkO4575M6PQkD49iBOHpLue
         EdJTMa2PGc6cTVYShuHsueiJiBW8FNaGyHOU8JUR7otdA8bJGRlLYC0Fj3syFQmZr+sz
         CadVx7ra6O77wda4XGbo521WsFQAz3UrPbjf7o0a2vs8xrke/iY6T4nGCiNygZ3Le0n+
         tFiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
        fh=4DXx/XDIyVBqHqAyQcpunPhk1lc31q5SnwahcLPm3JI=;
        b=j9MX7Z5US7GvXp4DmfCFBf2MDoOXVsgCinTH8JxW3KVMGqnW62u/vRudmXYBU6DIF2
         RhzWMiV10EZXzeB5LZ/t8JnJpy1uI5sxZ0IPMqks5g7jGmZPZGdByDyn9jxzNp+6m3mm
         /X3Ya7E8sP82eyWrSrUA+u0tsMx6CLjXrRH49F4RbfxWRqxNnUzLnya5fbYNZ1Ix4bNr
         pmjA4CklhqK9rUqA6Cw9VWDUyHGegP1i057OGuszLXMDdDopqFnMWItipckj7ZtJcGYL
         PlcNY7yGfBI1OUoK1eRH1YG/DlaLYQcMo6vZzQy2nsG5V00axFnSx5dG0VY+/xbgjpnh
         +gyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777412614; x=1778017414; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
        b=RtM7H2alnCMVAaGDmjy59M8Gwp7eHD+fQMMsYihCog4+AGXfK+HEf1d9LmCx8gykeo
         +/gs4xjnFFUbOndufNdp/L7rxB22zO6/iacal+Nr09pUF0lPUltc1YOd/d5VJ6Wqr34L
         D3cjV4KEF/F3SUm7t5OOUIBIDgK9rMqH6Dys0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777412614; x=1778017414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUgK2Kfj5omPDpTxVPnIw7yYPrhwYT39UaRAh23oDLI=;
        b=DGhAYCCWI3XH1gIeRiiMC7p7MpZ/5VWmRhAHEkp+fgIOJuG7rHNREZYYa/tmS0tVZe
         b9vj8PRtUgDCds3XJBCGxSOa2QTeZfJY4iBkDNGZ3egONOwAUqEb1wBGLSHLP8FL3ZSv
         O3FBzAaqbcWz7v1gbo51O8pFYGZSZUxYI7qhE0s47Z+Oa7VbdvukqMXlwK4KDNEPm6Ks
         wGjIeq/eTxCgcAnEfOqS8albEsHnBsVs5mQ12Rnv30vZvdf5tHrcIiJuYlBs6dOGjULO
         4kamRMtaXKtCiSVas/dlUnKxhPNWAKuhMj6ATPCycXUzGqQ4RixxdksMbpNpdt0z2eak
         wVnQ==
X-Forwarded-Encrypted: i=1; AFNElJ8eaKpGAPv8GepOUuXmwNxuEW3/tJNvHeToS4zBELVz09YjY3mwdgktAyM7sU3XYXAtGYTY+tEx8XFk3pOm@vger.kernel.org
X-Gm-Message-State: AOJu0Yyur8bxc9ssf4CfHmFKAHlGccHGyXxONR1+AVdxTnSUiB9QBYC8
	FO2tUyH7J5+dXcis7OWQtMz25qBFHjMuC/MU3XWnM0dTHVayOuR7QN7kfRX9smF0dZ+kvTNlT6+
	EuXrt0O1jACLa1QeYH2yRoE1lEOjDXYPYzRo6/UQ+
X-Gm-Gg: AeBDies0mIuH4q/ysVUeGZPiR21LnaOqeEVrAlc1c21+YJs8NIbxq3LtScMI8aifqUV
	I/LQbbd/8i2GMN1rGoHAvv2hWHTsIC3fCEv5yWoZ0aHN3SEmORJUnw2WEloiymmfN6ayO4iJe/s
	M8jk9iuoGjXpdjqJ9ygVRiizuYN8XPnlE+K8fXfUrI4R+Zgrx1zFLvCSA7/WJmwau3ydv48M1d4
	m9x4CfqGyfh/C5UGsU7DWAOhgbu/8j5sc+/VyISHBPgY8Pbh55h2V6VrEyyQWpGe6FXDV595Wtu
	u3FMpdwU4YV1fe2cccoHiigZWPb7Y1Wqlc/uMiwrmqheBkVXFeXSiRIM2w==
X-Received: by 2002:a05:600c:530c:b0:48a:5f32:62d0 with SMTP id
 5b1f17b1804b1-48a7ba07d5dmr322355e9.12.1777412613805; Tue, 28 Apr 2026
 14:43:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 28 Apr 2026 14:43:21 -0700
X-Gm-Features: AVHnY4LgrR9BMoyPVl-dbhODH2S76f3l5WcQRNgpXekO-MzmQp39W8EwHdrUnso
Message-ID: <CAODwPW-YuhQxyGSeahp8+i-bz_hAvPQQCNWxaZCjrbvkHOQa7A@mail.gmail.com>
Subject: Re: [PATCH 0/7] dts: Add /firmware/#{address,size}-cells to
 Chromium-based DTs
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	Julius Werner <jwerner@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: BD2C848C603
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105086-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jwerner@chromium.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,sntech.de,gmail.com,collabora.com,vger.kernel.org,chromium.org,lists.infradead.org,lists.linux.dev,samsung.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

> I reviewed Depthcharge code history and found that this problematic
> bootloader behavior dates back to at least 2014, with the Tegra/Nyan
> device. Older devices may have similar DTB structures, but I'm not sure
> if they have the same address-cells problems. In any case, these changes
> shouldn't hurt even if a device was not affected.

I can confirm that Nyan was the first Arm device shipping with
depthcharge. Note that the Exynos devices are all older and shipped
with an old fork of U-Boot that probably handled this very differently
(I believe they had `/firmware/chromeos` but not `/firmware/coreboot`,
so they wouldn't have had a `reg` node and should need no `ranges`).

