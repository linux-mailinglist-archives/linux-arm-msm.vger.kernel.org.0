Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E065963A8FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 14:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbiK1NK2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 08:10:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231545AbiK1NK0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 08:10:26 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01BA71C130
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 05:10:24 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id n1so8386126ljg.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 05:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tGL1/tdrggNXvMr2jZ9Q2vGxtcVngCLNR9IV1JCZ+Gk=;
        b=eGvVSF1m40CtvQ+98m8E3eYahB3waHJ/yavB56n5EXXDKJOP9rRIj9l/yGBMQs/RFy
         CNZ7nqHg21CbRZ1A/nDdCgdnSoxcXXOem9EBSoWB0RKa2DFETmBkahDzftTbG6U6PX0E
         yClXjXMfGOheBUMzym2X+OPGoTQFgYrLxjyW4pcQde8w+btdnmBb7pc3d+8GeAoQ5Moj
         9bx5gnPT2jBI1esV/iVIEIYH/4Kp72oPlUM1EamATiVyyxoiQHaN7hK8BPX4hTKvG965
         2q1OJGPu8WXXMl0T9VNxDihBGIJp3fCPb8Md0u7p+PflIekT72Lqz6QaPcTxftKfsAmv
         921Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tGL1/tdrggNXvMr2jZ9Q2vGxtcVngCLNR9IV1JCZ+Gk=;
        b=42oLvf5jUO0jWF6XH9TqhLHHnTF/k0xAjXZgwhOfZOv3jRtbxblckVkGVOiNHxde8M
         bkZsZhIDoRYmm8Y+TA/rwYRYpsY15Q2+xZgua3ZGl+UK/IRQAqtrjZkm9GiIl+hMAanj
         PL0haGZN79Cj+CY9HlQNV769PfK17z7mwHgno2TmdGBcSh/28aamYDViniednDxGbBCn
         7i6KGRjboMyZmugUoKKIw1mQV1Gi808BzpFHNi562LNnqyBRZoSOI3//W3HqzWQPA8uu
         Pe+bBEqgyz9JSg0mBxgrWKimzUph378cGIl5L2nk4l4/2X+YR7GxGdU/LSFmdnPH7C2n
         AcpA==
X-Gm-Message-State: ANoB5pk+57Dy9PVyDnnikd1KfiTjLfV3qvkLknlwoMKxWmuDgn5kMUP1
        jbPVQ4O2ouWJDCgg+Fs9GiAx/Q==
X-Google-Smtp-Source: AA0mqf4SUbz1rer4n6sAsKfiprscApKSnBM9ORnL4zBXMtTsjJKggouMOHW+vosybnBvswfmZe897g==
X-Received: by 2002:a05:651c:1147:b0:277:4726:bcf2 with SMTP id h7-20020a05651c114700b002774726bcf2mr15101638ljo.107.1669641019058;
        Mon, 28 Nov 2022 05:10:19 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j12-20020a056512028c00b004b40c1f1c70sm1725340lfp.212.2022.11.28.05.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 05:10:18 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v5 0/3] arm64: dts: qcom: sm8450-hdk: add sound support
Date:   Mon, 28 Nov 2022 14:10:13 +0100
Message-Id: <20221128131016.127860-1-krzysztof.kozlowski@linaro.org>
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

Hi,

Changes since v4
================
1. Patch 2:
   - Re-order few properties between Soundwire nodes, to keep them ordered
     consistently.
   - Drop unsupported qcom,port-offset.

Changes since v3
================
1. Re-order reg and sound-dai-cells.

Changes since v2
================
1. Patch 2: Use lower-case hex.
2. Patch 3: Use ACTIVE_LOW for qcom,wcd9380-codec reset-gpios.
   https://lore.kernel.org/all/20221116053817.2929810-11-dmitry.torokhov@gmail.com
3. Add Rb tags.

Changes since v1
================
1. Patch 2:
   - Whitespace cleanups.
   - Correct include - do not use deprecated one.
2. Patch 3:
   - Sort.
   - Add Rb tag.
   - Correct include - do not use deprecated one and drop q6asm.h (not used).

Description
===========
Initial work (still partially in progress) adding audio to HDK8450 board.

Working/tested:
 - speakers
 - one channel of headset

The DTS patches do not have particular dependencies, however they:
1. Use updated ASoC bindings:
   https://lore.kernel.org/linux-arm-msm/20221111113547.100442-1-krzysztof.kozlowski@linaro.org/T/#t

2. For full operation need changes in Soundwire and Qualcomm ASoC drivers, not
   yet upstreamed:
   https://github.com/krzk/linux/commits/wip/sm8450
   Booting remoteproc without these changes will report errors, but these are
   expected at this stage.

Best regards,
Krzysztof

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Srinivas Kandagatla (3):
  arm64: dts: qcom: sm8450: add GPR node
  arm64: dts: qcom: sm8450: add Soundwire and LPASS
  arm64: dts: qcom: sm8450-hdk: add sound support

 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 160 ++++++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 332 ++++++++++++++++++++++++
 2 files changed, 492 insertions(+)

-- 
2.34.1

