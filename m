Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8A1C526ED3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 09:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbiENCys (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 22:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbiENCyl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 22:54:41 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED78337E4D5
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 18:13:24 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 4so12089416ljw.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 18:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LXQljSMYkcP1zL5wN90tEXTSyht6bPqet9DUZ+TVp4k=;
        b=sIJRLfub5P+8FjrCbD9ndvrG78oWNinDkXw5i+XBA0Ejxe22XwcLaa5nwbSvts0Tgn
         sF4yThllcr6ZehZFtrVFYfI9lKgwR2GXo/fm8nXJdtr903apGBu0O4ozYsrMwQBFOUVN
         V4iW+Znmg5u5iT1gJnTtJRNgrGXMqb8MdRegIyVp4RzC0sx6ZD5bdZ7yNratpt0c98ka
         zvEJBsblqkRlmWhqSXZIVZjEJRVkpDsNuvfMS6v0EM1sHhQNii4O4HWa/1bSY8jUvMgw
         LKX7tf85ZlCsEEbkIzwh+DPVuFSVYJnUqEiSejyIcJMwIoTB7BQkCCnQOVB640qIouWu
         EJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LXQljSMYkcP1zL5wN90tEXTSyht6bPqet9DUZ+TVp4k=;
        b=Ctu1bC4UnYqOH3S+l3wsNX7d2LsVaRdgyBjFdFmhnt77dYq37dnl9Li65c4fhFK1t0
         eGtDNWBFzFMjwxRIeR8CuwO6qRvYbDr2m93quJ/7RPejgFqaCa0VxMmgPP0yxoGll2AG
         GlsBdsBG+SmroqvWX8NZzZnl0imFkn4QxI8aYIE/2tcYLAoUlZpgKlKUcPaX9xuoFNgL
         1Q4AJpFGXCAftLwI3qahcm77xrOEki+96qf2cCAMPT64IrRYdbmW+0AS4krZqX1uzj++
         fMOgMA/hqK5+cRYuyq4SmYKtJNGXstlCwq0yZLtgA0ea/5bWncyPROP6ew37vL9or9gz
         ebNg==
X-Gm-Message-State: AOAM533G2JI6TN/uoXaZb9pms71zkuttT0LO1DsrqUiczhXw55QA/OaL
        Rjg6TeP4z0yCa3puZvUIBzJ0T7CYr4Kv8w==
X-Google-Smtp-Source: ABdhPJyVnnwOR7kozUx7+jEEYO2nBEyXGAL2sB76p2vvPvilThVST+1bBRx0pN1+mmOo+nO7PC0r4A==
X-Received: by 2002:a2e:8e98:0:b0:24f:15e9:ed39 with SMTP id z24-20020a2e8e98000000b0024f15e9ed39mr4259616ljk.460.1652486473215;
        Fri, 13 May 2022 17:01:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z2-20020a2e9b82000000b0024f3d1daeaesm626221lji.54.2022.05.13.17.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 17:01:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 4/4] remoteproc: qcom: pas: Add SDM660 CDSP PAS support
Date:   Sat, 14 May 2022 03:01:08 +0300
Message-Id: <20220514000108.3070363-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220514000108.3070363-1-dmitry.baryshkov@linaro.org>
References: <20220514000108.3070363-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible string for the CDSP found on SDM660 platform. The
resources needed matches those of QCS404, so its desc is reused.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 1ae47cc153e5..39c9c56e8de9 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -862,6 +862,7 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sc8180x-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sc8180x-mpss-pas", .data = &sc8180x_mpss_resource},
 	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init},
+	{ .compatible = "qcom,sdm660-cdsp-pas", .data = &cdsp_resource_init},
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init},
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init},
 	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource},
-- 
2.35.1

