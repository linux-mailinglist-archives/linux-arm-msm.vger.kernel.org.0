Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8DB279988
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729040AbgIZNKP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgIZNKP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:10:15 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B22E3C0613CE;
        Sat, 26 Sep 2020 06:10:14 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k10so3764354wru.6;
        Sat, 26 Sep 2020 06:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c8nPtqvHXCkUTvUezerS3EWetfGCD8LGrLlldVmFG+I=;
        b=dwTxN0QG7iDi3lpz77IyBuW6t6ix5iibFgp1xivksLrbJPuLMbIPIfineKsqN+NBLR
         Ngch4Ue8Yo17a4NsbSVe29rhLHc3kISWQyIRdgAfOwZmdccxB1jCrj+oqpu9oAvCl8Ok
         a9qXVCqjhLrL+e1eXAfFlBOmcTIAUtcQq+hZc23xSj1JX00d3NmNqqJXpTNgIZWANAbt
         GWfj8iDZkH9c6kC5qNHwLfaeuMaK6MLwDidEoCFEDkrgGc7VSZ3b6n8CAafWjFimdsh/
         I+POYLvkjnvWuP+5D6O0rP8vwl5/EB4U0mVB79oZMdVPB7qBbpOuBjkWw5ZNgxY2cN7E
         VDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c8nPtqvHXCkUTvUezerS3EWetfGCD8LGrLlldVmFG+I=;
        b=AplQCgCs6Kv2TCPGZFyllrA/f4wr4WGBBWPYxeCgxAw/MtrAVVVw3T3n0UDTit4jse
         vgFflZTgA8BrOfrDwXyDVxkJHmjpOv2HS31qRUvnpFrFSs71x2EvqfcMoxxYO1aWzg6+
         FbilIwajfiEVasCaProBcppPtDVgJAan0+cpc4JJpuCmJJTv6K1/+phGHN+fKE0EzL4I
         6TICOQmYgi7rVr8lkeDgtsjEvDNZPz16KsPM2fH6W/qtrPknkpx62SsFxxcI3sAZ3m76
         6N/bh91UtCCbnO31UluPwD/vcraNKj9ZsQai5i0SfBjUaQXU4MAKM1wawvGL81JnxJiH
         6aeQ==
X-Gm-Message-State: AOAM530SXaLAlBJ6D2G8TMToTg76TvF6q/VRBgSWG6wr0GgHqvYGFUkC
        X6JQ483Z5N6Re815MDRrRl0=
X-Google-Smtp-Source: ABdhPJwPcJmDokV6fvLVr//OpnBK5ejMVqpzVuaKzjqb5rq8xqDcP3l8hb5eUb76A+frswgKflpq9A==
X-Received: by 2002:a5d:630a:: with SMTP id i10mr9256202wru.137.1601125813249;
        Sat, 26 Sep 2020 06:10:13 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id h17sm7196806wro.27.2020.09.26.06.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:10:12 -0700 (PDT)
From:   kholk11@gmail.com
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, jic23@kernel.org, robh+dt@kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: qcom-spmi-vadc: Document qcom,spmi-vadc-8998 compatible
Date:   Sat, 26 Sep 2020 15:10:09 +0200
Message-Id: <20200926131009.14483-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926131009.14483-1-kholk11@gmail.com>
References: <20200926131009.14483-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

This compatible is used in the qcom-spmi-vadc driver to select a
variation in the ratiometric range, valid for MSM8998-style VADCs,
like MSM8998 itself, SDM630, SDM636, SDM660, SDM845 and others.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
index 0ca992465a21..e9f0ebba5e2a 100644
--- a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - qcom,spmi-vadc
+              - qcom,spmi-vadc-8998
               - qcom,spmi-adc5
               - qcom,spmi-adc-rev2
               - qcom,spmi-adc7
-- 
2.28.0

