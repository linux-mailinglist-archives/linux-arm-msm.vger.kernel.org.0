Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 744FB6AF2A2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 19:54:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233481AbjCGSyd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 13:54:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233465AbjCGSyH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 13:54:07 -0500
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 782F2B3718
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 10:42:02 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id j8so4100014ilf.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 10:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678214519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIBoIM/MahzmKHcLNphJUdBT59zK6GNgrma5w7fsSlM=;
        b=RSDaAUvJWdX/pgYCQD9V62BikNMQtSk4X+T8iCz13FrSmzG8etaoNw+evqN5EpGvwq
         A3kS3pRnZHrG0Y5rgBHrGQqy9s7dpWwDTXU3PJjJkoZrMlhYEeLVn1ZCJxuBMW0Ct4Uu
         3ojVYRwF9Q5Lf4yMbgwCqvKRi+0J2C4+iPcIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678214519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIBoIM/MahzmKHcLNphJUdBT59zK6GNgrma5w7fsSlM=;
        b=yz7aA8GiXA54bGUAiYCofi467ueIYYn+gwE2TJ8+Kz7VFqklydZ+p3W87cPdPQU05O
         w/SyTxSK75m7zD17mu+rx5yfk1uTHm/QZ0UX8TTBKFEHacPolT0a1eld59qxQ/LUplSy
         5D+izgvZj/3xVcUhgKhaAKjcqXXZf+f472DegLEj1xOxdejdrslTfeaPSoYKCJfi0avS
         B573bg4S5uU++d9fYImbxULe4PNyph+R0Z6/Dqaqq97HJBxivlLehI8fpGMfK06JzftZ
         vXr2dgtd4WUEF/vyQdzXaYearU6XpBAxGEj/nVxew1dzYVlU01aPOtq6CF8S2ASJOFR/
         ZupQ==
X-Gm-Message-State: AO0yUKUc2/6S1+aqJa5BZ/6pVEbp9iK8Yr8HWxkZ7RM1SLBHe1Nrz/jS
        Q3UqXTnQRvNasG8YZll8hP2euXXMED6PfFJJap8=
X-Google-Smtp-Source: AK7set9R4AtiGVXP3rZ6x/2YpwpzUdvxMQKb6s6+fUjGJJLPWuDhLslrvMjysT1IGk4c23d6ozlYmg==
X-Received: by 2002:a05:6e02:13ee:b0:315:586a:c123 with SMTP id w14-20020a056e0213ee00b00315586ac123mr7915957ilj.14.1678214519168;
        Tue, 07 Mar 2023 10:41:59 -0800 (PST)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com. [209.85.166.169])
        by smtp.gmail.com with ESMTPSA id f7-20020a02cac7000000b003f8765183cesm246331jap.87.2023.03.07.10.41.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 10:41:58 -0800 (PST)
Received: by mail-il1-f169.google.com with SMTP id 4so8946744ilz.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 10:41:58 -0800 (PST)
X-Received: by 2002:a05:6e02:928:b0:317:fc57:d2f7 with SMTP id
 o8-20020a056e02092800b00317fc57d2f7mr7437142ilt.6.1678214517983; Tue, 07 Mar
 2023 10:41:57 -0800 (PST)
MIME-Version: 1.0
References: <20230307164405.14218-1-johan+linaro@kernel.org> <20230307164405.14218-4-johan+linaro@kernel.org>
In-Reply-To: <20230307164405.14218-4-johan+linaro@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 7 Mar 2023 10:41:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VR5oCThAuc29Bum-VHQUcH_H+s4nr55YpJk1aYaqZKTQ@mail.gmail.com>
Message-ID: <CAD=FV=VR5oCThAuc29Bum-VHQUcH_H+s4nr55YpJk1aYaqZKTQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] serial: qcom-geni: fix mapping of empty DMA buffer
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
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Mar 7, 2023 at 8:43=E2=80=AFAM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> Make sure that there is data in the ring buffer before trying to set up
> a zero-length DMA transfer.
>
> This specifically fixes the following warning when unmapping the empty
> buffer on the sc8280xp-crd:
>
>    WARNING: CPU: 0 PID: 138 at drivers/iommu/dma-iommu.c:1046 iommu_dma_u=
nmap_page+0xbc/0xd8
>    ...
>    Call trace:
>     iommu_dma_unmap_page+0xbc/0xd8
>     dma_unmap_page_attrs+0x30/0x1c8
>     geni_se_tx_dma_unprep+0x28/0x38
>     qcom_geni_serial_isr+0x358/0x75c
>
> Fixes: 2aaa43c70778 ("tty: serial: qcom-geni-serial: add support for seri=
al engine DMA")
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/q=
com_geni_serial.c
> index 2aa3872e6283..9871225b2f9b 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -631,6 +631,9 @@ static void qcom_geni_serial_start_tx_dma(struct uart=
_port *uport)
>         if (port->tx_dma_addr)
>                 return;
>
> +       if (uart_circ_empty(xmit))
> +               return;

I guess you could remove the uart_circ_empty() test in
qcom_geni_serial_handle_tx_dma() now? In any case, with or without
that:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
