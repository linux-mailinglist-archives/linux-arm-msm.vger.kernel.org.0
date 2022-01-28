Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3F4F49F17B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jan 2022 03:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345728AbiA1CzF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 21:55:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345597AbiA1Cy7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 21:54:59 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 870B3C061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 18:54:58 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id b186so3609603oif.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 18:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eFxeqpfH1BWJVw2UYgQA/9Fqc+JOe8vXCmcuFnQMGhM=;
        b=efgdGpdfspgWmt6dxtwpRqPwAVLI5lue+xF4g1NOuuslvB0RHbJ0tOh8gBq0Q+NsOw
         Vi7pa6o7hgil3Tf+xZuf1CRXftk9ouQ1GIgVvunO3yfaJ56kP88wqTYlXcYWBmi7nc6l
         ucnBhqP6hInmFP92RtqXsIgfGdfjHn1euaQDJX0pbxZ/vzzSO8Fw2xKiVcPxH3PUcB0p
         +FUtvBfYv+/Da+oyxn78mwIrTGwGzjxGyD12d8Fiao86dFPv/RSvoZE/qZO6qDBclmdK
         mlfgiMa5mqbqOBpH9V2CtxAcGmSw1mZjWLhEh+WYMeBU75tQ9yzcJgGC+KIx0Q9WxjNw
         1ZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eFxeqpfH1BWJVw2UYgQA/9Fqc+JOe8vXCmcuFnQMGhM=;
        b=z6EfE1ZTCnI30apSrNKX2oEkQwB2LFo3x82zPXadNUm+t4891rDv2OoXeq6l+CoS+2
         iHUNMGwsaix87dI/a+X8eBIWWEuNyK32Hw7MoLeXELtTB3MRayb14Sj3zMZHxW/ZpDrO
         R2jXJYbBe0hQQaoJq7NT9aC/2OluKaCcZN6M99GPCUPMO7BsZU1kEdvKHcn8YbUdZqkE
         R5assEtuCg0jZsbSiWvksAfOa07TmhGTYNs0gZgBeWLL8hlLMNKHnYMJsF4csddhVYnY
         zOOxQzMRAVdcWOFrwD7MI8jWUEIO9Ilm3RpVYNVe576awmkFGsLqVPK/f0ljHmChOpbm
         vZrw==
X-Gm-Message-State: AOAM5327lUKBPrf7poCncB/HBtvTB0Qy0okjmcSBEJtypnJ/rRMpfRgl
        24byJpZ4yC8nB6AO4ZTjmPf+cw==
X-Google-Smtp-Source: ABdhPJxbsRwIcg9eWkRkCBNVNWI7QPmFZ13+TpBg06dtViUS2MlnPIw0CvwHXgJdAU1jdpHh5y9lIg==
X-Received: by 2002:a05:6808:3012:: with SMTP id ay18mr9650588oib.5.1643338497912;
        Thu, 27 Jan 2022 18:54:57 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id k6sm5677352oop.28.2022.01.27.18.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 18:54:57 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/13] remoteproc: qcom: pas: Add SM8450 remoteproc support
Date:   Thu, 27 Jan 2022 18:55:11 -0800
Message-Id: <20220128025513.97188-12-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128025513.97188-1-bjorn.andersson@linaro.org>
References: <20220128025513.97188-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add audio, compute, sensor and modem remoteproc compatibles to the PAS
remoteproc driver. The resources needed for each one matches those of
SM8350, so its descs are reused.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 5e806f657fec..1ae47cc153e5 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -879,6 +879,10 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm8350-cdsp-pas", .data = &sm8350_cdsp_resource},
 	{ .compatible = "qcom,sm8350-slpi-pas", .data = &sm8350_slpi_resource},
 	{ .compatible = "qcom,sm8350-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sm8450-adsp-pas", .data = &sm8350_adsp_resource},
+	{ .compatible = "qcom,sm8450-cdsp-pas", .data = &sm8350_cdsp_resource},
+	{ .compatible = "qcom,sm8450-slpi-pas", .data = &sm8350_slpi_resource},
+	{ .compatible = "qcom,sm8450-mpss-pas", .data = &mpss_resource_init},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, adsp_of_match);
-- 
2.33.1

