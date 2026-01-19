Return-Path: <linux-arm-msm+bounces-89685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F104D3AAFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 15:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5A80B3001189
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 14:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4248C36BCED;
	Mon, 19 Jan 2026 14:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EX+6RBfH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069C736B075
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 14:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768831202; cv=none; b=kcovyn2Tei/+g4IeeRmkXouWXGvH6AiFpfcIPJewtFJ2JKOR7qXHrf+RqJtVwJ8bl5aEjhfiCgaE0ENjKva4bpLGYzjbE8GKL42Vw2jcGc6//wrwDRVTlybmTsqzGR8St3mS7iolLgrTIkRhNzkexfPcAQr4B0DS676hJVbnYOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768831202; c=relaxed/simple;
	bh=MIrQUfbJ2zL+AhG7FyLFIXu3ha5qK8PBOAlkOqBeaxM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mWaGEuNuNvpJJZEFv4D2YTP5f/LuypNr2oRfThgPs8ZkSltgSrwmHHXv74Jsi21GkVoOHfFNu+eSn/4Yx8AiKxTA1EAz7hNT+5+PunWBmLEPkbuzil9rmU2/b+Jwe/9dmWrneL6UPzJMzVDOa/X9M7sQlmlUfW5e73vRx6qEWWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EX+6RBfH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B40C116C6
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 14:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768831201;
	bh=MIrQUfbJ2zL+AhG7FyLFIXu3ha5qK8PBOAlkOqBeaxM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=EX+6RBfHN6arCnN820LmhTyye+ap4LvfT2Vs/A2m6HXJ4BHOWpLAKyRD74+KgJuaL
	 VUR1Ex6JYPUkdQJ6EhnWtpYkQi6tUSQ8l7P0CNvl9QChWXNTJHOgvcK4TjJrI1cH5x
	 E8C3plpVN9xmQM6N4dqPx6PTgTrMK9ORvQv8LobxTG9WLBDQwvEZsSj1YoJY1in/WV
	 IAeJVuZWYuMn3i/0puonnl4zJtICLn9X/ym7f0mTD/ZBibz/+6y5OqO0EDrbBY6Dua
	 5METEPk2nVfmmG0P34OxCytQmjkAxShRvtq54c0eKQTN2/Cb7FvQlnA41gP14L1wTQ
	 LnUuzUGyhsg/A==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59b710d46ceso4453853e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 06:00:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQy53tjoH/uepKwnVJ8QKcZZLLS145qvQJUaudT1IS1bY6w1o1+GMXEz4J++SdViKXJWUXjsblTs7D8jBL@vger.kernel.org
X-Gm-Message-State: AOJu0YyzU4+HWQyfH/3P06h6VATl3OfM/AXq6WENTS0XFyPj+1PJnb2l
	eii/8EWUneXvmZGdHzoMpJ6FqmnZbUkdmioxbYCxMode8bi9ls8Z42rfoehaYA7jUsEpDgCgWUb
	5OuwnyZiCRDhRS6xoPwPwL4i2ZnlE7oslFEhspx/ioQ==
X-Received: by 2002:a05:6512:3d9f:b0:594:347e:e679 with SMTP id
 2adb3069b0e04-59baeee6123mr4166539e87.43.1768831200472; Mon, 19 Jan 2026
 06:00:00 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Jan 2026 13:59:58 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Jan 2026 13:59:58 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <E1vhoRx-00000005H1H-0YoL@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk> <E1vhoRx-00000005H1H-0YoL@rmk-PC.armlinux.org.uk>
Date: Mon, 19 Jan 2026 13:59:58 +0000
X-Gmail-Original-Message-ID: <CAMRc=Mc-URPkVzEc5Cu54bA021+XaDh3-kZZDSKyNt0V1YQB3Q@mail.gmail.com>
X-Gm-Features: AZwV_QgrQLlVOMTh-pKGr5woCaDOT6WzYHt89q8m_3zdKt2vs_AoPCBMlqv3zPI
Message-ID: <CAMRc=Mc-URPkVzEc5Cu54bA021+XaDh3-kZZDSKyNt0V1YQB3Q@mail.gmail.com>
Subject: Re: [PATCH net-next 01/14] net: stmmac: qcom-ethqos: remove mac_base
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Jan 2026 13:33:41 +0100, "Russell King (Oracle)"
<rmk+kernel@armlinux.org.uk> said:
> In commit 9b443e58a896 ("net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
> modification"), ethqos->mac_base is only written, never read. Let's
> remove it.
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 0826a7bd32ff..869f924f3cde 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -100,7 +100,6 @@ struct ethqos_emac_driver_data {
>  struct qcom_ethqos {
>  	struct platform_device *pdev;
>  	void __iomem *rgmii_base;
> -	void __iomem *mac_base;
>  	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
>
>  	unsigned int link_clk_rate;
> @@ -772,8 +771,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
>  				     "Failed to map rgmii resource\n");
>
> -	ethqos->mac_base = stmmac_res.addr;
> -
>  	data = of_device_get_match_data(dev);
>  	ethqos->por = data->por;
>  	ethqos->num_por = data->num_por;
> --
> 2.47.3
>
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

