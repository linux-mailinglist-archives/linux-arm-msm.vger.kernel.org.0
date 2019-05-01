Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6527104FE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2019 06:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbfEAEhj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 May 2019 00:37:39 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46705 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfEAEhi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 May 2019 00:37:38 -0400
Received: by mail-pl1-f195.google.com with SMTP id bi2so2939585plb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2019 21:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=57ICluVQ3RIbtAJVvKOiKDvbYrXy0r4F6ND/9IOkSlQ=;
        b=hXe1zn/Uxwnr0xpFKdyJiyVbqWX2AObkJU2blrgZ4L7Lw8T3/LJwLTo86yviWCoIJm
         /u3yI07YJmS5UUkENXhvpeayrw1N3/kSh7fN+556/QPY6lHNHXCPPgQbX+ut4fj2Qv4K
         7dgWtu243ot+moo8dK5qyE2DX6wvPLWC+ipcyu+2USUQmKNXYrMRELLqBn1c4PKN8fO3
         EO6mptcZJXAz1tktRC9j3GbRtc+BFp87lwbGUKuGjdkB/Y7ijPLaMfIlY9wJ//1aKdhl
         0k/wXHBZKbjUxA+Pe8qnF6i2K4Fn2u5WKEeAOKC+9eAu/4AEq8qeW1kbRg0lwiEdx+0M
         ANkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=57ICluVQ3RIbtAJVvKOiKDvbYrXy0r4F6ND/9IOkSlQ=;
        b=rG3zbv8wIMI1Kadhlc801lErttvSy8Vv6HJeybf3pNciNEgmocW8JZ7NaOeNmxte03
         /hTFJvB/pdwmkZPPm0D6KbfKZAe54AevbDND3smm2KM20IzUJERIvVFyk+vPiqOdR93B
         W7nnwSZPZKO30WpGjEJX9gsw7P99vLjebqbPfyPr+W68V1PHib9jnme0qWD5BwyMVcJr
         X+mwZVelW5JpZNMJ7Y5dFhOOpWirkfdSKjCvBrOjmNtmz0OWE7AFqWvV2hJL+WfAPtWB
         SWMPBN3kbNSTvGkHlnlQZmhzgb4QhC+7DohJBHUiUxmSeA9VvtDxf3asM6eF/kXwiz0q
         JqkA==
X-Gm-Message-State: APjAAAVH1+qMkR5RoQZi2coaROqRKvD/r8D54YglLO9NBw3s+/MYP0oF
        iikQWQ7VWctZzlB1IwXy+h4RH/mrqA4=
X-Google-Smtp-Source: APXvYqyf7YUoaBbVjG64SGuMzeVMa1l0ecLXavucehtQsLCaIS85gZ6qI8CST7OaowiAY0bWHfSbuQ==
X-Received: by 2002:a17:902:5a3:: with SMTP id f32mr72229182plf.82.1556685458165;
        Tue, 30 Apr 2019 21:37:38 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q128sm55912865pga.60.2019.04.30.21.37.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 21:37:36 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/4] Qualcomm AOSS QMP driver
Date:   Tue, 30 Apr 2019 21:37:30 -0700
Message-Id: <20190501043734.26706-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce a driver implementing Qualcomm Messaging Protocol (QMP) to
communicate with the Always On Subsystem (AOSS) and expose the low-power
states for the remoteprocs as a set of power-domains and the QDSS clock
as a clock.

Changes since v6:
- First couple of patches merged for v5.2
- Squashed the qmp and qmp-pd driver into one and by that moved it all
  to one file
- Expose QDSS clock as a clock instead of a power domain

Bjorn Andersson (3):
  dt-bindings: soc: qcom: Add AOSS QMP binding
  soc: qcom: Add AOSS QMP driver
  arm64: dts: qcom: Add AOSS QMP node

Sibi Sankar (1):
  arm64: dts: qcom: sdm845: Add Q6V5 MSS node

 .../bindings/soc/qcom/qcom,aoss-qmp.txt       |  81 +++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  68 +++
 drivers/soc/qcom/Kconfig                      |  11 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/qcom_aoss.c                  | 473 ++++++++++++++++++
 include/dt-bindings/power/qcom-aoss-qmp.h     |  14 +
 6 files changed, 648 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
 create mode 100644 drivers/soc/qcom/qcom_aoss.c
 create mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h

-- 
2.18.0

