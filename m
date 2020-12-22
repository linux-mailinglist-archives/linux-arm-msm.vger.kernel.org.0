Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0C82E0A3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 14:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgLVNFd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 08:05:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgLVNFd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 08:05:33 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0712EC0613D3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Dec 2020 05:04:52 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id l11so31865893lfg.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Dec 2020 05:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wpybqc2zF0sExp4ldyJqh4OgXlDOdXRdjhp24OFKG1g=;
        b=Ja7q77qbiXPz6qhOj8tbOZpq0HNDMBXjs3FQx1SJ6st9hNmdIdnOphBctK/Y82Ttdv
         aORcR8xO2lqRjYq//AKd51ro2F7xifUoY5/2RC3g4hrt90jBc6LYzj2GQIWvEGu/rhgh
         wZJ70oUKB4qeZdZSzYZj5wZ/Ckt4GCgj3hhJrSVeedDoIXrNUogt6neMIySIrbfnGIsE
         lU1j3SgbbjOwX2tWFHvvr/cNYQ/B/bm5Db7Cosrsmmiu7Y9sDRcpb2CubYWSe/JuOC9Z
         71n1Pz3oL9Y9BpX5FoEvWECWSLeN5piPHj2w1JEvasFO3GOIF8ESc/t1CNj5ueQ1fLgx
         de1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wpybqc2zF0sExp4ldyJqh4OgXlDOdXRdjhp24OFKG1g=;
        b=azt9HL6Zqb2s+4sA58r3ULQHZJi7JoaJnHZbD1ZYz0NgKvfJWUYUu1zHZDiMcgQmvM
         k1wTG3fEJHZg81MORhi3EhvYtSGedffyKhMISeNdiiz5vzxiCS1rpLRnRZOpHHaGwkNS
         xh09giaCzEUXDHqMmaKcrzj0FbG+P4sCn/rhTfc7W6JrN8HDTTPZVhyBI5eN2ndRjXA8
         MuUiNC7WNUI+e3bABIxXkgmns3msk+wj4zoMm4DsTkK+jdCif7BbvLPzhwRSdtbdXq0u
         QWsI8uo69GXjJk3zFcr0ABS2qV3wEyI6qlsjb4fa78ZvdTJvdTBdOt27mEjHMCjoqUbs
         S2uA==
X-Gm-Message-State: AOAM532UrY+UdFhuN/WboUfSnOLJW5Tbv61dVA19grrfUFxIOR00EAAS
        9jhcSt2/KG6O6y9Jr4qChWzG6w==
X-Google-Smtp-Source: ABdhPJzIWNHOUpYawyIHzHgCO7+UAkD69N0ENBg73rpmXN+wPCYkE9NDuAt4dT9tSNeRVImA+n0YYw==
X-Received: by 2002:a05:651c:118a:: with SMTP id w10mr6340515ljo.13.1608642291460;
        Tue, 22 Dec 2020 05:04:51 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.224])
        by smtp.gmail.com with ESMTPSA id k18sm2864235ljb.80.2020.12.22.05.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 05:04:50 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/3] soc: qcom: socinfo: add qrb5165 SoC ID
Date:   Tue, 22 Dec 2020 16:04:46 +0300
Message-Id: <20201222130448.4125297-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index b44ede48decc..cbd59937aac5 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -228,6 +228,7 @@ static const struct soc_id soc_id[] = {
 	{ 356, "SM8250" },
 	{ 402, "IPQ6018" },
 	{ 425, "SC7180" },
+	{ 455, "QRB5165" },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)
-- 
2.29.2

