Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F361B44D96E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 16:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234025AbhKKPvN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 10:51:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233903AbhKKPvN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 10:51:13 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1708CC061767
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 07:48:21 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id k2so5265734lji.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Nov 2021 07:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bwZrVpKsHF9m8/Tz4wM3VmQNtLlb53/TnN+nzMUhfbI=;
        b=a2l+kcXfU2iUPQIGSpKCsJxp+U8UdVDT1SJYoNCokyG/D77MICZrxNGHN1rlcdqkT3
         DKMBU5aa/dyOGw+0s+QNgYkQZd5ZGv71hSZzFJaUAZ2vba6+yBkZP+z85dWNRemOCj73
         0+ImKLiq30iqC4XjZng/xw0bJRow72TEPbiim1HyPWdTHljGLDprfbbPPMxzK46xa+e/
         7qa1JORmYzFTANNFeObWjXBwWjyKEIyVBFwTviM9ZkLsRQ5TniK9TpORcHx1qVTMQ0n3
         1W/5DLe7xruB8Tnv9wsMhquPMGSQIn2fUDPBVice/tcta9cYKrVdWFMzW74/n9saDF/V
         xuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bwZrVpKsHF9m8/Tz4wM3VmQNtLlb53/TnN+nzMUhfbI=;
        b=GbQfFdQzVxhHDGcnm5VsR4pe16kLWY6oSCing+VtSKuZigOFSogx8WFPvqCADGu3/p
         xUzij8SouzaJkAauOjxLyUAVeBmjuqpeecU2Q+p7FPMzVIHNSGBEwvhUOA1ogRh+k1dc
         RzsCr44WPPSOLNAdw0tw+d3ijfakG/9oJ322JxVzdw6gPgCpezz8oBPxJSUZaJNhMwJ0
         Qs9kGSXWclu3YevBvDMQel3FJzsE4v8CQypyeGeLrCLi4xj5QqyZ4ck9mDRZ33i/cMp7
         qyofZT1UAM7Yp2/CDzDFV7vTURgJjYE+WlUbgQC8TLkTs3ROPDFOpE8xOCrhPAUTf6sA
         j73A==
X-Gm-Message-State: AOAM531kQzo6WElGrJCvNC8ZftNSt87DeVou2/xkgJ8ULxOD/L4pxRwJ
        K6mgUtIxZ81JcmpQNCAn+0lnCYM4A5aID9Xu
X-Google-Smtp-Source: ABdhPJw3r5/fB13PeX2iBLu4E359nb3MmDQzwiwVcEyzp1AAQ+GLpxhQaTzn9tBq/9Aef9YvPzdOlQ==
X-Received: by 2002:a05:651c:1607:: with SMTP id f7mr8538178ljq.104.1636645699411;
        Thu, 11 Nov 2021 07:48:19 -0800 (PST)
Received: from localhost.localdomain (62-248-207-242.elisa-laajakaista.fi. [62.248.207.242])
        by smtp.gmail.com with ESMTPSA id t9sm317072lfe.88.2021.11.11.07.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 07:48:19 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH 0/3] cpufreq: qcom-hw: a few fixes in qcom cpufreq driver
Date:   Thu, 11 Nov 2021 17:48:05 +0200
Message-Id: <20211111154808.2024808-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I find it essential to resend a fix from Ard and also add two more
lesser fixes to the set, review and comments are more than welcome.

Ard Biesheuvel (1):
  cpufreq: qcom-cpufreq-hw: Avoid stack buffer for IRQ name

Vladimir Zapolskiy (2):
  cpufreq: qcom-hw: Fix probable nested interrupt handling
  cpufreq: qcom-hw: Set CPU affinity of dcvsh interrupts

 drivers/cpufreq/qcom-cpufreq-hw.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

-- 
2.32.0

