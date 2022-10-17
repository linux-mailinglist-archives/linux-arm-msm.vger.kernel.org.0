Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73B77601B5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 23:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbiJQVlg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 17:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbiJQVlf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 17:41:35 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E2A17FE66
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 14:41:33 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id d13so7557169qko.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 14:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoIGfcK8XvquqT/Su+fMqDqJlJLnthzxyJnebj5Zi44=;
        b=ZXFOZAtTfzD8v+jJl6BmjsdACP5EhsOmlksRyLOiO5VlMWpFCiLxKymjKjrSrDwc3y
         e4SLprIXmptYd9hSHTGGg+suPhigfs6jn3S+uhw3vu3r/BGe1THodT1DVqEAcOfVEG9V
         dJE1X8dlkrUXh/rSFMrDNSPabp+/aP/BeIqQmcmeGoFu3by7wDjNIbyq1EWHyR8P/NQn
         2q/HyUHnlHWhlpcif5+tZtB7u5+hpXs9b/1GEpLCmMJqGnzSD+loFjgTjgyx4Gc6ymTJ
         DEDGulFvk5EaI/JZhYofY+75m9r9baltPeuznvOFeuMnJ4joj8Yi3jdSoOwGv8lS4DC1
         kgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZoIGfcK8XvquqT/Su+fMqDqJlJLnthzxyJnebj5Zi44=;
        b=YnDDO7h9Y5zu39zupvZoBKQFPOelS0Of0YT5qpnwG4AqbXD1s4vrhkkebDf1WCRViB
         KR8GejHCD9gceY32xxrYPbThIM8fjh53zjaRGNw8SrkfHMpu9rb1Z6i54fky6/qO+VWb
         9Sks441RiFpEGdmrkRE7QDjN63M8RGdqkPQcAEn6cZUyYZlE9tRRZtQ0tiXuYclQiQ3y
         uhqYWlEJKbLfStj59GHAbSsZaPtV7T0JG2bXj4uDuTNtPHJkPo7y7XZbspFbUnpESHAA
         FRiBy4Bo/rDs5GlGiIHlW2QVoxiZvaw3MFnvScafVFNHNl2WzB9xhkR5Gzh0echIJheB
         HZhg==
X-Gm-Message-State: ACrzQf3mCix5hRday/jVvbJJPqYYqTMIIWHBmRfJ5KtTS4hOV8dhc19n
        6Aa7WcYfsZiD22ofJPU9gBe+tQ==
X-Google-Smtp-Source: AMsMyM5AxcOpW1+Pxj5HhdIaVKkCfkDE5+7FJzQTJNgHqApX6ov82C3TPlcub4toz6ZYviAQNZF3Zg==
X-Received: by 2002:a05:620a:1f3:b0:6e9:e33d:3bb6 with SMTP id x19-20020a05620a01f300b006e9e33d3bb6mr9456041qkn.115.1666042892542;
        Mon, 17 Oct 2022 14:41:32 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id y9-20020a37f609000000b006ce7cd81359sm631838qkj.110.2022.10.17.14.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 14:41:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 1/5] dt-bindings: pinctrl: convert qcom,mdm9615-pinctrl.txt to dt-schema
Date:   Mon, 17 Oct 2022 17:41:29 -0400
Message-Id: <166604288592.23511.4111433272212374330.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221005-mdm9615-pinctrl-yaml-v2-1-639fe67a04be@linaro.org>
References: <20221005-mdm9615-pinctrl-yaml-v2-0-639fe67a04be@linaro.org> <20221005-mdm9615-pinctrl-yaml-v2-1-639fe67a04be@linaro.org>
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

On Mon, 17 Oct 2022 12:23:05 +0200, Neil Armstrong wrote:
> Convert the MDM9515 pinctrl bindings to dt-schema.
> Keep the parsing of pin configuration subnodes consistent with other Qualcomm
> schemas (children named with '-state' suffix, optional children with '-pins').
> 
> 

Applied, thanks!

[1/5] dt-bindings: pinctrl: convert qcom,mdm9615-pinctrl.txt to dt-schema
      https://git.kernel.org/krzk/linux-dt/c/19f7ad36ab7e5273a59d3e4e906e5e940a4733a8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
