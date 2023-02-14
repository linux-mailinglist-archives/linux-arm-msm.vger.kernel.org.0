Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBF8A69671B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 15:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233554AbjBNOim (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 09:38:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233472AbjBNOib (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 09:38:31 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39C332A9B6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 06:38:15 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id v13so17661448eda.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 06:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJCQPkMo7WAJkj+57CfoI7qkGu8zTyPx4xks1X9yahs=;
        b=eK1VYaDEis0UR1gAg3Ptuend7jTW3UObknUnXxOM6nz0hNjmg8mttlhnhzenS9CBjV
         p2WLDq1lqWo7SRzrJJ7an9OQSLAEfcYu5aHpb1L3yGecDDR7jzaq/OSBi4bLeeW/jC63
         Ae17BuCkT/vIhgPKq7Gn1uiaszE/bgZsyl3pYmpnJCkjaDLI47o22h9l/gifH5JpbzWU
         zvnQaW6Vl3VP7wHxb6tE2nG/K3NMxG4vKBlS5IAMqJeSCtTbVoznpd3E8T9fJOHOAMdf
         CR+TdZTqQ0pfv7PHa4w/JY+PRRtHirSHrPLQlQNxpmVcySeX4lA28EqbWG/v2rUgk0FF
         DpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJCQPkMo7WAJkj+57CfoI7qkGu8zTyPx4xks1X9yahs=;
        b=lebDnrWmQRNpK60txLxnjQexvMV+/KydirLF4nskHiM0kiFY6dqqXZ4TrPdA4bYBbE
         I5MNUa6fKdvSGiuUAzFW8sHuKIh3FFp44VT6NWviMQCxlX8LVy1KK4ObAT7qHZHHNOF7
         aF1zq25zD/CGYC6O7d/aFp3F6HpkttcyPcMi20WvUdAditXlwFeSLULaU8wydvi5vAq1
         u6YKz8324RWv1KHxUChPcQbmJfq9YAJWX9qz6gqZ/Nt3CzDBIv4KMPhwMoWbduST6Z0x
         UegCExEf7xaqke3AQ5KcAriAk9eh7bqwdShWRKMErfhnAkwiJWVS/PFk+Fn3L7r95awG
         jX4A==
X-Gm-Message-State: AO0yUKVeFei5yH532Uyk+oOwUc8OJZnzYq5IejhxgWNjnjlTUqUhd9Nx
        TsovwvKi7PpUWI5pv0kaGWcP/rwG1NGKFf/3
X-Google-Smtp-Source: AK7set+mYNNqE0zRpd6FXmlvts0mLH5Fc27sAuhJP17bGBM4zCE+afxTBjL4ls9yotjoq+pW8ca3hg==
X-Received: by 2002:a50:8ade:0:b0:4ab:4d69:f9e3 with SMTP id k30-20020a508ade000000b004ab4d69f9e3mr2829455edk.20.1676385494659;
        Tue, 14 Feb 2023 06:38:14 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id eg21-20020a056402289500b004acb6189693sm5378052edb.83.2023.02.14.06.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 06:38:14 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Georgi Djakov <djakov@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 12/12] interconnect: qcom: icc-rpm: Allow negative QoS offset
Date:   Tue, 14 Feb 2023 15:37:20 +0100
Message-Id: <20230214143720.2416762-13-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214143720.2416762-1-konrad.dybcio@linaro.org>
References: <20230214143720.2416762-1-konrad.dybcio@linaro.org>
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

In some very very very very unfortunate cases, the correct offset of
the QoS registers will be.. negative. One such case is MSM8998, where
The DDR BWMON occupies what-would-be-the-BIMC-base which we usually
take into account with the register calculation, making the actual
BIMC node start at what-would-be-the-BIMC-base+0x300.

In order to keep the calculation code sane, the simplest - however
ugly it may be - solution is to allow the offset to be negative.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index 77e263b93c27..5e4215f25c2e 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -39,7 +39,7 @@ struct qcom_icc_provider {
 	int num_intf_clks;
 	enum qcom_icc_type type;
 	struct regmap *regmap;
-	unsigned int qos_offset;
+	int qos_offset;
 	u64 bus_clk_rate[2];
 	bool keep_alive;
 	struct clk_bulk_data bus_clks[2];
@@ -105,7 +105,7 @@ struct qcom_icc_desc {
 	bool keep_alive;
 	enum qcom_icc_type type;
 	const struct regmap_config *regmap_cfg;
-	unsigned int qos_offset;
+	int qos_offset;
 };
 
 /* Valid for all bus types */
-- 
2.39.1

