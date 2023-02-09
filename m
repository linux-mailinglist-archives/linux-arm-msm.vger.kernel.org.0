Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C30C690A69
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 14:38:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbjBINip (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 08:38:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbjBINio (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 08:38:44 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 057931AD
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 05:38:43 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id c26so1621165ejz.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 05:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bi+cNN8MNydS94MbkJOD784fZVEZBaEhzXHs2Upm2b4=;
        b=D//V/YZZPzXi5NpsjvRuU+/1xhWiGYreIOG++95iz0ga2ChItuLx5keBwUJJkj17Pi
         mWuT+sob8Df6fTEowKjNJM0mJe3g8l+vdFtohCUnOOTcN0Kkw7Vn6y29PzpWxQvdnukW
         ZI0pwcb1r5VJ+uvv9gYeIEWDx4dND7rwHtJu5Cd97cRTGuvy8yZX4uCHOmVYbFEXud49
         nV0QXxq4ZHTs3/kZXrBoEdK8dTBjC6bxzH+s7JS15un58rUAwexbEFoHgV9qRZanHjXC
         X5nfye46QL2e5+b7+PW4Ff0K4oIc5ljKMY85HiJnhh8J0BOFuWLiaNVckWrFO1ib7UFs
         KVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bi+cNN8MNydS94MbkJOD784fZVEZBaEhzXHs2Upm2b4=;
        b=m0FcXuU8DDchkQhynQtTV7mU2OL4w9wBbZN9t2pfTB+BCEQkjd1VjI3QNS63vcpXcO
         Mnt+7E02vt1tKQdLdZ8XIY5CyAUGs3iY/7K4Z9P34tq7+Z9G3Y7Jj0eBxw+Nn3GklGdI
         0DWWGCpUog2w+Oa9wNFqblbPnA9Jt4sSzl9bG5c4bko6WE6djpS8bvlHZJvbGdw1s7P6
         zrY4n5lvCnYrijJb6GKZkDzrRYoZmYy/ZFqBWuJOAxHeTyKHuCnqpHsFGBxiWs4FmDJ/
         K1gYzKS99pvgb9xu/i9X13sQTBRLDdOqUwMGEHTBdecPgDby3nygXTpWYtoiAKbzqV3q
         QhQg==
X-Gm-Message-State: AO0yUKUhJ3Dxe9bo9JBAlLTwSKtdaE+eolx+YXZtJef3HMy78sjVL9LF
        Y84japfnrZF2KyqgVIp6Wyi03w==
X-Google-Smtp-Source: AK7set8jLbfeLd+2o5I0ZlDFcxN9JCOFY4+DgCS7ZZl/vH1aNdZrRRcCE6cR0FSPc0lHJKeI3thAzQ==
X-Received: by 2002:a17:907:2175:b0:88b:109e:fbd3 with SMTP id rl21-20020a170907217500b0088b109efbd3mr12149330ejb.24.1675949921602;
        Thu, 09 Feb 2023 05:38:41 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id cd17-20020a170906b35100b0088f8ee84b76sm885553ejb.105.2023.02.09.05.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 05:38:41 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/6] arm64: dts: qcom: sm8350: enable GPU on the HDK board
Date:   Thu,  9 Feb 2023 15:38:33 +0200
Message-Id: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
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

Add A660 device to the Qualcomm SM8350 platform and enable it for the
sm8350-hdk board. Unfortunately while adding the GPU & related devices I
noticed that DT nodes on SM8350 are greatly out of the adress sorting
order, so patches 2-4 reorder DT nodes to follow the agreement.

Changes since v1:
- Dropped merged patches
- Expanded commit messages to mention the sort order (by the node
  address)
- Rebased on top of latest Bjorn's tree

Changes since v1:
- Fixed the subject and commit message for patch 1
- Fixed GMU's clocks to follow the vendor kernel
- Marked Adreno SMMU as dma-coherent
- Dropped comments targeting sm8350 v1, we do not support that chip
  revision.

Dmitry Baryshkov (6):
  dt-bindings: display/msm/gmu: add Adreno 660 support
  arm64: dts: qcom: sm8350: reorder device nodes
  arm64: dts: qcom: sm8350: move more nodes to correct place
  arm64: dts: qcom: sm8350: finish reordering nodes
  arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and SMMU nodes
  arm64: dts: qcom: sm8350-hdk: enable GPU

 .../devicetree/bindings/display/msm/gmu.yaml  |    1 +
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts       |    8 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi          | 2512 +++++++++--------
 3 files changed, 1354 insertions(+), 1167 deletions(-)

-- 
2.39.1

