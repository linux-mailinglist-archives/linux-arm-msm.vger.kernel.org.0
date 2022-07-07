Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC44B569831
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 04:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234792AbiGGCbt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 22:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234905AbiGGCbn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 22:31:43 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5C52F3A5
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 19:31:38 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-10c0119dd16so12676256fac.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 19:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/7ogWT1H+ImLdlMfj6ihg68dfaIA8LvRjdhEJWHmmos=;
        b=Ha1SEmr6NNv8/zaLmbB10i4A3gZczVKzg3ROq8Q2hQZG/f4nn+jzxVFP/9pZSr7pGx
         KkoHRTpPjj7lRZU9lhT8CDlK85qohpzUMHDNCeM2fLyfscQmSmP2Jz/sybBqtxpEZx20
         aRypXM6AO3o5OMMwKK+m3nXQpXZwIKbvoIxWCZ96WG0ezMyd89heLAifA+FGs1HsSCc9
         HGbCh9l2f8WGaauL+fDTrUWFLHFddyfVuBa9eK9JnqGPp0CIyg9ifXLEZnbq3zOns12t
         bnxD4j2Fs8ECG7C5+T9Cj9cmNJYV+j1APEobObYxeYSl7bsfFCGO+TZW14t7MCmmsnE9
         PjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/7ogWT1H+ImLdlMfj6ihg68dfaIA8LvRjdhEJWHmmos=;
        b=YlWQIlNO4vj4N2z7bbo4PHhbFw+1BQJ64vlIyw9w+U9mBSEc3J9vpOOC63Gclm0YVc
         vvcebxRfk6kwr1Otnhds0WXrbmH2+itfKEtODU2u2IM7GY8NaZjlIOJCN/p960jUn2gL
         O24mgtt5eZzwFh866G2y4JhyJuSElecz0V1HCjK/UStFJ/O7ia2OsydQd7+7UMYilCm0
         ys38w1NtZgFqKmDgINVJ5S2xdfFL2JIhG9tpG5ER5jLwkHMYHpYC1ZAS3FU5/S0BxDCf
         qgH1wP2q2n9sUmUko62XSGpXiUTqnMFLTbdXsnC1PMHo3jhEVDA/nEFrZHLLVYvh+yAU
         dlFA==
X-Gm-Message-State: AJIora//v5sKkUmYG+Db0bbrY8lQyDYySRAXnryrPKKMzFCEIuw/iKxn
        Y00tY+ZCkNW1ol8NuseYMrPyo9V/AWxvQQ==
X-Google-Smtp-Source: AGRyM1tJ/NV6sY/Sib1jTLGkAvhHU8oaQ91IY8F50p5vMraG6h3T4Vd7wLxb0BPP2Ymd8v6FSyB1BA==
X-Received: by 2002:a05:6870:d627:b0:10b:f479:7fe4 with SMTP id a39-20020a056870d62700b0010bf4797fe4mr1271236oaq.82.1657161097876;
        Wed, 06 Jul 2022 19:31:37 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x48-20020a056830247000b006168c71ca4asm17024469otr.56.2022.07.06.19.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 19:31:37 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Stefan Hansson <newbie13xd@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: qcom: Document lg,judyln and lg,judyp devices
Date:   Wed,  6 Jul 2022 21:31:15 -0500
Message-Id: <165716107314.864223.7777729041436224109.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220626164536.16011-1-newbie13xd@gmail.com>
References: <20220626164536.16011-1-newbie13xd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Sun, 26 Jun 2022 12:45:36 -0400, Stefan Hansson wrote:
> Add binding documentation for the LG G7 and LG V35 smartphones
> which are based on Snapdragon 845 (sdm845).
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: qcom: Document lg,judyln and lg,judyp devices
      (no commit info)
[2/2] arm64: dts: qcom: add device tree for LG G7 and LG V35
      commit: 28ae8aa3923c394c8efa8e6439c0f84fa42c96fb

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
