Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ECBE68CCD8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 03:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbjBGCtb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 21:49:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbjBGCtY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 21:49:24 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1F53431A
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 18:48:58 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id v18-20020a17090ae99200b00230f079dcd9so63068pjy.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 18:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHoW6eYbAc4fXAYhlPFT1Ci+6Xw0RaXHqNRq/Iskxrc=;
        b=kT7BMzYXud6r+jZSY+nLPRfwUgsmnKvXesh1AVQcFAPTBzPv/4nhg7vAPr5s+pVHkd
         1WEt3k0CjvfXwHJbSCzgtIGYtq2rEYzWkm6msNnbMvWJb2d5+bNQo+fF6h9M8lPp6zyF
         bgSiWjx6zCR/Boregwm3PEK4q2RR76aHTIZYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHoW6eYbAc4fXAYhlPFT1Ci+6Xw0RaXHqNRq/Iskxrc=;
        b=46ZYkHaem/qVC+ZAmhlCwKBymNAw9GMVtevrA7USi+jSe5TPfjfvyCwt5NQHVEUsh3
         gQFx+eqRVndW2tO/3jUrHelpHPt15kbcBwYoUTAig/epvfPoB7Dy7dHl5WL2delhl64D
         EwUnV37a3oKvAh1h+82ivHU9jvd26O2mCn7kYWK5iXO5AL3EdCfYVTOTiQs7llrySs4b
         D8G7DXDafazYRTZO5NlldVmcQRtB0Im/OJH4h1sc78tqaMUDA5UkBPE/Q5kkpdqfxzc4
         9p57sTs+6KX8z7uP0YBdqlMNQX25SHiAfnM7QbKLnG0fKMu76EUol9IW6D6GEzwWZuXV
         EaAQ==
X-Gm-Message-State: AO0yUKXusweSXRrJuaKl/MSxqaYqT6MsVzJ79GYar6Bafdo9+FIFqdQk
        8PXHuhVR7WvDubTwX5Vmyklwyg==
X-Google-Smtp-Source: AK7set96EDRUgjwqCjtZyjt3s7Fm+BlH1Yx2YTvIa8TC/AVnqJXNG1yYh3aohcd7sgmjs4Aq+3kYrQ==
X-Received: by 2002:a17:903:1cc:b0:192:5282:6833 with SMTP id e12-20020a17090301cc00b0019252826833mr1495566plh.29.1675738137588;
        Mon, 06 Feb 2023 18:48:57 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:29fb:a635:f0df:f45a])
        by smtp.gmail.com with ESMTPSA id s17-20020a63a311000000b0045dc85c4a5fsm6882430pge.44.2023.02.06.18.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 18:48:57 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, Stephen Kitt <steve@sk2.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] arm64: dts: qcom: sc7280: Hook up the touchscreen IO rail on evoker
Date:   Mon,  6 Feb 2023 18:48:16 -0800
Message-Id: <20230206184744.7.I2d960ed7f2445db0cf3d227fde985fbd740f3c4d@changeid>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
In-Reply-To: <20230207024816.525938-1-dianders@chromium.org>
References: <20230207024816.525938-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On older revisions of evoker, the touchscreen was either
non-functional or needed special hardware magic to get it talking
properly. It's been decided that the proper way going forward is to
use L3C to power some buffers on the QCard and then configure the
touchscreens for 1.8V. Let's do that.

Note that this is safe to do even on older revs even if it might not
make the touchscreen work there (because they didn't have a properly
stuffed QCard). As talked about in the patch ("arm64: dts: qcom:
sc7280: On QCard, regulator L3C should be 1.8V") the L3C regulator
didn't go anywhere at all on older revs.

This patch relies on the patch ("HID: i2c-hid: goodix: Add
mainboard-vddio-supply") in order to function properly. Without that
patch this one won't do any harm but it won't actually accomplish its
goal.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I haven't yet received real hardware to test this on, but it's a very
simple patch and, in the very least, highly unlikely to make anything
worse. No real users have these boards yet.

 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi
index 3d639c70a06e..0add7a2a099c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi
@@ -55,6 +55,7 @@ ap_ts: touchscreen@5d {
 		reset-gpios = <&tlmm 54 GPIO_ACTIVE_LOW>;
 
 		vdd-supply = <&ts_avdd>;
+		mainboard-vddio-supply = <&ts_avccio>;
 	};
 };
 
-- 
2.39.1.519.gcb327c4b5f-goog

