Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D26907932DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 02:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbjIFAVR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 20:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjIFAVR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 20:21:17 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B30E01B7
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 17:21:10 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99de884ad25so477204366b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 17:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693959669; x=1694564469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xMVYqhgoDtHhF5pmsZuFKhOwMGZVLTFyvkiWPnVn3eY=;
        b=ZEUT90tLx1Wx57s54/HHostWxYWKWSIEGRbevFyhf4PxDjj71HAjesf47Wp/o+AwgM
         t93lQ9rhuBluMTCgclq0+qWGIjBr/Hvp8rv7RlQb405HDmCFsIHZlh6rj7OkuMDniEv2
         eS25CEh78NnzKc2uMW4vBEbyzEOL4h7WQ7jpVCtRTE67so+gdiTQe/3lDuYdwg3h/PVy
         3RUjBtHUWUZj4uZDySMg9KOrYS5nIvcBXWb78IjCf+bI6Mrda3bcalxQj4iHG1rcGcVR
         Dq7Z17+6gXd0rhIVhzItsdLRVLB8OR90ph8XF62AGAY02x5j25EbHO6ams6S2lqfOG7b
         39tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693959669; x=1694564469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMVYqhgoDtHhF5pmsZuFKhOwMGZVLTFyvkiWPnVn3eY=;
        b=IBo1541abjM86yqSXv+v3vjC7b1JGAOwrfmkq4/7iedRz2ak8LkeHFlWjNbLX++RA+
         OcGipSjD4csiToBdfQw0aXjZT4mfw1FPFaCRK32snvZYLqIUrR6K25/eJ7sguVg53NE1
         10ALTKCH8r2hA2cH09BaR0hGkVXdL9JHnnY2p8ed8kzLsfCRHl+V+/7IwgcVY7W1N5kL
         wsqWt9QYjTdrQimwGw1EUZhjfd5Mc0J24bweN9K2CMtczImSfghSSeIHeUqW0opjppFv
         lUDesCHEmsXXoerjDpRldqUQEtXCo5qurzNheEJw7eSuegqIq70VMoA+A9vWQ86NZAT7
         eoNA==
X-Gm-Message-State: AOJu0YzWQs9xzERMlSi2cAIlqX7BD6T2tgdwCvQ7/4wLMraSXqR042rY
        giAMTmP3q6ZwGGOmJq1tuUgsHISb5CjlV/rIMUo=
X-Google-Smtp-Source: AGHT+IH3EKpbgT8SBSa14ChDUK9xukALT9utSbyiz5vXKhue1jyYHBwAM0OTrcyi8Mkck8TB3Cds/Q==
X-Received: by 2002:a17:907:2be1:b0:9a2:eb6e:2cf3 with SMTP id gv33-20020a1709072be100b009a2eb6e2cf3mr866818ejc.0.1693959669246;
        Tue, 05 Sep 2023 17:21:09 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f25-20020a170906495900b0099d9dee8108sm8305759ejt.149.2023.09.05.17.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 17:21:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-firmware@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, Kalle Valo <kvalo@qca.qualcomm.com>
Subject: [PATCH] ath10k/WCN3990: move wlanmdsp to qcom/sdm845
Date:   Wed,  6 Sep 2023 03:21:07 +0300
Message-Id: <20230906002107.1311378-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The firmware file ath10k/WCN3990/hw1.0/wlanmdsp.mbn is platform-specific
(rather than being specific to the WiFi chip itself) and can be used
only on the Qualcomm SDM845 platform and close relatives. Other
platforms (e.g. Qualcomm QCM2290, QRB4210) are going to provie their own
copies of the wlanmdsp.mbn firmware.

As discussed with Kalle, move this file to the platform-specific folder,
providing the backwards-compatibility symlink.

Cc: Kalle Valo <kvalo@qca.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 WHENCE                                              |   6 +++---
 .../hw1.0 => qcom/sdm845}/notice.txt_wlanmdsp       |   0
 {ath10k/WCN3990/hw1.0 => qcom/sdm845}/wlanmdsp.mbn  | Bin
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename {ath10k/WCN3990/hw1.0 => qcom/sdm845}/notice.txt_wlanmdsp (100%)
 rename {ath10k/WCN3990/hw1.0 => qcom/sdm845}/wlanmdsp.mbn (100%)

diff --git a/WHENCE b/WHENCE
index 390a5689408e..7c3c34d51f53 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3395,10 +3395,10 @@ Version: WLAN.TF.2.1-00021-QCARMSWP-1
 File: ath10k/QCA9377/hw1.0/notice_ath10k_firmware-6.txt
 File: ath10k/WCN3990/hw1.0/board-2.bin
 File: ath10k/WCN3990/hw1.0/firmware-5.bin
-File: ath10k/WCN3990/hw1.0/wlanmdsp.mbn
-Link: qcom/sdm845/wlanmdsp.mbn -> ../../ath10k/WCN3990/hw1.0/wlanmdsp.mbn
+File: qcom/sdm845/wlanmdsp.mbn
+Link: ath10k/WCN3990/hw1.0/wlanmdsp.mbn -> ../../../qcom/sdm845/wlanmdsp.mbn
 Version: WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
-File: ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp
+File: qcom/sdm845/notice.txt_wlanmdsp
 
 Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
 
diff --git a/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp b/qcom/sdm845/notice.txt_wlanmdsp
similarity index 100%
rename from ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp
rename to qcom/sdm845/notice.txt_wlanmdsp
diff --git a/ath10k/WCN3990/hw1.0/wlanmdsp.mbn b/qcom/sdm845/wlanmdsp.mbn
similarity index 100%
rename from ath10k/WCN3990/hw1.0/wlanmdsp.mbn
rename to qcom/sdm845/wlanmdsp.mbn
-- 
2.40.1

