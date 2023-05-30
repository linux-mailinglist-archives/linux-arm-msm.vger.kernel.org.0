Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB78715FC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 14:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbjE3Mcq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 08:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbjE3Mc2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 08:32:28 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB7D41B3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 05:31:48 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f3a873476bso4745591e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 05:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685449859; x=1688041859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YRnWjbY4eUpy9oiw3Jwu9xibfYWN+hzyctbtgGIUQYc=;
        b=km8NCG0kZRfT8qnXV6rt816QmQM6EzBrPUyMg/8X0Qr20WzDkXOjCU7Y91USgTWtLb
         GgFdDM1fjtSmww+I6XUIooQ/CsrRU7mjNBccf2n9qQKkc49EOczsxb1H/wfWNMloap1b
         TkBf6jtSH8/j/HZ9tVDKwBbKw9n96BZC9rN4H76OsenTbkN/fTFSIsggrq/P236jUWwq
         xO2mV5FfHag9y0Ro8kJepCgpa3E0a/IJFn4bzC/dWo1L7gyMomsqh+GNyPpJzr5Dn8n8
         qU5nRabs7Xg6DvMFZBHSkSE/NFS4h3qQy58qvCpdQlxnQ+k6t2DazBNLMcCExK6FeZ7j
         kRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685449859; x=1688041859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YRnWjbY4eUpy9oiw3Jwu9xibfYWN+hzyctbtgGIUQYc=;
        b=PRmHKnG5I2y27oV+9aBWB5dxO0G1FgDg4SldZmqducaDee+Psdo5PAga5ksLQ/vS3W
         wQ8R1jys+/1UwK64DjAE37IyMohp2Q0XGKMLKLaq+plBRG5c6FiNOL5WNoA+i/Gl9Jgf
         p9DqJPtxFUJabDxdx6OWO2EuxztYG8BWghL4tl4RmkgAE5CbVdlTdfw3vs4+psH3MUJI
         J/7WSI1MLHm4g38yzoqQkaKEEIUYVrLV5V6AoB6z64b6Jb1Kkkr3NlxQI0YwlJ8M028E
         ayw3IyzVnCizc0RScDOz1/N+tHX4Z4QQiPuhNq8uiK195i33dREdjdmFLmkCzta4i8S1
         bSjA==
X-Gm-Message-State: AC+VfDxgS9Hi/9/WjPCZ9I24rap3MafulCrvwiXquYguOk94UJ3D3sfU
        NiHVk2HcRlhUg3ycAkrEZxHJEQ==
X-Google-Smtp-Source: ACHHUZ6tY6ffzc779ZZWx2WJPPraRkXITaw1tGxal7W29DC34kmYSkr2cepdPoW4rAJepXxPbodzsg==
X-Received: by 2002:a2e:b1d3:0:b0:2ad:9751:8d79 with SMTP id e19-20020a2eb1d3000000b002ad97518d79mr695211lja.31.1685449859370;
        Tue, 30 May 2023 05:30:59 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id u18-20020a2e91d2000000b002a8b8baf542sm2854814ljg.126.2023.05.30.05.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 05:30:59 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 30 May 2023 14:30:48 +0200
Subject: [PATCH v4 14/17] media: venus: vdec: Sanitize
 vdec_set_work_route() per-VPU-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v4-14-feebb2f6e9b8@linaro.org>
References: <20230228-topic-venus-v4-0-feebb2f6e9b8@linaro.org>
In-Reply-To: <20230228-topic-venus-v4-0-feebb2f6e9b8@linaro.org>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685449837; l=867;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=VGY5gPiqtp3BTJb/zA96U45nnyM1YeyDLDunCuTDVFE=;
 b=QkUtZtfy1Bmq8vawWj2OnYkiTfqBytb97u4bsYds4a47S03RWHQbiGtpEXfmwIrEFCOjZpjN6
 SIhJpleXbiKAayuh71xUgC5V6dMI7JDvUCOsO7rCTthDQChW+drW2bq
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Replace the general IS_V6 checks with more specific VPU version checks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 12a2e99508f5..063a8b0d357b 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -727,7 +727,7 @@ static int vdec_set_work_route(struct venus_inst *inst)
 	u32 ptype = HFI_PROPERTY_PARAM_WORK_ROUTE;
 	struct hfi_video_work_route wr;
 
-	if (!IS_V6(inst->core))
+	if (!(IS_IRIS2(inst->core) || IS_IRIS2_1(inst->core)))
 		return 0;
 
 	wr.video_work_route = inst->core->res->num_vpp_pipes;

-- 
2.40.1

