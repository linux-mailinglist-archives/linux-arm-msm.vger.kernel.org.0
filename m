Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDCC01B523C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 04:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgDWCEk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 22:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgDWCEk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 22:04:40 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7A6C03C1AB
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 19:04:40 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id x17so4189189wrt.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 19:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0cUppuMNZR15jq9h3I+rd1YzY5ZtLEZoi3qlrA8cUlA=;
        b=WRfO7MWdcCmm4CwWw6KxB1n4ZaWoa8KqTaHcSTjS8efmM6HYXKKfgjsLmIEIPdH3Le
         ZGkeaILpD9Bt4Prn4Fm25TpzfLbuPs/zuC5kUMKGpklCvpoRWESVHPuQVlaY1es1cesf
         1Gq56+4//ygghsbDXIDwy6JWQjYba482ROlpuIqAmMbdnujdacZXg7zGJFyKk8Vp0SrS
         Mh400RrVovWviEpDBvYcTZ81wv1hpH91txC7mmGF7hKfHfhzWNr9GFLT7GG74du50vV4
         fG/QZ5GX7GEQ51EMfk2seIOHVvIOwGo1NzsgxeDGxg6gkUgZuBQhsinPftUgsJbX8FZ/
         NA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0cUppuMNZR15jq9h3I+rd1YzY5ZtLEZoi3qlrA8cUlA=;
        b=BXRqHD8Z8BQ8HJUEQGYSxdQW03hIY3DNKtuDfYBIR62tc2LD2ARbFA7MAe18yoXz/F
         jDxIKtVru7xQOXEjiwleRiiYqmmISH6ynRh3qlztWmSnEcKiUe0zgrbt4omRF7Pw/2Pc
         enGCRMgtM3pSn2eFcQaTnQ215CgfwDl5n/fO5ua8UoOjGYMMki/6fuXns0v08ZKMsUfW
         hniRMMiekqkJeu1AVDfMer0nbbp1H30zIIGFyPE0J4a1mxgJcYofLImso63ZmIWvXJjy
         vE2bOqekS7VVZZYQ8aJ5gP37yR+n4ERXHgWsnp/BPXg8iF7MrOkTa99JEPgwrRuDTaz6
         ciYA==
X-Gm-Message-State: AGi0PuZk2Or+smxgV+Nydos9S9maORPZUm6K7MpChv6eaaoJtpeAHhQu
        pJoVZ/fSAnbO6teIS8ScXPSKAg==
X-Google-Smtp-Source: APiQypLh+nI2OpJgFyQyZ15I1UqtyaJQvwJaMpRiC4ZY96bVS4a0bfSsR7gDmUqqUzPhTynGuN25Mg==
X-Received: by 2002:a5d:5085:: with SMTP id a5mr2240790wrt.394.1587607478627;
        Wed, 22 Apr 2020 19:04:38 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id j17sm1423292wrb.46.2020.04.22.19.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 19:04:38 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, p.zabel@pengutronix.de,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 0/2] Add Qualcomm MSM8939 GCC binding and driver
Date:   Thu, 23 Apr 2020 03:05:05 +0100
Message-Id: <20200423020507.455732-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

V2:
This update does the following

1. Drops code in the probe routine to add xo and sleep_clk. Instead
   the DTS for the GCC will need to declare both of those clocks for the
   GCC controller.

2. Supplants parent_names for parent_data for all clocks.

3. Squashes down the previous three patches into two.

4. Drops the git log of copying files. The git log makes clear the silicon
   is highly similar, so, you can just as easily read the log and do a
   diff.

5. Doesn't update the MSM8916 with parent_data.
   Happy to do this at a later date but, don't have the time to validate
   this properly at the moment. This set focuses on the MSM8939 alone.

6. Dropped comment and boilerplate license text as indicated.

7. Dropped dependency on COMMON_CLK_QCOM seems to not be needed.

8. Easily view the changes here:
   git add bod https://github.com/bryanodonoghue/linux.git
   git fetch bod
   git diff bod/clk-next+msm8939 bod/clk-next+msm8939-v2   

V1:
These three patches add support for the MSM8939 Global Clock Controller.
The MSM8939 is a derivation of the MSM8916 sharing the large majority of
its clock settings with MSM8916, however, there are enough changes, in some
cases mutually incompatible changes that necessitate a separate driver.

I thought it was both important and useful to show in the git log the
differences between MSM8916 and MSM8939 so, one patch copies the MSM8916
driver while another patch applies the entire gamut of MSM8939 changes,
squashing down from a git log of approximately 31 separate commits.

For reference that log is here:
https://github.com/bryanodonoghue/linux/pull/new/msm8939-clk-next-reference-log

Generally speaking MSM8939 differes from MSM8916 in two key ways.

- New and higher clock frequencies for existing IP blocks.
- New PLLs to drive those higher frequencies

Bryan O'Donoghue (2):
  clk: qcom: Add DT bindings for MSM8939 GCC
  clk: qcom: gcc-msm8939: Add MSM8939 Generic Clock Controller

 .../devicetree/bindings/clock/qcom,gcc.yaml   |    3 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-msm8939.c                | 4145 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8939.h  |  206 +
 include/dt-bindings/reset/qcom,gcc-msm8939.h  |  110 +
 6 files changed, 4474 insertions(+)
 create mode 100644 drivers/clk/qcom/gcc-msm8939.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8939.h
 create mode 100644 include/dt-bindings/reset/qcom,gcc-msm8939.h

-- 
2.25.1

