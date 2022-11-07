Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5994E61EEE3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 10:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231864AbiKGJ0J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 04:26:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbiKGJZp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 04:25:45 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3557117E3D
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 01:25:25 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id g7so15913794lfv.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 01:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jzp9MRQjovzg8BNVfT7q5u2Mz9rz7xK7aSnH6aL+IKQ=;
        b=BrpbOOAIBgScV4u/8B9HMPNJm7mtmbWK9yr8fUbq/hNPiSowN3/0GpVDkVH51/AZTw
         CfznfFysbj+ePClkC1K9fg0KDZ6fLmg9zeJS2UPS9W2+1Udm7efjvHMRmeTRXb++boU/
         KYsiLecYoyccCEPzvsuHWkfqZlAF4CKSWYm5drYzf9/qa5P0UCvPnoK2ZsG1ttTqhBVm
         dLaMRfpMAMpNQHH6meVUmcNcWuKqLYeNhJ/sdyXNh+dQ3HQi1ufHj9YJkeKn0An9y5QT
         u29B34IcH7fWnMi/dwkX/2WECStNg6Ty3c3z2iImYKdfUhFEtNy6vP/PVeoKaAK/atZX
         /CdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzp9MRQjovzg8BNVfT7q5u2Mz9rz7xK7aSnH6aL+IKQ=;
        b=phMKCrmM4ud6NKceP3dZx3tnsrxtWJEr1nSEyzwtHQlZ96AiJl8TsxJCqRs0rSLPsp
         SG5mqVqFnQCReUNxQgC6dUxcyskVaZYHDgA8J8rgGKr8ZizgGg7eAk/BW/bw044Il5Sf
         NiaZkk1gTYHB1njg71cAe0Sm5eFDJgtRwsKfqKIXRhf0PJHybFEvKibhO7xWa3gSKe/I
         TvahmBdPF6EVd/a56hOMkEKLfLnIRZQJglDETRplYMO0EvEQdYcCwt2nWrPaEukJ00g0
         cDuarvgEluqsXyfY9nrk3EEMPe/qAdzuGaOWN8SpmC9lsb9Qw0l2W1DXzCRPJO1tDRQZ
         JcPg==
X-Gm-Message-State: ACrzQf11b/KjR8rUFYQOHmbV24IwU7apEeOy5MNBDAlSxb0oonun8kQy
        bhOKD077Fe5UEWQJuaphCE3jcpHWYgRfJQ==
X-Google-Smtp-Source: AMsMyM6rdQchz45OLMip8PQQtIc21znakXUaH2kLPl66OJspBcUv5GyyCC7yvlA/wacC1dlZQFrGgA==
X-Received: by 2002:a19:2d0d:0:b0:4b0:975c:f1cd with SMTP id k13-20020a192d0d000000b004b0975cf1cdmr14362039lfj.361.1667813123338;
        Mon, 07 Nov 2022 01:25:23 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id t1-20020a2e9d01000000b0026fa9e19197sm1126150lji.36.2022.11.07.01.25.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Nov 2022 01:25:22 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Update Konrad Dybcio's email address
Date:   Mon,  7 Nov 2022 10:22:07 +0100
Message-Id: <20221107092207.5832-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use my new Linaro address in place of my SoMainline one.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 03ae061c5f6f..16751383a233 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2641,7 +2641,7 @@ W:	http://www.armlinux.org.uk/
 ARM/QUALCOMM SUPPORT
 M:	Andy Gross <agross@kernel.org>
 M:	Bjorn Andersson <andersson@kernel.org>
-R:	Konrad Dybcio <konrad.dybcio@somainline.org>
+R:	Konrad Dybcio <konrad.dybcio@linaro.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
-- 
2.38.1

