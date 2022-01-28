Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30F8C49FDAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jan 2022 17:10:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233878AbiA1QKI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jan 2022 11:10:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232523AbiA1QKI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jan 2022 11:10:08 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C600C061714
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jan 2022 08:10:08 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id 200so5962151qki.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jan 2022 08:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rk7VcZa4IMMqb6sCLkENxEoQJPsc6pzh8cQe7rPuPKA=;
        b=gSyEMahkctL4Nfo8ra6kHWRvCef4H64kuggemaRFhQsXyo8teBosxEwxJISdzs8qa4
         L2aAxCKneZhd06kzXqf2RHG4MCNBuyiE9Q7XgCZzkVfFrfhE05eBUqgwGJfWYf4lrajM
         HVDJw1W8SE6cz7W0ynzgmYOoVwNRInrWGxkBM+/jp0Ro8IECH9SU2GeZpc06UNRn869X
         hEw9RW8C+d1J5k0nyjr/C6h+bJGtVWsijoUFPbxHzHVgpxP4YoDg4cMqjGg0IMAEnx5P
         DXL+g44hfQ7CV38p5xpKm1M4wKgVeEz4VCxcprzSCN5xj4X3VCypSXKjxqaXed+FghvS
         +DLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rk7VcZa4IMMqb6sCLkENxEoQJPsc6pzh8cQe7rPuPKA=;
        b=lN6U3sby0ek/UMf2RRnooZZAAAMBPV16rtVVV5G2DvMaZezkgIQpdcnHL/WmtEgDTZ
         kuSXd2xv0wfpbECi6cgVLK/dcIW7eersx712xAvz2v46C1IuLdUOnJth2KDERFssoxQP
         FWi4TDu7BxT+xzshMjTIkWO8ow+W/A9X/fcfPllt9cyrUta8NxKOtJFbaYnHokDjazXY
         foA+JS3E9LH2+wUfhDKKY8TPcy1ljPhwp3SwUdFrpF5dUm+kXgflWnFLOHDyHKJRYON0
         6v7C8pTUccJKIl69m0aOb6654/pCNFmSpddoGCihMWWD856wTGg6twbIe1yqzHQNkrlK
         mkVQ==
X-Gm-Message-State: AOAM5332LYr7qqpG+Ol/sTuafl1/aS4uqUgicSa6DrrWoBTIvZJ78teV
        4g2R/r//M4N3G58OU+3an2rTQg==
X-Google-Smtp-Source: ABdhPJykv/bKO1SBw3zdNIc0hwGw4in1YcboBEUNol8/GRKieE0u+cr03abnT35IqqYTMlwPIEn7bw==
X-Received: by 2002:a37:5345:: with SMTP id h66mr6062373qkb.40.1643386207200;
        Fri, 28 Jan 2022 08:10:07 -0800 (PST)
Received: from sagittarius-a.sqcorp.co (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o21sm3339006qtv.68.2022.01.28.08.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 08:10:06 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     djakov@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Cc:     jun.nie@linaro.org, shawn.guo@linaro.org, benl@squareup.com,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH 0/3] interconnect: qcom: msm8939: Coalesce snoc and snoc_mm
Date:   Fri, 28 Jan 2022 16:09:59 +0000
Message-Id: <20220128161002.2308563-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

Bryan O'Donoghue (3):
  dt-bindings: interconnect: Create modified msm8939-snoc description
  interconnect: qcom: msm8939: Merge snoc and snoc_mm into one
  interconnect: qcom: msm8939: Deliniate bus, bus_a, bus_mm and bus_a_mm
    clocks

 .../bindings/interconnect/qcom,rpm.yaml       | 25 +++++++++++-
 drivers/interconnect/qcom/msm8939.c           | 39 +++++++------------
 2 files changed, 37 insertions(+), 27 deletions(-)

-- 
2.33.0

