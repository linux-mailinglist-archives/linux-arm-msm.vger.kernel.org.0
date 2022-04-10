Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40EBA4FB048
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Apr 2022 22:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243958AbiDJVBT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Apr 2022 17:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233232AbiDJVBS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Apr 2022 17:01:18 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9082437016
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 13:59:04 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id q189so1271325ljb.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 13:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g3Vj95qK5L+nX53EL/j4u6NkAUtmdPs/qhxL4ODa228=;
        b=OVMScrL59CTZ7Lr3EhYdmQ5vRHx/3yS+Ql8xvaRz8YmTOE+W2hTidhvr+i2pZ0NBaY
         d86L4RChjA3R/1K7gg/nG9ia9E8dicOVVcdI/hIOZSFqli4juWfeCrElUxXVTv1cZjff
         kvM9L5Z79fQYleMB6fTJK1qlAqnHnWvTnXn44AFnFRMuF0gFlXre3E8OhcpFt/gYbKlH
         A/6KqXWIu/rArG0J9Vql6MQaBV7Rs52RsUzdUwTYRbTrhkC4l40u+rkcExZaLaJweBxu
         yvPkC3Jx33gsd+BnPOEYVe7N2WdyMLBlOo1AcrHyVzq4blt54111Q/kySktaeWZYff+j
         NCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g3Vj95qK5L+nX53EL/j4u6NkAUtmdPs/qhxL4ODa228=;
        b=0j4tm7Y33eBBfoCmpkYMk4z5/wkJZd+DgiTNI3Bkaw9x5apD7YHnclikngAIsj3gJF
         E97+srTKuA0XAJPutLlFkihiSy/BNWvhuLXHYN3d9Ru23EsUxLSsQ1BrURLcCMDlBgYe
         KnA2E34cd1lbYz/xDIpSI4aIgcD7d9SGbhFDq94OhFQzHFNbeYrSwpz4xl08JcKGI74s
         sqJY5BzMHJm8AhD9rV960bxNaMzkrpvoxxA3AVLtQVyP1j/F/p/Q/rcF5yi6xNxnwZx2
         7XIuo1FpaSoNAFqdLFMsEreIw4eGI0qTk9JE0GrQfTbA6c7TbhJSje4dOE74rEZlc5M0
         U4BA==
X-Gm-Message-State: AOAM532Uojb64B9ExphHxEhZOHFR9uq8gBN2raAyd+QV/SN+nrDfA3kJ
        Ny4ZEHbBLuTpqZp2NPkj9N6pGsroX9WfHw==
X-Google-Smtp-Source: ABdhPJy0EDNTeLKR9oN8K6CQltHt7tzwMJVDRGBNbAanxs059FnnHE6lIvb9lpTCki0hpp/k02kK8A==
X-Received: by 2002:a05:651c:17a3:b0:245:f39e:f2d2 with SMTP id bn35-20020a05651c17a300b00245f39ef2d2mr19150610ljb.490.1649624342738;
        Sun, 10 Apr 2022 13:59:02 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t17-20020a192d51000000b0044a5a9960f9sm3114809lft.236.2022.04.10.13.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:59:02 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: qcom: sm8450: enable fastproc and DSP nodes
Date:   Sun, 10 Apr 2022 23:58:59 +0300
Message-Id: <20220410205901.1672089-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
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

Enable DSP (remoteproc) instances on SM8450-HDK platform. Add fastrpc device tree nodes.

Dmitry Baryshkov (2):
  arm64: dts: qcom: sm8450-hdk: Enable remoteproc instances
  arm64: dts: qcom: sm8450: add fastrpc nodes

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts |  20 ++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 119 ++++++++++++++++++++++++
 2 files changed, 139 insertions(+)

-- 
2.35.1

