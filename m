Return-Path: <linux-arm-msm+bounces-8911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D14D98413AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 20:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E8E61F21F35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 19:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E776F06D;
	Mon, 29 Jan 2024 19:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MeQl1Sw4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB994C63A
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 19:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706557369; cv=none; b=YJuMD20iaBH4YzqP/GCs1q71arvA827Ej3XnCalnb1TqlQ9/tIY1/2fMVZdql3b429pAN8twKK6jf1kvp5ngLtH2VflzV0rPywh52aBUnJdQHOt9gmN/9ZGffoEUsbdUAuhTL30BJQXx1exp5jcQkYryg1VXErYxUQYbkZnsKGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706557369; c=relaxed/simple;
	bh=0IossWu4UpgVpMtMdcmHPu1ZZhD0JBLYr94Oq6BZXiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqR2g250UQvnWqcQi6wsdsry/9xYklvRJXHHph66EVdeuAmAkZUt+FrdmYJXPPYSkm4oeHoo9jXZciDG0ZMsohrarPUdB781SIBxauzdUGwbpF2+n6x7PJQhAjjcJDo2lu+CS96p7EB+6kCa2mhAnyubpytpbhN/lbarAUAtmfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MeQl1Sw4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706557366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6eMGjFNAQFg5AWGDSpwZ9ve2g+VcHkXFxxu/Em8ANwU=;
	b=MeQl1Sw4g4qN2d6z80K7aA2XoVSEY1TCv/Kr5FYBfqwmbFqD5dmeCJAYg3oK8wClpjd4Ak
	A/eHlgt/nFF2QDfgyUq1b57Gxzr1JPvSrPIJehK86KAVQRRMlD/mAJbYwcx52FQ7kl4kpy
	1tB1rEGcKyN6yp/zKnN375/WzxMLgBs=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-l_TWf_KnNQeyg2uEDRHsfw-1; Mon, 29 Jan 2024 14:42:45 -0500
X-MC-Unique: l_TWf_KnNQeyg2uEDRHsfw-1
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-4b78e56d741so570844e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 11:42:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706557364; x=1707162164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6eMGjFNAQFg5AWGDSpwZ9ve2g+VcHkXFxxu/Em8ANwU=;
        b=q5gwKdaG4N+OAer0S74JC6uMI8PebbTdTsxSzQYfMFeIVSqLrTxBF9Eqd3ehd2BgD4
         qWaB3MPXIluUjHO8dyICZ4UYd3sZEFMi1KD/cQJC7TgbhiSaPLw/QjP75MzQvBgJ5hAu
         kXsY2CmUBazrJWknW4lXCdBOP/sbISybb4e7t5Yy+Fk9z2KJJ0o5qXHyDwpTimJdCkHn
         n6vElr6Yc8/zWKn/eEw+ItoGgHLRK68mey2I17jgOb3L8E8skD1Zsw8a8pIhApJ/aNVA
         w6Ki407/j60MuH11YVZaawsau1PN5HO3vBcRR8seLwDujOJMHu7ypVwjSCLAmVcnn+3D
         3tGA==
X-Gm-Message-State: AOJu0YyZGuGesji1W9y/Ai0l0FFsI9pv73HXRDS56VUdCOIxfTXeJiJZ
	DFPKwQGd2RV3avC2srx0x/gtXpC58Z21vlCBHKtu6cQpGdEV4lSYI8yuGD8Tk3zYVGR6BPudlQK
	XC4ftTtrMXoxK4/Hf9nob97LtkKHNqEdCqiBxL0YN80uIdZvCv5OL1Gur/P2Muxk=
X-Received: by 2002:a05:6122:905:b0:4b6:d44e:2897 with SMTP id j5-20020a056122090500b004b6d44e2897mr2411891vka.33.1706557364498;
        Mon, 29 Jan 2024 11:42:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEThEh8Xkd7t3M3A0o/6ZDNQQdUgWUrOE1Coe2POYUY14FwHFSt1AWYC4c9IpcRASFz/2t94Q==
X-Received: by 2002:a05:6122:905:b0:4b6:d44e:2897 with SMTP id j5-20020a056122090500b004b6d44e2897mr2411868vka.33.1706557364144;
        Mon, 29 Jan 2024 11:42:44 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id pj2-20020a0562144b0200b0068c445b747bsm2266170qvb.59.2024.01.29.11.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 11:42:43 -0800 (PST)
Date: Mon, 29 Jan 2024 13:42:41 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Sneh Shah <quic_snehshah@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH net-next] net: stmmac: dwmac-qcom-ethqos: Add support for
 pm ops
Message-ID: <jnwylhbparw4uwci3epbd7th4izt3rnd3uzrnm5mdunm55kdoh@yyp4dprfh3sl>
References: <20240127130327.22443-1-quic_snehshah@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240127130327.22443-1-quic_snehshah@quicinc.com>

On Sat, Jan 27, 2024 at 06:33:27PM +0530, Sneh Shah wrote:
> Add qcom ethqos specific runtime and system sleep pm ops.
> As part of system sleep qcom ethqos needs to disable all clocks.
> This ops will be extended further with qcom specific features.

This last sentence sounds like this series is incomplete, I'd avoid such
wording if its untrue. Upstream typically won't accept things that are
building infrastructure for patches that will "eventually be posted".

You state in your commit what the code does (really it replaces the
stmmac_pltfrm_ops with its own), but only gloss over the why. I'd lead
with the "why". i.e. I'd say something like
"net: stmmac: dwmac-qcom-ethqos: Turn clocks off/on during suspend/resume"

Since there's already a handler installed for PM ops, I'd explain why
you need to change to new ones as well.

> 
> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 51 ++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 31631e3f89d0..cba601ee9e01 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -720,6 +720,55 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
>  	netdev_dbg(priv->dev, "PTP rate %d\n", plat_dat->clk_ptp_rate);
>  }
>  
> +static int qcom_ethqos_runtime_suspend(struct device *dev)
> +{
> +	struct net_device *ndev = dev_get_drvdata(dev);
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +
> +	return stmmac_bus_clks_config(priv, false);
> +}
> +

This perfectly matches the stmmac_runtime_suspend() function installed
originally. I don't see why you couldn't at a minimum reuse
that function instead of writing your own.

> +static int qcom_ethqos_runtime_resume(struct device *dev)
> +{
> +	struct net_device *ndev = dev_get_drvdata(dev);
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +
> +	return stmmac_bus_clks_config(priv, true);
> +}

Same idea as the stmmac_runtime_suspend() comment above!

> +
> +static int qcom_ethqos_suspend(struct device *dev)
> +{
> +	struct net_device *ndev = dev_get_drvdata(dev);
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +	int ret;
> +
> +	if (!ndev || !netif_running(ndev))
> +		return -EINVAL;
> +
> +	ret = stmmac_suspend(dev);

ret here is ignored.

> +
> +	return stmmac_bus_clks_config(priv, false);
> +}
> +
> +static int qcom_ethqos_resume(struct device *dev)
> +{
> +	struct net_device *ndev = dev_get_drvdata(dev);
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +	int ret;

unused ret.

> +
> +	if (!ndev || !netif_running(ndev))
> +		return -EINVAL;
> +
> +	stmmac_bus_clks_config(priv, true);

Probably should check this.

> +
> +	return stmmac_resume(dev);
> +}

Both the new system sleep ops installed here basically match the
stmmac_pltfrm_suspend/resume() functions that were already installed.
The only difference I'm noting is that you want to call
stmmac_bus_clks_config() in your implementation, whereas the originals call
the exit()/init() callbacks if they exist in the platform driver.

I would say "let's just make a exit()/init() callback for Qualcomm", but
looking further... (see below)

> +
> +const struct dev_pm_ops qcom_ethqos_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(qcom_ethqos_suspend, qcom_ethqos_resume)
> +	SET_RUNTIME_PM_OPS(qcom_ethqos_runtime_suspend, qcom_ethqos_runtime_resume, NULL)
> +};
> +
>  static int qcom_ethqos_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> @@ -838,7 +887,7 @@ static struct platform_driver qcom_ethqos_driver = {
>  	.probe  = qcom_ethqos_probe,
>  	.driver = {
>  		.name           = "qcom-ethqos",
> -		.pm		= &stmmac_pltfr_pm_ops,
> +		.pm		= &qcom_ethqos_pm_ops,

You effectively remove the stmmac_pltfr_noirq_suspend()/resume()
callbacks here, which do the stmmac_bus_clks_config() via
pm_runtime_force_suspend() etc during late suspend/early resume.

I do see this if statement, but I believe !device_may_wakeup() is true here,
so the clocks should get killed.

	static int __maybe_unused stmmac_pltfr_noirq_suspend(struct device *dev)
	{
		struct net_device *ndev = dev_get_drvdata(dev);
		struct stmmac_priv *priv = netdev_priv(ndev);
		int ret;

		if (!netif_running(ndev))
			return 0;

		if (!device_may_wakeup(priv->device) || !priv->plat->pmt) {
			/* Disable clock in case of PWM is off */
			clk_disable_unprepare(priv->plat->clk_ptp_ref);

			ret = pm_runtime_force_suspend(dev);
			if (ret)
				return ret;
		}

		return 0;
	}

Right now I'm of the opinion that this patch shouldn't really change
much based on that digging. Please let me know if I'm missing something
but it appears to me this should already be working.

>  		.of_match_table = qcom_ethqos_match,
>  	},
>  };
> -- 
> 2.17.1
> 


