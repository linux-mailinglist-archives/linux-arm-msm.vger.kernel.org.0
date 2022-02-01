Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 162DA4A5DE0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 15:04:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239025AbiBAOES (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 09:04:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239020AbiBAOER (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 09:04:17 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9FBDC06173B
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Feb 2022 06:04:16 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id 9so21362718iou.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Feb 2022 06:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AzLZKV9Ds06mRDyzKwbvSXYdln8SESWlfflardvbdLo=;
        b=r0Ib1qzf8MAoYX939A2mETg17xgzERVvSWeacR4lftRZTuaoZTgO2Y5hBM4suOab5L
         HREt+sclADHW4WP9AJmWT6To1BkAPgLmuGEqa37lujM65346jFh46umEiVBEzX//CvG3
         5OTFYMT4f+mJdYwlfYsXcD1Z5mGAQyZO5ldWKHB7BpxsFHuAWj/K4MTmQB3qZcFNN+tQ
         vpAeMF8Zf7A6y2KHVHcLxXkMJlqI83RXqb3fOHh0+suwjDCZkUznrA1jpHp9VPc8GKW3
         fR0y1jenRTAI8jfu+A3vqDKzUAhGmYW24DhXeJ4lU4iIn+ViM/4gbG7XcO4ZsmIyW/Ev
         oXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AzLZKV9Ds06mRDyzKwbvSXYdln8SESWlfflardvbdLo=;
        b=QD6THRIiioOIipW3nS/pZoZMmXnZIyJ5K0nH117Ze/Q/Pa2GwfDlYpgrKAhb1EJz0g
         TLMEG+OeYGiARNfEgkAnUYXMWjESQ3LxRpcM20+j8xFDZoU27RZ9r7+SRRF7GSopwDYD
         yvVN6JdRimlHA3V4EpqR2oXBBSl7qdxhUMnCc2A3SJjC0euLUCargaKzj3/DYN4ZKG1b
         lX5+rfq8KimnJt4jSCFMqC/w1lN6tieFZUo0MTvpj3MNKC6ojPjy5iPxLst52Ljz/muk
         F/W+blI8plp2Ld4FDZRdw1XxhIdk6qeQngT495hotckZ1hm5cFONQvZrhcEzHI6kqLQ8
         4oAg==
X-Gm-Message-State: AOAM533QapAbN0g7xSw2L5QR3h5+ZqfraHIIjKtQSMSrSsHcB0E/RDbj
        NJU1RLFdNk+qUKk5QqQ5S1p43Q==
X-Google-Smtp-Source: ABdhPJxJME5UGFSD89Qi+f+0oVbNYJBXd3IMSnnfV5LimCSknIFC89IGx0ia6974LGMc4mWws0lQ3w==
X-Received: by 2002:a5d:9d9f:: with SMTP id ay31mr13828580iob.140.1643724256231;
        Tue, 01 Feb 2022 06:04:16 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id o7sm189267ilo.17.2022.02.01.06.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 06:04:15 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     robh+dt@kernel.org, davem@davemloft.net, kuba@kernel.org
Cc:     bjorn.andersson@linaro.org, mka@chromium.org, evgreen@chromium.org,
        cpratapa@codeaurora.org, avuyyuru@codeaurora.org,
        jponduru@codeaurora.org, subashab@codeaurora.org, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net 0/2] net: ipa: enable register retention
Date:   Tue,  1 Feb 2022 08:04:10 -0600
Message-Id: <20220201140412.467233-1-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With runtime power management in place, we sometimes need to issue
a command to enable retention of IPA register values before power
collapse.  This requires a new Device Tree property, whose presence
will also be used to signal that the command is required.

					-Alex

Alex Elder (2):
  dt-bindings: net: qcom,ipa: add optional qcom,qmp property
  net: ipa: request IPA register values be retained

 .../devicetree/bindings/net/qcom,ipa.yaml     |  6 +++
 drivers/net/ipa/ipa_power.c                   | 52 +++++++++++++++++++
 drivers/net/ipa/ipa_power.h                   |  7 +++
 drivers/net/ipa/ipa_uc.c                      |  5 ++
 4 files changed, 70 insertions(+)

-- 
2.32.0

