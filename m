Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 052E03073E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 11:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbhA1KiB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 05:38:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231157AbhA1KhZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 05:37:25 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF96C061574;
        Thu, 28 Jan 2021 02:36:43 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id d2so6033087edz.3;
        Thu, 28 Jan 2021 02:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SpC5cDZiK9XBZrbGh5X/wjvAmU6o0YyRha1vKAZSeaA=;
        b=ao+Jimx9w3mxiW2wsbfDxfNDAg9INdaXcxbiGcWEwe7Qm5EbXRLtPS2wKA1gYrDh4c
         5Rk1EcmPFdtTrHZUCtWI1rEIOVYrcCzQve2h6gzf/LyH6uD7a+FpzY2r1hX1xI9tRLsQ
         x7CSsD6IqwYsOyveBVxDLm5DpLfUQJ/uvEP0mEMnKeDCpty+JEwFoxGK3bQ7PWDs6+dI
         WLpJKYMB2V6oQd6gyjvkj2xjzHdH+gxU0Sc4ELlNLQDS19iRWS0lC3XydSF0L57fcH3c
         brUZVbD4/EefPwii/+wZYJUiRx8Sv4+mdT8CdHsgdtiByM456/OCj6Xle5EXKpvhX9wH
         ZV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SpC5cDZiK9XBZrbGh5X/wjvAmU6o0YyRha1vKAZSeaA=;
        b=Aano7yYxtwbSh4rK8kTa5J/3ifpQbHx++/M36mTP4Zp+m0wBD/HhsXrB1p/sKhL4cA
         bViAVmYjBjl6VhpTZxPRc1kBqMFzaBCRRIfARPvLO1Tx8Pcs1x0yfw5fAtlSNedWzG7x
         iUwd/m/o3pJbMSHkIKOkca6jl1SbjKqs/muuf/TS7DlEQOdUv6RUs0C6kc9hjbDfA7RD
         1nEEKY25sLb2Fv29Oi6HF/q8z8VRp533d6VYdjC0C1QDwp8XbBc1Ls9ytdXmH5/omrMt
         JRmH2H9XSwqRxvfqqtjUaWelGSxoW6VIDc+Zzkt3/4hxbszdpddM7XrPOlF/CL17OYoc
         3zsw==
X-Gm-Message-State: AOAM530wEkVhR+q/XgzAbs3UDvip6C5SFAInBuG6nBk8471uqrcBTkye
        b4UWvM6mee0qybTcV0pUYFg=
X-Google-Smtp-Source: ABdhPJyhyacIBUNEo/6yt/of/WlVUC/It8O5YF949i+HYuVlE9kZS/R74hceDbPD5TIrhhNClAA/8A==
X-Received: by 2002:aa7:c34f:: with SMTP id j15mr13104641edr.120.1611830202387;
        Thu, 28 Jan 2021 02:36:42 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id f9sm2832014edm.6.2021.01.28.02.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 02:36:41 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Samuel Pascua <pascua.samuel.14@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Brian Masney <masneyb@onstation.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v4 2/4] ARM: dts: qcom: msm8974-klte: add support for GPU
Date:   Thu, 28 Jan 2021 12:36:29 +0200
Message-Id: <20210128103632.1723952-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210128103632.1723952-1-iskren.chernev@gmail.com>
References: <20210128103632.1723952-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Samuel Pascua <pascua.samuel.14@gmail.com>

Enable adreno dt nodes.

Signed-off-by: Samuel Pascua <pascua.samuel.14@gmail.com>
[iskren.chernev@gmail.com: changes after v1]
Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index f23d1002b8f8b..61e67b7a4a067 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -697,6 +697,10 @@ fuelgauge@36 {
 			pinctrl-0 = <&fuelgauge_pin>;
 		};
 	};
+
+	adreno@fdb00000 {
+		status = "ok";
+	};
 };

 &spmi_bus {
--
2.30.0

