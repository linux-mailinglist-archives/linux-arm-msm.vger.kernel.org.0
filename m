Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 525714A2B66
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jan 2022 04:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352273AbiA2D1l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jan 2022 22:27:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240864AbiA2D1l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jan 2022 22:27:41 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C835C061714
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jan 2022 19:27:40 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id f22-20020a1c1f16000000b003525bf08b1eso833438wmf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jan 2022 19:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iTgtHLQg3MviQtfc6nIR/bmeQ8F7B5Wgc0dRawoGZp0=;
        b=sXm0kPSEExd3NzdI/JPHotkhTpCDzIu+KlEhjbfPMUANuzE5WRglxRi3UDc8rQxovT
         NCkecqugrODMAV/26YULrNsWxhjb4FcS4UFmOv3iRgwynj5h8MQLwsvmXBJNFvEGodEH
         laVFMP5lXDdliCo6iotEQ6OdLm8uNVmIdEG5bwp+uFec7hfgwxKGMZwwrG4bfCqG5szj
         ZcC37bPwtUqEARasDvpcs2MizffOpAx8R/yd5+0rhm/3X2vAO1FllaFRYtzvE3EzZt5k
         mTpLsZPxhG5Z1w9f/iJkCdqqexqc/Ev3GtBou7tYgHxX4MT+kEbyulyxtUDAUGMto1rs
         L4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iTgtHLQg3MviQtfc6nIR/bmeQ8F7B5Wgc0dRawoGZp0=;
        b=45gJyAf8rzkDzaJG9eUwavEmqA0/5QXP/pAM9i07uySctYiMqhJiDaOh7Rkb5lRItk
         JqonS0qr8f8qBesKtRSGjOPbwqZhsL0kDYMDGt8ASCsK8sEIzpzdZEGs2w4nkAiV5te+
         /UOrsoSUISkC7LUK/ayCJmFI8cwTeJO/9UHA3Qp5bg4AqggMpZEXN/E4S0Y3/eH0xZqe
         fo3ZA7xNsg1q0YyDheEMQFRHs7nye4ysKpM+KWJ7Gkb6aWDXNHVNm1wkKNfilxPEbrnU
         CBYSbll2rKRhqBVZIDt1HHBkO7EMrXbYNz+Rtv5QGMsAJ0cmIRZg7SXgmYEtc5Cxha0R
         n3Sg==
X-Gm-Message-State: AOAM531NgqnRzdNveG6JuqiRgIGHpRov/7fQdL91RDVfUiWCHDq3Ybg8
        R6F3kw1dz0okw30GL6FhOfDGHQ==
X-Google-Smtp-Source: ABdhPJwHQFe4PBnDyKhJqNYX1OCIrM6biUZX3UYAjGLY6cyPoX9zcJP8LWVKvxzWhhU7lWD8ViEGdg==
X-Received: by 2002:a1c:f210:: with SMTP id s16mr9682561wmc.99.1643426858540;
        Fri, 28 Jan 2022 19:27:38 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o12sm7365477wry.115.2022.01.28.19.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 19:27:37 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     djakov@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Cc:     jun.nie@linaro.org, shawn.guo@linaro.org, benl@squareup.com,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 0/2] interconnect: qcom: msm8939: Coalesce snoc and snoc_mm
Date:   Sat, 29 Jan 2022 03:27:33 +0000
Message-Id: <20220129032735.2410936-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

V2:
Made snoc-mm into a child of snoc - Dmitry
Removes redundant msm8939_snoc_mm_regmap_config - bod

V1:
Booting msm8939 on tip-of-tree I encountered the following error.

[    1.212340] qnoc-msm8939 580000.interconnect_mm: can't request region for resource [mem 0x00580000-0x0059407f]
[    1.212391] qnoc-msm8939 580000.interconnect_mm: Cannot ioremap interconnect bus resource
[    1.221524] qnoc-msm8939: probe of 580000.interconnect_mm failed with error -16

Initially I thought this was a bug with the interconnect driver but,
examining it a bit more I realized the DTS I was working with based on
downstream, declares snoc and snoc_mm as existing at the same address
range.

When we were developing the DTS for 8939 we weren't using the common rpm
interconnect driver so we never saw the ioremap collision.

Taking a hard look at the qcom documentation as well as the downstream code
we see that yes downstream declares snoc and snoc_mm separately but, also
at the same overlapping address.

The qcom documentation for performance points for msm8936/msm8939 snoc,
deliniates snoc_mm as simply two new performance-points i.e. a faster GPLL0
vote associated with new multi-media devices attached to the snoc.

In other words the snoc had two new RPM vote indices added to it, to
represent the higher performance clocks, should one of the multi-media IP
blocks call for it.

We can fix the ioremap collision and still represent the two higher
performance point clock votes by coalsecing snoc and snoc_mm into snoc. The
DTS clock references will take care of the appropriate votes.

Bryan O'Donoghue (2):
  dt-bindings: interconnect: Convert snoc-mm to a sub-node of snoc
  interconnect: qcom: msm8939: Remove snoc_mm specific regmap

 .../bindings/interconnect/qcom,rpm.yaml       | 52 ++++++++++++++++++-
 drivers/interconnect/qcom/msm8939.c           | 10 +---
 2 files changed, 51 insertions(+), 11 deletions(-)

-- 
2.33.0

