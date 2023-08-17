Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D579977FAC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Aug 2023 17:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351793AbjHQPbZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Aug 2023 11:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352652AbjHQPAM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Aug 2023 11:00:12 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C280F2D7E
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 07:59:48 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5254f9eda36so6816097a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 07:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692284382; x=1692889182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7cbonIUO9k6Z+IRlK2Q9DZPwI9fbtSbJaIBTTDnpXJk=;
        b=bvURTGxPiaEsoW2gStRUIiIUL1nmpH9aWh69Jd03Mbx/clTMRyGpkrpPMLGNg1vfNw
         t60axJ/0XPgoW6RwmVzKTchAtH89Wf3xDZTBDFmIkQTlMsgpN6yZC0WqqpeLxe43mdjg
         ImihLUer4BFAWQZDUCa0WsRSPLLMFvtkBQF9GrLDErYBMlaNiT6mP6P4Tcs7Sm8OGfbE
         91zkigZhdOfDwR0bR4E07wH5Ok0S0DTzBd6iWisJKQIbn1Hnj2RGI7VFCtJDjuPvfSRa
         41N2ReFCUMhwKNP4uDOD/0CAA0O1AVNOWrMrETPpm5czoV1gque6ifzp2MBaDqYCH1FF
         UQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692284382; x=1692889182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7cbonIUO9k6Z+IRlK2Q9DZPwI9fbtSbJaIBTTDnpXJk=;
        b=keLdeWtCDh/WJePhq8aQ5gdBEzbeHrf09uqP/zVyUccKxcor3g7rKI78/p51hVPO4j
         HCfhB8R7kZs20K44LselU1kh86Mye9Z5hvy6sf6QcZwlkg1mNneuZNKgyoCLJCV3kPxR
         0ttrGOM+LIB6ubcR+6Qj2/LAlW1ueWgDpzFnwimmQTr+WY/pBT7wlmNfHZk1+hcXGcCJ
         krOqmVcBc2YBMFY9/iZoS97iOAV3rAbgz5Jf1CozyxP1a0r+kH6cz9MuFFxLlbKpcm9/
         2jNGP4riHNTMeGNdbr6lH4purcH+vu60bBlTK/Ys1nZy50cjVcLqCP9O/u+NrYI/7Ym+
         LQLw==
X-Gm-Message-State: AOJu0YyZ3JYDpwsoU9kKV95SieWHd8SHSBattlBeKxDiIBR9WDd4uv4D
        zuXPFdWUyG1//UopaJGa2gHFRA==
X-Google-Smtp-Source: AGHT+IFobKEdN20qtppJzG8TCXzVIQ4fmQ2hZKkbD/f9l/zI2ykDbRkXuG4GeVNDpLJ3yFMy+MmLAA==
X-Received: by 2002:a17:906:768f:b0:99c:4ea0:ed18 with SMTP id o15-20020a170906768f00b0099c4ea0ed18mr4219514ejm.8.1692284382349;
        Thu, 17 Aug 2023 07:59:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id lj9-20020a170906f9c900b00988be3c1d87sm10233557ejb.116.2023.08.17.07.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 07:59:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/4] arm64: dts: qcom: qrb5165-rb5: enable DP support
Date:   Thu, 17 Aug 2023 17:59:36 +0300
Message-Id: <20230817145940.9887-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implement DisplayPort support for the Qualcomm RB5 platform.

Note: while testing this, I had link training issues with several
dongles with DP connectors. Other DisplayPort-USB-C dongles (with HDMI
or VGA connectors) work perfectly.

Dependencies: [1]
Soft-dependencies: [2], [3]

[1] https://lore.kernel.org/linux-arm-msm/20230816115151.501736-1-bryan.odonoghue@linaro.org/
[2] https://lore.kernel.org/linux-arm-msm/20230709034211.4045004-1-dmitry.baryshkov@linaro.org/
[3] https://lore.kernel.org/linux-arm-msm/20230817145516.5924-1-dmitry.baryshkov@linaro.org/

Changes since v1:
 - Rebased on v9 of Bryan's patchset
 - Dropped merged dt-bindings patch

Dmitry Baryshkov (4):
  arm64: dts: qcom: sm8250: Add DisplayPort device node
  arm64: dts: qcom: qrb5165-rb5: add onboard USB-C redriver
  arm64: dts: qcom: qrb5165-rb5: enable displayport controller
  arm64: dts: qcom: qrb5165-rb5: enable DP altmode

 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 72 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi     | 89 ++++++++++++++++++++++++
 2 files changed, 159 insertions(+), 2 deletions(-)

-- 
2.39.2

