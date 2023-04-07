Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 279B06DAB2D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 12:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240250AbjDGKAz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 06:00:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240252AbjDGKAw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 06:00:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B5E7ED8
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 03:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680861604;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vxzX051vG79fA2lg01PCCeNW25HR0i9loTgMaHJhE/0=;
        b=YrSJU5CrKkNRA5V12Gesr7zDYvHfkyBzPRE9+GOhOgzF2oZ1Vvbmanay7UdJMXpg5ROPkM
        H54ZJmGuFwEFr0UJcrW9ENQ1/BQCza5uoL+es5YX1BbsmaMCFEa78W1HLH31C5p/O5NEXS
        EdxM4c/pj/iuC6P62o1cMEYglWNn9ac=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-x2-PdFO4O2C9-1tacdkQmw-1; Fri, 07 Apr 2023 06:00:00 -0400
X-MC-Unique: x2-PdFO4O2C9-1tacdkQmw-1
Received: by mail-wm1-f69.google.com with SMTP id bg33-20020a05600c3ca100b003ef6d684105so16984197wmb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 03:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680861599;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vxzX051vG79fA2lg01PCCeNW25HR0i9loTgMaHJhE/0=;
        b=jjdrZnDr/Heh3QmJUB7PDgwjKhSDni4N8DBIpmXiOplvUEEIhk74eLuDGZvR5qcr8C
         TF+IQrFSCWmeexG4FM1Z3iVU9/KrCnKMq/WbSfsSp2CCXuQsijT0qb1Qsw8aj/nQX2gM
         4GJo5gTo+/ljpgkTznyoG3ffuZlPjuYGgI8tSjDEO1vXjkA8TlvLzYkBMgNeLKYwsu1b
         0KRUmFaNrTwXYp6lhjydVQeHbuBnFQ5tjCTc7UDhZ9WcYaUMbhLTr2KIqL0dvCU0ws9u
         y+Z1KVAjtE9oEvWzn540D4dkLooaT9EzFEZPNiUaL4UJI2JeGLLjEdDF52AamqXNJQvy
         sClw==
X-Gm-Message-State: AAQBX9fFKbRugU1raGbVlQvFVV+zm58yRbSR5pb18qW56yKXT6SJzHUK
        oVKk1a6ksrtzHD89GLxB32GjwmucYvDm5MxMB4r4uL0Hrjrztg7I4kX4N5yUDeu42SBbevmepPk
        t45XsPoabQ7+dkU08/NM3QTUoBA==
X-Received: by 2002:a7b:c7d1:0:b0:3eb:38b0:e757 with SMTP id z17-20020a7bc7d1000000b003eb38b0e757mr1043874wmk.10.1680861599792;
        Fri, 07 Apr 2023 02:59:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZAbkcTuKHHx1PTF9JjuVOy7h+gk03bYHMX2Dd+d/sWYJgdy2EcgK92+pjvlc6XSCkqiq+Z6Q==
X-Received: by 2002:a7b:c7d1:0:b0:3eb:38b0:e757 with SMTP id z17-20020a7bc7d1000000b003eb38b0e757mr1043856wmk.10.1680861599506;
        Fri, 07 Apr 2023 02:59:59 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id h11-20020adff18b000000b002e40d124460sm4075512wro.97.2023.04.07.02.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 02:59:59 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] drm/msm/adreno: fix sparse warnings in a6xx code
In-Reply-To: <20230407010741.2033800-1-dmitry.baryshkov@linaro.org>
References: <20230407010741.2033800-1-dmitry.baryshkov@linaro.org>
Date:   Fri, 07 Apr 2023 11:59:58 +0200
Message-ID: <87355c8129.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> Sparse reports plenty of warnings against the a6xx code because of
> a6xx_gmu::mmio and a6xx_gmu::rscc members. For some reason they were
> defined as __iomem pointers rather than pointers to __iomem memory.
> Correct the __iomem attribute.
>
> Fixes: 02ef80c54e7c ("drm/msm/a6xx: update pdc/rscc GMU registers for A640/A650")
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202304070550.NrbhJCvP-lkp@intel.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

