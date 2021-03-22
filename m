Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 338B23436A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 03:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhCVCaX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Mar 2021 22:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbhCVCaI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Mar 2021 22:30:08 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95DE3C061574;
        Sun, 21 Mar 2021 19:30:08 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id g24so11303573qts.6;
        Sun, 21 Mar 2021 19:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zvjZTnV0KXTOt6FoMEGeyuaARj6MWBBMh4fFyNUYLHc=;
        b=vKqNSZUg+4uP25F352kby1rk0lcESPnXbY/EH6+UcPNaGuBORCpLwQtO124775KkQM
         E+Lvn23aU0kTmfajV6c9rxTEdbg9QkHmhI1Rb2ED0clQ8SXGmjLoxePQHPPgGwHU/uYG
         J5whb5Ei4bDtymvIkxtyAkkzatbfAGEdmrEQL5Eikug+ZAL07EWXdtLfR4EHhGn6Uy3Q
         LMT4BRFM+7k0Z9S7r7WqNC32NBaScceHAUhmz2zbDRKXzoAN8XAFDv5cHKM7X1uvNrwu
         N9RQbP466NE75ds4abTnccq7yYKH/z60f+0Y5vmzTIoj9t1UxGguuzjUYTtmhYDbHsnv
         j/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zvjZTnV0KXTOt6FoMEGeyuaARj6MWBBMh4fFyNUYLHc=;
        b=cbCSsNaCeaYVE0dGotFlxe1BlByaoEUwiPCBmUzCq9AwFVZ/xyyKXFunIBXg52hTHm
         3ikNY3eUDLldmWa0hU8LxvQhP5HbReTtr8iLaJE00EgWHbXmvB7hCsdZ2KAuXjnJz+N9
         A6O3TVzl6x91ahvqASBeApdRsOO+9vyffhCfQtkejSrupkiJZ6uw8mkwOSKEdnntI0Cg
         omtnC69MEGYgdPox+f8flrw/1y+jZWmU+/Akl3i3HTOs3Jly13N+OdG0F6Fn0PjXhGJd
         fvPmfl/doTalMJKm4oKE47ISDOxChqRXCeY0OW1RLcMkIIz/YI1MGVKA+7mpLe1MrCF6
         Jeig==
X-Gm-Message-State: AOAM532qc4vNIEf/A3cbnCiv06z6zfD7FkMDOAM2aRDlQ7b/v7PQ3wpr
        RdHq7MOgNBRqGz8yAOq78J8=
X-Google-Smtp-Source: ABdhPJzOxpAVcvDY/QGh4hA1ktphV1/piQaxf6ge4I+IkDQwgK+SVmv3s1Yc8Nc3EZeFC4vcDYJnKA==
X-Received: by 2002:ac8:3984:: with SMTP id v4mr8253221qte.90.1616380207926;
        Sun, 21 Mar 2021 19:30:07 -0700 (PDT)
Received: from localhost.localdomain ([156.146.54.190])
        by smtp.gmail.com with ESMTPSA id j24sm9809004qka.67.2021.03.21.19.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 19:30:07 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, dt@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] dt-bindings: display:  Fix a typo
Date:   Mon, 22 Mar 2021 07:59:53 +0530
Message-Id: <20210322022953.40901-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


s/Subsytem/Subsystem/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/mdp5.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
index 43d11279c925..4b335baa3fd2 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
+++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
@@ -2,7 +2,7 @@ Qualcomm adreno/snapdragon MDP5 display controller

 Description:

-This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
+This is the bindings documentation for the Mobile Display Subsystem(MDSS) that
 encapsulates sub-blocks like MDP5, DSI, HDMI, eDP etc, and the MDP5 display
 controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994 and MSM8996.

--
2.31.0

