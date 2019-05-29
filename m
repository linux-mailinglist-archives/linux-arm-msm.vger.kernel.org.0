Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1192E0EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 17:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbfE2PU5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 11:20:57 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38773 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbfE2PU4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 11:20:56 -0400
Received: by mail-pf1-f196.google.com with SMTP id a186so1148041pfa.5;
        Wed, 29 May 2019 08:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6eBFjJD3aKGHAnE+1SU5t9f9CGu+6Cenasy6t4yondY=;
        b=TMVdakylrYLBvS2e5FOebfvoGSXphrNfI/wi48cmsmulTCmDUCQl2XZ1pnfkPhD+Kz
         XXQ2h123ZVKesKWktsdo8DPi/oXehWqbtILrCjetGEarTs5bIVZzXUrBcjjlaBVQRoPB
         v/CX+hi/30AJi8edW2rfnzrw+G5BAR7oSPbCWEhPA0XmmRVvReTFw6NsxINTHxXpWJ2O
         ABs8j8l/DrtDCy7V9vYBKUj6b+wG4xnthkdYaUThkzm8qY+P4faUUsSVW8p0/izoDs2C
         PCrjyoH7HVE2b/gJAI5dxkS92vTsowAj7FB17FDLd9bb8ojtHKVeaIxHtXXuQXjLv2bX
         vhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6eBFjJD3aKGHAnE+1SU5t9f9CGu+6Cenasy6t4yondY=;
        b=THjKKbwyj6cE0qSkx8bCOcsvQ+8ZhVHBBrvbzCgFG/Kui6hgeJInr7ng8ntlI940/C
         9qDhzThAAmhxsuzExgOlaGyPDo4Vox056Xnj97N3/0Eh82uC0lpiCUICYZWi9GUTD2zD
         4ICCzVfm4727DRYQen577BOPopsiuVTF8If1Ga8Fxiu+xT7H4Gi+1o4A6voMIHovlcLW
         CLxFKeJipY+zyirDaNMmKqWHmKY4qDKejH/4q9enpj+yjtm7yjf8X4dkiRS+fC0q6d8C
         lTThQD7hmeQ/ugqTKB8qOnQ/z8GUQSisKccnGpfzGo4LpUlOo5BjlOB4gd5F75xiG5Sm
         kSxA==
X-Gm-Message-State: APjAAAXKYhvDb3HdC4FMH9Ub+N2ptnS96XTJZIXIa0FoDiauNAvt+2LF
        Jd+xDit9+LZ3WhnaZAcRYfA=
X-Google-Smtp-Source: APXvYqwsK9X6twfjEGzAr+bheko4HzYhn9BKzUdjsEJUCaqDqloGZnrPP305oVLPbHSR/dRnlkFKIw==
X-Received: by 2002:aa7:9ab0:: with SMTP id x16mr140644220pfi.201.1559143256356;
        Wed, 29 May 2019 08:20:56 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id r7sm6198321pjb.8.2019.05.29.08.20.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 08:20:55 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, jcrouse@codeaurora.org
Cc:     marc.w.gonzalez@free.fr, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2 1/2] a5xx: Define HLSQ_DBG_ECO_CNTL
Date:   Wed, 29 May 2019 08:20:21 -0700
Message-Id: <20190529152022.42799-2-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190529152022.42799-1-jeffrey.l.hugo@gmail.com>
References: <20190529152022.42799-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

---
 rnndb/adreno/a5xx.xml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rnndb/adreno/a5xx.xml b/rnndb/adreno/a5xx.xml
index ae654eeb..16203512 100644
--- a/rnndb/adreno/a5xx.xml
+++ b/rnndb/adreno/a5xx.xml
@@ -1523,6 +1523,7 @@ xsi:schemaLocation="http://nouveau.freedesktop.org/ rules-ng.xsd">
 
 	<reg32 offset="0x0e00" name="HLSQ_TIMEOUT_THRESHOLD_0"/>
 	<reg32 offset="0x0e01" name="HLSQ_TIMEOUT_THRESHOLD_1"/>
+	<reg32 offset="0x0e04" name="HLSQ_DBG_ECO_CNTL"/>
 	<reg32 offset="0x0e05" name="HLSQ_ADDR_MODE_CNTL"/>
 	<reg32 offset="0x0e06" name="HLSQ_MODE_CNTL"/> <!-- always 00000001? -->
 	<reg32 offset="0x0e10" name="HLSQ_PERFCTR_HLSQ_SEL_0" type="a5xx_hlsq_perfcounter_select"/>
-- 
2.17.1

