Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96FB015AE5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 18:10:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgBLRJ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 12:09:59 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46493 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgBLRJ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 12:09:58 -0500
Received: by mail-lj1-f195.google.com with SMTP id x14so3153959ljd.13;
        Wed, 12 Feb 2020 09:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hqQgPcOhiYzRs4iHLwBqYk79r31vuxUTCA9qlX1GVQY=;
        b=Xo3polnJ9iGYck3I4GhJkFbW6nvaAq319H05p5nasV/o0Z7jj92BY5BQBiNQx3L4MN
         99J3CmizebKQ+pQkGoc81jasfq1CcdV1vfh0kFry73cR12HzXZHwekGzuRjI4c7xdM6H
         YLxlzqPgijv0sq8zX40FWcNiZUUZ3Mo9sNU85AgYr2djMWlsGAhY8SFSm6zflpT0MLiT
         czxZkjktrVZg/bnfMnF+hwH9kijpEf0tufX1+4NF9HAxKUZlLluZDnRcbfpyG9wy5h3n
         0N1dPrrhTlHdii6EJfDRO0jEwi/hwpT7c/tbZO8VKgWrZO8VfyA8Ezl6sBt1TyvzB+FY
         h//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hqQgPcOhiYzRs4iHLwBqYk79r31vuxUTCA9qlX1GVQY=;
        b=Yy+WRKD+s9gDff+MCQPrXrWDcecmwWI616gnUSaeBt7vY7KQotKbstnm2Ow78Ky7me
         5gu5ystkBIjCNtDJiTWVVC7zsdq+qleuK1ekqItHjcsUn/uAuHzkZYEMZsuKbCuMJuiA
         U9XYahIsWLH44zdPXhxidkYzkPBAmrQ83yW8zhTkipGzL7cdmWbZ3zUkA1P9SWJLORMR
         mNsGuVtovYXPk40hPudUNaw3xpTxUl0GjIsBoIqaVIP2k7OC7xA1wjvzfLmc9/jnEnrr
         zq3GQvA5Vj5vlprpksE/xrc6+RL+lA0SvsSQrdVeR8G2SluNA7xM4WBs7CtXvt5NsjTi
         sSpQ==
X-Gm-Message-State: APjAAAU4oJyalk7bbdilAMnNCeNPc2v/HZTx9juZbwscGGqwVdaFvKvT
        m8n+sQ8KTUebmvLAFZElhqZImCWL68s=
X-Google-Smtp-Source: APXvYqyvAFg8zxLLDerPnXYzXavj9gdvqYLZpHj/gsLSGHINKAb8lWhBDRIVCUtix0AF3b7rZsE30Q==
X-Received: by 2002:a2e:7207:: with SMTP id n7mr7892032ljc.242.1581527396111;
        Wed, 12 Feb 2020 09:09:56 -0800 (PST)
Received: from emb-minnehanov-OptiPlex-7060.collabio.net ([77.244.21.162])
        by smtp.gmail.com with ESMTPSA id b20sm607955ljp.20.2020.02.12.09.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2020 09:09:55 -0800 (PST)
From:   Alexey Minnekhanov <alexey.min@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Alexey Minnekhanov <alexey.min@gmail.com>
Subject: [PATCH 2/5] dt-bindings: arm: Add kryo260 compatible
Date:   Wed, 12 Feb 2020 20:09:13 +0300
Message-Id: <20200212170916.7494-3-alexey.min@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200212170916.7494-1-alexey.min@gmail.com>
References: <20200212170916.7494-1-alexey.min@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Kryo260 is found in SDM660, so add it in list of cpu compatibles

Signed-off-by: Alexey Minnekhanov <alexey.min@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index c23c24ff7575..d994c066a8bd 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -155,6 +155,7 @@ properties:
       - nvidia,tegra194-carmel
       - qcom,krait
       - qcom,kryo
+      - qcom,kryo260
       - qcom,kryo385
       - qcom,kryo485
       - qcom,scorpion
-- 
2.20.1

