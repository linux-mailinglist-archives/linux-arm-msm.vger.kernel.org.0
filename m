Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 449846AF1D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 19:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233283AbjCGSry (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 13:47:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233267AbjCGSr0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 13:47:26 -0500
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D198B90B4C
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 10:36:39 -0800 (PST)
Received: by mail-il1-x135.google.com with SMTP id w4so4712435ilv.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 10:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678214193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HRJ9QjT9ee3B3xI3WGpaSfom/i+pMrAR/AAlnFcX0Q=;
        b=eCgfHyQGkoLcQhkjJyae1CNsPuS1w5bv68jcVvSLVuSagXXJ2IWgyCMzptps1NAViB
         Uxwvmx6PFKUjpEElyFLpW0pZUAMQ/c5VwPRmADmAmJJViMe/pejFBpXnnlLdNhRMt25O
         dAS8YQq2bj0pTqvzB8pO5wq1hvdb9GcQ2P2uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678214193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HRJ9QjT9ee3B3xI3WGpaSfom/i+pMrAR/AAlnFcX0Q=;
        b=7iF3qUyvH7FSPc28Ebr6HSaWa8wNWKI9wE6zjEDt95W6mHJKopiw43k54vJ19N0AIG
         mH4a7gosJ6U4u9CDBvQgAM+7Qp3DdhCwar3LO8lpWXM4sY9DpyuVdrXVanlyluuKuydX
         c6yuGp8a8ZfpyOsaMrTdwZDz7VZ3m4HsXlI+7lNBXISW3qzQ3577bCAp3STHsRQtHc3Y
         udR7RkT3gjxd74I0MeDWwSZcrrNNlZPZmW34T3AwfZSAuLfYrmNZWYujxeOPHGXFKBn3
         3zYDE8Jl8xozCSXwRbpAljPF78vhWt2mMUXkSUY+p5IDasX4ssQlrbokpHFK99ftSAHt
         izjw==
X-Gm-Message-State: AO0yUKVRxtjzNxM4x6eZMYTNfVX/riMTeClIKQEN4zTEOCHJrfeWTppG
        eLdGdzWGMTXic55PXVh3IYoYxoINwxU2/DpyW5M=
X-Google-Smtp-Source: AK7set/m41e7Ndg1BVR/2bQ7odSX5hsxLTBaq/kPInKMAea6ZpGAFUBBDI2EHqZL7KtP45BaQaTtqA==
X-Received: by 2002:a05:6e02:20e6:b0:317:9818:ea49 with SMTP id q6-20020a056e0220e600b003179818ea49mr12650334ilv.2.1678214193497;
        Tue, 07 Mar 2023 10:36:33 -0800 (PST)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id e4-20020a02a784000000b0038a13e116a1sm4420312jaj.61.2023.03.07.10.36.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 10:36:32 -0800 (PST)
Received: by mail-io1-f42.google.com with SMTP id b16so5765667iof.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 10:36:32 -0800 (PST)
X-Received: by 2002:a6b:6a0a:0:b0:745:b287:c281 with SMTP id
 x10-20020a6b6a0a000000b00745b287c281mr7254210iog.2.1678214192165; Tue, 07 Mar
 2023 10:36:32 -0800 (PST)
MIME-Version: 1.0
References: <20230307164405.14218-1-johan+linaro@kernel.org> <20230307164405.14218-3-johan+linaro@kernel.org>
In-Reply-To: <20230307164405.14218-3-johan+linaro@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 7 Mar 2023 10:36:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UO2hnu0pt2OggyQ0L6onohhzxeGbmtX6BQL7B_vciNpA@mail.gmail.com>
Message-ID: <CAD=FV=UO2hnu0pt2OggyQ0L6onohhzxeGbmtX6BQL7B_vciNpA@mail.gmail.com>
Subject: Re: [PATCH 2/4] serial: qcom-geni: fix DMA mapping leak on shutdown
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Mar 7, 2023 at 8:43=E2=80=AFAM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> Fix what appears to be a copy-paste error that can lead to a leaked DMA
> mapping on close() and failure to restart TX after the port is reopened.
>
> Note that rx_dma_addr is generally NULL when
> qcom_geni_serial_stop_tx_dma() is called as part of shutdown() (but
> tx_dma_addr need not be).
>
> Fixes: 2aaa43c70778 ("tty: serial: qcom-geni-serial: add support for seri=
al engine DMA")
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
