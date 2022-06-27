Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 722C255D456
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237819AbiF0UDR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240773AbiF0UDQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:03:16 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00A1D1A042
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:13 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id p8so14308460oip.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FFCMXjXY5CA+wpxZdZU3Q9TCkvTfbgK66kz1Or5tYrk=;
        b=JT6qU7+CFlyjvn1GwZ9aVAbmmcZo7H+jgOwpHSAGZgTxGnstAVMJ7i4mgmnUqTPlI3
         emsp8831jI07Ta4X4uVYiZu0FW0G1+Ur+cf2wWX/ANz+iKydsiAaNnkD39TxATETutn4
         CoiuiHm4P4ZPDCEuPVVzCyWtjqr4y0VBnkyJ5Ldff1AUqnAxFG886pc5t8O0uCYGTEjE
         zjU/Zny59+EvS0Zw5NSoC6NOp42wV+E+/s1fRz/DQ2xQKm4IzrTXwQUiKS1rOXrqf6gK
         U8tBYrKe50SoXdWTyRtIuhL/q+M9TcOADqZc7EIcY+x6tyeAPKD71szJjAet1xTE3w9+
         HU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FFCMXjXY5CA+wpxZdZU3Q9TCkvTfbgK66kz1Or5tYrk=;
        b=4ygirUargr4rc7d+EPIBiaR/3I/5TsrQHXFBnUXVICU2zVSMy65lx25NsmBRaPC6Hn
         AeWzeI2jEsDz0/zwDJBcylH3PszMuKwK4YwkfI9Yc1Aq6HAMYQd7zgoBbXWf6Ua2LCIY
         mrN7dg1jNSwEu4aTo5Pb9uIchCIxL2blSzlvKFdv4IEQAjPpMtxwLigmdB8yDLgnk/cr
         CjQJMt1eHZpoQNDiXdcAs5JfPXXRqYxSxlTlaeBtRRlDgBh6lAUVw7pSj/3nr/T1q4xT
         BK9LvdjDCjZ2GB+X1ivkGOIcxNGTrNFsGtv998snhUJOlE3zLOfx5C8nVL1MwX2JAiiG
         6f0Q==
X-Gm-Message-State: AJIora/D89fG2toktLI/jqCXpBawRm8d53AEO7alO/iXG4D4aYAL6bS5
        //PRQCjfnxwaT58N5LRFHIgbxg==
X-Google-Smtp-Source: AGRyM1scSt7+Wsgm6JxzcsPK1MS1SIw6jYVQBmyq7W144MG/hOju2sP8g+cHD1deDeH3rdDDZFqSYQ==
X-Received: by 2002:aca:bb56:0:b0:32f:2160:bfd8 with SMTP id l83-20020acabb56000000b0032f2160bfd8mr9345061oif.92.1656360193222;
        Mon, 27 Jun 2022 13:03:13 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:12 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dang Huynh <danct12@riseup.net>
Cc:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH] arm64: dts: qcom: sdm660-xiaomi-lavender: Configure WLED
Date:   Mon, 27 Jun 2022 15:02:35 -0500
Message-Id: <165636016347.3080661.7229765729072717301.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425032824.211975-1-danct12@riseup.net>
References: <20220425032824.211975-1-danct12@riseup.net>
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

On Mon, 25 Apr 2022 10:28:24 +0700, Dang Huynh wrote:
> WLED is used for controlling display backlight on this phone.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm660-xiaomi-lavender: Configure WLED
      commit: b74f7b8f174f0ce2261cc05050dcbfed3314ab1e

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
