Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE8E38CE8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 22:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231590AbhEUUHX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 16:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbhEUUHV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 16:07:21 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA4BC0613CE
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 13:05:57 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id b15-20020a17090a550fb029015dad75163dso7783072pji.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 13:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ybXypeyea8Cf9kwFCSJgN0ItJkY4+UPXl7JyFWq2ns4=;
        b=gvizpSBJ+apVKVlvGSXBZj2gEs1knSeRCxVXdN3vtGCGuh0shDb201I84svqrga0q5
         uX0JPqks5j4LZz+18rZ/lbNlLgVxjOPNcvhpUIOGJFxgSOGBLVHP9VgULuSrvy1abr3+
         NBYnw9w9w/vub/ZSfFkg831gtYAHt7j9EAO1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ybXypeyea8Cf9kwFCSJgN0ItJkY4+UPXl7JyFWq2ns4=;
        b=kJH2/okKG500VX3PH+xXAirvrw9DrgAmc1gsER8M+bkkFMRAvXXHslFeePi9OBaNkE
         2sHcPRrxDrkWW1Xb0V/mrAKQcrvYjyt1cRPnTnyy+k5k+9VVCJqbTsUPQT5Ughv+av76
         k+DVqYKBrxiFjOOj2umv9gRa7xZWgpjoGLi9Fz8dO1GB5t/XlOKfSyjAtfy4XEK92STt
         m2RMYVWpIvm+/v7qQ/mBgg3NRvLrkSz08HnOv+Kv9ICwUjgexECTbfwl1tyjNzWqI4lo
         xdXAGGfwZyxt+NpaoAZckNG0uaXPCnLpil5xs0lwLq7/u6Ik+BBBz9wpzZKvgpw5RQk9
         NlPA==
X-Gm-Message-State: AOAM531/2QfuwjmyoybQ7XzbOhrchKb4D+brQCgSoK2zd+nsbwIZ4RYg
        AlpORv27Pb5dvmEoLDMr/Gta7g==
X-Google-Smtp-Source: ABdhPJzhy4xTRi3QdYIYW790JHpwnfEydljuE/FpMrNWeq4/SEl0a4KL/tU7v+aalWjydp3F/uLpOQ==
X-Received: by 2002:a17:90b:11cf:: with SMTP id gv15mr12620696pjb.26.1621627557050;
        Fri, 21 May 2021 13:05:57 -0700 (PDT)
Received: from sujitka-glaptop.hsd1.ca.comcast.net ([2601:646:8e00:b2f0:22bd:8c3f:584d:d265])
        by smtp.gmail.com with ESMTPSA id z19sm4550614pjn.0.2021.05.21.13.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 13:05:56 -0700 (PDT)
From:   Sujit Kautkar <sujitka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sibi Sankar <sibis@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Update sd card pinconf for sc7180 DT
Date:   Fri, 21 May 2021 13:05:27 -0700
Message-Id: <20210521200529.1991729-1-sujitka@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series contains change to move sdc pinconf from SoC specific
DT file to board specific DT file. It also contain change to set sdc
GPIO pin to bias-pull up

Tested sd card working on sc7180 based board

Sujit Kautkar (2):
  arm64: dts: qcom: sc7180: Move sdc pinconf to board specific DT files
  arm64: dts: qcom: sc7180: trogdor: SD-card GPIO pin set bias-pull up

 arch/arm64/boot/dts/qcom/sc7180-idp.dts      | 102 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 102 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi         | 102 -------------------
 3 files changed, 204 insertions(+), 102 deletions(-)

-- 
2.31.1.818.g46aad6cb9e-goog

