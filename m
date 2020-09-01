Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0F1F25A10F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 23:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729709AbgIAV7s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 17:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727918AbgIAV7p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 17:59:45 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93904C061244
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2020 14:59:44 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id z15so1238015plo.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2020 14:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3rnwj2YW6I8HLfDh0uPTOzbh/3kFrbTfzm4Bn/WyYBA=;
        b=RXPbcL+/x/0/MCRLgV/vAAejfDzweAhJZwltTuPOwujDYS6sVTZv6LcDC0toDGfsR5
         27pTZsYznoxtJo9BWxj3FqS06iQt+BCkzz4EzmAtE+kXFe26jaN7/pwok/7gmxRtKHfG
         Pu6xK0H/CaFc3L4FSKt022kwlnRYfZVf6g/HQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3rnwj2YW6I8HLfDh0uPTOzbh/3kFrbTfzm4Bn/WyYBA=;
        b=OkNG72QhCPSvNoDAMb1ofXCsFzTPBsNxCmPhsV97FbK0LqU0cf6bpJAAzbOT3mKxr/
         TodsULuT9ykkYd/RAxCoaa4pe+/Tqs8YmVENF8JyxFTaDJzFpItqFndo0ti3V1HpJzrz
         mS4xLelt18+TN9aj9jwgKf7hlNfHbe8OjManz/7kaKY/kjgbIlv+x4JCnypfxy0Y47v8
         W02/R2MDLOmUEzlftvyekJOHzUUqaAA/QdCfh6GMEOHhfk3AQcQ7hcsRDUVfPnVnSpw1
         x3hCDSQKVWUNXWKZh3GGgHFOwWODCehRnKhDziVPzle9h5Y7x2CLQRpiXfdtA6fF6wop
         VDng==
X-Gm-Message-State: AOAM533h1UkUdq9+T1PQkkrsTPHm0dKYzOzrwer2himGgq4nV1zdB5iK
        h8f+pOIVo0ZOoN+ArC3DpfUSug==
X-Google-Smtp-Source: ABdhPJz9RPfwEsuY9az8y012sHdT37924RbixUIVrrwiv3YuNEPc599qRWWZD3WwDHJJOHxIT49HpA==
X-Received: by 2002:a17:902:7b8a:: with SMTP id w10mr3245995pll.145.1598997583989;
        Tue, 01 Sep 2020 14:59:43 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id q5sm3044037pfu.16.2020.09.01.14.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 14:59:43 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>
Subject: [PATCH 0/2] A couple drm/msm fixes
Date:   Tue,  1 Sep 2020 14:59:40 -0700
Message-Id: <20200901215942.2559119-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Two small fixes for an UBSAN warning and to make debugging a little
easier.

Stephen Boyd (2):
  drm/msm: Avoid div-by-zero in dpu_crtc_atomic_check()
  drm/msm: Drop debug print in _dpu_crtc_setup_lm_bounds()

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
Sent by a computer, using git, on the internet

