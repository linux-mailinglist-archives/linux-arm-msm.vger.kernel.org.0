Return-Path: <linux-arm-msm+bounces-1208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5827F19BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 18:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBB702816A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 17:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C56A208B2;
	Mon, 20 Nov 2023 17:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="OWwEBM9P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F37B1BE;
	Mon, 20 Nov 2023 09:22:31 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3339640E0031;
	Mon, 20 Nov 2023 17:22:29 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Giv1lRArfQMf; Mon, 20 Nov 2023 17:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1700500946; bh=T5VVznuzCd2a8UX5KPiD1fC5qSKUkPIUpjwSGVtPbk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OWwEBM9PkqTrnSvy4yDjYJ0ZhJryM/rAtmW/2s6oM+uOMLP0V9mr1ejXHu0BEE53e
	 suV84gojqesjvwuhW3/YAOjJ53YgayY1R8mlJZC1Uw34To88V0MHACS8KPGph30ooq
	 eA//+1ShMxFZ7UdW3O+RxL59JN+yv5ZKCJsavenToPhh9ZWGortQGauczkkBwUevb/
	 YNoKrf59reRxf+zjxpMIzTjAbdFEC/l7SGA8Urv7knXFnfoa+8TO+z7WO/HvAW+BMg
	 MtW52+j6bh37JbYXT140+t4iZL0ZYN9pOeqK7CxFotFGUdt+M9IdWM3m3IYkAQp7/d
	 eDKZBwSqtlOwk73mKp+PdthwPavh4ySD60MXTP/3VgPdq5iUCh0BUhIu3BgiefrED7
	 G0tsdv06DhMl1z/ntDDxJubu6smwekD53rIJQpZ1q8eaa4+IYLTQ6fUAGIz9nMGahN
	 Lscr1Nn0M0uV1rdbKoUxb2So+egniBwR42zxfHYPq0WEzGawD7zqygG1oECSILT6OP
	 JHhOLTRu8N+oM9f3FCR1Wbc6z7VzUPSLVsyRQijLtVK0qC3ribaI3rufTRfHVObTiJ
	 pJJND1HyEYqIrI2aK/tFe9D3cFDkIMP/dBZpa4Nb/YPDJ2NvsDW8aKkBTjEVk4/kmU
	 DIUtoZbg/SxzMYPiFqR1xsnc=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BB74940E01A5;
	Mon, 20 Nov 2023 17:21:46 +0000 (UTC)
Date: Mon, 20 Nov 2023 18:21:45 +0100
From: Borislav Petkov <bp@alien8.de>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Tony Luck <tony.luck@intel.com>, Tomer Maimon <tmaimon77@gmail.com>,
	linux-aspeed@lists.ozlabs.org, Tali Perry <tali.perry1@gmail.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Dinh Nguyen <dinguyen@kernel.org>, openbmc@lists.ozlabs.org,
	Nancy Yuen <yuenn@google.com>, Andy Gross <agross@kernel.org>,
	Joel Stanley <joel@jms.id.au>, linux-arm-msm@vger.kernel.org,
	Stanley Chu <yschu@nuvoton.com>, Robert Richter <rric@kernel.org>,
	Jan Luebbe <jlu@pengutronix.de>,
	Shravan Kumar Ramani <shravankr@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
	Johannes Thumshirn <morbidrsa@gmail.com>,
	Tero Kristo <kristo@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Patrick Venture <venture@google.com>,
	Bjorn Andersson <andersson@kernel.org>, linux-mips@vger.kernel.org,
	Ralf Baechle <ralf@linux-mips.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Jeffery <andrew@aj.id.au>, James Morse <james.morse@arm.com>,
	kernel@pengutronix.de, Lei Wang <lewan@microsoft.com>,
	Stefan Schaeckeler <sschaeck@cisco.com>,
	Marvin Lin <kflin@nuvoton.com>
Subject: Re: [PATCH 00/21] EDAC: Convert to platform remove callback
 returning void
Message-ID: <20231120172145.GHZVuVqXpKtX2nbTE4@fat_crate.local>
References: <20231004131254.2673842-1-u.kleine-koenig@pengutronix.de>
 <20231120162054.haryuye4qedlfd7j@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231120162054.haryuye4qedlfd7j@pengutronix.de>
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2023 at 05:20:54PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Any news on this series? Would a resend help?

Nah, lemme have a look.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

