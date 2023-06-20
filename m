Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA23736AF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 13:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232506AbjFTLaH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 07:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232225AbjFTLaG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 07:30:06 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A6C3130
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 04:30:05 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f122ff663eso5980819e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 04:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687260602; x=1689852602;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S29GAOwwZU/UObQHm7K1yfmLnNLJ0R5m3hwbW5Fh5rM=;
        b=bTHzG1h+kD6J4+vhZGTHsDyQ7K9hsvawjTM8WE0Y53ykw8hcvb33uM/nwcsw9F1zeq
         9Qm4mrsxdOXq4zyXtZ13fmn+xqzbMBpL7QcIdWZMFb8mFPO2f8/xfle2z8/Vneebn5js
         aypBK6IFASC/87S/DLQjnkLRr2dkPMxE6P6ppFcR5sXRoZwijyQjqSikNtcoHWtAB7Fr
         lr1fhfjnnkJPyKCylS+BVb+BxD3trYNhV+B9hplhpSMFhwnZvZJP631l4UPfLlogvATX
         eLfeZUgszbL4qoQM1uwF5Yc511j7pNni5TVMP5sWq3C3167ZSvJVa8avuVDIz889LByE
         bdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687260602; x=1689852602;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S29GAOwwZU/UObQHm7K1yfmLnNLJ0R5m3hwbW5Fh5rM=;
        b=ZyUFfwC/Vc2GrkD0hlftBeRVdTxly+axrhID8x3OIRZHI1hl9LbE8mB6S5LjLUo1JV
         xLVMLeouwJeQug2nzDEgm1r1G4uVH2e1IwkLjJG6fI1cf+ROucYo/KU03LHR4MjlGr1B
         Iun5yzES7KegscMGW+lhvAQm6IDeRuir0bv0OjWX72zqH5PGZN6vxLR2S+Vj2Fg4FY4z
         UWpJlvjzilgHHYYKsMkvK7BM5CSF+9yli18VnV7QbeSxqhxPXbTmrUv2lCmXrU7yH7Gs
         qlHTvsuV/yZ1Xyb2eUy4utbgmCgQgjGy8xeQeBrIJEhpiQ5gIGjlqF0vHjGScetW25Qh
         ZjOA==
X-Gm-Message-State: AC+VfDzA2E4gozsaFnhTsp3DhNqJdLMonfJYmS7o3I8ukZth/30QjIgW
        0DqEJ8bbSFHez6EkfZS2m3KOBw==
X-Google-Smtp-Source: ACHHUZ6QUJ2NUSmwlMllnTnlwhUMH00U8cch0Y7x4JBrv6lDEvgv8KA6emtEHyH6UtWTECxcKatUAQ==
X-Received: by 2002:a19:5055:0:b0:4f6:14d1:596d with SMTP id z21-20020a195055000000b004f614d1596dmr6541924lfj.61.1687260602313;
        Tue, 20 Jun 2023 04:30:02 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id 8-20020ac24828000000b004eed8de597csm335709lft.32.2023.06.20.04.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 04:30:02 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] DSIPHY RPM
Date:   Tue, 20 Jun 2023 13:29:57 +0200
Message-Id: <20230620-topic-dsiphy_rpm-v1-0-446a7fd0ce43@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALWNkWQC/x2N0QrCMAwAf2Xk2UBXRcVfEZG0jTYwu5KoKGP/b
 vDxDo5bwFiFDU7DAspvMZmbw7gZIFdqd0YpzhBD3IZ9DPicu2QsJr1+r9ofyLQ7jodEhSiBZ4m
 MMSm1XD1sr2ly2ZVv8vl/zpd1/QHd37O+dwAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687260601; l=636;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=wCUG/R9HXWMnAwuGxYhXrhmjszSC6nEVuCGugxXUvag=;
 b=oLojyqv8R2Yxb/4Bx0OPl53gbOYVtZGEvfDiYfytg8gFL3uXbs/agnHkUqk3yiONeq1e1qWA5
 xXDfhniDSFOBXQOoH7SqEunzIznVpy6eWLBLQDUMiYekoP0h3tuhm+y
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
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
Konrad Dybcio (2):
      drm/msm/dsi: Use pm_runtime_resume_and_get to prevent refcnt leaks
      drm/msm/dsi: Enable runtime PM

 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
---
base-commit: 9dbf40840551df336c95ce2a3adbdd25ed53c0ef
change-id: 20230620-topic-dsiphy_rpm-ea4817badaab

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

