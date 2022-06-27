Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE72E55C6B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 14:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240981AbiF0UD4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240875AbiF0UDk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:03:40 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C51531AD94
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:39 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id p6-20020a4aa846000000b0042599456d32so1196280oom.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kg9Lplck6C1OMqSfFDk+G4buDHgPZV23JpoAqicydy0=;
        b=NonGnbSoNI1BC87eY6LKkuQ7kCQUp2Jd1xDjR/w+nrJRBAmPA7j/aNWx5fChsczAVw
         BX0eYT87O2ioJueR2lzpfLGQb7eU2B+bBgSsn/A3gH7QY8lruzBl2lRV/IVFFLYq0FI0
         sHYOWh5fZ+tRstalFzG7mS9iu758EOG1gkC6ziw1YX8eti/4dgveTLQtng7npAoSP1AD
         pn140eYHWthCY6x+MQUwg4cvZQZU9hHBTtiJnr9wNNq2K7PWME/gZiQvO7TzWMEQXb6W
         0S8Ni9A8itSK1VulCt9KQC2Q5oNGMsfSqaxt9S9UVMvNeaw9ibGaVKJSfkPH3gWwD6YB
         gfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kg9Lplck6C1OMqSfFDk+G4buDHgPZV23JpoAqicydy0=;
        b=fV13YYEXfpF2zlPU8SaKiQYhAfqZ6yduBPNCUor/nLEoLn259ZMDEmtLqwHrCd5wZq
         9xQwM8qlDeqjJUhdhmpHg1zRsgkyKN7vvJK4pQFQQ7hisYvXQYTlkZXXQifgutOd+aQB
         p6zjVye/0k0FSqpCkdTvuKiTy/lre31/9eWfjp4q/6CWA/Yzn8+EN8FBFVtCCLjLrHBQ
         gWwFv1BYxZlLSpkoKwyTuY6xaH/Igb54g/nzivvSMlqBSgN/TTz+Zk+igOy6bsRTu/nB
         kL/WvrtCgTR0ILtzqfGuaoM2RmYKBJHjDGu9b9PN5TYO4/iydDL5OEEmwhLwspqRukK5
         2pUw==
X-Gm-Message-State: AJIora8x/ZHRNjJphjH6DuJHgnGE+A2dYTAXTWSCuKg5WLbF2xySngCU
        hsHmr6V7xn26EjpTUdjRAe4mYQ==
X-Google-Smtp-Source: AGRyM1vxJ8WBOYYFjvttN0XXj2vftx4ZWg8xnp23Pud9EBsHMbFUN2i/tcaFfOEegljMuC5wel7TEg==
X-Received: by 2002:a4a:944c:0:b0:41c:18de:d334 with SMTP id j12-20020a4a944c000000b0041c18ded334mr6498382ooi.4.1656360219008;
        Mon, 27 Jun 2022 13:03:39 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:03:38 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v2] dt-bindings: firmware: document Qualcomm QCS404 and SM6125 SCM
Date:   Mon, 27 Jun 2022 15:02:56 -0500
Message-Id: <165636016349.3080661.7253501335863287391.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220622115109.6724-1-krzysztof.kozlowski@linaro.org>
References: <20220622115109.6724-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 22 Jun 2022 13:51:09 +0200, Krzysztof Kozlowski wrote:
> Document the compatible for Qualcomm QCS404 and SM6125 SCM.
> 
> 

Applied, thanks!

[1/1] dt-bindings: firmware: document Qualcomm QCS404 and SM6125 SCM
      commit: 86b78de5fd4ba550a239dea9cade355fd58efa56

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
