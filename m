Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0F963B4AFF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jun 2021 01:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhFYXnt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 19:43:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbhFYXnt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 19:43:49 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2563FC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 16:41:28 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id v5-20020a0568301bc5b029045c06b14f83so11086647ota.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 16:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GB43Qv83etCrKhaYAdgawkvJOs7wqZSQJ+UfnnZLdPo=;
        b=uTO1yVoVNcktt7bgfLq0f+fRrm7sjF5n+hXSrMw/aT70/s4AaNhnhKiPoLhm9SaY1I
         ANsEIMab0nXCdUSPO/gNrGGv6CMao1JENpcVUdvKCOsTn0oWl2qav9uwSmWL+4QMn9kE
         UWOoycv6aYo9rA6nqHLuY2WeEAKRJKS4XBm+kbGfEHT/sRJgnqEXbm6WT9+fQy3xQkf4
         LymvMjcFMyObIs3EOOv0ZhjEcZuDO0BSXBJrmK5MNkk/VKBOIapnn/Cd4Nw3IX1VAsF+
         Lax473IhB97hZtclnCtNYW5cPHQtedJo5oV48vF8TR+oOU2hI92zB7YtZVKZmsBgoxd7
         +chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GB43Qv83etCrKhaYAdgawkvJOs7wqZSQJ+UfnnZLdPo=;
        b=Gzzd4XPEdMJO0ObkDdg9CewQb0Z3lQ9t+dnHfnjwE/GrSwrGzPMzczs4zaMTmYu/OW
         g7P45RYJ1aVQaAFkAZivd4zoi1O5+nyH3gbwntalIDojgdc7EMiU05C0tUzTgsM6g0gw
         3vAyNo+v66/QG6mysuMPuwhI1hk90qZV25xTzlVlVXi/SPZyk1YEyRb5TecXEwKGhzMx
         nqPANPoOvH3vXobh5Ot75d/xDulAg0uvq2yP+FW/hK4RzTbeXJUj30tMBEg2yaf8h8tS
         Re+FnWvjXhVSaH/YuuPdqxNRWzQyRqVIzErU0ELJHeRiosROi3gQ4iWsqJZxf5M6uop2
         7V+A==
X-Gm-Message-State: AOAM531ZEgr6OnY4i3AM9A0/yzCKXxdgkVh31nm5yKdS+10RIn3INjV9
        JH2W31jjZ0KfyOxcEa8ETB5d/w==
X-Google-Smtp-Source: ABdhPJxPKnfqmBkQi88yaGWabFD8gHr8dDzEuEX8c+aWyEZg2lACabJ27XMX5YJZJChV8zgKjkbH0A==
X-Received: by 2002:a9d:6642:: with SMTP id q2mr12012175otm.256.1624664487436;
        Fri, 25 Jun 2021 16:41:27 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u10sm1844267otj.75.2021.06.25.16.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 16:41:27 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Sibi S <sibis@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] dt-bindings: soc: qcom: aoss: Support sc8180x and convert to YAML
Date:   Fri, 25 Jun 2021 16:40:15 -0700
Message-Id: <20210625234018.1324681-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce generic and sc8180x specific compatible for the aoss QMP binding and
add the generic to the implementation. Then convert the binding to YAML.

Bjorn Andersson (3):
  dt-bindings: soc: qcom: aoss: Add SC8180X compatible
  dt-bindings: soc: qcom: aoss: Convert to YAML
  soc: qcom: aoss: Add generic compatible

 .../bindings/soc/qcom/qcom,aoss-qmp.txt       |  87 -------------
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      | 115 ++++++++++++++++++
 drivers/soc/qcom/qcom_aoss.c                  |   1 +
 3 files changed, 116 insertions(+), 87 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml

-- 
2.29.2

