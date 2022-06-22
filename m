Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0D3D55493A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 14:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240400AbiFVIZZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 04:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234348AbiFVIZY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 04:25:24 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEB2B37BF0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 01:25:22 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id sb34so3509225ejc.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 01:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Sk7O8lq07lQl5L3t5X6FFNtNHOKCXJGWanHL8zfryQY=;
        b=nE57QXyZ+uLvpFZbraeiA4sJT4OtDPcsAI9qW642P2/Wp2wlW8hLV7FQYC9+735+WE
         OPB12XTPs9yLe4YlYPwW7/Y4dekJEBEjurThbDv2JB9TQSuQXZWKnnw6lssIjLUFtOAL
         xOg8rBREGSf9rrBEL0V4GyXq0/y47BY4bd1SxzWiKJoyWFD/w5bePBAVhtyynitzDPYH
         qc33wXGoTqj2kiiYK/wGnoJTPE4OqU4tBZWxTmWHVheHo2lozE5KVWSQso4sHfRhNndm
         +11zb92S8W5/WfktCsyEUeJH6mwwaSoH11H7WmvViAiHrkXYEMZPJNXsprEw7rYB47pd
         x2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sk7O8lq07lQl5L3t5X6FFNtNHOKCXJGWanHL8zfryQY=;
        b=3Cgw5OIYf5EVm1tQ0eOvOXQeRrC+iBwNTIKySWWDxruTKPgCUMLBCe7MVphRxmwfP6
         YYXCnYl1nxte+AzB0/jhedmpOeckTl6Aq8/KWcJl1JUxlQiFooZ9VpnkB1NZxZByfveM
         YN4kvHeG63p7VxqrcMbexzBPlFEp02ntHTJlP299wAEiQTBgUTXrxZ5j1G4BZbck+mGJ
         nN3WL5LS6zIAuQla/UVNzsDcySclEqmqOWkXKDxEDdLTbih8SilNEF0oRuH1UIG22Q6a
         azLpwIEemNBw5ws9gLixNgwT7t1F6IpEsBII0fsRSJp2MQ/jXOV8/ytVQCEr6Vi2Uq99
         vhEA==
X-Gm-Message-State: AJIora8JhztpccOyca0yhW32sqqrCq9Is37LO1hNeGKy2ZVZRn1nysrc
        VZx3CkHIyiLqH/ChLbUSGcLaFw==
X-Google-Smtp-Source: AGRyM1u3EImERlNbTceP1iq3dl3z6SkR6Z0617AtkvGI/qiz1PIqSTKt0YthoOabCGYpE6GlFM8hXA==
X-Received: by 2002:a17:906:209:b0:712:12d8:b52b with SMTP id 9-20020a170906020900b0071212d8b52bmr2000410ejd.394.1655886321475;
        Wed, 22 Jun 2022 01:25:21 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id r2-20020a17090609c200b006fef0c7072esm8917082eje.144.2022.06.22.01.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 01:25:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     robh+dt@kernel.org, agross@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: vendor-prefixes: add Shift GmbH
Date:   Wed, 22 Jun 2022 10:25:18 +0200
Message-Id: <165588573167.12753.11773180092884098160.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521164550.91115-1-krzysztof.kozlowski@linaro.org>
References: <20220521164550.91115-1-krzysztof.kozlowski@linaro.org>
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

On Sat, 21 May 2022 18:45:39 +0200, Krzysztof Kozlowski wrote:
> Add prefix for SHIFT GmbH, phone manufacturer
> (https://www.shiftphones.com/en/).
> 
> 

Applied, thanks!

[01/12] dt-bindings: vendor-prefixes: add Shift GmbH
        https://git.kernel.org/krzk/linux-dt/c/de0f2f0d6f35a583aaade4c290d9e8c3e03970b3
[02/12] dt-bindings: arm: qcom: add missing MSM8998 board compatibles
        https://git.kernel.org/krzk/linux-dt/c/a47214e3fde968d4b251b5de8eb16c32f2b0262e
[03/12] dt-bindings: arm: qcom: add missing MSM8992 board compatibles
        https://git.kernel.org/krzk/linux-dt/c/581704606d4ec5b8e6749b7abc200795e845a0a2
[04/12] dt-bindings: arm: qcom: add missing QCS404 board compatibles
        https://git.kernel.org/krzk/linux-dt/c/1ceefa2a55ce7d9e4b8901b22e981f8965f9c4e3
[05/12] dt-bindings: arm: qcom: add missing SDM630 board compatibles
        https://git.kernel.org/krzk/linux-dt/c/4fc3efba32057a76155449a2713ff242109a65a0
[06/12] dt-bindings: arm: qcom: add missing SDM636 board compatibles
        https://git.kernel.org/krzk/linux-dt/c/7e86c41be0bebd01e2f0c87cd5b00c5746ab4089
[07/12] dt-bindings: arm: qcom: add missing SDM845 board compatibles
        https://git.kernel.org/krzk/linux-dt/c/1facf9135a1b846c7f4e8db044b425b81a7bffff
[08/12] dt-bindings: arm: qcom: add missing SM6125 board compatibles
        https://git.kernel.org/krzk/linux-dt/c/103a90f68bf1f30b46de5c08c19c9f8e97530024
[09/12] dt-bindings: arm: qcom: add missing SM6350 board compatibles
        https://git.kernel.org/krzk/linux-dt/c/f9702486c77ba74f65859098e3d8e4bdb2e8a745

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
