Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E194E30DFD5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 17:36:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234539AbhBCQgM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 11:36:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234532AbhBCQgE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 11:36:04 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4821C061794
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 08:34:40 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id b21so73364pgk.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 08:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=squareup.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jB5LniiJVJBhga+KqtjyHJhSLFg6O06N5hOGcOS8Mo0=;
        b=IhCfDX9FMqbywbKhoTeq5CpvYQa1Psp9hJuE1uJrOqwkKrhrrvWmMoe8m6iol0kbps
         HxbaRc17fVXZpZyPm77VCnP4cOecqSZ9x4wyiFpM6WHPC344z/eB/OYcCILta/N1CMor
         Siz04H8TaB1YW00cQ/gGUN7LfU1PPhOMAtZw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jB5LniiJVJBhga+KqtjyHJhSLFg6O06N5hOGcOS8Mo0=;
        b=fIMT1HL0lBZpQzo+LYa/noN7dd6onAFLx3GJp5TdSkveG+CSVSxNf9Gg4vfBZuD1lz
         eKHZXEby9Vw78UnRkgOqnXRUn0wpZJ9w3qWz9M62w/BSsho96a6Yh0hyCQ0XdpLUEUUy
         ZqlsTwju4j7S7KhT+SFUE/GW+N3lEkWjLQgU/3NBjewO/1maFpesxDiBtwdY3Up/rOkc
         z9HQOFncsclweuBFLKy8m54XwgkYSeNf+X3vZq5OYtggHCO+wFxjU1wGfhj8whDgTpE5
         /VnnRuDIxEkKTN1cBxW0p1vZ3FJGf0j7lEpZycq/FePUhx6SJEuehcvaFcg/WS4yaJ57
         s2tw==
X-Gm-Message-State: AOAM533+L83p3HcY7B3ib0pBXuJGQ1PRsgHq8Taf6+8yXRSiZ6rMyOlM
        zMIX5OWn1rpuZGUdu5Vm+i9tCg==
X-Google-Smtp-Source: ABdhPJx7Zq3RnTesy0436dDHJJQa7PqeTbE+LE0OfBYli2Lu0V/+suOkUkkgdXNm1RDt++BQwlY6ug==
X-Received: by 2002:a63:fe05:: with SMTP id p5mr4446854pgh.161.1612370080390;
        Wed, 03 Feb 2021 08:34:40 -0800 (PST)
Received: from localhost (162-207-206-139.lightspeed.sntcca.sbcglobal.net. [162.207.206.139])
        by smtp.gmail.com with ESMTPSA id p2sm2620288pjj.0.2021.02.03.08.34.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Feb 2021 08:34:39 -0800 (PST)
From:   Benjamin Li <benl@squareup.com>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     square@linaro.org, kernel@squareup.com,
        Benjamin Li <benl@squareup.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] interconnect: qcom: msm8939: remove rpm-ids from non-RPM nodes
Date:   Wed,  3 Feb 2021 08:34:07 -0800
Message-Id: <20210203163407.9222-3-benl@squareup.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210203163407.9222-1-benl@squareup.com>
References: <20210203163407.9222-1-benl@squareup.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes corresponding to commit c497f9322af9 ("interconnect: qcom: msm8916:
Remove rpm-ids from non-RPM nodes") to remove this log spam on 8939:

[    1.901376] qcom_icc_rpm_smd_send slv 24 error -6
[    2.005977] qcom_icc_rpm_smd_send mas 20 error -6
[    2.010250] qcom_icc_rpm_smd_send slv 20 error -6
[    2.014684] qcom_icc_rpm_smd_send slv 106 error -6
[    2.019338] qcom_icc_rpm_smd_send slv 107 error -6
[    2.024615] qcom_icc_rpm_smd_send slv 29 error -6
[    2.028782] qcom_icc_rpm_smd_send mas 3 error -6
[    2.034657] qcom_icc_rpm_smd_send mas 100 error -6
(plus another slv 131 that's hidden by the mas 100 failure)

Signed-off-by: Benjamin Li <benl@squareup.com>
---
 drivers/interconnect/qcom/msm8939.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/interconnect/qcom/msm8939.c b/drivers/interconnect/qcom/msm8939.c
index dfbec30ed149..20f31a1b4192 100644
--- a/drivers/interconnect/qcom/msm8939.c
+++ b/drivers/interconnect/qcom/msm8939.c
@@ -131,7 +131,7 @@ DEFINE_QNODE(mas_pcnoc_sdcc_1, MSM8939_MASTER_SDCC_1, 8, -1, -1, MSM8939_PNOC_IN
 DEFINE_QNODE(mas_pcnoc_sdcc_2, MSM8939_MASTER_SDCC_2, 8, -1, -1, MSM8939_PNOC_INT_1);
 DEFINE_QNODE(mas_qdss_bam, MSM8939_MASTER_QDSS_BAM, 8, -1, -1, MSM8939_SNOC_QDSS_INT);
 DEFINE_QNODE(mas_qdss_etr, MSM8939_MASTER_QDSS_ETR, 8, -1, -1, MSM8939_SNOC_QDSS_INT);
-DEFINE_QNODE(mas_snoc_cfg, MSM8939_MASTER_SNOC_CFG, 4, 20, -1, MSM8939_SLAVE_SRVC_SNOC);
+DEFINE_QNODE(mas_snoc_cfg, MSM8939_MASTER_SNOC_CFG, 4, -1, -1, MSM8939_SLAVE_SRVC_SNOC);
 DEFINE_QNODE(mas_spdm, MSM8939_MASTER_SPDM, 4, -1, -1, MSM8939_PNOC_MAS_0);
 DEFINE_QNODE(mas_tcu0, MSM8939_MASTER_TCU0, 16, -1, -1, MSM8939_SLAVE_EBI_CH0, MSM8939_BIMC_SNOC_MAS, MSM8939_SLAVE_AMPSS_L2);
 DEFINE_QNODE(mas_usb_hs1, MSM8939_MASTER_USB_HS1, 4, -1, -1, MSM8939_PNOC_MAS_1);
@@ -156,14 +156,14 @@ DEFINE_QNODE(pcnoc_snoc_mas, MSM8939_PNOC_SNOC_MAS, 8, 29, -1, MSM8939_PNOC_SNOC
 DEFINE_QNODE(pcnoc_snoc_slv, MSM8939_PNOC_SNOC_SLV, 8, -1, 45, MSM8939_SNOC_INT_0, MSM8939_SNOC_INT_BIMC, MSM8939_SNOC_INT_1);
 DEFINE_QNODE(qdss_int, MSM8939_SNOC_QDSS_INT, 8, -1, -1, MSM8939_SNOC_INT_0, MSM8939_SNOC_INT_BIMC);
 DEFINE_QNODE(slv_apps_l2, MSM8939_SLAVE_AMPSS_L2, 16, -1, -1, 0);
-DEFINE_QNODE(slv_apss, MSM8939_SLAVE_APSS, 4, -1, 20, 0);
+DEFINE_QNODE(slv_apss, MSM8939_SLAVE_APSS, 4, -1, -1, 0);
 DEFINE_QNODE(slv_audio, MSM8939_SLAVE_LPASS, 4, -1, -1, 0);
 DEFINE_QNODE(slv_bimc_cfg, MSM8939_SLAVE_BIMC_CFG, 4, -1, -1, 0);
 DEFINE_QNODE(slv_blsp_1, MSM8939_SLAVE_BLSP_1, 4, -1, -1, 0);
 DEFINE_QNODE(slv_boot_rom, MSM8939_SLAVE_BOOT_ROM, 4, -1, -1, 0);
 DEFINE_QNODE(slv_camera_cfg, MSM8939_SLAVE_CAMERA_CFG, 4, -1, -1, 0);
-DEFINE_QNODE(slv_cats_0, MSM8939_SLAVE_CATS_128, 16, -1, 106, 0);
-DEFINE_QNODE(slv_cats_1, MSM8939_SLAVE_OCMEM_64, 8, -1, 107, 0);
+DEFINE_QNODE(slv_cats_0, MSM8939_SLAVE_CATS_128, 16, -1, -1, 0);
+DEFINE_QNODE(slv_cats_1, MSM8939_SLAVE_OCMEM_64, 8, -1, -1, 0);
 DEFINE_QNODE(slv_clk_ctl, MSM8939_SLAVE_CLK_CTL, 4, -1, -1, 0);
 DEFINE_QNODE(slv_crypto_0_cfg, MSM8939_SLAVE_CRYPTO_0_CFG, 4, -1, -1, 0);
 DEFINE_QNODE(slv_dehr_cfg, MSM8939_SLAVE_DEHR_CFG, 4, -1, -1, 0);
@@ -187,20 +187,20 @@ DEFINE_QNODE(slv_sdcc_2, MSM8939_SLAVE_SDCC_2, 4, -1, -1, 0);
 DEFINE_QNODE(slv_security, MSM8939_SLAVE_SECURITY, 4, -1, -1, 0);
 DEFINE_QNODE(slv_snoc_cfg, MSM8939_SLAVE_SNOC_CFG, 4, -1, -1, 0);
 DEFINE_QNODE(slv_spdm, MSM8939_SLAVE_SPDM, 4, -1, -1, 0);
-DEFINE_QNODE(slv_srvc_snoc, MSM8939_SLAVE_SRVC_SNOC, 8, -1, 29, 0);
+DEFINE_QNODE(slv_srvc_snoc, MSM8939_SLAVE_SRVC_SNOC, 8, -1, -1, 0);
 DEFINE_QNODE(slv_tcsr, MSM8939_SLAVE_TCSR, 4, -1, -1, 0);
 DEFINE_QNODE(slv_tlmm, MSM8939_SLAVE_TLMM, 4, -1, -1, 0);
 DEFINE_QNODE(slv_usb_hs1, MSM8939_SLAVE_USB_HS1, 4, -1, -1, 0);
 DEFINE_QNODE(slv_usb_hs2, MSM8939_SLAVE_USB_HS2, 4, -1, -1, 0);
 DEFINE_QNODE(slv_venus_cfg, MSM8939_SLAVE_VENUS_CFG, 4, -1, -1, 0);
-DEFINE_QNODE(snoc_bimc_0_mas, MSM8939_SNOC_BIMC_0_MAS, 16, 3, -1, MSM8939_SNOC_BIMC_0_SLV);
-DEFINE_QNODE(snoc_bimc_0_slv, MSM8939_SNOC_BIMC_0_SLV, 16, -1, 24, MSM8939_SLAVE_EBI_CH0);
+DEFINE_QNODE(snoc_bimc_0_mas, MSM8939_SNOC_BIMC_0_MAS, 16, -1, -1, MSM8939_SNOC_BIMC_0_SLV);
+DEFINE_QNODE(snoc_bimc_0_slv, MSM8939_SNOC_BIMC_0_SLV, 16, -1, -1, MSM8939_SLAVE_EBI_CH0);
 DEFINE_QNODE(snoc_bimc_1_mas, MSM8939_SNOC_BIMC_1_MAS, 16, 76, -1, MSM8939_SNOC_BIMC_1_SLV);
 DEFINE_QNODE(snoc_bimc_1_slv, MSM8939_SNOC_BIMC_1_SLV, 16, -1, 104, MSM8939_SLAVE_EBI_CH0);
 DEFINE_QNODE(snoc_bimc_2_mas, MSM8939_SNOC_BIMC_2_MAS, 16, -1, -1, MSM8939_SNOC_BIMC_2_SLV);
 DEFINE_QNODE(snoc_bimc_2_slv, MSM8939_SNOC_BIMC_2_SLV, 16, -1, -1, MSM8939_SLAVE_EBI_CH0);
 DEFINE_QNODE(snoc_int_0, MSM8939_SNOC_INT_0, 8, 99, 130, MSM8939_SLAVE_QDSS_STM, MSM8939_SLAVE_IMEM, MSM8939_SNOC_PNOC_MAS);
-DEFINE_QNODE(snoc_int_1, MSM8939_SNOC_INT_1, 8, 100, 131, MSM8939_SLAVE_APSS, MSM8939_SLAVE_CATS_128, MSM8939_SLAVE_OCMEM_64);
+DEFINE_QNODE(snoc_int_1, MSM8939_SNOC_INT_1, 8, -1, -1, MSM8939_SLAVE_APSS, MSM8939_SLAVE_CATS_128, MSM8939_SLAVE_OCMEM_64);
 DEFINE_QNODE(snoc_int_bimc, MSM8939_SNOC_INT_BIMC, 8, 101, 132, MSM8939_SNOC_BIMC_1_MAS);
 DEFINE_QNODE(snoc_pcnoc_mas, MSM8939_SNOC_PNOC_MAS, 8, -1, -1, MSM8939_SNOC_PNOC_SLV);
 DEFINE_QNODE(snoc_pcnoc_slv, MSM8939_SNOC_PNOC_SLV, 8, -1, -1, MSM8939_PNOC_INT_0);
-- 
2.17.1

