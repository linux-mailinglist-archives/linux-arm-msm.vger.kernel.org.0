Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C25F856441A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 06:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232638AbiGCD7U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Jul 2022 23:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232499AbiGCD63 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Jul 2022 23:58:29 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9ABBBF49
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Jul 2022 20:57:36 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id l81so8913614oif.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Jul 2022 20:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tKpzejLshB+azhLe9/Pn6K4qRUtHqwv08GiuhB13awQ=;
        b=Vlm2UvMOBU6j+F4uA1uua7xdjcKXAJS16yiVDzjz0fk/TohHw1n3ZuLBFOOgXJnjdL
         cC1/iYipDv61kk1Wx2KIkpaJbPD5MjbHRvNKB3RbT1drthzxeIctUH/pmq/78cCI1G/o
         tezcGUX8sEVS8O7jWRND0vOopeLMPVNIYzKslhsAgScNX65A16mA7o+LnjiMv1T0NoLd
         tSO22rYNQsxjV7ggwlMj+5DTGQIL+LLHdIBKM8CIU1WF+DGZA9Rb6fyIy6dQHFFIrYtw
         4cVpeoZfBJb1BUnGVXxmzqJq6rbq5dM4XK6dHfdm/ja1FPH8buuNbkT+OZLY1/OkBmJG
         Flig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tKpzejLshB+azhLe9/Pn6K4qRUtHqwv08GiuhB13awQ=;
        b=F/gw9MHfTDiLZEq1WIlE316OZ97fWieioCRSTQRulK3qJcBd3g30VJ8YpY5UUUHM8C
         jBixhbrUf6w0HJe6eFCrOQdSTSQGAosiRdnearC1S24adTo2JxrAQNVzjFeP7uvkhCPt
         nQAI2NcCG4NuPAnYf6FWwKR9XzEBNMcSRq5y5MbzuegteBA4hWwL/LUXJ0amJPXfzD42
         Rne/wgEf1YO93HbNNmjWIu8HTWzaPvJLKsDG52WWZ1g4o9Pv5DfdiZGySRyZOocekAfb
         uWxiKmZjgFqPVy+/C3cPX+90E7rlCarMKcI8XdjmmHHhPrObRP40wsU+vuL3j55UW4Mx
         12Yg==
X-Gm-Message-State: AJIora9n6JajLufCgE4UfelzuNXau4OKk7RsFXkwcs7YDM68e0RAMNVo
        b6FLqQP80nCj8VHioOl2uX6dXA==
X-Google-Smtp-Source: AGRyM1sZ9cAQ+ayswgOKAMc3SmLTVs5cQB5R9X2D8VC6DbfvRolsnT9XWG5MpLPLW7XQRPj01oOHcw==
X-Received: by 2002:a05:6808:a89:b0:337:b33f:90d7 with SMTP id q9-20020a0568080a8900b00337b33f90d7mr1577812oij.262.1656820656702;
        Sat, 02 Jul 2022 20:57:36 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:36 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Olof Johansson <olof@lixom.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        soc@kernel.org, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: (subset) [PATCH v3 23/40] arm64: dts: qcom: sdm630-sony-xperia-nile: drop unneeded status from gpio-keys
Date:   Sat,  2 Jul 2022 22:56:30 -0500
Message-Id: <165682055968.445910.692492980359330400.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220616005333.18491-23-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-23-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 15 Jun 2022 17:53:16 -0700, Krzysztof Kozlowski wrote:
> Nodes do not need explicit status=okay.
> 
> 

Applied, thanks!

[23/40] arm64: dts: qcom: sdm630-sony-xperia-nile: drop unneeded status from gpio-keys
        commit: 9d8840f6ee426b6dfcb65bdf39e2898652e2b1e5

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
