Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA4B71C8B68
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 14:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgEGMxZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 08:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725923AbgEGMxW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 08:53:22 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9EF1C05BD43
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2020 05:53:22 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t40so2578325pjb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2020 05:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=j58IuaF2tOM1RurkMuTpHXCNmLk7/z8BIzusf87nmw4=;
        b=WYriJ/WWVBwoNsFK5/ANzj6Ty0H+3E3lGWT8zVA9rluurZstZS56Zs58ETZiotxhVA
         yOIBJIbL6WOXuibdiwn0uQoRV3J5st8K3cqT4mz47gWoruylRY6dKdoecfOLk0nhukF/
         Exv63QxZcRR6xd1jQz7CJxp4igEnG0MfQZ25E+KzZEleDAd38frGImj1UTFNfgcT8fBI
         hte6Ksw6ncnoKM+YPwepcT2OzKgVXXUuBKAs5hlnRn72y2Jj9j6LR7X7zMFl86+nso3h
         PL4HMpulQK/vmI+um2cCVD/ttQqY0RysgeB0dOXqKuRJoko6N2MRzzwfbJOMp7OZb30v
         I/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=j58IuaF2tOM1RurkMuTpHXCNmLk7/z8BIzusf87nmw4=;
        b=M7snMTajSZ38nt46FIKKOzdfIhnyyajqOvx3WSi0mifIAzWn6LXwYF37qDsgtTtpKy
         WqzGXfEGdjoTAOsKZaAk+GgRRJErFdlw0kpqg2qWUxjj0pjDPv1Kw5NFP599YGwNKFir
         y7Ncc322MVSSLKA4x3UhtgTVdM5sfQBMGbIT4hW12+vau10VJPyox0HCa7MJJg08WgDt
         Ww1KZ/8qKlOOai19KBJXZmR33CskmePqnxGR5Yqqp9TlOOJaYMJhMyZ9GMppaKSFdsxe
         olZVAtR+1zfcz9W3rkCMxRxJLhqBwJOsTH1wifL8BUg0JZwqHwdmQbeF61l82x+QB3vk
         Wfqg==
X-Gm-Message-State: AGi0PuaG4nMMtOmVIOq+FBSmQxDIHsMPnvk1sThNbC5AiwrRzfzQL/cm
        GAD9dc8ggFQGjxBqUnCyJO9H
X-Google-Smtp-Source: APiQypJArY4q500dTsUg0P6yfcpn1Ija5V/q7fY81/0xeevRZVxUK1tNC640Mq6PqRWDx9w/R8BMiw==
X-Received: by 2002:a17:902:7208:: with SMTP id ba8mr2699331plb.246.1588856002132;
        Thu, 07 May 2020 05:53:22 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6093:7a3f:4ddc:efce:d298:c431])
        by smtp.gmail.com with ESMTPSA id q21sm4926190pfg.131.2020.05.07.05.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 05:53:21 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     davem@davemloft.net
Cc:     kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, clew@codeaurora.org,
        gregkh@linuxfoundation.org, netdev@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/2] Add QRTR MHI client driver
Date:   Thu,  7 May 2020 18:23:04 +0530
Message-Id: <20200507125306.32157-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

Here is the series adding MHI client driver support to Qualcomm IPC router
protocol. MHI is a newly added bus to kernel which is used to communicate to
external modems over a physical interface like PCI-E. This driver is used to
transfer the QMI messages between the host processor and external modems over
the "IPCR" channel.

For QRTR, this driver is just another driver acting as a transport layer like
SMD.

Currently this driver is needed to control the QCA6390 WLAN device from ath11k.
The ath11k MHI controller driver will take care of booting up QCA6390 and
bringing it to operating state. Later, this driver will be used to transfer QMI
messages over the MHI-IPCR channel.

The second patch of this series removes the ARCH_QCOM dependency for QRTR. This
is needed because the QRTR driver will be used with x86 machines as well to talk
to devices like QCA6390.

Thanks,
Mani

Changes in v2:

* Added cover letter
* Removed casting of void pointer.

Manivannan Sadhasivam (2):
  net: qrtr: Add MHI transport layer
  net: qrtr: Do not depend on ARCH_QCOM

 net/qrtr/Kconfig  |   8 ++-
 net/qrtr/Makefile |   2 +
 net/qrtr/mhi.c    | 127 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 136 insertions(+), 1 deletion(-)
 create mode 100644 net/qrtr/mhi.c

-- 
2.17.1

