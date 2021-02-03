Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AEF330D938
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 12:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234262AbhBCLyj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 06:54:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234245AbhBCLyi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 06:54:38 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D350C0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 03:53:58 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id e15so4941344wme.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 03:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vo0qUtEXwSXsNazm8VbU9AtoskXI0qGiMJnfOg8ptAo=;
        b=rlPyJYCBTV93jFKiD/Ra6ZUEO9bw6iirwMBSocPpOjX5N2eWcc6ikX2lVooU7OKTUe
         tCU97ObrYYeKpsbXLBpjEO4c+Z77ac3tmF11G2J7yGEIw9WKIB5+H4hU1CqBFO24uU+R
         IGlMqwVcB5jHKNlUi15VmP6CTe8KCqTo+8TzP+jxK/C+ivpgQWqyYcsJkK11+9Jo/7s4
         /KYBRzxjqNZFJKDtTipcC6WHnY0hGeHRRcMvfYNBrrZw4jXKuTrF4tMFAtKceDDsiIkC
         oELqqCvwWMtD3INhV2WRYAce1jTO2wjJSqlJ20Xnwj4ZGPbJ+valT4S+Tj5Fc9YxWUiB
         v4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vo0qUtEXwSXsNazm8VbU9AtoskXI0qGiMJnfOg8ptAo=;
        b=CvhDgKlBR2HHOnog2gOJUK3yl3xSodM/+pT4DfmsQ0Iu20PoyqNFHKKQlWY7DS6/vB
         3/5kOJGBI9zsvbNsj1I86eYhHyx8AnxGJGQ3vrXBtMjdEX6oSu6XFNXmh9NLlzeM02jH
         O/Wmdw6c66/IkVAssA7v//MEc7C/SFlBaR+/6NiicP/gAmg2TabJnUfV5C8VspGqBnc7
         4Xf8LeucoCBxQgVUf/8ZYo0M1rIzonoJvqQw9NR6fT8MX840CYwkl+C9SPkDRyLdPGvO
         KtEThTibvgtrCO4/XLBcIc7q4K3uD6tbB/KhNgklFlLFNglY9GRmL8IRnSKCadkxIHYl
         9EDA==
X-Gm-Message-State: AOAM533Yfn5c0Y7T4gGJ/vu9hLJTXB2uEx3vEws5G9qnvKOP5jRjGUHH
        +z4ZMuSpRxsHLA1Z8y3gBAMDog==
X-Google-Smtp-Source: ABdhPJw4sbMauQGn8omPbihaAwGhxycoQiMypZCyEy/b4DM9GQEYUjV3aco4IM36sxgl9kPiiU9s/Q==
X-Received: by 2002:a05:600c:4ecb:: with SMTP id g11mr2384923wmq.71.1612353237301;
        Wed, 03 Feb 2021 03:53:57 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 35sm3687362wrn.42.2021.02.03.03.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 03:53:56 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org,
        stanimir.varbanov@linaro.org
Subject: [RESEND PATCH 0/4] Fixup clocks for venus on sm8250
Date:   Wed,  3 Feb 2021 11:54:52 +0000
Message-Id: <20210203115456.1072975-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

- Adds some missing indices to the videocc index
- Adds videocc clock tree hirearchy for msv0
- Adds a regulator to power the videocc consistent with downstream

Once done we can move on to enabling these clocks in the DTS and switch on
the venus.

Bryan O'Donoghue (4):
  dt-bindings: clock: Add missing SM8250 videoc clock indices
  clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_DIV_CLK_SRC
  clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_CLK
  clk: qcom: videocc: Add gdsc mmcx-reg supply hook

 drivers/clk/qcom/videocc-sm8250.c             | 39 +++++++++++++++++++
 .../dt-bindings/clock/qcom,videocc-sm8250.h   |  2 +
 2 files changed, 41 insertions(+)

-- 
2.29.2

