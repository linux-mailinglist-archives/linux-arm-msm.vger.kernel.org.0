Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C652A736B46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 13:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbjFTLnk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 07:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232719AbjFTLnb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 07:43:31 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54C51711
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 04:43:29 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f86d8a8fd4so3367798e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 04:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687261407; x=1689853407;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yFjVYI1irYbFocslsO72gB812nuEuRnfPK62Pbok9EI=;
        b=XrLh4GtEgxMgS393kJtNt5OQY0aDhepU5WL09MdOh1LQOK3Oqi1HUyGdV2/Zq3Hs/V
         EkVP/iYzcHMeN5Vc4O0UrLNrp7scbfHeRTCxP2jBDBiwjslhDzlEeXTocH4J80ewj2fZ
         w4VEiWUGm2zvXlnimoWvD9WGDr4d2Ar0uB/8aVQ3hGUjiUiv/AJsD8bx7uF1ElMPYCWT
         DeORGnLHQ7L6TH0WqAVRfM0qTDo5Bz7WPwEiwLr+9m55wwS5chqny3z0si7MPMe7rNLc
         650MSRPhll89NUc2DCwQD8fSElv5dyZSk3H1RExZAvsTFecGbaCxx2bjML8e5RrOKkdk
         dy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687261407; x=1689853407;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFjVYI1irYbFocslsO72gB812nuEuRnfPK62Pbok9EI=;
        b=d4v1oVkG5SLqVWeg5pdaM4FLdCd50pmgD03yrjF9+ht3GyRWWFdWWlJP/8RIjITlA/
         yqnDYHz9BXjNBITO0iPJ07J/UsmcXueGrXxYuMnArs7WW2WfGW/hVyAENvY6QuYVpnjW
         Yk9AY3Ttpvn1fapJqbn8Xvu078Mjysq3O9jPLv3TG641YnV/A3M6wzA6WaffR2Qkc8sh
         oRNR+22ESUUc/1tOlJp/aApGiYS7xamtVRQa5K7mdW9Ak0SwOhwzeBnrtYy9XXDmTL1a
         iD1v1IwbKJV9sTHcFi/CfniwnndrrQBjanRlXS/OaB0VLB3I+/ZKziokg9TOanK9BtOF
         hkAg==
X-Gm-Message-State: AC+VfDyq5JRjnAD8Y0k6LSxng5WvQbS3o/3MJUjCtavPFbNnmq6tgt4s
        3Srnrcyq/D1p5ugfltvmOqHKIo7O4JzmFefzAdA=
X-Google-Smtp-Source: ACHHUZ6/zbNT84dvZPx5FuH84yDbxzL+iq0IygijC8MFVxqnZykx300gyiMJNaSydsImlZbkT2CAlg==
X-Received: by 2002:a19:7b02:0:b0:4f6:1b45:e8aa with SMTP id w2-20020a197b02000000b004f61b45e8aamr7160691lfc.50.1687261407277;
        Tue, 20 Jun 2023 04:43:27 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id v17-20020ac25591000000b004f640b0fb04sm324158lfg.212.2023.06.20.04.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 04:43:26 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/2] DSIPHY RPM
Date:   Tue, 20 Jun 2023 13:43:19 +0200
Message-Id: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANeQkWQC/32NQQqDMBAAv1JybkqMQUtP/UeRsklWXbBJ2Fipi
 H9v6gN6nIFhNpGRCbO4nTbBuFCmGAro80m4EcKAknxhoZWuVaOVnGMiJ32mNK5PTi+JYK5Va8E
 DWFEyCxmlZQhuLGF4T1ORibGnz/F5dIVHynPk9dgu1c/+OSyVVNKYBtreK4emvk8UgOMl8iC6f
 d+/fu/i+MYAAAA=
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687261406; l=831;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=FulnHTQVR5IFvYXocwRssbKvCfyBHt3fJGnSrpxUdHU=;
 b=RwTKpnvDySD7/pCybHeBMO9p+5NXfvNwuLdf4wG8fFac/2KFlHw/l9iCggnqrz+o9+fnosUEP
 i1M5ashWbOJDihGRvlR96hGHAgOFSGt6TUoJauT2lplP1ORUVca6mJi
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some recent SoCs use power rails that we model as GENPDs to power the
DSIPHY. This series attempts to make such configurations suspendable.

Tested on SM6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Improve patch 1 commit message
- Add return value checking in patch 1
- Link to v1: https://lore.kernel.org/r/20230620-topic-dsiphy_rpm-v1-0-446a7fd0ce43@linaro.org

---
Konrad Dybcio (2):
      drm/msm/dsi: Use pm_runtime_resume_and_get to prevent refcnt leaks
      drm/msm/dsi: Enable runtime PM

 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)
---
base-commit: 9dbf40840551df336c95ce2a3adbdd25ed53c0ef
change-id: 20230620-topic-dsiphy_rpm-ea4817badaab

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

