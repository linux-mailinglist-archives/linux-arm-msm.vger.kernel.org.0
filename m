Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43CD96718C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 11:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjARKSI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 05:18:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjARKRl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 05:17:41 -0500
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BECF39D29A
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 01:24:18 -0800 (PST)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-15b9c93848dso26568092fac.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 01:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRayMxpaEWdlAxELlIR1SKSEDhjbkxhQsAK8qAMrB8o=;
        b=PvxSnW/uaMcdy5bTlxgf06sVkXPqUYceCexjbgk7fQjSUFTPdKDKE4xRCGmB6GlfPj
         X/FYJlepLeQf6mt5wY6SH+tNIcXi1AONK0T1nkX6yFj7pJkXLWsOohBrzHxCjwHaWIm8
         Jj3kpQiCWVOVxbkgrfHCDO/jeZFAcJ/uMB8Yk0WiSfXIMUQURKZKcPoK0HmSRx9pMV37
         5/OzsMl//1ufu+gAWzWd5MaW3ezvMTGLtIktPWZVNP4hNwB/phw44SZlEATAVmxXTPMj
         CNBgRAjs4Hwi903GQEeRWtNXXV9cHXplerQptOOKlcwb/F+l43jepU6xzo4C9S2qYp9+
         xdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QRayMxpaEWdlAxELlIR1SKSEDhjbkxhQsAK8qAMrB8o=;
        b=KZAimuB1fYATfNZrwGMao2UzxEIifMmTogbbJqHYtKzZTzKEfr/szpu3FQx0IF0A5v
         rXw0UM8RIj8s9MEw882A4ASGl4pZoiYd0zy3zg/xyIinM5UDUs/WFQLp36MproM4okNG
         1ACbn5FJdu/+bp9G9OREnQDJ77qXTQSXMf3wH88j+rkhkmsfcgWgK0j+1NkXLALutHWb
         OhO2Z6rmQ95v/Li2Xg2B1mmM9xBY3K5YkoPUSsxkhe9fLqXCQd/iLJxh6ZfpXa9i63vH
         W40Sn4vmtzgba/q1H1e9Qr0GDXxGuwIallFqdyg7ggyF0WRKBbROo0KiCDOutZhP14H+
         4QhA==
X-Gm-Message-State: AFqh2ko0gjKWU2JNzffqpAUlfrmSihSa2AGWCsra7uzve3Paoy8Bjuj9
        59xGgxbrLaC+2y7l4lGa6F3NZqk98zH2J5BPDbnqHA==
X-Google-Smtp-Source: AMrXdXsx4Zn9FyH+VngcYJQwWgttvAtRSrmtEim50vpEug4wjEmGLLbRrWROJNqkT+i5VJeBbfflmfVAU59/Na1xLY8=
X-Received: by 2002:a05:6870:7012:b0:15f:1ad9:6c2c with SMTP id
 u18-20020a056870701200b0015f1ad96c2cmr524939oae.184.1674033857132; Wed, 18
 Jan 2023 01:24:17 -0800 (PST)
MIME-Version: 1.0
References: <20230118011230.25847-1-duke_xinanwen@163.com>
In-Reply-To: <20230118011230.25847-1-duke_xinanwen@163.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 18 Jan 2023 10:23:40 +0100
Message-ID: <CAMZdPi92d5zCKvXgn9M8Obqj9YNCE=b7R=6CnigPsjT48jVicA@mail.gmail.com>
Subject: Re: [PATCH v2] bus: mhi: host: pci_generic: Add support for Quectel
 RM520N-GL modem
To:     =?UTF-8?B?RHVrZSBYaW4o6L6b5a6J5paHKQ==?= <duke_xinanwen@163.com>
Cc:     mani@kernel.org, slark_xiao@163.com, gregkh@linuxfoundation.org,
        dnlplm@gmail.com, yonglin.tan@outlook.com,
        fabio.porcedda@gmail.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, inux-kernel@vger.kernel.org,
        jerry.meng@quectel.com, duke.xin@quectel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 18 Jan 2023 at 02:13, Duke Xin(=E8=BE=9B=E5=AE=89=E6=96=87) <duke_x=
inanwen@163.com> wrote:
>
> The project is based on Qualcomm's sdx6x chips for laptop,so the mhi inte=
rface definition and
> enumeration align with previous Quectel sdx24 configuration
>
> Signed-off-by: Duke Xin(=E8=BE=9B=E5=AE=89=E6=96=87) <duke_xinanwen@163.c=
om>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

> ---
>  drivers/bus/mhi/host/pci_generic.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index f39657f71483..e1d697839535 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -335,6 +335,16 @@ static const struct mhi_pci_dev_info mhi_quectel_em1=
xx_info =3D {
>         .sideband_wake =3D true,
>  };
>
> +static const struct mhi_pci_dev_info mhi_quectel_rm5xx_info =3D {
> +       .name =3D "quectel-rm5xx",
> +       .edl =3D "qcom/prog_firehose_sdx6x.elf",
> +       .config =3D &modem_quectel_em1xx_config,
> +       .bar_num =3D MHI_PCI_DEFAULT_BAR_NUM,
> +       .dma_data_width =3D 32,
> +       .mru_default =3D 32768,
> +       .sideband_wake =3D true,
> +};
> +
>  static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] =3D =
{
>         MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 0),
>         MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 0),
> @@ -569,6 +579,8 @@ static const struct pci_device_id mhi_pci_id_table[] =
=3D {
>                 .driver_data =3D (kernel_ulong_t) &mhi_quectel_em1xx_info=
 },
>         { PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x2001), /* EM120R-GL for FCC=
L (sdx24) */
>                 .driver_data =3D (kernel_ulong_t) &mhi_quectel_em1xx_info=
 },
> +       { PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1004), /* RM520N-GL (sdx6x)=
 */
> +               .driver_data =3D (kernel_ulong_t) &mhi_quectel_rm5xx_info=
 },
>         /* T99W175 (sdx55), Both for eSIM and Non-eSIM */
>         { PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0ab),
>                 .driver_data =3D (kernel_ulong_t) &mhi_foxconn_sdx55_info=
 },
> --
> 2.25.1
>
