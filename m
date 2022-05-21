Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 077BD52FF69
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 22:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345742AbiEUUfZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 16:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240502AbiEUUfZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 16:35:25 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD1FE3917C
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:35:23 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id c19so6471674lfv.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wyu29O4vbuOVcOvLqIlFC0WcvehDVW1zIPP03IpVfEw=;
        b=BwoOwiRjyuSrf6M4weFPP/uBKTzLYCIaWZ9rViBDY6kjzG7xTVLBZQY/wcS4h+wtxm
         AeyLAHR4fZ6N114UgqI9loxfHpRhXnpqoReOVlhLMI9uoppf4fI/UqGgTy1tnzOfiATV
         H+41SgwC8PXaTWB1+AR/zOmmO87ptNpAD9o6XlVgxSAuHwAQucKijtbLCYGxp/637Q5e
         wQ3GeDm3soH1NIxWsAukqlTfzvSm9tMc076Lu311DlNwSij1Er09KWQc0hkEzJSd18u7
         QqQvLEw5EDGtZsNXVcoV3pOkSVviaRkv2FMdXJKrMxJDOD7lUG8XjCWZ1u8ehUI2UEik
         pItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wyu29O4vbuOVcOvLqIlFC0WcvehDVW1zIPP03IpVfEw=;
        b=dlmNBuphMMGdZDelpJaCGnZf0e4jGOp42KoL+SVwoA6acXuCtqxYlVwd9bNQLmBmTK
         sX3x+Cn9s1mDWIw2xddSXYt7r4ZrbIsOZkxBcPTRBjKLsI3BHdG+WBH9OPlwD9/bansZ
         D8BcDZbjCxY3c4L41TK/bERnVLkuIVlI84wWULVdS+/KWQ6Ek+aiSrVh8iCeoTJ7xbu1
         zVuVFbGwdIsrh2Vls86v2w0ecJHn+8LzHUS34eyanLuNNIrqLVlmi2goGJrrffoxK8E0
         gIr8TjBkkIzWJ1dgX39PIE16g03UDV85jeKC3X20R8FltfutCjqsx7jCeGk/VtLgqHBg
         HJ/g==
X-Gm-Message-State: AOAM531wsJnPgUehgSUWK+T/espK8GPSArvv9JvVxS+k23uljbVsAGZK
        Wi4+WFNi+gsE9CE9LXfalZGrLg==
X-Google-Smtp-Source: ABdhPJzQvc8gBXS7d3lrkkU9bjcpWDMZdRsIj25fWJfQ49DUIO3NL5NoGqVtqbNSZ3CgjWEd9/WBgg==
X-Received: by 2002:a05:6512:3c82:b0:478:5dde:4865 with SMTP id h2-20020a0565123c8200b004785dde4865mr3430309lfv.424.1653165322175;
        Sat, 21 May 2022 13:35:22 -0700 (PDT)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id q18-20020a056512211200b00477930c48dasm1179729lfr.184.2022.05.21.13.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 13:35:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 0/4] arm64: dts: qcom: enable CDSP and MSS on ifc6560 board
Date:   Sat, 21 May 2022 23:35:16 +0300
Message-Id: <20220521203520.1513565-1-dmitry.baryshkov@linaro.org>
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

Add support for the CDSP (existing only on SDM660) and MSS remote
processors (SDM630/636/660). Enable them on the IFC6560 board.

This patch series depends on the main IFC6560 series.

Changes since v1:
- Account for the sdm636 platform. Moved all common device nodes to
  sdm636 and added cdsp to sdm660 only.

Dmitry Baryshkov (4):
  arm64: dts: qcom: sdm660: move device nodes to sdm636
  arm64: dts: qcom: sdm660: add device node for the compute PAS
  arm64: dts: qcom: sdm630: add device node for the modem PAS
  arm64: dts: qcom: sda660-inforce-ifc6560: enable cdsp and modem

 .../boot/dts/qcom/sda660-inforce-ifc6560.dts  |  10 +
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |  59 ++++
 arch/arm64/boot/dts/qcom/sdm636.dtsi          | 253 ++++++++++++++-
 arch/arm64/boot/dts/qcom/sdm660.dtsi          | 292 ++++--------------
 4 files changed, 374 insertions(+), 240 deletions(-)

-- 
2.35.1

