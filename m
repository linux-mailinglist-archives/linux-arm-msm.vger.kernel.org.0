Return-Path: <linux-arm-msm+bounces-81618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 174F7C57C66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 14:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B02C634510C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 13:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECF420C029;
	Thu, 13 Nov 2025 13:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="b/rzjPAC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D38020B7E1
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 13:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763041320; cv=none; b=WbTGOEjtCja5sIxsBhD/g4aiJTmgQbmrSVSE8laVH9ERBwMmodRzTHw4EOHHhs/5IXXCf0yzceBhhVrJPJuEN+0pEZc1wTmVq8T3qTpz+LCaSw9By/mvWDAFrUSyRq0G6uCuGO3gz6pgG0GtHCPv4MbsBz2shOI6JNDxSNsTFcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763041320; c=relaxed/simple;
	bh=GLqncc5/5zGkwI1+bv2pb78gB9RyxcsUzYNiDGa3NKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OdvNW8qMd7bBn4WL+W6daXDCSU1vn3WOrhhjGFbWkZ5VNbHgYhqlbiUQQGOJYbjt2wvGA0rZ3FgPKqtbrTEKZRo4FZTCZmCQL5U3miHZUHyTEQvEOKIJI/wERKzJkMi1kcRZMeuFFmf9s3LIw7GR+lSKrB19yWF1ph2ChNnnlOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=b/rzjPAC; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5957f0218a1so803000e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 05:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763041316; x=1763646116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6YFPbYQaXtcm5LdD7/GneIOXBdjWXCgrgn8VVQE3So=;
        b=b/rzjPAC2S040culAnBENk6/YqMZYIyWQXPQcGegmnq623g+PTO4bW4p6296vA6Bi3
         sIXhx1kGeJZd7sjOKnVTidd95r+HgvMYD8HPUFdoowbtK9TUF74eKlL4XWumluttlLFh
         d9snIpjWWVQ+U+D+OHH9Ub8OvHpAeTjm6kQbx4OTdPAgZzhwgVTdYVCh9SIOkCVP2ItU
         AwKCD63BYqtSg7h9r7n8CXvDBENBGBhS+AeUUgXWip4Z7tAQ7VJY0LneGzVXKsWEtld9
         N4bjXEODBpkijQO638Rj5I7waG0ri+WKEUdYsdO/c38Gn8mZ698LjiRfhskBSDqCTmWD
         aU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763041316; x=1763646116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e6YFPbYQaXtcm5LdD7/GneIOXBdjWXCgrgn8VVQE3So=;
        b=oYHw0RKysCD29bum0ucBY315gcSS73VQXgHg0DesiPjDzvrBGr+VJ4EJ+vo2x3bH5a
         Z+tCaMQDbXoLEx9i639A/l0wT1As7xhdZ5FBiiFPBkq3ZOOFzOZjVYLUrDh1EezhoyKy
         YLWONi7gyvXdzo1mAKryGjf+jgwdxnnyYOGgN/fJjofZuliWHzDBzOfEG0ngKxCmJZsS
         ItUKrj2NqwimU/m1M6lfIiPkxnc8OQjbHUvH2ghvVjTCDD203lzUbYuMxvF/U+ynFnPs
         cUW2IDo5AJKmfAHs/AFFElOhEBvBkyp6blO4d7BmQvEsaVOJKpYcC8r1P7CVFkvgKWUf
         4cQw==
X-Forwarded-Encrypted: i=1; AJvYcCXj6ecCrmvtp+3hCh1t94EFfxfkJRRPoOuEDQSGfSmHOMm5WyD71jb3LWmaXQaT//pi3bCUYgcAcQcsg1s3@vger.kernel.org
X-Gm-Message-State: AOJu0YweeOWHCsxiL1t0v0LdUqdI4/sVa5K0NTM+t8lwa8ZG01r0Lq+A
	t8x0ptUvKRL7JbBM4h5XRtmWrUjIVh82538WuX/VJQuFMjYE4XVMBmStN7lIPK4J0diA5AwiPgn
	bPlhCKhyhN8eSOeA6xmuX1ut70cQFN6zTy1a4MMfUHw==
X-Gm-Gg: ASbGnctYtS8qX1j6sdiqo+1nWSYw0QAliPcZHCFCRcoQjR5lrsVys5YLCARuiOgFtn0
	Q9mOh9QlakJ4nE5EdWAqauvItFtqy3JaoAFFkNQwLRahlI19XmmmKRMobUlhRdeuvc+cJ8HkAJh
	EAijhbzfbPWZV17peXygbFXr0ZXkXsCjxDTXiBmqdhReWiKCRISd9ChvdH3IaL+40JQ5fKfwTt6
	IUOjv1k3YHmbMjIUDpTkFYbq3dzkhspfnXtwiRNlRJdXFLE7VT6++NZGoWls0acAIaXe9oj8Smu
	OMbdouF1XhjwTY4G
X-Google-Smtp-Source: AGHT+IGgWlCG9kIv5RM7lpIk9LC7ddziZ8QniI5XBDNtHyHFdpWvdUKYxGgON08x+t3awJ+Cz4M6eIo1aCJcpUc2eyg=
X-Received: by 2002:a05:6512:3c8c:b0:594:2fde:a159 with SMTP id
 2adb3069b0e04-59576e552camr2521011e87.43.1763041316428; Thu, 13 Nov 2025
 05:41:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org> <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
 <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com> <cd7c0490-a2d6-4885-aa36-ee1492f107b8@oss.qualcomm.com>
In-Reply-To: <cd7c0490-a2d6-4885-aa36-ee1492f107b8@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:41:44 +0100
X-Gm-Features: AWmQ_bk13TVZ2MEYPAt7pfoLg7e0lkaPcfsA9km-tpYIh11AXtLgw1MABlXNgK4
Message-ID: <CAMRc=MeuByh=N_-F2+zPiqnh+Qp9u97kiMheLJ-xxcSZSy+_tw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] net: stmmac: qcom-ethqos: use generic device properties
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Matthew Gerlach <matthew.gerlach@altera.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Romain Gantois <romain.gantois@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Shuang Liang <liangshuang@eswincomputing.com>, 
	Zhi Li <lizhi2@eswincomputing.com>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
	Samin Guo <samin.guo@starfivetech.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S <swathi.ks@samsung.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 2:33=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/13/25 2:18 PM, Bartosz Golaszewski wrote:
> > On Fri, Nov 7, 2025 at 11:49=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> >>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>
> >>> In order to drop the dependency on CONFIG_OF, convert all device prop=
erty
> >>> getters from OF-specific to generic device properties and stop pullin=
g
> >>> in any linux/of.h symbols.
> >>>
> >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>> ---
> >>
> >> [...]
> >>
> >>> -     if (of_property_read_bool(np, "snps,tso"))
> >>> +     if (device_property_present(dev, "snps,tso"))
> >>
> >> This is a change in behavior - "snps,tso =3D <0>" would have previousl=
y
> >> returned false, it now returns true
> >>
> >
> > This property is a boolean flag, it cannot have a value.
>
> Every DT property may have a value, so this is not as obvious as we'd
> like it to be (IIUC - unless that changed recently)
>

That's new to me. I thought that if a property is a
/schemas/types.yaml#/definitions/flag then only its boolean form is
allowed. The fact that the dtc can compile it with a value doesn't
matter as the bindings are the higher authority for DT sources?

I don't mind changing it to device_property_read_bool() but I'm not
sure if we really should.

Bartosz

