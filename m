Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B42FB305D87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 14:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbhA0Nty (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 08:49:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbhA0Nth (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 08:49:37 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E778C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 05:48:57 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id t29so1210125pfg.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 05:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GOVWTXj4nljNWAGndXCSQhwNAHq21QwCCU0BbxAkemM=;
        b=S61LkbapPO5wtP/iFjrfZjum1CifQ43xjsAvvSgR3NC3FPrGogaH406qrml2pjzoVh
         UftzrJIcnVtQk82gWKk0Z14JBuNXV7Rit5kPBDuN1h3wHHVuNrVFfhCjMAWwvb9zTbAj
         5e5elp2cAPtvAzQwy04ZpK80tqOai2dG1WoGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GOVWTXj4nljNWAGndXCSQhwNAHq21QwCCU0BbxAkemM=;
        b=CJzTIGMS2U8pyKydh8sQR2Pmgi0xsCLB7DOkIRqbVD+t6B9XIUrdYdsTseiJ9uRYc4
         YxhaTvCPlX/+ysTiEtstuzgLjVg9CrcYwaqwqatYAcv4fDLbUbY6hfdT8P3H4IHeKMdK
         nM4cGnuOCzmRnU8wMMRuDZkWMluj5mzSv2GHVSze7xq1wP5JZ0w2w7Mcq/Fhh7L1y+D1
         nPzLRJd4nWkQMAiaMH5D1XkEq+ecS36ASngX0MsK5+uIPD4Zs8AiRBc2tLVFvdzuVeZo
         y1Cg25SEDkTsvTJp6080TtsBRfzLFaYkIkV3k4n1zWEXFBJv/TcMH3nLbjQoSpf0kO3R
         RMGA==
X-Gm-Message-State: AOAM533ClANAtfhpgD6vu20MxBm8p5mdEgTbytu4D6eG834GohFCilxL
        eSS/DfPlvgM+/Otf/bZmVXh9mQ==
X-Google-Smtp-Source: ABdhPJxj3AfmDtcS78/eiVZjOQCAdD1+dtFL9Ey808WBkRMOqWpHN+sUItYHU3PvPVP3A1f1np5O1g==
X-Received: by 2002:a63:f953:: with SMTP id q19mr11222117pgk.120.1611755337075;
        Wed, 27 Jan 2021 05:48:57 -0800 (PST)
Received: from judyhsiao-p920.tpe.corp.google.com ([2401:fa00:1:10:a53b:f71a:ed56:92d8])
        by smtp.gmail.com with ESMTPSA id e12sm2653271pga.13.2021.01.27.05.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 05:48:56 -0800 (PST)
From:   Judy Hsiao <judyhsiao@chromium.org>
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
        Stephan Gerhold <stephan@gerhold.net>, dianders@chromium.org,
        dgreid@chromium.org, cychiang@google.com, tzungbi@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, Judy Hsiao <judyhsiao@google.com>
Subject: [PATCH] ASoC: max98373: Fixes a typo max98373_feedback_get
Date:   Wed, 27 Jan 2021 21:48:47 +0800
Message-Id: <20210127134847.1143535-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Judy Hsiao <judyhsiao@google.com>

The snd_soc_put_volsw in max98373_feedback_get is a typo, change it
to snd_soc_gut_volsw.

Signed-off-by: Judy Hsiao <judyhsiao@google.com>
---
 sound/soc/codecs/max98373.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index 31d571d4fac1c..746c829312b87 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -190,7 +190,7 @@ static int max98373_feedback_get(struct snd_kcontrol *kcontrol,
 		}
 	}
 
-	return snd_soc_put_volsw(kcontrol, ucontrol);
+	return snd_soc_get_volsw(kcontrol, ucontrol);
 }
 
 static const struct snd_kcontrol_new max98373_snd_controls[] = {
-- 
2.29.2

