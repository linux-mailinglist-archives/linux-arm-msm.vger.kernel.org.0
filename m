Return-Path: <linux-arm-msm+bounces-19304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 215208BDF53
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 12:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CD6A281A52
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 10:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DF714E2F6;
	Tue,  7 May 2024 10:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ClqbICPf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3810F14E2F0
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715076244; cv=none; b=mZW6PnjtvoF2tPx3JM3eTQFWc21BQNy9nxqFl/euW2OvxC6GSPiTk8xErbBhn28+azpEgjRmGzJMJ4w2ha9vEkfwv6ntv5OvQUZykJmBbOae75/8jYaVNUi7cL9yTx8DIPEnt8lIAWWrEjDcPeWp1i7vViCOFOcbgL8TEFmN+tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715076244; c=relaxed/simple;
	bh=jnbmoIfEkquEEjiJBAjqdCDBxOD1+Yzt7A7OKiFlJfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L+ToFRVU0uv9CJKQ2xtvVSqSwDTYZYhI0lnm8CTuS4VT6R15sHJMtsbUOxM0Tw/KPPj1Fqp5hVkci4XQBf5SloNPNNEtfemAb/zpzZv1hWLjjJD9bkuDs9cBXSXw/YzFZNc2nCnCAoVdCGM8sXGKy2mvDTZUMq3Zc9THRnAgUYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ClqbICPf; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-de5e74939fdso2377948276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 03:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715076241; x=1715681041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENlfgQ3ADPUMWuBuiOLhnFoQNEtfud/j+QDtLaNAUG0=;
        b=ClqbICPfGWs4b3Kil8wr9qUk9sNcSadQx7MKrglRxSUZNtKHMoGjJUbwrtS+2iOZJY
         eadxodiGOSOVLNQMyvANf317P6IFUtwTyUHhLOt7M7tvuVa/fwz9wN/+erbwFLXG2g2y
         1oH8B115XICgrEKBcpZvfl1GSSwX37sXhcPF1RBF2im4pDZLcSScd1kn3Gou6n+G+CNJ
         MDSKhUcbfeueiOci2vFZoYnyvQC5mgekuBzf5piN9ZJrWOwhVArEPla0MNH3XSuSPEQN
         u87VP4F0SjIDS3IEoI6MmIpP0Ep7GIo0z+K7dW7iDrf4EWBDrubFEtAe81yZDOMJhAG1
         LZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715076241; x=1715681041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENlfgQ3ADPUMWuBuiOLhnFoQNEtfud/j+QDtLaNAUG0=;
        b=BC8OwLHp5w4rVB8EE57GruB5t/tBtLhdHBgZ6jYJRw25grHyVcayXzW8HGK03HpIQS
         W74w3Cu7+jdgCAOIT8mWQTR5nc8XVsv5bei1NlnleTQdTNjpvSIdBWLNg1PcJ6ETKK8B
         MsdEFs9JJdYV1eCUb6DC/bCI4QPy40uW6YnmqIpZkQzcnjyhUiDgcCqdOZ8v4erF+M44
         7WO16LXTZfRiLY/gKAYsUNmwXLlA8IrQ65IsX8PoQ2bAk0G36JkQPLui0V7fz66MY88l
         GwYgS5S3G+kT5eWNxpwfx9zTxHBRIdO6I0w7Y0V/BB4kMcVrBEB7mwuPnAqifJnhwyAN
         FsfA==
X-Forwarded-Encrypted: i=1; AJvYcCUrXcWNLyVAv3nrJTBAyJCbcfnelonggC4Ze2YjbuzSf6pqKiH8bWq5U5yWy4lcCLtN3YdJcWojkXWMpF6j7WKFfFW4gRith2OYqvlFqA==
X-Gm-Message-State: AOJu0YwOR4bORzjqii45xxmU9MaIcqumDiTJ/cExg4ke9xbDhjVZIKaE
	uw6eFE+caUYSplUE+koRpjo1cR1os5BS5bnbn9/soozzvvXtB3DOcOX11oKHlBBWSszhU0V2c3p
	xe35+ChVsuo5a4P8zxKB6c7Uyy8oYJnMdBnoU0g==
X-Google-Smtp-Source: AGHT+IE6RbboWA6zivUgxElWhiInYBOoZKZxCooBjJtVLVKzpcY065ewr27Om73FjNB7+c1CsbFfoFINBaR1I1fIna4=
X-Received: by 2002:a5b:912:0:b0:de6:3c4:c3a with SMTP id a18-20020a5b0912000000b00de603c40c3amr12223334ybq.10.1715076241415;
 Tue, 07 May 2024 03:04:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 May 2024 12:03:50 +0200
Message-ID: <CACRpkda=a3X=jyZKQoOFrfgzpE2C+rZ9UC1VDnCvGL7QP4x4BA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] PCI: controller: Move to agnostic GPIO API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Yue Wang <yue.wang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xiaowei Song <songxiaowei@hisilicon.com>, Binghui Wang <wangbinghui@hisilicon.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 4:22=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> In v4:
> - added tag (Mani)
> - fixed a polarity bug in iMX.6 driver (Linus)

Looks good now. The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Perhaps the use of  _raw accessors could be avoided in 5/5 by some
elaborart polarity quirk but I'm no perfectionist and it can be fixed later=
.

Yours,
Linus Walleij

