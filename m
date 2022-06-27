Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9D855C5A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 14:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240809AbiF0UDT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240796AbiF0UDS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:03:18 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 754B11A049
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:17 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id r82so5626927oig.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UhPhl+t5/ktAw8kSs3VVHsTa2VujQ4O2ZgSbpa+CTK8=;
        b=wo6k1nvz2uAijMO/X2kzzMChd0/6KzyQXO2e+Y1CE5FncOKxMZFzEPzPaaBoWwDMJf
         CC0Q6rWWmtRXEXZ8XC0TdzI9DBcKTlTRUIgd8NH2hHRavpKbC88uftAEqP0FdPzV9cDh
         vNk8P+yLmimbZmwuivS5Ia04qxZ65t4WXQYjI4t+wn6v0nLLeQ1XUP2FGQwn3i0SOh/C
         ip5UFuSd02tKk4L/9gLFoRM3dRl8MUcDObFV/pMB7QDL4IasCF5aIPORT6qw9yzXeOKL
         /G+1ZpOuQO6EJDs/MlMzJTHkuXg5kGXtJlEsyruF17NlQL9nXV1eIAAqBzWML5OQcnvW
         oosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UhPhl+t5/ktAw8kSs3VVHsTa2VujQ4O2ZgSbpa+CTK8=;
        b=o2E3BsXGziBZuDAvUdyjYKg7UDU9FkggeixORNYm26BoXdtkypwTsFrv3StANdP2fZ
         VwNvKuhk2iKE+zfPpSOVKNZDWDCcVL9Q7Ibrelif6hgDyh3qK7PVrjqDBBjzA3Q5a18b
         fuwI//fVmivkEo7e0JlBtgxQANtOtXtCa6+RhiePpTJcsAWRDZjou7fCnXeJUp7fIy3Q
         YyQkOYTjDer/atAr0/RG4jLNLLuMtABbqj/RPeICJ8cztL7V/Or5wmnPUSUm3Nfdbwz5
         jeg5st0i6sTZ0EG7GqW6Ujleujyi/SM9RX0FXdQ5Z5JBJ9WtZPzIo33qjJl0joEQk+t/
         BkZw==
X-Gm-Message-State: AJIora/xT4QD1aTcbUPrgLWorxwvT4EGQd/7E6T97yXjHY8s40eD1lhj
        AFNWGyI1iFU/yeeAzRk2feTIbQ==
X-Google-Smtp-Source: AGRyM1se0SWBIF0TKW3xdl58Pn1tRqQwQ5vhssxGx+H/Jb8lwDq6ufWHQ1lzQZ06XrUuuwvFLMqHcQ==
X-Received: by 2002:a05:6808:3096:b0:335:796f:abc2 with SMTP id bl22-20020a056808309600b00335796fabc2mr3044152oib.173.1656360197115;
        Mon, 27 Jun 2022 13:03:17 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:16 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, quic_khsieh@quicinc.com,
        quic_sbillaka@quicinc.com, Rob Herring <robh+dt@kernel.org>,
        quic_aravindh@quicinc.com, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        quic_abhinavk@quicinc.com, Stephen Boyd <swboyd@chromium.org>
Subject: Re: (subset) [PATCH] arm64: qcom: sc7280-herobrine: Enable DP
Date:   Mon, 27 Jun 2022 15:02:38 -0500
Message-Id: <165636016348.3080661.15532387701959292161.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220513065704.1.I9b9b9d4d1a3e0350a89221892261881a1771ad15@changeid>
References: <20220513065704.1.I9b9b9d4d1a3e0350a89221892261881a1771ad15@changeid>
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

On Fri, 13 May 2022 06:57:14 -0700, Douglas Anderson wrote:
> This enables DisplayPort for herobrine boards.
> 
> 

Applied, thanks!

[1/1] arm64: qcom: sc7280-herobrine: Enable DP
      commit: 4ab03ef8b33c2c80ac39da32c05f90f594b32e79

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
