Return-Path: <linux-arm-msm+bounces-79762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A22C220F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 20:48:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F4E9189E56B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 19:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794BC327213;
	Thu, 30 Oct 2025 19:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="CvceYUOT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C996A318133
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 19:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761853685; cv=none; b=CPWkaG0zBOpIqPqzF4gpHyCLmBULTGki8psg7Pa5NHBg26fkllEDaiUdhDR+Mek8WxeTn7L9UrIFnwzQ19poH7g3JiiEnLh+SE2U0dT7vGh14279AkkIyMIGGIr/eZwo1/q4nQQYM/L37MEXAyfVzUK+KWy4VSH5reS7SAcMFA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761853685; c=relaxed/simple;
	bh=V4gEPAw7c1Xo4RZkpTqr+1GnVCaVV1FvxqrK4WYDs+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mdkh1sRSPnJuRJmSM7AanI0m4GyOfBaaX75SX62B14aPafm0sDID/boutEv/yRXZiKE+LgLoSfEN55ohvH10d7ATiQMC2spIngOFX/7V1AZ9GtXLGjSMXZhNZmsTbzqMip8CzSgrgJeMYTfxo7zrx787yZD8qShLjKFHZXuZ41E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=CvceYUOT; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-431da4fa224so12146265ab.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 12:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1761853682; x=1762458482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NyHHMh5+Ig5nWuJhvXvhTG1NXrgVmuFvDzkpLb+CBVo=;
        b=CvceYUOTB+FRho/0jLwdeDHwLRh0JG9FQ4viQzA2wIjA4GcXLQgp8ubJ2bXYOwHKkz
         iWmHK/5+6+kTKZTtzsr+EmXoYyi3uO7UpILcotArh4WaOGFlbblagdWvVEKEDJqHLhAv
         CSPc9CK2Ly2/y8hbt7EIv2vrLk4SKj5pPOUIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761853682; x=1762458482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NyHHMh5+Ig5nWuJhvXvhTG1NXrgVmuFvDzkpLb+CBVo=;
        b=b3qDw1NLogvjQbpMT+cNIcmp4Ss2LUHlSbjDIidIf2HeJHINEFUrc32XW1clrPf0AG
         MPv3PsmKIPw3JurS0S9D/ORr4nYi389lCsvSRaHoJV8PyeIBFE6xpgjG4FUQDjig3vHd
         KmADKH9yH7U0cLVuckSgBTcNtRoBZS4XKalI55Q+EgrsijqxN0z90nbYvr9s6tXN7BQD
         34qrMO31pd8eP3525GjceWSZNBLW1SzLr6JpaSnnanJjUe2sXLdo4/hhGk+m+xQYuZX8
         aIG6XJptPKPSh7EXAsac32oYaaD9T3gvoQLLpTwrCZ42P0OImzUJWBeIaiXeSCW0uapO
         4AlA==
X-Forwarded-Encrypted: i=1; AJvYcCXD+ZTxRF9ABNhK83ktBzvgYMsfQkHrM+NN+hHZbo+OtSp0Y5Mu4bXbDvyJfYaRjvj6mrmGLzkL5JKy5k6j@vger.kernel.org
X-Gm-Message-State: AOJu0YzB1y3U8B34IUAbBQT3gX3/vYVAbp96fRwqsGIhokDWuH6ylgt0
	IahhLmwaJxZD6mQ6E2xBFKAphCHfvLcEHJZwSydFGnwXrUTYbepU61CACFGJNUE9/A==
X-Gm-Gg: ASbGncse7UxsvBAFSVDZq6D2/wEk1Yl75CeUksV+2XSVfxENYz7Nh49U1qH12XyqVL2
	/mhGTG4op40L+hmuaskNq21M8gZBav0lXHUMHroihUU/gGgLVyEhTyxIfX6BwTKtM4Ei+1UTFRU
	x9uLA9o5r9Z8G+MjPGlGqkx1ru3GyGZzcowM1KAh84kdzA61h6Lmblp8yDxcVianln6HQ3hv3be
	6Ua3GUxYwANywkT1+oYTBbiUdpEsOrYrRhbtnGAiPVdPH2CykaOsdqiyRGq0ev9lbnK5L+vZmxJ
	vikNOvXH5qRjEojVRlp5zV07Dt9nvb9A+d7922qQlBiSpYCkKE9CZFz8oRCmWedyk3a1OiiSxb/
	RGRMPTlJcYvCCDeaWttEEhy3Tt5UFCdTrvlVjKHCRAhUY3pC2EccnSObZ6JAjL8JX041cQgTl4O
	x0RZ8m/vpcI0EWc851JGV5RnTfP3AoEAi7tB9yaCc3PrXM/w==
X-Google-Smtp-Source: AGHT+IF4U576EpcuWMn8dengv2WlARr6njaCWT9h6oVZ6fzg/nO5M7RbgoKh1r0euu415UbWbr61ag==
X-Received: by 2002:a05:6e02:339d:b0:423:fcd6:5488 with SMTP id e9e14a558f8ab-4330d1435a8mr16944295ab.12.1761853681791;
        Thu, 30 Oct 2025 12:48:01 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-5aea995e701sm6883943173.49.2025.10.30.12.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 12:48:01 -0700 (PDT)
Message-ID: <6cfe0af8-77f9-4f3d-9494-17f4defe6558@ieee.org>
Date: Thu, 30 Oct 2025 14:47:56 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/4] net: ipa: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>, netdev@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Roger Quadros <rogerq@kernel.org>, Alex Elder <elder@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Stephan Gerhold <stephan@gerhold.net>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
 Liu Haijun <haijun.liu@mediatek.com>,
 Ricardo Martinez <ricardo.martinez@linux.intel.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>, Ingo Molnar
 <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Michael Nemanov <michael.nemanov@ti.com>, Kalle Valo <kvalo@kernel.org>,
 Andreas Kemnade <andreas@kemnade.info>,
 Roopni Devanathan <quic_rdevanat@quicinc.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20251027115022.390997-1-sakari.ailus@linux.intel.com>
 <20251027115022.390997-2-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20251027115022.390997-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/25 6:50 AM, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/net/ipa/ipa_interrupt.c | 1 -
>   drivers/net/ipa/ipa_main.c      | 1 -
>   drivers/net/ipa/ipa_modem.c     | 4 ----
>   drivers/net/ipa/ipa_smp2p.c     | 2 --
>   drivers/net/ipa/ipa_uc.c        | 2 --
>   5 files changed, 10 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
> index 245a06997055..8336596b1247 100644
> --- a/drivers/net/ipa/ipa_interrupt.c
> +++ b/drivers/net/ipa/ipa_interrupt.c
> @@ -149,7 +149,6 @@ static irqreturn_t ipa_isr_thread(int irq, void *dev_id)
>   		iowrite32(pending, ipa->reg_virt + reg_offset(reg));
>   	}
>   out_power_put:
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   
>   	return IRQ_HANDLED;
> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> index 25500c5a6928..95a61bae3124 100644
> --- a/drivers/net/ipa/ipa_main.c
> +++ b/drivers/net/ipa/ipa_main.c
> @@ -903,7 +903,6 @@ static int ipa_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err_deconfig;
>   done:
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   
>   	return 0;
> diff --git a/drivers/net/ipa/ipa_modem.c b/drivers/net/ipa/ipa_modem.c
> index 8fe0d0e1a00f..9b136f6b8b4a 100644
> --- a/drivers/net/ipa/ipa_modem.c
> +++ b/drivers/net/ipa/ipa_modem.c
> @@ -71,7 +71,6 @@ static int ipa_open(struct net_device *netdev)
>   
>   	netif_start_queue(netdev);
>   
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   
>   	return 0;
> @@ -102,7 +101,6 @@ static int ipa_stop(struct net_device *netdev)
>   	ipa_endpoint_disable_one(priv->rx);
>   	ipa_endpoint_disable_one(priv->tx);
>   out_power_put:
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   
>   	return 0;
> @@ -175,7 +173,6 @@ ipa_start_xmit(struct sk_buff *skb, struct net_device *netdev)
>   
>   	ret = ipa_endpoint_skb_tx(endpoint, skb);
>   
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   
>   	if (ret) {
> @@ -432,7 +429,6 @@ static void ipa_modem_crashed(struct ipa *ipa)
>   		dev_err(dev, "error %d zeroing modem memory regions\n", ret);
>   
>   out_power_put:
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   }
>   
> diff --git a/drivers/net/ipa/ipa_smp2p.c b/drivers/net/ipa/ipa_smp2p.c
> index fcaadd111a8a..420098796eec 100644
> --- a/drivers/net/ipa/ipa_smp2p.c
> +++ b/drivers/net/ipa/ipa_smp2p.c
> @@ -171,7 +171,6 @@ static irqreturn_t ipa_smp2p_modem_setup_ready_isr(int irq, void *dev_id)
>   	WARN(ret != 0, "error %d from ipa_setup()\n", ret);
>   
>   out_power_put:
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   
>   	return IRQ_HANDLED;
> @@ -213,7 +212,6 @@ static void ipa_smp2p_power_release(struct ipa *ipa)
>   	if (!ipa->smp2p->power_on)
>   		return;
>   
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   	ipa->smp2p->power_on = false;
>   }
> diff --git a/drivers/net/ipa/ipa_uc.c b/drivers/net/ipa/ipa_uc.c
> index 2963db83ab6b..dc7e92f2a4fb 100644
> --- a/drivers/net/ipa/ipa_uc.c
> +++ b/drivers/net/ipa/ipa_uc.c
> @@ -158,7 +158,6 @@ static void ipa_uc_response_hdlr(struct ipa *ipa)
>   		if (ipa->uc_powered) {
>   			ipa->uc_loaded = true;
>   			ipa_power_retention(ipa, true);
> -			pm_runtime_mark_last_busy(dev);
>   			(void)pm_runtime_put_autosuspend(dev);
>   			ipa->uc_powered = false;
>   		} else {
> @@ -203,7 +202,6 @@ void ipa_uc_deconfig(struct ipa *ipa)
>   	if (!ipa->uc_powered)
>   		return;
>   
> -	pm_runtime_mark_last_busy(dev);
>   	(void)pm_runtime_put_autosuspend(dev);
>   }
>   


