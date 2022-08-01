Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38DCF58631C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Aug 2022 05:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233932AbiHADf5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 Jul 2022 23:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233109AbiHADf4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 Jul 2022 23:35:56 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33FEA267E
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Jul 2022 20:35:55 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id uj29so4855775ejc.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Jul 2022 20:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=0m19xul91R86k8DEexJNxJ8DkAD1SHNbLLgZJzPMLMs=;
        b=bUJKNpb/F+rx6AvBBbPVFKQv+oJA4OSp2Or02UQ6YphL4VnDS5VlMR5vA+3ZzjIrGz
         exrVdrTb/K6S+8dH+epfjiMgKd8p7+u86RapPOk6ZFqSco0zTLwBdaBkcIIkTR0yMbZQ
         9KC9h0CmTASJS5gKma0ziZyxGnQJTFD5IEscbjgKQ4C98aQNwdDLku9pmbpdkndcpQTG
         XVCcwAkHtiuC7XH3xTtVEc5MCvNgZ32U26ClhAwWBsRlwnEWFDJN7n/iSEqLQShqoa04
         dglodgFw17OBv4xY2z9CFyXfoTQpn3iS6PNdPZm4JAQnRbJ+bqZGSQ4gfzjO8jotu8ZS
         YG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=0m19xul91R86k8DEexJNxJ8DkAD1SHNbLLgZJzPMLMs=;
        b=T6Wm1sBe2zY70im4BEUG/YnmgdwajJW6kkCdcajqz0uK5D2jbmNlmt7iqzM5PhyRND
         b/3HYLf2sXb7h9uEKszyXPGY8ph4XfDJiXYwatJULXApr/af3c6q8ICENTA6BgGMyPh3
         vm4EdB8Fw/e6TdNuFiKzjgT3bW2O7xNaUktTXFTyfp/ycPaRDFmp1DGfidpEE2nPnNNM
         7dowUUnSTOAbn7axuyHBXDfSn9RnTLO+10B2L9P7A1Rot6FY6rtTwOBZhxw0WlzduNIU
         bzy2YVa2x5mD2j3au2waL9VYfQXejqxncgJvhQcFwzisQo2ok9zT10hMRF3grW93jzQO
         fTdg==
X-Gm-Message-State: AJIora+M9oeIqAUeUwc/B62LwAETyZ3Jkx1O0pI+zg0A4Qu7lnlA1fo1
        gGnOLlzHVg0EfjcFFKQTLUaut/66yuv4zGlpa3BuKg==
X-Google-Smtp-Source: AGRyM1silTJw3gfBynYBoHZ4TGkaR1/cr19Ed8t8xWvf2TVhKzeYNVuTNYgUzPFZSt0dOc5mknErEqhfHfUsSXAxGgI=
X-Received: by 2002:a17:907:28d6:b0:72b:7497:76b with SMTP id
 en22-20020a17090728d600b0072b7497076bmr10694705ejc.365.1659324953801; Sun, 31
 Jul 2022 20:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220720230140.2113129-1-bjorn.andersson@linaro.org>
In-Reply-To: <20220720230140.2113129-1-bjorn.andersson@linaro.org>
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
Date:   Sun, 31 Jul 2022 22:35:42 -0500
Message-ID: <CAOCOHw5vj7WExi2opJ+ZvxLroq9UScHMMTuyyysMs3zJEfxgEQ@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig more updates for v5.20
To:     arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 20, 2022 at 6:01 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>

I don't seem to have received a response on this one, can you confirm
if you were able to pick it up for v5.20?

Thanks,
Bjorn

> The following changes since commit 76f11e77f919397f31198354cd0e0bd8e76f8748:
>
>   arm64: defconfig: enable Qualcomm Bandwidth Monitor (2022-07-06 15:58:13 -0500)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.20-2
>
> for you to fetch changes up to 01579b88a03a90af73b584fed70d171c73c2c540:
>
>   arm64: defconfig: Demote Qualcomm USB PHYs to modules (2022-07-18 18:56:02 -0500)
>
> ----------------------------------------------------------------
> Qualcomm ARM64 defconfig more updates for v5.20
>
> This enables a few of the core drivers needed to boot the 8cx Gen 3
> platform and demotes the Qualcomm USB PHY drivers to modules, as they
> don't need to be builtin.
>
> ----------------------------------------------------------------
> Bjorn Andersson (2):
>       arm64: defconfig: Enable Qualcomm SC8280XP providers
>       arm64: defconfig: Demote Qualcomm USB PHYs to modules
>
>  arch/arm64/configs/defconfig | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
