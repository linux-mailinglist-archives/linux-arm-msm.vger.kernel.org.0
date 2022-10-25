Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA13A60D302
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Oct 2022 20:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232734AbiJYSHZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Oct 2022 14:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232682AbiJYSHT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Oct 2022 14:07:19 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41AA763D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 11:07:06 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id pb15so11595167pjb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Oct 2022 11:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UaHvsuBeqGUDHNJwrHZu7I7KXYW+zqfgTqUGn6DC/xo=;
        b=BrZrLWVB5VSJpkzOeZqV2YWZUWJDEwqbeQ1Nve9BZ4AAyOSYp43pwQEn1bBPMP1PUV
         xFiQdrcQEowdrnFBqYSxGvy8VpMmBzyE2atFCIS/8/rs65U/DPt7ezxoUwSB7kqZU/LH
         rZ4F/tlv0HbrYah5/V8rNIThPb6tiWOQcfTEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UaHvsuBeqGUDHNJwrHZu7I7KXYW+zqfgTqUGn6DC/xo=;
        b=J69TmVBWDwMA4xI4cu+78XKkhTmj8JkwIFEZFJe6FrfEXKXc1JZ8aa8Xrjy2TOlsS3
         rKdhOAo6h0JRSbm7nf4IZqRrBQBBMnPtsphRuDgYkFc7lgNVpVVWQAC6VHRG36d2Fe3M
         6MHZYB3S0ZBgySolkYF5z1jy1GG50Ns8H7OlSwLFkA1NHDkswjfE+XNcpw26KgGOz9aP
         lUaShmqdPmUlACnAICSvr+RTORBdXSjA9TivwtfW7y/099YVvXyyU7w23uN1Uc69gVli
         HkSy5SaDrT0UE8XOKFlylilAPuxgHwzeqBiVG6fqmPGKuThQVZtdITYvdlUyULMOFUt5
         i27w==
X-Gm-Message-State: ACrzQf1e318ncrqtXKrJeEPf5EnAP5C8uPbISptU8GlSMfVwdfkhWgyf
        Q+JrPJCMSfvTLXR6wzsiCOi82Q==
X-Google-Smtp-Source: AMsMyM6KD70FiLQ2NY7/KT4ZdCgreGIg8amZ286q1tYd4ft48X6ah9dtxyQ5N7DjKGkH08gBYBnE6w==
X-Received: by 2002:a17:902:d483:b0:182:cb98:26e8 with SMTP id c3-20020a170902d48300b00182cb9826e8mr39797221plg.73.1666721225601;
        Tue, 25 Oct 2022 11:07:05 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:97a:f22a:beab:58])
        by smtp.gmail.com with ESMTPSA id d8-20020a170902654800b001788ccecbf5sm1493786pln.31.2022.10.25.11.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 11:07:05 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] arm64: dts: qcom: Remove fingerprint node from herobrine-r1
Date:   Tue, 25 Oct 2022 11:07:03 -0700
Message-Id: <20221025180703.1806234-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It turns out that only a few people have the fingerprint sensor hooked
up on their board. Leaving this enabled is slowing down boot for
everyone else because the driver slowly fails to probe while trying to
communicate with a sensor that isn't there. Remove the node to speed up
boot, developers with the board can manually enable it themselves.

Reported-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
index c1a671968725..8d07401d852d 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
@@ -47,10 +47,6 @@ &pp1200_wf_cam {
 
 /* ADDITIONS TO NODES DEFINED IN PARENT DEVICE TREE FILES */
 
-&ap_spi_fp {
-	status = "okay";
-};
-
 /*
  * Although the trackpad is really part of the herobrine baseboard, we'll
  * put the actual definition in the board device tree since different boards

base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
-- 
https://chromeos.dev

