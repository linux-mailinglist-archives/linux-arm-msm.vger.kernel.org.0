Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D33014F0C51
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Apr 2022 21:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376343AbiDCTlL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Apr 2022 15:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234929AbiDCTlJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Apr 2022 15:41:09 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC3C125C4E
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Apr 2022 12:39:14 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id g24so10402053lja.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Apr 2022 12:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wk3H8QcYhJFlemZ1q+BG3hQb9jiwCsmX9Y49jRm6Knw=;
        b=Md+Z1e1xaeYf7LzqHwUfzaGs8DoDtNjNDtm6apT9O3wLZmawCKJfNsaS1+pVEsNuNg
         7S5vJCmPzJ/kVCQfyCb7vTz3YiOzLpxySiQjoKvVXfUnF5MmficG2lzQRU72KMPnNKY4
         W78l0bJL+HaiqMceM+TqoBEn7BZksCMF3fKxz8WPuI2EXdB+7lktD1giMWeo8dX5SToQ
         +oYEW9PsxbdIxqdOjdXGcx2eNvxcN1Cnx1IArp/G3Ow6SWwtyKksvYY6xhYvNyi7xzdP
         YsoWJspCCD0nlMRdA+VwrJH0V5Oqu+V9/VYLWqbmuJQ3vqQTEOy8AihMV9qYwjnBqeIP
         SfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wk3H8QcYhJFlemZ1q+BG3hQb9jiwCsmX9Y49jRm6Knw=;
        b=h3tk/2kR83B9E2ko7D3gl/LoshwlInk1QvsvcdSrQkcYqkYFmlsDRZDw7z+Vwj0G+u
         dCHsbh5uaQ3eUHVMqfGPPuj17ZHSbsdGubT5oUZ7v4z0MUpE1OlJq4bq+i5UpjB2+ibs
         0k+pP9GTkJ4m+XsgGAbc1Klcc+6NOGxQUNxNggTu+2HC6PVJIejPIHETg0Q2g+Ci/TbO
         NwC+SylQd1efLLunTf1iH7GqNXyLEzp89YkO1PIPu5ivKx6EwqhHumu96GPgnu148NL7
         wWM+hCd1+Fe3fNEjhEQwx8gTbrowhhnxqlxN6kjUFBB9CbC9yG8JBPWd1tcWmqVaOHF3
         wIXQ==
X-Gm-Message-State: AOAM531TBPfmE/XZtt2whQ08koUk1gsJeKb3BUH8dmeNzeGD0qDJHAhN
        Tvnffwr1bJEPf/p3wBsTDO38Fw==
X-Google-Smtp-Source: ABdhPJwmfiLVUgftna6fDRZDbYYeDl/NPZlthNvMpnFmaBGmHwLTokvvhgP+HyPtvAmFs4YExtQKLA==
X-Received: by 2002:a2e:a0d5:0:b0:24a:ce91:57f2 with SMTP id f21-20020a2ea0d5000000b0024ace9157f2mr19452037ljm.410.1649014752585;
        Sun, 03 Apr 2022 12:39:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y37-20020a0565123f2500b0044a1e1c6b37sm900903lfa.53.2022.04.03.12.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 12:39:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 0/2] arm64: qcom: apq8096-db820c: enable MSS support
Date:   Sun,  3 Apr 2022 22:39:09 +0300
Message-Id: <20220403193911.1393920-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
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

This patchset depends on [1]. After some trial and error and after
enabling QCOM_RMTFS_MEM (mea culpa, it probably was not enabled back in
November, when I was testing these patches), the modem stopped crashing.

The MSS boots fine on DB820c, registers services, etc.

[1]: https://patchwork.kernel.org/project/linux-arm-msm/list/?series=553085&state=%2A&archive=both

Dmitry Baryshkov (2):
  remoteproc: qcom: q6v5-mss: add powerdomains to MSM8996 config
  arm64: dts: qcom: apq8096-db820c: enable MSS node

 arch/arm64/boot/dts/qcom/apq8096-db820c.dts | 6 ++++++
 drivers/remoteproc/qcom_q6v5_mss.c          | 5 +++++
 2 files changed, 11 insertions(+)


base-commit: f443e374ae131c168a065ea1748feac6b2e76613
prerequisite-patch-id: cb78922831b08e04445919773f35c27c1842c7ed
prerequisite-patch-id: be27f629f9ac70529a170399ea8c2a01c1f48913
prerequisite-patch-id: f248d2296b3c450db3db46ecaa4568d2f5296dce
prerequisite-patch-id: c3d6a03b9e5e058caa50ce3c916800c594b76248
-- 
2.35.1

