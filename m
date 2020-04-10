Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 725011A3E49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 04:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgDJCcj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 22:32:39 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44081 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgDJCcj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 22:32:39 -0400
Received: by mail-lf1-f68.google.com with SMTP id 131so367715lfh.11;
        Thu, 09 Apr 2020 19:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/BjaClGsv2QfVYrtrGl8x80P9NmKuxyd3Zm0+/Zkvbs=;
        b=ZaJ2VA+kwmi8/Iy7QhhUgxssafCeWV/5lom5hSbqhWHCE1iSKSq8ETffyK5BlSvfZq
         2+QgMp4o92TTNmyKhXc8G2g+6pJ8zlCfDsZ3Cjdv19yqiBXVNYyiRd9Nb20ivviUSRb4
         GKf97AtefJ+BtnbwvFK6tbkguK2bDejsLyJJ3tih8o9eoBWss/PbvCzPfvRYcC6rQUuR
         KpIwKuLZWPHS41sMwMalW/sTAo/6Ptly84cE22vT8tZ0j50MRPCaXCHsO5k9nJ7bsSsi
         lof8ziyDmgvepPy43uhP6RTwC5cn+JXsJurEwGUedt8o8FHUocPjvevwj2sIy9ombZHe
         Gw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/BjaClGsv2QfVYrtrGl8x80P9NmKuxyd3Zm0+/Zkvbs=;
        b=tD8fnQn8e/jtYsVCrxXiJ9WG9nIkpsfcb/nh8Wo5ymAWQTMAB/BgtllUzSN10fTuhJ
         5S5NgOx87oLIf/O5K9Ew86kJYMHewua7HgEEFrcx3lRBNjbr7CKSk39ytwX6CzmXMgDP
         kHK3K8QgtbFtAmsOmxgFAeR54klra2DQZKLzIuZjA+X8J7ofsYo7e+C28rTaTGeZ5Uc4
         OiuthX8GQd+1jjd0budRBZMA4TK7YILA4gtXGX9bif4E4BtFFSo513lwBYoeXbGqANFN
         Nc8KKPaE4AvmuZb0hHEIVt72nFoN+HOsoMy7pOIJmswcCDVVh/DpXY4beVyCod7x/6VN
         aUbw==
X-Gm-Message-State: AGi0PuZVUTdFdOHgGwTcDsnQFnsV035f3ZpGJ06BpZso34rBV/8BlMBC
        S19mTX9lJgZSCiftDE95uVhEHiPqyC60sA==
X-Google-Smtp-Source: APiQypI2IlDacgBvHjWuGdNmHD98+rBt6DrKIzXrX4QTHwObsrlDtfbgCal+QMozCv21LNdQouKXcg==
X-Received: by 2002:a05:6512:10cd:: with SMTP id k13mr1241168lfg.173.1586485955626;
        Thu, 09 Apr 2020 19:32:35 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id o16sm264331ljp.53.2020.04.09.19.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 19:32:34 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Daniele Debernardi <drebrez@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 1/6] ARM: dts: qcom: msm8974: Add pma8084 regulator node
Date:   Fri, 10 Apr 2020 05:31:58 +0300
Message-Id: <20200410023203.192048-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200410023203.192048-1-iskren.chernev@gmail.com>
References: <20200410023203.192048-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Daniele Debernardi <drebrez@gmail.com>

The pma8084 regulator node is added with status disabled.  It is used in
the Samsung Galaxy S5 (klte) for various things including gpio keys,
sdhci, usb, dsi

Signed-off-by: Daniele Debernardi <drebrez@gmail.com>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 53 +++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 2ea2308d91b3..fdb93138be25 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1600,6 +1600,59 @@ pm8941-regulators {
 					pm8941_lvs2: lvs2 {};
 					pm8941_lvs3: lvs3 {};
 				};
+
+				pma8084-regulators {
+					compatible = "qcom,rpm-pma8084-regulators";
+					status = "disabled";
+
+					pma8084_s1: s1 {};
+					pma8084_s2: s2 {};
+					pma8084_s3: s3 {};
+					pma8084_s4: s4 {};
+					pma8084_s5: s5 {};
+					pma8084_s6: s6 {};
+					pma8084_s7: s7 {};
+					pma8084_s8: s8 {};
+					pma8084_s9: s9 {};
+					pma8084_s10: s10 {};
+					pma8084_s11: s11 {};
+					pma8084_s12: s12 {};
+
+					pma8084_l1: l1 {};
+					pma8084_l2: l2 {};
+					pma8084_l3: l3 {};
+					pma8084_l4: l4 {};
+					pma8084_l5: l5 {};
+					pma8084_l6: l6 {};
+					pma8084_l7: l7 {};
+					pma8084_l8: l8 {};
+					pma8084_l9: l9 {};
+					pma8084_l10: l10 {};
+					pma8084_l11: l11 {};
+					pma8084_l12: l12 {};
+					pma8084_l13: l13 {};
+					pma8084_l14: l14 {};
+					pma8084_l15: l15 {};
+					pma8084_l16: l16 {};
+					pma8084_l17: l17 {};
+					pma8084_l18: l18 {};
+					pma8084_l19: l19 {};
+					pma8084_l20: l20 {};
+					pma8084_l21: l21 {};
+					pma8084_l22: l22 {};
+					pma8084_l23: l23 {};
+					pma8084_l24: l24 {};
+					pma8084_l25: l25 {};
+					pma8084_l26: l26 {};
+					pma8084_l27: l27 {};
+
+					pma8084_lvs1: lvs1 {};
+					pma8084_lvs2: lvs2 {};
+					pma8084_lvs3: lvs3 {};
+					pma8084_lvs4: lvs4 {};
+
+					pma8084_5vs1: 5vs1 {};
+				};
 			};
 		};
 	};
-- 
2.26.0

