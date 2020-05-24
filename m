Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7791DFC63
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2020 04:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388255AbgEXCOC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 May 2020 22:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388227AbgEXCOB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 May 2020 22:14:01 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A566FC05BD43
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2020 19:14:01 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id f83so14623658qke.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2020 19:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dAvMUr5VDe0uNAxODcg8+zSeRgKSv9N5mSpKXFgOC4A=;
        b=yql8zbdxjGHPj6B6azXNxw4GasqS2Kh88s2Xd6xjxQP6dMCQi/Sq+TAJHcc8VHnQ4k
         xl6RChxRJPPv1vV5jy3sRn0U3atL1812e8JL66PApjPX13VDqGb0EGtR/+Cv+v+FDaCL
         pf+vqieVO/m1MRVlYn1r9G0dzbSo49csViUHBiKECZTRLmY6VjRXSsEjcp4y87PD8YkO
         5/ftqlnodB5IJIKOWLqyPHLKfVFBhcPNXPKGlN1iiG71AK7h8SEuTnQub8iek9siMrEZ
         vAX77e8uGh4M3s8bSiOyrz1ecFpk8GgjbOwdWhymKaqlGaJpZnhMgYhsxhk57AwbDfJG
         rfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dAvMUr5VDe0uNAxODcg8+zSeRgKSv9N5mSpKXFgOC4A=;
        b=Bv3ccibFl2c5XfwR4gX5/IHYPXkclK8iVuvTg7trSduuDCwspOL/8Pe0faGc6zQmsK
         ih9aY3cwaCeZaZe+VMu29sFs+SikzZLxdKaWP9MZBu0b0D6/EM6UmmCQfoerxS8vVS0b
         J+O9AEsfN/nF+vl8QGCFUpa3FxMuDSO2XV7G/HZTDOkX6nrrTYH+lJx5pMI9icld1Jam
         4Sj6GWFMyuh0b3+RHop9Ki8TE4/JFmjL2x0BrBplYBQ4aiCuM4gbom57IxYOPLQ5cg0R
         FTEZpgj0QbiqfU1I66HiBlBH+EFQ9QSXXQXEzHXJzM+Q3Stjlm0b7TcKw5dGv9T/2l8h
         amdw==
X-Gm-Message-State: AOAM530YxEFqmdKlY57Uwr9BLf5ghTkZ+JwHlg0mUoFCua9A07hqnXNr
        lhwBe0igdCCRMFGqkB51mJLTjRurybM=
X-Google-Smtp-Source: ABdhPJzItXRfhNbsVaGbhWFsucdV/K81Di3YGSNeb2CVAdiYAqttvwZdkx5l6oHApiM9AXYrtCgVug==
X-Received: by 2002:a37:68ca:: with SMTP id d193mr19318692qkc.148.1590286440708;
        Sat, 23 May 2020 19:14:00 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id t189sm1625501qkc.87.2020.05.23.19.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 19:14:00 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-kernel@vger.kernel.org (open list:GENERIC PHY FRAMEWORK),
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 0/3] phy: qcom-qmp: add V4 USB PHYs
Date:   Sat, 23 May 2020 22:14:12 -0400
Message-Id: <20200524021416.17049-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for sm8150 secondary USB PHY and both sm8250 USB PHYs.

Jonathan Marek (3):
  phy: qcom-qmp: Allow different values for second lane
  phy: qcom-qmp: Add QMP V4 USB3 UNIPHY
  phy: qcom-qmp: Add QMP V4 USB3 PHY support for sm8250

 drivers/phy/qualcomm/phy-qcom-qmp.c | 408 +++++++++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp.h |   7 +
 2 files changed, 403 insertions(+), 12 deletions(-)

-- 
2.26.1

