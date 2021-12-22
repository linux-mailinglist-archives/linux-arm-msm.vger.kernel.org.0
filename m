Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED32547CA53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Dec 2021 01:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239557AbhLVAfx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Dec 2021 19:35:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239660AbhLVAfx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Dec 2021 19:35:53 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACEA8C06173F
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 16:35:52 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id q16so1321540wrg.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 16:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kPtTFGn2tGeKeymRdxbyf1QBvWwFI2h1xHsM32S/P4o=;
        b=RkN9fqfjbxRdlGyd9RBhWWhyVRavjiBgwFT+MkA+hQnVZDvXp4vo5rc6y2GpjKpxcU
         Ee06dbKnjhq09zwUuhJ7UdGKcIAI5/ypX1wkQvljzKeSp7ohn6rjkBn6HB87yBD7viG7
         qMBjFxVe69N2bJF/jCnn27mZ9o01Vnb2FQ3IB7LKPIGDjtKt5GxG3aN20LjBV3b5YDjE
         +S1+hX3Hen9aUOWzlbfJeXqW4r3OCoRwafp/7csm84Vrnf2bpSW4WUTW/Pc7oIfOVhS7
         Le8WnP/oWzV9u0q09ZKqk37t8t/J7WWd+pFXapb2MDop5mF/SGVdGBbyxCmj4g52rUJ9
         9v/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kPtTFGn2tGeKeymRdxbyf1QBvWwFI2h1xHsM32S/P4o=;
        b=f8EFRIkwHa5M+FerEb+3YHhWIYpp9no9MxT9bhNUtBi52Vp4YL+XjrQBkHe/mEdgGi
         JefQ5KuHdkxbcqt5N6sJq2wYK73Hxy95tC1C7kGODX9RWiJ+xA73JZ2UCnuhhrp7FOxk
         ru7eqpqlvEK0S46uVBAw8awYqmyyAT172x1ML2I+8BjzqnhoPvz0tglMRTXo0ijxywXX
         fKRyAdLyG8xj9aKDkNUIaRuOm09ecYqVDBpqZFTKcoYTaqejPTUQjG/geeuPz0xnvZs0
         lgd+jBRa7+x68uHwht3sL2LJ//KzLJvFVuFNP3kxbt57Mvb6tfr7Qvtvp7qJHtGTAwog
         Y25w==
X-Gm-Message-State: AOAM530+KK+EKPa0MXD6bVifssdVs4x7PwperRLAPj3Txt65xc6fA6Mh
        2B/35f7TLIi6intFTitXNA7ZGEGf1j/QjA==
X-Google-Smtp-Source: ABdhPJylFz9zpNeUIEQl/G9jpSkXOwPlRHgAUTCTlQsqWRKgF//EktSua2lKSmpfaIXrwaKoizZCzQ==
X-Received: by 2002:a05:6000:1048:: with SMTP id c8mr408286wrx.508.1640133351061;
        Tue, 21 Dec 2021 16:35:51 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7sm282825wms.45.2021.12.21.16.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:35:50 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 05/19] media: camss: csid-170: fix non-10bit formats
Date:   Wed, 22 Dec 2021 00:37:37 +0000
Message-Id: <20211222003751.2461466-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Use the decode_format/data_type from the "format" struct instead of a
hardcoded 10-bit format.

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index ac22ff29d2a9f..aa65043c33037 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -366,7 +366,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 			val |= input_format->width & 0x1fff << TPG_DT_n_CFG_0_FRAME_WIDTH;
 			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_0(0));
 
-			val = DATA_TYPE_RAW_10BIT << TPG_DT_n_CFG_1_DATA_TYPE;
+			val = format->data_type << TPG_DT_n_CFG_1_DATA_TYPE;
 			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_1(0));
 
 			val = tg->mode << TPG_DT_n_CFG_2_PAYLOAD_MODE;
@@ -382,8 +382,9 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		val = 1 << RDI_CFG0_BYTE_CNTR_EN;
 		val |= 1 << RDI_CFG0_FORMAT_MEASURE_EN;
 		val |= 1 << RDI_CFG0_TIMESTAMP_EN;
+		/* note: for non-RDI path, this should be format->decode_format */
 		val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
-		val |= DATA_TYPE_RAW_10BIT << RDI_CFG0_DATA_TYPE;
+		val |= format->data_type << RDI_CFG0_DATA_TYPE;
 		val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
 		val |= dt_id << RDI_CFG0_DT_ID;
 		writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
-- 
2.33.0

