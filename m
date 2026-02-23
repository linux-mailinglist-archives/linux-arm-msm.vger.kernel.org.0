Return-Path: <linux-arm-msm+bounces-93653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ftZkMwoqnGkvAQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:20:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED47174C20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07C96303A3F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE5E35B64D;
	Mon, 23 Feb 2026 10:20:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EA621D590
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 10:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771842031; cv=none; b=i32hrFv+t0OUTeIeiQaPeA5/YbLsMznYy1KPYoq5Eq+VGzo0v5SRFuxqOqK1pHd8zZaxEGh/hBgmBczqk0OK2XNW+JR+1CjrFtHyLqBDVoxcGcLS8jGvzKZGQR0uTE58PPCnEwMqILNQZQkty35SN53mSpktqJvtIIOqACCxosg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771842031; c=relaxed/simple;
	bh=qmklrboQIpSfdlDZ2hHPRPuP8NQIz98sLqpsBfIp1xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YU0ZexKTpFPpprxSll3NGFcTNj+h09M4kOlz4Ut0y80UB3MdRQBFXRnmOp5JFO7bAEc3oy+gJ2yi58lL/UapF4k3GOis8ALIrtGAUsNXGqCOF0aERIiyzucmx//c9Z6xbVJff9sblwPwkLBXhqRBlskMr/toh/EsHtRtO55d66Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so1766646a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 02:20:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771842029; x=1772446829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYufON41haCPAAlB17VyKfqSryTL2wR1KeTBsoMTWuQ=;
        b=ZDmFIV6ammNDMHz281Zqi1tS7LbdA5P54mTBCHaAN2UFTckocfLNQjxKtrvVHvXtzo
         uVam9y7RJHTR0IjaAqWV6Qe2mnQX3IuDrAcWtGG+ozN2bnRWVkpuJVqVW3mKNDmF57p1
         ZNAebWFnUt0GIcCnmsRbT03B/Ea2QmOTIbjBv2rrPNmhosNeYcNpm3LYbEdZ/hzk0ocq
         Ob1dBvAtGn5gwMhNGBc0AHLaPmUJXsyuhEAO9JTOIvQP2APUCgg/Ne9BqKrqm4mb6i8R
         lJFdZeZDB2q2ky6gMg5hxKN7bctw/7V2GZu4okAZIenQtV7uJCpOY+eyvVXbR2nLapmG
         fQdw==
X-Forwarded-Encrypted: i=1; AJvYcCV6Ht2XoZfN1dde4ZfLysZAm+cxJ9x5xuGdIGsuWPN1Nw465897EOW9SZRRafEs0QNKc3z6twQpxrpxF3yI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/1DdkmhvxVHFBEQ71JE4ttGN6fw9cCshlZnPRnrGXY1/6411N
	m5CXGJtzs+2Bs8UT1rYsd2DXKmgIy+qfx4PRM7SKsra7S2nWGj0SCbx2dWAxrP6D
X-Gm-Gg: ATEYQzzEpMIjkP8/KZIgcMXnk0y8l/Beof5zdQ4ORURR7bP+vVzzcSwUjhEoahPHjWV
	hYCw/VPC496hot4nU/Dd4p8HlYjC1PLTJtGb0EQjcAJg6DXhuNhkCxpIu9LO2YsEUchFSAvBfub
	JrIIrPXm6mPdN48dPaSahC9gNiDpNtxhmkgbOSHIeJGqdG1mWez8/Lr6LVn3Umnr/nJ6vQGygbn
	NoisFq6/4LSekRyocbRf7bgLk0yH3uFwoockGznPyWbhKMGQxi8aIMs2EScfMwR8Yc4UMSgK0Rp
	u1JjY5hYgXbbVhY+u6l8ncpCjQBpd2dyC5K7vgwYlWZHMU9OGuh90gDD8gSYRhSOEYxkogDMTGV
	Yhcwc3T4+ZXSadeUQV1gqtZTyg5wMRkqWoetXeWJiKo2yF50IkQ2QQdZGErIhyOf48o5INa2q5C
	Q0pNyaQME8I9UZ2oLHlar+OePYhgoDaea7MeyipxoooEoPT9xPDRWW5bBJbtk=
X-Received: by 2002:a17:902:e542:b0:2a9:e8b:5326 with SMTP id d9443c01a7336-2ad7449d672mr70469285ad.23.1771842029469;
        Mon, 23 Feb 2026 02:20:29 -0800 (PST)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com. [74.125.82.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f637easm70114255ad.37.2026.02.23.02.20.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 02:20:29 -0800 (PST)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-126ea4e9694so5355279c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 02:20:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXu5Ri3lDItGln9yj7WDx3W7fY+WEAcLYndQdGGzKOSwIupDPq1W05SIzihyL9q1TTjP5v5foGITcF+Ddx1@vger.kernel.org
X-Received: by 2002:a05:6102:38d3:b0:5fd:8175:2eb7 with SMTP id
 ada2fe7eead31-5feb30db471mr4509289137.34.1771841684922; Mon, 23 Feb 2026
 02:14:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217212707.2450423-11-cassel@kernel.org> <20260217212707.2450423-12-cassel@kernel.org>
 <aZTkLiUaMTC7H1kB@lizhi-Precision-Tower-5810> <81af7f88-b9c1-457f-9a21-a7b15a13d374@nvidia.com>
In-Reply-To: <81af7f88-b9c1-457f-9a21-a7b15a13d374@nvidia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Feb 2026 11:14:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVTY=tV_3qq3gDuAHPjXnexT0Qq9SK39V-U2ACbvLRsaw@mail.gmail.com>
X-Gm-Features: AaiRm52HvurLndDwor1bgpbfCcI9wH1Ckd1tYC4oQp0RsW6za3e41CkVlZ_fe6s
Message-ID: <CAMuHMdVTY=tV_3qq3gDuAHPjXnexT0Qq9SK39V-U2ACbvLRsaw@mail.gmail.com>
Subject: Re: [PATCH 1/9] PCI: endpoint: Introduce pci_epc_bar_type BAR_64BIT_UPPER
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: Frank Li <Frank.li@nxp.com>, Niklas Cassel <cassel@kernel.org>, 
	Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Srikanth Thokala <srikanth.thokala@intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Koichiro Den <den@valinux.co.jp>, 
	Damien Le Moal <dlemoal@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,google.com,intel.com,gmail.com,nvidia.com,socionext.com,renesas.com,glider.be,valinux.co.jp,lists.ozlabs.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-93653-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.975];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: 5ED47174C20
X-Rspamd-Action: no action

Hi Manikanta,

On Mon, 23 Feb 2026 at 04:57, Manikanta Maddireddy
<mmaddireddy@nvidia.com> wrote:
> On 18/02/26 3:27 am, Frank Li wrote:
>
> On Tue, Feb 17, 2026 at 10:27:07PM +0100, Niklas Cassel wrote:
>
> Add a pci_epc_bar_type BAR_64BIT_UPPER to more clearly differentiate
> BAR_64BIT_UPPER from BAR_RESERVED.
>
> This BAR type will only be used for a BAR following a "only_64bit" BAR.
>
> This makes the BAR description more clear, and the reader does no longer
> need to check the BAR type for the preceding BAR to know how to interpret
> the BAR type.
>
> No functional changes.
>
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Tested by: Manikanta Maddireddy <mmaddireddy@nvidia.com>

[...]

Please do not send HTML emails to the list, as they are rejected.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

