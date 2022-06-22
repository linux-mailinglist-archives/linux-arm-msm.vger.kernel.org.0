Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E786F5549C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 14:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354598AbiFVIgV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 04:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235752AbiFVIgB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 04:36:01 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C1038D86
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 01:35:53 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id u15so4955699ejc.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 01:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ff8K9wYmcpckkjag/EKcwkV0fZLbl5TDrCb2I2o5dFM=;
        b=L4tdK1664nj3aQaY/A99UtyriLW08gWv0q2jjjqGmgv+elv3QgNvhhn+e6h66T2pC0
         3ahvGA0waWh5zdgi6CruORoziImkQVLEmWFkqBHiVH9GNSDZRh1AuNJLoS5lzQRqCnW3
         L9VFMX5vskcyaT0Jh2JlNn+poy9vFv5W1RfeF2A1EKIBqGhpSftYqe5rn4V66d9z7SEu
         gsUOHM1ODP7y+EHbzUKvFCUrnJFqwsCXHq2Vzbi8WgQVOXhp2JTMvYrLHYFOFiP/Kkir
         NhehWvuSKlOeUvsl0X/tQWglAq98fegGf6eOAE0JTxnNR48fzrioTsYkMO0t5t91bXmc
         kQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ff8K9wYmcpckkjag/EKcwkV0fZLbl5TDrCb2I2o5dFM=;
        b=3ZfLwtZ/8MPG5SA54wTYEdjT5Izo5LnL7F4KKOjoUsuorIfmaph4FqxkuXE6nxcm9C
         AhG5BTgjU082Bn5TUDZ000ImkPNTs8VaQkotKyOq5T2jgwOdZFgWFwHziECRH2O0SPJU
         gkTwMGdO7Bb8RjKX0DhYXRG4bsZCmrzYHvx5Qc2w9YoE9yIG07WfC5NJxJWsuSQy8cQ9
         M8BrmTMMTj2cpZ2HqNho3nIQKXc+EuruYTvzq132tLH0C7bMOnLEhGZpnjTqMbYwxxKO
         Pk/ZhQOaXmBivp/nhMYw6ABQ38ml/sO6EAaOdsAgVzi54J/ne9fCfSYr3sNmyVKaWG6A
         3P8g==
X-Gm-Message-State: AJIora+eiTE0Y3MgHXepqbrEFFbP5vytPjIyGLlthRCEKVUms17+/m6v
        su6TlrABLyV7vRA6Zs8+6vg0AA==
X-Google-Smtp-Source: AGRyM1v6nzKzrABu3SQDg6pVeU2UEbLG/0D39/mv3cqF992hAT7eWKUuWd4CDBjBYfczKbXdwye69A==
X-Received: by 2002:a17:907:7d91:b0:722:73d:445e with SMTP id oz17-20020a1709077d9100b00722073d445emr2047669ejc.690.1655886951974;
        Wed, 22 Jun 2022 01:35:51 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ku10-20020a170907788a00b00722e603c39asm1979733ejc.31.2022.06.22.01.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 01:35:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        srinivas.kandagatla@linaro.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, krzysztof.kozlowski@linaro.org,
        agross@kernel.org
Subject: Re: (subset) [PATCH 3/6] ARM: dts: qcom: cleanup QFPROM nodes
Date:   Wed, 22 Jun 2022 10:35:37 +0200
Message-Id: <165588692598.15720.16529569565049013574.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505113802.243301-3-krzysztof.kozlowski@linaro.org>
References: <20220505113802.243301-1-krzysztof.kozlowski@linaro.org> <20220505113802.243301-3-krzysztof.kozlowski@linaro.org>
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

On Thu, 5 May 2022 13:37:59 +0200, Krzysztof Kozlowski wrote:
> Cleanup coding style of QFPROM nodes - put compatible as first property
> and drop tabs before '=' character.
> 
> 

Applied, thanks!

[3/6] ARM: dts: qcom: cleanup QFPROM nodes
      https://git.kernel.org/krzk/linux/c/d7b50df0b8d12fc0742be4170054f0c87bedac91

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
