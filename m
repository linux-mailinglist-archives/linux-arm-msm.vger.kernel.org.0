Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5344A504A20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Apr 2022 01:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235406AbiDQXpg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Apr 2022 19:45:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234659AbiDQXpf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Apr 2022 19:45:35 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FDCD13F09
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Apr 2022 16:42:57 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id u12so2990028ybi.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Apr 2022 16:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Le1W4emwmC8SAm7xHcpciZnFzcfo5oYtjJ98cu6Km6I=;
        b=DfXFYpXmszgBq535LnqMbUGOAhbJ1lybwvoIEPYj42FDvwilY5mQXELmsLtBEnX0l3
         3rOTpuwSg8i4vX0KIicaioTF8Vq0/tey7SKCBPu+sNEhYaLfreG1Br6+0vL+7izS4YMf
         1SoJdDHhk3VGIyBXajk2RRMM+f7OL+vBA8hEE0zOu3xU/z3xtWTKnPoeVbDvqer7xd7A
         98V4VV0JK17y+S/Z6VLtvbGD3RpnW7a+UvMuFUXHBPbPMcDTS0NeoLUWHF+YzTbopZLC
         FA/a/SEvcs1myAs+prKPSbvMVVFDu9EG6MbJgeyiaR2oo7r50fXe3MNnSrNuR+Q/wSDl
         c8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Le1W4emwmC8SAm7xHcpciZnFzcfo5oYtjJ98cu6Km6I=;
        b=7FLhueL7MnNzW4KN+wNdZGJaQGVNPdU4CBjVPXCPURG7GANXzQL1FLTlDRVPc0g0vO
         7mwHSoaWUV6/s75kzkI9ZH0RLa6YpS6kBh5cK0DxeVCf/z5fx4zgFDnmSiPLNrbPHgv2
         EHRvXmlAA/gaevQMBLJuA3qWJ8U+9dZTCK8KqBi/jyFqrL9/69pJT1MiPlzrDVekk156
         OCEO6yue/vj2TgEMfVNfqzOsXEW87fhwvieIdcmX9vPoPonWUJ1Ohr7tOH7KC+R6u690
         qAUJpq2jt3JoepkeTEDllfoRwqFLyE9t0xSU9TE8KLXvGXLvB9B5KsFJi35bmylbzfsL
         sjxg==
X-Gm-Message-State: AOAM531KhELELe0W3VKjCF1ew8JbXxEr6gviTmicLjo4qfqtNxMvvVIp
        Aj4enSEE7ppmrGpPp4U8E1QaCwWDQW9s1jEbKvH7MQ==
X-Google-Smtp-Source: ABdhPJwtcjuDUl0/1lhkF30uD62jYzzr8ofEalJ5SS2ebSGJfVM87d/e3g3rnjrSOYRrOwPONcc3UtP80VEZPfT/QL4=
X-Received: by 2002:a25:4e82:0:b0:633:68d7:b864 with SMTP id
 c124-20020a254e82000000b0063368d7b864mr8143618ybb.514.1650238976760; Sun, 17
 Apr 2022 16:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220321133318.99406-1-luca.weiss@fairphone.com> <20220321133318.99406-5-luca.weiss@fairphone.com>
In-Reply-To: <20220321133318.99406-5-luca.weiss@fairphone.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Apr 2022 01:42:45 +0200
Message-ID: <CACRpkdbuLVS=+1GM77nGD7Aq0haOOEbFi-0gO-u63EaJwpxg2A@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] pinctrl: qcom: sm6350: fix order of UFS & SDC pins
To:     Luca Weiss <luca.weiss@fairphone.com>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 21, 2022 at 2:33 PM Luca Weiss <luca.weiss@fairphone.com> wrote:

> In other places the SDC and UFS pins have been swapped but this was
> missed in the PINCTRL_PIN definitions. Fix that.
>
> Fixes: 7d74b55afd27 ("pinctrl: qcom: Add SM6350 pinctrl driver")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Changes in v2:
> - nothing

Since no changes I assume it was OK I applied v1.

Yours,
Linus Walleij
