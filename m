Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A250D3B0E8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 22:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbhFVUYV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 16:24:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhFVUYU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 16:24:20 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDCC5C061574;
        Tue, 22 Jun 2021 13:22:03 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id i24so475107edx.4;
        Tue, 22 Jun 2021 13:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wWlgqM4/GsaXHBR3lsRsq7dze3ZzgTNAhbjNgou3P9g=;
        b=RqB3hKDpArmGSJSSU9+qh628Y/Av3FGZvIWhzRs6GM6jrD04stjxHD1la7Nyxfy/xF
         6c+tTuYnbM05rUqYCq9kwHM9POQy2UB2R7qCvXD6e/zmNBJxH5wVreUgZF0jEuBtFgGr
         fhLp6BaPzh7HvLheaMCQcjpW3XGO1vtnhhFUM0whRmFbk9lWTKgQ/mo481grwQmtZYWQ
         oC5llVXTAZ9WSqFX0g7JVy3ekskEVV4i5ac++u/QlNF0U/97TP/bc9Bl0Ow6vixb5AHT
         6TGpT7EmDflZzrtJP6UXzcYqDe5Etysc/6UZEEoPsm1hj7iMIt4XY3/2P7Wx5hgUH1wR
         if5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wWlgqM4/GsaXHBR3lsRsq7dze3ZzgTNAhbjNgou3P9g=;
        b=SU4aOeeCLa+d//T64rfnD2nte0ta5E9B3EYIMBthdRYDlDnxpuv6ArVOlbVHtWP9xM
         MyEFHxGKG/BS0RcT0iMxQ5tcdLY65hlVlLZAWt3PHt0eUM7x5+UMv0yA3d4xWGT65FI4
         kGZr15EK1mMt9aPUx0cWeQqv0ER28ngMdud10xOKYxKe03jQI68y9psnxQI0usRy7EOj
         jmK3R93i+bviZ6cJlLrHSGbKm+SJRymCOzkF8VX2qTM0eRn/uqQhZQm+FqyIpsxsZ5lE
         szn+74GQlNlYy0X9Oaaq2P7gpkrSQetA9pTIAQLEJ4J+E/VxvaG/kIqtwTvx3ZLD+KQU
         npug==
X-Gm-Message-State: AOAM532P4uGeOdEhdEIi2wiDL8a7LyUye0IMhC7DxQgJ1oaW933Up7kD
        SuQXpoLw/KJmQ/83TuxR7wE=
X-Google-Smtp-Source: ABdhPJxAdsQn5+vjpa3VM7IwGuv3GucqrMBQRb/iPy5MhjihrSQLSlROpy21VFe+4vBtFKNzaWLq2w==
X-Received: by 2002:a05:6402:188:: with SMTP id r8mr7452569edv.75.1624393322624;
        Tue, 22 Jun 2021 13:22:02 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id yc20sm4675180ejb.5.2021.06.22.13.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 13:22:02 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v1 1/5] dt-bindings: soc: qcom: smd-rpm: Add SM4250,6115 compatible
Date:   Tue, 22 Jun 2021 23:21:52 +0300
Message-Id: <20210622202156.546718-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622202156.546718-1-iskren.chernev@gmail.com>
References: <20210622202156.546718-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the dt-binding for the rpm on the Qualcomm SM4250 and SM6115 SoC
platform.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
index d511f01fcac6..d9e97d8bc738 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
@@ -39,6 +39,8 @@ properties:
       - qcom,rpm-msm8996
       - qcom,rpm-msm8998
       - qcom,rpm-sdm660
+      - qcom,rpm-sm4250
+      - qcom,rpm-sm6115
       - qcom,rpm-sm6125
       - qcom,rpm-qcs404
 
-- 
2.31.1

