Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80C211905E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 20:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbfEISoV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 May 2019 14:44:21 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:41555 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbfEISoT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 May 2019 14:44:19 -0400
Received: by mail-qt1-f196.google.com with SMTP id y22so284479qtn.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2019 11:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MnwJDkVPyGraD2FybPAwWlN6A2Ug7jRvX00v4am69pc=;
        b=TcG6alR+TS8HOFt4HtnNfn/VcLrCt7cizcYKONvMfjelDktUeahQuyZuJnuL1Hul+1
         yrEp9jx06jxh8QdsarejJn8gP/Gcdz09NEvGP/w7j6dWWDMgalY+vM2SjK2ZKIUEi84E
         8lIEdxEExNaUxrGj9MWMouTbQwxUpUWNcIe3h9ZSj3cwQMUEEmJjbi1cisYbKrr1G037
         G1SP8ClkmKeQYsDPL2SgqKlLNv3dvAOJ6Ai1XGXTCbDxyBQ8+StRIYHw3oKqWqLP/IiL
         4ecVkiGxZ8z8gFNMFKKR20UB7/B5v5SXb9N/whw+EEQED6ouRl2sJ49tyzPKKh8e6ZRs
         I+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MnwJDkVPyGraD2FybPAwWlN6A2Ug7jRvX00v4am69pc=;
        b=CcfRSklTnc152erZyxJ27oqatisnFtODyNFSkDlN8qBowDURYOv2GYks5JoaQcfJTs
         p9FXT1l9w2Nr7YgglF0ovPj/GV/Qq7R63wE+fubkqAzxh9lioot7okpV+9nnehD+FWAU
         00O8hqYRs4IFW3cxNv0rxid2PCkTn/MuQXWdY522jd5ICRgV9ikpdSLr8dHvXmHKiTRR
         R3q27cswj73EWEM9QySKZ/DB77nC6km4SEKdiJtdS21IhaKEA0z6MG3c1EqwDnXXI1fF
         j8EvYERu3sqEL3JXX5kYz40EIA7YWg0uQ6rs8lHmxlOnCFs9B+nfrm7Qp0WDsujn5HNj
         944A==
X-Gm-Message-State: APjAAAVZupQfaY51naxrLLnIHSfqDFK9IYUAagbBu+0llzx3SxQcYCos
        hEvMplsWtlthDn7Wrl/ybw500X/zdE8=
X-Google-Smtp-Source: APXvYqzD/IZGkJ9n0CoiGVmbWCXrBOesAyHNcMyAK0et4vFDl1/cbKdETMTMuQvJhQUW1FqQiIagFQ==
X-Received: by 2002:ac8:352d:: with SMTP id y42mr5131991qtb.209.1557427458443;
        Thu, 09 May 2019 11:44:18 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:6268:7a0b:50be:cebc])
        by smtp.gmail.com with ESMTPSA id m31sm1654861qtm.46.2019.05.09.11.44.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 May 2019 11:44:17 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Rob Clark <robdclark@chromium.org>
Subject: [RFC 0/3] arm64: dts: qcom: add cheza support
Date:   Thu,  9 May 2019 11:44:10 -0700
Message-Id: <20190509184415.11592-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

I cobbled together the dt for the cheza board (based on sdm845 SoC) from
the chromium kernel, mostly to simplify running an upstream kernel on
the device (it is a useful thing to be able to directly run an upstream
kernel when testing/debugging/implementing driver changes, rather than
having to cherry-pick everything back to an older kernel).

With this, and a few other fixes I've posted yesterday, plus sdm845.dtsi
patches for GPU and MDSS interconnect support which have been posted,
and a few other things which are making their way upstream, I can boot
to GUI on cheza.  (So at least display and GPU work, plus a myriad of
other things required to get that far.)

In particular, the third patch depends on 'arm64: dts: sdm845: Add zap
shader region for GPU'

Douglas Anderson (1):
  arm64: dts: qcom: sdm845-cheza: Re-add reserved memory

Rob Clark (2):
  arm64: dts: qcom: sdm845-cheza: add initial cheza dt
  arm64: dts: qcom: sdm845-cheza: delete zap-shader

 arch/arm64/boot/dts/qcom/Makefile            |    3 +
 arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dts |  238 +++
 arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dts |  238 +++
 arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dts |  180 +++
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi   | 1353 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi         |    2 +-
 6 files changed, 2013 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi

-- 
2.20.1

