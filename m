Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67A4274A21E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jul 2023 18:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjGFQWV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 12:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjGFQWU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 12:22:20 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A6BB2
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 09:22:19 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-98e011f45ffso107018066b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 09:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688660536; x=1691252536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMP9lJbEuPcrzMgcvC+7r18VxLSwEABRng+Vk+MPbX4=;
        b=U7n69nKRptPeJKVNa9aP/UGkmr0ZQC9+B4QCce4oHp/ZmlS6AvPzRL5k/XD1dDArQc
         Rxa9dfjZDsksNf2evCPEt5QKzKrCV/qbBkonF9EK8EHz/XI8x6LFZ55Z+9ah6MdpJSjf
         8cYDqmrUvsmD48hl2g6/qe18BCokmKXLY96lM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688660536; x=1691252536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMP9lJbEuPcrzMgcvC+7r18VxLSwEABRng+Vk+MPbX4=;
        b=luGwHquOgG5eSniy36ydJRgMXPi8hAltZtwPxjienHF+MATusEaXxAryCkj33qJ+na
         +H9pD7Tp7hzoZPjnPwS9XutFHh7krMAj/6daNs5fVoGl7maoWRZSTOf4s9+8aG5jWKqS
         Ufov8x1vawPBGWdMUtyCALkIGZLMMEahLJyjwD0mCZU6d0lJseid0kXf6rImQG4Qy9Ki
         6O8I19s10EGpCxZ7D54OA/MEWjteaDA5xS4VEOf18hjdxuL/L0iYC0Xhe3lVZPK5KiUs
         XpDvwf4iNBGKZBxaUom2hLUFpBc4/gbA2ATnmPW1rDVgzGyhdmlqI7O15k7Knri83iJS
         iaDA==
X-Gm-Message-State: ABy/qLaNMPOoWd/QY+pTvUdOB8ZVZiS8ucS+zBHQlXLlRp9tVyA37y6v
        nd9viDf7Ri+5w7+vU7lRp8e/N8OV3J2rC07PP4C9SA==
X-Google-Smtp-Source: APBJJlFDNebjYUZkPoM4H2qd+wRZw2gmI3fmI22oS1a0WPWUvUta+R8miWtz7glyL2nyjvnCZ8EkYA==
X-Received: by 2002:a17:907:2991:b0:969:e95e:e4f3 with SMTP id eu17-20020a170907299100b00969e95ee4f3mr1726147ejc.55.1688660536617;
        Thu, 06 Jul 2023 09:22:16 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id j17-20020a170906279100b00982a352f078sm982533ejc.124.2023.07.06.09.22.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 09:22:16 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fbd33a1819so123285e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 09:22:15 -0700 (PDT)
X-Received: by 2002:a05:600c:1ca6:b0:3f7:7bd4:3b9d with SMTP id
 k38-20020a05600c1ca600b003f77bd43b9dmr148605wms.6.1688660535582; Thu, 06 Jul
 2023 09:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <c27953274997a56f8e0522f9331e733ae92bf25b.camel@web.de>
In-Reply-To: <c27953274997a56f8e0522f9331e733ae92bf25b.camel@web.de>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 6 Jul 2023 09:22:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W_WMo4NGMQMYeLGUc_jBM3X4hZAOe-YQw6exBioEtadw@mail.gmail.com>
Message-ID: <CAD=FV=W_WMo4NGMQMYeLGUc_jBM3X4hZAOe-YQw6exBioEtadw@mail.gmail.com>
Subject: Re: drm_bridges on fairphone-fp3 are enabled in the wrong order
To:     Bert Karwatzki <spasswolf@web.de>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jul 5, 2023 at 12:51=E2=80=AFAM Bert Karwatzki <spasswolf@web.de> w=
rote:
>
> The fairphone-fp3 has a drm_panel attached to a dsi bridge. This are adde=
d to
> the bridge_chain in struct drm_encoder in the order dsi, panel. When the
> drm_atomic_bridge_chain_pre_enable these get enabled in the order panel, =
dsi
> because of the list_for_each_entry_reverse. But the drm_panel of the fair=
phone-
> fp3 is enabled using mipi_dsi_dcs_write_buffer which only works if the ds=
i is
> enabled before the panel.
>  To work around this one can revert
>
> commit 9e15123eca7942caa8a3e1f58ec0df7d088df149
> Author: Douglas Anderson <dianders@chromium.org>
> Date:   Tue Jan 31 14:18:25 2023 -0800
>
>     drm/msm/dsi: Stop unconditionally powering up DSI hosts at modeset
>
> This leads to a working panel on startup. But when suspending one runs ag=
ain
> into a similar problem. When the bridges are disabled the dsi is disabled=
 first
> which leads to a failure in disabling the panel again because
> mipi_dsi_dcs_write_buffer fails when the dsi is already switched of.
>  As a simple workarund for both problems I have found it works to exchang=
e the
> order of the bridge chain in drm_endcoder:
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 28b8012a21f2..990f7c68a27c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -550,6 +555,8 @@ int msm_dsi_manager_ext_bridge_init(u8 id)
>                 if (ret < 0)
>                         return ret;
>         }
> +       /* swap bridges in list */
> +       list_swap(&encoder->bridge_chain, encoder->bridge_chain.next);
>
>         /* The pipeline is ready, ping encoders if necessary */
>         msm_dsi_manager_set_split_display(id);
>
> But this does not look like a portable solution so I wonder if there is a=
 better
> way to do this.
>
> The linux kernel used here is a linux-next-20220630, with several out-of-=
tree
> patches which are needed for the msm8953 gpu and the display used in the
> fairphone-fp3 located here: https://github.com/spasswolf/msm8953-linux.gi=
t in
> branch msm8953_iommu_rebase_v2_wlan_modem_ipa_cpufreq_display_debug.

Any chance that "pre_enable_prev_first" works for you? For the best
summary I'm aware of this issue, see:

https://lore.kernel.org/r/CAD=3DFV=3DX_xonf1Dz0BsNTKm4-zBm+ccKvPO+wEWFVMUVY=
_2=3Dh3Q@mail.gmail.com

-Doug
