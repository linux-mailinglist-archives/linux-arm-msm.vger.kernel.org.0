Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D095F418784
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Sep 2021 10:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhIZIrd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Sep 2021 04:47:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbhIZIrd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Sep 2021 04:47:33 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 364B6C061575
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 01:45:57 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id s11so14670730pgr.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 01:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ixyywPIV+6DgQgfwZcIjPL8CPcYQ0h4CiC/Eg8U6OBY=;
        b=qvnS8pJrMesReK/0WbnpWCOzMI1DNOHZo9ogd00NHpLisWWmCpesAzSbUk86C3ue6V
         tzNboRcENaOoSHUPM6zlpxJAsVCAA4XNBa3RZeaxm+T7pJJ63NmqOfz4cw1FjUoXJnei
         YSCSo+X6KZKvjkZB7f/36sWqi9jTsP8bgMJ9uibuupjjn15gR8NE6GUpyONAC18HJO+2
         9yRWomftLulBu5Fa2ASGdd959WJpXwfyuJ7TpDcaKWOb6rigGFfnp0pWHM9rk4lagClO
         3bToe6KnfO+aKEjHzVY3Y4t6oYjLRRhRs/gt7y/P6ANkQqQEibrBd06krY6FCRwoSN9P
         83+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ixyywPIV+6DgQgfwZcIjPL8CPcYQ0h4CiC/Eg8U6OBY=;
        b=XKoWf9sxf5Wf0/LwO0/0w73ySIDTML/VpFZW2UAJXWO6VKI6h2k9IIOeyTEjDlUGwg
         XbdH09lWXSjh6MBwzMtNte/N4OTFEJ9Qcdr0J1CtpeZnS9atBmD4/MmRMPiVSOI9J1ir
         /UQ52JEW4ueELTYr18UxCi5fOtH4fLKkrmBwvkYxwZMqH4Y5WEK0Y9dJ8LdLcRuqUEJY
         vqml/9O8KdY1hQsOwIycS/o5HqZaC1JWu9OSXM6xSnf6XtNfFYZS7PXX7d7NgaG/Iswn
         Ex7I/0jjZIWOGy4U+3sEtnlToO90/1Lj2mO9iY+Z59l+sUWSzTsNjLLIq3dfIb7n6hmN
         XeJQ==
X-Gm-Message-State: AOAM530A7EgdG/ibAJHMqu9+HaEEaCSi/jEnvdDfHGOewZfi8UUb8nXB
        mhfQaZCDEJPXHJy+kvw6E5lH9MsW2Rcpgg==
X-Google-Smtp-Source: ABdhPJwqjEj0iNDPPyoZeOaSvKoByGRgIuZxkPWmOqsAc4GCZu9Cx+5Q42ztZcBaqN85LlbjiDBmlw==
X-Received: by 2002:a62:19d4:0:b0:43d:1bb7:13ae with SMTP id 203-20020a6219d4000000b0043d1bb713aemr17778982pfz.63.1632645956699;
        Sun, 26 Sep 2021 01:45:56 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id c7sm8940402pfc.104.2021.09.26.01.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 01:45:56 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/2] Add PM2250 qcom_smd regulators 
Date:   Sun, 26 Sep 2021 16:45:47 +0800
Message-Id: <20210926084549.29880-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The series adds Qualcomm PM2250 smd-rpm regulators support.

Shawn Guo (2):
  dt-bindings: regulator: Document PM2250 smd-rpm regulators
  regulator: qcom_smd: Add PM2250 regulators

 .../regulator/qcom,smd-rpm-regulator.yaml     |  4 ++
 drivers/regulator/qcom_smd-regulator.c        | 49 +++++++++++++++++++
 2 files changed, 53 insertions(+)

-- 
2.17.1

