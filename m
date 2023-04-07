Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C11A96DB07E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 18:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbjDGQXr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 12:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbjDGQXp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 12:23:45 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF1051BD
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 09:23:20 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-54e40113cf3so23144977b3.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 09:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680884598; x=1683476598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohFbb1dKXrRtFWACbHMbO4cTeWK5wuWqXsuHiYb+bX8=;
        b=RepzUhBqfdIKEJPmkM25Ci8DVG2l+Uhv1Zr0uR9CRlOUc6KmuQAyAKP9lea96N2PiR
         POvOYTkqcz4Vn2JkdjY7dHnsNMIJ9NRqKbXozfJNzY6fV/eJBWzmVSevQh/6YM+o/wH9
         S8El0hwmnM1OfzUByuKxdJpPFiWadN97GTYsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680884598; x=1683476598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohFbb1dKXrRtFWACbHMbO4cTeWK5wuWqXsuHiYb+bX8=;
        b=mTmS32q5Zo90IXMUWwFPeENSFVyzZbUYYKRr98yBXsplKOlawCUfJpeMmcgdV/r4wQ
         VSmGQkGBqzekCFApAZMW45UZSUb6cgDLYEfgrXaLeQ0+xit4tPwX1ZYXc2+aLYDYZtsW
         Yn2YdW0ajyo2j/AIFumSVkuIP0rIUrmk7H7mipgzUh+keti9ZhlPS1vHSTQE5kGvgldW
         Pn7E4EJqkyF2ubrwDxeFvvGqdhSnjJcYoXyDjusamshpni2HQ26Yfwv98NN2zGMUBv/D
         qX6hBKRNSVzKHEslXem+dXk+BemtYWHIcKyRBJHxmBGku/Hhjg5GxE89qzehDHTSKSfp
         HSZA==
X-Gm-Message-State: AAQBX9fdSZ2ODioD9YjMbBzA7zPOf8E14UH/79AyYORnFGPYMinyu6jX
        98DhXo8LQa078nEFwyCDc0IbaMoB0wa+kjWyZMs=
X-Google-Smtp-Source: AKy350YXtoJ0zvZTUv7bHhUzNZtEA8o8T1cjMztH2rOHJlWxIp0+hetgZOehhzVRYJSITgzAuu9meA==
X-Received: by 2002:a0d:e656:0:b0:52e:c985:f70d with SMTP id p83-20020a0de656000000b0052ec985f70dmr2765183ywe.7.1680884598378;
        Fri, 07 Apr 2023 09:23:18 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id r195-20020a819acc000000b00545a08184aesm1090763ywg.62.2023.04.07.09.23.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 09:23:17 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id p15so49464306ybl.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 09:23:17 -0700 (PDT)
X-Received: by 2002:a25:cfcf:0:b0:b2f:bdc9:2cdc with SMTP id
 f198-20020a25cfcf000000b00b2fbdc92cdcmr2102212ybg.7.1680884596886; Fri, 07
 Apr 2023 09:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230407151423.59993-1-nikita@trvn.ru> <20230407151423.59993-3-nikita@trvn.ru>
In-Reply-To: <20230407151423.59993-3-nikita@trvn.ru>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 7 Apr 2023 09:23:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V_iLB7kgsvdQAUX+7tMtQTj91xFV_CoTzDDxsLK+zFMg@mail.gmail.com>
Message-ID: <CAD=FV=V_iLB7kgsvdQAUX+7tMtQTj91xFV_CoTzDDxsLK+zFMg@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] arm64: dts: qcom: sc7180: Drop redundant disable
 in mdp
To:     Nikita Travkin <nikita@trvn.ru>
Cc:     agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@linaro.org,
        quic_srivasam@quicinc.com, judyhsiao@chromium.org,
        mka@chromium.org, cros-qcom-dts-watchers@chromium.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Apr 7, 2023 at 8:14=E2=80=AFAM Nikita Travkin <nikita@trvn.ru> wrot=
e:
>
> mdss is useless without a display controller which makes explicitly
> enabling mdp redundant. Have it enabled by default to drop the extra
> node for all users.
>
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts      | 4 ----
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 4 ----
>  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 2 --
>  3 files changed, 10 deletions(-)

Makes sense to me. If you were feeling particularly proactive, you
could also fix the same issue on sc7280.dtsi

Reviewed-by: Douglas Anderson <dianders@chromium.org>
