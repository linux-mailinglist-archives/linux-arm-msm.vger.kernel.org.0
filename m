Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C07BB6490A7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 21:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiLJUj2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 15:39:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbiLJUj1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 15:39:27 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 766E015FE7;
        Sat, 10 Dec 2022 12:39:25 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id c17so7638146edj.13;
        Sat, 10 Dec 2022 12:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3LALQKy0QuOeuWyS0aogMV9jtIMsiQV7K+AnA2VDNGE=;
        b=e9tWKEj2iSskVQBr5w7+x+qMMDtM58J6f+GLkNeh7VrZCA2E8Y1eFtHGpmVtRW4Uje
         HIRSt72X63FAbymYrPiJmCIk8UOnnKQY/WUmHpCJkyW+Ui5WfnU7gJheez41ALa8il8g
         63Vw3gVSB8ijnecX5WlEMu4GC+LUDwt/OuFL3WV5B4Xu/rUSVeXg0MnOtpd3ywOVwFoc
         L9nK/eZ1ruzL6f5VVF0hR12XA2rbK1nBGVwCWtl6HCEFAVVuiRlwoRnrsJxDsvGbJWo5
         JjYD9OUHP2HUlkkPkcOgQ7HZHLYGdQ9Pb+gGNr+EUPOw4UJ8H92TrGqOq6Rjx0Vlr9tB
         Rypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3LALQKy0QuOeuWyS0aogMV9jtIMsiQV7K+AnA2VDNGE=;
        b=Eh5BqKACKyZuc/RqnT0W9TZDpoTpdx0LOEK6wg+uGEvy86olo90HiF2GszqFq7pZbp
         s/AsVP/zSk6LD3XaWNsXuuDvyZcBB8SShKGUH35Ycqj3zB5tMzG7BsOrmkvAM1pnqXQ6
         K80MU1mXoZsbuCIoZGmpVdTeSU//yu18fs643KjRw3CF9QhxModKRxnysUMmzla9m78c
         GH99IxcLZF07HXC5w4uBVZW7RkXycBW+LvcB9i6P09xunLcHIdvg+b/DFlTRO9dfmwpQ
         bgADhWs6vwyW7wsxRQRCp5Uxzw1TmIm5ndro1mkjxEJuZ+QSI0GHOMwGKUW5Bz5ow1X5
         +gkQ==
X-Gm-Message-State: ANoB5pmgWNWXRbrsmshxgG4pK+r7kS69LXOQs7p8hRlp2ML9/+K07wjN
        PuRtM+e6bXa9tBjXuPtX6r/4ZXohp/CcLX3fudo=
X-Google-Smtp-Source: AA0mqf4amQqHkqYW2GhJmZDaCqjESArYGFOEkX/jtZzfA3ZfLDf239t2Ip9f6vR+7X9dU8zuzHhQocC+b/WyY9xn1qc=
X-Received: by 2002:a50:ef04:0:b0:46b:a74:b3d5 with SMTP id
 m4-20020a50ef04000000b0046b0a74b3d5mr43806260eds.155.1670704763926; Sat, 10
 Dec 2022 12:39:23 -0800 (PST)
MIME-Version: 1.0
References: <2cf45767-7974-3b40-fa18-ec33db5d5ac2@linaro.org>
 <20221210052454.314693-1-dominikkobinski314@gmail.com> <2a571be3-0ade-a8fe-2c9d-abb8e85955ee@linaro.org>
In-Reply-To: <2a571be3-0ade-a8fe-2c9d-abb8e85955ee@linaro.org>
From:   Petr Vorel <petr.vorel@gmail.com>
Date:   Sat, 10 Dec 2022 21:39:10 +0100
Message-ID: <CAB1t1Cw5MxQ-2Cv4iAph8mKTmGsU4qb=t2ViVNWZ9zh88xLj+Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: msm8992-lg-bullhead: Disable cont_splash_mem
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Dominik Kobinski <dominikkobinski314@gmail.com>, agross@kernel.org,
        alexeymin@postmarketos.org, bjorn.andersson@linaro.org,
        bribbers@disroot.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, pevik@seznam.cz
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

Hi Dominik,

Also congratulations for your findings, looking forward testing your patch!
Setting my patch as "rejected" as it's obviously invalid.

Kind regards,
Petr
