Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1177655CC5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240792AbiF0UDR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240775AbiF0UDQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:03:16 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1945D1A04E
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:15 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 73-20020a9d084f000000b00616b04c7656so6848680oty.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eQ7/jAxzAPKGJHahA2Y+CW396xkeiYFHsQNQFPO4oh0=;
        b=ejWW4HaxOp2nHXMsiDr0klOMTxoZFgn72U7KRst3mfPbtaNKOkkxALhsG/CGeOMFBK
         7JmagV33doZHAB8qU4r7kRZaj1IN3O/BPZ/Oj+6CJ6Q3I0Y/yN4oHxcQYdfjaOrzCHbE
         Wa0s7caQNEEjrYgJq/o/pXu43th4Wb/5tTjGDdSv6FtDNeqRVBQK+55cOCjEIhyMbJf3
         F9VwsA8p1pDQl6yZ+BMEPfPkvGmSTZ+/+aYmpy7Zuyspho5izgrKzbv2Sk9yiqLqUxsq
         Wx7bncAfdODglOecWNn793yppnpnWrDhH0a+gBvEjB6nQqk87+EkuRytxq/pYKMvfFRd
         oIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eQ7/jAxzAPKGJHahA2Y+CW396xkeiYFHsQNQFPO4oh0=;
        b=rvIzcQ8EEAQfcZA54gc/MMZU+BMDm8z9qiQwFuCFrAHBVMLdTCiwfbfrMVw1j7DSCr
         wS+C+cwX1Ja0fOEYijxJjtUzEW2A09Z65OknfXkB2c9XNA4IPUGuNhsIQheV9/28Krol
         M7GF0BLLxL8rogkZ7QGAjDNFef9ANKLhYpLgYuiBzPhDgLPR5tYY3kvPNSiBXYP15apL
         bIaC0ZBv5n8/iVOU8kAkBOMzgPp+ng5TMH802rDULyJy3A1uRTxhwR+xXhPCPXXn1nQ9
         LwkaN3OjUL0mEnDtxzKfwNiwOpNeIX0Buxl7p5w033xd/pKN3SJmzgW07EINRz4Vwpxy
         CtUw==
X-Gm-Message-State: AJIora+A8IGiGSMXDswvp0C/s5MRrm8QU208EGGtg8GO2CCcLIKyfl95
        Hc1l84XsbsqMSoeWSaOXvygXLg==
X-Google-Smtp-Source: AGRyM1sS7Zn29mCqyk+lBnHFRTP/uGC1oB1xx2u63adG+Jld2h2icGpwhRI8/PeDLJAvQovzEesWEA==
X-Received: by 2002:a05:6830:83a:b0:616:c39d:7448 with SMTP id t26-20020a056830083a00b00616c39d7448mr4107882ots.57.1656360194453;
        Mon, 27 Jun 2022 13:03:14 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:13 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: (subset) [PATCH] arm64: dts: qcom: sc7280: Add touchscreen to villager
Date:   Mon, 27 Jun 2022 15:02:36 -0500
Message-Id: <165636016347.3080661.16164384113670247278.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524134840.1.I80072b8815ac08c12af8f379a33cc2d83693dc51@changeid>
References: <20220524134840.1.I80072b8815ac08c12af8f379a33cc2d83693dc51@changeid>
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

On Tue, 24 May 2022 13:48:49 -0700, Douglas Anderson wrote:
> This adds the touchscreen to the sc7280-herobrine-villager device
> tree. Note that the touchscreen on villager actually uses the reset
> line and thus we use the more specific "elan,ekth6915" compatible
> which allows us to specify the reset.
> 
> The fact that villager's touchscreen uses the reset line can be
> contrasted against the touchscreen for CRD/herobrine-r1. On those
> boards, even though the touchscreen goes to the display, it's not
> hooked up to anything there.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc7280: Add touchscreen to villager
      commit: e58539532bab3cbe5b1ba71d54db6d6b7d4eeced

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
