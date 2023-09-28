Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA2B7B1B31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 13:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232009AbjI1Lf5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 07:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231843AbjI1Lfz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 07:35:55 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73E19196
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:35:39 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5042bfb4fe9so20149406e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695900937; x=1696505737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+25IDQ76KUI1/7TueTvDQOk2w9Kir7V1RtvH4IZRvA0=;
        b=IN4d/aKujwYW0bJRr03lJJ7/Knn5glhzWYosLWqgbwLbPpUPVy6fVW+7ddsy7vJ0pV
         FiHqBx/TUfn01eLV76nEOnLTwwzb+qnWEk87+iq7XtMFv7Sudcn3qDEyh6gXNlBAcky/
         H5ZFZDd2waSntcGz52bMGy3ZkTM/WdEDu0E6Bj8uhVT2AWO4qCB0fqcrp8iIyDzPf/td
         g9IvBW71neTIghR7RvIlzgYik0MMlHstQZKoN4jszdUzZXseKXYJ6QC+xrrcNcQqk9G7
         +LS7bX45OpkbLLdKrOvCuPEI15khHQAIx14WtiA2RHEls3YHPJvaRMYHIVClwxOlRiPo
         s6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695900937; x=1696505737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+25IDQ76KUI1/7TueTvDQOk2w9Kir7V1RtvH4IZRvA0=;
        b=cI02+iocq5oioW0R7ckULhMJZuN/PKmSAuUMlm0EaqSZEvMzPw9MNEMLyzFTJ+hREJ
         ax6zzoE61SU2HRbeXTbYlzIcm9ru+zX7PA+qQvs9aJ5tjnW+5clRvx/DxJna9pMJvg/y
         cn0ffJ1Xbden0jQHh31BvSt0q8rY6ER9epgw0dSQbz3b3PBSMSovj0ELHRz/sHlNYBkm
         5OMcfbHDmvGodK5p4bCQ0mlg1jxBf4myy+pAFdAbBmjxxAf5zK3thce1FubHrj6KCxuC
         l+lyAeELu0V7LVfb09g3F33KNdAlAH+r6bTxJMH3itSKreTW+BOYkLvDz3mza8I8Dr8g
         eB9Q==
X-Gm-Message-State: AOJu0Yw4/oLehi9jaF+N2e3U058ENwv97yJtDx6NdF5jSzxVPGlIRMko
        7OOccfdxbHsJx0mN3tNnrpxJQQ==
X-Google-Smtp-Source: AGHT+IF358+CPVuR9KqvfUAb9TMd2gvka7EXkUCLd+mlbdkUKYsBpovqFKKaWZK3Ok0fmpH0gsrUeg==
X-Received: by 2002:a05:6512:b8e:b0:503:5e1:9b6e with SMTP id b14-20020a0565120b8e00b0050305e19b6emr1083041lfv.10.1695900937660;
        Thu, 28 Sep 2023 04:35:37 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k14-20020a0565123d8e00b00504816564c7sm704327lfv.104.2023.09.28.04.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:35:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v3 1/6] Linux 6.6-rc2
Date:   Thu, 28 Sep 2023 14:35:30 +0300
Message-Id: <20230928113535.1217613-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
References: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Linus Torvalds <torvalds@linux-foundation.org>

---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ceb23eed4dce..57698d048e2c 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 6
 PATCHLEVEL = 6
 SUBLEVEL = 0
-EXTRAVERSION = -rc1
+EXTRAVERSION = -rc2
 NAME = Hurr durr I'ma ninja sloth
 
 # *DOCUMENTATION*
-- 
2.39.2

