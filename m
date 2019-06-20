Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 446D34D2FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 18:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731979AbfFTQNM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 12:13:12 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54060 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732170AbfFTQNL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 12:13:11 -0400
Received: by mail-wm1-f67.google.com with SMTP id x15so3642555wmj.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2019 09:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m3w0mEC2GZ5BObknViffH07pdi6drJIwjps8rVJ93V0=;
        b=K4j32GkJokKSPB3bvPltU4oa+cDxqg2sC2LehPoPPdAxIDKXVDyYSCDuD9boSIHAQN
         cyZOIryW0eqv6rDDy5l4RWlvB0NczUW00tX/uJlam7I0/Q1qLovO5WQoJM9RxInKOHk2
         zuZ3A+YB3+rj6O3FR+fAl80T7yHluqMJShoOccPixXHypQivQCBONYc61IEi4/ddX9AY
         yYHuHY+BRrwou5V9SOZOmuE7hfNU2qk8eo22STU3XG274qR+nR0FrlCxhLr2WfkQoZqk
         uwyArSPX2xNPSVcki9+OQHLt8FHgSowHWa1dhG5XdZTBQs6O3gl3quGYhqwcUUka81Am
         CbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m3w0mEC2GZ5BObknViffH07pdi6drJIwjps8rVJ93V0=;
        b=Hh6Tecu6Q30otaoam0yGpGooGGppN9Qg3qo9I+H2brArTPomQVARqZIYzkxyIMOlOs
         AGxxjj8X7G6oqjIVQuuv4JlNfD8w+Zo9Zl6eB/5aQDZsc4cGC1rbd/iJiu7S4uKPQCLy
         DBdSMX0lPwhi6b/2V5gexA2jxQCr+VXwd47SHvWbi5OJZ6t6NofeWUKoLW5OA/XSn5CC
         NrXl8q137HZkU7On+lfqu5prvtj5tpn7hJNBvfrrvux6sI85+Co6HB6W+I5buYdvPxGY
         Wwgx1V4qMj2CBM1xt5NbRL2Uuw23i9RmPQpZm5s3FL5XuH8OlL0RyOl9UKZsyPR2uAtT
         95DA==
X-Gm-Message-State: APjAAAXyLuZnYqJ7Vji6SNtLzJChWmlTH1Kxzx4U5tnxYVX/fdNTgrj0
        m9cmgB4P70BNFtyS28mPLlXhVieoclU=
X-Google-Smtp-Source: APXvYqyXHVxT8FjhIPbg2nTCl0NkK4CwmiA8tHb9CoeBq9UqH6qpveUiA7qdl6NRIq2PvFzG4/9cfw==
X-Received: by 2002:a7b:c7d7:: with SMTP id z23mr304901wmk.46.1561047189880;
        Thu, 20 Jun 2019 09:13:09 -0700 (PDT)
Received: from debian64.daheim (pD9E29A96.dip0.t-ipconnect.de. [217.226.154.150])
        by smtp.gmail.com with ESMTPSA id o126sm11024wmo.1.2019.06.20.09.13.08
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 09:13:08 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.92)
        (envelope-from <chunkeey@gmail.com>)
        id 1hdzgS-00049m-0t; Thu, 20 Jun 2019 18:13:08 +0200
From:   Christian Lamparter <chunkeey@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     David Brown <david.brown@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Kubelun <be.dissent@gmail.com>,
        Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH v3] ARM: dts: qcom: ipq4019: fix high resolution timer
Date:   Thu, 20 Jun 2019 18:13:07 +0200
Message-Id: <20190620161308.15936-1-chunkeey@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Abhishek Sahu <absahu@codeaurora.org>

The kernel is not switching the timer to the high resolution
mode and clock source keeps operating in with a just a lousy
10ms resolution.

The always-on property needs to be given for xo clock source
(which is the sole external oscillator) in the device tree
node to get to the 1ns high resolution mode.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
Signed-off-by: Pavel Kubelun <be.dissent@gmail.com>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---

v3: fixed empty line, removed changeid reference and fluff,
    reworded message.

v2: fixed subject [Abhishek Sahu is bouncing]
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index bbcb7db810f7..0e3e79442c50 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -169,6 +169,7 @@
 			     <1 4 0xf08>,
 			     <1 1 0xf08>;
 		clock-frequency = <48000000>;
+		always-on;
 	};
 
 	soc {
-- 
2.20.1

