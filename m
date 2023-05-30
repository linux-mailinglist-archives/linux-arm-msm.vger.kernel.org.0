Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7364715FC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 14:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232124AbjE3MdG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 08:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231979AbjE3Mcj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 08:32:39 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D5C610D4
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 05:32:03 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2af2b74d258so46679601fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 05:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685449862; x=1688041862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PlH+JrndcdKZN+GkTBs2kJnCffmk2uG9dhn2HilsGHU=;
        b=xc1RfU2UFkZhCxmLheuF2JOyZ2L94UpslMeBtsSQQzLQWtDjZpugYnmOnwo+NREg/4
         3wXosgSxMp25oNEFxShqrgZYElxg7L+vDC3rW5Hsvz75UPk03caLhzA9xXYj2EZpjQJm
         AxLQtYAkQZehv72X2rApeI+YQgGobPTFDqL5ql7cHelL4Nz4ve4AczQ5OgoLAsrx8bht
         Gmg9yJDAftoWLG1i/6uopi6NTJ5agXpx9RPDT/xqV0Urr5k+uf/1GIc87Q4OFN4yR8xv
         257jeHSMuo/pyvhlzik6CCYBdl28l69hzljT1v5XHHxIg55rEqjBHxMT8An4SvII3H6u
         3byA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685449862; x=1688041862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlH+JrndcdKZN+GkTBs2kJnCffmk2uG9dhn2HilsGHU=;
        b=KgYguCTNAXBxU7tXd3rhLa0P1bOttlDjUKcnBvTFf2M7vZGKCHsjhqJfgafiVEfM1C
         Tu/HoTGFPtsG2UlYT3MMl6Scf8osBHPUdvpnV2DrlduImAhSxVb1h2Ixsr3sR8hQ6g6I
         XjkGpvVgrAdTik/3wxKLQcNgocngV4yP+dhrjRA5Xdd3NF/PfEAgMTTeWLtb5royDf/Q
         aSndX5JvxETud0XIkX347VI2MC6TkmLUgWtvPRU/puaHvl5u9LdjiA7+GLwH7Rn2qfDn
         VWZnWrkBv35qlgwCr6tPgJpx0qp0nxwZLjO3J8AApNDFC0gVdHJgu9yuYVeE6+3NPqvD
         w5Bw==
X-Gm-Message-State: AC+VfDzguHRRfflguUDY2Zis4lQzgfRCbKsC1E/Djn2Znh1u0e3JSvZm
        E09Z+Gp7mK7Nv7BZWrYAMc+Dzw==
X-Google-Smtp-Source: ACHHUZ6aONWgizquCWUsTUUGKe9U4KpOmnFPOkVeG5BswDJO7RYPB9Yzqn/YopkVlNO3qbBBfIC0Xw==
X-Received: by 2002:a2e:2c06:0:b0:2aa:3cee:c174 with SMTP id s6-20020a2e2c06000000b002aa3ceec174mr850031ljs.13.1685449862632;
        Tue, 30 May 2023 05:31:02 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id u18-20020a2e91d2000000b002a8b8baf542sm2854814ljg.126.2023.05.30.05.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 05:31:02 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 30 May 2023 14:30:50 +0200
Subject: [PATCH v4 16/17] media: venus: Use newly-introduced
 hfi_buffer_requirements accessors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v4-16-feebb2f6e9b8@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685449837; l=4427;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3p066I2lbVJExmECv9lPxRruVYg9txAn+/VwsZP5cd8=;
 b=dpAdiAsFt2CgjQ2eCjzVBnLTj8EtENen/rrPzlUeooH5+q4l55ldzCiLUoYTOCoxWLbDWxIRm
 jPZxigrlsu1CGienpW1mUszCwz4/mt1cL0la8aRM7y/jExYxAucQr9E
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

Now that we have a way which is independent of the HFI version to set
the correct fields in hfi_buffer_requirements, use it!

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c        |  5 +++--
 .../media/platform/qcom/venus/hfi_plat_bufs_v6.c   | 22 +++++++++++-----------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index b70bd3dac4df..8295542e1a7c 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -668,6 +668,7 @@ int venus_helper_get_bufreq(struct venus_inst *inst, u32 type,
 			    struct hfi_buffer_requirements *req)
 {
 	u32 ptype = HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS;
+	enum hfi_version ver = inst->core->res->hfi_version;
 	union hfi_get_property hprop;
 	unsigned int i;
 	int ret;
@@ -675,12 +676,12 @@ int venus_helper_get_bufreq(struct venus_inst *inst, u32 type,
 	memset(req, 0, sizeof(*req));
 
 	if (type == HFI_BUFFER_OUTPUT || type == HFI_BUFFER_OUTPUT2)
-		req->count_min = inst->fw_min_cnt;
+		hfi_bufreq_set_count_min(req, ver, inst->fw_min_cnt);
 
 	ret = platform_get_bufreq(inst, type, req);
 	if (!ret) {
 		if (type == HFI_BUFFER_OUTPUT || type == HFI_BUFFER_OUTPUT2)
-			inst->fw_min_cnt = req->count_min;
+			inst->fw_min_cnt = hfi_bufreq_get_count_min(req, ver);
 		return 0;
 	}
 
diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
index e97ff8cf6d64..f5a655973c08 100644
--- a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
+++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
@@ -1215,24 +1215,24 @@ static int bufreq_dec(struct hfi_plat_buffers_params *params, u32 buftype,
 
 	out_min_count = output_buffer_count(VIDC_SESSION_TYPE_DEC, codec);
 	/* Max of driver and FW count */
-	out_min_count = max(out_min_count, bufreq->count_min);
+	out_min_count = max(out_min_count, hfi_bufreq_get_count_min(bufreq, version));
 
 	bufreq->type = buftype;
 	bufreq->region_size = 0;
-	bufreq->count_min = 1;
 	bufreq->count_actual = 1;
-	bufreq->hold_count = 1;
+	hfi_bufreq_set_count_min(bufreq, version, 1);
+	hfi_bufreq_set_hold_count(bufreq, version, 1);
 	bufreq->contiguous = 1;
 	bufreq->alignment = 256;
 
 	if (buftype == HFI_BUFFER_INPUT) {
-		bufreq->count_min = MIN_INPUT_BUFFERS;
+		hfi_bufreq_set_count_min(bufreq, version, MIN_INPUT_BUFFERS);
 		bufreq->size =
 			calculate_dec_input_frame_size(width, height, codec,
 						       max_mbs_per_frame,
 						       buffer_size_limit);
 	} else if (buftype == HFI_BUFFER_OUTPUT || buftype == HFI_BUFFER_OUTPUT2) {
-		bufreq->count_min = out_min_count;
+		hfi_bufreq_set_count_min(bufreq, version, out_min_count);
 		bufreq->size =
 			venus_helper_get_framesz_raw(params->hfi_color_fmt,
 						     out_width, out_height);
@@ -1269,7 +1269,7 @@ static int bufreq_enc(struct hfi_plat_buffers_params *params, u32 buftype,
 	u32 work_mode = params->enc.work_mode;
 	u32 rc_type = params->enc.rc_type;
 	u32 num_vpp_pipes = params->num_vpp_pipes;
-	u32 num_ref;
+	u32 num_ref, count_min;
 
 	switch (codec) {
 	case V4L2_PIX_FMT_H264:
@@ -1289,21 +1289,21 @@ static int bufreq_enc(struct hfi_plat_buffers_params *params, u32 buftype,
 
 	bufreq->type = buftype;
 	bufreq->region_size = 0;
-	bufreq->count_min = 1;
 	bufreq->count_actual = 1;
-	bufreq->hold_count = 1;
+	hfi_bufreq_set_count_min(bufreq, version, 1);
+	hfi_bufreq_set_hold_count(bufreq, version, 1);
 	bufreq->contiguous = 1;
 	bufreq->alignment = 256;
 
 	if (buftype == HFI_BUFFER_INPUT) {
-		bufreq->count_min = MIN_INPUT_BUFFERS;
+		hfi_bufreq_set_count_min(bufreq, version, MIN_INPUT_BUFFERS);
 		bufreq->size =
 			venus_helper_get_framesz_raw(params->hfi_color_fmt,
 						     width, height);
 	} else if (buftype == HFI_BUFFER_OUTPUT ||
 		   buftype == HFI_BUFFER_OUTPUT2) {
-		bufreq->count_min =
-			output_buffer_count(VIDC_SESSION_TYPE_ENC, codec);
+		count_min = output_buffer_count(VIDC_SESSION_TYPE_ENC, codec);
+		hfi_bufreq_set_count_min(bufreq, version, count_min);
 		bufreq->size = calculate_enc_output_frame_size(width, height,
 							       rc_type);
 	} else if (buftype == HFI_BUFFER_INTERNAL_SCRATCH(version)) {

-- 
2.40.1

