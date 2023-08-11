Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC59E779018
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 15:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbjHKNEh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 09:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236050AbjHKNE1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 09:04:27 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1880930CB
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 06:04:25 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fe28f92d8eso3171452e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 06:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691759063; x=1692363863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIETjFE+YORk91Sd+FK8yX6Tnsoz0FQHlLS1cvn3BDI=;
        b=vqvuT/HZtSDGmvlcOtUNXvE1OiR+3cFlTNIXHJxK8WdVrThvsdM44pj9mmGBysk89N
         3a+55NiZ8aFWXPmB+01naClZtnm7AC5mBuYs3ro8cp+4GU6t7jwEPnRnmYo7oIhiNlKe
         8xXSDDvcjISfWzey4qRC3QJDw5lqysa3vqbtnzbc+462dl+55UlBLIE7BjbodvLFhUtI
         Fx5cfTyOUGP5vZ/VRalGdMjVHVzUHg0TPKouIqmOisnQ8f+NzsWKlKTHdAD7G+Ry9UIP
         SR7HHzVGdztplFiIorxNmUVYZX5TedVMBzpfM82ZVMlYiUYf/c2AKX/7kO3N0jq9F+zK
         2y1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691759063; x=1692363863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIETjFE+YORk91Sd+FK8yX6Tnsoz0FQHlLS1cvn3BDI=;
        b=BDZ7Wv1fHCZqHffUARr/sARmHDViVGKXeEZs5pfBXHBBbdSSm+KLyeCITQWpzhDOz7
         gbdCgOB0pOGHXh3heDZPYO0Bn+LMfVB9Y1bKI39LhhSXTFC29Qd3DIuVdpEDNNU5xmyL
         UZI5dsoHQZ/FGjNRkMfVHBZuV0KgAqChdqtcepxVujlN9KsU7Gvh/i4Qso0i9R0V4zhK
         TiVO2cM3Hnr3OeMbTAJTbHD5iadh+kujlEV1Wuw6BORzC92d3H1VOzUYpG38zclIS0DG
         as6hZ63Z6+8fyyplEJNR0GEcHtlIuxArPwvpoLbibM/L2cQ/xBFsBaAUfd0P2AgjQuqr
         UxLw==
X-Gm-Message-State: AOJu0Ywds2cTxmD92Tz1xWnIx6Uc+VmdCoN2oYVsg4xr5BUl+jvUCgJB
        Bi1V5cg9mYFlFROY2Yo4dJhNbA==
X-Google-Smtp-Source: AGHT+IENexpC4So5+ASxmdhQdyUVzfJHbpRBDMuOrNaJaENY+lbJKH028kpskHvvgIQNdj+I4OXthw==
X-Received: by 2002:a19:650f:0:b0:4fb:897e:21cc with SMTP id z15-20020a19650f000000b004fb897e21ccmr1236897lfb.67.1691759063319;
        Fri, 11 Aug 2023 06:04:23 -0700 (PDT)
Received: from [192.168.1.101] (abyj188.neoplus.adsl.tpnet.pl. [83.9.29.188])
        by smtp.gmail.com with ESMTPSA id v20-20020a197414000000b004fe15a2f0f6sm722491lfe.62.2023.08.11.06.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 06:04:22 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 11 Aug 2023 15:04:12 +0200
Subject: [PATCH 05/11] interconnect: qcom: sc8280xp: Set ACV enable_mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230811-topic-acv-v1-5-a85b6e94f46d@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691759050; l=734;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=hAS5ZiZPJ7dfWWLTn2/3P6QwpmscNBYEDN+t0XN5dwg=;
 b=935vCxAyYFwUuxcgLgw4wAj1pfzKXnlfByuA07wOthIOskiXNLmfGpUiR7enKw5hasulIyic0
 a1pbDOZSd4UDCeVtTiEKpUFHNUqqWIiosozk7nsSAcBwGDJ/GTzAaIH
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

ACV expects an enable_mask corresponding to the APPS RSC, fill it in.

Fixes: f29dabda7917 ("interconnect: qcom: Add SC8280XP interconnect provider")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/interconnect/qcom/sc8280xp.c b/drivers/interconnect/qcom/sc8280xp.c
index b82c5493cbb5..141101c1bb44 100644
--- a/drivers/interconnect/qcom/sc8280xp.c
+++ b/drivers/interconnect/qcom/sc8280xp.c
@@ -1712,6 +1712,7 @@ static struct qcom_icc_node srvc_snoc = {
 
 static struct qcom_icc_bcm bcm_acv = {
 	.name = "ACV",
+	.enable_mask = ACV_RSC_APPS,
 	.num_nodes = 1,
 	.nodes = { &ebi },
 };

-- 
2.41.0

