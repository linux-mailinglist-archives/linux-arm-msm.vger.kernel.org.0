Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD077C5028
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 12:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345948AbjJKKcv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 06:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346072AbjJKKcv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 06:32:51 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 536F292
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 03:32:48 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-505748580ceso8426959e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 03:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697020366; x=1697625166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLMM8iJLu30hrQyN+J6YeFrjzpqH0dHr2+bM9XqLIfE=;
        b=tK8qo+ecsXE4f1ezjug04Bm1VV0nr38WHFSj49GF3vy180QIvLdLfB3sSgPU11LB6E
         qno8kJq+2K5UbHP6lGWyiffU2RmeQDnGHztcXfEF0SKTcwsghkDnH82lh/TM99VvSBsY
         wPYD7tClM5nDRBtUIveAVk6fsjwBjyO3BDa3lz+QkjCh1zx9DJH/nqkjNkrE61bjUqm6
         bkHHuTCKDlb68SBKq6R4ztDxDJ+FR2gtErNrCBnDc5zTE/65EY3L5k8bs/fL0MG7WdyY
         gXp1jT9qqQWjGyAd+NzPu7Wjptx3GmL3D5nHopzWr1q3HoAzzyPlibHxLIjPVVCIka7U
         ukEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697020366; x=1697625166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLMM8iJLu30hrQyN+J6YeFrjzpqH0dHr2+bM9XqLIfE=;
        b=h6UnzZ+nrhDiMyGV9fFfGatihDN9u23EySB8I/zvyRT2Lg1p3NF+Ems3O/0Ju5aegs
         /VSsR1zjWgVcaNxNF+29tFMTSVVSEyaV9e2O7u/BmVVWUA3CsRoL4CX17Nm9Kbfj7ExV
         ReUSMoD0gENZp4iuFOzMgEvov7HiTeareL9sjfePgxkwyqqe2ckAHXLTbl3VUDN9b7l2
         qw3TcZbhDe2jzM5/HIG2gTe9g2yXLHzs6kxrpG84PW1L/yz5xuHP5gfMY+Bsr4G7o/7R
         UXn52+MTX5u8oEwWuzkv1b+z8CcUhrH6w7ijyFz/WJ+kDBnNkAUB2W1ZfbPsSo+OzX3j
         WWfg==
X-Gm-Message-State: AOJu0YzFeR+1XQ9aD1Wu4MWm3kA27FRSriBSMn++MiVlJwra3zYBpR9A
        CxcR7+TNxFI3A8CX/4u5mEBfHT+H55zgGyYALLY=
X-Google-Smtp-Source: AGHT+IFO+vrRnbC3xvmZ9XjxS2Y5LxPTY4gEpPwM6fm9kBoCwc0db+t/wY1/R7Wck9jlnqoavkj39Q==
X-Received: by 2002:a05:6512:6c7:b0:503:95d:f2bd with SMTP id u7-20020a05651206c700b00503095df2bdmr20815102lff.34.1697020366591;
        Wed, 11 Oct 2023 03:32:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x2-20020ac24882000000b0050574829e48sm2195517lfc.298.2023.10.11.03.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 03:32:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 2/2] arm64: defconfig: enable DisplayPort altmode support
Date:   Wed, 11 Oct 2023 13:32:45 +0300
Message-Id: <20231011103245.96638-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011103245.96638-1-dmitry.baryshkov@linaro.org>
References: <20231011103245.96638-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the DisplayPort altmode, it is required to get DisplayPort output
to work on devices like Qualcomm Robotics RB5 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9509a73db774..5807397e645a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1048,6 +1048,7 @@ CONFIG_TYPEC_MUX_FSA4480=m
 CONFIG_TYPEC_MUX_NB7VPQ904M=m
 CONFIG_UCSI_CCG=m
 CONFIG_TYPEC_MUX_GPIO_SBU=m
+CONFIG_TYPEC_DP_ALTMODE=m
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=32
 CONFIG_MMC_ARMMMCI=y
-- 
2.39.2

