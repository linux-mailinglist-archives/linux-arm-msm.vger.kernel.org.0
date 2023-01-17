Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2879B66E719
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 20:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231673AbjAQThU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 14:37:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235421AbjAQTfI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 14:35:08 -0500
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D8CA38010
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 10:40:52 -0800 (PST)
Received: by mail-vk1-xa35.google.com with SMTP id t2so15255101vkk.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 10:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HzP1xFoLjj5jhJ3xNiat0BSRJmicxmV9UzOSz4HXrGI=;
        b=lk2Ol42uH592eFDM/2k/N+xqYAdoODD5g/N7UJ7JKoDCDd9fEllMgDaV5J/zMwowGJ
         sylAwhCm918hE3r70qdAMJnL6ktDsrxkF9TElCPUsfufClV394XIYhJBBgqfTl8ftiJ7
         tbR78n4ln2EH8StsOtl5QJTYqIkA2qIC7hzkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HzP1xFoLjj5jhJ3xNiat0BSRJmicxmV9UzOSz4HXrGI=;
        b=pVJCl8nD44RwCzuUjzRxzsws0Fe70K1ciTxXZ1rXeAlye25smM4ZnAGM2cd7a7D6RW
         EePgv48SaxAn5LCaoygVjH2lJ/QhiugdyMisYvpxgdlOK04EBj+PbN5pnIVC1aO4eBLd
         UdiY99cow8GX6927BrDXbvMzmmh66hbI+lsbGGYQ+VrXk0QKdZrqChwRl4UYRsIWCLPI
         DHnCx0wFLpPdUfbajjIrxi3XDn37HT12vAypYpPuHnUw5sGNtpl7Msjo/f56+ZEGMhb5
         eN+kaafa3bXQFHVOry5ldktaBIFeBUzNKPe2odrTcYlpescbHomwCI/Jjm/2LRGvCqQN
         t94g==
X-Gm-Message-State: AFqh2kqL2bDYBbpGYAbOTD3wXCLIROnLpy5DBXhw+u6Ga6DRc0B0Rcpn
        i9WTw9X1RETY8qN9JuZ6tUK0UwRuuYR3AWz+
X-Google-Smtp-Source: AMrXdXtLycyxNVVabz3vPau+1ysDEughs/QAnZvofhF2pw2qykAKskfjILHY0+c/ax3plQqNDJCrXQ==
X-Received: by 2002:a05:6122:1818:b0:3dd:fcfd:dccc with SMTP id ay24-20020a056122181800b003ddfcfddcccmr2601362vkb.5.1673980851438;
        Tue, 17 Jan 2023 10:40:51 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id p69-20020a1fbf48000000b003d5788539c4sm3852205vkf.16.2023.01.17.10.40.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 10:40:50 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id 187so2492522vsv.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 10:40:50 -0800 (PST)
X-Received: by 2002:a67:bb14:0:b0:3ce:acca:5b77 with SMTP id
 m20-20020a67bb14000000b003ceacca5b77mr466044vsn.70.1673980850013; Tue, 17 Jan
 2023 10:40:50 -0800 (PST)
MIME-Version: 1.0
References: <20230117085212.1.If242b1cd61b2e87e312dd9cf81e20301bae2a5a4@changeid>
In-Reply-To: <20230117085212.1.If242b1cd61b2e87e312dd9cf81e20301bae2a5a4@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 17 Jan 2023 10:40:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XNazmGuFkdUEcNoitkced4uuy5C1CJBK4vgpbdZU5AWg@mail.gmail.com>
Message-ID: <CAD=FV=XNazmGuFkdUEcNoitkced4uuy5C1CJBK4vgpbdZU5AWg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: set ath10k output power
 calibration string
To:     Yunlong Jia <ecs.beijing2022@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Bob Moragues <moragues@chromium.org>,
        Henry Sun <henrysun@google.com>,
        Abhishek Kumar <kuabhs@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jan 17, 2023 at 12:57 AM Yunlong Jia <ecs.beijing2022@gmail.com> wrote:
>
> Add the string to load RF output power table for pazquel360 project.
>
> Signed-off-by: Yunlong Jia <ecs.beijing2022@gmail.com>
>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
