Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C99396080C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 23:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbiJUV2T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 17:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbiJUV2S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 17:28:18 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A8229E999
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 14:28:16 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id a67so10521110edf.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 14:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ifa8OePoL8OFfz7fugnjWWKBehwaOwZQ8Bn+7xviucQ=;
        b=qcRR009HWUtK+ingPLHkgUWXSphSZfgNhjzoOOLWY1U5U0lKyGFLFZ7YLpIkqygSWw
         edzsFrykFmsjpWwMCOLNbUNzREkh26ols/7wWSSfaGaqSu02lK9z/z4JF52phV4uF1wG
         BfHAlOYXxmnhjVdz9pwInp89m3Cl3eIQ3zGqgkNExpE9zPeNGxLX7lTZWvcl8O5rZiZo
         dn7/Gim683xNaA2EbvamwjIc1A5gUxxrxjcjo2WBjoCk8Dg73jBdpNU611Dsbw4FInVW
         /2bmN0F6QulMDRTe2MgELktdBek+D6VpDhxU6yMl/2mQLIDyxkjw0SY9CjG2M1oKhgGr
         UvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ifa8OePoL8OFfz7fugnjWWKBehwaOwZQ8Bn+7xviucQ=;
        b=YDiDQ9j1l0y3lkVrENNkAHFDTdo/YJlKdQMGX9N8vmjDLGvHqhoIIaD7bJKZmj3Ssn
         Ms5L6+hnlEqAblsTZhWmaHzGeOP+npwbsFVYD4NkbxPDRNWH5bdsdIJXPzTU/mBt5Tb/
         FbKDPrf/tJ0G6zccNr0Dr1Z9tMlOJSdt6VTOp1UnwQ9CbitOteuZnRxCLrOz5Cd7+Wfs
         LBPFZrDfRuGB/T3F8Y5hUT2oEpy+ojSINUGAWPzED2JCJoCQucATUMDFEaqGwWkU7Q2/
         RtK1O258qRUYb9amaM6eBj3XyRBAZMDs3r3V05vCiSfhPOsZDGV1uVpXjahyOECegipY
         LpzQ==
X-Gm-Message-State: ACrzQf1UcRmoTRyYJyAh08P4QCw5cHgMMICxsdWIXWNbtSW7pjs/Ym4j
        42A1aPbMSdQpHVNmvHYIsoTQKJb79ddKX6b3rjPFfbxfnvE=
X-Google-Smtp-Source: AMsMyM6gsEkY96s2gJlVgjECF9k23V6FjAkazwMYXDpnHhRPiukqw86REJe9dt98k8yuQBX/1Z2zncZqHyBuqS10FmU=
X-Received: by 2002:a17:906:5d04:b0:77f:ca9f:33d1 with SMTP id
 g4-20020a1709065d0400b0077fca9f33d1mr17376351ejt.526.1666387695072; Fri, 21
 Oct 2022 14:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221005-mdm9615-pinctrl-yaml-v3-0-e5e045644971@linaro.org> <20221005-mdm9615-pinctrl-yaml-v3-5-e5e045644971@linaro.org>
In-Reply-To: <20221005-mdm9615-pinctrl-yaml-v3-5-e5e045644971@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Oct 2022 23:28:03 +0200
Message-ID: <CACRpkdYb_wxhewHSM6bonKB0syciyX0ufRLXDH2gt0vW3efQTA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] arm: dts: qcom-msm8660: align RPM regulators node
 name with bindings
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 21, 2022 at 5:28 PM Neil Armstrong
<neil.armstrong@linaro.org> wrote:

> Node names should be generic and new DT schema expects RPM regulators
> node to be just "regulators".
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
