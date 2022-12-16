Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA0F64F29F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Dec 2022 21:51:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbiLPUvB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 15:51:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231590AbiLPUu6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 15:50:58 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F8030567
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 12:50:55 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id qk9so8928447ejc.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 12:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ty4Q6pmKGBdcK+JvghcaxT3SktTZCwT4+BsAt6gEM58=;
        b=K281Hjcnge0R86zglG2H9v4Gt/ejUenfiXW6UYj7GNr4X2YogLbL9zN80GvGkEXpLF
         bAscjiNEWAXJvdbmAen53eXH+PgSzU4jrBtGIts4eu+BzaMaTF5Zcp+/cIJ6ooacQEeD
         7p18N6vnCNtUjS6nqN27cydZ6JYP9JpNOQr6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ty4Q6pmKGBdcK+JvghcaxT3SktTZCwT4+BsAt6gEM58=;
        b=x4H8Ba/lGg44ZXLx73D6JDBZEdquexKC29WYCYNm8agDTz5Mf6mrZZhF8oQvDpMRn0
         nlfe2mfBAzUtrBG+QBqbX6R+5sKGMYk/DpD9KzbsZrWeJw5oLnHU1WOJ+4VwkfnzU9S9
         Vx1NaFJOgdHirEr3kzf0pGIqCHU/oszrU/5viwCsuAY8znEZkNkVW3++ScAMb+wpskL5
         ERMrFq4gONV+s0Gm1FX9+2GVA4W2IS6f39QJVmAOVIdpgQRgIVACMyMhw31QPgQk9pEe
         2EMdqlfHJJ3/RK30P6XAgnXFxmxioH7AKVz7YACErOV00xJNhH85t47iY59p0Q0ByWs6
         Qiig==
X-Gm-Message-State: ANoB5pkCs5VLUn/oCP3KPXLy0T0CkZ6xUkWo8DProxt+HFe4IIFbOE7F
        X6zDMp7zBjKOBfmUJcUpp/IxYZdWuoiM+hIKc0Y=
X-Google-Smtp-Source: AA0mqf46gqDIQE/ZRjytTZxIHk4C7RBnY18QX1wDLgsx+hoxTX3H9oZDW7OIctMqQ81drX2oWp+Anw==
X-Received: by 2002:a17:906:66d8:b0:7bb:2867:7a91 with SMTP id k24-20020a17090666d800b007bb28677a91mr28433110ejp.65.1671223853504;
        Fri, 16 Dec 2022 12:50:53 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id c6-20020a056402120600b0045b3853c4b7sm1263991edw.51.2022.12.16.12.50.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 12:50:51 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id y16so3675621wrm.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 12:50:51 -0800 (PST)
X-Received: by 2002:a5d:4950:0:b0:242:1f80:6cd9 with SMTP id
 r16-20020a5d4950000000b002421f806cd9mr26993001wrs.405.1671223850700; Fri, 16
 Dec 2022 12:50:50 -0800 (PST)
MIME-Version: 1.0
References: <1671212293-14767-1-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1671212293-14767-1-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 16 Dec 2022 12:50:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UH_K+oyKOxk88_3zcYTB8C8JHAJVqFwLdO4DE0_wtvBg@mail.gmail.com>
Message-ID: <CAD=FV=UH_K+oyKOxk88_3zcYTB8C8JHAJVqFwLdO4DE0_wtvBg@mail.gmail.com>
Subject: Re: [V2] dmaengine: qcom: gpi: Set link_rx bit on GO TRE for rx operation
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_msavaliy@quicinc.com, mka@chromium.org, swboyd@chromium.org,
        quic_vtanuku@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Dec 16, 2022 at 9:38 AM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> Rx operation on SPI GSI DMA is currently not working.
> As per GSI spec, link_rx bit is to be set on GO TRE on tx
> channel whenever there is going to be a DMA TRE on rx
> channel. This is currently set for duplex operation only.
>
> Set the bit for rx operation as well.
> This is part of changes required to bring up Rx.
>
> Fixes: 94b8f0e58fa1 ("dmaengine: qcom: gpi: set chain and link flag for duplex")
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
> v1 -> v2:
> - updated change description
> ---
>  drivers/dma/qcom/gpi.c | 1 +
>  1 file changed, 1 insertion(+)

Without knowing anything about how the hardware actually works, I can
say that the change looks OK to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
