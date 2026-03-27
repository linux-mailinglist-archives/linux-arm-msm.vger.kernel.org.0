Return-Path: <linux-arm-msm+bounces-100466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK4BLQDsxmkIQQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:43:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3DC34B354
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5F1013085839
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6FC39184C;
	Fri, 27 Mar 2026 20:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VuqQy0dF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA5B37EFE8
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774643051; cv=pass; b=MxWBdcqUz8FWv3LVEFsXCt4cxhvHkWCJUr/aja1SYgiN6za3C6Mbu+XcD9ocALXgz+A7/9fAeWiOwoaKV7mQCu1XnA/KwoKNZh9W+IfrbT3ImKpZ8z36skHk1VuTtIjWyIjfgglN3NEYvyJNcRvF8jGu2J8/+IiLgQvSAIvDnso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774643051; c=relaxed/simple;
	bh=fe8HYEgNDSZEJwtPnP9d7rdRK4mOuzWO1Arb10bM66I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yb6NcVfovtm+xS+fstGOiPLxB8KOZ968Ob9iE740ihXvaQjip5d7a+JyNVdfiWbIlji82pjfZJtQuHR6rs6ffpxI6XVSIcXhHrs9Xz9xUBFdQx+/YQYyab1srduhz9Ewnt87i9WOQKjlCaULMA27QxME/W914Nt2JSHDnnwUYK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VuqQy0dF; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66a33f61d80so4222555a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774643047; cv=none;
        d=google.com; s=arc-20240605;
        b=JIYUigRTBCR2jr4aLGEbyjd5mUAFKrUbTO58N1uA1DD4lLlxiF0ci2+tonFyP0lb/W
         LnAz7sNuyZCHCez94NTcLYDonHGPelFbci3iPhH03ke66mbP987YS1T0fddhEewocvIF
         DGUufnIfERFllyHg1B/ozYJOnjVSddEENa24lgb38WiO81Zjqc2noVIxMedAUBdMJgmP
         UNfrU3CltNDZ9ameh+UHoPhVr2Zy9wqryInaWtdIYQLdY6rjtaWUpx08f+kZMyx2gtKD
         S+2auWnsWqszzDPxBS8aI/IPfER0z7X907pLn8+1nMKc8iqdVu9UDCt5+B9pH95vBAK2
         XE8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9WeOtA6rLKd2feImk1nWk/a5NsEeM0kN8oqqyEId0bQ=;
        fh=PpuqcNwAAv15nUsrrwHLYh4FKCxmgWsG9JZeYlp+i/o=;
        b=Brt5wfJDzqYWiagofx8nscpPc/KFHSGF+sjzomu/+w+IlVkYBzfogUPlLG7EGFV/yR
         NZybQGWVrviB8aHvE7wIoNyEWap5dcNJmiVxkIlEzpS8jNbaawAEivMLl+ElIjKnI725
         mk9jcucS0PPgoBPi7k3xLjcxIKI4a6Vk6a+fgurKBdA5CEg589PYepuLVdZIsE6jeARn
         TInY8y5ocPGQzP5JAsn+WC4NxV8qsw6ZOIO1HPLyyIjDOaZWzBbUmeUaneGQaHh9CE/l
         KGI3GIFmQLy4HupQT2m4jYb/XLucbz2ggd6cgryzXCC5P/KMFJbBtAfIW062GFhUSoBO
         leYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774643047; x=1775247847; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9WeOtA6rLKd2feImk1nWk/a5NsEeM0kN8oqqyEId0bQ=;
        b=VuqQy0dFFUKCW5LFnvEaxGiKsvA7wZMtgk9MpLPdPYNG0CjRWontr06l/oScJ9SlL1
         r9wEtzgkdnjKi0jIFmkCWVMcUt1DKXUUnD7yfUC1jgsUScQbM2/1SadvK6JBbSkmQYv4
         qSJ68sbS0T6VZPCTKM6GaMbq+iX9Q7TUrvklbvVXtraoXJ2iQJiNf1CCxINzF8kNLKwP
         NOvf4x8hp0t8wrVujWooo56OYrlQ2VJYEsTv/8AoqFdQu5mfMcrvLthjlYiwU3SoH/Us
         hlNdeZy9StxdLBHAoU7DXMvu0AqipWs5uVJE/jJHuiXn0PFfRmPiYl7JPpxJvKz+0G7z
         /5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774643047; x=1775247847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WeOtA6rLKd2feImk1nWk/a5NsEeM0kN8oqqyEId0bQ=;
        b=bqjItGG6HohqYN4fEq/Jm5Xt/Xj7vKVW5rSOfc1aS7ugSf1lSRVJUWwVLANtRN8YWd
         OCQlG4IH9QeQKXlwwyPPTirc4fyhUFY631eUyBfaMH2X/6X8LpKyDWagSm06v3Y+qLRl
         V0QQDXWOUymcjryTp+zfVHVEs/pP+75SpNTEUcA9IeDtwksD51neQzwO+zwLjmpz7EAC
         PLW2JJtgfTKH/4bu7kugDvuiIm7wbUoUGHo6ycASsLhT6Wg9sH9nmH+pvYZtlR6pfRmJ
         1D38Nkh2YGfpP9fOaKS21f7De4SgixKKWcJHjwwl2KEGNRoVMI5XyMyy8WYeDhf82TdF
         ffdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk6Kuq1idzvums6xR89QhXsEjsnHplAK6s4wqltlpp/OHfju3aujxMs+izWFBGxiDX4eeMjvG7v4dnqBBk@vger.kernel.org
X-Gm-Message-State: AOJu0YykaEUAqzi2VQHdlQh1WKOtcSraZCS1W3sfIkSjoD3fnxhZN8tV
	L/C04nVgwmm8su9/V1/mJ9EA6QZmNjlT8jwm2nrTMt1kD7xVoPv1h+i/sdgJ0RSvoKVbyfQNqJf
	lfhM2kaLGwCYlK1c9MpwZ9v3aaZL//E7tkm8e8EkVgA==
X-Gm-Gg: ATEYQzzZGSTxZay1+zOdYjDvtzRibnv8vkCVxQ2QD3DyxbK7IGczM7gvMsI5EJxSqmN
	4swVMYJP+yw/xqDFvXElKKSzHFbXqmj7f1t9roD0ZEUfTXJJW6UCaJqz3PsgAsw8sbNR9+yYi1j
	/BYFd7dEl7g3dqQyEEPTvYBNYRPjCp5qTT8SMXc8RrM4qdXX+tfT9cE4jlQ+7FrmnGOxBLGxNm+
	4NMBotFYe+7OjsbvSl1cLCFVSV8nS7nHUVr/fxXw2KOk7GqkWeAU5IU8CmXL7xJSg0CsKBbL0fr
	HAwMcByMg2cGlKK6+6gdTfzl10CUZl46CGHnKr9m
X-Received: by 2002:a05:6402:46db:b0:66a:199d:138 with SMTP id
 4fb4d7f45d1cf-66b28c66cbemr2039826a12.20.1774643046839; Fri, 27 Mar 2026
 13:24:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327184706.1600329-1-vladimir.oltean@nxp.com> <20260327184706.1600329-10-vladimir.oltean@nxp.com>
In-Reply-To: <20260327184706.1600329-10-vladimir.oltean@nxp.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 27 Mar 2026 20:23:54 +0000
X-Gm-Features: AQROBzCjrloDfUGTlNvOpQXdM4anVOjHCl2P0WQRB2XbIrpLYVg7AhYSjcExBJI
Message-ID: <CADrjBPqMwtrae7LB9A8xipg6R0rHGewe69awQ_jJnsf=2c=eTw@mail.gmail.com>
Subject: Re: [PATCH v6 phy-next 09/28] scsi: ufs: exynos: stop poking into
 struct phy guts
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Bart Van Assche <bvanassche@acm.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Chanho Park <chanho61.park@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100466-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.griffin@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,nxp.com:email,acm.org:email,oracle.com:email,hansenpartnership.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DC3DC34B354
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 27 Mar 2026 at 18:48, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
>
> The Exynos host controller driver is clearly a PHY consumer (gets the
> ufs->phy using devm_phy_get()), but pokes into the guts of struct phy
> to get the generic_phy->power_count.
>
> The UFS core (specifically ufshcd_link_startup()) may call the variant
> operation exynos_ufs_pre_link() -> exynos_ufs_phy_init() multiple times
> if the link startup fails and needs to be retried.
>
> However ufs-exynos shouldn't be doing what it's doing, i.e. looking at
> the generic_phy->power_count, because in the general sense of the API, a
> single Generic PHY may have multiple consumers. If ufs-exynos looks at
> generic_phy->power_count, there's no guarantee that this ufs-exynos
> instance is the one who previously bumped that power count. So it may be
> powering down the PHY on behalf of another consumer.
>
> The correct way in which this should be handled is ufs-exynos should
> *remember* whether it has initialized and powered up the PHY before, and
> power it down during link retries. Not rely on the power_count (which,
> btw, on the writer side is modified under &phy->mutex, but on the reader
> side is accessed unlocked). This is a discouraged pattern even if here
> it doesn't cause functional problems.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> Acked-by: Alim Akhtar <alim.akhtar@samsung.com>
> Tested-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Peter Griffin <peter.griffin@linaro.org>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Chanho Park <chanho61.park@samsung.com>
>
> v5->v6: collect tags from Alim Akhtar
> v4->v5: collect tag, add "scsi: " prefix to commit title
> v3->v4: none
> v2->v3:
> - add Cc Chanho Park, author of commit 3d73b200f989 ("scsi: ufs:
>   ufs-exynos: Change ufs phy control sequence")
> v1->v2:
> - add better ufs->phy_powered_on handling in exynos_ufs_exit(),
>   exynos_ufs_suspend() and exynos_ufs_resume() which ensures we won't
>   enter a phy->power_count underrun condition
> ---
>  drivers/ufs/host/ufs-exynos.c | 24 ++++++++++++++++++++----
>  drivers/ufs/host/ufs-exynos.h |  1 +
>  2 files changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
> index 76fee3a79c77..274e53833571 100644
> --- a/drivers/ufs/host/ufs-exynos.c
> +++ b/drivers/ufs/host/ufs-exynos.c
> @@ -963,9 +963,10 @@ static int exynos_ufs_phy_init(struct exynos_ufs *ufs)
>
>         phy_set_bus_width(generic_phy, ufs->avail_ln_rx);
>
> -       if (generic_phy->power_count) {
> +       if (ufs->phy_powered_on) {
>                 phy_power_off(generic_phy);
>                 phy_exit(generic_phy);
> +               ufs->phy_powered_on = false;
>         }
>
>         ret = phy_init(generic_phy);
> @@ -979,6 +980,8 @@ static int exynos_ufs_phy_init(struct exynos_ufs *ufs)
>         if (ret)
>                 goto out_exit_phy;
>
> +       ufs->phy_powered_on = true;
> +
>         return 0;
>
>  out_exit_phy:
> @@ -1527,6 +1530,9 @@ static void exynos_ufs_exit(struct ufs_hba *hba)
>  {
>         struct exynos_ufs *ufs = ufshcd_get_variant(hba);
>
> +       if (!ufs->phy_powered_on)
> +               return;
> +
>         phy_power_off(ufs->phy);
>         phy_exit(ufs->phy);
>  }
> @@ -1728,8 +1734,10 @@ static int exynos_ufs_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
>         if (ufs->drv_data->suspend)
>                 ufs->drv_data->suspend(ufs);
>
> -       if (!ufshcd_is_link_active(hba))
> +       if (!ufshcd_is_link_active(hba) && ufs->phy_powered_on) {
>                 phy_power_off(ufs->phy);
> +               ufs->phy_powered_on = false;
> +       }
>
>         return 0;
>  }
> @@ -1737,9 +1745,17 @@ static int exynos_ufs_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
>  static int exynos_ufs_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  {
>         struct exynos_ufs *ufs = ufshcd_get_variant(hba);
> +       int err;
>
> -       if (!ufshcd_is_link_active(hba))
> -               phy_power_on(ufs->phy);
> +       if (!ufshcd_is_link_active(hba) && !ufs->phy_powered_on) {
> +               err = phy_power_on(ufs->phy);
> +               if (err) {
> +                       dev_err(hba->dev, "Failed to power on PHY: %pe\n",
> +                               ERR_PTR(err));
> +               } else {
> +                       ufs->phy_powered_on = true;
> +               }
> +       }
>
>         exynos_ufs_config_smu(ufs);
>         exynos_ufs_fmp_resume(hba);
> diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
> index abe7e472759e..683b9150e2ba 100644
> --- a/drivers/ufs/host/ufs-exynos.h
> +++ b/drivers/ufs/host/ufs-exynos.h
> @@ -227,6 +227,7 @@ struct exynos_ufs {
>         int avail_ln_rx;
>         int avail_ln_tx;
>         int rx_sel_idx;
> +       bool phy_powered_on;
>         struct ufs_pa_layer_attr dev_req_params;
>         struct ufs_phy_time_cfg t_cfg;
>         ktime_t entry_hibern8_t;
> --
> 2.43.0
>

