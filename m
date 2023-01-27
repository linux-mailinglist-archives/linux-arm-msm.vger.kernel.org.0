Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E58E67DF7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 09:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232471AbjA0IvD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 03:51:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231895AbjA0IvC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 03:51:02 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E539017149
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 00:51:00 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-50aa54cc7c0so30570747b3.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 00:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ust5T1dOQ0zL+HLLGTDn3zdUYMh/5770ZElRgQ3sPDg=;
        b=obzjvlT1y9jt6kSminE3izVC8zsG+ufoMFpKAz7oy4XW4QKmvCOTcTHXpYMVmCmgdx
         fWsV39ysAELR3n/hY0ldJBfN5QUGlIpo1YvPn0O3IUMBLAQ8gycCUwKtgOJYneCL2kpB
         n6kkcVRyGl3ystC0vK5VQb9YZpsfYah8wElQpMH5ZoQw9lMipH4AWZ+yuEC2LEcnq+U6
         sH1blQqVQU790uWxsio6IAePBfsKDhlgmQtTGXjBwQjTwkwvoSifmup3B+6NntVoovoH
         K6PtteRwWGzWKmqKkMSV7uFK+0ubQthmhBIwC3dkdhda/yxh9gcWLRo+yAQuEr86HRiZ
         bXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ust5T1dOQ0zL+HLLGTDn3zdUYMh/5770ZElRgQ3sPDg=;
        b=fyQaJeNO6C9fdIpWJG7do6ROOH/7O9Fd+BJWgZn3UtJFs5IjfOyY1kpTkw+NPN5qlJ
         1x+t4/0kJ8I8Ul+iK9SHXcjKtujQuRVW+p2Hm1Htqm6hW8306jf7vhJU30G2Sw/rBhLA
         Zz9WAClUQBd9AV9l368HEa1JDKeAV1TPdmvduu1hii7VwzVnCNk+YPFEgOKIfcyoRX/7
         TLTEdk8dYDjEkSOt9kbDNeHVHK7qYb1DvWRrl9jnzxHJoDIpVK5Q7LojfqUbduUluUop
         gZwejS3RzPzqtywUhv9wOhAuhFu6fZvo3TxM2SQgFEz5kAEwYjjYMCtUO4LaobFL2UIC
         hKjQ==
X-Gm-Message-State: AFqh2kovFylLe+LIVBgZQwD1o2z9Qgf0UYVYONsYG0Dff6IBsU/K3fnJ
        jOgCDr8bEKErjcBvNLfBnt+DXdb0YBgdBfwclZIS3g==
X-Google-Smtp-Source: AMrXdXsm/Hv7McSrHeZXMfE8TeNjNxQAnkGxQwfCfkr1WBI7rjZDVKp4ILbZt75wR8jNHQ/kqB6Fpz/eHIeitvmf610=
X-Received: by 2002:a81:6842:0:b0:4ff:e4bc:b56f with SMTP id
 d63-20020a816842000000b004ffe4bcb56fmr3524838ywc.488.1674809460124; Fri, 27
 Jan 2023 00:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20230124141541.8290-1-quic_devipriy@quicinc.com> <20230124141541.8290-7-quic_devipriy@quicinc.com>
In-Reply-To: <20230124141541.8290-7-quic_devipriy@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Jan 2023 09:50:49 +0100
Message-ID: <CACRpkdZTMdK06jfuydwSpwMXLAeoL45EL4z2Msn-po+MjUZxNA@mail.gmail.com>
Subject: Re: [PATCH V1 6/8] dt-bindings: mmc: sdhci-msm: Document the IPQ9574 compatible
To:     devi priya <quic_devipriy@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, tdas@codeaurora.org, bhupesh.sharma@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_srichara@quicinc.com,
        quic_gokulsri@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_arajkuma@quicinc.com,
        quic_anusha@quicinc.com, quic_poovendh@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 24, 2023 at 3:17 PM devi priya <quic_devipriy@quicinc.com> wrote:

> Document the compatible for SDHCI on IPQ9574.
>
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
