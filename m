Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2441474BF4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2019 12:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390205AbfGYKmv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jul 2019 06:42:51 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36086 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388313AbfGYKmv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jul 2019 06:42:51 -0400
Received: by mail-lf1-f68.google.com with SMTP id q26so34212266lfc.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2019 03:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CCZt3kPOpetUJel0mQo8gQ4T9AKw5U16SpvhhYzlabk=;
        b=dPjlq6A2lvWvgrMNJdWXllzHpmLL0eSjAKl3p11X8gAO1Yvl99cnY+xirJks9vbb13
         6nCvLEzGEA+2Mg8BA/VSM4x4lPIC4J3FPTKrWy/NmUUST4mSkbSrrw4h/Htc1lt3k9wG
         c2E2gKHIQKGr6YPf5me3iOR9WO3A3pxO2gOPg7kQqbJpotHyCEZ065jJ9upAazCdKAa+
         Hkv6dhJkQvDN6NIXUh+c8CnF1I9EDZW0xg4Y1ThnQCMHCW7nXjOdeN8YAjOSI7FDKZyz
         HwGJ+jvUU2QgFbEP+6Kxw6TmQYkwHxlRRLRuwVPtdM5ifpOujExT0iq02CSofXx4/moQ
         SRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CCZt3kPOpetUJel0mQo8gQ4T9AKw5U16SpvhhYzlabk=;
        b=EjDpWaHnp1tGUH6b2Y4qD2Rk3ECj9gIWSK/taR40wEvD1ZPUDPCXc2aSMaCJ/Fi5y6
         e/cSmQjl75kHC7HUkjcrU6RDGgtTmP57Scms+ihf3aoqWmm2qODBEPGND2/h0pS4GwpN
         2lsZc58+krThhzEmYAuSDjE6t2Np2XU90s5XP2dK6r9ySA/IUu/1YkueOTjOJYLjlxiS
         sbVAIfCRpcgHeoTxCa/Lu7BA2c7odOyPVExblXExyrHHrTzNPsr9yL3FH6k/ZinfhbRQ
         uo7uNuOzF0rPFYIQp/blG3zLlMTPYTIyryJ2DD9/h5OlP5dtgJKEZlVJeGAi/S4erl0G
         n2OA==
X-Gm-Message-State: APjAAAUsek3mIGzvz5eejyFP5n30LN63QEM9S5VKtlNvutzECobnlJtg
        Q2UdITfSX+IeGLw0V1a1cndKfA==
X-Google-Smtp-Source: APXvYqyHYEAnKCQigACGznav4uCxvOKhm8HycAN3Cp3gSen5Bex3GSkUOUEJni/ors317BJHT6r5Mw==
X-Received: by 2002:ac2:59c6:: with SMTP id x6mr5914293lfn.169.1564051369379;
        Thu, 25 Jul 2019 03:42:49 -0700 (PDT)
Received: from localhost.localdomain (ua-83-226-44-230.bbcust.telenor.se. [83.226.44.230])
        by smtp.gmail.com with ESMTPSA id e62sm9035045ljf.82.2019.07.25.03.42.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 25 Jul 2019 03:42:48 -0700 (PDT)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Andy Gross <agross@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org,
        bjorn.andersson@linaro.org, ulf.hansson@linaro.org,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/14] dt-bindings: opp: Add qcom-opp bindings with properties needed for CPR
Date:   Thu, 25 Jul 2019 12:41:37 +0200
Message-Id: <20190725104144.22924-10-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190725104144.22924-1-niklas.cassel@linaro.org>
References: <20190725104144.22924-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add qcom-opp bindings with properties needed for Core Power Reduction
(CPR).

CPR is included in a great variety of Qualcomm SoCs, e.g. msm8916 and
msm8996. CPR was first introduced in msm8974.

Co-developed-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 .../devicetree/bindings/opp/qcom-opp.txt      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/opp/qcom-opp.txt

diff --git a/Documentation/devicetree/bindings/opp/qcom-opp.txt b/Documentation/devicetree/bindings/opp/qcom-opp.txt
new file mode 100644
index 000000000000..f204685d029c
--- /dev/null
+++ b/Documentation/devicetree/bindings/opp/qcom-opp.txt
@@ -0,0 +1,19 @@
+Qualcomm OPP bindings to describe OPP nodes
+
+The bindings are based on top of the operating-points-v2 bindings
+described in Documentation/devicetree/bindings/opp/opp.txt
+Additional properties are described below.
+
+* OPP Table Node
+
+Required properties:
+- compatible: Allow OPPs to express their compatibility. It should be:
+  "operating-points-v2-qcom-level"
+
+* OPP Node
+
+Optional properties:
+- qcom,opp-fuse-level: A positive value representing the fuse corner/level
+  associated with this OPP node. Sometimes several corners/levels shares
+  a certain fuse corner/level. A fuse corner/level contains e.g. ref uV,
+  min uV, and max uV.
-- 
2.21.0

