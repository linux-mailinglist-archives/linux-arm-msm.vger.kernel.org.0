Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5946546F284
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 18:53:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242049AbhLIR5V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 12:57:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242021AbhLIR5V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 12:57:21 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 432A9C061746
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Dec 2021 09:53:47 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 133so4899726wme.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Dec 2021 09:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GYIcm+On64qCfpZ2eH3+P9ik2NWtxGyTHRmC1bAWfRY=;
        b=bsYFxvYmSQYm7NeQAO00CN7jlRDtboUWvn5snTdck0i0yjpBCBwT8XgcmojbgqSvmK
         HnnGeluMgSIPTlfCdiJyf0kScDqqZfpWxZMSYL8sosnerXmXexwDaXAz6+YS9O/dlecC
         v0ybD6h4ks8/n2N2cf584k3fFoxqQFSiqE6O/GlQ5AE1p0zBltHOVwQ+I8q8RlwwCftU
         JKK6X3eTpVpSMiCoheQJ6i+Vc7oWLbaM/UXDeqW24gGaOneP8O9GrQ/ZdY5ljS6pJAsC
         /pvzSP+j11uJsXoe3gJawIACNFHkXzmUs7lbBy9OqanC6UDgQSymAct3hMS6MJ2dSUL1
         j1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GYIcm+On64qCfpZ2eH3+P9ik2NWtxGyTHRmC1bAWfRY=;
        b=02hVOKVrq0Kw5dk2TcTJxwjZQV4/TkwpqMvSwwi+/cJsEPm98Cfgjt51cDp4PWNo5i
         AE8UJpQMaKiLBmsMbZkNt1svy25BzciDI6XWA8kZ2EZv21R8vK1L2orVOAKRK2zG7m/Q
         5/P9Y20zPnSCLeoxbkVNpoH05RzR1h8gQeP+302KQUEK/jzxiMNUt51Y4CVJgIz2MPlQ
         +T9JRkVkvj05EBREk9T6hD0sNj2OFzgqi90r2m5dntwuRDPYuMT9X92A8WSnn96Xwcoy
         rFpih/uPsw/v1faP25Eb/rpl9lMLIu3LMcmNR4afrzxs2290NiZxb0KMGaiqYWDhs/87
         UUXg==
X-Gm-Message-State: AOAM531Xnr8RRGfFguxGZACPmbG4LXkFzGndgA6fHTivvcnlmXASibcx
        Fh/WJs/fCFLZg6aM4aybyA+6lcCqECfhyA==
X-Google-Smtp-Source: ABdhPJzZ0OnJ3/bqMa9Pj95cVSmdT7z8dVLPkkE+VXumh7OJptbj0hDaPn5jf+mDhhtdfPw67wwUOw==
X-Received: by 2002:a05:600c:4108:: with SMTP id j8mr8949856wmi.139.1639072425843;
        Thu, 09 Dec 2021 09:53:45 -0800 (PST)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id 21sm427004wmj.18.2021.12.09.09.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:53:45 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/2] arm64: dts: qcom: c630: Fix soundcard setup
Date:   Thu,  9 Dec 2021 17:53:41 +0000
Message-Id: <20211209175342.20386-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211209175342.20386-1-srinivas.kandagatla@linaro.org>
References: <20211209175342.20386-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently Soundcard has 1 rx device for headset and SoundWire Speaker Playback.

This setup has issues, ex if we try to play on headset the audio stream is
also sent to SoundWire Speakers and we will hear sound in both headsets and speakers.

Make a seperate device for Speakers and Headset so that the streams are
different and handled properly.

Fixes: 45021d35fcb2 ("arm64: dts: qcom: c630: Enable audio support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index d6b2ba4396f6..2e882a977e2c 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -523,6 +523,10 @@
 	dai@1 {
 		reg = <1>;
 	};
+
+	dai@2 {
+		reg = <2>;
+	};
 };
 
 &sound {
@@ -535,6 +539,7 @@
 		"SpkrLeft IN", "SPK1 OUT",
 		"SpkrRight IN", "SPK2 OUT",
 		"MM_DL1",  "MultiMedia1 Playback",
+		"MM_DL3",  "MultiMedia3 Playback",
 		"MultiMedia2 Capture", "MM_UL2";
 
 	mm1-dai-link {
@@ -551,6 +556,13 @@
 		};
 	};
 
+	mm3-dai-link {
+		link-name = "MultiMedia3";
+		cpu {
+			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;
+		};
+	};
+
 	slim-dai-link {
 		link-name = "SLIM Playback";
 		cpu {
@@ -580,6 +592,21 @@
 			sound-dai = <&wcd9340 1>;
 		};
 	};
+
+	slim-wcd-dai-link {
+		link-name = "SLIM WCD Playback";
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_1_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai =  <&wcd9340 2>;
+		};
+	};
 };
 
 &tlmm {
-- 
2.21.0

