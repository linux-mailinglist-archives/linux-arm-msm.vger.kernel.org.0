Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D142168BB12
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 12:15:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbjBFLPF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 06:15:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbjBFLPE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 06:15:04 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11A9921281
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 03:15:02 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id o187so13971171ybg.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 03:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=//ppNtZKbVM63Zi5uDUMJ5mkJyUp88IijLwA8MtdH+0=;
        b=yENS7K5f4NPjpmNU6KedjvI2xAyYdBMba/fOyGRGL5FPUfqUNqt9zhi1P2hGJUJa9T
         EyRdgmPs3ZjpZAtHCmN+islvOo3OfBCjp1dfsBZfDHyLrhtliP0UFyiPEseWNvC0lg/y
         MIxmR5zvvw69/6f9ql0S9AklKzldvg1DmEAItM9TvXNJjrUcUURcXkYB8MlTi1o0BgCX
         Mz70O/i4YBJ872IXMnolMtz+wrJAdO2811NlEary1/6/o+5FJKsOKiSqJmjeUqSrzKYO
         UaZBJInspSiUkFVHrpZm3Jx9mLATCSsejFPcPHLJwRMIhCyolbCSxGUu+NWQQgzlB1Ve
         cOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//ppNtZKbVM63Zi5uDUMJ5mkJyUp88IijLwA8MtdH+0=;
        b=jvm+mizzRPG9JBS7dDo12jtkPcZFULnHP78NoqUXRalKoEZWGVjD5O5wDokVWpVdJc
         YvtutRzxHK/3ZZboksMGZaXix26V7fZAr2d9zBHltl73131dHjNML1Jj9y7xKO7CqOId
         +3fAV9311cjZ2ujsODVxB6aTig2R50+Zf4caBg84Kx662n3SLuosDiQ6jJj5a6G12f50
         34bqGqOC9Y40AMYKQtiahUdrjPnBYC3loAeHTUBNCeZvOyWUy4KGXFBJbdUoBNVXENLP
         hQrbdKyQgT0IhWDro0ZJGXs15zKtXOuI43aNv8iC+jWaIxBO2twN2tTxpetPXPwFax69
         JB8A==
X-Gm-Message-State: AO0yUKWRT4/7GkBgGa5YaU1XeXGv6z437Aze7+ASjqkn4YtzHxW8bw8T
        SRqtgOaE2K1MGL9+yhtE5viNmfPNqjyEKGsUqRo/dg==
X-Google-Smtp-Source: AK7set90aQtjp8nJtrL9B/1yoIF9awkZceKz1NEfq0JOdVjxya0FjXFytJWFxyUsudQcaRvyLizIi/JOnpaj02KIMBs=
X-Received: by 2002:a25:fe0a:0:b0:7ca:9b40:72a7 with SMTP id
 k10-20020a25fe0a000000b007ca9b4072a7mr1806027ybe.130.1675682101293; Mon, 06
 Feb 2023 03:15:01 -0800 (PST)
MIME-Version: 1.0
References: <20230203165054.390762-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230203165054.390762-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Feb 2023 12:14:50 +0100
Message-ID: <CACRpkdazbe2GQy=DBOs_Ya=VKXwT5oN8R9BOz4HoLsLuAGt3BQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sm8450-lpass-lpi: correct swr_rx_data group
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Fri, Feb 3, 2023 at 5:51 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> According to hardware programming guide, the swr_rx_data pin group has
> only two pins (GPIO5 and GPIO6).  This is also visible in "struct
> sm8450_groups" in the driver - GPIO15 does not have swr_rx_data
> function.
>
> Fixes: ec1652fc4d56 ("pinctrl: qcom: Add sm8450 lpass lpi pinctrl driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied for (last minute) fixes!

Yours,
Linus Walleij
