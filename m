Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5E965AB1C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jan 2023 20:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjAATHy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Jan 2023 14:07:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjAATHx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Jan 2023 14:07:53 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D94CD9E;
        Sun,  1 Jan 2023 11:07:51 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id i9so37423131edj.4;
        Sun, 01 Jan 2023 11:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zHudL+UI8m/GBwQJJ1MMV4iyqD5yl1+dcmyjJJjdEms=;
        b=PgzfrZZukUs/tZ9WKPuRofnGVDc/jY7nwbJRMpOMECKgry3SvTNawcA/RUnvSJr/+b
         LO7Hm7P5N3B5R5CHfQM3Pkg819vJA5EFc/EIOiYxUNSdy4X/cB1RWT8IhzxeTonCeA0G
         EtOcxi4CrWpWP/eG8t9bu5w09dwNwRV6lkzJ8VlAL2riXLzLQTJNn1+1c4Bwl9rK6x0Q
         NiRkIvEIC/+xlkDlHE28fxhjbq5epHGOl0czR4eUl1rrGcwCFoPxPcy5xfp8egYw2cI5
         vpKCODpg8PHxH+mMLgEQRPht9IGfRy/xWN5JmbzdQsP/+remTzc4zJ+3Ce71ieA3Qs9O
         qWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHudL+UI8m/GBwQJJ1MMV4iyqD5yl1+dcmyjJJjdEms=;
        b=oOxwwJN+Tr87CNdcXXnmX9niFkXixTqxfdH3mhWKYzpFn7axiEdHjzMMJ/WvYUxNZy
         486Skf5qC1wai6bPqTolc5wZqBxmeQM+yR52pqJZ4LCFoPhOcz+rBfRka5y83TF0xk5y
         q7HIMe3rnZzwubXg1sT/KEUCX5evKKQhQC7dBjUWXX8EURdw9XvoSIRFRJZFjrmQE6q8
         E3bJp2UpZhnd7zQkVvoerPKGvQtsMpwcmupk4EKN8EbelkNg4tV8iOxrV91ybmik4eKG
         7CrBqZqc2ZO/F0eDqpLvCiJMyk2XGjNSau+LRyV5gxOsvMM62V8KlCJ9EdJSLY2MAvju
         5lSQ==
X-Gm-Message-State: AFqh2kpYWtoXY9el6EoPC0EUmdJBL7Ewysm+UB88M7eGO4CjEZJsuA8M
        ivy2tetnsEGZ/SH9AIbuGOkT80ya6+RZd3I12HQ=
X-Google-Smtp-Source: AMrXdXsFyjLz8oDCFblz/RO4VhuPcoMIuKfWEu1Cw1l6uhaekna8th0BXc9LtR01UcQfIJYRAM/GB0Gu0TjNGw/82ts=
X-Received: by 2002:aa7:d7c6:0:b0:486:9f80:8fbc with SMTP id
 e6-20020aa7d7c6000000b004869f808fbcmr2418282eds.421.1672600070038; Sun, 01
 Jan 2023 11:07:50 -0800 (PST)
MIME-Version: 1.0
References: <20221230194845.57780-1-dominikkobinski314@gmail.com>
In-Reply-To: <20221230194845.57780-1-dominikkobinski314@gmail.com>
From:   Petr Vorel <petr.vorel@gmail.com>
Date:   Sun, 1 Jan 2023 20:07:38 +0100
Message-ID: <CAB1t1CwhuvX8op47o=P9fHQGHzpOq1yVi0om_WJEPGX=cFsLaA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: msm8994-angler: fix the memory map
To:     Dominik Kobinski <dominikkobinski314@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, pevik@seznam.cz, agross@kernel.org,
        alexeymin@postmarketos.org, quic_bjorande@quicinc.com,
        bribbers@disroot.org, devicetree@vger.kernel.org,
        konrad.dybcio@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi all,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Thanks for this fix, LGTM. Angler is now looks to be stable, I do more
testing next week.

You also fixed cont_splash_mem. My commit 0e5ded926f2a ("arm64: dts:
qcom: msm8994-angler: Disable cont_splash_mem")
was based on LineageOS kernel, which hides memory. I should have known
this and searched more :).

Kind regards,
Petr
