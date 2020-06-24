Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2F02207650
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 17:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404039AbgFXPB0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 11:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390251AbgFXPBZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 11:01:25 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC9E5C061573;
        Wed, 24 Jun 2020 08:01:24 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id o11so2599265wrv.9;
        Wed, 24 Jun 2020 08:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yi5HolOAmQ2STI1BdEHxCclM+Uj+oAzfKdWwbWDjM+c=;
        b=p1tnijsZntvtdYRVo/rIXwkuR3uqTedW6T/LwlvFin5dMoTpOpZG1P5SYfzzx0klmV
         BxToiZl15lY7qs5lE1B4QWfD+1CfWRO9bdjGyj3j8Qpnpr25rHpmyQvdg+Ol7t5J2VoH
         6RJNxW+n8QDXQU7tf5GxAiQLW1OUb4ynONAxAyTxM4K5oG71zTtnM79AQG3eYWMmTfhZ
         5tAX5QhkI5NlJOTcqFAdB3EumaZkR8tF8RMBKNL6eui4Iciz9HHrU5nVr9ahIcQXEmZo
         QXSeeGL+X9IXoVLTCGFRpQ3vT6LugtyYUP+gP9fqck6LAUjXS09t5v92tRdp53YaL84I
         kY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yi5HolOAmQ2STI1BdEHxCclM+Uj+oAzfKdWwbWDjM+c=;
        b=AbDrpu4UNVWmgTk8gRdGP8veVyrKZuG/LxPZ5C5iBdm7lUCVuAZP72GhivX/GTc1j9
         jzwqvt5pV31xlTb0A29E3LXWbjmHiYOL6NMye5YjHUZ0JP/Y4vRtILmSvdCBQvvKlt2o
         OVICyDdEergDxCq3PjxNXqW1znR4Dd3+rTAh6qSeOwx0hTlm4/aqNUwBJcRELGf0baEr
         kWAjdM6GLHuzixK0+OJPsubFUpEoEwSIAeZzjYgrwkxMZP/rzvk2Q38eZ0tfFC05MqYt
         /F+jUSGU0hZ/YwD83Fammz1mQs3ogdCs/gJ5mZEK/BUpvK4p4wALIZm7GII50c72xuQa
         IFcw==
X-Gm-Message-State: AOAM533DUb9vYe86s6nwkF7KyZ5L6GoZ9cFgLR+epGi6rtBbxZ8E1OQx
        Wn6evVdfMFiPyr6ZkUla2TI=
X-Google-Smtp-Source: ABdhPJyyLZJA7Sr1DvZkH+Hte4vFjhDJrIR4AOkzmVWkNbZVtxPXwEx9U6pGzt98yp0wLpjEohtl9Q==
X-Received: by 2002:a5d:6a46:: with SMTP id t6mr4538911wrw.374.1593010883714;
        Wed, 24 Jun 2020 08:01:23 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id s8sm21339390wru.38.2020.06.24.08.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 08:01:23 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/8] arm64: dts: qcom: msm8994: Add SCM node
Date:   Wed, 24 Jun 2020 17:01:00 +0200
Message-Id: <20200624150107.76234-3-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200624150107.76234-1-konradybcio@gmail.com>
References: <20200624150107.76234-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 9ae848442d0b..bf5aa7308b63 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -142,6 +142,12 @@ core3 {
 		};
 	};
 
+	firmware {
+		scm {
+			compatible = "qcom,scm-msm8994", "qcom,scm";
+		};
+	};
+
 	memory {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the reg */
-- 
2.27.0

