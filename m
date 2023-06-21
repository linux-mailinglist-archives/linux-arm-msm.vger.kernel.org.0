Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 840F2738C82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 19:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjFURBt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 13:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjFURBt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 13:01:49 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D555810C
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 10:01:47 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51be61663c8so124778a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 10:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687366906; x=1689958906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBrF3iaP3Fd6iHn8cw7cCxGg4FZTsp6oWE22ClcY7C8=;
        b=N++V3i+130EvXCm2nmF44yx6EGrgtqn/mojS6NEzqaQEuYHSWzdwKgsfJ2r3zDpzcr
         H7/s/v1VVt9EIqpXcP+uLZIbhhvx5MPptfy8BNUpJmzkLKyDTshE7S8IfK+/LAYs6eTl
         GnyKhD3XDcZmyvqYaBxacBtJs8sUR/cSQGgqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687366906; x=1689958906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UBrF3iaP3Fd6iHn8cw7cCxGg4FZTsp6oWE22ClcY7C8=;
        b=XwbpWQaHoszUtTnfx5VFN3Zk+z8CwB2pn46YE2ADUE8/W0ynyI8vbmxExOUaklIvq0
         XYT0FkKOXYwed83DmIAe5Zs/CnDhSkVUvotnUSySnm1SW7L1aAnWyqLvq88i0slbwwqJ
         WKKLVIyP2Jx37Jq4Nd2RfoyuIP3Zk4YdP7WOUknenxja1znWEJFNL92wr/VqJGSIb+AA
         8OWhw0Q3kKymJxdjT/joEv+sXrtI2ew9HCPL6k8sHI4vbg1Qros3Pen7xDtdrVJsJB1Z
         HtAmLNDl9senf3BLKlX0j32XduX7RVg5f+zUVHKifoGwklPjg18/wzW9bgWC+69sH25O
         HevQ==
X-Gm-Message-State: AC+VfDxiq7r7hlqdxmZO6Qw09kDS/Q4bvw2nxXhlbY/EkQTdUIdSt0PF
        fuPnw0p5pzOCsbr+66cp6WXv7BvHCmsgPk+X7S/hAhc5
X-Google-Smtp-Source: ACHHUZ503L3z/8g1iNqfmxXjoxDr+FG7uVezEX/46vhow/YYDjkF28NLDky8oY3xpKBsyvximE0F8w==
X-Received: by 2002:a17:907:9628:b0:987:6ec8:aa87 with SMTP id gb40-20020a170907962800b009876ec8aa87mr14179773ejc.74.1687366905961;
        Wed, 21 Jun 2023 10:01:45 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id kg18-20020a17090776f200b0097073f1ed84sm3406701ejc.4.2023.06.21.10.01.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 10:01:45 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f9b4b286aaso8895e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 10:01:45 -0700 (PDT)
X-Received: by 2002:a50:9e65:0:b0:51a:2012:5b34 with SMTP id
 z92-20020a509e65000000b0051a20125b34mr630898ede.4.1687366587250; Wed, 21 Jun
 2023 09:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230616081440.v2.1.Ie79b5f0ed45739695c9970df121e11d724909157@changeid>
In-Reply-To: <20230616081440.v2.1.Ie79b5f0ed45739695c9970df121e11d724909157@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 21 Jun 2023 09:56:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WqirzpMwq8wto2B9cDGVf5JfirAQRargKWcZLpFhXCVA@mail.gmail.com>
Message-ID: <CAD=FV=WqirzpMwq8wto2B9cDGVf5JfirAQRargKWcZLpFhXCVA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: firmware: qcom,scm: Document that SCM
 can be dma-coherent
To:     andersson@kernel.org, SoC Team <soc@kernel.org>
Cc:     amit.pundir@linaro.org, Will Deacon <will@kernel.org>,
        sumit.semwal@linaro.org, linux-arm-msm@vger.kernel.org,
        konrad.dybcio@somainline.org, linux-arm-kernel@lists.infradead.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>,
        Stephen Boyd <swboyd@chromium.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bjorn,

On Fri, Jun 16, 2023 at 8:18=E2=80=AFAM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> Trogdor devices use firmware backed by TF-A instead of Qualcomm's
> normal TZ. On TF-A we end up mapping memory as cacheable. Specifically,
> you can see in Trogdor's TF-A code [1] in qti_sip_mem_assign() that we
> call qti_mmap_add_dynamic_region() with MT_RO_DATA. This translates
> down to MT_MEMORY instead of MT_NON_CACHEABLE or MT_DEVICE.
>
> Let's allow devices like trogdor to be described properly by allowing
> "dma-coherent" in the SCM node.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2:
> - Bindings change new for v2.
>
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Without this series v6.4 will have a regression where WiFi / LTE won't
work at all on trogdor devices. Any chance you can send up a "Fixes"
pull request with the 4 patches in it? ...or I could try to convince
someone on the SoC tree to land them directly?

Thanks!

-Doug
