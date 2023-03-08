Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E46DE6B1419
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 22:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbjCHVgR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 16:36:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjCHVf5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 16:35:57 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F6DD292C
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 13:35:51 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id i28so23205939lfv.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 13:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678311349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCbN4RipXloOvl8HD4CkfkOTvrEB1N/g8w5o4Jrwa+U=;
        b=Q0uR7+OINHQuP91/EZXRdbCXk+J6inz2D6xS2kFEsEupu3Hy0y/l5jff0oTzfm2Vj2
         GCPpj5G8+sC4k/2Z3NQeQEQjIjnpcuMzRlPGsKC88sWR1D6s2Fx8ZUFDb+RTNrkyPYIz
         v7LRe7D7D5CUlrKFrGrQNC3cRKr/sJpJwri0rUCMR+YOhBhINzedx7lSLty/MHGmZ3W+
         mkIUmbFfCS0RmFdhlngtGrxVgNgUuUcmWX8qMqPGpKYweg3Dkq7rlbKF4holXfiPVdLL
         O0UYcSvVbgUOEHGRi6oqNgxKEaPrRn/cr8ncLlMCrgB7vOAhf3yLDRgMaYeKDfX7o7+q
         Xq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678311349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fCbN4RipXloOvl8HD4CkfkOTvrEB1N/g8w5o4Jrwa+U=;
        b=d2WhaYEAFjQhE2Sd2Rxf5hD6vjWtjWp+bNZgCd5uWaJZkVLdyRc4S/eozGWF/PMI67
         wXlLf4qGfZdpqnHUyI0G1QP6CIARiyyxnEjBUgsWJZ3bZLINL0YA2PPVywAGz79WKhWt
         Z/f4XJS9/1SJWnNg1jqdexTwuEhJPwR/56n1CoVK/5SdLe7tHhlCsac2qxsMYpJfBfwA
         ern2PatKtv2wbqjTC7lBP+5HZzVv6QpJ/1bbXdqf4NEcahKXKraYXulUeK3aos2cnIAA
         nDh3J7GOrdFluFh7tfyYHuNqssqPX9/kEfacxb+zdxPPm/9XnOq339c8SvXGGTJGbtz5
         TNrQ==
X-Gm-Message-State: AO0yUKUlzeXw73KQPAYwubkiNB8i53xCb3+Gz/BRmL1qPeCM+sxllqVd
        Q+VbnCGuuV+nLqneCo5JevjclQ==
X-Google-Smtp-Source: AK7set/R90Bpp2AH47wz7bWahvZ1Wib3lh+sacEOd8AoT/cBdslN0Ew6dDasUkCOiHzc1U4L2iOp+g==
X-Received: by 2002:a05:6512:3c3:b0:4d8:4f53:37b0 with SMTP id w3-20020a05651203c300b004d84f5337b0mr5071270lfp.41.1678311349794;
        Wed, 08 Mar 2023 13:35:49 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id u7-20020ac243c7000000b004dc4d26c324sm2467479lfl.143.2023.03.08.13.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 13:35:49 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 08 Mar 2023 22:35:24 +0100
Subject: [PATCH RFT v2 08/14] clk: qcom: smd-rpm: Separate out a macro for
 defining an AO clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-rpmcc_sleep-v2-8-ae80a325fe94@linaro.org>
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678311334; l=1025;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=b14AEjTLwjLgGEk78F1dpInwcT5yQSs+pXHFwVDxjG0=;
 b=YZjjRcIZTzgaqY6x0UbgV5zzjW3IjnbHE+/bhMHyCC8csrAHASH2iqQHODhNkWPsdUYxL9opmkSO
 DaqekFNQAg2ytq6y+M6qXA23HqLqYCzktQv6Ua1BlvLrdvoTN2To
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To declare a keepalive variant of a bus clock, it will be useful to
have a reusable macro which will ease defining a keepalive variant
of an AO clock with an IS_CRITICAL flag. Introduce it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index ddb4268ba2a5..eb7781e5c8c1 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -44,6 +44,11 @@
 			.num_parents = 1,				      \
 		},							      \
 	};								      \
+	__DEFINE_CLK_SMD_RPM_AO_PREFIX(_prefix, _name, _active, type,	      \
+				       r_id, key, ao_flags)
+
+#define __DEFINE_CLK_SMD_RPM_AO_PREFIX(_prefix, _name, _active,		      \
+				       type, r_id, key, ao_flags)	      \
 	static struct clk_smd_rpm clk_smd_rpm_##_prefix##_active = {	      \
 		.rpm_res_type = (type),					      \
 		.rpm_clk_id = (r_id),					      \

-- 
2.39.2

