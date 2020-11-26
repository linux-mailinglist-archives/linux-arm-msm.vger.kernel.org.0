Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B73EE2C50CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 09:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389068AbgKZI5U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 03:57:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728127AbgKZI5U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 03:57:20 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F28BC0613D4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 00:57:20 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id w16so1155200pga.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 00:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zBk45UGqX1rgO6p2p4L/BSx2nT0KQMbdrzG7UvM86KA=;
        b=C78jLXgXMiFH/Usf47+DKSw77CHHlU5mb0TYh4eeLxXYjZ7PQLZ2GDBG6QbkB9r+ii
         jK6ujtuLKvjfO09SYGwXMPQRdJb12mV4Q/0Bk7J3B3PcqCi+tqZRlAxlpVVX5lhmIKED
         airzgxVy1WbjSPo0A4BvFYEBhfxQdOUYB0Y3lPR2gPO7F/KptbuhfpqVmGxIjKpfRyv0
         uUG/EDM/skPK2m6/vo0wDA61e/Na15qpZ3B8sdGd9a2RL/6AAYPlETdOMdJGJxrtgY6r
         ZASANM0b2hPQcdcRxamuq8zyxLtNgMb0aA2OZ+3ctfQKz6RBpEYo8ZBu+M8i9DAeX0Uh
         LKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zBk45UGqX1rgO6p2p4L/BSx2nT0KQMbdrzG7UvM86KA=;
        b=iHxXMloyhls+81yyjWy4/Z+4MGjxJQV6LwS8k2lRlmu1hJK7cEGdeJ5IFUc6F5k2vY
         GKmTT2QPQa2iRo7Vp71IddgzbyfBW9s4MJc0k0EEHo2GPmao2cSVYkJESyhSUu5aXBNr
         HWk7w+JEibIBDEiRBwwSaFKL1eXiRAEc+F2rfqVwgXIXZb/KSix0NRpFqqHtLtt9tanW
         L6RIERgB4w/PcW8YMFVoBh+hdEvW9Fex1wfifhlQurpOcok7wUfXNdHvfqJkGNQ4wdJt
         jeWrXbM95P2PqKdgEnYTe0IK45uk7WmaxlQAgUfjLfbuJeGtNxYBhy3IfA9JSVWexps8
         0zCQ==
X-Gm-Message-State: AOAM532G50CTSxAD/Aw9ZkJ1aX7JmxeKjsAoMG1f2DZgWVJUj+T7TL97
        fTopoacW0dJ/XdmcQ12XwA33
X-Google-Smtp-Source: ABdhPJwvhW69S9YlC1fdzsXhRhsXEGklez9ytKJZknlv8opt1HGJ5w3ORfEDBpYEWhORW2jBe1HXrA==
X-Received: by 2002:a17:90a:d503:: with SMTP id t3mr2585033pju.10.1606381039668;
        Thu, 26 Nov 2020 00:57:19 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6e95:f2a:3996:9d7f:e389:7f7d])
        by smtp.gmail.com with ESMTPSA id e29sm4025603pgl.58.2020.11.26.00.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 00:57:18 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sivaprak@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/2] Add NAND support for SDX55
Date:   Thu, 26 Nov 2020 14:27:03 +0530
Message-Id: <20201126085705.48399-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

This series adds NAND controller support for SDX55 platform. SDX55 uses
QPIC IP v2 which slightly differs from the former ones. The difference
in the driver is handled by using 'qpic_v2' flag.

The major difference in QPIC IP v2 is the DEV_CMD* registers which got
moved to operational state, and access to them seems restricted. So in the
driver, access to DEV_CMD* registers is excluded. For reading the ONFI
parameters, a separate field 'OP_PAGE_READ_ONFI_READ' in 'NAND_FLASH_CMD'
register is used.

This series has been tested on SDX55 MTP along with the SMEM partition
parser [1].

Thanks,
Mani

[1] https://lore.kernel.org/patchwork/cover/1340600/

Manivannan Sadhasivam (2):
  dt-bindings: qcom_nandc: Add SDX55 QPIC NAND documentation
  mtd: rawnand: qcom: Add NAND controller support for SDX55

 .../devicetree/bindings/mtd/qcom_nandc.txt    |  2 +
 drivers/mtd/nand/raw/qcom_nandc.c             | 68 ++++++++++++++-----
 2 files changed, 53 insertions(+), 17 deletions(-)

-- 
2.25.1

