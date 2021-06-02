Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8CEE39935F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 21:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbhFBTRk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 15:17:40 -0400
Received: from mail-pg1-f173.google.com ([209.85.215.173]:37501 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbhFBTRf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 15:17:35 -0400
Received: by mail-pg1-f173.google.com with SMTP id t9so3089090pgn.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 12:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=geUlY28idlRl31FZ9a215m49D3hMM6sM5xSEAUHdu6Q=;
        b=bfZymNZwyWfZAK9dQL6QZMOlrsy0EVslpsnRnk4MP59bfUdxLNO9WQNVOdyjb4W1pT
         x5knflRc2sQiyEMEQ413+6Ou9cXywITn0ZT4PgUbCiH+xpYShqevhk80z3ZLIfL0PGNp
         DYkr1tMq74KL0h0fqLNwoQpMvYirFnRL3Ofwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=geUlY28idlRl31FZ9a215m49D3hMM6sM5xSEAUHdu6Q=;
        b=hOimjFyGblIPewYR5TY47IE+sopVdqV85rwQeoEvtQIepNQR7Qxn6uUTefNyVDdCOr
         6mBsPJfK0NIWzvNYhOJrcYqwvM6XXaV5rTVvOVDSIcc0M7rA+M4zT3Tsrcsj3itAxgjG
         bIovEcfg0Nre+g+3rM6Tx/bWwE6n8PA5ZdEkCY9fyEWS9ImIsxjrMoNnCZqL8cwHVWNP
         vCMt30TVdgP33zuOqg6VwJX+RW7QaUlgcW9ezxpCHz9QdsOlzbsdv92gVRET0BY1IolC
         tmbuwii7vUDYDOjDTXSFpy/fj2FW7DcXXCA01j4YGDGFTJpe1faR4L+6Un8PTjP3sm9F
         heTA==
X-Gm-Message-State: AOAM533fANiKQI5kbDRXIkDVhdOeW8ZxfUZFv4qpvz08Galp1kbsZPvD
        ivgpW1qOGDoQxSdPLF+6gg/svw==
X-Google-Smtp-Source: ABdhPJxJFLrbIyB7wrlkmDeG23Rk9KszzlrqXDo6l6RDQTF9ynKoHenGQeaSTUs8I891JL2EoYup6A==
X-Received: by 2002:a63:ff1f:: with SMTP id k31mr34704359pgi.315.1622661272403;
        Wed, 02 Jun 2021 12:14:32 -0700 (PDT)
Received: from sujitka-glaptop.hsd1.ca.comcast.net ([2601:646:8e00:b2f0:3c25:f769:d7de:98bd])
        by smtp.gmail.com with ESMTPSA id z17sm329242pfq.218.2021.06.02.12.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 12:14:32 -0700 (PDT)
From:   Sujit Kautkar <sujitka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sibi Sankar <sibis@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: qcom: sc7180: SD-card GPIO pin set bias-pull up
Date:   Wed,  2 Jun 2021 12:13:41 -0700
Message-Id: <20210602121313.v3.2.I52f30ddfe62041b7e6c3c362f0ad8f695ac28224@changeid>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
In-Reply-To: <20210602191338.1995827-1-sujitka@chromium.org>
References: <20210602191338.1995827-1-sujitka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some SC7180 based board do not have external pull-up for cd-gpio.
Set this pin to internal pull-up for sleep config to avoid frequent
regulator toggle events.

Signed-off-by: Sujit Kautkar <sujitka@chromium.org>
---

Changes in v3:
- remove 'trogdor' from commit message
- move reference patch from commit message

Changes in v2:
- added pull-up for IDP

This change is with reference to Qualcomm's DT change posted at:
https://patchwork.kernel.org/patch/11675347/

 arch/arm64/boot/dts/qcom/sc7180-idp.dts      | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 07133e0af581a..0c255edb7f3c3 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -696,7 +696,7 @@ pinconf-data {
 
 		pinconf-sd-cd {
 			pins = "gpio69";
-			bias-disable;
+			bias-pull-up;
 			drive-strength = <2>;
 		};
 	};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index d128a0ed6ad3a..330deb4967ca2 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -1638,7 +1638,7 @@ pinconf-data {
 
 		pinconf-sd-cd {
 			pins = "gpio69";
-			bias-disable;
+			bias-pull-up;
 			drive-strength = <2>;
 		};
 	};
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog

