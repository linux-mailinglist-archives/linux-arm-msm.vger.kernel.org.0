Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD8FE5707D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 18:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbiGKQCd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 12:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbiGKQCc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 12:02:32 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51FCE422F1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 09:02:32 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id u20so5317498iob.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QQxLMmAEvX+K2A/q42hfIktD7BaiK+JMPvH65uBEZaA=;
        b=QY1RwoI+28PRf0qShn2T0MkMXofeHvPnOhJ8/2X1gNCd5AQ/yjecfyvqYaW+88dHTt
         BPrvH/k4b+A2tN/qWs77K8wtyqYxXtfbgYcdbfIC+oho3Nkrk9GXm+s0rERVMtGjjEJL
         TC83NdQkXbdvmUcIl5GW1ko060ufJM6cedpS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QQxLMmAEvX+K2A/q42hfIktD7BaiK+JMPvH65uBEZaA=;
        b=bcNFtFmXMW1elZQVs65N56d+U0BkKXOG1vZdtMsSet2UKBgZPsPoUFpliyRkf2MZt0
         To16okG4MeIPn4l+83WObPUDO09x5iR9Dlrw6t2F6Dy4JVVJsi/0LqXYe28TLNa1Pu16
         ujwdpzTBXIxrTjUCtKigPKWL9Yg9s2w8oBeOCmpIB5vGDTuUY5j6f1PArgU3NJzIQyjJ
         3y2II7OhLEcnb3gnQXqEph8VFZ2XHMlxYx8vPQsfSfMskeBuPKQDCRoUdQX+2E5Bvf9d
         p3pqbqriparQ9WeLbEo2Ylei1YL2lAxyrlXy7bBf4voD7itpF3wZ1nwAdXumbeH5PisJ
         RZvQ==
X-Gm-Message-State: AJIora+qWGU5Z0p/hu3Abxxe8tRPIVmBICwbkOc93+8cXAsMh8MyhTdj
        fAFljI3mSXuEgyrO5Yd+ev5O/c99GJ/KLo/NRk8=
X-Google-Smtp-Source: AGRyM1tEfOjL+RlkOs/KtRmDnT8cGXZaDNlEqpQro5taXkg07qoQ9vta80W001A3GmwoSUoIvn5l/A==
X-Received: by 2002:a05:6638:304e:b0:335:ba01:8c56 with SMTP id u14-20020a056638304e00b00335ba018c56mr10662607jak.239.1657555351555;
        Mon, 11 Jul 2022 09:02:31 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id j195-20020a0263cc000000b0033ed7ef1b5csm3010214jac.41.2022.07.11.09.02.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 09:02:30 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id v185so5297687ioe.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 09:02:29 -0700 (PDT)
X-Received: by 2002:a05:6602:3988:b0:67b:9a59:d390 with SMTP id
 bw8-20020a056602398800b0067b9a59d390mr1412375iob.56.1657555349351; Mon, 11
 Jul 2022 09:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <1657555122-18605-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1657555122-18605-1-git-send-email-quic_khsieh@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 11 Jul 2022 09:02:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WC0XQqOyONddX37=ad8M4N2NHB5UTmDVZU5SEggLvFEA@mail.gmail.com>
Message-ID: <CAD=FV=WC0XQqOyONddX37=ad8M4N2NHB5UTmDVZU5SEggLvFEA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dta: qcom: sc7280: delete vdda-1p2 and vdda-0p9
 from mdss_edp
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        quic_mkrishn@quicinc.com, quic_kalyant@quicinc.coml,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jul 11, 2022 at 8:58 AM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Both vdda-1p2-supply and vdda-0p9-supply regulators are controlled
> by dp combo phy. Therefore remove them from dp controller.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi | 3 ---
>  1 file changed, 3 deletions(-)

You also need to remove it from
`arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi`.

-Doug
