Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE0767F4F2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jan 2023 06:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbjA1Ff1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Jan 2023 00:35:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjA1Ff0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Jan 2023 00:35:26 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE50168AE5
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 21:35:25 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id m11so6584242pji.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 21:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NNHRpc9kf9/6kdgtzVSDtrmKb3BBPZiSyauIlTgUR/g=;
        b=DTon+Ap5C4a/ZEInyw+981CO4aFtLOxviGlg/0WzeLvABXVv1YyQ6CFGVvTJLTJ/up
         0SL4TIAB0uQ/YDQudC+8/5JjyKP55wUwZr0QS7CIKY7THHGQiByaf8O2cG8uZ4yLFj5H
         MQNelhjx1dN1ojnv8KXKC14FQo6gadyaDzyHAMCWu2j0Vpz6akV76aMOgzDQ+9RzjMzv
         ulsJqnIojmnmkQmibEqxZDQ3qguMqXudiJggjyKDV65u3hQsZLY8IeJYUGXwGWNGNygh
         bSyZ25+aVw8EtazqfvxAUlT++s8Dq74A1KGF78i6j7wtz42xL6X53X8quG0NsIIt2qyf
         7PHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNHRpc9kf9/6kdgtzVSDtrmKb3BBPZiSyauIlTgUR/g=;
        b=vHTstnjqYa5LtysJXr+IePNKNo9z4sdHzLyQ+5PDuHV4qAtfZi4DXiLkC0FzGs0Zq6
         4UCLpU3dv8HBZdXKXf0nLirqRyDOqbm4GlTqb7krDozTWsc8JpFcG+EnEbslCbTJrdEr
         JRbgvpFGXYIfw1lCYoYkUjFM2+j9uBKymMiexZ+1JzdH4PjN7Vlo9KLUTtSWKxoLGZKE
         jlrawTj+pfSUcynUhKWSBG1cnZo91/R6vqSBE55nDpWY1nYWmd7RmOPVPlzxnZPQwBQy
         teawI/4rHqw6CHOjOD/Ao7mZ4F2bjuTzojX/JYjq3q0cbl5pgoKX2RctMZg9vwKXRhoz
         id5Q==
X-Gm-Message-State: AO0yUKVUeyFl3QBf19DMBn/mpT6Qkt+RqiA8hUFIU67KfCQPLXP0xrVX
        Ya4F71yzdClPM1pSzbWGz1BSHg==
X-Google-Smtp-Source: AK7set/+b+nUnrATMl0IfNK7E8wSsKjtGZxc41xjlUwaDohKkimv0iLiwT7nDf78J1Gd4rQR4v2bhA==
X-Received: by 2002:a17:902:d4d1:b0:193:a5b:ccf6 with SMTP id o17-20020a170902d4d100b001930a5bccf6mr1215108plg.0.1674884125337;
        Fri, 27 Jan 2023 21:35:25 -0800 (PST)
Received: from localhost.localdomain ([223.233.74.24])
        by smtp.gmail.com with ESMTPSA id p15-20020a170902a40f00b00195e77c20a9sm3726841plq.163.2023.01.27.21.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 21:35:24 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     mani@kernel.org, mathieu.poirier@linaro.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com, bhupesh.sharma@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH 1/2] remoteproc: qcom: pas: Add sm6115 remoteprocs
Date:   Sat, 28 Jan 2023 11:05:03 +0530
Message-Id: <20230128053504.2099620-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
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

Among the subsystems in the Qualcomm sm6115 platform we find
audio, compute and modem DSPs.

Add support for controlling these using the peripheral
authentication service (PAS) remoteproc driver.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 4e1d9b08def4..9eb5a92bf5f6 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1184,6 +1184,9 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init},
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init},
 	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource},
+	{ .compatible = "qcom,sm6115-adsp-pas", .data = &adsp_resource_init},
+	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &cdsp_resource_init},
+	{ .compatible = "qcom,sm6115-mpss-pas", .data = &sc8180x_mpss_resource},
 	{ .compatible = "qcom,sm6350-adsp-pas", .data = &sm6350_adsp_resource},
 	{ .compatible = "qcom,sm6350-cdsp-pas", .data = &sm6350_cdsp_resource},
 	{ .compatible = "qcom,sm6350-mpss-pas", .data = &mpss_resource_init},
-- 
2.38.1

