Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 335863950CC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 May 2021 14:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbhE3MUF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 May 2021 08:20:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbhE3MUF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 May 2021 08:20:05 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17723C06174A
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 May 2021 05:18:27 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id b9so12244599ejc.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 May 2021 05:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mv3/cnpvRbvAJeQa0MiDYgvPXPyU1vXJHZuXEP0Ro0w=;
        b=JaMPOd834QxR4iKc0tl0eWi5UHBMQnfNjZbZUgz44NY8tS19AMLWdVmV7rq8bu7tfQ
         Cj9dj7wxpM809QZu9g0MXEp5IjLzjF1r/f4F2wesWTZSTRHxRnQkCkhHLoFD9eQhSGtQ
         77R3W7qxeboWxSsm4u7NQ7dAiF9JdDwewyRj9vIh9ltaQY4x66AFBp3TndwD1gxgXUot
         4FghfTDjwtyzvb0OxrKRCfEfVbNguJdrfh4pKFM+3KsFtf6psxwjNiFep9wX0I7ZGr0w
         wOF73e7Klsja9nl4bmzEz+P4i9eJD9BClNc5WyQvRCgbvqrVacU9p3HDtC9Gj3pA5j11
         tIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mv3/cnpvRbvAJeQa0MiDYgvPXPyU1vXJHZuXEP0Ro0w=;
        b=aezb6tTtfpZ7yA69V4sN9gYiIltb7kofyusOfhDcHyXMNeqwLRI9kraiIqFmHX8kve
         0TYT7wAPogn6yyGBb656XXI8bOpHTsBhw+544ep2ZpbKXl291bE1lLjs0mg2eObhsAtW
         8nZxh5mh9i8NBWIkkfdhw2faCCQ7AzQRGXolmHkcFcYzkHsTXZ6om3+SKP/7TFZGXqPo
         28D3HvLjI1Pqb/Dwa0fJhX0IOZzR4mVDHZXmPx58kqaEX3IGL3nGePE/g6ga444JgO3Z
         pZSpv9z6Deg5TG8hgzYPHxsMsr4XN7NNtWQO7r5kCm4T+a1QPyA6mcZCkoGDSZFu2lYn
         vzQQ==
X-Gm-Message-State: AOAM530OL+1r1gDOYVGpoJrcvbLYvbI2WYi6UrYbZPZF9KdvT0Oyb86/
        fsvv+MYuQYCOsqVOuMAzyJUJuw==
X-Google-Smtp-Source: ABdhPJz416m8G3fV//XCsXRrFOhMmN+g5Liv24lpgTj1FsuObyjaSCft01L96AaJn244cOKQjeYI3w==
X-Received: by 2002:a17:907:7b99:: with SMTP id ne25mr1667129ejc.467.1622377105149;
        Sun, 30 May 2021 05:18:25 -0700 (PDT)
Received: from PackardBell (192038129069.mbb.telenor.dk. [192.38.129.69])
        by smtp.googlemail.com with ESMTPSA id jx16sm1311662ejc.49.2021.05.30.05.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 05:18:24 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 29338a11;
        Sun, 30 May 2021 12:18:22 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
        Bartosz Dudziak <bartosz.dudziak@snejp.pl>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/2] cpuidle: qcom: Add SPM register data for MSM8226
Date:   Sun, 30 May 2021 14:18:01 +0200
Message-Id: <20210530121803.13102-1-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SPM register data sequence for MSM8226 SoC and enable SAW2 power
controller for it.

Changes in v2:
 - Removed APQ8026 SoC support

Bartosz Dudziak (2):
  dt-bindings: arm: msm: Add SAW2 for MSM8226
  cpuidle: qcom: Add SPM register data for MSM8226

 .../devicetree/bindings/arm/msm/qcom,saw2.txt      |  1 +
 drivers/cpuidle/cpuidle-qcom-spm.c                 | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

-- 
2.25.1

