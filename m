Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E967D34B286
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Mar 2021 00:14:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhCZXNn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 19:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbhCZXNI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 19:13:08 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B71C0613B2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Mar 2021 16:13:07 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id gb6so3293066pjb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Mar 2021 16:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RTdHDCHlxXS8HeXSDnDZD3RZIWu2U1jLMoVFhKk9uuM=;
        b=tqk+vNwsyxyoPrT/4uwLsfPSsJfJLmHKaH2sFf9Sm0hHUaMOyD0iGRPb0pdRxQTDX+
         jnhfqs7rmr5I0Ne93LEoZRDLlsVEgYIZrGkawQMhANhZVdN6pCpoEglXU8xepaaz8X7g
         MVT62FH0HE1RG6WK7INy6F8iFN5yeyIN69xGySnE9/aTSYQ6lBcJqhYyqWgCMHGVtePP
         OIlOWe4srTlGGGaFZvawZAIRQ7+3UsfykJqdrI2X+PqRhny5h6W9vd3wGGi97x2zOVR3
         AK+ULm6tEVndXhLQOBXx7PBOOvscFNj2wXezcU9dbJ2JnnIz8gEYnygRABk64icizlQI
         nDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RTdHDCHlxXS8HeXSDnDZD3RZIWu2U1jLMoVFhKk9uuM=;
        b=iw3dQeyUu7WDHC95Oc4Nugcg/jMtwCA5L+sxpnboD7LhZw9bKrHzZHYzRf9Qe7MHuf
         KoxsGufEr3lWvAmiXAvspRUsX/fmWOwKp7FtGVcM70ycjWI5aQj2XJKXOsnop4rtDFTY
         V6iDyeE+HoeSDS7MXcyAwl4f2AEdNq1aoZFd3dcvyjbQLSDbJzRo8MQ+0NMDp/FMRh6z
         sZK3LFHiiWLjrhCUUhq9wqhwW59nPflOTQnib4E50bRFa70iNgfNCk0W99Jq3nfaQofW
         8h9iu4OITOJ67x+Gxba2HZ1ay8J/yhC0hV8twbfAgrLqDi056PSG37OsKLy+HhzCqnQh
         5nEA==
X-Gm-Message-State: AOAM530pa4JUxH74ES4SFNiAeQYtGo3SyRJBNLbSVtetgabpM73urbhS
        QhkWy/nWjdYcmw630fGTTmAFDw==
X-Google-Smtp-Source: ABdhPJwrLBWoDVJESET9o3RwESKcoXCf5vFjRT3X//QluFNvOGifh7lmWXe8XeObhYGuwGrnT5VyHA==
X-Received: by 2002:a17:902:b40e:b029:e6:837f:711 with SMTP id x14-20020a170902b40eb02900e6837f0711mr17334986plr.2.1616800386711;
        Fri, 26 Mar 2021 16:13:06 -0700 (PDT)
Received: from wildbow.anholt.net ([97.115.138.77])
        by smtp.gmail.com with ESMTPSA id a144sm10289325pfd.200.2021.03.26.16.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 16:13:06 -0700 (PDT)
From:   Eric Anholt <eric@anholt.net>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>
Subject: [PATCH 2/2] arm64: dts: msm8996: Mark the GPU's SMMU as an adreno one.
Date:   Fri, 26 Mar 2021 16:13:03 -0700
Message-Id: <20210326231303.3071950-2-eric@anholt.net>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210326231303.3071950-1-eric@anholt.net>
References: <20210326231303.3071950-1-eric@anholt.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This enables the adreno-specific SMMU path that sets HUPCF so
(user-managed) page faults don't wedge the GPU.

Signed-off-by: Eric Anholt <eric@anholt.net>
---

We've been seeing a flaky test per day or so in Mesa CI where the
kernel gets wedged after an iommu fault turns into CP errors.  With
this patch, the CI isn't throwing the string of CP errors on the
faults in any of the ~10 jobs I've run so far.

 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 6de136e3add9..432b87ec9c5e 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1127,7 +1127,7 @@ cci_i2c1: i2c-bus@1 {
 		};
 
 		adreno_smmu: iommu@b40000 {
-			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
+			compatible = "qcom,msm8996-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2";
 			reg = <0x00b40000 0x10000>;
 
 			#global-interrupts = <1>;
-- 
2.31.0

