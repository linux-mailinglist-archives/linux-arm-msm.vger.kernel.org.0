Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBAE18267
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 00:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728457AbfEHWnO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 18:43:14 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36198 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728279AbfEHWnN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 18:43:13 -0400
Received: by mail-pl1-f193.google.com with SMTP id d21so111251plr.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2019 15:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=M1B48uz7naoSYHk9LojprOtp1192ghEYyzqs88NhVJI=;
        b=h+9P7YwnWLHHuSzwZ2sv+mHuB4E7XG6CChvg3sGv62F6onzVd8jsOqcaxIj2LjxAxT
         1ih5EJ3MJS7PnnZRuZwNt1YaoH9DcM30vzWTUoeflEIv6Dtf+THHd7Dr9E7hf6W9csKg
         Vu3g+Y9+GRgL5yrh35U0cu+myItVdw3MBEagZyQR8I50s79J9yhmnYjkT59vTrAxxaqk
         FukJqSfQzJiaoXyGzZMhWXOpJimlLTZT7sSrjSuWAHzMaT0zTfC+NYPO1AIc1PwERqrs
         WyvT1sz9SepKCxf4jVE5FphxE5a1H+ih/psUoxAFHpztysaGC2/EN3eO+8kHFvpzno6b
         xibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=M1B48uz7naoSYHk9LojprOtp1192ghEYyzqs88NhVJI=;
        b=h7XTHkSQbH2oU36PgupjxWmlQW7PhpezGAHVfxSq/fPKPKqcAmjQglMX+ik2MEWlOZ
         XYZal++w/ieHIcbCFRRoBAfG9PylUNvEjr3whWM6jS8Ba6mD15wrNy68B3jHyc50+gug
         X2pkTlz9v5t9Wh/rH4cJRv5DQJ7PRFOzhUKiE2hV2sLvCKisqMn0ETz+coHyM1E4JWtH
         WCGPIDXs90yt5chISEbuK3hCBN+UwAGFhS4YN9TahDn4r4URKWuP1CBU8fWrleeuDYc3
         HzrCAvA92VcanyG771kTkbAS7q6v9k8GxiEOyD7WjqEYQ9UBcRhGk1DR34cvh1kmKy8f
         S93A==
X-Gm-Message-State: APjAAAXQkuNfCEcWJtJuJrFiNqL8VYsPOpLCuWlpHZnQZ3H8RjsgV+1P
        bl58pa8NCL/W8AiYs/IvHkypug==
X-Google-Smtp-Source: APXvYqz6XWnNCnlZ4X+G7jjSasgvgF5m5Y/cdkIfjOx3lW+QBURzx9kbXupReuOJrB75rdT3Ubkfpw==
X-Received: by 2002:a17:902:aa48:: with SMTP id c8mr470608plr.130.1557355393196;
        Wed, 08 May 2019 15:43:13 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 25sm320494pfo.145.2019.05.08.15.43.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 May 2019 15:43:12 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] arm64: dts: qcom: qcs404: Enable PCIe
Date:   Wed,  8 May 2019 15:43:06 -0700
Message-Id: <20190508224309.5744-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series defines the PCIe PHY and controller on QCS404 and enable them for
EVB. This was 1 commit, but per Vinod's request its split up in its individual
pieces.

Bjorn Andersson (3):
  arm64: dts: qcom: qcs404: Make gcc as reset-controller
  arm64: dts: qcom: qcs404: Add PCIe related nodes
  arm64: dts: qcom: qcs404-evb: Enable PCIe

 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 26 ++++++++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi     | 66 ++++++++++++++++++++++++
 2 files changed, 92 insertions(+)

-- 
2.18.0

