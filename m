Return-Path: <linux-arm-msm+bounces-103442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEbxBB7v4Gl4ngAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 16:15:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B3240F73D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 16:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8609C31831BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BFF3DEADE;
	Thu, 16 Apr 2026 14:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hk3qdE8o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bRLkCOYv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E8E15853B
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 14:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776348632; cv=none; b=tgXaafrcj1igIyVVdchf/mhtOZq2mVZHQD8HTWr92xCrjIC7d6vNf+gpXB9ajuaQVak4uM90vwFUriMzsHU9zDeyH62bxu0JpgpM4w2DTUfuAKclxwVZ4arP+Z1cgX9vO5+IW3aLVw39G+lr2ufckriXydF35SA+h8LEVvRMdgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776348632; c=relaxed/simple;
	bh=jLSelPvlya5PlSF3BSCeXWNO38xxNT62OMTcs59kxy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R0u2JedLQvtmOE3Aeg+0/eL6FcRKWVRF2ZohaolU7eDgLIZnwkNokP1ByVc39dVoUmjHeeu63WTecqpv7mW2VdlnvsW5D6wTLUClhEUayHdu0yD5idpePY/dKInAUOTosFuAdKRSrDttcOcD8nx4PRY1meZdSTOCs6EfBuL/db0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hk3qdE8o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bRLkCOYv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8Y8RT1703935
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 14:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2DrLFZCgjnzYRSDXk/anHPMrlL9toedQJxC2wRf4GXo=; b=Hk3qdE8on/oG8s8b
	0D00Os0ghR3Mrh0lnYIbAIQN62zskGYamAlwcSyCOFGQKQeGvAdfV5hjY4H6eJbb
	KzrWwigx/wZo78OAA5cx9Ojd5h+NIAWQbp3nlDrSfVLJBVN2HIL0qHk/vigDL71y
	CftZAxKRxzp1XZF3DmDaAYYpYnGqqYSUWFAp2FsGljRRaEHBbP/M4Ta5fVgdxHor
	QmpyZ/xexbW3n5vunVMxLGnBU68G019XoDHDVruLzTmYJt7j3oqcsP0hQv36cyMn
	Efi0OooU/rLCAz649K5Lr0LRiXG3y45TKtyrYyVQfNnfH2AMOjp8dTQEjxIQDSdM
	F+0M3Q==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djdamm40w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 14:10:28 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6501528b1caso6168285d50.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 07:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776348628; x=1776953428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2DrLFZCgjnzYRSDXk/anHPMrlL9toedQJxC2wRf4GXo=;
        b=bRLkCOYvsc4brzye//urwoAvnEPizsso6uBMlia3A+Rqd7F1FtnFA2XB8ubhBaFgb4
         EAVcy+Xq1xxFE0bkZGkHnZXwAUGTp75keE2U/Ic5UmVbVSBg4m8shay/XycsojHDFqT5
         a5xoQU9zBhUDT1ECMHyjP4jr2Yx2B6I/tfe2uVfLJsdHDwTDp6ann84Du31PB83gmDHn
         o0YKfY8VlVTdGLSgJLEO2SRsyqCm3k8vlEUOpfQ/QfmAfG0a0Wzp6Ecxkle5OXA5d94T
         SouBb0CE1+4mZnRL72xD6Y7xdibPefDLN6bd9SygfT6THXZ9tGdyegBPOLd2ju78WEj5
         pNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776348628; x=1776953428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2DrLFZCgjnzYRSDXk/anHPMrlL9toedQJxC2wRf4GXo=;
        b=r3MfUBis9Z/GWbQ0GSFmx2WMUkM8XXVM0qMB71G3jJU+mrup5GmCZ/h73Z61hN6KVC
         ppIndCfGn3p40+XAB4VJ4+voIKuVfu1QQtU3CnzeHG7FMl1c6jTwAP0gBRhoRoH+x2xw
         Z7Z+RC1hhcioD8dX/RaO9IQKAT4iNScfxapQKqF2s9kqeyvCuPtHkKp849bW5jYGX3eW
         HH8uoNOoz1NxehO15VT9C12z6Lzf6T1s66Y+w1U6lJ8VpQDjV/PXOjlZ2YaE3Gk7TN66
         lQCEKud4pjoAti1XMrCIIVu+tQogoVcVMDDMRNKq5GS55qaLk8k1ys8k6ikpKbl5atpQ
         p2Iw==
X-Forwarded-Encrypted: i=1; AFNElJ+0KLdMzJPiuibWr8ZqWb/lAuU/tWvRN9hbNKlFooNrVF7fbWguzrxjZGn4nRL//R7K7KkGTQ3HYeWv+yRh@vger.kernel.org
X-Gm-Message-State: AOJu0YxKMiHoiTJxByandZerPXQFkL6ING8HftdbAanFNcOsR298Qqru
	vT7A5Zq65u+7lDsk6TnH+pCTz5kdvG/5bajsMZbP21bhK65UVT02ARn9ocZXeHfvPsxw2mqMJe3
	ic4FyiF3B1X3sfh4ePVwtpnt0fUb9sjm075nVQbM29Z4SNon7TiIxKNkoWjjGp6E29NHA
X-Gm-Gg: AeBDiesAx3PQxHNWnINi62k8IEMahOiJCSBYY7bPyxLKR9OmKXumQt+cw+fBP8pVghH
	28+PliKxf2I8xIe4HpVV5N+P1TfXLTwqH1wTmmXotR3A5c7/77OlQjL08QpmA0TQe2E108PDHxq
	sZuVw8LhKZ3ddw8MgMsY7agzIFosQhb+nDAtsaPeoYo1DgW5i9TX08GlIdYmF67DPjXbCCRJ8tS
	l2Lq3+h4AYxLoFcqHbwvigocHhTjFFVNlG+SGwiQ/XufWOycDQqyv/MK9AyG5A4zesXkaw0jSaE
	+HNlSl/m2P5oJp8Awf+0KAWd8JJAjDpPYxtpzwMsih4V08dnDAzrotZKdd6LdCKESVqiIP7G8yv
	Kmv8ccN49Lh7EQg9HPzAW1LlSkVscOIhKqb61tl+kxgCQhKrPx+g=
X-Received: by 2002:a53:c842:0:b0:650:18e3:d917 with SMTP id 956f58d0204a3-65198b4713dmr19780513d50.41.1776348627449;
        Thu, 16 Apr 2026 07:10:27 -0700 (PDT)
X-Received: by 2002:a53:c842:0:b0:650:18e3:d917 with SMTP id 956f58d0204a3-65198b4713dmr19780453d50.41.1776348626819;
        Thu, 16 Apr 2026 07:10:26 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-652e47ba4a3sm2084691d50.17.2026.04.16.07.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:10:26 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 19:39:47 +0530
Subject: [PATCH v5 6/7] bus: mhi: Capture DDR training data via command
 mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-sahara_protocol_new_v2-v5-6-6aebf005e4ba@oss.qualcomm.com>
References: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
In-Reply-To: <20260416-sahara_protocol_new_v2-v5-0-6aebf005e4ba@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776348592; l=15044;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=jLSelPvlya5PlSF3BSCeXWNO38xxNT62OMTcs59kxy8=;
 b=OmZoFh3+FaTmElb9qLRJXQ7+wQSSQZTd1Q1s/IgNbSTlxk9SUqr/wNbMMy6JYKbQ+4M9KUtFX
 TjplyASHAr7BsJqqLq9+59ytaxermotsLhrikmvgHCyMUDNZXEnop2U
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-ORIG-GUID: POoE4upTk1I5KEwnR7g7-JSFK_TAnV4Y
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=69e0edd4 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_u4x-iUupSARUiuVX_kA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: POoE4upTk1I5KEwnR7g7-JSFK_TAnV4Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEzNiBTYWx0ZWRfXwySloBGAJKbX
 BJQo1Q2UFT79nj5HgYqScI4IaT4vR9mYDB+pl43Jt1o0pcw5e4OcyARvC2PTqQqEcTtxIU1vTR8
 hkWO1x1xOuIN9iTS+FgyxvDC54P9+/v9MtzfEAsrAdsmTo9vmbhDA7uAqXfHeBBgGclV3qN9lZ7
 77mkyY2ze7Q9hrLl/s9ANM1aWJgTCtmgb1JxKIhzC4eo1b4GHRcso5/tCXmMvJt9dlUqWqgn46y
 6hVfwXEeCqRI80h68PaJKPjvqbVf46WnYolYX5QVIPopg/YguiLhvSEMZN+7WMQkqNg4fV4qcpa
 W2bZZjdeqVVDzDEILRb4AnLLDITwtyassA4u/oX1Lg+YoPSDN+L3Q35CMflgaqNB0794oxi9cOs
 529+ycetkipooRvDijGVzSHN7fmsZMKrH7fFnGJt34aDYIZXdwGb57d8n6m8nFAlYj3uqTqOx9h
 HvkLXM9gh40NfOQE7dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160136
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103442-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 16B3240F73D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

During early boot, devices may perform DDR training and produce training
data that can be reused on subsequent boots to reduce initialization
time. The Sahara protocol provides a command mode flow to transfer this
training data to the host, but the driver currently does not handle
command mode and drops the training payload.

Add Sahara command mode support to retrieve DDR training data from the
device. When the device enters command mode and sends CMD_READY, query
the support command list(ID 8) and request DDR training data(ID 9) using
EXECUTE and EXECUTE_DATA as defined by protocol. Allocate receive buffers
based on the reported response size and copy the raw payload directly from
the MHI DL completion callback.

Store the captured training data in controller-scoped memory using devres,
so it remains available after Sahara channel teardown. Also distinguish
raw payload completion from control packets in the DL callback, avoiding
misinterpretation of training data as protocol messages, and requeue
the RX buffer after switching back to IMAGE_TX_PENDING to allow the
boot flow to continue.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/host/clients/sahara/sahara.c | 326 ++++++++++++++++++++++++++-
 1 file changed, 319 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index b5ca6353540dc3815db6539e7424afdb749fd3f6..07bc743aa061dd2fa85638067d494562152474e3 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -5,11 +5,14 @@
  */
 
 #include <linux/devcoredump.h>
+#include <linux/device.h>
+#include <linux/device/devres.h>
 #include <linux/firmware.h>
 #include <linux/limits.h>
 #include <linux/mhi.h>
 #include <linux/minmax.h>
 #include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
 #include <linux/overflow.h>
 #include <linux/types.h>
 #include <linux/vmalloc.h>
@@ -59,7 +62,15 @@
 #define SAHARA_RESET_LENGTH		0x8
 #define SAHARA_MEM_DEBUG64_LENGTH	0x18
 #define SAHARA_MEM_READ64_LENGTH	0x18
+#define SAHARA_COMMAND_READY_LENGTH	0x8
+#define SAHARA_COMMAND_EXEC_RESP_LENGTH	0x10
+#define SAHARA_COMMAND_EXECUTE_LENGTH	0xc
+#define SAHARA_COMMAND_EXEC_DATA_LENGTH	0xc
+#define SAHARA_SWITCH_MODE_LENGTH	0xc
+#define SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST	0x8
+#define SAHARA_EXEC_CMD_GET_TRAINING_DATA	0x9
 #define SAHARA_DDR_TRAINING_IMG_ID	34
+#define SAHARA_NUM_CMD_BUF		SAHARA_NUM_TX_BUF
 
 struct sahara_packet {
 	__le32 cmd;
@@ -95,6 +106,19 @@ struct sahara_packet {
 			__le64 memory_address;
 			__le64 memory_length;
 		} memory_read64;
+		struct {
+			__le32 client_command;
+		} command_execute;
+		struct {
+			__le32 client_command;
+			__le32 response_length;
+		} command_execute_resp;
+		struct {
+			__le32 client_command;
+		} command_exec_data;
+		struct {
+			__le32 mode;
+		} mode_switch;
 	};
 };
 
@@ -161,6 +185,7 @@ struct sahara_context {
 	struct work_struct		fw_work;
 	struct work_struct		dump_work;
 	struct work_struct		read_data_work;
+	struct work_struct		cmd_work;
 	struct mhi_device		*mhi_dev;
 	const char * const		*image_table;
 	u32				table_size;
@@ -181,6 +206,24 @@ struct sahara_context {
 	bool				is_mem_dump_mode;
 	bool				non_streaming;
 	const char			*fw_folder;
+	bool				is_cmd_mode;
+	bool				receiving_training_data;
+	size_t				training_size;
+	size_t				training_rcvd;
+	u32				training_nbuf;
+	char				*cmd_buff[SAHARA_NUM_CMD_BUF];
+};
+
+/*
+ * Controller-scoped training data store (per MHI controller device).
+ * Stored as devres resource on mhi_dev->mhi_cntrl->mhi_dev->dev.
+ */
+struct sahara_cntrl_training_data {
+	struct mutex lock;	/* Protects data, size, copied and receiving */
+	void *data;
+	size_t size;
+	size_t copied;
+	bool receiving;
 };
 
 static bool is_streaming(struct sahara_context *context)
@@ -188,6 +231,48 @@ static bool is_streaming(struct sahara_context *context)
 	return !context->non_streaming;
 }
 
+static void sahara_cntrl_training_release(struct device *dev, void *res)
+{
+	struct sahara_cntrl_training_data *ct = res;
+
+	mutex_lock(&ct->lock);
+	kfree(ct->data);
+	ct->data = NULL;
+	ct->size = 0;
+	ct->copied = 0;
+	ct->receiving = false;
+	mutex_unlock(&ct->lock);
+}
+
+static int sahara_cntrl_training_match(struct device *dev, void *res, void *match_data)
+{
+	/* Exactly one instance per controller */
+	return 1;
+}
+
+static struct sahara_cntrl_training_data *sahara_cntrl_training_get(struct device *dev)
+{
+	struct sahara_cntrl_training_data *ct;
+
+	ct = devres_find(dev, sahara_cntrl_training_release,
+			 sahara_cntrl_training_match, NULL);
+	if (ct)
+		return ct;
+
+	ct = devres_alloc(sahara_cntrl_training_release, sizeof(*ct), GFP_KERNEL);
+	if (!ct)
+		return NULL;
+
+	mutex_init(&ct->lock);
+	ct->data = NULL;
+	ct->size = 0;
+	ct->copied = 0;
+	ct->receiving = false;
+
+	devres_add(dev, ct);
+	return ct;
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	char *fw_path;
@@ -282,6 +367,11 @@ static void sahara_send_reset(struct sahara_context *context)
 	context->is_mem_dump_mode = false;
 	context->read_data_offset = 0;
 	context->read_data_length = 0;
+	context->is_cmd_mode = false;
+	context->receiving_training_data = false;
+	context->training_size = 0;
+	context->training_rcvd = 0;
+	context->training_nbuf = 0;
 
 	context->tx[0]->cmd = cpu_to_le32(SAHARA_RESET_CMD);
 	context->tx[0]->length = cpu_to_le32(SAHARA_RESET_LENGTH);
@@ -317,7 +407,8 @@ static void sahara_hello(struct sahara_context *context)
 
 	if (le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_PENDING &&
 	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_COMPLETE &&
-	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_MEMORY_DEBUG) {
+	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_MEMORY_DEBUG &&
+	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_COMMAND) {
 		dev_err(&context->mhi_dev->dev, "Unsupported hello packet - mode %d\n",
 			le32_to_cpu(context->rx->hello.mode));
 		return;
@@ -336,6 +427,153 @@ static void sahara_hello(struct sahara_context *context)
 		dev_err(&context->mhi_dev->dev, "Unable to send hello response %d\n", ret);
 }
 
+static void sahara_switch_mode_to_img_tx(struct sahara_context *context)
+{
+	int ret;
+
+	context->tx[0]->cmd = cpu_to_le32(SAHARA_SWITCH_MODE_CMD);
+	context->tx[0]->length = cpu_to_le32(SAHARA_SWITCH_MODE_LENGTH);
+	context->tx[0]->mode_switch.mode = cpu_to_le32(SAHARA_MODE_IMAGE_TX_PENDING);
+
+	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
+			    SAHARA_SWITCH_MODE_LENGTH, MHI_EOT);
+
+	if (ret)
+		dev_err(&context->mhi_dev->dev, "Unable to send mode switch %d\n", ret);
+}
+
+static void sahara_command_execute(struct sahara_context *context, u32 client_command)
+{
+	int ret;
+
+	context->tx[0]->cmd = cpu_to_le32(SAHARA_EXECUTE_CMD);
+	context->tx[0]->length = cpu_to_le32(SAHARA_COMMAND_EXECUTE_LENGTH);
+	context->tx[0]->command_execute.client_command = cpu_to_le32(client_command);
+
+	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
+			    SAHARA_COMMAND_EXECUTE_LENGTH, MHI_EOT);
+	if (ret)
+		dev_err(&context->mhi_dev->dev, "Unable to send command execute %d\n", ret);
+}
+
+static void sahara_command_execute_data(struct sahara_context *context, u32 client_command)
+{
+	int ret;
+
+	context->tx[0]->cmd = cpu_to_le32(SAHARA_EXECUTE_DATA_CMD);
+	context->tx[0]->length = cpu_to_le32(SAHARA_COMMAND_EXEC_DATA_LENGTH);
+	context->tx[0]->command_exec_data.client_command = cpu_to_le32(client_command);
+
+	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
+			    SAHARA_COMMAND_EXEC_DATA_LENGTH, MHI_EOT);
+	if (ret)
+		dev_err(&context->mhi_dev->dev, "Unable to send execute data %d\n", ret);
+}
+
+static void sahara_command_ready(struct sahara_context *context)
+{
+	if (le32_to_cpu(context->rx->length) != SAHARA_COMMAND_READY_LENGTH) {
+		dev_err(&context->mhi_dev->dev,
+			"Malformed command ready packet - length %u\n",
+			le32_to_cpu(context->rx->length));
+		return;
+	}
+
+	context->is_cmd_mode = true;
+	context->receiving_training_data = false;
+
+	sahara_command_execute(context, SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST);
+}
+
+static void sahara_command_execute_resp(struct sahara_context *context)
+{
+	struct device *dev = &context->mhi_dev->mhi_cntrl->mhi_dev->dev;
+	struct sahara_cntrl_training_data *ct;
+	u32 client_cmd, resp_len;
+	int ret;
+	u64 remaining;
+	u32 i;
+
+	if (le32_to_cpu(context->rx->length) != SAHARA_COMMAND_EXEC_RESP_LENGTH ||
+	    le32_to_cpu(context->rx->command_execute_resp.response_length) < 0) {
+		dev_err(&context->mhi_dev->dev,
+			"Malformed command execute resp packet - length %d\n",
+			le32_to_cpu(context->rx->length));
+		return;
+	}
+
+	client_cmd = le32_to_cpu(context->rx->command_execute_resp.client_command);
+	resp_len = le32_to_cpu(context->rx->command_execute_resp.response_length);
+
+	sahara_command_execute_data(context, client_cmd);
+
+	if (client_cmd == SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST) {
+		sahara_command_execute(context, SAHARA_EXEC_CMD_GET_TRAINING_DATA);
+		return;
+	}
+
+	if (client_cmd != SAHARA_EXEC_CMD_GET_TRAINING_DATA)
+		return;
+
+	ct = sahara_cntrl_training_get(dev);
+	if (!ct) {
+		context->is_cmd_mode = false;
+		sahara_switch_mode_to_img_tx(context);
+		return;
+	}
+
+	mutex_lock(&ct->lock);
+	kfree(ct->data);
+	ct->data = kzalloc(resp_len, GFP_KERNEL);
+	ct->size = resp_len;
+	ct->copied = 0;
+	ct->receiving = true;
+	mutex_unlock(&ct->lock);
+
+	if (!ct->data) {
+		context->is_cmd_mode = false;
+		sahara_switch_mode_to_img_tx(context);
+		return;
+	}
+
+	context->training_size = resp_len;
+	context->training_rcvd = 0;
+	context->receiving_training_data = true;
+
+	remaining = resp_len;
+	for (i = 0; i < SAHARA_NUM_CMD_BUF && remaining; i++) {
+		size_t pkt = min_t(size_t, remaining, SAHARA_PACKET_MAX_SIZE);
+
+		ret = mhi_queue_buf(context->mhi_dev, DMA_FROM_DEVICE,
+				    context->cmd_buff[i], pkt,
+				    (remaining <= pkt) ? MHI_EOT : MHI_CHAIN);
+		if (ret)
+			break;
+
+		remaining -= pkt;
+	}
+
+	context->training_nbuf = i;
+}
+
+static void sahara_command_processing(struct work_struct *work)
+{
+	struct sahara_context *context = container_of(work, struct sahara_context, cmd_work);
+	int ret;
+
+	if (le32_to_cpu(context->rx->cmd) == SAHARA_EXECUTE_RESP_CMD)
+		sahara_command_execute_resp(context);
+
+	if (!context->receiving_training_data) {
+		ret = mhi_queue_buf(context->mhi_dev, DMA_FROM_DEVICE,
+				    context->rx, SAHARA_PACKET_MAX_SIZE, MHI_EOT);
+
+		if (ret)
+			dev_err(&context->mhi_dev->dev,
+				"Unable to requeue rx buf %d\n", ret);
+	}
+}
+
 static int read_data_helper(struct sahara_context *context, int buf_index)
 {
 	enum mhi_flags mhi_flag;
@@ -562,6 +800,9 @@ static void sahara_processing(struct work_struct *work)
 	case SAHARA_MEM_DEBUG64_CMD:
 		sahara_memory_debug64(context);
 		break;
+	case SAHARA_CMD_READY_CMD:
+		sahara_command_ready(context);
+		break;
 	default:
 		dev_err(&context->mhi_dev->dev, "Unknown command %d\n",
 			le32_to_cpu(context->rx->cmd));
@@ -862,6 +1103,20 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 	INIT_WORK(&context->fw_work, sahara_processing);
 	INIT_WORK(&context->dump_work, sahara_dump_processing);
 	INIT_WORK(&context->read_data_work, sahara_read_data_processing);
+	INIT_WORK(&context->cmd_work, sahara_command_processing);
+
+	for (i = 0; i < SAHARA_NUM_CMD_BUF; i++) {
+		context->cmd_buff[i] = devm_kzalloc(&mhi_dev->dev,
+						    SAHARA_PACKET_MAX_SIZE, GFP_KERNEL);
+		if (!context->cmd_buff[i])
+			return -ENOMEM;
+	}
+
+	context->is_cmd_mode = false;
+	context->receiving_training_data = false;
+	context->training_size = 0;
+	context->training_rcvd = 0;
+	context->training_nbuf = 0;
 
 	context->active_image_id = SAHARA_IMAGE_ID_NONE;
 	dev_set_drvdata(&mhi_dev->dev, context);
@@ -885,6 +1140,7 @@ static void sahara_mhi_remove(struct mhi_device *mhi_dev)
 
 	cancel_work_sync(&context->fw_work);
 	cancel_work_sync(&context->dump_work);
+	cancel_work_sync(&context->cmd_work);
 	vfree(context->mem_dump);
 	sahara_release_image(context);
 	mhi_unprepare_from_transfer(mhi_dev);
@@ -901,15 +1157,71 @@ static void sahara_mhi_ul_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
 {
 	struct sahara_context *context = dev_get_drvdata(&mhi_dev->dev);
+	struct sahara_cntrl_training_data *ct;
+	struct device *dev;
+	size_t copy;
+	int ret;
+	u32 i;
+
+	if (mhi_result->transaction_status)
+		return;
+
+	/*
+	 * Raw training payload completions arrive for cmd_buff[] buffers.
+	 * Do not schedule cmd_work for those.
+	 */
+	if (context->is_cmd_mode && context->receiving_training_data &&
+	    mhi_result->buf_addr != context->rx) {
+		dev = &context->mhi_dev->mhi_cntrl->mhi_dev->dev;
+		ct = sahara_cntrl_training_get(dev);
+		if (!ct)
+			return;
 
-	if (!mhi_result->transaction_status) {
-		context->rx_size = mhi_result->bytes_xferd;
-		if (context->is_mem_dump_mode)
-			schedule_work(&context->dump_work);
-		else
-			schedule_work(&context->fw_work);
+		for (i = 0; i < context->training_nbuf; i++) {
+			if (mhi_result->buf_addr == context->cmd_buff[i]) {
+				mutex_lock(&ct->lock);
+				copy = min_t(size_t, mhi_result->bytes_xferd,
+					     ct->size - ct->copied);
+				memcpy((u8 *)ct->data + ct->copied,
+				       mhi_result->buf_addr, copy);
+				ct->copied += copy;
+				mutex_unlock(&ct->lock);
+
+				context->training_rcvd += copy;
+
+				if (context->training_rcvd >= context->training_size) {
+					mutex_lock(&ct->lock);
+					ct->receiving = false;
+					mutex_unlock(&ct->lock);
+
+					context->receiving_training_data = false;
+					context->is_cmd_mode = false;
+
+					sahara_switch_mode_to_img_tx(context);
+					ret = mhi_queue_buf(context->mhi_dev,
+							    DMA_FROM_DEVICE,
+							    context->rx,
+							    SAHARA_PACKET_MAX_SIZE,
+							    MHI_EOT);
+					if (ret)
+						dev_err(&context->mhi_dev->dev,
+							"Unable to requeue rx buf %d\n", ret);
+				}
+				return;
+			}
+		}
+		return;
 	}
 
+	/* Normal Rx completion */
+	context->rx_size = mhi_result->bytes_xferd;
+	if (context->is_mem_dump_mode)
+		schedule_work(&context->dump_work);
+	else if (context->is_cmd_mode)
+		schedule_work(&context->cmd_work);
+	else
+		schedule_work(&context->fw_work);
+
 }
 
 static const struct mhi_device_id sahara_mhi_match_table[] = {

-- 
2.34.1


