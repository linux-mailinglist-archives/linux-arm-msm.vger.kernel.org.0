Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8CAF4C6FD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 15:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235514AbiB1OrR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 09:47:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234967AbiB1OrQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 09:47:16 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C607F6DB
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 06:46:37 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id z11so2521209pla.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 06:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LukGO9EKDfuKLMTBb9aasvI20+8I/ji7pFi/y/A0Jo8=;
        b=ZIfZjg0WNp/WEgr0Jk4v5ZYuQvspvMMnqt56Ww0RNwBcnBmWBzpG6lrQSJKvK6Gn1M
         03uzC3G30/VQFFNe3ad5RED3MBX/87VJ2gb778gtj9C5Cu47n2KPzswtcZQ1MO5IDFBQ
         YOqIIZYGhIgixXi3NiC65wwr+e58N7NSliJRaJRpjm/c2UDcv3ez+9XTZlaulQ+bV/1a
         T4ciFM6thxl1K13NpIr32I+3I+hRtl1ZkVKFcDM/zLV8EnyGf7E+HeiSR8whi/0DzGwl
         z1dhCiI0FvfwW50ioD7py0Hd0gzkZmStiT8KXlzImU595vJ8dht3bmu8NN1mycXZTGfx
         RXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LukGO9EKDfuKLMTBb9aasvI20+8I/ji7pFi/y/A0Jo8=;
        b=aoxy2VPnFZ1f9LCw7zNAnXE5f/NEEp/a/PFGZXoGW6MP5rq9rMP32Hy4hcg5MDBdcG
         OdUTT8bn/o6mpntFS/E4+hgem+4e8R5p7y9KG5ivoU9KWG1kLoOO8E+bjZvGviobm1q5
         dLMSjSE+LFBWGTGBXeaUjDMuYt7CMF3pPiIWMWzMZTG1N8ly+TCis5BAe72hiZWf2Slx
         R1SLD/WEa9PguH+tB9jrGDD49gVaOpbYAhrPqWIwpnfl3pauzOP82pbzRXX4ns3rWMEh
         Sv9PGi9D6047NzHqwzfwS4Vo0aVjUriWgX7GFdu6qPCg5SQR3IVYu0hRZ7y+oRISwr1F
         NH0g==
X-Gm-Message-State: AOAM531tq/AbkrV6wHX5VFWwG1rDvl1fFRZtzVi2DyhreNmNSdGHq4ef
        ywAko8fJ4GLZ/O1C1grXlabTmJzUwKKB2Q==
X-Google-Smtp-Source: ABdhPJxZjGU9UrFMc3hPEyGTDQWZS4pVnqgyXUT3GA7Uo4sfzdzUVTq5VCOMp6z8EckM89SiyQA2mA==
X-Received: by 2002:a17:902:a50c:b0:14d:4e8b:d6f with SMTP id s12-20020a170902a50c00b0014d4e8b0d6fmr20629518plq.42.1646059597279;
        Mon, 28 Feb 2022 06:46:37 -0800 (PST)
Received: from localhost.localdomain ([223.179.136.225])
        by smtp.gmail.com with ESMTPSA id lr2-20020a17090b4b8200b001bd6b5cce1dsm1736713pjb.36.2022.02.28.06.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 06:46:36 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 0/2] Add ufs power-domain entries for SM8150
Date:   Mon, 28 Feb 2022 20:16:05 +0530
Message-Id: <20220228144607.456194-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v1:
----------------
- v1 can be found here: https://lore.kernel.org/lkml/202201220442.bMRI74m1-lkp@intel.com/T/
- Broke down another separately sent out PATCH (see [1]), into a 3 patches (one each for emac, pci
  and ufs gdsc defines) - one of which is carried as [PATCH 1/2]
  in this series, which fixes a compilation error reported by 'kernel test robot'.
  The rest would be sent out as separate patch(es).

[1]. https://patchwork.kernel.org/project/netdevbpf/patch/20220126221725.710167-4-bhupesh.sharma@linaro.org/

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>

Bhupesh Sharma (2):
  clk: qcom: gcc: Add UFS_CARD_GDSC and UFS_PHY_GDSC for SM8150
  arm64: dts: qcom: sm8150: Add ufs power-domain entries

 arch/arm64/boot/dts/qcom/sm8150.dtsi        | 5 +++++
 include/dt-bindings/clock/qcom,gcc-sm8150.h | 2 ++
 2 files changed, 7 insertions(+)

-- 
2.35.1

