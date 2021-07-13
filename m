Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E88933C76BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jul 2021 20:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbhGMTAf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jul 2021 15:00:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbhGMTAe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jul 2021 15:00:34 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A674C0613DD;
        Tue, 13 Jul 2021 11:57:44 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id a13so31808836wrf.10;
        Tue, 13 Jul 2021 11:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GyCxMQJ19Di1oBf2ALdveQxsYxjJQOcuG1xW4hJwHM4=;
        b=QUFGvy/RKSLqJMDlLFCylhawwiEByP38ZJNrsETx0LoeuhFPtM7B3hBUFLU98yZMKV
         r7/EJA6hX1QD+v4IDvybiaWOdp2YLTFQdQd/z8pufmIFmJFaAgUmoUt6At0xr26LsHad
         vqVWCiVh9Ua0NNIorOPJTnPLQmnLoW7LoVm1ukiDNqDInMcB4x7vZgABqnuTZ65Bt2EX
         2UoODpbIkbeEV/rxo/VO6m1mc4eqlJHKwumSjtN9/nwK8ZV7i/r1xkKBmdLxO3JU7QGx
         F71SUOlDd67a/1Mqgmf5efR7JxR8xP+m267zow4fSTsQVaXgTfzdQW6zJ/8L09PdVZjw
         7xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GyCxMQJ19Di1oBf2ALdveQxsYxjJQOcuG1xW4hJwHM4=;
        b=jWN6VVGoPfvDr9qV5Adtfb6bRY8VXjbt7rgPDnCRJv5nqPjHCdzYNIjRDVyJ/jifqJ
         HZZ3zhU8fVqb2T2hPlzzAyPWuW7VL/xBE58Gh7AHib2WvoP+Reb14CP2UwnmeqfAvk+D
         WCI0jN2EjtEt1tw0BDdnUDdPUTMsgbEUjkvu4OGak8FS5nYubYncbZwoe4E4++Sp2nIL
         z+8+o6AWOGmWB3TTm8QYunTNxrMVBgn5/cmBAYOn5QitVk+YuU4ZPWKl0CzJGJKw66CW
         ZXyUIlx3PnpzwwRb+IpblMDZ4Ac7+WvKOwke7uUSgPYQrqA0ljPNjOXCEq3nqr05/p7R
         pJqw==
X-Gm-Message-State: AOAM530jTYOraW7Y49Ln26V+v9Ufpca/oOfMZ0Inha+rTuVrMcnIzDC6
        DSGhrPMn6BsRoG6aIdY3yC/jRc6UZVzjWg==
X-Google-Smtp-Source: ABdhPJzQFDgjeClK9bJyUnnfu0+kMUuZgTBzQ7KraHM0mcu+OVKwj6tAv6JYnIn96x5EtC4csogm+A==
X-Received: by 2002:a5d:6501:: with SMTP id x1mr7503716wru.169.1626202663119;
        Tue, 13 Jul 2021 11:57:43 -0700 (PDT)
Received: from dell5510.suse.de (gw.ms-free.net. [95.85.240.250])
        by smtp.gmail.com with ESMTPSA id l24sm3077971wmi.30.2021.07.13.11.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 11:57:42 -0700 (PDT)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 0/2] Nexus 5X (lg-bullhead) boot fixes
Date:   Tue, 13 Jul 2021 20:57:32 +0200
Message-Id: <20210713185734.380-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Petr Vorel (2):
  arm64: dts: qcom: msm8992-bullhead: Remove PSCI
  arm64: dts: qcom: msm8992-bullhead: Fix cont_splash_mem mapping

 .../arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.32.0

