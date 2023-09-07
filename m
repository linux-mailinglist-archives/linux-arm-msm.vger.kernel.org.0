Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 934187979DE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 19:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233767AbjIGRYt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 13:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234587AbjIGRYs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 13:24:48 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF801997
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 10:24:25 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50078eba7afso2098226e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 10:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694107393; x=1694712193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IGORlEL+j7QOCTKX6XyQpE4GsPUdQpP3Lht2awpSqA=;
        b=oCe+biU7e4pSmzgn/RQT85E72g5n1VzERdXlw+zYs6aOuSQ9WooLcVG/bToMLFNzIH
         2pmjuAkHyiS1a5I1r2YWLAIDRQe+ZA3nJ2GdRC7c+SJy9xCk/+v/EFFXrl7UEuhhTIG7
         2hr9/G0bsE3rERGdTIubP5X7AnS+GhVMGZSc3ot+kIgKxtoJwx7BX91X1L09tjMj0b6d
         nfKsf5Q7seARIoK3IztS4ow6R7kNhBRgAHEerT7lnszrqpgKEbTr3Gt01HRImKIwpvNo
         k3grG4VTm00ZpOkE/x/9pMa/MYpld9HmxoyAsuvnLVhAabxI3t4xeW0JkmUCgLgOkYVb
         42FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694107393; x=1694712193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3IGORlEL+j7QOCTKX6XyQpE4GsPUdQpP3Lht2awpSqA=;
        b=K3iXZSPetW51wd209LfRY/VfuMfXLo/FuVG0N65F89tljf/aIlCRv4jD0kpuvGy7hN
         bUKI4IMDAFFB5/5xSRpX94tgJfdIeiW5OuM9/BcZAeLYwyI0q+ZVqNtwaKE3rWMXISGo
         8Imo6gvj3NQRRuBZGXnZtF5xeAQTqxzhSaw3hZi/DqxaYtRbrLw6VJTC/zv+RSUd1pf7
         0PGaumkRej5Voh8w/0qk46r+0eomO8vfppYqXD5IAauYQpZhS1Xw7Q2Qq3coTBYlKAHm
         8egO5Y07ci4E6qw8/8y8mwNLacdARuwu/w9+NMc9noeFxj+i3Aifa4j6rfKzSyjI18YN
         xgrw==
X-Gm-Message-State: AOJu0Yzn6GtWjku9nmlWQzuRxjIOHleRWRfGyXTkM+9TxU0fkx9EADU7
        DAhBJMhoeRkeipGaW1/PEFpRu1065mj4pWQv9MI=
X-Google-Smtp-Source: AGHT+IFFhtFOfyjIUjTQaoISN3ahU3GulYsY3a4nJuObsLIa20hRbGZNlKWDpuep8zKWObREFaQEoQ==
X-Received: by 2002:a5d:6504:0:b0:31a:d4a9:bdac with SMTP id x4-20020a5d6504000000b0031ad4a9bdacmr948wru.11.1694105072392;
        Thu, 07 Sep 2023 09:44:32 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d15-20020adffd8f000000b00317ab75748bsm23822145wrr.49.2023.09.07.09.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 09:44:31 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 13/17] media: qcom: camss: Fix support for setting CSIPHY clock name csiphyX
Date:   Thu,  7 Sep 2023 17:44:06 +0100
Message-ID: <20230907164410.36651-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
References: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Several of our upstream and soon-to-be upstream SoC CAMSS dtsi declare
csiphyX as opposed to the older clock name csiX_phy.

Right now the CAMSS code will fail to set the csiphyX clock even if we have
declared it in our list of clocks. For sdm845 and sm8250 we appear to "get
away" with this error, however on sc8280xp we don't.

The right approach here is to set the clock when it is declared. If a SoC
doesn't require or a SoC driver implementer doesn't think we need, then the
clock ought to simply be omitted from the clock list.

Include csiphyX in the set of permissible strings which will subsequently
lead to the csiphyX clock being set during csiphy_set_clock_rates() phase.

sdm845 and sm8250 will work with the code as-is so I've omitted this from a
suggested Fixes list.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 87d6d65aa90cf..5202bfcdbc35a 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -677,6 +677,10 @@ int msm_csiphy_subdev_init(struct camss *camss,
 				if (csiphy->rate_set[i])
 					break;
 			}
+
+			csiphy->rate_set[i] = csiphy_match_clock_name(clock->name, "csiphy%d", k);
+			if (csiphy->rate_set[i])
+				break;
 		}
 	}
 
-- 
2.41.0

