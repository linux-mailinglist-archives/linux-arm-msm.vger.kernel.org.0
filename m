Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 865844BC4DA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Feb 2022 03:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbiBSCcq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 21:32:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230332AbiBSCcq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 21:32:46 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC4A6427DE
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 18:32:28 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id j24so2873775oii.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 18:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=GMyd0+sXMi4cIFzcL0iJI6zscXkgFMDHcUknF9cxQis=;
        b=i1BaGO+F9XGzIZMSKGhY8yTuyr89G7+EJfFqOOAHde+lwE4P4HgSbb5JUP0L1xQG3q
         xWVV24YMKR1/KeN6qa7KKstzzQZmkIBIDVx6wdPP+CvgNlYQFcigM1AlOqA5VWaGtDtt
         DXkpIN5IlLhK182wst1HI3hS6xIv+B42mKRio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=GMyd0+sXMi4cIFzcL0iJI6zscXkgFMDHcUknF9cxQis=;
        b=3BhtuSDlJnJUzcaUL/jTDdYT0NTQ3Q2ptk8HkDneM4iCYN2y8X8sWrsK9vkxD50yTB
         emZljFNWNqkVDQgBsSIjkzMyo/h8iP83YuX64mVBf98FgsCRAW5KMtCRKXTO0aIc5oxz
         q18OVWtDPQbgHTtsJ7WbKkKSmJAodI3UIFxPpQbTsQiL4S/CvGjeliCXVtGgNn49E+Di
         wTg78Y7WwmLwCa5liDpcYQ2S+LsIFyaMYh8Q6b1Alz0iELM26zL8/k5WKkw3l8wPKkpz
         LFEyEbIoWKtrKRtzej95RiYISNdrMJUZiolI8YD3I3QQMJ7F6/bV46NBSbtHFq+MiuWu
         qm+Q==
X-Gm-Message-State: AOAM531eOD+UNVVEZlZM9FL66039Rz2caq2XFyS8p9wuheudl2hbpZL8
        MisY9TLiZADR+VMURwTE3Qm65iW+wEBqcGwXOSx7pA==
X-Google-Smtp-Source: ABdhPJw34gCloewSbJ7M6JQB0jN6jKAkR9GAZpyAcVGrzLxrbEqMsFWVYuzOyI1NGQWi4ffTFeIXjyjw0kRA2nfyoa8=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr6296170oig.40.1645237948132; Fri, 18
 Feb 2022 18:32:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 18:32:27 -0800
MIME-Version: 1.0
In-Reply-To: <1644851994-22732-2-git-send-email-quic_srivasam@quicinc.com>
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com> <1644851994-22732-2-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 18 Feb 2022 18:32:27 -0800
Message-ID: <CAE-0n52Ksur6aSuB69h49LjDFU2LXBh-b3HRTK+uYTU4fcQhDA@mail.gmail.com>
Subject: Re: [PATCH v6 1/7] dt-bindings: pinctrl: qcom: Update lpass lpi file
 name to SoC specific
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-02-14 07:19:48)
> Change generic lpass lpi pincotrol bindings file to SoC specific file,
> to distinguish and accomadate other SoC specific dt bindings.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

If you generate the patch with git format-patch -M -C does it detect
this is largely a copy? I tried myself and it looks like it is.

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
index 5c5542f1627c..06efb1382876 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/qcom,lpass-lpi-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#

 title: Qualcomm Technologies, Inc. Low Power Audio SubSystem (LPASS)


Please generate with -M and -C in the future.
