Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F398E581B3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 22:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239761AbiGZUmh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 16:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239684AbiGZUmg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 16:42:36 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE202371BD
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 13:42:34 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id u12so11380343qtk.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 13:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/Imn4sxmNV9F8KiWb9MLDPcsE1dh/DZoTX9lMJawPCg=;
        b=ZxxOLVicgZJL947w9Srb8UyZjT6HbnAWkhZhNRAsQFkPOcEOWT4swTRYW+bFrkbLbx
         2zWLznnk7m6IAM2nqfg8OtcJRNg51p5G3BfC73n/fP/oorJ3UjN4mjqPOJ+mLsqLmXeK
         J8oQBH5r/O+POh089Eoiq6oeF+yCbJPH5GEjtAtpHHKODHzmbLdpuGAdGEBj+3NZAxMO
         UedYtcU6UROzRBWqbycPD85XMve7qZKO0ANvZWpOwFljNFApI9c/FzTI2moPaYBq5MDm
         A/IKBNVPyA5Ju7sWatYrHKcZ18nqSbWLmp3uiuu0gqJO6GtoPtHUD34570ZAvmc47/ly
         XJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Imn4sxmNV9F8KiWb9MLDPcsE1dh/DZoTX9lMJawPCg=;
        b=ptFdJxAb4BWftHdfc076EptiXyL3D8ly7DpdxzG5t5EnN/2OhHeTgNF5T+ifbKz+zH
         0uEhn5okCOf6VoyzksnFpt7QqnX5xUlFRggefb9JZ7C6041t/PfFUrDLtUK21qIx4ivD
         Ee0aC6xmluEJnnwM8ZavKICoRgT8rjlFctH9ehoOCnlP2tVoALahQkD2KVOcAKng2f97
         gfnKtDa3WgNpHmLgbMQY6iwDD/YpRL7FZB8Fb2UVCsLJXJCaPGvzybvQdkHhxRe5Sbh/
         3m1OEt4vwpisR++A6qdwHXV4cyzOp/lWuYgLnpuZujKbw77C2Uoh8WSPGC3qpUla4rkj
         htqQ==
X-Gm-Message-State: AJIora9LJXEpFvx8E12vF7kqvk/duGpJd5gRn+hGY4vaT6ErUcBIHKvR
        oQTFLyQ8zKWjbs0ycxR/QIzIrvDgWxdT0kXsw4IJkA==
X-Google-Smtp-Source: AGRyM1sScv7bITRdsAKXqkenlEOfOWYJzuPLbg7XR9pEzONkgE+IYjIhOHcKcuxvGW8l9nX1KVyShHZLo6PpJCp7Lmk=
X-Received: by 2002:a05:622a:451:b0:31f:4257:4eb2 with SMTP id
 o17-20020a05622a045100b0031f42574eb2mr3329446qtx.370.1658868154010; Tue, 26
 Jul 2022 13:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220726181133.3262695-1-iskren.chernev@gmail.com> <20220726181133.3262695-6-iskren.chernev@gmail.com>
In-Reply-To: <20220726181133.3262695-6-iskren.chernev@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 26 Jul 2022 23:42:23 +0300
Message-ID: <CAA8EJpqB1idqrSek7nApVeAO7uZ-i33nwRdqn9ec3J4fBh_wHQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] regulator: qcom_smd: Add PM6125 regulators support
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
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

On Tue, 26 Jul 2022 at 21:12, Iskren Chernev <iskren.chernev@gmail.com> wrote:
>
> Add support for PM6125 PMIC which is found on SM4250/6115 SoCs.
>
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>

Please fix the order of sign-offs.

With that fixed:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/regulator/qcom_smd-regulator.c | 46 ++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)

-- 
With best wishes
Dmitry
