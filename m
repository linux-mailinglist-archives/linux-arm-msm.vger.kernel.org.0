Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5C6779B36
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Aug 2023 01:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235672AbjHKXVQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 19:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236971AbjHKXVK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 19:21:10 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D77A91FF1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 16:21:03 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b9ab1725bbso38146151fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 16:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691796062; x=1692400862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5D8avfDCypWzaiRrrXSAKYCaBZpWk2BKLzbOCplT/1s=;
        b=JVTQmJSii1CkspVKgUJjKFZkTp52docxjYJ3uZMICJsh6N8gQoS6O/MSIjpWrVg/Dm
         VlcYyEkR0XZpq8WDJj1oDHw2d8SEeK5WJXTULHVrky9rNmKGvjhK6atUawdeK5HTA+Zw
         U1m8CMqvkfKvT8daUMmVv7e4bNuKt29zNvuCfD973nBjo+jKRZlgTFzch4i1FpNQMNvS
         Qsv7tFiIlB4r7kiAbW0NElnLgwaYeo46CNEb1/kSMMz495ADdE3xPTYK3doIYOgeftkV
         zOumwSrxYILAd0poHL6s0mHALDtX3QWtRlMziRQoj15OXBnMMDIO/foZmbh6hkx6/2nE
         703g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691796062; x=1692400862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5D8avfDCypWzaiRrrXSAKYCaBZpWk2BKLzbOCplT/1s=;
        b=S2q01391TS+Hvrqf1zyJYL3PjmGrbqU0XoVE2p63x9xjm9Rtx2zsPAHjIYBYsRk/WB
         mim+5hxQ+C3D1dC6D1jo4XdlmBz/azFU2hM1ODyf+LAq4ct04ZrJhxBWbBQu8PxVsY+i
         p9cd4oPre9ckb3phGg83DsK5cNDubCUFknDnvaoQ9xiRcMQgNcxKLThxYFpX8NSIFXp5
         +d7qoRoBKXSMeMnfJyYOht7unkAhkvHoCFFGdQvlDhaQL2Yy7ZQ8xmHB08py1AtL5EAy
         IFUZvpeGnNKmAqFNGrk9l/uJ5v0BrS4o+HPhL4hQpvXOoancixZaOTApIHD21D6Br7Kv
         TJpw==
X-Gm-Message-State: AOJu0YxgJ/KcPKbw5mE9WRTKWbEQOo7a1z5fMmaFfTtR+Mw76ryFsd4i
        lXmvWKMsdg0VLVD8987n66vvow==
X-Google-Smtp-Source: AGHT+IETtcHnAZRl+CPBUQB8FmdLAh3wL7b42TPgsVa9urZbYNSfPFyBqyw/QSqfUohsTCm4FiuWiA==
X-Received: by 2002:a2e:9d59:0:b0:2b7:25b2:e37a with SMTP id y25-20020a2e9d59000000b002b725b2e37amr2536521ljj.44.1691796062295;
        Fri, 11 Aug 2023 16:21:02 -0700 (PDT)
Received: from [192.168.1.101] (abyj188.neoplus.adsl.tpnet.pl. [83.9.29.188])
        by smtp.gmail.com with ESMTPSA id z26-20020a2e965a000000b002b9ea00a7bbsm1038210ljh.60.2023.08.11.16.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 16:21:01 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 12 Aug 2023 01:20:52 +0200
Subject: [PATCH v2 09/11] interconnect: qcom: sm8150: Set ACV enable_mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230811-topic-acv-v2-9-765ad70e539a@linaro.org>
References: <20230811-topic-acv-v2-0-765ad70e539a@linaro.org>
In-Reply-To: <20230811-topic-acv-v2-0-765ad70e539a@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mike Tipton <quic_mdtipton@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Richard Acayan <mailingradian@gmail.com>,
        David Dai <daidavid1@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691796047; l=746;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ENMvK29InEz7nd8TmpWJ9o47GtH1SmyyejxJH8ZVMxI=;
 b=ZyW5u3sVvBuOf8ZiKekPpWteupYyN913jtad0IBxFWA+HmTFGT+VbjU6yzQzSkNFetwyDdPo7
 PP21henE6ueBJ5IxfDD8g+iAm0A0vcKoqcBmsi+MbP6NJAiXeyteKHt
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

ACV expects an enable_mask corresponding to the APPS RSC, fill it in.

Fixes: a09b817c8bad ("interconnect: qcom: Add SM8150 interconnect provider driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/sm8150.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/interconnect/qcom/sm8150.c b/drivers/interconnect/qcom/sm8150.c
index c7c9cf7f746b..edfe824cad35 100644
--- a/drivers/interconnect/qcom/sm8150.c
+++ b/drivers/interconnect/qcom/sm8150.c
@@ -1282,6 +1282,7 @@ static struct qcom_icc_node xs_sys_tcu_cfg = {
 
 static struct qcom_icc_bcm bcm_acv = {
 	.name = "ACV",
+	.enable_mask = BIT(3),
 	.keepalive = false,
 	.num_nodes = 1,
 	.nodes = { &ebi },

-- 
2.41.0

