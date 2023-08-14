Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9F577BCAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 17:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232880AbjHNPNU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 11:13:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232788AbjHNPMx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 11:12:53 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4188C1B5
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 08:12:52 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b9b5ee9c5aso68809851fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 08:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692025970; x=1692630770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqmcrIOgwT4P/m/Qo0pGRwGzeNac3H+8rfjS3Os1OQE=;
        b=za+f3pRtJG0rthDi5azffRqi/A06+IPasCTBle2NC/Bm/aznOXiFyp9Ig7FB9wMQxW
         TVlgFlEZtqhAA5Jf4UCYqw7VStHHj0SDJHU1PMjBz3NqVbeAi5KoRuigXQEJupNeVzuD
         P7/nQ4N+kyQSJNaHr9MxtKXMrxbeC9334qc4rP45XDFQPyrrhQ/pRIbXECzcM0RzHc7R
         /SSA9W+LVG7KRObt37zdGiO6zrdGI1HyG+avmDmCjyRoBjtgaLhIcXNOauMNYMLYMCkD
         e4XT2XaPSLloQ5c97fgAkHLpCQiqzU8mp285sjxs/aMrswG+Bul+CF9769pD29lj/5vj
         wwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692025970; x=1692630770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqmcrIOgwT4P/m/Qo0pGRwGzeNac3H+8rfjS3Os1OQE=;
        b=HzTB0VhAd849tdPjQkEXgH5B0Rm5eDP60x/aS+2O3NjPe05DOVwPOIS5rdAuYyYYNw
         +l5l7o6FM1sXeUZOzCAX0PhcZ6gO1LGVDXRPtG3g0XclpAYo2GQYFqtof0kwqGOFoeY2
         ZCQ49+3KmD8ksK3W8/Ftjk8J5FFQUdnF+rNYxxKOuejKyGsxiiwMFzz0lkG/0o77bzft
         RyCBAxzlk40yTk3ra2kn5V0OZfyed7xKX0wsvqboc7ak3M9NzvavqBk2okIFZxdEHq4G
         dRPIfwv92QfHBZtIXEMOWte/DOX50ICLk0rP488iOt/jvWs166tjonKTUs5deLhA68w1
         VSiA==
X-Gm-Message-State: AOJu0YwDQEDK5NKH9kwYqNn/RBl1B4m+7d3YbxLsBmxqN4+QJJYEhdoV
        9SiZ4vCM+zjN/3lDb12+Ar8y8Q==
X-Google-Smtp-Source: AGHT+IFP2/JfYkQLXDXM6RMvej5FYQ0Il9A4TqLJszbuZPWvX9l59q1ZFCk4VaLKQg7n15XSrxrKsQ==
X-Received: by 2002:a2e:a174:0:b0:2b0:297c:cbdf with SMTP id u20-20020a2ea174000000b002b0297ccbdfmr7452279ljl.1.1692025970497;
        Mon, 14 Aug 2023 08:12:50 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c021100b003fe1c332810sm17644572wmi.33.2023.08.14.08.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 08:12:49 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v0 03/13] media: qcom: camss: Drop useless NULL assignment for ispif resources
Date:   Mon, 14 Aug 2023 16:12:33 +0100
Message-ID: <20230814151243.3801456-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814151243.3801456-1-bryan.odonoghue@linaro.org>
References: <20230814151243.3801456-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The NULL pointer assignement is a redundant step our compiler will
initialize unpopulated fields as zero. We check for logical ! later on
in the code as opposed to NULL anyway.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index d9e1672b74bd7..68eb45b2c0aaa 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1729,14 +1729,12 @@ static const struct camss_resources sdm660_resources = {
 static const struct camss_resources sdm845_resources = {
 	.csiphy_res = csiphy_res_845,
 	.csid_res = csid_res_845,
-	.ispif_res = NULL,
 	.vfe_res = vfe_res_845,
 };
 
 static const struct camss_resources sm8250_resources = {
 	.csiphy_res = csiphy_res_8250,
 	.csid_res = csid_res_8250,
-	.ispif_res = NULL,
 	.vfe_res = vfe_res_8250,
 };
 
-- 
2.41.0

