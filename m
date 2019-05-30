Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01B2C2FFC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2019 18:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbfE3QA1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 May 2019 12:00:27 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34396 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbfE3QA1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 May 2019 12:00:27 -0400
Received: by mail-pf1-f196.google.com with SMTP id c14so1829583pfi.1;
        Thu, 30 May 2019 09:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JlasCBadKVSsXNr9CWB0njdLgCAXoVvqrNuDEFbuiAk=;
        b=GGmvQfnjEYqg8qQyb2/5A1vSa5dD9qVfe8yOwyW2rD/Y8VqE6iaViUCuy/BFehmPVJ
         PjpbhjyrSODquqB6uzFDXx8DgOgey45RoPlY2fqhz80ezGwluIbikPcA104eRL/U3p0O
         s7cELqrWxaZedQ99dD3wcl3EUVZyWX5l7N6FwYcxRkEfxy1jUWvObhPB9WPCcD0v94S3
         uWr5tHcjTcD3TG3nnSoRFhlHTWakjZPLtwZkPI5ayGWTRxuAomVKxg1dWzRt+vmnwbVX
         1mTYq/EfeuLTBXoihmdBHQBnNUWIeNG579eMNQmArE8MU7SCGIQtFF4FkP/CVLYe6Avq
         cb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JlasCBadKVSsXNr9CWB0njdLgCAXoVvqrNuDEFbuiAk=;
        b=fq9ryNxQG8fDWfA1DOV3OiT6+Hp3sDI07pfj6Iillb3QpMTkmxCBsef4Ki48g5d3Jj
         Ucr18jSSOWFsyqgXSMP7laO7kEElF1HQT/+ScIXgsrugKrx5e3ZpDne9aw01+zzftcT2
         mN7+3w7bpFOxDuji2UVxsTyZUcQT83EeQYv7FBsj1syChOFGi/Zc8SyvtQLPm7nC5BOo
         aAev0C3WFoXO57VnAQnjo04twyoQUwlV8GToF/h6kuZWMO2XbohxxLNeYgcuzeh0i7Fo
         wkZVRivo6uqkTg055DxL0qDGLj5XRWk/WtDM2mTNphmG3E+ggIrb+geIYPzx4bbX+o+R
         +2hQ==
X-Gm-Message-State: APjAAAXLSeeogZ0TTGWYZ2/wB0jKjFgiKmYBJqgL3skfXv3IlkQBm3lw
        WLUVgGS4+HRW51kP8Rt9+K0=
X-Google-Smtp-Source: APXvYqx7uR82rclJSLO1W53P8kcXMQFQ/il2D/p+aY+ksKPDcfYRXob0yFz/gBQQ+NFgXCTSJZ1kog==
X-Received: by 2002:a62:bd11:: with SMTP id a17mr4504182pff.126.1559232026423;
        Thu, 30 May 2019 09:00:26 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a69sm4022560pfa.81.2019.05.30.09.00.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 09:00:25 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     sibis@codeaurora.org, chandanu@codeaurora.org,
        abhinavk@codeaurora.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 1/4] dt-bindings: msm/dsi: Add 10nm phy for msm8998 compatible
Date:   Thu, 30 May 2019 09:00:23 -0700
Message-Id: <20190530160023.2773-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
References: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DSI phy on MSM8998 is a 10nm design like SDM845, however it has some
slightly different quirks which need to be handled by drivers.  Provide
a separate compatible to assist in handling the specifics.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/dsi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
index 9ae946942720..af95586c898f 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
+++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
@@ -88,6 +88,7 @@ Required properties:
   * "qcom,dsi-phy-28nm-8960"
   * "qcom,dsi-phy-14nm"
   * "qcom,dsi-phy-10nm"
+  * "qcom,dsi-phy-10nm-8998"
 - reg: Physical base address and length of the registers of PLL, PHY. Some
   revisions require the PHY regulator base address, whereas others require the
   PHY lane base address. See below for each PHY revision.
-- 
2.17.1

