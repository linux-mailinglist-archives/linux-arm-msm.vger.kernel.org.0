Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2A663AF151
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 19:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhFURHW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 13:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbhFURHR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 13:07:17 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03634C0580FC
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 09:50:17 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id g19-20020a9d12930000b0290457fde18ad0so4494058otg.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 09:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9JCax5gzpRXFjKOT7fUvz8rzc/IG8uAiWNtIkm2nNbY=;
        b=Rn08BY9/tYgwbs9DDd8jLwNfj2gQyf4LDzySwhwTWXAbeKIP+wo18+4NObUz/okt6s
         NV/KlHs6rGvDguY4LJjdbXfskE6WEsFQR/XsX7r/KhOvz2pk+oS5FRnCpnICGmj3G1hV
         x2FY8fqhOJ/4m7S2os8EJw67MD9yvxveBcXngBNjSHzNU6g/Z6dRp1rEQoc0jLutvXeH
         g9R7sIlIbcH3flzX0bsGtHA33dwnUEeR6cwP/3lkVgH/AjvyH3NpJ+ljH0ajwLDz/KPp
         7f/qunNM0hserXrYdNjXrwxF0RyNN1EXCS4dk+iOOHnxvbk3JyVln2ceeR3njHfZRR1Y
         hxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9JCax5gzpRXFjKOT7fUvz8rzc/IG8uAiWNtIkm2nNbY=;
        b=fgDI4X8pstdjEC9iW5RwngbZyoe8dVIFya9dm6bB6N1kkdfKBmQlb/t8OQf1dUGTWC
         h2kt5nJB82pGVMl66XYSHstXlX1ejk4aZXGZUfPQw/yEepLFPn2GuSMWxH5i0DaPmuri
         05jnQ5jcYVjX8gWe8jjgFcCsUbqAHr7Vmhj7CrUa7VR8dIKDdHW8et5LTflQgE3LdeNN
         Hw0EQSrCENeQSOcsbRfo5mGxnc/TRjj/QXPthkEdfrINY5/Yrt8hXfZSLnnMtT854knw
         GIOOqFbvTuVNm/3MmCnU6dk4HxeGYLiH4/6w3BL3ApXG6h/86AGtL1rkEUebFMigcJwI
         GKJQ==
X-Gm-Message-State: AOAM531us5e7FhZULZmCJa7ga1rq1ZgdNF0Q3opR+0zhd5vHEOru+/x2
        aJ/2WV2DtsY7StzPgW57E0I/tA==
X-Google-Smtp-Source: ABdhPJyvKQhJHOmA0cSNzv4OzqARvZ+VxAzloXXJh95f6t6nKTRaotVwmPFGPRaJkBxjih1bg71zhw==
X-Received: by 2002:a9d:346:: with SMTP id 64mr21834506otv.320.1624294216372;
        Mon, 21 Jun 2021 09:50:16 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o6sm3115098ote.81.2021.06.21.09.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 09:50:16 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>
Subject: [GIT PULL] Additional Qualcomm ARM64 defconfig udpate for v5.14
Date:   Mon, 21 Jun 2021 11:50:15 -0500
Message-Id: <20210621165015.943060-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit e9cd414c1136aa31d34acc04c175bfaca4662f89:

  arm64: defconfig: add drivers needed for DragonBoard410c (2021-06-14 16:59:27 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.14-1

for you to fetch changes up to 8ae030c34dce4f5764e945b325e8dc4d2adef044:

  arm64: defconfig: Enable renesas usb xhci pci host controller (2021-06-15 19:19:58 -0500)

----------------------------------------------------------------
Additional Qualcomm ARM64 defconfig udpate for v5.14

The Qualcomm Robotics RB3 Development Kit has a Renesas USB HUB on one
of the PCIe busses, which requires the releated driver to be enabled to
provide functional Ethernet and additional USB host ports.

----------------------------------------------------------------
Vinod Koul (1):
      arm64: defconfig: Enable renesas usb xhci pci host controller

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
