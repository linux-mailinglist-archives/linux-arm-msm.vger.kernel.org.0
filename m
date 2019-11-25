Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6008108FDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2019 15:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbfKYOZm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Nov 2019 09:25:42 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36735 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728088AbfKYOZi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Nov 2019 09:25:38 -0500
Received: by mail-lf1-f65.google.com with SMTP id f16so11197694lfm.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2019 06:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lk8SRgnsKjAXBRx1hwjdc4Ni4aIadkTu9BDcS7y9BzI=;
        b=zchG2SUm1v9d74lK7/a2Ov/76astU1osx0T1E+xZK0+7tbypt2wEIrGbCIGTV3fYLl
         Qrr/vm3uT1sQaljCinz5Mgcpia9mxh+xjWu1/o1DaUbLJPz2lsjywcvEzeV9OOcHFFXw
         wwb43RuNNbilDJHZe1txdK+kp9I789BbjlWlIoc5O2kjNcXsCNmVIEjI2pTkl2Zgr16S
         9wFS6rTOIN4Gq8aNErHoCVr8SiXT5GzeZqhbdGAx4PJBZVRLKf4k0ueXsbhHHwtAvpJW
         iSEd9iur/qi7eAw07BQkKObFUYbW5j3hSr4gmF2pWAMnAGDNw/8lUlzSCrMNKGQUFBUX
         +teQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lk8SRgnsKjAXBRx1hwjdc4Ni4aIadkTu9BDcS7y9BzI=;
        b=BCS+HlH3mtt4vA19NWlIq6zXfEA2oXaA0xe6Bl3H/OJb9TLDabsRmgYrKcBI681lQ8
         jKycvOR1dQcmrtMK/LRf9qM0NvpdkDb6v1hj3auMRIurhcuFqDXM9F0nAS6uoBaDUGAy
         60XnVj0nLLGlIOXaf/fFFbETExbBFfx1OwMljInKGpnYpuEInD4X9v93C6BaslkOBhMe
         ZyGsoBEVrczr8QwZlOx9gm4BRxAbw3a2d3HGZcfAMettmDwwBOH441eJsWkIPKpIjx3l
         06FFXNh/qmFOcuXhEVxJ5DCbD0cz+gJTB8LgK/nem3UR7Dx0v06x8boMYpQqu/m8D4v9
         R0/Q==
X-Gm-Message-State: APjAAAW5jxVHqbE1mCPXlYpMG8JzR5n9G7wkgDl7iyXyQkW7C6pe7/Hr
        KzlG79OyeVOqs5GGHM6mFfl7zg==
X-Google-Smtp-Source: APXvYqyE+jBtA6fW2pog7AMXr9bL2gLyOpR90A0sgyb4hzg762aBGAjB5B+6dLqfNRt+VohCnld2CQ==
X-Received: by 2002:a19:751a:: with SMTP id y26mr21685422lfe.78.1574691935705;
        Mon, 25 Nov 2019 06:25:35 -0800 (PST)
Received: from centauri.lan (ua-84-217-220-205.bbcust.telenor.se. [84.217.220.205])
        by smtp.gmail.com with ESMTPSA id 15sm4016640ljq.62.2019.11.25.06.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 06:25:35 -0800 (PST)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        bjorn.andersson@linaro.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 5/5] arm64: defconfig: Enable HFPLL
Date:   Mon, 25 Nov 2019 15:25:10 +0100
Message-Id: <20191125142511.681149-6-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191125142511.681149-1-niklas.cassel@linaro.org>
References: <20191125142511.681149-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

The high frequency pll is required on compatible Qualcomm SoCs to
support the CPU frequency scaling feature.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
Changes since v1:
-None

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7fa92defb964..e76b42b25dd6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -727,6 +727,7 @@ CONFIG_MSM_GCC_8998=y
 CONFIG_QCS_GCC_404=y
 CONFIG_SDM_GCC_845=y
 CONFIG_SM_GCC_8150=y
+CONFIG_QCOM_HFPLL=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_ARM_MHU=y
-- 
2.23.0

