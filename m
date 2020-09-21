Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3CAD2736E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 01:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728973AbgIUXwq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 19:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728565AbgIUXwq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 19:52:46 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD91C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 16:52:46 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id w16so18994870oia.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 16:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=myqkOnv6Utq5RSw8l54xg4GrYi2iSXWvV0sGIl2/+3U=;
        b=uKhOiogdhPNBB+yyjH5O8cDz4plTBywF6AtnQp6ffm7e8auw/lFYqFWHxjWkcaplTz
         DN8XAEt88ZwYLW4l/RT/qZrRM4e95PlLwLNOPjq31G6B6iBDseLFKRQPT1W1J+refIcB
         scQEHMHXcWlZ06AyPEwTOFuwjiCJ0/Hrl8R86T7AR+ZAOWsfZ6n6aLgpWHTz75UWAVhS
         0YwBhQP2uOsT340I9iKFSnd4nwcvKBfWOs75X3uOfLtSqF/3R5WWPjXToQCByI6GvENH
         QPUbmKFYkMmpDM+GWBr3Rg9HYM9semQIQvOoUPCbdj/FK9Ppr68XrQzi0yJG+6y481SP
         MZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=myqkOnv6Utq5RSw8l54xg4GrYi2iSXWvV0sGIl2/+3U=;
        b=c0Wn3nFbxakv36K2f/dKvLOUlvUuUderUz/GI1+P27OYK6Tmrl5iClJi5hOmzqsfSN
         bHGfGROCM8OJLax5oOfV1k2qv+qwOV4mqUgS2a25JvBe8LvYlaw7wJCnVUWXTknoTyx/
         aFXDedmj/vshBqQbPCAV890yKBBOLEzRdXvuQEoBUtFk5IFTAIvsqGc7U+Xo4JrYdCVy
         YJUUFkGs2sbc5wWV1xEJcCBwYIqZ9mKjHhfKgLmdW4v/Obh30Sy/sRI98VmkHPaXVqJv
         h+4c2oOdh9XK5qa4g2Zp66QS84CC/QG+ZCDrqqUI/kr+ahK7EhDTfEXGrOe+mcEHUP10
         rh1g==
X-Gm-Message-State: AOAM532SddHospoR6B6nI4kRn62ym/EoNvHDhrs7JgXUbztwVt2mbWxY
        ZUM6K3A1xWmPt5PsrNcS10A8Mg==
X-Google-Smtp-Source: ABdhPJz17QYnLhnyp7BQTzbVCuUn497fqAguP8gE1cbvwZEtHoTYnd5SX/AZieoE/O6U9drrPyDQiQ==
X-Received: by 2002:aca:1006:: with SMTP id 6mr1060998oiq.2.1600732365592;
        Mon, 21 Sep 2020 16:52:45 -0700 (PDT)
Received: from localhost.localdomain (99-135-181-32.lightspeed.austtx.sbcglobal.net. [99.135.181.32])
        by smtp.gmail.com with ESMTPSA id c124sm7257395oib.22.2020.09.21.16.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 16:52:44 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [GIT PULL] Qualcomm driver fixes for v5.9
Date:   Mon, 21 Sep 2020 18:52:41 -0500
Message-Id: <20200921235241.36463-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-5.9

for you to fetch changes up to 7a366707bb6a93baeb1a9ef46c4b9c875e0132d6:

  soc: qcom: pdr: Fixup array type of get_domain_list_resp message (2020-09-14 23:53:29 +0000)

----------------------------------------------------------------
Qualcomm driver fixes for v5.9

Fix the array type of the domain_list QMI response in PDR.

----------------------------------------------------------------
Sibi Sankar (1):
      soc: qcom: pdr: Fixup array type of get_domain_list_resp message

 drivers/soc/qcom/pdr_internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
