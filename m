Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4A12AB50A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 11:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728865AbgKIKe0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 05:34:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbgKIKe0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 05:34:26 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50FE2C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2020 02:34:26 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id f38so6793149pgm.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2020 02:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KTmupo/EpjgAy2pPuwp43MJbMbOqAR0YnTyRbouORaM=;
        b=DIeqnSAfnkOX68rTluPtTr1Z/ka/uBkkJE++R5AZx3vtaCnXWhpOlbW7q6Pchny2LW
         nmpKKNAk0Kqmu2QugOYA5xZUpku0kpAb8JVxgrykC3wSOJZZZIzFlfQ8S9+YjQEVR8NY
         ogbIU0upC+fJ3ZgVbZYFAKoVWSRCFHev5GFUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KTmupo/EpjgAy2pPuwp43MJbMbOqAR0YnTyRbouORaM=;
        b=DMP6cF6JxvKMjggpdSQ0gMzZoTCiV6Osxm81vX+BzBw+aEQCmG8MYznS/Pdzwg4SQ+
         RwJNmPkAXOXCRjg5yEHB2gcNy1J9uUaosKmz5FtRg9HkM2B30ULrsS0HtVAcYRER/VUl
         YSvHOX0aZtdGJCggC0ct6cv+kv0m58EYPMnZUjn9x7wU5u4nCRbRhqOY74hOfcLFSQe9
         r+u/u13WPu+zpMYEhArbhqJRRFpayewa5KyVO/nyJVkTi+wMC+b42tUBh+kKJzOVX8no
         nSRRSCqF/NqRlA0ntFY+hbxqkC4/oga5dzpoTHpoTdfrCwmFCoo6NoS4nNTI0sKLAmCl
         VrQA==
X-Gm-Message-State: AOAM532mvOMaWKwG7LY2TTNaYlaXkgbNNYQUOo/tJp2RI3qDZ6yseziA
        EJF/P/ir0ZmsyTgGHBnlOga5fg==
X-Google-Smtp-Source: ABdhPJyaNypAicS4XX7Fl08mgehF6nQZq7ki3Z9aXq2gKlrGrFfmnvTBvnq8T/JTZ4f0aahG8xTzeg==
X-Received: by 2002:a63:2a83:: with SMTP id q125mr12000933pgq.84.1604918065859;
        Mon, 09 Nov 2020 02:34:25 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
        by smtp.gmail.com with ESMTPSA id w131sm10662101pfd.14.2020.11.09.02.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 02:34:24 -0800 (PST)
From:   Cheng-Yi Chiang <cychiang@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>, Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Srinivasa Rao <srivasam@codeaurora.org>,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
        xuyuqing@huaqin.corp-partner.google.com, dianders@chromium.org,
        dgreid@chromium.org, tzungbi@chromium.org, judyhsiao@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [PATCH] ASoC: qcom: sc7180: Add missing PM ops
Date:   Mon,  9 Nov 2020 18:34:15 +0800
Message-Id: <20201109103415.607495-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.29.2.222.g5d2a92d10f8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use PM ops snd_soc_pm_ops to handle suspend/resume like other machine
drivers.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 sound/soc/qcom/sc7180.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index b391f64c3a80..42e366ecc689 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -258,6 +258,7 @@ static struct platform_driver sc7180_snd_driver = {
 	.driver = {
 		.name = "msm-snd-sc7180",
 		.of_match_table = sc7180_snd_device_id,
+		.pm = &snd_soc_pm_ops,
 	},
 };
 module_platform_driver(sc7180_snd_driver);
-- 
2.29.2.222.g5d2a92d10f8-goog

