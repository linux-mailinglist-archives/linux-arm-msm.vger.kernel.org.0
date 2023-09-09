Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 299C779999A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Sep 2023 18:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232666AbjIIQZZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Sep 2023 12:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346453AbjIIOiR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Sep 2023 10:38:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A825188
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Sep 2023 07:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694270252;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eRcOkbLQiqXFau3Lzv+lkDuNMwp9k8LF7/IY5MKHdsU=;
        b=Ekf6PoiE+uQ9x88AYf4zRfx2CZ4HUSwTWAy6jueKhvlxWQvPU07NpxTYR4Pifoul6PvRCp
        GiAFHD4SxPQED2r3f2VACAFcB+86bf3p46XrLo6aSLKhRQyERax0G3I/JqIza5n1VqfHUR
        xKf8tK6fwiquMNSCboljOwNHaPXhXls=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-AXlhG-fQPRameZwpGOMXbg-1; Sat, 09 Sep 2023 10:37:31 -0400
X-MC-Unique: AXlhG-fQPRameZwpGOMXbg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-401ea9bf934so23638085e9.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Sep 2023 07:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694270250; x=1694875050;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRcOkbLQiqXFau3Lzv+lkDuNMwp9k8LF7/IY5MKHdsU=;
        b=QnzLCiiTYuqJWEGRfsVQehAf0AVO8lyv7l1en+QRAPQF6GMX2sRtgMala3wm+BnNHL
         lrDrlycCloKJB0o296HR4k2Vyy1wY0Rwo9e0I9Ar9gfNXJdxFliGK1vrWNb9KdjNv6Y6
         yGLdxRtXODwmtvNSA3TH0j+d2wv9H987AhTVPmF5BPDD+/vmp8sMDsfTLanlXPSWvhYT
         ukd+LLIKbgCAALTUkxuI9N7o23BIBcBpv2qSwdZGBhrYQnhxRpeen+c4xeH6krezq2us
         i2MrqYfiENl0GjZTFDWjARgttIlawYLS843EPhZKCNXGicF2dm8n8uhoJKN7EvZn1nnC
         Z3uw==
X-Gm-Message-State: AOJu0YyEi6JUEO0iLiOOOhbTOJnACeL98iaV00DcGslLccoAeI3nUM4N
        mUyvruuVXfaBcr7aewrFyQ3cBpHAXDvEhxkm0cfIwWOPDMaIzXgrNDCYhbfLPcTSuAfEV08n0gb
        v0WNBr/BFLJ+dNWvuLfrwe5XYFA==
X-Received: by 2002:a05:600c:2483:b0:401:d2cb:e6f3 with SMTP id 3-20020a05600c248300b00401d2cbe6f3mr5088914wms.1.1694270250167;
        Sat, 09 Sep 2023 07:37:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuI0CHTrTRuHu7U+ySuZ17CrBG1YsmWNBf7nwWhsv6ytgzHpvaJlIL3zjF99nLHiP4wc2jkQ==
X-Received: by 2002:a05:600c:2483:b0:401:d2cb:e6f3 with SMTP id 3-20020a05600c248300b00401d2cbe6f3mr5088899wms.1.1694270249806;
        Sat, 09 Sep 2023 07:37:29 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k20-20020a7bc414000000b003fd2e898aa3sm3071184wmi.0.2023.09.09.07.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 07:37:28 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Mali DP Maintainers <malidp@foss.arm.com>,
        dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        etnaviv@lists.freedesktop.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Yongqin Liu <yongqin.liu@linaro.org>,
        John Stultz <jstultz@google.com>, linux-mips@vger.kernel.org,
        lima@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/53] drm: Convert to platform remove callback
 returning void
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
Date:   Sat, 09 Sep 2023 16:37:28 +0200
Message-ID: <8734znjtuf.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:

Hello Uwe,

> Hello,
>
> this patch series adapts the platform drivers below drivers/gpu/drm
> to use the .remove_new() callback. Compared to the traditional .remove()
> callback .remove_new() returns no value. This is a good thing because
> the driver core doesn't (and cannot) cope for errors during remove. The
> only effect of a non-zero return value in .remove() is that the driver
> core emits a warning. The device is removed anyhow and an early return
> from .remove() usually yields a resource leak.
>
> By changing the remove callback to return void driver authors cannot
> reasonably (but wrongly) assume any more that there happens some kind of
> cleanup later.
>
> Best regards
> Uwe
>
> Uwe Kleine-K=C3=B6nig (53):

[...]

>   drm/imx/ipuv3: Convert to platform remove callback returning void
>   drm/ingenic: Convert to platform remove callback returning void

[...]

>   drm/mediatek: Convert to platform remove callback returning void
>   drm/mediatek: Convert to platform remove callback returning void

[...]

>   drm/msm: Convert to platform remove callback returning void

[...]

>   drm/shmobile: Convert to platform remove callback returning void

Pushed these to drm-misc (drm-misc-next). Thanks!

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

