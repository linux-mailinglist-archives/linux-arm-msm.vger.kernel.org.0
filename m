Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 874C265DCED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 20:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235259AbjADTiR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 14:38:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240246AbjADTiD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 14:38:03 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AF8410FE
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 11:38:02 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id i83so18521330ioa.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jan 2023 11:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Op+CSODDgA7gYctUurMTZjWcainGafNK+wkXHM2pWJE=;
        b=xoO0owRnugC4wYhTySKnrSg4YL1odqmcABTU4VGByBNKTWnR1PYs76Pg7A+oh44Bvy
         cG4amKkT+TdOOCF5S9pMhFTytunXodyc8oAAmEW6HqCcP07BHZLX2QJANW4sc1ULRy+S
         KM7yuV4GWbom/8FCfxPwrqFwhLYKScseZixzscLVSKJ6KI0jR91ig4qfIye0UWwY1nrT
         oPhE1NrB7Z5QrViZ6gn+CYnIr5EzMSuB4hcZ2bZfBkohSSRy3cj+59bdsipoeYItWW0j
         n2TiAt/lVnd24pZMXqLApTAFrPwtbcaOOs/HBrAISxKJhadm9HzUbBxB0/RjjoLn0/em
         Tx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Op+CSODDgA7gYctUurMTZjWcainGafNK+wkXHM2pWJE=;
        b=cYl0sFDVi+niwvWslgnVmagqHPFx6RxvRMaZ+BU7v1ynb0OvB+REeimCcYxXyk1zRO
         U7qGyOgAnll5rfVE9vCZsiJp5pYxNC1p2xqSyQv9aOMNQs38JnLNZoGBsMUGklO8z5xK
         4EAsBfseTcCluGyIUGKsTO8xkzokaVNCOgnmesQOprlsXSKaL+/5vguB5VS93shd+vkQ
         DLOZ5DAUcqRCSoZOs6+V76Keu5aUOwoFjy0WsW19WMuwUN2nyY6UxhfvyGCs58A3hBcV
         qXrKPa6h6VvmFsIDCTHdyYIgCsHDjKn5MmtaEffGbhnNAcvMvzKoPiO3YftNgGWLIS/A
         95nA==
X-Gm-Message-State: AFqh2kqBJHLxHtzJdJfuiLs0mN6iB3nOJI8lLizev2wqsnlaK8nXf9Wr
        pFEGAXtcVkwwnxKQux+8GI4zbA==
X-Google-Smtp-Source: AMrXdXvXOYePefoLcfACXniOLtUOi34WPdbQg+J4EpRP05K1W/t13OGOVmV/CAqEw9TlyHQq7QcwTw==
X-Received: by 2002:a5e:8808:0:b0:6e2:af6e:3b58 with SMTP id l8-20020a5e8808000000b006e2af6e3b58mr30964640ioj.12.1672861081717;
        Wed, 04 Jan 2023 11:38:01 -0800 (PST)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id h13-20020a056602130d00b006cab79c4214sm6972498iov.46.2023.01.04.11.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 11:38:01 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     andersson@kernel.org, konrad.dybcio@linaro.org, agross@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     luca.weiss@fairphone.com, caleb.connolly@linaro.org,
        mka@chromium.org, evgreen@chromium.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: qcom: sm6350: enable IPA
Date:   Wed,  4 Jan 2023 13:37:57 -0600
Message-Id: <20230104193759.3286014-1-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable IPA for the SM6350 SoC, which implements IPA v4.7.  Enable it
on the Fairphone 4, which incorporates IPA definitions used for the
SM6350.

Version 2 of this series uses the new "qcom,gsi-loader" property to
specify that the AP should load firmware on this platform.

					-Alex

Luca Weiss (2):
  arm64: dts: qcom: sm6350: add IPA node
  arm64: dts: qcom: sm7225-fairphone-fp4: enable IPA

 arch/arm64/boot/dts/qcom/sm6350.dtsi          | 47 +++++++++++++++++++
 .../boot/dts/qcom/sm7225-fairphone-fp4.dts    |  7 +++
 2 files changed, 54 insertions(+)

-- 
2.34.1

