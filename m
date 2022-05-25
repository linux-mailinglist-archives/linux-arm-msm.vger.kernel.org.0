Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DDC7534271
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 May 2022 19:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343553AbiEYRvL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 13:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343541AbiEYRvJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 13:51:09 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4981418F
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 10:51:08 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id t13so7450636ilm.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 10:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=po4fZuhQjua5xFboKSeszJd6bmcTvYOuQalf/Wsj6NM=;
        b=GbhWDbOof7USuznbJj3BOp8b+rV7AnZCEjomngAQ1Tm5K6yUmSM9VrF2rXhlIFjjxh
         Ckx8hCMaloSM9IWCHuDmn+jYngmhlml2zbUjugw3WU1TYudDq+AFiXNlTNWyO3lXGFWV
         QYHTlGr7/VhKpgW6q/UlmIRt1ynDNIl5jQp0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=po4fZuhQjua5xFboKSeszJd6bmcTvYOuQalf/Wsj6NM=;
        b=y+OPl0CUg+toF+R1IuSsIYlqi++VN0Gkzav94a413x2qPL88L4YxK1SQAUI4uhZlh4
         hRxUVKcbqmVQHh5sH/N54isSSBGIN31sUHg+FEV1Zv+qYS7E6mRWNNqIdtcTXFrzFwAQ
         oN/Gk8Xs/0c8E0uYyyRbmCzb64P2SD4Muxfzo3n+9rcQXRgZ6oquKvbvCSBdaAV0EYZl
         KZW+q8yg+Me9E89UhWECKjWF07do76bdoHHjNg6fnH6kHGJV3LXkM69eXto9a18RL7kx
         fuiiH6o2t8ajBxhdOSiBTfvuqhj13gNZBLs6usJkdDAppZvbUs+6LZykx8+lEFK4Za83
         63AA==
X-Gm-Message-State: AOAM533Q767h4e20x//K8bCXMmYDkwSh7ZfJIRA9Mn0CilCPg69T+1/U
        Lr2i9iwArblbOq2bFBbgueA8dgXrYkH/r2IW9QA=
X-Google-Smtp-Source: ABdhPJzM2wb+XEE09FQ/tZIq+n6R0s/2oywbQ0jUQ2hVPcuZ15mAZXFXYYZ55onM+08IXL1JCGQ1gA==
X-Received: by 2002:a92:cb10:0:b0:2d1:4f95:29e9 with SMTP id s16-20020a92cb10000000b002d14f9529e9mr17000262ilo.249.1653501067171;
        Wed, 25 May 2022 10:51:07 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com. [209.85.166.43])
        by smtp.gmail.com with ESMTPSA id e16-20020a92d750000000b002cde6e352d9sm5483792ilq.35.2022.05.25.10.51.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 10:51:06 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id 2so12312967iou.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 10:51:06 -0700 (PDT)
X-Received: by 2002:a02:6d61:0:b0:32b:fb61:9d88 with SMTP id
 e33-20020a026d61000000b0032bfb619d88mr16675388jaf.184.1653501065709; Wed, 25
 May 2022 10:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220525014308.1853576-1-judyhsiao@chromium.org> <20220525014308.1853576-3-judyhsiao@chromium.org>
In-Reply-To: <20220525014308.1853576-3-judyhsiao@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 25 May 2022 10:50:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uf6OhDBpr_-ennq0_c61x_sr4_ma6a=z8PWvaPGFyP_A@mail.gmail.com>
Message-ID: <CAD=FV=Uf6OhDBpr_-ennq0_c61x_sr4_ma6a=z8PWvaPGFyP_A@mail.gmail.com>
Subject: Re: [v3 2/3] arm64: dts: qcom: sc7280: Add sc7280-herobrine-audio-rt5682.dtsi
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Judy Hsiao <judyhsiao@google.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, May 24, 2022 at 6:43 PM Judy Hsiao <judyhsiao@chromium.org> wrote:
>
> Audio dtsi for sc7280 boards that using rt5682 headset codec:
> 1. Add dt nodes for sound card which use I2S playback and record
>    through rt5682s and I2S playback through max98357a.
> 2. Enable lpass cpu node and add pin control and dai-links.
>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> ---
>  .../qcom/sc7280-herobrine-audio-rt5682.dtsi   | 121 ++++++++++++++++++
>  1 file changed, 121 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
