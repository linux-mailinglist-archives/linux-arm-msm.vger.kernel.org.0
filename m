Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2E44EF75C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Apr 2022 18:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245360AbiDAP4l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Apr 2022 11:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350029AbiDAPQ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Apr 2022 11:16:59 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5295749C
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Apr 2022 07:58:29 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id p12-20020a05600c430c00b0038cbdf52227so1634122wme.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Apr 2022 07:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yqbLlrGI5hQozEiXWqvYHfniIQNP30Oy/0VrdHfx3iM=;
        b=V6jnvv6r9YfrqJxCPQR1XE4lXQoRmZhPDn4dIIIzVBExn/Frnd7K88FyQ3Azz/4YCe
         pb5ofMYAupzvIsopvutp/5h8LqWvqPHviJGWrqON/KjZwQmjwY58XoYOLeIxJMd1daXd
         igXzQKXqdMtUL5UCNndmU7iBMC2SnoJdqy//ej5rcFNMasoLMR598HrXFn3iMJVjb5fU
         +76H9dZ62+a6XeB2CAVqEmKGjMiFbpgFyhg9dzu3FM5ETYFde6rBqPxj5/Z5TCFleIqI
         xeHbP/8+XCwa/zzfdo2rc4NsHQw62BC0VFBMESrd65qg1ichA7hFg7AnStI/h0dbf8El
         Lg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yqbLlrGI5hQozEiXWqvYHfniIQNP30Oy/0VrdHfx3iM=;
        b=Dcbd9pPkLR9C3NtIGpeWmwsyUc1ZTt7ks1sCd76ytTwoHHA5pvsy+GX8S/in6Zbimy
         AOVzyDuzB9DB1INgsdKzgDkVKhh68LsqLVxjEGCBbdXTEceykoWo7w7jo/LzX4Se8ix/
         u8f/yb4ajeM3qF7b3O0qWX4YlTfko2wtUQJOV/Acl+NvNLDHmxTjoN+bnnlnBGdl2JLX
         ocP55fSY+KQ3ZjbpvHM6t/TLCAaPVkEdJ/fSTAuN6Eer0Ct/+Ss8+QRThVU93siy831w
         c5Mf8qvumLXjJnLk41/DsUie2ZP6KVrmDmygJ6uNF9sxCS6IdOhVX1MsAfhLSW0e/JNS
         RN9w==
X-Gm-Message-State: AOAM530REVdd8aekxubluWJvbNyiw6lc9ocP2YhaS+61FHc7hiRyEg/T
        aKzhnrVLOTVzK0O3s0EW3XgZTQ==
X-Google-Smtp-Source: ABdhPJxoCjSfUmJbbPFgP2qiKOG3R/tDXS/3ENLP1/9vqNzDjL9anir03X+Nj40T0FEdFVBXe1N2dA==
X-Received: by 2002:a1c:f418:0:b0:38e:579a:da73 with SMTP id z24-20020a1cf418000000b0038e579ada73mr2955585wma.197.1648825107790;
        Fri, 01 Apr 2022 07:58:27 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id j8-20020a05600c404800b0038cc9c7670bsm8530722wmm.3.2022.04.01.07.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 07:58:27 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFC PATCH 2/4] dt-bindings: ufs: common: allow OPP table
Date:   Fri,  1 Apr 2022 16:58:18 +0200
Message-Id: <20220401145820.1003826-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220401145820.1003826-1-krzysztof.kozlowski@linaro.org>
References: <20220401145820.1003826-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Except scaling UFS and bus clocks, it's necessary to scale also the
voltages of regulators or power domain performance state levels.  Adding
Operating Performance Points table allows to adjust power domain
performance state, depending on the UFS clock speed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/ufs/ufs-common.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
index 47a4e9e1a775..ce767bfbf05a 100644
--- a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
+++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
@@ -26,6 +26,9 @@ properties:
       array is "0" then it is assumed that the frequency is set by the parent
       clock or a fixed rate clock source.
 
+  operating-points-v2: true
+  opp-table: true
+
   interrupts:
     maxItems: 1
 
@@ -75,6 +78,7 @@ properties:
 
 dependencies:
   freq-table-hz: [ 'clocks' ]
+  operating-points-v2: [ 'freq-table-hz' ]
 
 required:
   - interrupts
-- 
2.32.0

