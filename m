Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 164906049D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 16:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbiJSOxL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 10:53:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbiJSOw5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 10:52:57 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B48C333858
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 07:44:42 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id x13so10800241qkg.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 07:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uft2HfJ9ltkOrVs3ehN+metJpGT6DY05hXKKGV7vLt8=;
        b=KfE0L7PnPL7v49M0WWRYcIfCVJxWKq+/hnK3RTxXu1tco6Xvkx1kg23qZ7gNfKvYsy
         gEyJm3HmhXvhgmSLG9jrknPz2ogPFu6jbwHAeuxH2n6UkvqSHvo+b//JxF4i8mLELq+R
         DHD5IqVEFPlWnhD6CnEX47J8uBQx/bhZZAz1Qph5yWJMsQJ/ul+17hLL2B+XLbHSi3Vi
         AVrUsReRewE0+ZYuAXb1GgtW6ZSFznEXtu84lATHQKNR/19BDFEMFysVLm01SlFyp2i4
         ZaoQxBd85NtNuQgOOITG2SUWirTRxcaN9p+kGoG0DeJG92wtus1xVQ/YdwFCX60fU98I
         qCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uft2HfJ9ltkOrVs3ehN+metJpGT6DY05hXKKGV7vLt8=;
        b=45oKUAhdes3yF+yoF5clEXo7uOgMWtYmhn4lE/GW5u7u+Liyae8IHU1WVLYCFWklRq
         Zk3/aoVSyzXGbj9xRdczFxDE3iidyEld9NngAf4TMRixqurXz/Ds9G5Ka9UnsIgvR7Ek
         aD7ZAZqgWCbW8F6Ic8cyueN/TqtBIIHkqS2MaaPFT3F55bniUoA5uS7hdiKTSBm4ZIXH
         1Hze3nIoBpUzv5E0yXk+2ip9BeXnVQJUWdvVTChD2nsqYZjUqoHR9I7VC/hwWpT3yvs0
         MtuESkY0DkhRUoIqRkRyejaGoZQViGSUrQNIqXjQ/IuzUdprDCSWOXF6+SU+4BJymW3E
         5n3Q==
X-Gm-Message-State: ACrzQf0GssdMPUvvlzTOtXtePBkLS4sCmeNNGmrKHJFtuiTTKy46niCL
        Q9CKPaQ92klWk27jVuEtOk4txQ==
X-Google-Smtp-Source: AMsMyM4S/9EkiiuT/ZoyO/eSQXsqHvKDsS2nIeU+wIMIlcvNFFH0A/x5gkCF3ab4dqHYco320kst0A==
X-Received: by 2002:ae9:f312:0:b0:6ee:ec00:8944 with SMTP id p18-20020ae9f312000000b006eeec008944mr5725974qkg.157.1666190681195;
        Wed, 19 Oct 2022 07:44:41 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id y9-20020a05620a25c900b006ed61f18651sm5211917qko.16.2022.10.19.07.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 07:44:40 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v3 3/3] dt-bindings: pinctrl: qcom,msm8994: convert to dtschema
Date:   Wed, 19 Oct 2022 10:44:32 -0400
Message-Id: <166619067067.168589.8840780308070666003.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221018155450.39816-3-krzysztof.kozlowski@linaro.org>
References: <20221018155450.39816-1-krzysztof.kozlowski@linaro.org> <20221018155450.39816-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 18 Oct 2022 11:54:50 -0400, Krzysztof Kozlowski wrote:
> Convert Qualcomm MSM8994 pin controller bindings to DT schema.  Keep the
> parsing of pin configuration subnodes consistent with other Qualcomm
> schemas (children named with '-state' suffix, their children with
> '-pins').
> 
> 

Applied, thanks!

[3/3] dt-bindings: pinctrl: qcom,msm8994: convert to dtschema
      https://git.kernel.org/krzk/linux-dt/c/73b8365a75f1810ba7dda73c6721ebdf12851bbc

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
