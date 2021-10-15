Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8B4D42FA2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 19:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242446AbhJORZx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 13:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242393AbhJORZ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 13:25:26 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 323FCC0617B9
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 10:22:30 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id l16-20020a9d6a90000000b0054e7ab56f27so13708973otq.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 10:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BxpQ22uEFOzTdizhdSgRjmRNIbfRLMF5OEHx2hZci/k=;
        b=AoOdVFFCNGASwYtPggwIY3kKjtEyrnLx5OjvyCXsETVLYXJLP01iHaKMb/F+FD9Ldh
         e6/l8vGWUvl4IfIdskLFsdxqSRvydf+uXliumAc3nIcvti+PDDEljTKM4Vqejkyj4Hoo
         Hb6NyfPH2qZpars/HkvhVVLyy7jWl3xs9/AlAqCSz++0Mns0PcQu3zgja7Nm0SCZQC8a
         fV8AsI2eNJlARYSXvA3PBvbhQPgGHPNmH57uj6aRa9bH0IAWDU1UDwZcC0viQWDnjNSS
         V2zPly3Y0547fGA/mvCJJZF4SVcrnJxNIOLdj/hq+tpMfjMP/7iFefQdZmqsvOp9QOVB
         CHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BxpQ22uEFOzTdizhdSgRjmRNIbfRLMF5OEHx2hZci/k=;
        b=YjDPLQdElIN9FGZXXObFf+HmWveErpWEcxIaVlxV/nT+jCGYwCMgJnDco/F4Aoz8Q0
         tsG1OpxUWkK3ro4Lixxxc6+UT9uIxo4ZezFJCF2C5slzTowdKUw1dv7g9Wt/VmpVAByV
         SeaGOnWvoyO19NMpjNRyOrTSjITnkFkALWD1SVL3G6s3QVJBnEUzv1B1xEFm02oVJkdz
         661tuQRsO8D/sPiPCV9x6TliEN9JRlF5Efzq9aueYM3VU4NSdVDB2Qe8UZK/GJT00jox
         RhHZV6nfXSf12XcR6e7/Kj73UkDSmYHorqKbPzqR/NoPDHH6PQ6l26TnCj7qN0tYv/ZY
         BizQ==
X-Gm-Message-State: AOAM530yKXvU7G3FzVNKKHu3Rh77tXQeE/uV0VyegyEx8bH1oaSY50Cp
        ZTSNMaXUaV3NT+g+5+P0zRFwMg==
X-Google-Smtp-Source: ABdhPJzHg/hVTcKwPamsBz4BW9uO80Y+xd/rRNLEhovszQcYRYy5ZHd9rDyE7RBnHK6lvd5mJEnUnA==
X-Received: by 2002:a9d:2c22:: with SMTP id f31mr8989840otb.303.1634318547986;
        Fri, 15 Oct 2021 10:22:27 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s206sm1289635oia.33.2021.10.15.10.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 10:22:27 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     clew@codeaurora.org, Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH V1 6/6] rpmsg: glink: Send READ_NOTIFY command in FIFO full case
Date:   Fri, 15 Oct 2021 12:22:18 -0500
Message-Id: <163431847250.251657.3452295022194898173.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1596086296-28529-7-git-send-email-deesin@codeaurora.org>
References: <1596086296-28529-1-git-send-email-deesin@codeaurora.org> <1596086296-28529-7-git-send-email-deesin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 30 Jul 2020 10:48:16 +0530, Deepak Kumar Singh wrote:
> From: Arun Kumar Neelakantam <aneela@codeaurora.org>
> 
> The current design sleeps unconditionally in TX FIFO full case and
> wakeup only after sleep timer expires which adds random delays in
> clients TX path.
> 
> Avoid sleep and use READ_NOTIFY command so that writer can be woken up
> when remote notifies about read completion by sending IRQ.
> 
> [...]

Applied, thanks!

[6/6] rpmsg: glink: Send READ_NOTIFY command in FIFO full case
      commit: b16a37e1846c9573a847a56fa2f31ba833dae45a

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
