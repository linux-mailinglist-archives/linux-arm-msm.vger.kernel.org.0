Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8B7E67E569
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 13:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233967AbjA0Mh2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 07:37:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233618AbjA0Mh1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 07:37:27 -0500
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 976D74C6FA
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 04:37:24 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-4a263c4ddbaso65763017b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 04:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5JZzVHCreXAUwrytEOdcDit63iUnhb0koXp2sufhb3E=;
        b=F/s3lopat6D1wKPoicRdDcIKf0tcxRBUjqO6F+JqPEvBSFNB7vgF/Jt458hpsaH3xg
         6PkyDc8u7auDtDzwIYclaa9/PPdrw0f+h6SeqnRf/jgy8MyljCcYo7QmfvM41Gf8+Is3
         O0IEwseDj6gDptV9JeSN9L5hs4GCndY9HkTpD7sL/meTXcsMcX74maQB7RplKnJ52x2e
         EOmpgypInfYisFesJ56nv8c8JuZWKfSpluFNfoTwxDwQ9ZH0Bg38yc5HQIFbthsZdPus
         sMK3UjS13Sy+LKz76ba9eqMLG0wtuvxjyDeNWtSLp4oLaLj9ggzZfqkt4sAFWbqBPNNN
         MBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5JZzVHCreXAUwrytEOdcDit63iUnhb0koXp2sufhb3E=;
        b=a9ft40L5MWajM8cErdjBvs+O2m3TpP3akpnnbeA1pBgGE1blcoiHR1zBkNdm2GeESp
         aMLL6G27Bep7cRw2g/QOwImMXjqo2eM0+n4XA3LpiqV5xuKdxSu2wER4YPLCoHMXj0QR
         8PlRuFXmHc5ouylBkGRuAT1hpuL80B5IySEjJvTG2uU+mkDpd4FoI5VpGRxq+0ffsZ5z
         6qwqiQk2ZLAtYLPgFtEY1GwScY6/ZA7koYYGopKrudFVKnv46HMcGcNoqb6Ezn+kKvei
         LGpRFRzRaODoTrr+WIjqagnuw62nKaVZnWBOiWw4Z27bifbRtrkUcizYUrgQzao9hY+z
         eC/A==
X-Gm-Message-State: AFqh2krtr0/bcDAbcvz8qdMKdewFBWokYa/241RvIII0vr8bKI5J6E3o
        sziGGjKFVIquGd/ZcdJbt6gAMuqbATG9Y4GrkWLWYwZZiNYT9A==
X-Google-Smtp-Source: AMrXdXtOWs3Mx7UlXuvM1S6dKOuLB6/juGXXYVPUtV1HTl7yRgRNErwMfFAECgGi4jdETuNKGg3+8Yd/24V6BVY0v5Y=
X-Received: by 2002:a05:690c:39b:b0:4f3:8d0e:edce with SMTP id
 bh27-20020a05690c039b00b004f38d0eedcemr3525869ywb.185.1674823043852; Fri, 27
 Jan 2023 04:37:23 -0800 (PST)
MIME-Version: 1.0
References: <20230120165103.1278852-1-robh@kernel.org> <167423655094.352486.17564121663586668814.b4-ty@linaro.org>
In-Reply-To: <167423655094.352486.17564121663586668814.b4-ty@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Jan 2023 13:37:12 +0100
Message-ID: <CACRpkdZwmHyZNJKOatQm9bW-06-RR-oD_5P1-cyr4u1UxyJEeA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: qcom,pmic-mpp: Rename "mpp"
 child node names to "-pins$"
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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

On Fri, Jan 20, 2023 at 6:42 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On Fri, 20 Jan 2023 10:51:03 -0600, Rob Herring wrote:
> > Just 'mpp' is a bit ambiguous for a pattern as it allows any prefix or
> > suffix. Change the node name pattern to "-pins$" to align with other
> > Qualcomm pinctrl bindings.
> >
> >
>
> Or instead of review let me grab it for Linus:
>
> Applied, thanks!

Thanks Krzysztof!

Linus
