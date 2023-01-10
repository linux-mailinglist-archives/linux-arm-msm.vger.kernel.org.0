Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02C71664C92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 20:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbjAJTeo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 14:34:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231612AbjAJTem (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 14:34:42 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FB4B55853
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 11:34:40 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id d17so12891423wrs.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 11:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKtuniFIzy7OJ8t1BPYmK/NgDRSjhX2Ks6TsmLUmwAk=;
        b=IGMFR6HOp2nJ0B8DUk6bMuZBUWadoqX+CDMsRtkeoM7k+50UtCZ4WPHL5f8SNldRPQ
         Xzi/OH+KqD48bJmUcqZVv79Z2FFVZehgekmRqdgsyiFKi+1arVxvrK8Ha1cDo/4K12FX
         e+nHwKTckHnMPSBXvoKhclMmNTzH8fL5+uW1Jh44wLXwxwMUEVs/b2IIN3t/DDig1Rhq
         uknbhrqne5P9uhR3zx4Kg8oCLF9pILTVpBh0f99JnVUMx9a073nEqjuS/sBUJVIHmCsc
         J8duv3dTc1dDDFtmnHOJIaSM4sbUL2ZfaKSIhj+0j3sQzT0b2BItpkvPYlJPMdHbD+hj
         BGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKtuniFIzy7OJ8t1BPYmK/NgDRSjhX2Ks6TsmLUmwAk=;
        b=m4i3/v1G7BvsRVDW4ez4faSWK9Sp2XSvWAOg81mWYiA9QdskF+Z3mTXjAYnVlQ/hSB
         +N3K36kDmz3NwjUTL6BJZyK82kaKZS/wiq2XnbCOtlqD+NBr5a0UPkPSnKJFxjnwY+ni
         gc/BHPCxM0xQtvWAegvtOv3sIX0uIGMpMDiuR4R72ybLnPJSsn1nwFY60nfG2U/f1+uY
         JoEN+KBvjrF+UP9WI5+b0Ngd89rRPrgYYP2+ZLTACl1VkAY7zrJOZcnggDhHyq4Bvius
         wzqnSK06hM6LI/hRwXQzkTt1ee95OryDAQ7UxiA1QFFz4TMySfG57OvGQae0ZOOdUgBo
         cSjQ==
X-Gm-Message-State: AFqh2kooUL/JoYd1fNfNzPNz8c7JmjunF66y0+3igA9C0xKGNpIjckOt
        YD4y5+9t48oVgc8ADGvsZvrJUQ==
X-Google-Smtp-Source: AMrXdXsF/Enu3nB/R+hEIdP9Ap2ZCYdAorLT8QjHXpburlLgdLD0e1Yk82gz4NTvWd0CyB4K7V6uiQ==
X-Received: by 2002:a5d:5a99:0:b0:236:8fa4:71db with SMTP id bp25-20020a5d5a99000000b002368fa471dbmr59384623wrb.1.1673379279261;
        Tue, 10 Jan 2023 11:34:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f3-20020adfdb43000000b00236883f2f5csm12222271wrj.94.2023.01.10.11.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 11:34:38 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 10 Jan 2023 20:34:33 +0100
Subject: [PATCH 1/2] arm64: defconfig: enable SM8550 DISPCC clock driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230110-topic-sm8550-upstream-display-defconfig-v1-1-9941c8083f10@linaro.org>
References: =?utf-8?q?=3C20230110-topic-sm8550-upstream-display-defconfig-v1?=
 =?utf-8?q?-0-9941c8083f10=40linaro=2Eorg=3E?=
In-Reply-To: =?utf-8?q?=3C20230110-topic-sm8550-upstream-display-defconfig-v?=
 =?utf-8?q?1-0-9941c8083f10=40linaro=2Eorg=3E?=
To:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Build the Qualcomm SM8550 Display Clock Controller driver

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 851e8f9be06d..004c379eced7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1107,6 +1107,7 @@ CONFIG_SDM_GPUCC_845=y
 CONFIG_SDM_VIDEOCC_845=y
 CONFIG_SDM_DISPCC_845=y
 CONFIG_SM_DISPCC_8250=y
+CONFIG_SM_DISPCC_8550=y
 CONFIG_SM_GCC_6115=y
 CONFIG_SM_GCC_8350=y
 CONFIG_SM_GCC_8450=y

-- 
2.34.1
