Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82623670D6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 00:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjAQXah (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 18:30:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbjAQX3s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 18:29:48 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B7584C34
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 12:50:55 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id l125so14254187vsc.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 12:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JE67O+s9c1DksMih5BPH/dW8Hwc4nNpOK0OPe51sf7k=;
        b=AJKahwqpQDjAt31oGp82F5r21gwNDZ1moW7XQAwLucBbV8zIeqDE934wC8+d37UQnd
         EzdDOEjggqvA8ypyOGHC+/0vxXQXI2TKAkz1SlVtmrXm2U7z0zFD+J+8k9DSMfJ64PIk
         bbWA4Tmb2E1XQnrtOpKiFhDojkFryNY3qQKQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JE67O+s9c1DksMih5BPH/dW8Hwc4nNpOK0OPe51sf7k=;
        b=ADk/PoiSJtp4geD9KvwdW6NUdlyZ5zQhcOl601COqEFMkzLy7rFngPaOwJyZEF+kKZ
         2Qc8m+ZVPEVXqIJSRN4EuFs2jzpXMqYQ9ul6JvEoDwAA3R558DNFlIYt83h9zooUwLuD
         kLzcn6dJOnRXIL6BbdjAcAG8hMimcTsMwv70CyCR80+yrcgy63bPwimyoqiU0jkDZ0r4
         OMFOERpRPICKmujded7+YYFYZjACZt6o/P3yAo8Ibj0uzknKa0Kcd3IoOPnFwSWwHi60
         Ss65P3VLPnbAmf3NZCkcPhHQ3B45SE3WyMU70LGOBWHPCb3cS2yL0XK+UQYzqKTkJRlE
         7oTg==
X-Gm-Message-State: AFqh2kp1Y6IQtsNfhbw9nPZQHLdzRectRfgFx/9OhqigL9Sk9MGfVoTo
        RXd4vTVQHO+18M7H2omOgniuSYoFZrBUJlvb
X-Google-Smtp-Source: AMrXdXsXDsq9EnCV+4G+iRF5hci/o51UsIo37EuAVlVSnLf0wGMcqF3ixMhDP9x8PqQu2l6TSertwg==
X-Received: by 2002:a05:6102:2907:b0:3d0:cfd6:5d0d with SMTP id cz7-20020a056102290700b003d0cfd65d0dmr2505204vsb.5.1673988654192;
        Tue, 17 Jan 2023 12:50:54 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id w4-20020a67b104000000b003d3ce9b8c0bsm761832vsl.27.2023.01.17.12.50.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 12:50:52 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id 187so2905169vsv.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 12:50:52 -0800 (PST)
X-Received: by 2002:a05:6102:21c4:b0:3cb:d175:6642 with SMTP id
 r4-20020a05610221c400b003cbd1756642mr595041vsg.79.1673988652026; Tue, 17 Jan
 2023 12:50:52 -0800 (PST)
MIME-Version: 1.0
References: <20230117024236.1442437-1-judyhsiao@chromium.org>
In-Reply-To: <20230117024236.1442437-1-judyhsiao@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 17 Jan 2023 12:50:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W0ACJ7uMYdtfLpaVh67kdvt+q3ObtmWhhchPMksN_YZQ@mail.gmail.com>
Message-ID: <CAD=FV=W0ACJ7uMYdtfLpaVh67kdvt+q3ObtmWhhchPMksN_YZQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7280: add display port audio
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

Hi,

On Mon, Jan 16, 2023 at 6:42 PM Judy Hsiao <judyhsiao@chromium.org> wrote:
>
> 1. Add DisplayPort sound node and lpass_cpu node.
>
> 2. Adjust the dai-link order to make the order to
>    be consistent with sc7280-herobrine-audio-rt5682-3mic.dtsi.
>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
>
> ---
>
> Changes in v3:
> - Add more detail in the commit message.
>
> Changes in v2:
> - Fix the commit message format.
>
>  .../qcom/sc7280-herobrine-audio-rt5682.dtsi   | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)

nit: Your ${SUBJECT} needs to make it obvious what this is changing. Like maybe:

arm64: dts: qcom: sc7280: add DP audio to herobrine rt5682 1-mic dtsi

Other than that this looks good to me:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
