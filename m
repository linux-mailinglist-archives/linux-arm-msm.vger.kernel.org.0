Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E887E50BF47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 20:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbiDVSEY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 14:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236663AbiDVR7h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 13:59:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E56EA107839
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 10:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650650121;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=k3HrrpfGqniKCURYCsUKg4ydRGoKS2ndx8X4LPtdmyI=;
        b=VkEazRSK56vj4W/8R5fPni2FbXbQ418m12Rw3Nbe7v6da5lJIFWmI7AGfXDYxtx9eKztnU
        UI+WwFFrW9zg2uTf6cwzEBBt6uNM0/7qDC1wrJDbIFlEFk6xLWeaNlRwjKY6iadZmL3soD
        15lHoXeTIMQmeP2fP2Z/DxkqrWKwb/0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-m7kfN051MQWaoSPlER4qDQ-1; Fri, 22 Apr 2022 13:38:17 -0400
X-MC-Unique: m7kfN051MQWaoSPlER4qDQ-1
Received: by mail-qt1-f199.google.com with SMTP id m3-20020ac86883000000b002ed8d29a300so5435173qtq.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 10:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k3HrrpfGqniKCURYCsUKg4ydRGoKS2ndx8X4LPtdmyI=;
        b=IfYjynYPa7zUFStIodlNELp2FqPi0Gy4Tsg2DXHJYdMb1KlFyGi1Ou4MmRFu7D4VP+
         LWcRiA+GHCEJPEi47wQ2NwcYUeeQeJaW+L6BCX5mGZLIcuQks74Fob1LwCTY1Mgoe4h9
         kFw1Icepa948TACYBkk9lrNraZXN6MKJa+B+Opn6PLevZJHtyCE4iN9kRFhO2viEWQkL
         4b5Gue+uY6F2cBBPwpKnO3gQ3QQmLK1xub8leh9coT9uQ5LG7ILVhTs+iVe1QnBMMSu+
         9wP1rlFMQEgngMdDI7eRNudvqY4qxEjeaMSwCvXJe2W2EVZd1ypfAz56+nXuvuCTuR8g
         Fjew==
X-Gm-Message-State: AOAM532/ASCzE4FLjj0AhnqGlJyNnZlgm0xa0fIH2a71fEMBoMMSwhbq
        pdDsqzSgLWly9leXBrkl1dUNwRGlmSR0/Ffmi3g1ZYqAf8OKfxkIlwcd3HprPIqV+UJM+p1AfR7
        JZRaeb177dLQgLCT8ONi79gAEVg==
X-Received: by 2002:a37:98c4:0:b0:69a:e14:16a2 with SMTP id a187-20020a3798c4000000b0069a0e1416a2mr3413362qke.610.1650649096855;
        Fri, 22 Apr 2022 10:38:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkRrCWTOZmr28sXJrcrAJhJH2aK2MQtPPCGY75e8P7o2eFbaxXJLJT6M4oqXObSBb/4+ejPw==
X-Received: by 2002:a37:98c4:0:b0:69a:e14:16a2 with SMTP id a187-20020a3798c4000000b0069a0e1416a2mr3413353qke.610.1650649096641;
        Fri, 22 Apr 2022 10:38:16 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id g11-20020ac84b6b000000b002f35e802a55sm352570qts.1.2022.04.22.10.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 10:38:16 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] soc: qcom: pdr: use static for servreg_* variables
Date:   Fri, 22 Apr 2022 13:38:06 -0400
Message-Id: <20220422173806.21982-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sparse reports this repesentative issue
pdr_internal.h:31:22: warning: symbol 'servreg_location_entry_ei' was not declared. Should it be static?
Similar for other servreg_*

Global variables should not be defined in header files.
This only works because pdr_internal.h is only included
by pdr_interface.c.  Single file use variables should be
static so add static to their storage-class specifiers.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/soc/qcom/pdr_internal.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/qcom/pdr_internal.h b/drivers/soc/qcom/pdr_internal.h
index ab9ae8cdfa54..a30422214943 100644
--- a/drivers/soc/qcom/pdr_internal.h
+++ b/drivers/soc/qcom/pdr_internal.h
@@ -28,7 +28,7 @@ struct servreg_location_entry {
 	u32 instance;
 };
 
-struct qmi_elem_info servreg_location_entry_ei[] = {
+static struct qmi_elem_info servreg_location_entry_ei[] = {
 	{
 		.data_type      = QMI_STRING,
 		.elem_len       = SERVREG_NAME_LENGTH + 1,
@@ -74,7 +74,7 @@ struct servreg_get_domain_list_req {
 	u32 domain_offset;
 };
 
-struct qmi_elem_info servreg_get_domain_list_req_ei[] = {
+static struct qmi_elem_info servreg_get_domain_list_req_ei[] = {
 	{
 		.data_type      = QMI_STRING,
 		.elem_len       = SERVREG_NAME_LENGTH + 1,
@@ -116,7 +116,7 @@ struct servreg_get_domain_list_resp {
 	struct servreg_location_entry domain_list[SERVREG_DOMAIN_LIST_LENGTH];
 };
 
-struct qmi_elem_info servreg_get_domain_list_resp_ei[] = {
+static struct qmi_elem_info servreg_get_domain_list_resp_ei[] = {
 	{
 		.data_type      = QMI_STRUCT,
 		.elem_len       = 1,
@@ -199,7 +199,7 @@ struct servreg_register_listener_req {
 	char service_path[SERVREG_NAME_LENGTH + 1];
 };
 
-struct qmi_elem_info servreg_register_listener_req_ei[] = {
+static struct qmi_elem_info servreg_register_listener_req_ei[] = {
 	{
 		.data_type      = QMI_UNSIGNED_1_BYTE,
 		.elem_len       = 1,
@@ -227,7 +227,7 @@ struct servreg_register_listener_resp {
 	enum servreg_service_state curr_state;
 };
 
-struct qmi_elem_info servreg_register_listener_resp_ei[] = {
+static struct qmi_elem_info servreg_register_listener_resp_ei[] = {
 	{
 		.data_type      = QMI_STRUCT,
 		.elem_len       = 1,
@@ -263,7 +263,7 @@ struct servreg_restart_pd_req {
 	char service_path[SERVREG_NAME_LENGTH + 1];
 };
 
-struct qmi_elem_info servreg_restart_pd_req_ei[] = {
+static struct qmi_elem_info servreg_restart_pd_req_ei[] = {
 	{
 		.data_type      = QMI_STRING,
 		.elem_len       = SERVREG_NAME_LENGTH + 1,
@@ -280,7 +280,7 @@ struct servreg_restart_pd_resp {
 	struct qmi_response_type_v01 resp;
 };
 
-struct qmi_elem_info servreg_restart_pd_resp_ei[] = {
+static struct qmi_elem_info servreg_restart_pd_resp_ei[] = {
 	{
 		.data_type      = QMI_STRUCT,
 		.elem_len       = 1,
@@ -300,7 +300,7 @@ struct servreg_state_updated_ind {
 	u16 transaction_id;
 };
 
-struct qmi_elem_info servreg_state_updated_ind_ei[] = {
+static struct qmi_elem_info servreg_state_updated_ind_ei[] = {
 	{
 		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
 		.elem_len       = 1,
@@ -336,7 +336,7 @@ struct servreg_set_ack_req {
 	u16 transaction_id;
 };
 
-struct qmi_elem_info servreg_set_ack_req_ei[] = {
+static struct qmi_elem_info servreg_set_ack_req_ei[] = {
 	{
 		.data_type      = QMI_STRING,
 		.elem_len       = SERVREG_NAME_LENGTH + 1,
@@ -362,7 +362,7 @@ struct servreg_set_ack_resp {
 	struct qmi_response_type_v01 resp;
 };
 
-struct qmi_elem_info servreg_set_ack_resp_ei[] = {
+static struct qmi_elem_info servreg_set_ack_resp_ei[] = {
 	{
 		.data_type      = QMI_STRUCT,
 		.elem_len       = 1,
-- 
2.27.0

