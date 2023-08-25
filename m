Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14D80788E59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Aug 2023 20:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232893AbjHYSOj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 14:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232470AbjHYSOG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 14:14:06 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB3D2722
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 11:13:32 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50098cc8967so1931838e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 11:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692987200; x=1693592000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/TeMnYPJ3KxrFwSpu3efDqnuLqJ80q872/kIEbrU7wo=;
        b=h4a4Xz+gp1u8rtDNLjA8TH1uR3EghAAGh8LWajTzkYuwbM8N4O7MLEQ1hUoa4aKN4m
         ZRLSQQzITGJEOooU1g1Aet1ll5xddRaByqXQhZFXTmOGhBGpu5t3pHW+bsTAEHC6lS4d
         dcbmJkilR+9E2YHXySA99Akbxv0LuXdS0bCalNeqdb1aMrfWhDQt9F9+KuPUfTkEOjTz
         HfHyp9x29t5oP/r5qOPbFAQsmvtEA+XxIRhCmWU12cFZgB07mKY1ssKYmTY/s2WYHLsj
         p3woRYNh/LGkqpCCmpvuxoox9ttNOBE0dHYHq1Ba/SdY6rZWqNx/KV3iUGNE8zI+VpTz
         ZKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692987200; x=1693592000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/TeMnYPJ3KxrFwSpu3efDqnuLqJ80q872/kIEbrU7wo=;
        b=HX+cA+7P6aBNI4DFKQsFVAAvnfz/ZtLnPoGcue8KugLvDpuvrmj/2KJWlvuuIgRq+6
         /PS/V/m8C1jqAFKs2I2odPAOoLOHAofz4ABFZ+n6nD4DAolZ+iLHkHxsR+6tD4/0SU75
         /hZC8/FlYMGAKxIeI2MjP7EFUXWEWa6cgfEevjS8bqg2Caa3GJip9RMtsZcwBYc5Cpn9
         uLJn+1vsiOsXMuhVhWBmVJEeGPPGaEv5gIDT2GonAvopur/qH8hb8q8QLSIsbj3gRdgm
         D/4SQwJ3zMVG5G9nN74IxMF+IKVbc7LEHpmv6yo9cRwDaNgYGbnrG6Ub0MgjyH7kkK+t
         huJg==
X-Gm-Message-State: AOJu0YxGfqN8yyMIXwHifyAxkurlI09Dr17NJSGWvPa/3xEyoscu6tmW
        dvDRclkpbF5xxqUi6Cm0UjK2OQ==
X-Google-Smtp-Source: AGHT+IENTg/CoSs/0Snu/WkdvbcaXjnIW9+7z+J89mjofNi00Tg7fcMFN+cdA/EGlC9TqHO36xqDKA==
X-Received: by 2002:a05:6512:3ba2:b0:500:8022:3dc7 with SMTP id g34-20020a0565123ba200b0050080223dc7mr14913390lfv.10.1692987199796;
        Fri, 25 Aug 2023 11:13:19 -0700 (PDT)
Received: from [192.168.1.101] (abxh59.neoplus.adsl.tpnet.pl. [83.9.1.59])
        by smtp.gmail.com with ESMTPSA id b2-20020ac247e2000000b005009920b6afsm374522lfp.9.2023.08.25.11.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 11:13:19 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 25 Aug 2023 20:13:16 +0200
Subject: [PATCH 2/3] clk: qcom: reset: Increase max reset delay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230825-topic-6115_lpasscc-v1-2-d4857be298e3@linaro.org>
References: <20230825-topic-6115_lpasscc-v1-0-d4857be298e3@linaro.org>
In-Reply-To: <20230825-topic-6115_lpasscc-v1-0-d4857be298e3@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692987195; l=566;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=87NDHyI+LvwN9CqST5Jf5fNXtDFPiv1laEmkRq1a1As=;
 b=9MzaglliUVrbmVPVIQA+UDY17AoEE8NafqETUwAVa7cEVjHT4LHRz4JfryCS7/DWvuQ/nXuop
 C4quWHeRToIBD3efWWErIbDbHrvHCboI3CcMEdWQb7ADChjyYXqFhJo
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

u8 limits us to 255 microseconds of delay. Promote the delay variable to
u16 to hold bigger values.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/reset.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/reset.h b/drivers/clk/qcom/reset.h
index 9a47c838d9b1..fe0561bf53d4 100644
--- a/drivers/clk/qcom/reset.h
+++ b/drivers/clk/qcom/reset.h
@@ -11,7 +11,7 @@
 struct qcom_reset_map {
 	unsigned int reg;
 	u8 bit;
-	u8 udelay;
+	u16 udelay;
 	u32 bitmask;
 };
 

-- 
2.42.0

