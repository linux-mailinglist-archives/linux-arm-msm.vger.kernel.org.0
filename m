Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 198CBC01D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2019 11:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbfI0JJy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Sep 2019 05:09:54 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43529 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfI0JJy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Sep 2019 05:09:54 -0400
Received: by mail-wr1-f67.google.com with SMTP id q17so1810127wrx.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Sep 2019 02:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DcoXTe9dNwBaF2/Bo9GV5mnsjAEgDdrMOllPSgWYRss=;
        b=Bgw2AFNPLRUm3YYSBZP2ZE7l81crt9WSD0IVV7pteiJl8qQnHYcuIHKFcs2sG4Kyjf
         UsRfIklG0dcvegKHMCPxhAe5BCzrptgv1EQsT7xXORTFINXboWI1aVa/l7epo6PnhRby
         MVVrwmGUs/0dJuOnO/poU5UDpURk1XgsfUYjPrKaYYq4qe3IyFD9NV1SheLk4RtZt33n
         pZ8y5R5AlV2lPbEW4p/DY4NIckdUAMBFwTp/6T3dxenPhmNzOreWfESTbvYGia0IdkS4
         dIYEQpGjv3xofDS9xfhvT/3uNjk6kwqEApZPnzcljeSaB/XsJbvpllsX+AL8Zz5lWrFw
         2f6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DcoXTe9dNwBaF2/Bo9GV5mnsjAEgDdrMOllPSgWYRss=;
        b=CemDyUnNFzz0AlUk9hlIb6uRf/nbwqamIDsJApY/mt6pnBdpp1LQL51RDde1G3MA8I
         DNlYzejz9GMI78GdOof1hIrslpuDtCwkP24Uq0nAvx5fNSj15MlbUeuZvhocrBfXG8Jc
         0EE/Brmc7x+Czil0ZlrKZdrVdWYvcyBGcj+NENPaH6U5KBjzqwNSBgGnXY20NEXqcu3K
         /r4TNgKbR1aIrRg2V5ylUG4DdsgFtOOGAvRBnoMp52xs64BD/C6dpn8fWmEoKJzCSD5/
         nnn0oFGw1yLbzK76er+laY5KHVU9GOrvt9gBv6y9c0TG68hZ7jnfms9lrmD4qcRPRAuC
         V1Uw==
X-Gm-Message-State: APjAAAVXwyHmw9Bio2R3cGMcDoA5r0gtYpFdijnB/BmmVBtaMyZ3FlnC
        +sC4ehm00qKHuzn9Eg9giUHdCPNUdsY=
X-Google-Smtp-Source: APXvYqwcEycl8WD3DT7TUMtQq5bvTI3kyR4zV8aM3v5EcQrLSSNezEcb/DMx1zRGDckKZuoBeE7pfw==
X-Received: by 2002:adf:ec86:: with SMTP id z6mr2140801wrn.231.1569575391806;
        Fri, 27 Sep 2019 02:09:51 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id b62sm6037791wmc.13.2019.09.27.02.09.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 02:09:51 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     iommu@lists.linux-foundation.org, marijns95@gmail.com,
        agross@kernel.org, robdclark@gmail.com, joro@8bytes.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH v2 0/6] Add support for QCOM IOMMU v2 and 500
Date:   Fri, 27 Sep 2019 11:09:41 +0200
Message-Id: <20190927090947.11175-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Some Qualcomm Family-B SoCs have got a different version of the QCOM
IOMMU, specifically v2 and 500, which perfectly adhere to the current
qcom_iommu driver, but need some variations due to slightly different
hypervisor behavior.

The personal aim is to upstream MSM8956 as much as possible.

This code has been tested on two Sony phones featuring the Qualcomm
MSM8956 SoC.

Changes in v2:
- Fixed optional properties placement in documentation

AngeloGioacchino Del Regno (6):
  iommu/qcom: Use the asid read from device-tree if specified
  iommu/qcom: Write TCR before TTBRs to fix ASID access behavior
  iommu/qcom: Properly reset the IOMMU context
  iommu/qcom: Add support for AArch64 IOMMU pagetables
  iommu/qcom: Index contexts by asid number to allow asid 0
  iommu/qcom: Add support for QCIOMMUv2 and QCIOMMU-500 secured contexts

 .../devicetree/bindings/iommu/qcom,iommu.txt  |   5 +
 drivers/iommu/qcom_iommu.c                    | 133 ++++++++++++++----
 2 files changed, 111 insertions(+), 27 deletions(-)

-- 
2.21.0

