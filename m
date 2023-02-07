Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6328268E110
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 20:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231172AbjBGTWl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 14:22:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbjBGTWk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 14:22:40 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75F6C32E7C
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 11:22:38 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id i38so6437476eda.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 11:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0CM3/zkrXnsMCzSZ1ZbJOrbxkjUcPJYb1JsqQcYt9Bg=;
        b=bXtTumXfjAByJWcMd1uyF3UV+bT4Yme7QPiULY6HbPNro04ZozTwNeizFCioU+1p9U
         ZEHJ891srxVGfxMkaHl44Pmnq2/N9zKaect8/eDvjkTDISFYt7GBdXqUs39oggsKonoO
         XWcoS+yGKYrvbmfv+ZdgWgYGfrsIM0zQnHqOvGqIqg5lXH8IwhVStUi74wySgTzkSJRr
         Inp9M7Ea0i2hXZxZkn6Re4193LcRlTS3kmM8qIsk56XRwuam0AkJE9ZzD7/auh8W2UBy
         eIee5fbmI9Fepu7GWQAig4+V5gErMNvzFfZMNqsMAQoxeIs+BkVApxgN+YdXzzkXRWTI
         y+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0CM3/zkrXnsMCzSZ1ZbJOrbxkjUcPJYb1JsqQcYt9Bg=;
        b=PLa6iPXSIFuQc2t4DHiu6TZrbFTC4loMsfbtzF0RipBJ9u/Vq7MeRaiWIhV3Cnidr0
         NWe5zED8PJ6GJiL/AK11qbjFQnM3EMHM1V+uKWq7Swwd23H3MVYe+B84lYRDvZEy+ULn
         XrPYCBY0AEk9f39nfiux2AWkdJBY6ikAVt/XaN7s6L6/h8g14N9CEZrK8D/ntN3CM6ba
         XE8/B3V/MP1UB5+qlK6tQFChZpc0AKd2WDx29Zc6jsspe1uWlpQ2pAIOHy4RZHNwU6yz
         l533l9y0w0x/3cl0gWMeAg4C1obGxLsCs/JtWuAKziV2HlKc9AigQSPh7qfVxtC2RyXO
         CCtg==
X-Gm-Message-State: AO0yUKX89OH/dJ7QVqiffsjfqXglUHhkwqFlIcs3YHjfa7dfCjRJ7nhV
        JYCa4sv5kIgHOo/bxekGWNsffWnSD5YVcmjpdCI=
X-Google-Smtp-Source: AK7set+HhnbVrHoHGpDm1V3Q2jT/ndCOQkidXbxv3TvkzpJXzM291+B1xThz4tpw7Wg7YlpOixIH1CW+/xCpZKtFeHY=
X-Received: by 2002:a50:c3cc:0:b0:4aa:b323:9d42 with SMTP id
 i12-20020a50c3cc000000b004aab3239d42mr1157637edf.8.1675797757024; Tue, 07 Feb
 2023 11:22:37 -0800 (PST)
MIME-Version: 1.0
References: <20230203122118.15219-1-pvorel@suse.cz>
In-Reply-To: <20230203122118.15219-1-pvorel@suse.cz>
From:   Petr Vorel <petr.vorel@gmail.com>
Date:   Tue, 7 Feb 2023 20:22:25 +0100
Message-ID: <CAB1t1CysTNGTjPWy+KxTsZVE6aaVhJ+gK7ZCaV0tNKi9JdxNNg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] arm64: dts: qcom: msm8994-huawei-angler: Add regulators
To:     Petr Vorel <pvorel@suse.cz>
Cc:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Jamie Douglass <jamiemdouglass@gmail.com>
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

note, I see ~ 2 sec after booting 2 regulators are switched off:
[   31.712971] l28: disabling
[   31.713174] l31: disabling

Not sure if that is OK.

Otherwise, unresolved  qcom,init-current from downstream is the only thing
which prevents me to ask to merge this.

Kind regards,
Petr
