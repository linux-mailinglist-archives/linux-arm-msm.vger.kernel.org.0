Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9046A8F5E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 03:43:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjCCCm6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 21:42:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbjCCCmz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 21:42:55 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653D92D4C
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 18:42:53 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id bi9so1880722lfb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 18:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677811371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5WGNHoHvFrqEzbIMWPaETRGh642NbHa8AZbtFWCIaY=;
        b=a1Th93dRZhNLFhiK7IaDAOwo6+U7mQU2G9IxkKcOhsXbtvHHwqOJBbyqnZq9OWlJbe
         PRy2m3odeC/uu+rdRtGZFHE4CyA+ZQyW570JMMZLN4ZkJTbwPvvrklO6MtzsN/isn4BZ
         d6+Vw3elF8Thke2Olw45Gfy2cHVxP7Mn/m34a+orjQ73+ZKOSd2QIvCAH5Xjl2PGcOSe
         Kt+nHfF3mpKhQlnRl82T+Ihx/9ydlw6UJibClFQKxIyBYPPaSJ8YYC0mAaBnuZk5yqdu
         wUD+TIYQLfmen1g5gsYWk2+PTx84nUjPbl82gCmqpBZeOrpdzxTaESrrrRSVSUuAlubS
         glEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677811371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5WGNHoHvFrqEzbIMWPaETRGh642NbHa8AZbtFWCIaY=;
        b=CJIcwy3vn/+gnApdAbNvsfjns+T/Vcagao1OStDvDUxoAzYgCdh/5LfNuF0Kab4tfA
         gJt9uVQ5nzr+pAh4vqTvdiDgPvDs55cQCd66jUXOuhySoMivdRYZqC39slM+Psi3cfay
         vYvynHHTZBQOGJDbDwdMNdIsDU0JWPFd46xqWHDlKIsTjDV7cr/y6Mp11jzCwCdfaJ9m
         wlzU0wx72IG/3AX30VvO4pLT3faCWX5B2ZG5rlfvf3axAv4TbAmBSNbuaP+JkFVi+z1R
         QFQvplgLAdt19NES6AEo5gbseAvbTqxv02tBr4x3of6KM/h5QXs0MGHt/3HJv2Ey/pSJ
         T7mg==
X-Gm-Message-State: AO0yUKUvqlD4UNRQqLGQpZa2zr82vp+z+THYixzFARrlDyYxKyM3ANU0
        UdB4W4+lVUY36CS7X3JIAn624u0gUcPz67Aw
X-Google-Smtp-Source: AK7set9F3ef7m9KaxrogAYM4oalKAF6WRYPXP6o4DQr3SoBD77rCGtH28CpKaBUu35HPmnfJ/K7pCw==
X-Received: by 2002:a19:7611:0:b0:4b5:b705:9bf7 with SMTP id c17-20020a197611000000b004b5b7059bf7mr99636lff.11.1677811371416;
        Thu, 02 Mar 2023 18:42:51 -0800 (PST)
Received: from localhost.localdomain (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id x19-20020a19f613000000b004db1cd5efcesm181379lfe.241.2023.03.02.18.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 18:42:51 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kalle Valo <kvalo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] wifi: ath10k: snoc: Add VDD_SMPS regulator
Date:   Fri,  3 Mar 2023 03:42:46 +0100
Message-Id: <20230303024246.2175382-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303024246.2175382-1-konrad.dybcio@linaro.org>
References: <20230303024246.2175382-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

At least SM6375 (bundled with soc_id 0x400e0000) and SM4350 (bundled
with unknown, probably the same) expect one more supply, called vdd-smps
downstream. It's set to 0.984V and connected to a - you guessed it - SMPS
regulator on PM6125. Add support for it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
The smps name sounds like a quick downstream hack and is probably
something more exquisite in reality.. Not something I know, though.

 drivers/net/wireless/ath/ath10k/snoc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 9a82f0336d95..6443523131db 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -48,6 +48,7 @@ static const char * const ath10k_regulators[] = {
 	"vdd-1.3-rfa",
 	"vdd-3.3-ch0",
 	"vdd-3.3-ch1",
+	"vdd-smps",
 };
 
 static const char * const ath10k_clocks[] = {
-- 
2.39.2

