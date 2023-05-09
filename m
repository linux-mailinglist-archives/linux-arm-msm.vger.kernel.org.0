Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6066FCF1A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 May 2023 22:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjEIUJX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 May 2023 16:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbjEIUJW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 May 2023 16:09:22 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 637E2E43
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 May 2023 13:09:21 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-643557840e4so6858008b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 May 2023 13:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683662961; x=1686254961;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k+FKrsLIVkKYcsIeLT6acEHQnxxZ6Q1AY/ul3RhcaDc=;
        b=t7HcuJJ8yNGZSd5jU/xlsEmIR0LbZB3y+UKrWSXF1bjCnP1H/mulK2qxWbB9om6c5e
         EPoNhS+2F2SY6TDpNh93OfYIaBuWtDyA0WUhhijzdrOdZ209vJFBMBDEstCsarasou+9
         +aaguV9fWmvqneuHb9CoJTE/qx66MsyzXT+Vxlf3Z99RhkANcfNe43TH2ZxXjLdx2+BS
         HuT1Mt+LUKLIi9eC3VKE3enmhVi2+4/fEeTRQlISUfpnrQX7AiRV2EtLIcQYI0O8DYbA
         SgRhafl44CnHhh1/jjt5W5eRfmOo6Y3wvHoZfrVQ9hLa4M2QjasbOPOES3SF4ouZL3OB
         lEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683662961; x=1686254961;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k+FKrsLIVkKYcsIeLT6acEHQnxxZ6Q1AY/ul3RhcaDc=;
        b=eU5aCc8a3nj+2BONXbYrUfhl9O/EknxJX4As4ZqBJpbfwbbV/8baq/CiiOs9efOHyd
         41mHPxLcLanLZtob/NnkpIiCirwrC9HNCaP/M3/dLJwawRsdPja8hKNvFLlntBjZaRdz
         d3Zuv24LkVQFRcC5StsMumE6oMglaQhRV5X9LAo+vqAufQm62PzRrTkIyInpJK2W2+oE
         JaCLIoILxA4WimbX3CNSnutY4w6Q+VlVa3rAQ9IcgLNUVQRvZuJWLGkgCQ1a+Yt9C8jk
         dzEMDScNgF4QREXTcDW1DNh57VUzCXqJcCxOM82/Z7V6GYLQeuStTvFGbMqYLtZvN/Sc
         LlPA==
X-Gm-Message-State: AC+VfDzohFhrFQ9Z6/yVxd1rcQgqT99GR5E21msfzdDnNorW722phxS2
        RYk1yHKA1yzBzXQ/RUy9zFayeA==
X-Google-Smtp-Source: ACHHUZ7DY1IJhZ58XkyYQJW/n6N11Hq8FL8JnuzhTJRQRu0mHe/ZFZZkYof5BJbwpbwYX39JmI5wDQ==
X-Received: by 2002:a05:6a21:6317:b0:f3:3810:8a89 with SMTP id wu23-20020a056a21631700b000f338108a89mr16127445pzb.51.1683662960788;
        Tue, 09 May 2023 13:09:20 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5e48:ff40:3eaf:3f9e])
        by smtp.gmail.com with ESMTPSA id a9-20020a63e409000000b0050376cedb3asm1756976pgi.24.2023.05.09.13.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 13:09:20 -0700 (PDT)
Date:   Tue, 9 May 2023 14:09:17 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-remoteproc@vger.kernel.org, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 00/18] remoteproc: Convert to platform remove callback
 returning void
Message-ID: <ZFqobZAfdlu+Rdtt@p14s>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 04, 2023 at 09:44:35PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> this patch series adapts most platform drivers below drivers/remoteproc
> to use the .remove_new() callback. Compared to the traditional .remove()
> callback .remove_new() returns no value. This is a good thing because
> the driver core doesn't (and cannot) cope for errors during remove. The
> only effect of a non-zero return value in .remove() is that the driver
> core emits a warning. The device is removed anyhow and an early return
> from .remove() usually yields a resource leak. One driver suffering from
> this problem (s3c2410) is fixed by the first patch.
> 
> By changing the remove callback to return void driver authors cannot
> reasonably (but wrongly) assume any more that there happens some kind of
> cleanup later.
> 
> There is one driver (i.e. ti_k3_dsp_remoteproc.c) that might return an
> error code in .remove(). I didn't look in detail into this driver, but
> if that error happens, we have exactly the bad situation described
> above. (Note that kproc->mem and the register mapping goes away.)
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (18):
>   remoteproc: da8xx: Convert to platform remove callback returning void
>   remoteproc: imx_dsp: Convert to platform remove callback returning
>     void
>   remoteproc: imx: Convert to platform remove callback returning void
>   remoteproc: keystone: Convert to platform remove callback returning
>     void
>   remoteproc: meson_mx_ao_arc: Convert to platform remove callback
>     returning void
>   remoteproc: mtk_scp: Convert to platform remove callback returning
>     void
>   remoteproc: omap: Convert to platform remove callback returning void
>   remoteproc: pru: Convert to platform remove callback returning void
>   remoteproc: qcom_q6v5_adsp: Convert to platform remove callback
>     returning void
>   remoteproc: qcom_q6v5_mss: Convert to platform remove callback
>     returning void
>   remoteproc: qcom_q6v5_pas: Convert to platform remove callback
>     returning void
>   remoteproc: qcom_q6v5_wcss: Convert to platform remove callback
>     returning void
>   remoteproc: qcom_wcnss: Convert to platform remove callback returning
>     void
>   remoteproc: rcar: Convert to platform remove callback returning void
>   remoteproc: virtio: Convert to platform remove callback returning void
>   remoteproc: st: Convert to platform remove callback returning void
>   remoteproc: stm32: Convert to platform remove callback returning void
>   remoteproc: wkup_m3: Convert to platform remove callback returning
>     void
> 
>  drivers/remoteproc/da8xx_remoteproc.c    | 6 ++----
>  drivers/remoteproc/imx_dsp_rproc.c       | 6 ++----
>  drivers/remoteproc/imx_rproc.c           | 6 ++----
>  drivers/remoteproc/keystone_remoteproc.c | 6 ++----
>  drivers/remoteproc/meson_mx_ao_arc.c     | 6 ++----
>  drivers/remoteproc/mtk_scp.c             | 6 ++----
>  drivers/remoteproc/omap_remoteproc.c     | 6 ++----
>  drivers/remoteproc/pru_rproc.c           | 6 ++----
>  drivers/remoteproc/qcom_q6v5_adsp.c      | 6 ++----
>  drivers/remoteproc/qcom_q6v5_mss.c       | 6 ++----
>  drivers/remoteproc/qcom_q6v5_pas.c       | 6 ++----
>  drivers/remoteproc/qcom_q6v5_wcss.c      | 6 ++----
>  drivers/remoteproc/qcom_wcnss.c          | 6 ++----
>  drivers/remoteproc/rcar_rproc.c          | 6 ++----
>  drivers/remoteproc/remoteproc_virtio.c   | 6 ++----
>  drivers/remoteproc/st_remoteproc.c       | 6 ++----
>  drivers/remoteproc/stm32_rproc.c         | 6 ++----
>  drivers/remoteproc/wkup_m3_rproc.c       | 6 ++----
>  18 files changed, 36 insertions(+), 72 deletions(-)
>

I have applied this set.

Thanks,
Mathieu

> 
> base-commit: 1a5304fecee523060f26e2778d9d8e33c0562df3
> -- 
> 2.39.2
> 
