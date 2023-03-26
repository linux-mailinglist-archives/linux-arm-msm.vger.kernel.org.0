Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC0316C9863
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 00:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbjCZWDL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Mar 2023 18:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjCZWDK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Mar 2023 18:03:10 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DECD759FC
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 15:03:08 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id k17so8194762ybm.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 15:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679868188;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6dnlWUNBhdNVErKLJFu8u1ZEtEftWkVM7mHppRzmj0A=;
        b=BwOtjOY19Rbe5MMDNIggqEiiDqqh703Hg75oWLfRkIQH61644JK9CUmAzLnuRZjq2I
         GvJc7eDaoDYJ7eunwPV5ypZcG3BCsCjKiRA9UbDOhEINzogt9NPzK/7sL9BOgiRicI73
         QnMwuzC53se0SOUHVwNa/RpYP+bfUQi3kMu+r96LR+u1Yda4X7D6ML2nVf5x8ecmg7E3
         b4u7tjceIP/l/WG4hW5spSy/9H+wZ+ydUku/zBdcDRNNm4gx/M34+N6XGECxxZW7FX33
         IQ/vN4dazau7x7pt5J7Z6B9/kxEqUs5af9tRQPJOrwWFlaLbLnVuBG04bE0bvz0zMj7T
         OZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679868188;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6dnlWUNBhdNVErKLJFu8u1ZEtEftWkVM7mHppRzmj0A=;
        b=hnXIMQhzrzJRAcXdPybYU8CCmC24XDpuRO8BVWaBYTyA/d4eFKJS6KSbS6/yskBq2G
         nc6IOf6AsQh4jUpOUH3KONd2+Ixv69D3xnNPVxrKYNU23YhakH6UMT1GTYLcKaAXcLtI
         yPVaSq2TsgVKZaFGe6XHyAGFEfYGGjpy+oLGbeUr2pIUtt2Mfol7EoLmlyIQLyNiMFa1
         wbVO8EKfByS+VtIr+pIk6xLhIBdW6LCrPG89k8MetYAIpwzEk06KivcDxtN1GRNiXUzi
         zS+0BAu1jk6pG2dqqI3GmOWV1Tdw3kXmbpgkCLurjy9KBM6R2QG1pMs85OXD7s0ClMw7
         2Awg==
X-Gm-Message-State: AAQBX9dD31Zv1BtPqS+MYuE8EIr2wpNtl+g/MfwdphxnCQXXpUG4FVp7
        XjFrfEdlIeOTv42g2NcoBSK9aJvQZPpjmqi4AU7xKw==
X-Google-Smtp-Source: AKy350Zf6ZGS2prtalcHbhqYoCGJIJGilo0XUgRx/swaUNLyj8qQ1CxQhQdL8OIGzThLYF1asCQQsLQ6em474jNh07w=
X-Received: by 2002:a05:6902:168d:b0:b6c:2d28:b3e7 with SMTP id
 bx13-20020a056902168d00b00b6c2d28b3e7mr5687001ybb.9.1679868188072; Sun, 26
 Mar 2023 15:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230326091605.18908-1-krzysztof.kozlowski@linaro.org>
 <CAA8EJpqR-QisyWEHE83oFbXt8wUcn2Ofd4W6UwFmkYzGD18N9Q@mail.gmail.com>
 <c6429b89-bdf1-a601-7cc2-a6cbb566fecd@linaro.org> <CAA8EJppPHVZbseXFx8g+m9PxgODuenLEBHeDT3z6MojzVALKqA@mail.gmail.com>
 <83b657c3-5a78-1c81-fea5-5679a30bd517@linaro.org>
In-Reply-To: <83b657c3-5a78-1c81-fea5-5679a30bd517@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 27 Mar 2023 01:02:57 +0300
Message-ID: <CAA8EJpohKcE+nVgvjktqzLaL38VQxBWD9w_bdgsZ+7_vzSQwLQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm630: move DSI opp-table out of
 soc node
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 26 Mar 2023 at 13:13, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 26/03/2023 12:03, Dmitry Baryshkov wrote:
> > On Sun, 26 Mar 2023 at 12:22, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 26/03/2023 11:21, Dmitry Baryshkov wrote:
> >>> On Sun, 26 Mar 2023 at 12:16, Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> The soc node is supposed to have only device nodes with MMIO addresses,
> >>>> so move the DSI OPP out of it (it is used also by second DSI1 on
> >>>> SDM660):
> >>>
> >>> This raises a question: would it make sense to add /opps to handle all
> >>> opp tables?
> >>
> >> We didn't add it to any other cases like this (and we already fixed all
> >> other boards), so why now? We can but it is a bit late for it.
> >
> > Because nobody expressed this idea beforehand? I'm not insisting here,
> > you have a better understanding of DT. Just wondering if it makes
> > sense.
>
> It will not change much of ordering - all nodes will be close to each
> other anyway (opp-table-XYZ), thus is rather a matter of readability and
> subjective preference. No other platforms have "opps" or "opp-tables".

Ack, thanks for the explanation.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry
