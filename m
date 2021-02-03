Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F62730D73A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 11:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233662AbhBCKQv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 05:16:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232865AbhBCKQu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 05:16:50 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56311C06174A;
        Wed,  3 Feb 2021 02:16:10 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id y187so4619832wmd.3;
        Wed, 03 Feb 2021 02:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:message-id:mime-version;
        bh=yl2GMo/ZRyYTJF+nXp5dEsJ4EzRz6Kgdjk3GzIkM2DE=;
        b=n0SqmLaWgMRqLX6zlac8j3+FNiXueFvuA1DG7treIv2WRC9oo/Px7TdZYgYoBtFaur
         +igdH1tZPQVPOaeyrsugBcLmEG5v1gzS793GqHtTiNBfn8dAq/2CoxQT+SYtO8FcrJRm
         HCbIyl9jKrjop+vk2QtpWjRfMwJm+Q5aH/pIoZLTUNZdANyzvpmxmfJSZuAi9Au7IvHq
         ScMUR0ZzGyqODtEg+bPbVPhcsww0mTbM0d25NpRqc1O4M1i5UghD4jVjE11j36Y8bial
         srMvLSEYG6RR5CuGrSriDriwmsg2ETk5oenBAFBnw/0eLpKk50ZXRaybx5ohoxNouf56
         bLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:message-id:mime-version;
        bh=yl2GMo/ZRyYTJF+nXp5dEsJ4EzRz6Kgdjk3GzIkM2DE=;
        b=kU2zf3YDyhgSHQ56YMy0HKQeEJ6Mm+MUcod3IqF4f1wj8uBh6a/SC50hA6NrNxcYT6
         qhZOChHG3u0F1SaCV+4i3KVs/8SwWcmpZtliZBhLti2S9O9c3F3OxZ/8OiYt/tayqnhS
         5/MdV0FUiZZi6W8OLibSIBGWf9gXdS01rB/2H2QiUiHvDPY2/9FKiEO9xi6KS9Pg3ABG
         rHbxRT6UygSonzVDZtti3WxXcSsgMY6xBaZRT7cyWdE1A9GBY8fnGgo2sDTvKbRv9fmw
         VQwZPQ1fJiBwFNnFsUP7nt3/SVbiFefuS89Nme0w4JJjHuVkzShtUisJOvvarDw5gHJ4
         lx2g==
X-Gm-Message-State: AOAM530Pv0FORgN7KZfeZEbmq/+LF/0Q2JOycv3CTiwqjdZFswkBOsFP
        +JG5Y2KVhxks5g7Mq/pMngrEjKTdeTQ=
X-Google-Smtp-Source: ABdhPJwUdLzfSYpQmEYMXxLnBXpDYUNGxDilIJxXfL+T8oTA22l8fTLoL8WsjxZjsNxDaceM7ZdeZQ==
X-Received: by 2002:a1c:6308:: with SMTP id x8mr2134937wmb.78.1612347369057;
        Wed, 03 Feb 2021 02:16:09 -0800 (PST)
Received: from [10.19.0.22] (89-38-97-125.hosted-by-worldstream.net. [89.38.97.125])
        by smtp.gmail.com with ESMTPSA id b3sm2315369wme.32.2021.02.03.02.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 02:16:08 -0800 (PST)
Date:   Wed, 03 Feb 2021 14:15:58 +0400
From:   Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH v5 0/5] msm8996 CPU scaling support
To:     loic.poulain@linaro.org
Cc:     amit.kucheria@linaro.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        sboyd@kernel.org
Message-Id: <M67YNQ.F8F0P7L0UKV81@gmail.com>
X-Mailer: geary/3.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Any recent progress on this?

Testing it on Xiaomi MI Note 2 (msm8996pro), It freezes during boot 
and/or crashes and reboots most of the time. When it doesn't do that it 
works well, until I stress all 4 CPUs, which makes it crash. Maybe 
msm8996pro needs some extra work?

Setting s11 to 470000-1140000uV, 980000-980000uV, or 1140000,1140000uV 
doesn't change anything.


