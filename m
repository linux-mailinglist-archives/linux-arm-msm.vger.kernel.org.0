Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC3C351DEB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 20:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237126AbhDAScy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 14:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236147AbhDASWn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 14:22:43 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 780EFC0613B6
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 10:41:24 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 12so1430759wmf.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 10:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CayjI+ZaxBb7IanGhDGf8oqmhhOv5Y1z8vyrQ6G3bP8=;
        b=MCVPtRcKJoJ+pAVgk1hRwNOSRJ0I9twTt4M5/eOLZeR1a2TRHIg+bDM7smm3JmKGng
         QuE7012Xm26zASXFmkJt0ZUMXAIZbQAKYE0X0jQOkQe/woZNRpuYUDhLzaecOheNhmpL
         8X7ydrIMOZa0RvGZjE4YAeGZFqn3/RNPzIQTZLuyIY2T3tI1QafeQbEOp198+cXYPwkQ
         fFykFt7IPhSskehBBWpKq+HSxL2hNyQ1hI2w2iaDoywf+fAD3vNVw+nf2htX7arZjSHn
         4Ii/W6MPFPmXqMo52v0GJdz83S1cXFiBWLzutvL5XJDVr30zzHGjYO2JNjs9KmqI9e18
         a6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CayjI+ZaxBb7IanGhDGf8oqmhhOv5Y1z8vyrQ6G3bP8=;
        b=Bqv4Kkc4Q39kQ20kVtOMMdke4e6rRv7eRIwdtdJSksRf6E9aCQYwS5omqFtT9QxYzV
         5Xm1inaLwaHVpcDRqrGNSM1f7MNKzZ1jNAOd7e2HgQfsW/YPaS/a3i0OCSJMal7ymLop
         WOZEU70RPbhLzIAkMlvXTbSOFMSn8AtcSz8fgn6jQghruX+73jksawTbMtEpJjcIHcIl
         5Y+j5myvGlPm5N4Sn2HTpu6J89Dt8ftY1odqO6DKiWz72hi/pBdoPe+XPGfnouOJjbJk
         sFrRsbC2dcPjesr4ovUsHzOO4iLy68qjaANKSsvfNUp2ITWbEM2jqqU10RPWE0CYDvxG
         5BMw==
X-Gm-Message-State: AOAM530y2M6N/V2ddDxLXC2o1lBmnJHaBRwEXfc33MHP2LQ7hrpOs14S
        AvJSdclyeJ2EQYeqZuslFd1t4A==
X-Google-Smtp-Source: ABdhPJwGZLId2P1JjUoqybfTseZLQ2z+C0bju3PELh8e13IWbbsx/liN682yKgj9bR5s2H7KGtRRpg==
X-Received: by 2002:a05:600c:2f08:: with SMTP id r8mr9172254wmn.95.1617298883159;
        Thu, 01 Apr 2021 10:41:23 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o8sm9070242wmr.28.2021.04.01.10.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 10:41:22 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, jonathan@marek.ca,
        dikshita@codeaurora.org, dmitry.baryshkov@linaro.org
Subject: [PATCH v3 0/2] dts: qcom: sm8250: Enable venus related DT nodes 
Date:   Thu,  1 Apr 2021 18:42:54 +0100
Message-Id: <20210401174256.1810044-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

V3:
- Applies cleanly on top of robh/for-next relevant binding applied
- Add Dmitry's Tested-by as indicated

V2:

I noticed this series doesn't apply/build against device-tree/dt/next

- Adds dependency patch from Dmitry
- Adds "#include <dt-bindings/interconnect/qcom,sm8250.h>"

Depends on dt-binding:
https://www.spinics.net/lists/devicetree/msg406892.html

V1:
Adds
- videocc
  The clock controller for the Venus core and codec blocks

- venus
  The SoC DT description for the core, encoder, decoder + associated

The second patch is contingent on application of this pending patch
https://www.spinics.net/lists/linux-arm-msm/msg80960.html

Bryan O'Donoghue (1):
  arm64: dts: qcom: sm8250: Add venus DT node

Jonathan Marek (1):
  arm64: dts: qcom: sm8250: Add videocc DT node

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 73 ++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

-- 
2.30.1

