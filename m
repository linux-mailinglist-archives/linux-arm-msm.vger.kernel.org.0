Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF5A3A509A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jun 2021 22:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbhFLUzw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Jun 2021 16:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhFLUzv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Jun 2021 16:55:51 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1DC6C061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jun 2021 13:53:51 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id g20so9902746ejt.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jun 2021 13:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mv3/cnpvRbvAJeQa0MiDYgvPXPyU1vXJHZuXEP0Ro0w=;
        b=lvhykrj8XeuOw/I8vR+vifVvDfEgyqY+T8z2eWHUIW7GB1uICnrTfzs254s+9tJt5T
         AuTRAtD0bIrOfu0iB8qKE4uaJSnGoofS0Xs73e5cLSowFBneNRguEQVD9LbNVHVbKMQK
         vu1FmvLDRMUyU9QQkd9uXvLY+vzJYDn+YGHWbDw2oC8biBOZombrwgCGI3gTYxlK8f+F
         I9G/Elf8cyzbGeYmNqwKTLhrpl0S+9rOwW+8iSGaSNtWWxE+7cJQcYUpVU/YlFQhgUs1
         Z4mog+Svmswr1mLcw/uKqPosS+GcBRrVhiG1J6c7jlceSi2jxYQTDwTqOUh7J8ypRmGh
         4VGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mv3/cnpvRbvAJeQa0MiDYgvPXPyU1vXJHZuXEP0Ro0w=;
        b=n2zutU3XXwrrAdOJd0Dg1hH6lGBUdkw+je2KbvXD0LT1kT6PoPeeS4owyP0SXpqoEQ
         rVjFBYJv/OX8qxuLyitqlSIaA5gSYaGiiKHkOfVENmDKYqmUEOJtbsCOKdOEkDurzx4Z
         p9mkvXxgC3JFT5xlwo0zT8yGChBGJQfcve/gD02SAdtjJuB1s3CIcOwEVkVWXS466/c1
         KEahD7nytaneNnaVBfVCBhbRd7rYkQaZH2XHJq0qexu9tZ8Qzb4J6j/8fEJv5TD50zUP
         DY0BmdCp/Bfs1S8hqy4Bj23b3viihzmsoxRMuIe4m0ZKa5cOHUBsuUlUnfaLp+cO//go
         iJpg==
X-Gm-Message-State: AOAM532sjwr+aq/aNKvT0tsdx6R6ADdKk8uikicUvPF5hoRJhd7UBDOZ
        6N7xyF7XURPMDXcTKY2stFjY+yopPQQgPK5N
X-Google-Smtp-Source: ABdhPJxkYIoeEEqaY6OBy2UBJJuSKZHPbSXjyqfT6ueqR3X1U5RO+zM4UexRST61zS/G23rG6QyT1Q==
X-Received: by 2002:a17:907:33d0:: with SMTP id zk16mr8945400ejb.144.1623531230324;
        Sat, 12 Jun 2021 13:53:50 -0700 (PDT)
Received: from PackardBell (192038129059.mbb.telenor.dk. [192.38.129.59])
        by smtp.googlemail.com with ESMTPSA id a2sm3574362ejp.1.2021.06.12.13.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 13:53:49 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 061171b6;
        Sat, 12 Jun 2021 20:53:45 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [RESEND PATCH v2 0/2] cpuidle: qcom: Add SPM register data for MSM8226
Date:   Sat, 12 Jun 2021 22:53:33 +0200
Message-Id: <20210612205335.9730-1-bartosz.dudziak@snejp.pl>
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

