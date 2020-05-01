Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A291D1C20B2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 May 2020 00:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbgEAWdD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 18:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgEAWdC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 18:33:02 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A58C061A0C;
        Fri,  1 May 2020 15:33:02 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id x18so13419401wrq.2;
        Fri, 01 May 2020 15:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vseR8e8pFXD2+crzI5eV2VcW4ikr4KpriEQgDBp2Nkk=;
        b=Jq/oBJJQjyVTpBQJaSRiwighOTctLBm/QkEyfvefS14WeNspzApxcFj6R6ZsB0KW4r
         WrOBh9RWCkW0SiUc1qjuaQOF6Gg/bNHp8+ySsxOg6EKao3UhvNa3Ogzo+bW+142P9R/l
         WjZKs6xG1yTNikKP63ePyoE91h/MuFm/7emy1WOf7Q5L5eRReC4Gv6NiIzb6IL1cTFAb
         t6qmDID14xHAOQZLPafY0EcJnH1c4NeLs8c2npMq5JsOpLTW5A4636NKy4RzqCPkvmDu
         4D+4I0riPUWU6eI1fvdkwMpVzHZN1BFlVDDDYWLH83nv1+xUEhHG3oNRxI+pH9pCNjcu
         lBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vseR8e8pFXD2+crzI5eV2VcW4ikr4KpriEQgDBp2Nkk=;
        b=mk7aeIcv3R2rLa2988AxNj9C7iHtyGV/fbw5nLUo5y9LZUlzB+h4il99Cf82bozrpl
         2c7MkBAgz9xiQgr5lrb6lQcDi/gNLU/Of0Lnih6yphqq6YXWJZd655/7+dX/A9g8+Ybv
         rSvpLysxUhI3Eg4D28sEufDN1NF2/BunA31N7EyJCpVFnMmS/M6c8+QgUkaR10XM+IK+
         H4c/ur9nYQKuxL28iBOsGBsCwe6lF5are5C+/OZvofdecx4ieZvn+DIT/KH/s95OToex
         EcMdHaJZo5o9Y98cUusrBqAzyavORkzTpXrmRymQM59O/dRynXoFfG2GO6ovKqGcYGsZ
         C09Q==
X-Gm-Message-State: AGi0PuaXMxP9fgMlS2RtqXTffa2YJKIL5aAMLkKtdzKnFeXTrj0HF4x/
        uyYNF0BgsyLxoMIYCKkQJGQ=
X-Google-Smtp-Source: APiQypIqMshsvJKMdUEEJbNpBmLhC7igH7VDViy70/OfNgOXhRkvkU26tBFopkIkz/SG9QwB7PV9Jw==
X-Received: by 2002:a05:6000:1242:: with SMTP id j2mr6081582wrx.274.1588372381333;
        Fri, 01 May 2020 15:33:01 -0700 (PDT)
Received: from localhost.localdomain (abag125.neoplus.adsl.tpnet.pl. [83.6.170.125])
        by smtp.googlemail.com with ESMTPSA id n9sm6237750wrx.61.2020.05.01.15.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 15:33:00 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [v2 PATCH 0/4] Add SMD RPM support for MSM8936
Date:   Sat,  2 May 2020 00:32:28 +0200
Message-Id: <20200501223232.275800-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

changes since v1:
- added a forgotten patch that adds the compat string to the driver

Konrad Dybcio (1):
  drivers: soc: Add MSM8936 SMD RPM compatible

Vincent Knecht (3):
  clk: qcom: smd: Add support for MSM8936 rpm clocks
  dt-bindings: clock: rpmcc: Document MSM8936 compatible
  dt-bindings: soc: qcom: Document MSM8936 SMD RPM compatible

 .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
 .../bindings/soc/qcom/qcom,smd-rpm.txt        |  1 +
 drivers/clk/qcom/clk-smd-rpm.c                | 50 +++++++++++++++++++
 drivers/soc/qcom/smd-rpm.c                    |  1 +
 4 files changed, 53 insertions(+)

-- 
2.26.1

