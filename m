Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 458CA37ADF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 20:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbhEKSJe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 14:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232119AbhEKSJ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 14:09:27 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B5BDC0613ED
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 May 2021 11:08:16 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id u1so10640634qvg.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 May 2021 11:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UJPCudzb/Ou4GJ6RU5NgC6ZAZYELLNF2PjvvnraTbLs=;
        b=jOnMJrqZdmWyP0o57NUCpDxilR4xUtkwq7WWOW6jkBIyJpKJXpzcdDSHVUram4Fw2l
         R1tS10lyDQmNrTXBf0Ef+so2J9GOUYMuLI7TtWn+gCC/YPr8pjlWw+vaZu230sWpy5sM
         okitfqjHivB2xFoRsRZKQ4C4eXRXsuPzskeu1+VIVfPfnLZ8xqv9Yl5tWbdYa8eYOwlA
         cYOYFubxxgTbc6oIGZb3j6344nwr0L+lLXRp0oS401XIKDCKk3c+/mY0gONhzVc+JZm7
         4vS7hNDGqDy2iXnR7RSUdSBsAkC3GyYIw5uGsgbMAh+4+zGTsJnqBXybMn/1eye0kzfs
         ZnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UJPCudzb/Ou4GJ6RU5NgC6ZAZYELLNF2PjvvnraTbLs=;
        b=cGGm1RG9ZXAlHOi0y2auGDgGlxaUCgTsTiZWWY9G4p/JEQlkeCwpL0D+fNxwqorD4q
         Hey/blvPeP36kC/UyhSediph915h88oSdCahLIpDTf7PHoWtJ3QuHIAk8cOfLAlhMAp0
         yQbYPcSvmeJPQyQWuyBlOIYZs+wK93ncaMKPXZaHoOCZzZAeJtnajpbZC7IJHGC7E7Or
         Ouikvhat8De8r+fl8VxGoOpBxgUAE7COe10ZJc8f1EyTaXoKiiypXUiZMzL/FK0OK1O9
         7+LT7BsAUaWRCCgO9TV7xg8pQnQaKWg4qyMASNH7cUXuwLz+mvcdha1FpE5hmpIkwVC8
         PO6w==
X-Gm-Message-State: AOAM530F0GT7vDFE5hc42JbzlyME25WYVM+dQWX/WR0+le9KlrEsj60U
        eCESBd8lH9YXR7xCdK/GpZZWgF+CBJQonpoh
X-Google-Smtp-Source: ABdhPJyt6UKeePHWiG6MVDsBLdK4vH8HRXo1wZJkRcNm+uOQADMV2j5NAOIHOn15+yCV/riECKHTYw==
X-Received: by 2002:a0c:8521:: with SMTP id n30mr30551676qva.53.1620756495291;
        Tue, 11 May 2021 11:08:15 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id g5sm17104476qtm.2.2021.05.11.11.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 11:08:14 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 07/17] media: camss: csid-170: support more than one lite vfe
Date:   Tue, 11 May 2021 14:07:14 -0400
Message-Id: <20210511180728.23781-8-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210511180728.23781-1-jonathan@marek.ca>
References: <20210511180728.23781-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the IS_LITE condition so that it returns true for the second lite
vfe found on titan 480 hardware (8250), which will have id == 3.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index 3958bacd7b97..af134ded241d 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -21,7 +21,7 @@
  * interface support. As a result of that it has an
  * alternate register layout.
  */
-#define IS_LITE		(csid->id == 2 ? 1 : 0)
+#define IS_LITE		(csid->id >= 2 ? 1 : 0)
 
 #define CSID_HW_VERSION		0x0
 #define		HW_VERSION_STEPPING	0
-- 
2.26.1

