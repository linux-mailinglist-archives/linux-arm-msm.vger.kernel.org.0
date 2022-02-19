Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D04FF4BC4E7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Feb 2022 03:36:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233439AbiBSCeu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 21:34:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241097AbiBSCet (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 21:34:49 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E5A5D2278
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 18:34:32 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id s1-20020a056830148100b005acfdcb1f4bso3208170otq.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 18:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=nGww2Fch/vFqXfv/Srj0ovJk4BMeL79sC2Eo+89hinE=;
        b=QJJFl3dS4EOtcFxTQY4BZQjSYw6yF+vddQ55RqDwOyvTKD4CKUnCi2xpCk0jvClsO3
         +89AGd6jEFvmIQs3M83q8ZRF8qrIMY7d8UuWSL7mor9lhr29swzXcAn2iV0YF29qX9lf
         DavVIE9V3eIZ9GC7VANzgYqL9w3eoz2/hYHGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=nGww2Fch/vFqXfv/Srj0ovJk4BMeL79sC2Eo+89hinE=;
        b=k1b6Sveu645SKRhVywfUBfU6dH7+lxPSwmpHUqqlExXNqit1KBtf2KJt1W0t500toO
         2OKZ4ynIUANQWYo6YPRO8ALr45AOT/mWvhaxbqCVjGI1f0wEAUjSzBJVp98fnK9iaec3
         XhFnMDS8RDEAi3iAW7WipMHhRctsFQemP/yXmB3lTAduAdUfSls+bNi4ibemv75pT8jr
         ttrjeDcSEsrSXqnFn2J+t+b6TUQbsrGtS87Yno38zuquXZYcnF5+GgJK2GTHidX+JWSd
         ujk1/Im3Z/Qdcz92Cz7dKRxDhPEtTyqgBKNV+hMaQmmFNjKfEsfPleo/f5b3Cbmpa4aU
         Wi0Q==
X-Gm-Message-State: AOAM533FGXAI9Zc2tqkL0YQcyt60A+G7Y6FsJoQN6pHDtTY3SR3qM+5v
        I/azAJRXVXZuEJDMd0znREfjtwOFBRJ8mLpi5A+rJA==
X-Google-Smtp-Source: ABdhPJzJa3L9aAJSR3uG1ezufDu/iQ/NZCSVv1S6xIYiG4RjY2QMukqYIsltQ+w45l9gGOClL84srww+OH6LeiEtPzM=
X-Received: by 2002:a9d:22e9:0:b0:5ac:1754:342c with SMTP id
 y96-20020a9d22e9000000b005ac1754342cmr3358347ota.159.1645238071423; Fri, 18
 Feb 2022 18:34:31 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 18:34:30 -0800
MIME-Version: 1.0
In-Reply-To: <1644851994-22732-3-git-send-email-quic_srivasam@quicinc.com>
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com> <1644851994-22732-3-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 18 Feb 2022 18:34:30 -0800
Message-ID: <CAE-0n53AEqrgEtCLqnSBV=4nxYFwZJ_pJsyvLD+-gBJxFz-DeQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] dt-bindings: pinctrl: qcom: Add sc7280 lpass lpi
 pinctrl bindings
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz,
        quic_plai@quicinc.com, robh+dt@kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-02-14 07:19:49)
> Add device tree binding Documentation details for Qualcomm SC7280
> LPASS LPI pinctrl driver.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

I used --find-copies-harder and got

 copy Documentation/devicetree/bindings/pinctrl/{qcom,sm8250-lpass-lpi-pinctrl.yaml
=> qcom,sc7280-lpass-lpi-pinctrl.yaml} (77%)

and the diff looks good so

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
