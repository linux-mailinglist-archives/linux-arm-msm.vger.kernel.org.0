Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E37F3160F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 09:28:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbhBJI1U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 03:27:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231395AbhBJI0d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 03:26:33 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE44C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 00:25:53 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id z9so715152pjl.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 00:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g4mAxK84GVyyKetwRBgARd5k8KiBNnAsnToA/1zbXCg=;
        b=GLne2KwtyWUcLtsjoYrN2d+ZV3yyoA3ILAldzIyiYA8Z7waJFzoH7SNdpikNHbBVAy
         +PKuZ2LJBCfu0JtcPEJjYTz1KEuPLyTadRuVGRXE0dRv/ZiboPdinPnVC68WkXKDLV0M
         7CLvS8Hmt3mpG/urv/zMZP3vzNCuaDV4ypO9eMe2rvfy30KlSgZFqFR94Xx4i6+06V4Q
         m3hXLSTKNNdnf5rF5s2OI1OHxvT8G41ixRVOpkZgbOST8D7i7AHjT+kK5KKssvGtOlPD
         Wh3nOdDRhI1XTKZANfFNzMNQhyxyt9TXRgad4pua6Ovc8FF8sSptWfVEiM7L9pfSDZI6
         8OoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g4mAxK84GVyyKetwRBgARd5k8KiBNnAsnToA/1zbXCg=;
        b=n0Q3mSHrdIf6rUtj5RipaiyLeBfJ59w+jt2Tnr+myUItMEtSk3Yqy+QzhCmXcsRl6I
         /V+7mncafCJ/BAz6I0hJiszDMEKnTKx/0oB8znxeDaCTB0gCr4H1bThtZVhBH8WlskOJ
         hl18dyb5mRTQpaeoLn/LDJtGrP8iof23F1AUuUxSCHJzFZ8OiU5zU1BrW+tVI5lJ+0mn
         jtQu7FjQgoFiCxpTm+Jc/UBnqsBprt4L6xWc7CXvfos2ezA19ELVF9CQnrBy/s0rIKF5
         kX4KUzax1lRtdhmOiU5YuUeHPdjevXKHMZPtm9MQh0nN4LBL4e80O3xb88oChcWus6qF
         esSA==
X-Gm-Message-State: AOAM5310MMsar0BCiEnWFUjqrDaoDIZRHT61BPGV9HDb9zAkZmqyEWUy
        OxFwmx5hz/iTPoVKsO1CA4QW
X-Google-Smtp-Source: ABdhPJzhj439RRQshBLOOGPVaOfrmeeEbK3w7uF7K8DfGOTJ+v0iCH7vyeCfb1G1rhxshZxuv5OtPw==
X-Received: by 2002:a17:90b:e09:: with SMTP id ge9mr2016098pjb.173.1612945552492;
        Wed, 10 Feb 2021 00:25:52 -0800 (PST)
Received: from localhost.localdomain ([103.66.79.29])
        by smtp.gmail.com with ESMTPSA id r68sm1402963pfc.49.2021.02.10.00.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 00:25:51 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        kvalo@codeaurora.org, ath11k@lists.infradead.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/1] MHI fix for v5.12
Date:   Wed, 10 Feb 2021 13:55:37 +0530
Message-Id: <20210210082538.2494-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

At the last moment we noticed a regression which existed since last release.
Since we are very late for v5.11 rc, please consider merging this patch for
v5.12.

Thanks,
Mani

Loic Poulain (1):
  mhi: Fix double dma free

 drivers/bus/mhi/core/init.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.25.1

