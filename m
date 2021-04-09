Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FBB535A7F9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 22:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234376AbhDIUkm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 16:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231946AbhDIUkl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 16:40:41 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC68C061762
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Apr 2021 13:40:28 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id v123so391567ioe.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Apr 2021 13:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kyEt1ksQ+JQPinifGRtvPHx9UK2YlW1JCIGqjukG2tI=;
        b=sHcIVLC1w2ibtu6NZ4brRofUXy78o2puktCiOlwg1UnwtL+5Tm1Rs7FG437vw3GC7I
         EUW/0JhXaoJ0TRTKWtR755vpYm0R4X2pOY3m0BRusCprKfIT/11h2wV7dft86cobpKWx
         V49I6nK189ua/IfhV4svmkVq7OvVAoDF0jWXY5focgnugz4Al8e3tCDwxwGF0NPt8zND
         p6WVsIFUWN2uu+HlSeM8xPuQXCnu64d8yxoMx4JRDs+CzrBSGF3TqAB1cLonPUtNCBfN
         Z7Fsg5AHMaS7V0bZyer7Dh1jwrlHX0jRtUuK1Fv+0Xww2uEv6+lqqLOBKHOBAzjdl3SA
         AJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kyEt1ksQ+JQPinifGRtvPHx9UK2YlW1JCIGqjukG2tI=;
        b=hF8nYkT6PamBLkj9Jocfh8yZ+RHHfpdgURHxFupoKG480lf+TcJtQWjtJubEZwKqij
         Xh84v/6ObMA+2EnMZ2uaao04zhb8+Sl+AWjQepsOTMl4kptzEyq5mT19A1xz0hMMigXi
         qUrHje6AG6KwCQmZVK21W1BnWZqsiaHV8AU/fbR65lnoN1UcUxfRn+DwiMu7GAVYoga2
         mA53UoDKqdFzFL6Kjqvy3vA/6Jv9NdxnQ/6pkY0d3DOBGf+81BYdAsedA3CcovJu79v4
         IQbroA8vorpGKZ3i6BYwoJRTrwJEPXnGqklpPrdoGhx6zIuPa2Ckt2L5PLkiEpxN56Ux
         OajA==
X-Gm-Message-State: AOAM533IiYl+NBHS/22aL8UHC/7YN6TI7FtGRY9K8yV18JuFiWho7K1t
        VTM34nuCba7pHFXc/Uaz7MwbIQ==
X-Google-Smtp-Source: ABdhPJxJv6/aw1y/Gn66AfvT3KOZbNbU1Cs4ktQd8VlYobTFNdQkkc1IUELXGGpZDNKaAS3rUtTwlw==
X-Received: by 2002:a6b:500c:: with SMTP id e12mr12277326iob.190.1618000827805;
        Fri, 09 Apr 2021 13:40:27 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id b9sm1667212ilc.28.2021.04.09.13.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 13:40:27 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        elder@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/4] net: ipa: support two more platforms
Date:   Fri,  9 Apr 2021 15:40:20 -0500
Message-Id: <20210409204024.1255938-1-elder@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds IPA support for two more Qualcomm SoCs.

The first patch updates the DT binding to add compatible strings.

The second temporarily disables checksum offload support for IPA
version 4.5 and above.  Changes are required to the RMNet driver
to support the "inline" checksum offload used for IPA v4.5+, and
once those are present this capability will be enabled for IPA.

The third and fourth patches add configuration data for IPA versions
4.5 (used for the SDX55 SoC) and 4.11 (used for the SD7280 SoC).

					-Alex

Alex Elder (4):
  dt-bindings: net: qcom,ipa: add some compatible strings
  net: ipa: disable checksum offload for IPA v4.5+
  net: ipa: add IPA v4.5 configuration data
  net: ipa: add IPA v4.11 configuration data

 .../devicetree/bindings/net/qcom,ipa.yaml     |   6 +-
 drivers/net/ipa/Makefile                      |   3 +-
 drivers/net/ipa/ipa_data-v4.11.c              | 382 +++++++++++++++
 drivers/net/ipa/ipa_data-v4.5.c               | 437 ++++++++++++++++++
 drivers/net/ipa/ipa_data.h                    |   2 +
 drivers/net/ipa/ipa_endpoint.c                |  16 +
 drivers/net/ipa/ipa_main.c                    |   8 +
 drivers/net/ipa/ipa_mem.h                     |   6 +-
 8 files changed, 855 insertions(+), 5 deletions(-)
 create mode 100644 drivers/net/ipa/ipa_data-v4.11.c
 create mode 100644 drivers/net/ipa/ipa_data-v4.5.c

-- 
2.27.0

