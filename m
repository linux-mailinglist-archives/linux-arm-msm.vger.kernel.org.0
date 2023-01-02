Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8263865ADD7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 09:01:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjABIBW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 03:01:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbjABIBU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 03:01:20 -0500
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B893BB8A
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 00:01:19 -0800 (PST)
Received: by mail-oo1-xc36.google.com with SMTP id x15-20020a4ab90f000000b004e64a0a967fso1759769ooo.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 00:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40JsF6PNmDEZZ4y8a8jdXK2aWXlWFPHueZj2OHlZ0eg=;
        b=c9/UDfhp8SQ2BtyvFBkKPyAXxdwVen1w2VO/AWBh8I9/xiR0kuqMXnutL6DjL+FtYw
         nk8KWCqU3dxvdHb5JZ5NgdAJmBZbRAC0Q5CpET6gMXz+E4ZKrV3jFdt1Iu+sU/S6DNk3
         rdiI9KH2w3e7Cgamhmy7t/INRXx94/9fesPRA/bp65r5q3wKqXg6+9aE9tSfxeLrGAw5
         +9737DzFSQ7KJKpjnYnmHD//JcWX3d2XJyrdfWp0L6zmivC1kG3/I/1GMhalo2oQdg8n
         yJkHMpkNR6ohto3q1CJilOkTVm0cIw8fr7gltxFTwNy2jplH+D6mDEUl25pStNAJ4L/L
         VTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=40JsF6PNmDEZZ4y8a8jdXK2aWXlWFPHueZj2OHlZ0eg=;
        b=dsoOjdqF8Ybj0VyOKfPaCZ0gmrX5xHXZPxzXlgze8H8KyYIsHT2N/L5sDGysgAhLAq
         NHW1rcfPW7POztpGqkQDwEGmaac3B92Ol9NQwZakJm15ZbolPejY1AlmbSd+FuWbV8h+
         rsJ22AdhJButhf6zUoqaiUhL8jeelZ5+5cjluKNvUkT99liSIGCZzjvRDRbAvL1NYM+7
         UB2fqEprbOfyY9S98lcqVSQfdAMTT1qMKd3ilVmSlRMiTWSbwOHIWCD+92Jkqo/JhkUq
         lep5jIglM6+LgVDpN1j0/H7ljZc+o0UZ9Z+VEDVc+u5mCWOqyjYgCnQ+wwaqk8xYCmmk
         TcuQ==
X-Gm-Message-State: AFqh2koPG8XsIDmjSMfcc5QTgFNJ1T2GpMOcShJoQB4PziQ3tJILDnlf
        ylKeDoPPDMGEwgASqtCyylHmBdE9nVWplxNiYAnxDg==
X-Google-Smtp-Source: AMrXdXu1Qi5mlSVdZMFT2cQ/3oABMgacFmnT1FSvlTPrxV6i4ytnGLFT3VQMVBbgf2xOvoXXPH5wcVqfrIFQEU/ityg=
X-Received: by 2002:a05:6820:82c:b0:498:260c:d780 with SMTP id
 bg44-20020a056820082c00b00498260cd780mr1849729oob.27.1672646478952; Mon, 02
 Jan 2023 00:01:18 -0800 (PST)
MIME-Version: 1.0
References: <20221230075726.122806-1-duke_xinanwen@163.com>
In-Reply-To: <20221230075726.122806-1-duke_xinanwen@163.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 2 Jan 2023 09:00:42 +0100
Message-ID: <CAMZdPi_zPFq7meLbTQ9mA8b+9VHtz-N=8-NFAwKzPDaq7XAakg@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add support for Quectel
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Duke,

On Fri, 30 Dec 2022 at 08:57, Duke Xin(=E8=BE=9B=E5=AE=89=E6=96=87) <duke_x=
inanwen@163.com> wrote:
>
> The project is based on Qualcomm's sdx6x chips for laptop,so the mhi inte=
rface definition and
> enumeration align with previous Quectel sdx24 configuration
>
> Signed-off-by: Duke Xin(=E8=BE=9B=E5=AE=89=E6=96=87) <duke_xinanwen@163.c=
om>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 46 ++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index f39657f71483..83f40617af9a 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -335,6 +335,50 @@ static const struct mhi_pci_dev_info mhi_quectel_em1=
xx_info =3D {
>         .sideband_wake =3D true,
>  };
>
> +static const struct mhi_channel_config mhi_quectel_rm5xx_channels[] =3D =
{
> +       MHI_CHANNEL_CONFIG_UL(0, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(1, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
> +       MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
> +       MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +       /* The EDL firmware is a flash-programmer exposing firehose proto=
col */
> +       MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
> +       MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_quectel_rm5xx_events[] =3D {
> +       MHI_EVENT_CONFIG_CTRL(0, 128),
> +       MHI_EVENT_CONFIG_DATA(1, 128),
> +       MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +       MHI_EVENT_CONFIG_HW_DATA(3, 1024, 101)
> +};
> +
> +static const struct mhi_controller_config modem_quectel_rm5xx_config =3D=
 {
> +       .max_channels =3D 128,
> +       .timeout_ms =3D 20000,
> +       .num_channels =3D ARRAY_SIZE(mhi_quectel_rm5xx_channels),
> +       .ch_cfg =3D mhi_quectel_rm5xx_channels,
> +       .num_events =3D ARRAY_SIZE(mhi_quectel_rm5xx_events),
> +       .event_cfg =3D mhi_quectel_rm5xx_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_quectel_rm5xx_info =3D {
> +       .name =3D "quectel-rm5xx",
> +       .edl =3D "qcom/prog_firehose_sdx6x.elf",
> +       .config =3D &modem_quectel_rm5xx_config,

Use `modem_quectel_em1xx_config` if compatible instead of duplicating
the configuration.

Regards,
Loic
