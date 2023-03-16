Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 074176BD2B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 15:51:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbjCPOvq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 10:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbjCPOvp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 10:51:45 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75B68AA25B
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 07:51:43 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id t9so1945567qtx.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 07:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678978302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCPQuLjvLejF5Bs9SISYbcocVLoSdH1EFnC28LHWJfA=;
        b=IuQIGEw66a482p1YniFxZvunqJqPMKdI3zvhvlAXGvUX0rYqCYHraV7TlilLeJteEd
         sRe2nwI+wbzGHGZj06Hymz2Du8IRlsU31IGLTtgA3q1rfSfK6ZgQt2eoI0VMz4E5OTDW
         KHBz1ms0jtfF1ax2r+vV+DE4bgvG+vU8XKJT39OdjnaKhlPSpZlBhDna6AH3/7UhEZAD
         R7AYtM7H9NzY+j0AX0uVEeIE0KaXhAfd7FFekpQctiYBS214Oicq6TiRU7TTNCmQZ6IH
         00snNUNm1t5acXSpGthanuHoSMLHO3RXzm0n0mMDf79a4+TKKrIfpPj0whDG2pY/Rf08
         6eQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678978302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCPQuLjvLejF5Bs9SISYbcocVLoSdH1EFnC28LHWJfA=;
        b=7DLFl0CEw12uxfjGxGUK2t1RdduitcnIEFRctyqPCVgh3rMkQ2JetcSh0NP8sbUvou
         vn5xMhHBHXpipZCxqzdSoFDNuMJl7SCulGeHGZ+pOFXWXDy8O6LyIUNWZdtYxXW2M/4r
         z6eo7MZW7o5423bRke+/bL9f/OvNtENIWXB6mPfGE0XdfolZpNRs3SezaV9uIE3N+01N
         TE+2madZGpOzxb/bx64GvBibfG1IXfCpOXhuGvB6cU/VmoiLEfi6glP7g592Jl9Rg9E5
         GQ59s7jDSfx3oWupi+IG/GrkyKilf28wfcRzUY2AdQc95IvcKt2kSt3up+kEzJaW8mD7
         oLhg==
X-Gm-Message-State: AO0yUKWQwX11c0XKYIrpWEI1A9syoSLuOEpZugtGsix0Q0OuGe+Kz6Bc
        sH6WZIOVStHwIgsIzeF89HPSzg==
X-Google-Smtp-Source: AK7set88m4FG8rPtIvz1v9Fu9IFGHjZ9TuiNU4Bs9nFGYtCQsOf32cxMsCgjrmcB9UIcXaEWUZm4pA==
X-Received: by 2002:a05:622a:1653:b0:3ba:1d8d:f6d0 with SMTP id y19-20020a05622a165300b003ba1d8df6d0mr6177955qtj.23.1678978301805;
        Thu, 16 Mar 2023 07:51:41 -0700 (PDT)
Received: from localhost.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id n129-20020a37bd87000000b007456b2759efsm2844070qkf.28.2023.03.16.07.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 07:51:41 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        andersson@kernel.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net v3 1/4] net: ipa: reg: include <linux/bug.h>
Date:   Thu, 16 Mar 2023 09:51:33 -0500
Message-Id: <20230316145136.1795469-2-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316145136.1795469-1-elder@linaro.org>
References: <20230316145136.1795469-1-elder@linaro.org>
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

When "reg.h" got created, it included calls to WARN() and WARN_ON().
Those macros are defined via <linux/bug.h>.  In addition, it uses
is_power_of_2(), which is defined in <linux/log2.h>.  Include those
files so IPA "reg.h" has access to all definitions it requires.

Meanwhile, <linux/bits.h> is included but nothing defined therein
is required directly in "reg.h", so get rid of that.

Fixes: 81772e444dbe ("net: ipa: start generalizing "ipa_reg"")
Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/reg.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ipa/reg.h b/drivers/net/ipa/reg.h
index 57b457f39b6e2..2ee07eebca677 100644
--- a/drivers/net/ipa/reg.h
+++ b/drivers/net/ipa/reg.h
@@ -6,7 +6,8 @@
 #define _REG_H_
 
 #include <linux/types.h>
-#include <linux/bits.h>
+#include <linux/log2.h>
+#include <linux/bug.h>
 
 /**
  * struct reg - A register descriptor
-- 
2.34.1

