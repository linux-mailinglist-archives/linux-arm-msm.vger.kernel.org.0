Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2DD668E22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 07:36:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235371AbjAMGgD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 01:36:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241142AbjAMGeN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 01:34:13 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68D376E421
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 22:26:20 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-4d59d518505so102560947b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 22:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tC0lkP+Jv1BQqV1q/iChdkxbwz+GLXuspS9rktzQ5EY=;
        b=EET76yrF1iVTCrzkHrsf7cd8t+fkGLobXLevIaUpBvQRKCm912JOWXmsu+e4fgJXdN
         UyrNvsIJGbTO629zVdW/EHdPL2O8D9ECTAcKi7NcwDsVYu3sMRtkBS5KT6OXSkBjeGTW
         E9QtuibQS33CiiJKTP7ImWYM6UdAT3vxw++fcjl52NWxYvIPJD2kc94uNsJQKRW+dSHv
         Ldi01vTbTUBpfFOXw4KoptpNnyVzKxnhUapRPpRL3NcL/hc8EjZPBHfwqOhlYsMcYXld
         TgPQs3UacEVL5bdRAu+shgptX5jjsKlLhp2yM+dDqxrGs/iRqhs1bjbrnr/e956nKIj1
         PvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tC0lkP+Jv1BQqV1q/iChdkxbwz+GLXuspS9rktzQ5EY=;
        b=0dPb/px5KIn1WHDIpGM4CsRYpVTd2HO6FFfNy/Awy6+RsHrn4G3Jzg7ZC2MXxJITPP
         KXbyF11ZQWySDbzYg87o5+1xnoWlJn7dTxf2q+f9PeH5MzXT9ih4MeGOqAB0NBISwT5s
         0c/XTWYo9zHWJMEtSKCihuZNDQTP8HPS6JalU4dzRJMacPmbF+093FqYeBr0KeskHEW8
         qsV+r/TngbCLIDHKQ4E+lKNUAuCNADmbM9j2MHZz86sF7hSWkNba1yBDXzaDJJ5QHsTe
         3DDgaCwzapnlzJaTtPb/4ADrh60vd6VK1X7sZt5uOxj8NdZU2dTaChSewzomRUln9vo0
         x2sA==
X-Gm-Message-State: AFqh2kpz8Vy1A0C1gWoPxebGCmVrS0pKglwnkHc9bX7bnj7l+kE3inAB
        S9PdV7uLHI+gekvAQeiL5S4I0oF1mdh09mM3903RUA==
X-Google-Smtp-Source: AMrXdXv+r56xaZf+DPzmWtRoeJ10nSBpqmcSoPeyOKiQUFUxaNvHkK2BzSZf4FlhbAELH/HIgBAVVD/LMTEjenz0Z1o=
X-Received: by 2002:a0d:d692:0:b0:477:b56e:e1d6 with SMTP id
 y140-20020a0dd692000000b00477b56ee1d6mr1899526ywd.188.1673591164592; Thu, 12
 Jan 2023 22:26:04 -0800 (PST)
MIME-Version: 1.0
References: <20230113062229.774871-1-judyhsiao@chromium.org>
In-Reply-To: <20230113062229.774871-1-judyhsiao@chromium.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 13 Jan 2023 08:25:53 +0200
Message-ID: <CAA8EJprpHALTfcPCFFH=-vpfavnyph+UQfF9xb59SPjV8GOvBg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: add display port audio
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 13 Jan 2023 at 08:23, Judy Hsiao <judyhsiao@chromium.org> wrote:
>
> Add DisplayPort sound node and lpass_cpu node
> in sc7280-herobrine-audio-rt5682.dtsi.

Any reason for inserting it in front of the ALC rather than putting it
at the end of  dai-links?

>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>


-- 
With best wishes
Dmitry
