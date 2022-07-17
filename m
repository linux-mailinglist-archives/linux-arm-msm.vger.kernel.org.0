Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02F1D577394
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jul 2022 05:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233221AbiGQDIf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jul 2022 23:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233302AbiGQDIb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jul 2022 23:08:31 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DCCA14D10
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 20:08:30 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id k25-20020a056830169900b0061c6f68f451so6629010otr.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 20:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xR3y5c4srMI0k5XyH+pLoxzkf4vj+CXbSdSl7nNS6XU=;
        b=rlVnZOb3J/UV8sZDg0O9I8psHbpeW99aBs0bqKrqunfv7+Z18hV9gwQRoHpM7n0XqK
         7dstmPX1Qw7uY8+0Jfbgp+I61ZTcyrIyAPm4GJc3iKjqa9Yd6kZySUVYcHpISmi+PLmS
         RJ0h5eHDCZK9YlvPRym6X74AxbcG3BqogjDavmzWLww3HAZagJAc//pyKvMFFOTFwMlx
         PbuWLJjsC0Q9ZAyZlcuvB1f53Rgnn5/8fvgwrW+wEmCLt9i2hV8Zd96/oaK4wqqncOgv
         Vq96vmVfT5S2a8sj8nIp+IrLsCfL5fduofEaiUK1sefW1c4Cyv/p6CF/p2tVc7UddrL5
         om4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xR3y5c4srMI0k5XyH+pLoxzkf4vj+CXbSdSl7nNS6XU=;
        b=CHuPiLsMDXf2x3HMhpG0IRubdq0KkRumpPvbuZlS/xe9KlXrzBTfxQI8oZxvRWmwYA
         2N8w6UNlH7GmCPR5KJ/Qqi3Z86FsmfMVjNPWveigI/R8EwkaZwG7/3IXiQp8naircSOr
         +/ID1ns51ZnV+8lTkNP97bto5HUGTTtpO7Pfs5gCQZkzmZFMubZqtm5eaIefVP5pgD1g
         jX8uFqcK1udHq0/9jpYtlHaSPk8R5LmP0f4IHiElqWTQYjOJe53dvQYSbST/2kgEpdKW
         veF1v1/Xcy1DYoeNlQwNAXVELtM3JwHnV+wjy0GGf70d1yo9Az5mB2VqjcQOXNmEFcAm
         zAXw==
X-Gm-Message-State: AJIora9QgJQoibu+fnoKB3dj7gsSaOetSRJJMlOAtun3YFgEhQyMzKGk
        x6Dk5hRe7R5Hi30LqSy6msrkHw==
X-Google-Smtp-Source: AGRyM1vDFHDVvYyuorVlMn6sghxgM7CcGK0tgRhwm404+PuwnuhCEj1EptbZZjdSaq9OCQmrkObwgw==
X-Received: by 2002:a9d:76c4:0:b0:61c:36c1:90e1 with SMTP id p4-20020a9d76c4000000b0061c36c190e1mr8714984otl.176.1658027309931;
        Sat, 16 Jul 2022 20:08:29 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z203-20020a4a49d4000000b0043577be222bsm3203928ooa.22.2022.07.16.20.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 20:08:29 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: qcom: Add LPG node to pm8941
Date:   Sat, 16 Jul 2022 22:08:20 -0500
Message-Id: <165802729676.1737676.12212447134864274795.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504205411.1510667-1-bjorn.andersson@linaro.org>
References: <20220504205411.1510667-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 4 May 2022 13:54:10 -0700, Bjorn Andersson wrote:
> The PM8941 contains 8 LPG channels, as well as TRILED and LUT blocks.
> Add a node for these.
> 
> 

Applied, thanks!

[1/2] ARM: dts: qcom: Add LPG node to pm8941
      commit: 5edd7d3e15a46c8549440a0b596c69be7e2c49fc
[2/2] ARM: dts: qcom: msm8974-sony: Enable LPG
      commit: 27f5947894c596fcfd6da20c061c582e7191e9e1

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
