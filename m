Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C877C74BD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2019 12:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388394AbfGYKmR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jul 2019 06:42:17 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40789 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388380AbfGYKmQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jul 2019 06:42:16 -0400
Received: by mail-lf1-f65.google.com with SMTP id b17so34192575lff.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2019 03:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TpKb4VV72yRVAf7yb1K/qNrZx1PQ6/zj42Sv4qoKxfU=;
        b=Jc4jwUeowngvAFR3LX2W1/kDI10qMd8LfPEIU08SrKmCtk+2usu+5+U+uUsonvMdyi
         cloQgHAyJZVlsXpVdBZvjk9ZeuUYkRE8n0e2pVvhrRB83DD5BrCzaUd3FIPfmHXim6kz
         yn2RQb79KNc7N5jzwU5TXU0dYc4jyJE4/XavMRXVd0Gbv4SXQl4mrktwT3WO8YJpvAKT
         GaF6Mcxr8VgsTSmfXOGqry85Dpr5T+Jh3SdhOJXwgpv54sG/qwS/cQhWD9vGgUcCyseq
         Ce2qxwTBZr8Yc8PvgL2IeXitU3Ui86u9ckAhqpfMe54fyPKnBNGg8TsF48oiYEBAcZWh
         Q8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TpKb4VV72yRVAf7yb1K/qNrZx1PQ6/zj42Sv4qoKxfU=;
        b=sCjxImXIrMYnnMGKDvQncphyiL837ulzetfv1vYv8sBogrPv6mQL/dzlj5Dx1KxBIu
         B7MQuAQ33DLZ06run1Qc2AcDHUeqIS2NoTEYmTLxtxtu+bMrwHJZorGyn09clEYpRacm
         vuqHrdhQ5yw+GEUjeLvwbIFZ4eRrZ6EGyyT12bamy5Q84me3DLw5ajex1+oRF4Yfqek8
         Tx0nJM5hUlIA0c5LLN1154ol7W+Prrcusm9pWBOU+Q0SMO2GPT9BHS0u5ji2n3I5vphq
         KyaM7wageaKh9wqJKzsokizscz2xaWyLsRiMrB03zsvECiIcVQILiXDNVPtNTdtgwWfm
         4XrQ==
X-Gm-Message-State: APjAAAV9i7B4EW3CW3E5ujIMh7qyRVB9OwyUyBy6eCfaSEXq/M8VQ3Sn
        H7NOkBJUpxde4s4ppWSeUFfkVA==
X-Google-Smtp-Source: APXvYqzOQ29X1ibchVTw5wCsSyM2R71I8q3iJTM9pm9V+nxEdnazgwjsrGUrRAu07gExbAbgydMpOA==
X-Received: by 2002:ac2:5336:: with SMTP id f22mr39514270lfh.180.1564051334342;
        Thu, 25 Jul 2019 03:42:14 -0700 (PDT)
Received: from localhost.localdomain (ua-83-226-44-230.bbcust.telenor.se. [83.226.44.230])
        by smtp.gmail.com with ESMTPSA id h1sm7451290lfj.21.2019.07.25.03.42.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 25 Jul 2019 03:42:13 -0700 (PDT)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Andy Gross <agross@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org,
        bjorn.andersson@linaro.org, ulf.hansson@linaro.org,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/14] dt-bindings: cpufreq: qcom-nvmem: Make speedbin related properties optional
Date:   Thu, 25 Jul 2019 12:41:32 +0200
Message-Id: <20190725104144.22924-5-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190725104144.22924-1-niklas.cassel@linaro.org>
References: <20190725104144.22924-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Not all Qualcomm platforms need to care about the speedbin efuse,
nor the value blown into the speedbin efuse.
Therefore, make the nvmem-cells and opp-supported-hw properties
optional.

Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Reviewed-by: Ilia Lin <ilia.lin@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since V1:
-Picked up tags.

 Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt b/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
index 198441e80ba8..c5ea8b90e35d 100644
--- a/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
+++ b/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
@@ -20,6 +20,10 @@ In 'cpus' nodes:
 In 'operating-points-v2' table:
 - compatible: Should be
 	- 'operating-points-v2-kryo-cpu' for apq8096 and msm8996.
+
+Optional properties:
+--------------------
+In 'operating-points-v2' table:
 - nvmem-cells: A phandle pointing to a nvmem-cells node representing the
 		efuse registers that has information about the
 		speedbin that is used to select the right frequency/voltage
-- 
2.21.0

