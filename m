Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2CEA17310C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 07:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbgB1Gcv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 01:32:51 -0500
Received: from mail-pl1-f182.google.com ([209.85.214.182]:38074 "EHLO
        mail-pl1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgB1Gcv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 01:32:51 -0500
Received: by mail-pl1-f182.google.com with SMTP id p7so849268pli.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 22:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dtcRx/xrQcP0C0zv1gSyxKTgfZjSQZqO9VhWjTr/Rf8=;
        b=fctCtUQXeEJuPvJTvnsSzRpmaM69ybDBogj8K0in5rgbuquVAaguD7FvrQdIoJQ18d
         gh5r3RY8/kRzkPcP0ILXzEC7n0X9FnHwrWynuI1FChMQtzZkU4mDjdoRY8YsCIXBr5QC
         4lsX+vmTpX2j7cTQJZCT6shFP1sb1CEYZf/hgqskdiGhq+LEfpTLywFZfhXSAQG0bHoT
         eMs5fDaoqke19VeezsAb0N6zzye0sR4hTxDUpcEtU82x3j2NzK8OCUECmJQPoEf4nafi
         qjS1JC682spxFN3dQQT0xw7RRq2WfX05SLrtnaR6TxyVaGYV1oyV/yiIKfl7uoUa5yF9
         a08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dtcRx/xrQcP0C0zv1gSyxKTgfZjSQZqO9VhWjTr/Rf8=;
        b=hZVuqXRdRSBd43YFjS5kmmEelqOcsDlhaODht+lfqUEh1fnj7qPukfC0+5sblB4QvL
         3vKdEtGe1UsmpGg3EiAHNDh6JuWohqB4LrL68nqSX4guHSiy7uh1Qm39zNlm+RlnScjD
         /C5iB8mF6OYu26JMJwBLBoqi2iRtI92bAIlAHVmFmnzcDjAo71aIYuNtGtU4Nma+N8XS
         iPhCl4k8/B3EXT55rqtN8x4Y9sg8kPS37UqcI2D/DhF80lmJQEvE5tHeaqiZbHS6GjnI
         2Aa0Op5ZhXypkptTKvVaTmXWc2asSMroCKrE0lbfHlExfP0bPSxpxL2/LtcwnJnjmmuK
         moFQ==
X-Gm-Message-State: APjAAAWERz2QiY3Rj/T8RtcIoz8kfdBnLeezgtyvjMwegqVF1HsfeF7v
        Ao4uysa95QXLTk0F7eL52oeAcQ==
X-Google-Smtp-Source: APXvYqz9kjSDoKMHEw4EyvHBEIxPfo4zgvKkRo5JXyyFZ8yKQKx+Rc+7EnCJ4hfYEadj0CglZKMFsw==
X-Received: by 2002:a17:902:a408:: with SMTP id p8mr2724487plq.132.1582871570204;
        Thu, 27 Feb 2020 22:32:50 -0800 (PST)
Received: from localhost ([103.249.89.56])
        by smtp.gmail.com with ESMTPSA id x7sm5555746pgp.0.2020.02.27.22.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 22:32:48 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vkoul@kernel.org, daniel.lezcano@linaro.org,
        bjorn.andersson@linaro.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH v4 0/3] Cleanup dtbs_check warnings for tsens
Date:   Fri, 28 Feb 2020 12:02:39 +0530
Message-Id: <cover.1582871139.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make dtbs_check pass for tsens bits. I'm working on another series to
cleanup other DT warnings for QC platforms.

Changes since v3:
- Fixed up subject prefix
- Added acks.

Amit Kucheria (3):
  dt-bindings: thermal: tsens: Add entry for sc7180 tsens to binding
  arm64: dts: qcom: msm8916:: Add qcom,tsens-v0_1 to msm8916.dtsi
    compatible
  arm64: dts: qcom: msm8996:: Add qcom,tsens-v2 to msm8996.dtsi
    compatible

 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi                     | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi                     | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.20.1

