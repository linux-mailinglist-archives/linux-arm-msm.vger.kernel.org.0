Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8572D4186CC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Sep 2021 08:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbhIZG5P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Sep 2021 02:57:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231164AbhIZG5P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Sep 2021 02:57:15 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 115BEC061604
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Sep 2021 23:55:39 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id rm6-20020a17090b3ec600b0019ece2bdd20so1144990pjb.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Sep 2021 23:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=u8dwdasDMIbDsJqPa5ttmn9bjefExMCA1hLofRY28s8=;
        b=uNBD+cs0OHhTfWt3inrISgxHjx4FUqyGUUX6ggudTlz4ZgILC2d8Y+tQ95yJfezkOF
         9TZKTKwZ4kVxvCNrcX1QvNtynJBbhkBOREnIr9LmU1dlnbM3jHJ+ufvqg+9nNRFzDOUH
         DFKo+QfABZ0DiQbBGDnBUpC0LlSVS5YUzf5Bpb9yWzhhdAylEWBIkjiGtErsftUdOYgG
         W8Wgdhcq1dj2AqAzBCUHlDqKNrSSvI+CioTnksss93kiHdLInBwZ520l4dLnOCJvNL9E
         0RxhxRkERFk+yGdnfPha8+lk67+/wdS+po8jGjd8wbhGM17EmsugCsir7C6DA/rdZYBx
         SRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=u8dwdasDMIbDsJqPa5ttmn9bjefExMCA1hLofRY28s8=;
        b=SSsjVM/yMr2U7kl2U1sjWuR0evJeKBk2IUTJ9luRVDyK+Dk0mHnsm375Rzhd4VI0rn
         5Wppmgt5CiFHF8HDVMWCvGwa1c6Z87zioKxr/EMaGy+amR0nkaUjEQHpOsv8zvJr07Bh
         OQvWxzZZlYlJw8Kh6CHwjmcvQWKYaLS1hhCHxr+qOVFuP9P5JWCILLCh6PvlxaXFF2Fs
         x3Q3GBbf8VlxYhvMtWndJ2l/NL5+Yoc8JKqraZV5rgAPdmpLr/tbRHqqVnsAJfyvjHXx
         Ldub1+a6uDcyNCst2Ovz3Q8l0EP2/o1tX7GdPnhMbwTQAP8fNddWD6e2kFXbX2HmhZQD
         OSNA==
X-Gm-Message-State: AOAM530o1tV3RpYhFGHl2M52u0fQzOD727kXC6gsv6XBuaJ8lp6+TUan
        tCm6uuYkhN+TlZAh/Js1VleBcQ==
X-Google-Smtp-Source: ABdhPJyX97SDoA8dsUAa/TKwy7G+hx3vx6meOkgiUiof2Do7odaJZ+f9Vz108L7rPWB6okRQUZyJDw==
X-Received: by 2002:a17:902:a702:b029:12b:aa0f:d553 with SMTP id w2-20020a170902a702b029012baa0fd553mr16602901plq.3.1632639338516;
        Sat, 25 Sep 2021 23:55:38 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id i19sm13214021pfo.101.2021.09.25.23.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 23:55:38 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     "David S . Miller" <davem@davemloft.net>
Cc:     Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Steev Klimaszewski <steev@kali.org>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] net: ipa: Declare IPA firmware with MODULE_FIRMWARE()
Date:   Sun, 26 Sep 2021 14:55:29 +0800
Message-Id: <20210926065529.25956-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Declare IPA firmware with MODULE_FIRMWARE(), so that initramfs tools can
build the firmware into initramfs image or warn on missing of the
firmware.

W: Possible missing firmware /lib/firmware/ipa_fws.mdt for module ipa

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/net/ipa/ipa_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index cdfa98a76e1f..264bebc78d1e 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -545,6 +545,8 @@ static int ipa_firmware_load(struct device *dev)
 	return ret;
 }
 
+MODULE_FIRMWARE(IPA_FW_PATH_DEFAULT);
+
 static const struct of_device_id ipa_match[] = {
 	{
 		.compatible	= "qcom,msm8998-ipa",
-- 
2.17.1

