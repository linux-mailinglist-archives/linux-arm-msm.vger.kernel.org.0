Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7B2B79BF01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 02:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343491AbjIKVLf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 17:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241527AbjIKPKf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 11:10:35 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2BCDE4B
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 08:10:30 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-500b66f8b27so7875552e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 08:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694445029; x=1695049829; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+4Lw6en/G7eAY/dXOQleYutXgMqbiITZjDVkgmCPcXc=;
        b=XIoN9zrkBukCmC60RH79NC8oB2q/SqLP76jZQYSJciPQiCC3FMYjaHKSj3OJrSHYL4
         6QsyRMqtDNTqeHPBLId9tNcN1Xsu61JBE8LrR1sxARj4oZmGJgBztbaKfXvPrT26jI+n
         m6kC9hk3zI4E4NVAMRts8yafxicYHEx8pArRf8SgJzPyVUMTAZIBexTc3+3i+h9V5opS
         FhRraWZjpsMEYpt++tPoz0HR+dYQkWwD+hWWvkCPl8fTvGkVHQ9VwPBus1frRhDv/qrj
         +44dyYiVWGVz+map16JErrGGTiDrE65ZVLGPmoy193vXkgQLZuL4CfH7ay/AW/WOwNo6
         cziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694445029; x=1695049829;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4Lw6en/G7eAY/dXOQleYutXgMqbiITZjDVkgmCPcXc=;
        b=svgnF1sHG/NaAEMiap25NiuzRdkk+QuscUfrydcZ4+X2FaX4ovAux/Q4RtBgAhinGf
         S0cpudR6hn1NtF+rAlx4t9ktNjtAMc1Zj+dHBu3RH7cnjlkIVjdl5ybe2wkyRLs8Peg6
         qt1z40A1hEg+dCRyvIZk9kmctonZHFgQaBaUcSLHLFyagjh0p8w2OIJjEqwFWyp398MT
         DraKTRWBL6u5zTQXteReZ8zBOBuQZT5CgJ9luxS4RWOeeQUTl4yaTuUr/LZBnHj2UDja
         QEY8uI7xP91scaQAXaFET1gf9kmnoUZYXRavIqrqY8gxyPDJz5G7exp7zblnZwPPw17X
         0T1w==
X-Gm-Message-State: AOJu0Ywcl6i4ZXwWMW+3IGDd6LJBws6518MaJp+G2tSds3lwXEBgbLNQ
        aRL47/wdCK+aYAskyKOJyrqoIg==
X-Google-Smtp-Source: AGHT+IFavcP94e32HF7Ncr/TqfycXZ3Hpk2vzXMbvmM1aRvi8nVzNpi7jKEmhTGTl3eXL9LybNfS/Q==
X-Received: by 2002:a19:e008:0:b0:4fd:f889:b9d2 with SMTP id x8-20020a19e008000000b004fdf889b9d2mr7447694lfg.38.1694445028827;
        Mon, 11 Sep 2023 08:10:28 -0700 (PDT)
Received: from [10.167.154.1] (178235177061.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.61])
        by smtp.gmail.com with ESMTPSA id n4-20020a056402060400b0052a3ad836basm4681281edv.41.2023.09.11.08.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 08:10:28 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH RFT 00/20] Venus cleanups
Date:   Mon, 11 Sep 2023 17:10:14 +0200
Message-Id: <20230911-topic-mars-v1-0-a7d38bf87bdb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANYt/2QC/x2NQQrCQAwAv1JyNrBZS6E+wAeIt+Jhd402ULclU
 RFK/97gcQaGWcFYhQ1OzQrKXzGZqwMdGihjqk9GuTtDDPEYeiJ8z4sUfCU15C7kHGPXt0TgQU7
 GmDXVMnpSP9PkclF+yO9/GOByvsJt23b7REY+dgAAAA==
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694445027; l=2393;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=kUihnr3ZTmtZ2B2pbfbzaaqupk7a/XPe2QfW6jyVH9Q=;
 b=HpjqF1C79k4CoJ8tEjV5C9YAm1P261qYSnuFU8utUBwi4VqYWOZzeQCsX/hjaLTlVi+/FbzZt
 ingx3n9qDFFDBdAFESqNWmGyljiYhLUrcLnjFTXBw/Xl/44FPgEyvZg
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With the driver supporting multiple generations of hardware, some mold
has definitely grown over the code..

This series attempts to amend this situation a bit by commonizing some
code paths and fixing some bugs while at it.

Only tested on SM8250.

Definitely needs testing on:

- SDM845 with old bindings
- SDM845 with new bindings or 7180
- MSM8916
- MSM8996

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (20):
      media: venus: pm_helpers: Only set rate of the core clock in core_clks_enable
      media: venus: pm_helpers: Rename core_clks_get to venus_clks_get
      media: venus: pm_helpers: Add kerneldoc to venus_clks_get()
      media: venus: core: Set OPP clkname in a common code path
      media: venus: pm_helpers: Kill dead code
      media: venus: pm_helpers: Move reset acquisition to common code
      media: venus: pm_helpers: Use reset_bulk API
      media: venus: core: Constify all members of the resource struct
      media: venus: core: Deduplicate OPP genpd names
      media: venus: core: Get rid of vcodec_num
      media: venus: core: Drop cache properties in resource struct
      media: venus: core: Use GENMASK for dma_mask
      media: venus: core: Remove cp_start
      media: venus: pm_helpers: Commonize core_power
      media: venus: pm_helpers: Remove pm_ops->core_put
      media: venus: core: Define a pointer to core->res
      media: venus: pm_helpers: Simplify vcodec clock handling
      media: venus: pm_helpers: Commonize getting clocks and GenPDs
      media: venus: pm_helpers: Commonize vdec_get()
      media: venus: pm_helpers: Commonize venc_get()

 drivers/media/platform/qcom/venus/core.c       | 138 ++++-------
 drivers/media/platform/qcom/venus/core.h       |  64 +++--
 drivers/media/platform/qcom/venus/firmware.c   |   3 +-
 drivers/media/platform/qcom/venus/hfi_venus.c  |   7 +-
 drivers/media/platform/qcom/venus/pm_helpers.c | 328 +++++++++----------------
 drivers/media/platform/qcom/venus/pm_helpers.h |  10 +-
 drivers/media/platform/qcom/venus/vdec.c       |   9 +-
 drivers/media/platform/qcom/venus/venc.c       |   9 +-
 8 files changed, 213 insertions(+), 355 deletions(-)
---
base-commit: 7bc675554773f09d88101bf1ccfc8537dc7c0be9
change-id: 20230911-topic-mars-e60bb2269411

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

