Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A54126627D3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 14:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233804AbjAIN5M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 08:57:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236887AbjAIN45 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 08:56:57 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05EC038BB
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 05:56:55 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id f34so13039242lfv.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 05:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XChNAuhpqawggFVinjSHpXxpZlJYDspbNDCgSFk6Lz4=;
        b=grsRXbKW/+DZUAvQi7Lu3otYvDKWnDL0EwAD2Bfe/o+sRLfbM0dbXkf9k3Q6o34kq5
         AGmUVuxIgg4kxVhV4LPY7WwnHoSb1GFLqkEl44WjBNthsp8ryyqDNXqxUD0GtXwIpcAb
         WCmL0awarJrsFt000UHjjFh7t5DdoxsiOMrUpxVh2jeeULFaO/bdxKY5g8OqVVx48N5u
         iy+lqUJPNnOTGKt0qJwAwobxmiF1/VfHGDRPzirneNqIzS0B7MGCeMuIccroHTN/NkCW
         nQ/Wx4OROLAE2TIBE3wrvGYGnZyg69HeCYVPq62Tlq2oGnzMK+v5GaPDd9BN4eyR00t4
         ii4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XChNAuhpqawggFVinjSHpXxpZlJYDspbNDCgSFk6Lz4=;
        b=eQCoolTDPKNlGy8OkR4bbfh7j64hQTStpEbmv46aim4gLXQY4VCVlEjfiZqLa0Jjt9
         Vi11FLvsQMl/YinontawdQ/5NVea/9bnx85P2b3b1rm977Fj/5+Qs1fLOiphpu4d/Neo
         RrfpEcU6JTdupzDDtZUF76NAG3tz51TaYq6ISWJPEGsNUotHtU1nXqNtwIVtMwZtpnS0
         X/ZiXGRvoC2PNTrKrWYNioiMgpiWeHZYx4VN1Axgcmjx0qwwOtQ89tT3V3JYQYVBYz6X
         h4BqaE2/jqj/PUMknrZ9pEBZBbvUIaf40pCPYBdo2onhTwRpGKDUFIoOFj5vAG1ICUzy
         dLsg==
X-Gm-Message-State: AFqh2kqfaMI7TyNuY7/LXbrqvhSicDtswKepIXTGHDzwmEkoNvP7WFBZ
        vATsU7BBPDhjYQZaLdinBH/zAKEeWDGGBvpc
X-Google-Smtp-Source: AMrXdXsmApgLHh/vKhZjyiSH5hhBM5aDK68Bg8hl5BzKmVBvC4VbU4YEAYGDGrEscQBBlyLjEcCb1Q==
X-Received: by 2002:ac2:4bd1:0:b0:4a4:6af4:43b7 with SMTP id o17-20020ac24bd1000000b004a46af443b7mr17479796lfq.69.1673272614287;
        Mon, 09 Jan 2023 05:56:54 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id x16-20020a056512079000b004c89b9fb1fdsm1638226lfr.68.2023.01.09.05.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 05:56:54 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] remoteproc: qcom: pas: Add SM6375 MPSS
Date:   Mon,  9 Jan 2023 14:56:46 +0100
Message-Id: <20230109135647.339224-4-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109135647.339224-1-konrad.dybcio@linaro.org>
References: <20230109135647.339224-1-konrad.dybcio@linaro.org>
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

Add a config for the MPSS present on SM6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v2 -> v3:
No changes

 drivers/remoteproc/qcom_q6v5_pas.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index d8a4ecec8535..10eaef85816d 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -831,6 +831,21 @@ static const struct adsp_data slpi_resource_init = {
 		.ssctl_id = 0x16,
 };
 
+static const struct adsp_data sm6375_mpss_resource = {
+	.crash_reason_smem = 421,
+	.firmware_name = "modem.mdt",
+	.pas_id = 4,
+	.minidump_id = 3,
+	.auto_boot = false,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		NULL
+	},
+	.ssr_name = "mpss",
+	.sysmon_name = "modem",
+	.ssctl_id = 0x12,
+};
+
 static const struct adsp_data sm8150_slpi_resource = {
 		.crash_reason_smem = 424,
 		.firmware_name = "slpi.mdt",
@@ -950,6 +965,7 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm6350-mpss-pas", .data = &mpss_resource_init},
 	{ .compatible = "qcom,sm6375-adsp-pas", .data = &sm6350_adsp_resource},
 	{ .compatible = "qcom,sm6375-cdsp-pas", .data = &sm8150_cdsp_resource},
+	{ .compatible = "qcom,sm6375-mpss-pas", .data = &sm6375_mpss_resource},
 	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},
-- 
2.39.0

