Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3DE93AF745
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 23:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbhFUVRs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 17:17:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbhFUVRr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 17:17:47 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3DC1C061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 14:15:31 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id a11so19398043lfg.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 14:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L8LCz6lkvapvDVbV9d8++oTpnZmaRJcBw/CJv5OQ27c=;
        b=AANXDapCv9pqmNzUsLOiY7pKVQlXUzBAUTC92MqkETvxK9Mesbo5daRa/nXLdrdDm7
         xc0iLGmHbWDYXwnA+WbT8jY4rNvhEBdet4YiWUP+u3dIr7Jpp4TvXobvb6cgfFofMSDO
         Ykd8dtn0iwE9dyQiOBUTYpDOkjNT50gLkV3+g2xMJSZflTVuUhWxmjU3v2Kty8ckT+Ot
         NW5xn/O+0ulqiBA4bzuhRzjEN8PH4J/PqWVXFVq/p+XezVv834C6FRhL7YXSAvdPyfs3
         q0G4DsavUeBbjEe5rWHn/H9mEzl8tfHRInnr+ELzRu1vi9NAmfODt+I9Bdiy2F2Wq1M3
         Uybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L8LCz6lkvapvDVbV9d8++oTpnZmaRJcBw/CJv5OQ27c=;
        b=Q9uYqmxdso+rHP8uC1JIASdL2+i6mN4uH69i2cvf9B3qgBQkOhwlWkCXGM+iU3UFL2
         y5eSfSIvJ1g4oIq/ITNTYgSRTtaAqYkoqXGEhsQqC5RmOQee6CSzWW0ccGZ0cViyMPRT
         QOG2VAtDXdEZEvk6CGEHV7p0ir4Xy/LzT+fOdlnpzDiFw6dAo1bWPojaIrsQjSUOX+Hr
         GVv/bn33CBVsmLQMU72KGJUPiONTywinwfdj14HlGzWxgzcWwDCoxxByBtD4wckcq3LT
         +SQlQxzyZsxe4UCcviGKJ7rFJ+Cp94KnyuvC8CQwQuOZVvlsj74cE5NUFPR6CQrZsZQD
         VSVQ==
X-Gm-Message-State: AOAM533H/EWoeny0tlcIa39Q/4nQrQDgaGWjlv8G4FHUfWnOyWB10qMA
        9lxiH30DZIBmbnkDkNEvuznBpdJbObu1Pg==
X-Google-Smtp-Source: ABdhPJwlfqTgPLIW2DfAo+owEtoA5YnoYw5Nj8WaozvGfiNmryLDEH/CS7gK1VG/jtGPkN80jJ3T0A==
X-Received: by 2002:a05:6512:c23:: with SMTP id z35mr164708lfu.549.1624310130117;
        Mon, 21 Jun 2021 14:15:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v8sm1213943ljk.122.2021.06.21.14.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 14:15:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] serial: qcom_geni_serial: use DT aliases according to DT bindings
Date:   Tue, 22 Jun 2021 00:15:28 +0300
Message-Id: <20210621211528.1607516-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Device tree bindings do not specify "hsuart" aliases, instead all serial
ports should use "serial" alias name as noted by Rob Herring [1].
Make qcom_geni_serial driver use "serial" alias and fallback to "hsuart"
if one is not found.

[1] https://lore.kernel.org/linux-arm-msm/6dd1f5cd-03c7-5945-9fa2-1c2698405110@linaro.org/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 23d729ed3bf6..85f1c1f96597 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1354,7 +1354,9 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 		line = of_alias_get_id(pdev->dev.of_node, "serial");
 	} else {
 		drv = &qcom_geni_uart_driver;
-		line = of_alias_get_id(pdev->dev.of_node, "hsuart");
+		line = of_alias_get_id(pdev->dev.of_node, "serial");
+		if (line == -ENODEV) /* compat with non-standard aliases */
+			line = of_alias_get_id(pdev->dev.of_node, "hsuart");
 	}
 
 	port = get_port_from_line(line, console);
-- 
2.30.2

