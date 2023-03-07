Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 152316AE0A1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 14:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjCGNc7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 08:32:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbjCGNcx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 08:32:53 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 478BA4BE9E
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 05:32:48 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-536b7ffdd34so244732607b3.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 05:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678195967;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S8N7CXt0+e1DYpuX8yQaXPa+HdLNCPSxo/7U3GGVJrk=;
        b=vVNrvf2UFDHRL7WlPOvAazRohfHDm+dbsSkNBh3oQIWBB+HTIveJVsned4nMPI+OAC
         reMrM6lWe3ZFp5IsD2LYKpr/8jDmiaXeMB57k3CWzggoZW18garX7e5aYIw7zhzz8wfN
         JoBosjpeQxEQeDYAeB4BLqQHd6Ne+YaMX6WPzGkcFkbkv7/JaTB/Z46396lKCezj+b+q
         ldYd06YlqlLY0Uuo6aSMJFmnSSXPqzLdYZiChSTaRPubOG3hYdbfuqi4RLE79VB2cNks
         0rdcKhmMzYSY04am9yWob9f09MHwAUts6gN40dsu4rBkVAix59hF0K2qglbu8Km4ew+g
         Nduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195967;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8N7CXt0+e1DYpuX8yQaXPa+HdLNCPSxo/7U3GGVJrk=;
        b=7lkENdTLycLEFaSUNu0SE45JEtU6srni0VxS+CeG9e/BGJ4bCyMsxCy/hFs2qoRRcD
         bxwkWmQrfkCprZlthpvqZajjmB6+/HL2iQDhgOkqg2Z+7VjVs+wbTwD+TULwUQLcK37y
         lQg7d7b2OwonAIFIDFZCi+ASuM91zMgO0Gd1Q49Dvy/c+qQD/uXc/qZFZ1urPL1fxUzN
         sOEYHA9zbdbhKzLghKmGhGFwl3i3LVCV6/rOKBDnvTKOnv8ueHzckqCIeEpNaL5K7WQE
         /lI6KhAKWsy/ntpKzl4W+bG3hHAK2WHa2zk7s3LWEZPDR1C9cAPlWQN/OthctIoHlqFX
         RnVg==
X-Gm-Message-State: AO0yUKUYn++0tTOG5phZmLqKsqqNEibhqdTHvgIL2yF2b4Z527WQ5Zr7
        CdHyAJfqthj2KY857fG52pYyhFTMIE2KSgvAR+HmlQ==
X-Google-Smtp-Source: AK7set+Iw/lJPIwfuQJt1ZCWJz+iqWXUo18uQ5BNdTKu/mg0l1aZiWAdS1u53vOLA6ZWZsZ3RDEbVq6qSLGbxk3Nb40=
X-Received: by 2002:a81:431e:0:b0:533:8080:16ee with SMTP id
 q30-20020a81431e000000b00533808016eemr9313543ywa.10.1678195967500; Tue, 07
 Mar 2023 05:32:47 -0800 (PST)
MIME-Version: 1.0
References: <20230302155255.857065-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230302155255.857065-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Mar 2023 14:32:36 +0100
Message-ID: <CACRpkdbe=sHG9KVaGrbEaFoVbMY-2=r2X4WkcbNhCfZ9KOw1sQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom: lpass-lpi: correct
 description of second reg
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 2, 2023 at 4:52 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The description of second IO address is a bit confusing.  It is supposed
> to be the MCC range which contains the slew rate registers, not the slew
> rate register base.  The Linux driver then accesses slew rate register
> with hard-coded offset (0xa000).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

LGTM, is this something I should just apply or will you collect a larger
series of Qcom DT patches this time around as well?

Yours,
Linus Walleij
