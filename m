Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07036117D74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2019 03:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfLJCEW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 21:04:22 -0500
Received: from mailout4.samsung.com ([203.254.224.34]:35128 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbfLJCEW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 21:04:22 -0500
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20191210020418epoutp04311046dab4d46ed4a083aa16c0a91919~e4DmxOs8I1450614506epoutp04I;
        Tue, 10 Dec 2019 02:04:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20191210020418epoutp04311046dab4d46ed4a083aa16c0a91919~e4DmxOs8I1450614506epoutp04I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1575943458;
        bh=JIlFhIxGiAWFjXmj8eutng+eKDk0ywJyefbSTWOuCns=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=JJQk8o7yF1js+i8wr7DbP4opuQkC18/V/d/fwlp5vdnBQjUIzATM1kk6fxI3RPdpb
         rh7ASkXsDo+PQ7yvMHdsyb0gPx72Wzsf+zGS996PoLxs3IA7lReAemwE1J/Egerf1d
         5FfKNG2QNaVEXPDJkF7jHjTJmB+U3FAFXzAX3t+c=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20191210020417epcas1p3103e50cf5f2838be97d66d7844edca06~e4DmOD-n70406004060epcas1p3V;
        Tue, 10 Dec 2019 02:04:17 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.156]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 47X3Jv075zzMqYl1; Tue, 10 Dec
        2019 02:04:15 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        84.58.48498.E1DFEED5; Tue, 10 Dec 2019 11:04:14 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20191210020413epcas1p3e11eda64344c8e15d7781c5071e76953~e4DjAEU5S0406004060epcas1p3Q;
        Tue, 10 Dec 2019 02:04:13 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191210020413epsmtrp2b7f2e8b02004fb0c1daadd1d2454ecce~e4Di_LLlV2765727657epsmtrp2N;
        Tue, 10 Dec 2019 02:04:13 +0000 (GMT)
X-AuditID: b6c32a36-a55ff7000001bd72-dd-5deefd1ee477
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        C6.AD.10238.D1DFEED5; Tue, 10 Dec 2019 11:04:13 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191210020413epsmtip2b78f213eb12d5fbee4bff5729c9aae69~e4DiI_two1930619306epsmtip2Y;
        Tue, 10 Dec 2019 02:04:13 +0000 (GMT)
Subject: Re: [PATCH 03/17] clk: samsung: convert to
 devm_platform_ioremap_resource
To:     Yangtao Li <tiny.windzz@gmail.com>, afaerber@suse.de,
        manivannan.sadhasivam@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, Eugeniy.Paltsev@synopsys.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, agross@kernel.org,
        s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org,
        krzk@kernel.org, palmer@sifive.com, paul.walmsley@sifive.com,
        dinguyen@kernel.org, mripard@kernel.org, wens@csie.org,
        emilio@elopez.com.ar, pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        matthias.bgg@gmail.com, rfontana@redhat.com,
        gregkh@linuxfoundation.org, t-kristo@ti.com, john@phrozen.org,
        tglx@linutronix.de, allison@lohutok.net,
        kstewart@linuxfoundation.org, swinslow@gmail.com,
        aisheng.dong@nxp.com, robh@kernel.org, daniel.baluta@nxp.com,
        wangyan.wang@mediatek.com, chunhui.dai@mediatek.com,
        miquel.raynal@bootlin.com, heiko@sntech.de, jcmvbkbc@gmail.com,
        nsekhar@ti.com, geert+renesas@glider.be
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <02ece950-b3d2-0d1a-fd94-acb64272bc96@samsung.com>
Date:   Tue, 10 Dec 2019 11:10:39 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20191209195749.868-3-tiny.windzz@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01UbTCcVxSeu+/HLo3mrUhdfrTrzbSdmBEWy9FGqq3KO22m1SYxnXSM7tg3
        KNZ2l3z+aBKKRQbJENkS5KNKZHwOayPWEBGdYRmNSmszjZVISzdV35XQta9M/XvOc55znnvu
        mXslhKtR4ilJUKXyGpUiiaWdyZbunb4+rz23RfvlVoVAeqMWBqwrJMwVGQmovrtKQvaDchoa
        2i009JhviuBx/Zydqyql4OG9T6Hs+3MI0q/U0bA2PkXBwsNKBObFNhoy9JdJqClqIyHfOkWA
        2VwvhrzSMwgarSMUFJr6xTCT94CCnH+rCRg2ltIwnD6EoGU2g4YSc4cIdHN6GiwZOgrOZARA
        d1YHBZm6HygY+ulDMJ2tF0FTQYWd0m+FczeKENwvPwzt1joC1toNYnje2khC93QWBasjDSQ8
        aXYH09AMgquPsmloaiwiYNl4iYSylQIaaozPEJTXLFGw3GUWhcm5p6PfiblLtSe5+vHrFPfM
        tpcr7Pfh2vQWMddYo6O5sZF2mrMNDIg5U1mtmGu6+i03Mz0h5jL6TCR3Nt1Gcw02g4jLf+4X
        6XEocXc8r1DyGimvik1RJqjiQtmP98d8ECMP8pP5yEIgmJWqFMl8KBu+L9InIiHJvhhWekSR
        lGanIhVaLeu7Z7cmJS2Vl8anaFNDWV6tTFKHqHdpFcnaNFXcrtiU5Ldlfn7+crvwq8T4ptb7
        tPq09NiPqwvoFJrwzEFOEswEYuvf42QOcpa4MgaE8+5mbwT/IPyo04SEYAHhyYV84kWJZXRR
        LCRuIfxHbhEhBE8R7pz5jVxXbWMOYENOnSPhxuRK8Oj5CdF6QDC5Itwwf9HRi2a8senJKL2O
        tzJe+N6SFa1jF2YPzusZdGhI5g38s9VCrePtTBTua8nY0LyC+y5OONycmBCcXlnv6EMw7vjX
        iXKRgF/HrX+VOk6BmcdO+GZtCSkMEY6ndHdEAt6G/+xtFgvYE8/abtECPomr+27TQnE2ws2m
        QUpIBGDTtfP2YondYSeuM/oKtBduWylDgvHL2DafR61LMOOCszNdBckOPPy7ZcPWA1/J0tEF
        iNVvGke/aQT9phH0/5tVILIGvcqrtclxvFam9t+88EbkeLfeQQZ0eWBfF2IkiN3iUhFmi3al
        FEe0x5O7EJYQrJtLb6adclEqjp/gNSkxmrQkXtuF5PbbLiQ8t8em2H8BVWqMTO4fEBAAgbIg
        uUzGurtIloaiXZk4RSqfyPNqXvOiTiRx8jyFOqePvTXWkz8+Jl/8xT+n2ItNZnV7O3KrTzh7
        tn00rwz0z6racQgHv3cNfV1w5/OXqg9ohnMj3umN3n+jmIogK4Pn3L5oCi5ee3fS+bNvhma7
        37TU+VTNRjdUhU9KT28xHD34viHqwnKU/GB9eKLH0RK/w7bbYZMGZb+0YND45fXpT9xZUhuv
        kHkTGq3iP+SSlHzNBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTZxTH89x3iJ2XouOBbXFrsiwj0YFOPSaGsCXKs2zJ/KAuminrxh26
        0Up6QSdbMkc7pBUmmnS6y0thkCmdrqUYKdDRhK4oZlAYg+Bia7RlIcHWEBF1Ao4L2cK33/mf
        8/t/OgKtbeYyhMPGEslk1BfpuGTmakC3bv1L84kDWf3nssDskWEw+pSBGXsXDa3XFxiojDg4
        aPOFOQiGuin42z2zmF2oY+HO6PtQX3sWgbnZxcGzu1MszN5pQhB61MmBRfmRAae9k4HT0Ska
        QiE3D1V15Qg80TEWzvgHeJiuirBg+6eVhpGuOg5GzMMIrj6wcHA+1EOBdUbhIGyxslBu2QSB
        kz0sVFh/YmH4xg7wV7spaK9pXIyU1XD2sh3BTcen4Iu6aHjm8/Iw3+FhIHDvJAsLY20MTF5J
        A//wNIKWiUoO2j12Gp50NTBQ/7SGA2fXHAKH8zELT3pDVO5mcn/8W540XPqSuO/+zJK5RB45
        M7CedCphnnicVo7cGvNxJDE4yBN//SWetLd8TabvxXhi6fczpNqc4EhbwkuR0/NZu9L3J28v
        kIoOH5VMb+R8lHyoveMmV/zNy19cXJhFJ1Asw4aSBCy+icPjj3gbSha0YjfCtQ/rqeVFOv5+
        OEjbkLDIqTgQkNVYK8YRttemqJwq7sZem4tW3TXiKQH3TTWz6kCLpygc/L2C/r/V1tTGqAon
        ZmL/5Din8mrxFTz6OIpU1og5uCo4RKvMiK/iP6NhVuW14l7c2RKllm9ScP8PsaWeJHEbNje5
        l3po8TU81/AHvcxp+K+Yg1rmdbgjXkfXoFRlha6sUJQVirJCaUSME6VLxbKh0CBnF2cbpWMb
        ZL1BLjUWbvjkiMGDll4383UvGmnJ70WigHSrNI25iQNaVn9UPm7oRVigdWs01yoWI02B/niZ
        ZDqSbyotkuRe9ILA6NI0E8a+fVqxUF8ifS5JxZLpvy0lJGWcQBsrg4kJmMlNlOdt/My6J0jy
        nfa3r2/d9MF06pbq4O7SaGVZyh783pzl+dKPW6mCdzb/MurfX+KJ73y32xlxVfhs511f3U6P
        7NslXPwub6e/8MVfu82zQz3b4m9dmLgfL7u8d6sSueH9bXLMdpDEnsseUm5byZUBR2vfhzty
        Dj44N69j5EP67EzaJOv/BcgKhNC2AwAA
X-CMS-MailID: 20191210020413epcas1p3e11eda64344c8e15d7781c5071e76953
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191209195912epcas5p2759273f3c5b15df7e78285e5db964ee5
References: <20191209195749.868-1-tiny.windzz@gmail.com>
        <CGME20191209195912epcas5p2759273f3c5b15df7e78285e5db964ee5@epcas5p2.samsung.com>
        <20191209195749.868-3-tiny.windzz@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 12/10/19 4:57 AM, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/clk/samsung/clk-exynos-audss.c   | 4 +---
>  drivers/clk/samsung/clk-exynos4412-isp.c | 4 +---
>  drivers/clk/samsung/clk-exynos5433.c     | 4 +---
>  drivers/clk/samsung/clk-s5pv210-audss.c  | 4 +---
>  4 files changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
> index 42b5d32c6cc7..9cc127a162ad 100644
> --- a/drivers/clk/samsung/clk-exynos-audss.c
> +++ b/drivers/clk/samsung/clk-exynos-audss.c
> @@ -129,7 +129,6 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
>  	struct clk *pll_ref, *pll_in, *cdclk, *sclk_audio, *sclk_pcm_in;
>  	const struct exynos_audss_clk_drvdata *variant;
>  	struct clk_hw **clk_table;
> -	struct resource *res;
>  	struct device *dev = &pdev->dev;
>  	int i, ret = 0;
>  
> @@ -137,8 +136,7 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
>  	if (!variant)
>  		return -EINVAL;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	reg_base = devm_ioremap_resource(dev, res);
> +	reg_base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(reg_base))
>  		return PTR_ERR(reg_base);
>  
> diff --git a/drivers/clk/samsung/clk-exynos4412-isp.c b/drivers/clk/samsung/clk-exynos4412-isp.c
> index 4b9e73608c21..20f5129f7212 100644
> --- a/drivers/clk/samsung/clk-exynos4412-isp.c
> +++ b/drivers/clk/samsung/clk-exynos4412-isp.c
> @@ -110,11 +110,9 @@ static int __init exynos4x12_isp_clk_probe(struct platform_device *pdev)
>  	struct samsung_clk_provider *ctx;
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
> -	struct resource *res;
>  	void __iomem *reg_base;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	reg_base = devm_ioremap_resource(dev, res);
> +	reg_base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(reg_base)) {
>  		dev_err(dev, "failed to map registers\n");
>  		return PTR_ERR(reg_base);
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index 4b1aa9382ad2..b0d48cddfd6e 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -5557,7 +5557,6 @@ static int __init exynos5433_cmu_probe(struct platform_device *pdev)
>  	struct exynos5433_cmu_data *data;
>  	struct samsung_clk_provider *ctx;
>  	struct device *dev = &pdev->dev;
> -	struct resource *res;
>  	void __iomem *reg_base;
>  	int i;
>  
> @@ -5570,8 +5569,7 @@ static int __init exynos5433_cmu_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	ctx = &data->ctx;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	reg_base = devm_ioremap_resource(dev, res);
> +	reg_base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(reg_base))
>  		return PTR_ERR(reg_base);
>  
> diff --git a/drivers/clk/samsung/clk-s5pv210-audss.c b/drivers/clk/samsung/clk-s5pv210-audss.c
> index 14985ebd043b..503bd8a10d8f 100644
> --- a/drivers/clk/samsung/clk-s5pv210-audss.c
> +++ b/drivers/clk/samsung/clk-s5pv210-audss.c
> @@ -63,15 +63,13 @@ static struct syscore_ops s5pv210_audss_clk_syscore_ops = {
>  static int s5pv210_audss_clk_probe(struct platform_device *pdev)
>  {
>  	int i, ret = 0;
> -	struct resource *res;
>  	const char *mout_audss_p[2];
>  	const char *mout_i2s_p[3];
>  	const char *hclk_p;
>  	struct clk_hw **clk_table;
>  	struct clk *hclk, *pll_ref, *pll_in, *cdclk, *sclk_audio;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	reg_base = devm_ioremap_resource(&pdev->dev, res);
> +	reg_base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(reg_base)) {
>  		dev_err(&pdev->dev, "failed to map audss registers\n");
>  		return PTR_ERR(reg_base);
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
