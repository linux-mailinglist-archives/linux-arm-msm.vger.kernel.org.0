Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B839570640
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 16:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiGKOxb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 10:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbiGKOxa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 10:53:30 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3EF0709BC
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 07:53:29 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id m16so6554316edb.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 07:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B+DfESfcXMEMmXuDDJXvPYmOkPUKFW71mpdMtJevL6Y=;
        b=k7PwvkOX9vMswnngnpFJUR2Yim1tQzngfTgvN+kCBYpI1huL1ZQcx9t9kq1P/LJt/R
         PF2+6hYpLabGkw3gMvvi/HqDFOnXjayJCtaIrlo9A4HZqGWfd5eA7Ox4gFkYsY5QY6+N
         wIuDOcK8xlSMPM8Qu5fedhAMOfkNGz4Ew5pik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B+DfESfcXMEMmXuDDJXvPYmOkPUKFW71mpdMtJevL6Y=;
        b=ViyXZ8yvcFC8hGxh1Qk4uTO+JclwVNKp0WBx7Jp7aARxor++wr5LzyVp7LJPPOrgZA
         8NQLg1aBfiZVcmE+DMvaFjPNtjo9KjQR3GLxulOjAKN+DLKryj0Jr6r7drb4yU5CX+Tx
         EIBGrJFWz2HfPk4NsZu6LUKQ+thJ/7+9KD49Sh/MgC0fetKm1RTrULZFlZ4skd2vybHA
         3uIkXvBszIy6bu4pIHGTGVlAdMPzqNfInJYpn50yC3f1+2OKsvSTWuKt3B+lpCFNIA0d
         9U0nHElfOv23DxhPixOM7KE6cvto9liH+Vi42DIgL5DeplaSXZHSu3er8mkRjldMopsM
         B9DQ==
X-Gm-Message-State: AJIora+HQDtsuCINop/R0dhg7R7Tsv/FgINVBPKYEY28zSw8jD46YhfJ
        et6w+Ds4Trb23japJTyBGMfQJoCgR/6Nni6y
X-Google-Smtp-Source: AGRyM1u7Q8rybqJMcHuHBBWKA/dItSomZUnbYOwGckxzDwiLEAC0Afrep+I3ONWfd5Sjy8iuWefPfQ==
X-Received: by 2002:a05:6402:34c1:b0:43a:bd7a:898a with SMTP id w1-20020a05640234c100b0043abd7a898amr18369377edc.426.1657551207876;
        Mon, 11 Jul 2022 07:53:27 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id o7-20020a50fd87000000b0043a83f77b59sm4455750edt.48.2022.07.11.07.53.26
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 07:53:26 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id a5so7339850wrx.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 07:53:26 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr16792836wrr.583.1657551206156; Mon, 11
 Jul 2022 07:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220711082709.39102-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220711082709.39102-1-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 11 Jul 2022 07:53:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ue+LUHKmG_ceMO-qGqJXkmqMcvyjLFCGNK8s2VBDDd2A@mail.gmail.com>
Message-ID: <CAD=FV=Ue+LUHKmG_ceMO-qGqJXkmqMcvyjLFCGNK8s2VBDDd2A@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mmc: sdhci-msm: add MSM8998
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jul 11, 2022 at 1:27 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Add a MSM8998-specific SDCC compatible, because using only a generic
> qcom,sdhci-msm-v4 fallback is deprecated.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
