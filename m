Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB4A609C28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 10:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbiJXIMw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 04:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230181AbiJXIMu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 04:12:50 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 057CC631C7
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 01:12:46 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id b12so28270957edd.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 01:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QSxvFzOFCLmcptkg3wr863k62dNqq04eMd3Fa7R2F2k=;
        b=O+JWdsPBF1w2HOtUvgOkPasKcpF5j0l09ByjY6bvcTQCHnTlqZvWE3I2LovYgU9SMd
         TM4mj08R9g220p33OTG3qhlZbCJQcYfg16kzEvN1oDE99kd7CzFLtN2NPlfYHzH6vuBd
         SHTkAMSPGeGGMwmdwMGgU6N0nz3RcbAcUzuVhFX8GemfJ5USURweA0GFm7YqOii1PuKJ
         GOU3aUxGWb8lKxK07tu95Aup+jrWTS+7pfSO5oQg2F4mpXQ1D0eT0jxJnhJxNfwDyKeI
         ZCw/pxxSY7Cz0RZi6lwSnMP9THSEhZozWk9S1t+GatIp3xo1emRC72O2/OE0s+Cal0By
         +cVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSxvFzOFCLmcptkg3wr863k62dNqq04eMd3Fa7R2F2k=;
        b=Gopm5yMFcJmSNvk2K+90Dy6krLm4TmLZT7FoCRScyX+Gvxw8euksZCN96CCy2buV+V
         0CK1zi53+MfdMxo+Iw1CYCewWY4ATHE54ONQ8psCbdysfXfD7o2sxJfeyN+qtVofXb9e
         7FkvbPXNc/HquDkaBMZgpeH7VL7X5u0fqaOtcQ1SqCsyrAFSo7bbx+O0XMVKaqpmgzSA
         XQmaco6n1xX4IpXxR7WMO8d26H2ome4xaayvHRwUSdM8RArTuK1MOU0cTq67XKme2x/v
         2d3fGvl0GNdZ0rASKaG6+gFg+TzFZgfoWrhc1BkiBnQBSdwt1/E6AYftl9OxA2XtTRMN
         Vbew==
X-Gm-Message-State: ACrzQf15gFV2vHkP+5oQGNbIQAYjhmJi0qK2ARJqHLybccqpp/Eevjdx
        BxwysNjmBaCTqhaQ4RfbFj8669nvJzGxMvUOZPG11g==
X-Google-Smtp-Source: AMsMyM7yzlJ2pG0fMAkHGDkB0Atzc8h78rHcoaG1puqRvymzarDQxeihvLf9f+xLcTOOO53VUi9KB35gvD1Ak7QbceA=
X-Received: by 2002:a17:907:16aa:b0:6fe:91d5:18d2 with SMTP id
 hc42-20020a17090716aa00b006fe91d518d2mr27007120ejc.190.1666599163952; Mon, 24
 Oct 2022 01:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221024003747.36021-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221024003747.36021-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 24 Oct 2022 10:12:32 +0200
Message-ID: <CACRpkdaO4=TxT+UzcrWrvbA63wcJF-=LPmTeY3U=QKbucuTehw@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: dt-bindings: qcom: Improvements for v6.2
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 24, 2022 at 2:37 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> All my existing Qualcomm pinctrl bindings combined, plus one Neil's.

Excellent Krzysztof, pulled into my devel branch for v6.2 and merged
cleanly!

Yours.
Linus Walleij
