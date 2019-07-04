Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0CDE5F824
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2019 14:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727682AbfGDMb2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jul 2019 08:31:28 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:47672 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727632AbfGDMb2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jul 2019 08:31:28 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190704123126euoutp01bff1f0aa9020224489b4cfc2872ae588~uNCyNf6lP3206832068euoutp01y
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jul 2019 12:31:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190704123126euoutp01bff1f0aa9020224489b4cfc2872ae588~uNCyNf6lP3206832068euoutp01y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1562243486;
        bh=2UbtQD8qfJhaojQj3snazROYVj3M0EWBwEnOMikNX2U=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=pgGHgcl/kvQcsglLc0Gio74zo4CYkFU+NLSZgE1+NRF/SIwpor71PvyGudhDxJazn
         hipOsu4FqAClVIFawMBC3kEnnOXqF7r/Yy27k/tdlxc+EgaHb9LXXxHdBtL3P9/Ofv
         NLIvU/c9I2MRkOCdDFliPzKoVXU9DOtSWlgQBGEM=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190704123126eucas1p2f3d92d64a5de5ae76968af4d6b880232~uNCx0eZ351668316683eucas1p2U;
        Thu,  4 Jul 2019 12:31:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id E6.AE.04377.D91FD1D5; Thu,  4
        Jul 2019 13:31:26 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190704123125eucas1p2a54dc6e43044794ff7f4a5800e89f90c~uNCxBT1Os1685416854eucas1p2V;
        Thu,  4 Jul 2019 12:31:25 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190704123125eusmtrp1ab013178c6ac82143443d39cfc197edf~uNCwzOR4A1291112911eusmtrp1p;
        Thu,  4 Jul 2019 12:31:25 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-d0-5d1df19d169a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id D1.E7.04146.D91FD1D5; Thu,  4
        Jul 2019 13:31:25 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190704123124eusmtip2e4dd94386d783826831f38fafa3ff19a~uNCwPgulL1170711707eusmtip2S;
        Thu,  4 Jul 2019 12:31:24 +0000 (GMT)
Subject: Re: [PATCH 2/3] drm/bridge: ti-sn65dsi86: add debugfs
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <1b56a11c-194d-0eca-4dd1-48e91820eafb@samsung.com>
Date:   Thu, 4 Jul 2019 14:31:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190702154419.20812-3-robdclark@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFKsWRmVeSWpSXmKPExsWy7djP87rzPsrGGnw/wGjRe+4kk8X/bROZ
        La58fc9m0TlxCbvFxP1n2S0u75rDZnHt52Nmi+cLfzBb3N1wltGB02N2w0UWj73fFrB47Jx1
        l91jdsdMVo/t3x6wetzvPs7k8XmTXAB7FJdNSmpOZllqkb5dAlfGthvTmQvmilU0LrzK2sD4
        WbCLkYNDQsBE4m07RxcjJ4eQwApGiclbAiDsL4wSxxvSuhi5gOzPjBIrG+6wgSRA6nd92cwM
        kVjOKHF70xdGiI63jBLz7muA2MICdhLtlz+zgtgiAi4SJy79BrOZBVqYJDZurQWx2QQ0Jf5u
        vgk2lBeofv+LU+wgNouAisTOD6/A6kUFIiQub9nFCFEjKHFy5hMWEJtTwFKi/d8/NoiZ8hLN
        W2czQ9jiEreezGcCOU5C4By7xNZTs9kgvnSROHPZEeIBYYlXx7ewQ9gyEqcn97BA2PUS91e0
        MEP0djBKbN2wkxkiYS1x+PhFVpA5zEBHr9+lDxF2lDj2eR0rxHg+iRtvBSFO4JOYtG06M0SY
        V6KjTQiiWlHi/tmtUAPFJZZe+Mo2gVFpFpLHZiF5ZhaSZ2Yh7F3AyLKKUTy1tDg3PbXYKC+1
        XK84Mbe4NC9dLzk/dxMjMEWd/nf8yw7GXX+SDjEKcDAq8fA+2CITK8SaWFZcmXuIUYKDWUmE
        9/tvoBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeaoYH0UIC6YklqdmpqQWpRTBZJg5OqQZGNtbs
        /ppjvh78yZm/o2smb6mrt/Py598Q0WLp5LPg0JMfN2unb84xDzkf+HmxQkyo9eFMAbfUnOtf
        brdMDt3VyppbPdlb2/HcvUTf/R18nZq+W5kiRA7y/N5809DzZGXdiSplOV/nKcr2J/t3ue9b
        zJofWNu8YluTL1eB3v+jveX/ProK71FiKc5INNRiLipOBAD3PibKTQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRmVeSWpSXmKPExsVy+t/xe7pzP8rGGuz8zGnRe+4kk8X/bROZ
        La58fc9m0TlxCbvFxP1n2S0u75rDZnHt52Nmi+cLfzBb3N1wltGB02N2w0UWj73fFrB47Jx1
        l91jdsdMVo/t3x6wetzvPs7k8XmTXAB7lJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGx
        eayVkamSvp1NSmpOZllqkb5dgl7GthvTmQvmilU0LrzK2sD4WbCLkZNDQsBEYteXzcxdjFwc
        QgJLGSX2nvzNBJEQl9g9/y0zhC0s8edaFxtE0WtGiaZjl8GKhAXsJNovf2YFsUUEXCROXPrN
        ClLELNDGJHFxbxsrRMduoI6d81hAqtgENCX+br7JBmLzAnXvf3GKHcRmEVCR2PnhFdgkUYEI
        ib622VA1ghInZz4B6+UUsJRo//cPLM4soC7xZ94lZghbXqJ562woW1zi1pP5TBMYhWYhaZ+F
        pGUWkpZZSFoWMLKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECIzQbcd+bt7BeGlj8CFGAQ5G
        JR7eB1tkYoVYE8uKK3MPMUpwMCuJ8H7/DRTiTUmsrEotyo8vKs1JLT7EaAr03ERmKdHkfGDy
        yCuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwGh1y/N55p8Ah9x5
        2+uPlbxKztp04PDU2Yce8QZ99PA78uzm3ucrZOUr+z9JXWjpYeSt2HvoTL7Je0Ot6btnnZru
        F6OZoaLJmXrOcDqj97TZ66UPZh57ljJdQV1B9bnE67eGqQ69GbzGy171n2flD43QuHGlbEmo
        u+Z/20PHnBLqFpQeCPN6ukmJpTgj0VCLuag4EQDMShTl5gIAAA==
X-CMS-MailID: 20190704123125eucas1p2a54dc6e43044794ff7f4a5800e89f90c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190702154441epcas2p2cba89e3a84216d9a8da43438a9648e03
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190702154441epcas2p2cba89e3a84216d9a8da43438a9648e03
References: <20190702154419.20812-1-robdclark@gmail.com>
        <CGME20190702154441epcas2p2cba89e3a84216d9a8da43438a9648e03@epcas2p2.samsung.com>
        <20190702154419.20812-3-robdclark@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02.07.2019 17:44, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> Add a debugfs file to show status registers.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 42 +++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index f1a2493b86d9..a6f27648c015 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/debugfs.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/iopoll.h>
> @@ -109,6 +110,7 @@ struct ti_sn_bridge {
>  	struct drm_dp_aux		aux;
>  	struct drm_bridge		bridge;
>  	struct drm_connector		connector;
> +	struct dentry			*debugfs;
>  	struct device_node		*host_node;
>  	struct mipi_dsi_device		*dsi;
>  	struct clk			*refclk;
> @@ -178,6 +180,42 @@ static const struct dev_pm_ops ti_sn_bridge_pm_ops = {
>  	SET_RUNTIME_PM_OPS(ti_sn_bridge_suspend, ti_sn_bridge_resume, NULL)
>  };
>  
> +static int status_show(struct seq_file *s, void *data)
> +{
> +	struct ti_sn_bridge *pdata = s->private;
> +	unsigned int reg, val;
> +
> +	seq_puts(s, "STATUS REGISTERS:\n");
> +
> +	pm_runtime_get_sync(pdata->dev);
> +
> +	/* IRQ Status Registers, see Table 31 in datasheet */
> +	for (reg = 0xf0; reg <= 0xf8; reg++) {
> +		regmap_read(pdata->regmap, reg, &val);
> +		seq_printf(s, "[0x%02x] = 0x%08x\n", reg, val);
> +	}
> +
> +	pm_runtime_put(pdata->dev);
> +
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(status);
> +
> +static void ti_sn_debugfs_init(struct ti_sn_bridge *pdata)
> +{
> +	pdata->debugfs = debugfs_create_dir("ti_sn65dsi86", NULL);


If some day we will have board with two such bridges there will be a
problem.

Anyway:

Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej



> +
> +	debugfs_create_file("status", 0600, pdata->debugfs, pdata,
> +			&status_fops);
> +}
> +
> +static void ti_sn_debugfs_remove(struct ti_sn_bridge *pdata)
> +{
> +	debugfs_remove_recursive(pdata->debugfs);
> +	pdata->debugfs = NULL;
> +}
> +
>  /* Connector funcs */
>  static struct ti_sn_bridge *
>  connector_to_ti_sn_bridge(struct drm_connector *connector)
> @@ -869,6 +907,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>  
>  	drm_bridge_add(&pdata->bridge);
>  
> +	ti_sn_debugfs_init(pdata);
> +
>  	return 0;
>  }
>  
> @@ -879,6 +919,8 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
>  	if (!pdata)
>  		return -EINVAL;
>  
> +	ti_sn_debugfs_remove(pdata);
> +
>  	of_node_put(pdata->host_node);
>  
>  	pm_runtime_disable(pdata->dev);


