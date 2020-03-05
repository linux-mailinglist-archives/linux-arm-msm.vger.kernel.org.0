Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4452717A82E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 15:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgCEOxx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 09:53:53 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:45368 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbgCEOxw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 09:53:52 -0500
Received: by mail-wr1-f43.google.com with SMTP id v2so7361973wrp.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2020 06:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lCZ4HBLcDjnL0GdiZ5dsCCZ5Ed4ecHOyKpkVxr2Wiks=;
        b=yewZkC5Pn9QnislGnz/uZFfnAAGZWyd7Ao8vvhbNkIKtHlSvMCkKMmeqn2RnBR749E
         Q/Tsersijkoxdqb56hKlHqu8Y6xz0TKDRw78BcLFLdeRtsS8LqnQmKOdMmFpGJSVy5I6
         xMC6STJnPA+hgvvcxotH0AS1oagHWOHjuNiwoGEtOOLYYysTPnaLwD78XH9mnWKH15JM
         Z4cHOLiZpLFdN2nqzAtofFYq8Kf8nXLPAFEnKEnQG/Vlc2Vu08qESciVnElHIZrKnU06
         tUPrTHwcbX/ifBZ8bQj9KwplZ4xVmzhjYFRz8+Mrg5ACXuHP4Qs7T6qCiSKoH0Pihbgx
         M83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lCZ4HBLcDjnL0GdiZ5dsCCZ5Ed4ecHOyKpkVxr2Wiks=;
        b=X4DaF7BdUTeASgeqjZLVuhSyBbh5n6VpYtgOGBHtWGvGgGxv6Aaodvc3vXyW55vi8s
         CQBzeMNbxE2b+JF5+rHKt+gggVVIjkR2vl507jla5ABMglmVPEBX4SfXJz1TGxIf5QZZ
         ydM7qRI7fEGnFsE0sIre43pU+avfV96WWUtWXpzgyuFdLZhBy/MoqvsG2a4byH8tciNQ
         5n98trkztoETkTsY6yzHBvv0ex7+ImNd1jfg3XkUH/vLtIusdtJiuXaWR5Ukk2QKqM3m
         E1xTza2v3vnR3+Jlos5VjnsCyWeif7aJJaHj5jDQZCO08hmXDjkvIErW7/uSUabaxSJf
         xSUQ==
X-Gm-Message-State: ANhLgQ2KZCn5xONDmpbz5yCsgPdBnNE7lr/a+6SzO7F7HSJnON6czN7h
        uPQfrAU6GDLbDoeafLiPjVxB8A==
X-Google-Smtp-Source: ADFU+vsfm72FlPKo2DedsUpzOgx9vtyfPB8peWEuftgmEYyDsNFyRjk9QP5ylKJRXp0nOMtr/hbdHw==
X-Received: by 2002:adf:e3d0:: with SMTP id k16mr10701691wrm.260.1583420030754;
        Thu, 05 Mar 2020 06:53:50 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id f16sm35785985wrx.25.2020.03.05.06.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2020 06:53:50 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/4] arm64: dts: qcom: sdm845: add audio support
Date:   Thu,  5 Mar 2020 14:53:40 +0000
Message-Id: <20200305145344.14670-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

First 3 patches in this patchset adds support to audio via wcd934x codec.
Last patch adds support to i2c/spi buses on Low speed expansion.


Srinivas Kandagatla (4):
  arm64: dts: qcom: sdm845: Add ADSP audio support
  arm64: dts: qcom: c630: Enable audio support
  arm64: dts: qcom: db845c: add analog audio support
  arm64: dts: qcom: db845c: add Low speed expansion i2c and spi nodes

 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    | 147 ++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 338 ++++++++++++++++++
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts |  91 +++++
 3 files changed, 576 insertions(+)

-- 
2.21.0

