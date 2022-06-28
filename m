Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D80255EF34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 22:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbiF1UVu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 16:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230505AbiF1UV2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 16:21:28 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2762DE52
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:19:16 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-101d96fe0a5so18589604fac.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TCcMfFRtuhcnVZP9mkAnGiDz0f6ZT8Z4OqJ7ET/FUrU=;
        b=Jal3fOHABSnUElZ8o0vsXuyk//GtCzW9cGLepf1PYxzeeyvccgublrQeOVpMT/5fjy
         M4FbF2W5h31spifuQzU3U6U2WM1q6pPr8zqgbJB2ayEfX5M/7puMrvOxX+oHJKEH8UH9
         qmtBCozdL0O3c4P7NZ85hlvczOVMeZ2k+FDrVPFX1qrjFqu7OD9w6UMPn2EVS9alp1yZ
         +11TSA2T0INvP5FIe8Y2GG87dDhhQc8gRbechyk0K2ReJzz4lSp6LLuASjHYF4jwmnIL
         g/EMD25yD3mJKS0n1j7qxOk0pZ9xlA85gaO5MSq5qKftq96FWdgIhDJXHQ/0RRBIGbWh
         oqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TCcMfFRtuhcnVZP9mkAnGiDz0f6ZT8Z4OqJ7ET/FUrU=;
        b=ZQHJLqxKkjpsZoZGtNg+urwzq09jT/l5f4dp2igkUO9y5pW+KIm2hwtyk2u9uNn88X
         ia17ewzBLJ9g4nU2xOSWli6FYIAuNhxIrQKqQRZKt4DTsKQOpNeDuE/lhr9IMBte0Y57
         8LS3yzfuxLpN3v2VLuaT9c92v7DTDko96BQ9dz+XtA/rFRI3ZFHOVuax+3pW2zE5N53T
         QG/xBzkuyl9Vm9mbauGwtWY7gFO/h9UJXKTEK88K8LWPUk0lU8x/TfOhlP9IHnUfXPY3
         QnfW92CtBsPkmtXlMxf0+MwuQ8FYolM8JyVWF+zmhXd3MACXpNCXsPqWaIqqDs9LoTnP
         x1xw==
X-Gm-Message-State: AJIora9QQQBxXyf4balPaPJACdFKisSwlmges0DbZdgefHFOi6LDUgjN
        RFZDtisbk68BwnaXpEjOn365Rw==
X-Google-Smtp-Source: AGRyM1uS9oXAEb/kDm4KVv9+HRisJG2CyJsvRd+zbAogIYh5jQtGRqn5Wof4gXMG4zs6pf1ij8mCwA==
X-Received: by 2002:a05:6871:420b:b0:108:be11:7e42 with SMTP id li11-20020a056871420b00b00108be117e42mr846361oab.133.1656447555445;
        Tue, 28 Jun 2022 13:19:15 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a12-20020a056870d60c00b000f30837129esm9536923oaq.55.2022.06.28.13.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 13:19:14 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        Sricharan R <sricharan@codeaurora.org>
Subject: Re: [PATCH v2 0/3] Small fixes/improvement for hfpll and krait
Date:   Tue, 28 Jun 2022 15:18:51 -0500
Message-Id: <165644753306.10525.8110695593593375784.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220430054458.31321-1-ansuelsmth@gmail.com>
References: <20220430054458.31321-1-ansuelsmth@gmail.com>
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

On Sat, 30 Apr 2022 07:44:55 +0200, Ansuel Smith wrote:
> This series has small fixes/improvement to the hfpll and krait clk
> driver.
> 
> This comes from another series that got split to better facilitate the
> merge since it was grown to 21 patches and was getting hard to review.
> 
> For hfpll, a conversion to read_poll macro and introduction
> of a timeout to prevent a stall.
> For krait, a fix for the mux sel logic and an introduction for
> 8064 errata.
> 
> [...]

Applied, thanks!

[1/3] clk: qcom: clk-hfpll: use poll_timeout macro
      commit: fcfbfe373d41b4728ffec075f8f91b6572a88c27
[2/3] clk: qcom: clk-krait: unlock spin after mux completion
      commit: df83d2c9e72910416f650ade1e07cc314ff02731
[3/3] clk: qcom: clk-krait: add apq/ipq8064 errata workaround
      commit: 898d0d6483a9360f1968e0a900465c1fa152a4a9

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
