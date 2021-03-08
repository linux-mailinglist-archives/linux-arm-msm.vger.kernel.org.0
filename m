Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A95F330BB4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 11:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbhCHKwg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 05:52:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbhCHKwY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 05:52:24 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 526E3C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Mar 2021 02:52:24 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id lr13so19388570ejb.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Mar 2021 02:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xYie2gy4LBAjfH0NJDaBUMncDB/ZASqwSK42u9AehpQ=;
        b=SZC8mBf01mL6f9Kbtkr5U4Z7AJeOm0y15kJJodT2O8oPurnZua/9p6j5t4j3F4/RgN
         QzQcLKXPB30IHBpQG59+VEFQE+oRU33mE7EHqoKaZ3qgELyr4qqR6Apnu+gEnVozSq/k
         USbxXhhUzNDT2asiGReQCKEmpotIcrV+dL4jRQ0foPtDwaKXfrBjBlICmO6T1liRQv33
         jO+FEwcxqgECxKkv5PFO/BgA2m8cFOJWwnkhSTyqe1FGEMud7K0AmTdka9o6pw/LnqH5
         y+G/CdhUokw4B4Y8HuDaPl/zjruMmj5MHjEuRXNppGaX8gUr7G/5tiSL0VZ5ZjD7OEgt
         KvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xYie2gy4LBAjfH0NJDaBUMncDB/ZASqwSK42u9AehpQ=;
        b=eptdsB0VmBjvmoFvnQtwNhgIjwGGsWeYIwNvYjNEe4wTRneptr3DJsjMhHcBOGV1Sf
         86RxSlEjlAxSLgWadOyhgMBVnWb16BtDlsHr1Ni9so2dhZRfUPm9CBX/AazaroG8ZbQD
         2aClqVENfl3WY/d88fE4qDsVFi8VnLFYvoWWGjSeRnATIr1iUpt3lNzjGu8EwmNu5E77
         k7D/Ydl1JoXtkUxn7UHQ4kkR5ntSl8hREcZaI/lgijeWesh9TMifdTcPiogJl5MPMSsB
         3Plox0oE/x9Vw0QDZ8a+81gijnKwpUmEjvAyMkcjJf0JTSYrH2tle14NS2ZNYeeDGs0s
         0XrA==
X-Gm-Message-State: AOAM531L1/MY+07oXuvti/dsE+BPpob2X7hItVwlfFHaJxZkVa21BaJn
        G+ERxL3usZyYtu345vDIyJkF3wOslwq6Tw==
X-Google-Smtp-Source: ABdhPJxvO6oGUKdllXFprRSw4t59d5jbgYx6b66WVsCTqL0uyZgnce/9LEpWYbhPgmFFf1iT+n9Bzg==
X-Received: by 2002:a17:906:828e:: with SMTP id h14mr14531226ejx.529.1615200743125;
        Mon, 08 Mar 2021 02:52:23 -0800 (PST)
Received: from localhost.localdomain (95-43-196-84.ip.btc-net.bg. [95.43.196.84])
        by smtp.gmail.com with ESMTPSA id y9sm6386297ejd.110.2021.03.08.02.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 02:52:22 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/5] Venus msm8916 fixes
Date:   Mon,  8 Mar 2021 12:52:00 +0200
Message-Id: <20210308105205.445148-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

Here are few fixes for msm8916 (Venus v1x):
 * Two fixes in hfi_parser
 * One fix related to opp_set_clk_rate
 * Default header-mode for encoder is changed to join-with-1st-frame
 * Added support for actual-plane-info for v1x too

regards,
Stan

Stanimir Varbanov (5):
  venus: hfi_parser: Don't initialize parser on v1
  venus: hfi_parser: Check for instance after hfi platform get
  venus: pm_helpers: Set opp clock name for v1
  venus: venc_ctrls: Change default header mode
  venus: hfi_cmds: Support plane-actual-info property from v1

 drivers/media/platform/qcom/venus/hfi_cmds.c  | 24 +++++++++----------
 .../media/platform/qcom/venus/hfi_parser.c    | 12 ++++++----
 .../media/platform/qcom/venus/pm_helpers.c    | 20 +++++++++++++++-
 .../media/platform/qcom/venus/venc_ctrls.c    |  2 +-
 4 files changed, 39 insertions(+), 19 deletions(-)

-- 
2.25.1

