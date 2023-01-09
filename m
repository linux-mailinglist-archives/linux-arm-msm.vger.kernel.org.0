Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD016627D1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 14:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236793AbjAIN5M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 08:57:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233804AbjAIN45 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 08:56:57 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E693882
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 05:56:54 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id cf42so13093081lfb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 05:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QIXkCGrGCO+u3SizDkJ91yeqoSF5YkZvVyIYnHQQQw=;
        b=k4fzAsngV/IkFiMGW3VZxpxdEdEZkKDJf1qstoEnMDVeLnxagngtuVgHMacFD/EVlo
         itezAaUjcnc6mzYcZMdqTQ9QS6PA95xfPfN384zo00MdH1k9NTNYBGooKoZgoMJTdgBG
         KtCj+BMIc0CGKy2OMp3ohvt1dZVoGk9gXz5tyy5KShAuMAeQ4FnP2qYrdEjkX1Mv2Qiw
         tN8bZ7U2xP6LxEr0Czk5zBIlVloN8dVo0Wf1zGxHFNki5GmWLqHCvdZyapJ/oaTmXuLh
         /QHdpq4KFjzwqPXWlGdwnT/VBL7A4UD0hoUlPORYEQ6c3xVxHbQPd+cCxOSx97srNhc0
         JN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QIXkCGrGCO+u3SizDkJ91yeqoSF5YkZvVyIYnHQQQw=;
        b=A35E0Ha0G68HDgchEtV21DpsWPSC627CV+7SrgWq8G85A7NundVfGKDbQIhyBiLLy0
         HR0+oqm5ZIcbEz4yulWQtx30qljN+Z/7dWsKP7h+jiZ71SlaW7/0ql51P4L9DfVb4Rut
         lWSEDPTdTsjK569zdE2pPKPUKeZ6BY68uvcZy5WqjmEfql+PwbgoThW6Z3ZP0w8w7Mzx
         YDb/ea/mlgFxEW2Y6166kLKKIZrN/98Fi9RyN7tV5YBrXyjzePAsSF476xO4IOHgoL3y
         lczO1nGVkGvQ88sEKp5k9qaKAETs8rNYtXuXPHNo6eTsNFgU+/uMapveeybJZ5gqnuwb
         emqg==
X-Gm-Message-State: AFqh2koYvfJSVNa+9ijLMR4+n0dcJd5p227QB8mLn8SeFrkwZ4axoxh4
        hYoemhE0d7hUobNxf3coZ6rPwDr3yfFboloR
X-Google-Smtp-Source: AMrXdXupfpgVnNGmxRFz4qo0sSuywQRtysN94c7O17Hns0F7P9lldjFuJY4Zg1yvPSTCaVIH+dg3JA==
X-Received: by 2002:a05:6512:2510:b0:4b6:f30c:c7a9 with SMTP id be16-20020a056512251000b004b6f30cc7a9mr23867914lfb.1.1673272613132;
        Mon, 09 Jan 2023 05:56:53 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id x16-20020a056512079000b004c89b9fb1fdsm1638226lfr.68.2023.01.09.05.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 05:56:52 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] remoteproc: qcom: pas: Add SM6375 ADSP & CDSP
Date:   Mon,  9 Jan 2023 14:56:45 +0100
Message-Id: <20230109135647.339224-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109135647.339224-1-konrad.dybcio@linaro.org>
References: <20230109135647.339224-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a config for the ADSP&CDSP present on SM6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v2 -> v3:
No changes

 drivers/remoteproc/qcom_q6v5_pas.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index f95e0229a6c1..d8a4ecec8535 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -948,6 +948,8 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm6350-adsp-pas", .data = &sm6350_adsp_resource},
 	{ .compatible = "qcom,sm6350-cdsp-pas", .data = &sm6350_cdsp_resource},
 	{ .compatible = "qcom,sm6350-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sm6375-adsp-pas", .data = &sm6350_adsp_resource},
+	{ .compatible = "qcom,sm6375-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},
-- 
2.39.0

