Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE47D372573
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 07:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhEDF3u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 01:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbhEDF3t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 01:29:49 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653F1C061574
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 May 2021 22:28:54 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id m11so6274407pfc.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 22:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=d1/AzVVrNidYL1JjR1YC/Peao5Mw1ewmpCW6nzrTArc=;
        b=c5b+/FRo57MbHTEAez+tIFj/mbxJ/4TPCMLMKwqCj1QxrLBFwTpK57F4kMxLtQGXMt
         mc7iFXrws3C9/0+t9VmgFbSBgs2t4h9EU+fyLsJPks8kYl13VW0oUYsRTS++of+93ixc
         kAemPYkMm9g85Wigz1LOS9AEvABZmYQsJ0vR13prGzBfzTB8Unocu+YjUS/pioB7vHLF
         Yu4NSzzNdLswqoqn01CvWc3CuFr/BDC78spqKJgjz5Y0ebrRMg7Xnxpo9PkfhCBLgeVM
         Qp+C2ryA2xWsDsMsiAqMYQqZQ5kEZE9RMMKwo8lbRkCT8S4kDOI7fuSesaba+1SdIhDS
         956w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=d1/AzVVrNidYL1JjR1YC/Peao5Mw1ewmpCW6nzrTArc=;
        b=UfsC8jQM1dePd3+fMeqCyyN8NgaQcY+yfk9CCQYAhnS/60/QZCM4a/QwLdjm5pg4V/
         CK0kMZIle+6jTH5UVvBvfVifMpTRR67dKfWOHedEFvLL5yov5qNs7UL7kBS4TPrcwTJ7
         BtGkMwb2f1f38jX7Qui57fS9Dikfo/krv1JFa2AAksAhhGd7i+ti/cKIcaKnPtjn2IRG
         WUQWRfXC1JOGLIzcZqLRRxGQpsW5EOuRUWD2sOhkkLaArWNAMymGxBWu/9PSBUWEMnSl
         ZYTxi64YIGq5+dOs5ZkzzeDwZ/xz62yIuttz7QWaagCJZ1NIvT0InDNfc4sa8M4ZVxjH
         Tz4A==
X-Gm-Message-State: AOAM530r9LNMk7u4T6UTgQ51NwCV+5eAS4n4bxURpwU/b87tUBYXNb+u
        atKKySImKZ3qFlUPFS2JlHTZ3w==
X-Google-Smtp-Source: ABdhPJzdS4ViNq2A7okdWhYQ2+fzIzBEVaEgOXbmwhyYrZjKUPwp7RHhi6GILgShVLSSoTLLZuHlaA==
X-Received: by 2002:a63:f258:: with SMTP id d24mr21482075pgk.174.1620106133811;
        Mon, 03 May 2021 22:28:53 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 145sm5933229pfv.196.2021.05.03.22.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 22:28:53 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/5] Add MSM8939 APCS/A53PLL clock support
Date:   Tue,  4 May 2021 13:28:39 +0800
Message-Id: <20210504052844.21096-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds MSM8939 APCS/A53PLL clock support.  Most outstanding
thing about MSM8939 is that it integrates 3 APCS instances, for Cluster0
(little cores), Cluster1 (big cores) and CCI (Cache Coherent Interconnect)
respectively.

Note: the first one is a small improvement which is not specific to
MSM8939 support.


Shawn Guo (5):
  clk: qcom: apcs-msm8916: Flag a53mux instead of a53pll as critical
  dt-bindings: clock: update qcom,a53pll bindings for MSM8939 support
  clk: qcom: apcs-msm8916: Retrieve clock name from DT
  clk: qcom: a53-pll: Pass freq_tbl via match data
  clk: qcom: a53-pll: Add MSM8939 a53pll clocks

 .../bindings/clock/qcom,a53pll.yaml           | 34 +++++++++++
 drivers/clk/qcom/a53-pll.c                    | 59 +++++++++++++++++--
 drivers/clk/qcom/apcs-msm8916.c               |  7 ++-
 3 files changed, 93 insertions(+), 7 deletions(-)

-- 
2.17.1

