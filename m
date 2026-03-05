Return-Path: <linux-arm-msm+bounces-95575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AA9NEsxTqWmG5QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:58:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AA020F28B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E77773012C76
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 09:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D4737AA98;
	Thu,  5 Mar 2026 09:55:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738673793C2
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 09:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704558; cv=none; b=Qy6YwFvLy0fKw0OdZ4cxYFGnn7GbDcwmWqHYvV2x0vNDql65j3ygHVtRyCcF8cBCXhO9ixGCjPcKTwe4lepLq+vypOnMdf9fdlXK8qPg+URbfTqM9ANDAIuFPWtar/QTeWGgxmnMZOVfE1lbYxDRivgz2MXb+4nwROK0RcEbeP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704558; c=relaxed/simple;
	bh=508+zCdHt9MWfUxEq50brZahkkEiVxDT5BqlILcd3+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JnXD3LVtpKYKw6LQHjzprf3ep/RVqUWUv3aEQV0//qfo38vxO09x13WkWGjP4r1O/P06Gc6Iq0yKeh5BN8i6NHopDStXVLAIrF3i/aa2fCVy9fiOT47lCmtb/aVMt0itfsRM16Gg7xJOlQCh9HkEMjl2bUmHcaLMvCkHDBq3LEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56a9076813bso3145268e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 01:55:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704556; x=1773309356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cg9EXYcydfZ+ulIjzuaopPgTp0XFzaHPOEgk/rgt7WQ=;
        b=DIW1QJGE33qlAJevzllcGYqETekH9FwgbnwScYqQIW0Y+XIm9HjpPTKxETqYrzpGAk
         j9bdRuwD15f27VvVrCH7hWDkbaYBcp10N6Lrn8L57/ZpiI5gM+V7Xt4CDXxsi79ruv1N
         nfyr75yawuaUJyrbMca/EAgZcSpnbxXRA1w3hRbmMoBpz1HRwPIhHv9hjmW7sqAfFInC
         BySl/YZYjcyrwxKzleG95tkNhYVfbuM3DYjem+xZx9w9DQOkLyZMWjTrVwiniP1WB3/U
         j5jOn0YXzbvyNw7XI/WvFF40N30Wmuhx/jUUR11DfbOzpEz3sKU8+6if7PH1RYz+JR/7
         HWzg==
X-Forwarded-Encrypted: i=1; AJvYcCUNSvwbJOb2Y//2KjF4seFXAOPsjmPuWxi2XLs7ixVRZ11Hc7/Av1rSRI1AIFynYLiNT3nL6nJSSNAd0P53@vger.kernel.org
X-Gm-Message-State: AOJu0YxcE6JDJLeVi4oAMbdTpEgDOIW0rvtMoJjrrF34WzIwOUVsOxg+
	Lv5mfk+dRJGRKeqkvLGx1CkuptU1mvCT0JbikYuHA8FvzjTk2s8z7gtQ7CCLqAIg
X-Gm-Gg: ATEYQzys3qzarwnt0uq89pnLi24GhlaaZKkcBmI8Wx4zb1i1+MeC4/JhgisE7vhw3wT
	V1/DLJ0T5IQM4pA/SbNiz2WtFQpSkofmcA1QioJ4ZarpcHaHPSRTkdxibMT2gSCNh28iPbu2T77
	rwpeItHQpLT53Pw0IEL5pwpRWoOMQSvK+4KUclse1ggp4HvU+zymvHi7GFB5t09dbC1crvV//AF
	VyC1U/qckKhUFhXFLEtYPGyxWPOFHxXJP1zHQimBnib8/vDUdF24KxdOwB7cq6gIUZHOYa6InvG
	TzvjHQrp0a7KZ8l+wMfemmyv56DEhbA8nIZGFc6fN+oZhzP+fMvDL2gO58z6y4upLstZ1Xo+5kj
	+U5NCmuVYGQslvsvXq1k4phNfE73JcC7ZJLgsh7UQqgbL/AOZxrXaEPRP+F02PfOPiBrt90HH5S
	UJngG6bXeJkgwxxDUYMjSg2oZOWeSXZwv3OUaRjDlKnc2QHVK3Xehx+l9pqvWD
X-Received: by 2002:a05:6122:a23:b0:56a:9841:9f81 with SMTP id 71dfb90a1353d-56ae7603d05mr2346156e0c.6.1772704556425;
        Thu, 05 Mar 2026 01:55:56 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91b8c7ddsm26134751e0c.3.2026.03.05.01.55.55
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:55:55 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-94ace5d0e39so2317078241.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 01:55:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWDfqRrAzfrqOepKhhhsOmpG54mCa3xxjhBTQ215Mk/r9UcPvedbiDT/QHlh2VGFvZ4Eiu9NFfj0dYN5YG@vger.kernel.org
X-Received: by 2002:a05:6102:26d6:b0:5fe:c4aa:10d6 with SMTP id
 ada2fe7eead31-5ffaaf7c9f3mr2333684137.34.1772704554695; Thu, 05 Mar 2026
 01:55:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1772643434.git.geert+renesas@glider.be> <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
In-Reply-To: <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 10:55:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
X-Gm-Features: AaiRm50TZMfTdXxkme8-hNv5QLySSNWDLayLbCjX-hPHmdjBiItNwF_qP7aR9JM
Message-ID: <CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
Subject: Re: [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Marc Zyngier <maz@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <treding@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: A4AA020F28B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com,samsung.com,nxp.com,pengutronix.de,gmail.com,nvidia.com,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-95575-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.966];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

Hi Konrad,

On Thu, 5 Mar 2026 at 10:33, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
> On 3/4/26 6:10 PM, Geert Uytterhoeven wrote:
> > Unlike older GIC variants, the GICv3 DT bindings do not support
> > specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
> > series drop all such masks where they are still present.
>
> I'm having trouble finding where that's used on pre-v3 even.. does
> that actually get processed on the older iterations?

I had noticed the same, and had asked maz on IRC.
His answer:

   "so far, we have never seen a GICv{1,2} system that didn't have all
of its PPIs
    connected to the same set of devices."

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

