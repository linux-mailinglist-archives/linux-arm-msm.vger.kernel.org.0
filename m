Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1E3C3AF4A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 20:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232366AbhFUSRE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 14:17:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232992AbhFUSQc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 14:16:32 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F7DCC08ED53
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 10:56:32 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id k5so2491845ilv.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 10:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=akzgFtmgF+CdBGifyk1rw0w+qVh3UK440Vu2WfXCaUc=;
        b=TlL31i+5DGSa2KSeDSKE9m3tLYAnA3RhVCnTFVGlGTdMzRLkIgzrHlfU+SXbfvyOAi
         I85SKzF7Tb38Qw2DaQ0I1sWUMN5VPxEjHZPWpN/ahCUE0uLa37TwMaCV9t5BeRJLcysQ
         gqu6/hH8SuyDlKrp7sbpABGnzjAetIB3gotBsMdpbHGViEQv08ZR1wjFq7nghVg5Lzum
         lgG3R4W95dE1rFT0G9c1/gLmo3XmPCcF9j2j3Tee8NWhJr0iFoMVU3mLoUFfLQfQFQOY
         yuLuEn1C7eICNG+OftUWXe5K62xGDUkMozXF1v8qN+BEt1+h+riK21MjSExGbouVwcF7
         MRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=akzgFtmgF+CdBGifyk1rw0w+qVh3UK440Vu2WfXCaUc=;
        b=LlKm1BYcyhucOztx21PE2+GodFujzHo98AO17qSTOOy9PufgGRf82j4Ovk9N/jHUEC
         80Pm8FqPCu6HqYvF+hq7edC7BVg29fDjGpNn4Rwaakuu+uWeywufhAABo6ZWkSgNmLd4
         WmwddAxSsDTXBIU53XZHQfCc85Ac07UsX656f+tUd9N66lIw+cDzUw+8TDNPZ9XTXhrY
         N8ZNfBL1G749lq4fhS0aJvg/aRTMJQJxryx7lAidw1r5UtHXtjH/1hg8eEOWwskoM23Q
         80bcQ1r7eKOr5ymizkrh2AzJf/SNV+gwKSlNwUTmtWpy61vC0goT0XgoxMgW/3V3UQgY
         xVlA==
X-Gm-Message-State: AOAM533Mo+7H7NFifR73uTiNg9IV56bHRcGrMyHpo3gS2CvB8LaIsF6R
        Wkn/ByJI2HxKaT8oO+q6i+VFQA==
X-Google-Smtp-Source: ABdhPJymfUiaLImoqo/ZgRpFizkf3lHZ3nBsWiL0ig19escJ6nfeuMQRVdWv8xlA7GJtFLkiKnjKRA==
X-Received: by 2002:a92:2a0a:: with SMTP id r10mr19224965ile.274.1624298192234;
        Mon, 21 Jun 2021 10:56:32 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id m13sm6259264iob.35.2021.06.21.10.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 10:56:31 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org, robh+dt@kernel.org
Cc:     angelogioacchino.delregno@somainline.org, jamipkettunen@gmail.com,
        bjorn.andersson@linaro.org, agross@kernel.org, elder@kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/6] dt-bindings: net: qcom,ipa: add support for MSM8998
Date:   Mon, 21 Jun 2021 12:56:22 -0500
Message-Id: <20210621175627.238474-2-elder@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210621175627.238474-1-elder@linaro.org>
References: <20210621175627.238474-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for "qcom,msm8998-ipa", which uses IPA v3.1.

Originally proposed by AngeloGioacchino Del Regno.

Link: https://lore.kernel.org/linux-arm-msm/20210211175015.200772-8-angelogioacchino.delregno@somainline.org
Signed-off-by: Alex Elder <elder@linaro.org>
---
 Documentation/devicetree/bindings/net/qcom,ipa.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index 5fe6d3dceb082..ed88ba4b94df5 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -44,6 +44,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,msm8998-ipa
       - qcom,sc7180-ipa
       - qcom,sc7280-ipa
       - qcom,sdm845-ipa
-- 
2.27.0

