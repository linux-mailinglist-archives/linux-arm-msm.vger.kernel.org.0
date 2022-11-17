Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5DA862E51A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 20:15:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240406AbiKQTPT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 14:15:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240691AbiKQTPQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 14:15:16 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C48A7EC84
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 11:15:12 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id k1so2527751vsc.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 11:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vItTHGOizc2pJUPYRIu39XVH/su6UB5B0GzgAXAm3GM=;
        b=nUPU8YxnoKzHw+jQpnXUFKj9Ko72LFxFRqsB79j5GYlmJiwz3Kx6Dz348WuS4jb2SC
         0jJCqqpsFh0PfZ6PUxj3b9Aovba8wv1BbWKBk2+MNOcXzvYJffb5ZOkeeMtYW6cptR5R
         eS1Q/RWtjpHhOBxY8l9ahW68rRoJFytStPV6GpQSYV11St7eaUa9TLakKJtcKoL3kT4g
         t9OobWNqtP4CjtZ551Lx1g+/weunFG/W+8m8OI6QjNMQehLz9vOHkJJUBphP2eEHUvmO
         7ZxI76GRqovP0iR6d08VHLwtN/HMJy69zc2B3T2n732uA14aYOFzlXMR6s6Y3mMFnq9w
         UUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vItTHGOizc2pJUPYRIu39XVH/su6UB5B0GzgAXAm3GM=;
        b=0jeIit7uUfEBmMMVZDN/QmWCZP9H+rhYQ4DcPfeINk9g0GHes2Yo0+usHSOy7EEkfs
         jNYTixoFm40nwrdKzXw1VvhXEXDus4LVE0rux/rz728ZRoIZz4VG4blFnZE+snhg2wSn
         TqHcPgrtkKEDmL3YjuBanX0CWHhXJB2jMWSGQPP/7ilf3TpXon59sUon9UAxyaDunwUR
         44YJ/G8pjWLsEqEtxoA/C1qotMdE4eO905aNaQhjGSP9kRHnKjQoATyw6HUyKOlqqGKE
         elhgXXjsqhYaZlkmFb83J2kpjfi2odJJmz3V8+0PSRYU4Lu+2Dv9qBlGUHoCb6W2CuuX
         Xh6Q==
X-Gm-Message-State: ANoB5pmd8ctwAPDOknn9zUgHTmx9HxuuToqj3W8e4b8dtzYCDHoVAdDS
        8PttHQGfqAE26M6mqHB2+3yXqm6TsLyB1SqF1dqh
X-Google-Smtp-Source: AA0mqf7ms4nq0R0RD9z9FvQFYF6+oYVkiK7zi+w1xFrhqTqHtNFCMeKObvE6XVrQ2UkX2JLzJH17FUBlAGf4/AJ4Eps=
X-Received: by 2002:a67:ed94:0:b0:3aa:8846:b9a with SMTP id
 d20-20020a67ed94000000b003aa88460b9amr2528933vsp.58.1668712511218; Thu, 17
 Nov 2022 11:15:11 -0800 (PST)
MIME-Version: 1.0
References: <20221116115348.517599-1-javierm@redhat.com> <20221116115348.517599-2-javierm@redhat.com>
In-Reply-To: <20221116115348.517599-2-javierm@redhat.com>
From:   John Stultz <jstultz@google.com>
Date:   Thu, 17 Nov 2022 11:14:59 -0800
Message-ID: <CANDhNCoa+LRu8B4+M+uU4_m2kd=HriO0SyNP=n=XpXwXG2k9LA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] driver core: Make driver_deferred_probe_timeout a
 static variable
To:     Javier Martinez Canillas <javierm@redhat.com>
Cc:     linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Peter Robinson <pbrobinson@redhat.com>,
        Enric Balletbo i Serra <eballetbo@redhat.com>,
        Steev Klimaszewski <steev@kali.org>,
        Rob Herring <robh@kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-arm-msm@vger.kernel.org,
        Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 16, 2022 at 3:54 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> It is not used outside of its compilation unit, so there's no need to
> export this variable.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>
> (no changes since v1)
>
>  drivers/base/dd.c             | 6 ++----
>  include/linux/device/driver.h | 1 -
>  2 files changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 3dda62503102..040b4060f903 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -257,13 +257,11 @@ static int deferred_devs_show(struct seq_file *s, void *data)
>  DEFINE_SHOW_ATTRIBUTE(deferred_devs);
>
>  #ifdef CONFIG_MODULES
> -int driver_deferred_probe_timeout = 10;
> +static int driver_deferred_probe_timeout = 10;
>  #else
> -int driver_deferred_probe_timeout;
> +static int driver_deferred_probe_timeout;
>  #endif
>
> -EXPORT_SYMBOL_GPL(driver_deferred_probe_timeout);
> -

Yeah, I added the EXPORT for the regulator code to use it in
dca0b44957e5 but that got backed out when setting
driver_deferred_probe_timeout to 30s was reverted, and this bit was
forgotten.

Thanks for catching this!

Acked-by: John Stultz <jstultz@google.com>
