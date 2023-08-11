Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5FA779016
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 15:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235633AbjHKNEh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 09:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235697AbjHKNEV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 09:04:21 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCE47270F
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 06:04:20 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fe2de785e7so3156663e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 06:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691759059; x=1692363859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wa5b6Y50rp/e6fiMiat5UQrdiApj5nkPtHo443x+hiU=;
        b=hwIdWRD2rzWohrswejibCe3bzj6R0kUCEE6Ioxsiy7iMlO5QqUTtjldfiP1VULnZa3
         NME2vEQlX/meadyPQujEl00rLeJEkpBQdcz3bu0x/Hyj+w6idipm/CGZioYJK4HYH4DE
         iDJnOVwI12x3PQuOMurS7ndnnhxTmMBXO3ek1X4dE+GqxGiU2cr7aSscHroMUa0tOykj
         qnqeCdnUIsw24aZOzErVl2su2laRpx0nY2pEalk0yXI4so5+z6N4aIjpQLJk+uyTKHeP
         YnG2sYO2RlRjGnk8UI4X01vQQXx8cGGoNDnqnpcG2YlYNOFI4MU5NuzZ+BXKkGPG1duy
         t/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691759059; x=1692363859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wa5b6Y50rp/e6fiMiat5UQrdiApj5nkPtHo443x+hiU=;
        b=klVkRht5JF+Lc9DAqb/XfNzA+sgog1aPpdxZtM9vJ5razYyetF8wk/WjQ3EsXpVOtl
         a8dy2okyxrn+xFeABj/2Og68mwmqKCEuDQdk+TGihpDSO5WQzLToQvg6ZJ+6vl7VMVoN
         6qUYYXEgpq+dP7GxjajoiQyT8ToI5oHFcfpC5017W3/OtC/MO+EKs3y9x9jNBuSL7kTR
         3aQ0UhzrFcqcXjV3Mq3+M7TtPwgxobMs+c6ZEz/r5J8TEJgM2GQO4mMr++ksHGYhBwe5
         wB9I3VEyYXBZo+Kn/Q7p058haN3bs85GQZH3NU1v18TIJsCF+9HhGNLhayd9ud5S43nS
         wraA==
X-Gm-Message-State: AOJu0YzeWyMSpv/0ervMJ4WJI9yTFXm7770Fh9vb4LtF4KFAEpG8yNvp
        H4MLA4qNiOs2bRlVJ0STeX447w==
X-Google-Smtp-Source: AGHT+IHVmWoJXMSR4XwBSYg7/WWOYzRqdwIXkN/tw1PoLwjOcWGj+84RCNSHt+f6PZ9WGupnKv6LWA==
X-Received: by 2002:ac2:4d1a:0:b0:4fe:1c40:9266 with SMTP id r26-20020ac24d1a000000b004fe1c409266mr1353397lfi.17.1691759059210;
        Fri, 11 Aug 2023 06:04:19 -0700 (PDT)
Received: from [192.168.1.101] (abyj188.neoplus.adsl.tpnet.pl. [83.9.29.188])
        by smtp.gmail.com with ESMTPSA id v20-20020a197414000000b004fe15a2f0f6sm722491lfe.62.2023.08.11.06.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 06:04:18 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 11 Aug 2023 15:04:10 +0200
Subject: [PATCH 03/11] interconnect: qcom: sc7280: Set ACV enable_mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230811-topic-acv-v1-3-a85b6e94f46d@linaro.org>
References: <20230811-topic-acv-v1-0-a85b6e94f46d@linaro.org>
In-Reply-To: <20230811-topic-acv-v1-0-a85b6e94f46d@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691759050; l=729;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ioSiE45ydDMU6c6MYeShczL4KzVySKPHigpp5fMv8Ew=;
 b=fa/MHJUy8QIauxLbhh8F/Na54DdLY/ue5zFkhFOjsIvkyV7KsCVdK8VV+bOjJoxxNs0dXnKX8
 3e1nyMvOI36A68LVvAj60s8pYZq6GUihrdDOQ0rbhkOqMTEFIUOi3sf
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

Fixes: 46bdcac533cc ("interconnect: qcom: Add SC7280 interconnect provider driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/sc7280.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/interconnect/qcom/sc7280.c b/drivers/interconnect/qcom/sc7280.c
index 6592839b4d94..f20b0ef47835 100644
--- a/drivers/interconnect/qcom/sc7280.c
+++ b/drivers/interconnect/qcom/sc7280.c
@@ -1285,6 +1285,7 @@ static struct qcom_icc_node srvc_snoc = {
 
 static struct qcom_icc_bcm bcm_acv = {
 	.name = "ACV",
+	.enable_mask = ACV_RSC_APPS,
 	.num_nodes = 1,
 	.nodes = { &ebi },
 };

-- 
2.41.0

