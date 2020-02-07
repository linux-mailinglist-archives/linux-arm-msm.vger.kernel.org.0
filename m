Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89849155053
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 03:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727570AbgBGCAQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 21:00:16 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45674 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727569AbgBGB7T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 20:59:19 -0500
Received: by mail-wr1-f68.google.com with SMTP id a6so739794wrx.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2020 17:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sAZggOAZ6xTvR/9Em9hZggbtITo/icBMwG27JPLcFiE=;
        b=EbSmzJ0N47D483I84L2YJYZve9nTs4GuRgnT5sks0JG2onpZA5JSbostYvrQWDCu1r
         3Qn6ElW9q2W73HjpTSkJQ72tpp1gUYx0Di/gt/bfXLI+2pQGOxOyBdjD77sC2kls0gr+
         kIqLq+aMayPqlFvaKasuErnpMtd/Mb114QSrRteFF+T6DesQfJomgJwPAC8rCfJ1VQjv
         v1537oneydlycGQ0Apyxpe1vGHm9gZM9qbuExSiZIdibzqrTuBL36/XjkRqOYbqUB9/t
         Hu7Gy4ltvGEhWxhHY4e78NsXfhC4QSvfcJ5PZDBBE1Id7XBV6SkhkW70KRvfShYmNbmG
         birQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sAZggOAZ6xTvR/9Em9hZggbtITo/icBMwG27JPLcFiE=;
        b=mZ2SmwIuYHUppfyp+yfy0Trs4kG0dd1KLW/iaxUBguDpfR/AeWgLHbk+2Th5dMGvXJ
         prkeRbwKjHJOj81alhjnX5M8J0g4N2F91m/hC/WO7A0+0TkqVvjaUjOMIt614XJ2C0ua
         TCDG58lC6gmKbn8amz1mnRi+5WTe4EoR+oaYov/LZ+loNGuQDsMmxnckw0HpqCQs5Vb5
         NARUJGbjNCJHW+yYu4CgefBZI9RBvxCA/wRAVO4/CNoRCOHbi53Psfld/9wbaoOvds/w
         cRe291HX2QpNqj+7jAD40mwtzXHx9tHXVLzsey6Yg/2MeM1DG9ceYhIZgCsl+1D6SJ47
         Ba1Q==
X-Gm-Message-State: APjAAAXVqd5k3VbRfe8u9JItRi9B+khUg2EraSHFpDCNvxunkXwR+Z/1
        73CYPakSnUCFDKvO+7iJYn31I0E7Nv0=
X-Google-Smtp-Source: APXvYqyrBOMPKaZoAAnKYUD1is0KDX4nA8X8hHDX6zjGlLSndWgoFUhGbIIHaLx8CIQ4f1Pd4MzNww==
X-Received: by 2002:adf:e5c6:: with SMTP id a6mr1218160wrn.185.1581040757075;
        Thu, 06 Feb 2020 17:59:17 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id a62sm1490095wmh.33.2020.02.06.17.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 17:59:16 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v4 08/18] dt-bindings: usb: dwc3: Add a usb-role-switch to the example
Date:   Fri,  7 Feb 2020 01:58:57 +0000
Message-Id: <20200207015907.242991-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
References: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds usb-role-switch to the example dwc3 given in the file.

Documentation/devicetree/bindings/usb/generic.txt makes this a valid
declaration for dwc3 this patch gives an example of how to use it.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 4e1e4afccee6..8c6c7b355356 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -121,6 +121,7 @@ dwc3@4a030000 {
 	interrupts = <0 92 4>
 	usb-phy = <&usb2_phy>, <&usb3,phy>;
 	snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
+	usb-role-switch;
 
 	usb_con: connector {
 		compatible = "gpio-usb-b-connector";
-- 
2.25.0

