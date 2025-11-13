Return-Path: <linux-arm-msm+bounces-81619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ED0C57C56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 14:48:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 028924E679C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 13:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A48722B8A9;
	Thu, 13 Nov 2025 13:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qog5kLiq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F731FC110
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 13:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763041470; cv=none; b=MgJUNSNUzCCbEzlX+zpZzg4bZ8XV5cC7QYBB6O9G/QNa3zvmAOR/uLQG6MPLsjAT70GM9+cb953Ud4M2OdCqoyOrMcx9E3+4kGbYR8vGc74H95PHTdtXRMwhpCZPobyOzqjuKM4yFk1cZxZGt27u1EHXn/kYMErkj31BEUQkkb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763041470; c=relaxed/simple;
	bh=n3yn/Qzs/10SowO+cV6IyFirX5NhFXBaRiN32HGuPq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ouJVOZXdU7pfMvfM0gnMWwceU0XihHulpJTHjpq+lLwFA9xMVLuwIN+dNlx7mhlkEe7CbFzOZiNuInLNJEv3YTJC2M8AwXDzC9Mh4JAoLaNayzgxDNuzAZclwDEKFi+Vx1ittZSARYfeFZDxGWr65glQVffj8xf0Uh7lOKwwk9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qog5kLiq; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-594330147efso697160e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 05:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763041464; x=1763646264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHk2bNA1OTHNC9vr3z2H2JeUdyy+rk3RBEHgiTzG238=;
        b=qog5kLiqxL98ShFKc/SwX9mP+f24xq3WCQrZs3mf/iNDSxNs9ehsTSA1uZY/PGDKU1
         f7s24wBBKmrsWq66ZvGC3M1zsmd5PSjUXxIKdkgYLyXyWY3F/svgRipvOnz7FDHyum5U
         ettEqYXWaNlhAVoG1sUtFdJkaujxjVsOm8/tQmJHYkRiRTP9gOYghyVph0ZDg2/A/M3c
         eIvhZj3sl2wBX4BhjLdX7LYq2F5xUnmcaFLfpofFiao355Vw6LVJIPG26l16TKfG6m1L
         KVaSgPP4an0HQ22Zxs1IIMtHs+YdVvdKgqUxLN3uzwoYUPD/NmIANVjkfqCHgIpT9Lju
         Y+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763041464; x=1763646264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gHk2bNA1OTHNC9vr3z2H2JeUdyy+rk3RBEHgiTzG238=;
        b=OAI3kb8yzosL4BUWm+ZIDZwtCHdyegWfkcGayGf8wEDp58K1IwAr1IIui/jGUG3Pq2
         MXFPo+kyn6S0d/i+6AGeMbLrZKzdjN/ggSMua6DTW/ScKEy9K0MMzm09QACnHHBCrcqi
         uc9JgtdHiMgIEDImchKl/wDOerme6sdn/xwzDl4ZNg1VKR1Yr0wow4B12M3cpOQJ3QVK
         DWoi8uhysmKyH4foJHX6iHsoRVaf/sWGzcjjNohEH/MwsUJDokILX/52LxWjnyVM/eYu
         nKeSGtDhm7uMY5o9JJ6EE2DSL8rjqaMBpuhJvMLS5MyhNdB6ztC9oRFsIrtxeBOqj941
         P37A==
X-Forwarded-Encrypted: i=1; AJvYcCU31FGyoaGloa5ombpauyTXf9/tc1tufm2kfe4vw/1KvGvk/YyRVWZ5VDRWq1N6UWzNOyZWkU1HTGxpCLnn@vger.kernel.org
X-Gm-Message-State: AOJu0YzCs68QEJkqSltARrIesh5DdEtBawGpeGi1iAAVnGJaoPEerk1z
	+RcLguK6u9y5Zi2JeyxiTtLyoy5ywMT9XD01FQArZI68En7+y9rZvKUcDyfrJnv8mA9XKN+bCYM
	SAjk1rUMxl3XPrz67uYgeLyrl6yIZfV62IVm/2Ty3pA==
X-Gm-Gg: ASbGnctUNh1YaDeS2cAo5jccvwJdfUCUxAIMYkS3bZfT3faFG3c/6ocUYAlsYTppkOw
	8kwVQRcJoReinlV/Je61kVFADnyUvbYygspokkS6W0E1MCOSAfJniXBYeOftqxC5Ph1acbmoD6L
	QkeT6M3CnNlC6swjyUk17FylZMO1pzrWR6Rj2L1MC/VBMWQXHeJnwndnYpFEiue6hDR81+l59V0
	owqcB1FISPMSOB5oKeJ2z9M5Je3YiqAazfvBXTAOoiU13eEO31v2zMEB6dM2wU1hfkYPYjpcOIv
	wKeaBXk4T7xL0brD
X-Google-Smtp-Source: AGHT+IF9+pE/QXln9/ghLnXjpwA3j+ZQdhSMaqAds1VqCnmNiZvVcKXj+XjAJW9rczSh1FwGivl5ToawEe+J2/Cq7qU=
X-Received: by 2002:a05:6512:6d4:b0:592:f7cf:9f6f with SMTP id
 2adb3069b0e04-59576df5dfemr2184445e87.14.1763041463584; Thu, 13 Nov 2025
 05:44:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-6-01d3e3aaf388@linaro.org> <14f95efb-0eb0-48ee-9132-df35abddfcc7@oss.qualcomm.com>
In-Reply-To: <14f95efb-0eb0-48ee-9132-df35abddfcc7@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:44:12 +0100
X-Gm-Features: AWmQ_blnqOG7JKELYBN2x3sW4StFzPpU8xniVnWCV7D_4z_I3CQNMw3VuWKeQ6A
Message-ID: <CAMRc=Mf03rYoi-C+kMic9RYZdk2vtAW5LDMYNMqg-H5vJccUhA@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] net: stmmac: qcom-ethqos: split power management
 context into a separate struct
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

On Fri, Nov 7, 2025 at 12:00=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > With match data split into general and power-management sections, let's
> > now do the same with runtime device data.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 46 ++++++++++++--=
--------
> >  1 file changed, 25 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/=
drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index 1f00556bbad997e2ec76b521cffe2eb14fabb79e..09f122062dec87aa11804af=
2769ddff4964e6596 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > @@ -105,17 +105,21 @@ struct ethqos_emac_match_data {
> >       const struct ethqos_emac_pm_data *pm_data;
> >  };
> >
> > +struct ethqos_emac_pm_ctx {
> > +     struct clk *link_clk;
> > +     unsigned int link_clk_rate;
> > +     struct phy *serdes_phy;
>
> What is the benefit of doing this? PHY APIs happily consume a nullptr
> and NOP out, and the PHY is already retrieved with _optional(),
> similarly with clk
>
> Konrad

Because it clearly divides the driver's logic into the manual and
firmware-driven variants. Just because we could, doesn't necessarily
mean we should just call PHY APIs with a nullptr if readability is
better when we don't.

Bartosz

