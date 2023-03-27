Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5DB26CAF37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 21:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232508AbjC0T4N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 15:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232489AbjC0T4L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 15:56:11 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB2C41BF6
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 12:56:09 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id n1so4502477ili.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 12:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679946969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=082OplXkEY5V39fu5CZnrzXHheCP3RjKCnYsOGM6dxc=;
        b=eHpfn6mj4N5jaai50bRUtNR5fbUPHcPRLLz9SOpVXM4AO/UjGCoLGQPC+sYS8PuLmM
         /3BcBsQO+HUJs+0Xi9NHLgvtJCl/UmYtSgFThHFVjE4nmcvLSE9xJBJCCm3nOGAZiHpc
         lOdosfU+s/OAtB9DrC0aJ9Wi/qdeQC3x8uUflz3nDHPn3hEjcYIqCgKZfZBu6S+Js9ID
         UrjA8ZWnJnnWnO4bt+quj9Ij0t6hghiWEc3k4hlhC5K4v1J00kS9WEaT81nvJV2vTkea
         0/WavCCJRacRzf4Te7/vuxWlRmSjPnGNjGCB6RcKl9j/gf493mEZuqeyP+N2RATwUmZc
         bn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679946969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=082OplXkEY5V39fu5CZnrzXHheCP3RjKCnYsOGM6dxc=;
        b=PKQaUkREUZCRDhEfEBkWg2P8hQmPRF0vJ3l0Rw+kERwRf/gr951eAqtbO4rxl46oXM
         YsAQ/pRTogZB0Y1OedBHZsx4V9bm9DgylsbL34gD3BdSJnHi2Kp0+P7PX6k6UwLmQxL8
         qVMYvDPienTofQ7621/EdT5RN95ExicjzlIfBUkEN/EoC8EDd23I7ONu3wY/eZizW2hq
         tETMWJHdFnaql8lleFf3b90BqHmuvqlNtb9kUPfgdiwub+M3Yhmc9aCErKg9kvTl8kbx
         wl6WX2RI+qipzK70XaIDYyve0PhgiQ8BUPh/nR28PLkFejPNk3TFJUVV+CkBzBXjbFe6
         /n6w==
X-Gm-Message-State: AAQBX9ezvFMgBf3MWrFyqOgQNZZ8jMZdWKswv6hc+KBMdCfYKPY9Jm+5
        foJ1IFQRphlpogjvdPpJU5AjGA==
X-Google-Smtp-Source: AKy350aDsYzj8FP8jgv3NVQu7SXbKFq2G9sdN3wHQMso5rRqBm26SKnch0AO4YG2I2vasQ5WG89sZg==
X-Received: by 2002:a05:6e02:107:b0:315:34b8:4c6d with SMTP id t7-20020a056e02010700b0031534b84c6dmr10642592ilm.17.1679946969236;
        Mon, 27 Mar 2023 12:56:09 -0700 (PDT)
Received: from localhost.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id a18-20020a027a12000000b003e69be53404sm9011984jac.150.2023.03.27.12.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 12:56:08 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org
Cc:     quic_rohiagar@quicinc.com, caleb.connolly@linaro.org,
        mka@chromium.org, evgreen@chromium.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] ARM: dts: qcom: sdx65: support IPA
Date:   Mon, 27 Mar 2023 14:56:03 -0500
Message-Id: <20230327195605.2854123-1-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The upstream IPA driver now supports IPA v5.0 for SDX65.  Add
IPA-related nodes and definitions to "sdx65.dtsi", and enable IPA
in "sdx65-mtp.dts".

Having touched these files, Konrad advised I should update them to
move the "status" property to the end of nodes where it is used.

Version 3 of corrects an address in the first patch that caused a
"simple-bus unit address format error" message when building dtbs.

Version 2 of this series addresses comments made by Krzysztof and
Konrad, and adds their reviewed-by tags.

					-Alex

Alex Elder (2):
  ARM: dts: qcom: sdx65: add IPA information
  ARM: dts: qcom-sdx65: move status properties to end of nodes

 arch/arm/boot/dts/qcom-sdx65-mtp.dts | 11 +++++--
 arch/arm/boot/dts/qcom-sdx65.dtsi    | 47 ++++++++++++++++++++++++++--
 2 files changed, 52 insertions(+), 6 deletions(-)

-- 
2.34.1

