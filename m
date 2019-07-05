Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E800603B3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2019 11:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727541AbfGEJ7b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jul 2019 05:59:31 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33723 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728396AbfGEJ6F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jul 2019 05:58:05 -0400
Received: by mail-lj1-f196.google.com with SMTP id h10so8712789ljg.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2019 02:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VUCWK2MsD9fKCW5H56U5T5vRzO2k7QDz1z157zPKgz4=;
        b=yF9Y4TXdbukUm95Tym+SSRRKXOgy30rcUTY/I/w2ob/pI2Xk6mM2EFws9z/z9Jy5cn
         5yH51ejAX7BSHtxlej6Sietfapi0cefT59q9jJN1ifMQjBqWA/apLst7ul9igPrQzDk2
         drpnxdar+aTtUDEWi3y8Cvaxy3V5c8w9TqANXQggoaL7EEGMCiDWenolNKnmfMlIz6hF
         LA7dy1MeKgwm/taneDq3mE/Cww1ynKWrGI+PksCPx8K3tIZOtjsxbHUhCVxP0us659eW
         TmBrcMnTRQnSIVFZY+/4qysi0crgRy02/xmt3FLPdAsn0bXiaXQyjMv1jXGLbzNsj4go
         eyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VUCWK2MsD9fKCW5H56U5T5vRzO2k7QDz1z157zPKgz4=;
        b=EHPzbwLowI2BpsJEgLvrSLGr2aYt5Qf4dD9e8d9Q6D2o/mLBY4CxpdvVFFfgUZiafX
         OKrFC2dAwdYKTVUJuTe3xVn6FuJG5sLmdyXH9yJY1re3uoE7+2hin97jud1kTl60YS+g
         BU/6+w5+nEyLvH6zef2wsNA4sRUU35gElOuQp8RaI7vffQgU2tiY7f5B+5FmdDY+xbwh
         pYOWqZh0nVmVNHLu2PxbU4Nz7fOm2rhngJY0kQ/qrVpi3LYd+n1IaH3r/aFwB3KN4Uk5
         en28qjc7A88YbVklGKzMU7fIWhf2Ovc5hUwQMtZjOlEMmQwKvANseIpE6V8hZYaNEnXb
         +Gxw==
X-Gm-Message-State: APjAAAWb7Zbj9UuIn4zmL/aon6JB7zhMc2eIujybu32cCS6+GuORGIGX
        BeEtpW/xuL66QcdzdKZ7SowfEyKZMZs=
X-Google-Smtp-Source: APXvYqx0ZiI7NUTcCSAcDJg+m43On7JBoo/yMllTvC1H2ViTfIYfM/r31p51tmof/TzmGg/DplB8aw==
X-Received: by 2002:a2e:9758:: with SMTP id f24mr1723330ljj.58.1562320683615;
        Fri, 05 Jul 2019 02:58:03 -0700 (PDT)
Received: from localhost.localdomain (ua-83-226-34-119.bbcust.telenor.se. [83.226.34.119])
        by smtp.gmail.com with ESMTPSA id 25sm1692704ljn.62.2019.07.05.02.58.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 05 Jul 2019 02:58:02 -0700 (PDT)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Andy Gross <agross@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org,
        bjorn.andersson@linaro.org, ulf.hansson@linaro.org,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 03/13] dt-bindings: cpufreq: qcom-nvmem: Make speedbin related properties optional
Date:   Fri,  5 Jul 2019 11:57:14 +0200
Message-Id: <20190705095726.21433-4-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190705095726.21433-1-niklas.cassel@linaro.org>
References: <20190705095726.21433-1-niklas.cassel@linaro.org>
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
---
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

