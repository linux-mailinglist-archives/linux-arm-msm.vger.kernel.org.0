Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 864C36C987C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 00:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231990AbjCZWTw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Mar 2023 18:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231980AbjCZWTt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Mar 2023 18:19:49 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DEDF5B98
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 15:19:48 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id k17so8220844ybm.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 15:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679869187;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ULWtkSd7ewXvJ3nep4baHECPFQhxKhcFj+Ec+ZWZLc0=;
        b=M4u0FcioZvRh5+WinDVemWLVE9D2sJigapCO7XO2W8lBrat43j/V58ymdC/frUuB5k
         GKd3Utxn8O8wGNYc0Q1Ib+FIjMnQ1obzvN3nRNXnTvMJUZBjzsvbd8rHY0sKGqj9HGAY
         Hl1cmy363g/24JlEbuEH/QRFiYqLl5oRwgbNNp1DEF7Wy02tx8imWdCxhfR+Yu7CY1+U
         6KE0kyxKZNpM/tyBXxfBGDNVoJaxq2mf3GBM+MW01K2AiA2AEWLPiSk4w8BfJ/f1w1jq
         hvrvt/2LCh1FZch0RKPpnhpZXqxgp8b4u/BN3WOrc9UAS+B+3X44sfm7/Xcrt6qVEoza
         4PDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679869187;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULWtkSd7ewXvJ3nep4baHECPFQhxKhcFj+Ec+ZWZLc0=;
        b=eO1b8aYi0VgyGzAhebhIclcTpJya3xkCQ8YUbjKYMmICXkUxcYzeeRQkAT7c2mxOF8
         Q7Q8cX2PxRLcBvJk2OaFpvUwFPLDPT97yYSm0wTM8Ob2jb7BY9RrHVqGVFjhXLlS+pxx
         BxnztnAoEymeaVvwuIDNgNEd07fqW9YH4X18yqKl7h1gQLk31N+Y9EhUL6Gk6OGoTyjc
         MTxqy7OFMf+tqCN1GMnQ3wZnTCgCgvcFGzP4/nDG8sNmmi9zC93HUvZdS2TY8Tdwycap
         w9NBamWFtR6CAcMJa08gEtvSg3WHVpB9WYkAZ/JLJcALsCmEP2hSG+MFW6BfxsqOwvrd
         eZXg==
X-Gm-Message-State: AAQBX9d14i0ePHX/ufEpXbIMyW0c5xaTMP7n9cGbN90N4bv3sqOr00dv
        aMGhS1B7TdxljhN226AT4NHQFA69CIDibbVS7NscNw==
X-Google-Smtp-Source: AKy350bwGl57sIuvC/PxqDQEPmb9F+zGxarQyLXDnMnZB2HVLQor+pFXGBSs8moWfpCPeSgt1NVrufzVLTUJRVBJS2s=
X-Received: by 2002:a25:234c:0:b0:b35:91cc:9e29 with SMTP id
 j73-20020a25234c000000b00b3591cc9e29mr7013853ybj.5.1679869187283; Sun, 26 Mar
 2023 15:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230326155753.92007-1-krzysztof.kozlowski@linaro.org> <20230326155753.92007-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230326155753.92007-4-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 27 Mar 2023 01:19:36 +0300
Message-ID: <CAA8EJpqhX7CfgCb_T1Abxek0iOaSELv_ohXcnutUvruoD-hnJA@mail.gmail.com>
Subject: Re: [PATCH 04/11] arm64: dts: qcom: sc7180-idp: use just "port" in panel
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 26 Mar 2023 at 18:58, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The panel bindings expect to have only one port, thus they do not allow
> to use "ports" node:
>
>   sc7180-idp.dtb: panel@0: 'ports' does not match any of the regexes: 'pinctrl-[0-9]+'
>   sc7180-idp.dtb: panel@0: 'port' is a required property
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
