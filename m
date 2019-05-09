Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF2919293
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 21:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbfEISoc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 May 2019 14:44:32 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:46947 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbfEISoa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 May 2019 14:44:30 -0400
Received: by mail-qk1-f196.google.com with SMTP id a132so2029070qkb.13;
        Thu, 09 May 2019 11:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jsPKkmhsqJ0aAq9vroFhWsbnGVTGtQicTcthWAQlR0o=;
        b=LdEZRAX/TJ/k7NmNps9puKYLdyNm3cessNkR2RXfqapZ3k1zJMftD6E+ZLLHkonDD8
         er8rft+IqnV8aNN6bbU7fysGGnts+wmpRLdQjThOHJZGujYRQ5FAdC0+AreAr3A8sl5s
         ppNZ5Nt1CckPMLI3iY4/+XKuGB3wwQatMnzXmAkZd8TkjpmXGjIogFqx+zf8s66+qv/a
         FF9O+iIU7vVFLhNPXo7WpUKwMmGzT5EsahgewAFBN0OZ4sKIE2s9KruO6h8mAQiqlT1Q
         DOei/Ub5V0TrRauunH3PoTdGvqwPuq1ZYPT02R50Rt5PQf6tNRhMxNsN/gGEZsaN5mpI
         +vLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jsPKkmhsqJ0aAq9vroFhWsbnGVTGtQicTcthWAQlR0o=;
        b=TlRuTUTctv+TEUr8Zuc7huQQZkupqGjborl8KEqVVBsApnt5FKCT9F5cOomxW1nr4G
         Zos29xC963X7Fqr9FaZtUmq38LKfFeX0wUjMADcZTUpEp4/4NDKO9xIlBn8llvLSHMdR
         uwyIBZ0a2+bPbM0jlVHN7kH/BxoSsl3Cdyvv+ETiEcpyW0pJyPrOcz+AxvhFXdQzNVG/
         cqBVBok6AdVo7pAaNQz+mDkFB8CP9fq3lRe1zf7lTdC5mp7kV4D2yYPLRGSWRx+eRUyK
         Gcr79Y48W0s4Xd1dXYb1B0KueLnWnp0eAriIUXFwmW3/viiwghE3mOb278qCO9CihWPX
         3aMA==
X-Gm-Message-State: APjAAAV31UAcOJNa/ymT41o/uUPvWOxAA2w81Y2H/0dCBokxjTeAzXr2
        Vu0Q5prS67CnraH6QO5KdesdUHzxMug=
X-Google-Smtp-Source: APXvYqxoucIeygzi7jC6N4v37QMotaGcn4FbS9qhFQGd+VyvmmmQQkGW1HfLOasSyFNaz3jyCokjCg==
X-Received: by 2002:a37:a40e:: with SMTP id n14mr4671379qke.85.1557427468797;
        Thu, 09 May 2019 11:44:28 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:6268:7a0b:50be:cebc])
        by smtp.gmail.com with ESMTPSA id 50sm1691080qtq.7.2019.05.09.11.44.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 May 2019 11:44:28 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC 2/3] arm64: dts: qcom: sdm845-cheza: Re-add reserved memory
Date:   Thu,  9 May 2019 11:44:12 -0700
Message-Id: <20190509184415.11592-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509184415.11592-1-robdclark@gmail.com>
References: <20190509184415.11592-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Douglas Anderson <dianders@chromium.org>

Let's fixup the reserved memory to re-add the things we deleted in
("CHROMIUM: arm64: dts: qcom: sdm845-cheza: Temporarily delete
reserved-mem changes") in a way that plays nicely with the new
upstream definitions.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 338c92ddd1c3..8ccbe246dff4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -156,10 +156,44 @@
 	};
 };
 
+/*
+ * Reserved memory changes
+ *
+ * Putting this all together (out of order with the rest of the file) to keep
+ * all modifications to the memory map (from sdm845.dtsi) in one place.
+ */
+
+/*
+ * Our mpss_region is 8MB bigger than the default one and that conflicts
+ * with venus_mem and cdsp_mem.
+ *
+ * For venus_mem we'll delete and re-create at a different address.
+ *
+ * cdsp_mem isn't used on cheza right now so we won't bother re-creating it; but
+ * that also means we need to delete cdsp_pas.
+ */
+/delete-node/ &venus_mem;
+/delete-node/ &cdsp_mem;
+/delete-node/ &cdsp_pas;
+
+/* Increase the size from 120 MB to 128 MB */
 &mpss_region {
 	reg = <0 0x8e000000 0 0x8000000>;
 };
 
+/* Increase the size from 2MB to 8MB */
+&rmtfs_mem {
+	reg = <0 0x88f00000 0 0x800000>;
+};
+
+/ {
+	reserved-memory {
+		venus_mem: memory@96000000 {
+			reg = <0 0x96000000 0 0x500000>;
+			no-map;
+		};
+	};
+};
 &qspi {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.20.1

