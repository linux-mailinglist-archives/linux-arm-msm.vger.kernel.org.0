Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC5E953240B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 May 2022 09:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234399AbiEXH1r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 May 2022 03:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235225AbiEXH1q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 May 2022 03:27:46 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FA42980BB
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 00:27:43 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id c14so15748842pfn.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 00:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tsv75/jMSG9IE7z+FFdGkSFpTdlyLS1N1PmQi6VFqBI=;
        b=wvLcdRoTzjduYLMmkssoeHZpDzj+D6Li3c0sGg6dhznKpbBFocVHCep91+LKPeyu6A
         adf8V3sSKAOctotcch5S4mjMvRTbGhUus5+QA9diimFJsnt8A7i6RD2y60WXwsSGiVdh
         bgwJnqToDTyrZHPGBmo0VfUmcmMllbbq6FQB+bPb997SkUODY+yapFzKf5qaekHLwqXu
         +UX9XXuscTRgo2MU9b9/+1PWDINJRaRuHj42B7O7KiR1jhJSTJoTBSaL8gJ2Gt9CqoYy
         eR7pDrcyhkAJYgcV8Nobpd9IwwO8hEcjkrUHmcHmfpQH8XlOqP3WIr1mmEMAnLuWDQDE
         MRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tsv75/jMSG9IE7z+FFdGkSFpTdlyLS1N1PmQi6VFqBI=;
        b=VuXAsre3k5Z94WX/yxZFELeeTFboMmpWS7kQpJHOdtf03uMJGvugS73E0d7pIfD09o
         22/EML5/SILOumOkz3sgAIM6ZYHZT1uqxCIx18eX3lHHQ3+JO+vDZQN6ru3nuB5ncWFW
         r0XiozyzqL6mB5I1ZDppE9iupfTZY+tp8Daq8P/69OuwjoOcqw0l4v41tNmxiQiZqRSa
         ecwccmQ35KxKzuaYvqny93WJ+ZDrZTFC5Tx/m1NU58zyfPfK1X0rZFVm0NNnA85mfHLB
         Yp8vfxkstiQb7b09JnfRowc2wvAsez54RtxCA5suzTUFwS4hAq/6iK1/vArSD7I4xiNF
         I8wg==
X-Gm-Message-State: AOAM533nlTNcMgZs7LmgzPlBQzP8lkWW6p+bR50m4eSp1tVnoqte79wk
        Xq4PoEt/8rNPyx/tKij1C0rVHTdahI1Dw9Miy6dyjg==
X-Google-Smtp-Source: ABdhPJw3ORe/h7f5dIvOTqYeutYcfp1EKqFSPpJWeNvmseS55Kkvyhwnm9kIFnPx97OSfYOHlmOBlicekC0ETSFOvdM=
X-Received: by 2002:a05:6a00:228c:b0:518:9533:4a1e with SMTP id
 f12-20020a056a00228c00b0051895334a1emr11198767pfe.79.1653377262793; Tue, 24
 May 2022 00:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <MEYP282MB2374837FFCB18B12BFDEDE80FDCF9@MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM>
In-Reply-To: <MEYP282MB2374837FFCB18B12BFDEDE80FDCF9@MEYP282MB2374.AUSP282.PROD.OUTLOOK.COM>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 24 May 2022 09:27:06 +0200
Message-ID: <CAMZdPi8c1HqxgGW2woTF=0wUv_gV+pn5q088fYZ=KV0p=avJfA@mail.gmail.com>
Subject: Re: [PATCH v2] bus: mhi: host: Add support for Quectel EM120 FCCL.
To:     Yonglin Tan <yonglin.tan@outlook.com>
Cc:     mani@kernel.org, gregkh@linuxfoundation.org,
        quic_hemantk@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 16 May 2022 at 08:38, Yonglin Tan <yonglin.tan@outlook.com> wrote:
>
> The product's enumeration align with previous
> Quectel EM120R-GL, so the EM120 FCCL would use
> the same config as Quectel EM120R-GL.
>
> Signed-off-by: Yonglin Tan <yonglin.tan@outlook.com>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

> ---
>
> V2:
> Fixed the format errors in the patch description.
>
>  drivers/bus/mhi/host/pci_generic.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 8416267..0a6469c 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -557,6 +557,8 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>                 .driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>         { PCI_DEVICE(0x1eac, 0x1002), /* EM160R-GL (sdx24) */
>                 .driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> +       { PCI_DEVICE(0x1eac, 0x2001), /* EM120R-GL for FCCL (sdx24) */
> +               .driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>         /* T99W175 (sdx55), Both for eSIM and Non-eSIM */
>         { PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0ab),
>                 .driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> --
> 2.7.4
>
