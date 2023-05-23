Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB25470D74A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 10:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235502AbjEWIZR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 04:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236282AbjEWIXs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 04:23:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0101F19A1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 01:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684830053;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DndqY8qaw8M96mn1iEYa/a1K7y8wRhCJTZ8hiaPo6U8=;
        b=Q38WFPTTUIIb54751JQ6i2qOk6Ph9FCC11BTJaHgq40aVkhOQ4bhOg7m6+v/94myvqyWr7
        iqmjrW/oMcQ/R1Pshfu76dfzc4PHHiL0Sjdg7iA29uWX9Q2jnFR5g686A+RP3BK0/mVSaA
        oWxgM3skbjkGVC5dWhE1QBT9iadfr+I=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-zY3G5tynMsa4MKpFYZXJaQ-1; Tue, 23 May 2023 04:20:49 -0400
X-MC-Unique: zY3G5tynMsa4MKpFYZXJaQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-96fe603151eso251285366b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 01:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684830049; x=1687422049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DndqY8qaw8M96mn1iEYa/a1K7y8wRhCJTZ8hiaPo6U8=;
        b=eNGBJCDTwKP95Jh+pbhJx97gVe6a3QsUcOXjVv1B0CEzuGg3nz3qbXV06Rs2TH/xmD
         HGfZmBja/fWvyR/PgeHzHfDQtu+uiH+jc5FUMSjF3TV/V3ORRCBJ7sTx6xULVmGDCMDK
         M5UEPP4cZR/LhWKbpQ8Srdlsg8grZG/paRYRiii7onqfIfQoWyIRBcmBG1QM67vnF9Sl
         v//hhlb9USymv7YIQaBSMZ7q1tpoShsvB+qlp0LH3FM59jgoThx73Sk00lmZIFjgfD0g
         p7AXzgT013w6+yqs/s+Km1IKErrfZbrSyGaMJrtJwgVZJVb6wnZ4eh/6k6oWOX+WdKH/
         z1Dg==
X-Gm-Message-State: AC+VfDxU3k6u+1Vk1bojNIuHdxHIX7wxVWrsfLwlGWBuVrjj5M/Gion0
        q4FdAdKaSxqQcaRq3CIEJXZIy1mgupvZDlb9009ocPr36wXSuitFoSQRkASboVm4vDuE9nGhEfo
        eq0FhlKL3quhF8qCBlG6hNcilcQyVVXpuB2ZLXozaJQ==
X-Received: by 2002:a17:907:3f02:b0:966:4d99:b0aa with SMTP id hq2-20020a1709073f0200b009664d99b0aamr12167258ejc.59.1684830048887;
        Tue, 23 May 2023 01:20:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5vDJ2caLgBzpJg2BUoYLuue6tySLcgqmgfjT+iH7/Q0IOlMoDmJKkj3IlzO+ADI9Tech44ouiizk9C2natgqM=
X-Received: by 2002:a17:907:3f02:b0:966:4d99:b0aa with SMTP id
 hq2-20020a1709073f0200b009664d99b0aamr12167237ejc.59.1684830048553; Tue, 23
 May 2023 01:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230522191701.13406-1-tzimmermann@suse.de>
In-Reply-To: <20230522191701.13406-1-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
Date:   Tue, 23 May 2023 10:20:37 +0200
Message-ID: <CAFOAJEdxxMUpc53m0YkkO+FzqYr+JFcGkH3T6HTnodV5bKm=Fw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Use struct fb_info.screen_buffer
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Thomas,

On Mon, May 22, 2023 at 9:17=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> The fbdev framebuffer is in system memory. Store the address in
> the field 'screen_buffer'. Fixes the following sparse warning.
>
> ../drivers/gpu/drm/msm/msm_fbdev.c:124:26: warning: incorrect type in ass=
ignment (different address spaces)
> ../drivers/gpu/drm/msm/msm_fbdev.c:124:26:    expected char [noderef] __i=
omem *screen_base
> ../drivers/gpu/drm/msm/msm_fbdev.c:124:26:    got void *
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

