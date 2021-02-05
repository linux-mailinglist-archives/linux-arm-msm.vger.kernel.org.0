Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5393C31026F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 02:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbhBEBxV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 20:53:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbhBEBxS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 20:53:18 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4246C061786
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Feb 2021 17:52:38 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id e9so2760828plh.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Feb 2021 17:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=HPlCt/oLMkzfdSzMbmF5TMe9TN1Pemw5Bf1xj8IPkbc=;
        b=aaG88vmPvUfGM+ENAlspEss54lgXvtTfMg1yw0Ql+KXLOFMxNllsPhTgb5xD5vwMml
         LKssZfpTlxkEKEnt+aWgG7SwotZi4G0ZYlUJftzq6jjL5Vx49gbNPC9tUaGQPLJ4D7IM
         hTavVEUW3lsn+B0Lo96JJ73j2/1BsGxN3VgDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HPlCt/oLMkzfdSzMbmF5TMe9TN1Pemw5Bf1xj8IPkbc=;
        b=G1JnFTUnOhRr0I3DajgOJa43fSCg/A4kIEOCy3XYaMpUb7FBSOCZZ6MLZnaCVS4rz8
         /IOHE1iW01WVTCMS9GXk3U+X3YogXQCumjJ+FO/g+rflFIk4W6Fq0blNaEsY9sy1IpXD
         238sZry3Jv5oEL7d/yAhzHI5eFShSlbYdy07ZYSx4yvBX+y8lZqRQqG+Hx+qgW8OOY1f
         Eb6K3pmd/3A/Zd/nGsB0sOxY0VhmiB56HsYNqQ8a8Zbj6f4WlxDPbfe+d+eops2xrgCt
         DkJ+Dare6FYkzy4QLNYWxjy6f1mtjpEzxSQ8QILTu/RVk9AMDTzNhp2mszHa9Fnh/Gjv
         ftfQ==
X-Gm-Message-State: AOAM532rGlAWcE/QkQidAEXXE85SRLuJCEYRy+JZ5z6JaK5U9oZWiYFY
        1wdwOLhW/rn4TypKEvcrtkIQgQ==
X-Google-Smtp-Source: ABdhPJztxs5hvHnG2TytvQiPpYtx+iVGjsBzbaRXxg+ESnHMEM6gYYE5tWFqg+xsj1ShR/Ew4HAcYg==
X-Received: by 2002:a17:90a:2ec7:: with SMTP id h7mr1780338pjs.200.1612489958131;
        Thu, 04 Feb 2021 17:52:38 -0800 (PST)
Received: from localhost (162-207-206-139.lightspeed.sntcca.sbcglobal.net. [162.207.206.139])
        by smtp.gmail.com with ESMTPSA id h124sm3327073pfe.216.2021.02.04.17.52.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Feb 2021 17:52:37 -0800 (PST)
From:   Benjamin Li <benl@squareup.com>
To:     Georgi Djakov <georgi.djakov@linaro.org>,
        Jun Nie <jun.nie@linaro.org>
Cc:     kernel@squareup.com, Benjamin Li <benl@squareup.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Clean up MSM8939 interconnect driver
Date:   Thu,  4 Feb 2021 17:52:03 -0800
Message-Id: <20210205015205.22947-1-benl@squareup.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Following up on a review comment on commit 6c6fe5d3dc5e ("interconnect: qcom:
Add MSM8939 interconnect provider driver") to clean up some log pollution.

This is based on icc-next (which appears to contain a refactor commonizing
functions into icc-rpm.c).

v2:
- Update commit message to add a full explanation, rather than referencing a
  previous commit.

Benjamin Li (2):
  interconnect: qcom: icc-rpm: record slave RPM id in error log
  interconnect: qcom: msm8939: remove rpm-ids from non-RPM nodes

 drivers/interconnect/qcom/icc-rpm.c |  4 ++--
 drivers/interconnect/qcom/msm8939.c | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.17.1

