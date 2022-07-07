Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBE43569802
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 04:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234014AbiGGCbh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 22:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234709AbiGGCbc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 22:31:32 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A9C12F3A9
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 19:31:32 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id i19-20020a4ad093000000b004256ad0893fso3248919oor.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 19:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YYAWf1vDUfn+qhF4EbU0apynTp5YyOVUGPAAMYRF5Os=;
        b=kFGTPVAiO7y8B9+gbjN1lQfUknQZKllmfvvOWGgHYm7mngU3npwDWZ3KxlxBHLRYL9
         HDkOLjei4Y6PgWGX37FvRkAr7UBWOGCgR78M50tUejmny2TjpQdhG6yJkQYLTAeBKiek
         2sHFoDgKkbxKBMQsaOj4QWCeGkLVYqOlDi0NBz5lJdFzZR7wwciEvSvjGCoPDV+pc03X
         ETwcArNpP2IkxdgqivLXFt5OQHf+3vbv8tPCdmVFyNOGZLz1whdKSWp3Elm9ZAAzUkl7
         1R26QzIQhvr5XK+aLoibMm8mnQ6RwxTr0NN4MTPPRkxso/uDxpf9wYDkDuPAww+pw6cT
         Cfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YYAWf1vDUfn+qhF4EbU0apynTp5YyOVUGPAAMYRF5Os=;
        b=NVgCAVpz3t1Er6G24NR5+c/OzqPUmxHdh/OPFtyEZqqXDqdLbYSF+ZAGi0Eg344Cyt
         V3n7Ezev05AjHsgbEag2bjD8botjjFqYE6bhdzzEJTNLg8vw6VB8Zp/Ilpvy0hkewHiK
         B64yu66blyWtLsckFwDrp4RksEbE5EN+iWy+kX7pnExKN4f/M8JN51aIwulXDA/gs0uB
         U7TgVnNSgWnB6fmPUkQZT93D6R87feirQNFLOSA9A/K3BnEWCcsZLmrgMf3yY009jHCM
         aWNATrItOFGAl/37B6wnPNuDyvP46Ra6QzD9XDgXLmFjMwoZJBDJdcly5m5P4OPpjKc/
         l18w==
X-Gm-Message-State: AJIora8Etsk3RWoiwODyFgfAGsYx4UE00U4HX50w5f+TOQEqIUXLVMDK
        xnInclA1V300jcymyeTFj9hVEA==
X-Google-Smtp-Source: AGRyM1tJ3CfwvID4pMX3J0zja8xUa5LkjynezJaIPR7xGR5GVMJlEJala8g+oXwhZBT9s5yqi88i3w==
X-Received: by 2002:a4a:b401:0:b0:35e:de93:43a9 with SMTP id y1-20020a4ab401000000b0035ede9343a9mr18013954oon.80.1657161091766;
        Wed, 06 Jul 2022 19:31:31 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x48-20020a056830247000b006168c71ca4asm17024469otr.56.2022.07.06.19.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 19:31:31 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v6 0/4] arm: qcom: qcom-apq8064: add separate device node for tsens
Date:   Wed,  6 Jul 2022 21:31:09 -0500
Message-Id: <165716107313.864223.16495504646338874492.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220521151437.1489111-1-dmitry.baryshkov@linaro.org>
References: <20220521151437.1489111-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 21 May 2022 18:14:33 +0300, Dmitry Baryshkov wrote:
> Currently gcc-msm8960 driver manually creates tsens device. Instantiate
> the device using DT node instead. This makes the APQ8064 follow the
> IPQ8064 device tree schema (which is also closer to the way tsens
> devices are described on newer Qualcomm platforms).
> 
> Compatibility with the previous devices trees is kept intact.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: clock: qcom,gcc-apq8064: move msm8960 compat from gcc-other.yaml
      commit: 91a4cbf93326f2d27dda7361c43a5bb24cfd93c3
[2/4] dt-bindings: clock: qcom,gcc-apq8064: split tsens to the child node
      commit: 621f984840928f0bd14b20c86b70a15590ed2d3e
[3/4] clk: qcom: gcc-msm8960: create tsens device if there are no child nodes
      commit: 93b793d88da8b2c7afd63c64772666ec4274efad

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
