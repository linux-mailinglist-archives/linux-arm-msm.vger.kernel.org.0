Return-Path: <linux-arm-msm+bounces-76279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD17BBC2E2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 00:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 873E93C46B9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 22:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7722494D8;
	Tue,  7 Oct 2025 22:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jxHrejSk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019BD23D281
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 22:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759876851; cv=none; b=gZDbBe+rUWF/7++wA7gjg2Kb/kPwqoRkinNlu4wu2pMDkD5iRdMZ4BWPk7rcQ8f/mY2e4vg+cGuqnQAMqr5bE7NJ6zNM2X5CiA6eZtf50NZmkOn2KlL2tb5ntIN/qoFvNIQdyT8KnbfprbvTVkDjZc+GebGGwrScF2ay3C6yK68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759876851; c=relaxed/simple;
	bh=e54Ll9Xmnn6VlR69f/UoKhXv7PPrOIGg4aRjpDuUcqY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O9XWVevGMaRTpGQA9+qwUts8gPmq+OKOoygTd0vuI4N+VI/V2GhEmMqUgn2liFuHWXGv3VItquxrmJ0mi1ZMLJRJo9pE/RE2NwJqXBQXXTk0/U06HkE/aDH1zLMRVXPJ0Dhr2envk62ROwGOwnq+dR6yCiqRWxl0rJv1yWOB7FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jxHrejSk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETBkF006787
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 22:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Qiin1m1CBtvO4kGGOogJESAVeg19/rEQWvk
	8bPwrc0o=; b=jxHrejSkN7j8o9wrGovAq9/p6W7SrqtvgfrV5DwBYyjTNdD0FnJ
	0uV4a38wLi1Ytwbbl8fQrr0kl4m4ZaBHuUwvF47oYWIfLjINPynD3T/3+Xa1T/Uj
	mlbpz58H7BcK4IJCeiLVNKg48bPF2q4Z7weVCgqKRaJGnO0gsAOfRWI5+OnVdU//
	UuWMkabz7QSBI7hJudGixR7ohf2b6vRW014kat0G/31aoPvrZvZPA5J+oohqq5g/
	rig2Gmz4ZI/O1EwloZc3dUyjUonjqZCVE6NyrkEq0KpxQP3G61HWxITrx+kHupPx
	3K2hFIouqcdGc4kkLcsQUPsSKq7dalwoO8g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1rpp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 22:40:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e574e01ed8so161882491cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 15:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759876848; x=1760481648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qiin1m1CBtvO4kGGOogJESAVeg19/rEQWvk8bPwrc0o=;
        b=hehwjboYzs39rUoO33d+KOc31Dtwuxu1hfPjPgAcAUkOk+DeSx3Yiyoc3hkM7B4Lk4
         BufXZ8orEC0jjJTWIEftqUpxctp9/iF2uK9IsvWKgn/my/Il2r7iJEiU2zpDFgLrirAw
         VLl7jPa6qpsectcIrGKDfeYFwYQBtTsVpeZdnE6h5eCx7zj8RCBuuiSYHyc/rjkTTKiG
         xEyuLBdIvpvK1kRnK/kTPPyxlbdqCZ+iFHh+pOYpdwdjsYR08Eco8mWwvjUCBQcZnCSs
         bu9GWHo9fhV7yTCrsGo3fDKtBElT5N002nrZtn5BEJQ1Jd+ZRtzeUeduXFEV2INVU9A9
         kpeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRH6y6RRv95whn8Ekd3h9eegWdVjH2xzEq3mVzYjuiOg92GVBEobkfkBWRfw7BVOM2SygQnq6pjOXJ5IpL@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ24UCWAWHM+Nn0ckMXUYfLIsdTd0Xt5TeH63Pi6CPc0ETFX23
	ow9WhFYnsxPGNZEVNrtBHzcEQ96q9Ux6x8lA5Nui5AF+gqn9cD9mLSlbOBmXn2elOfnUOdtzLEe
	wKlp88LmMIS03ghcUMTGTX/DeAQbyPkbvhCjeuDKISVqB/i8kID9R3A4C4HyAgtjwkmfQ
X-Gm-Gg: ASbGncskGNopZu007v3rQXbTNrEIqPAxZJR5MMx4bnOV3Xr8lssbFcnW+oebq6tTwaY
	rOAIgbkthbsrTDr7doN9sgqYmWoLrOThq6LMIfLN9v6jom7BUKmUC1GmMsrsKMY/izq0maqn4zt
	9qGw/CZtGGru3PaYMPT+drnyx7FzCs+c7m4KdXE4X/ONrRxZ88+b3XX1G1mCc4dOcSlsgBOHkiD
	DDc9aADh0KrSD6ek1lrE8kztHaQuvWkIyy3+8/WTWtkLT0zI8sg1gInGeUYDxCZLXdYNBTV0OnL
	pD23z1FiAl8tGF33J2OchqPuHdfag486zTXVPrQ0MacK/HiPGNuS2+HS+c/5E+4+McTEDy+Mm4G
	Ij2PPqKJQBw==
X-Received: by 2002:a05:622a:1e87:b0:4dd:3948:3377 with SMTP id d75a77b69052e-4e6ead56717mr20439921cf.58.1759876847546;
        Tue, 07 Oct 2025 15:40:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOhohxfGe5xAFLkK7T1NuD3nacpTnmj8b3yN/Xu9aX1OaKXncZkHHyhCiZ7qjSFCKs8m7elQ==
X-Received: by 2002:a05:622a:1e87:b0:4dd:3948:3377 with SMTP id d75a77b69052e-4e6ead56717mr20439561cf.58.1759876847057;
        Tue, 07 Oct 2025 15:40:47 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4e613sm1482195766b.81.2025.10.07.15.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 15:40:46 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Carl Vanderlip <quic_carlv@quicinc.com>
Subject: [PATCH] accel/qaic: Support the new READ_DATA implementation
Date: Wed,  8 Oct 2025 00:40:45 +0200
Message-ID: <20251007224045.605374-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: d5AY5o_kLHx5D0NbsoqjIzr7E469CGg2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX+/D8BSr46YpF
 ztuA4mDA+vA0WfdenLPnLXExgYdkKOynO2xYlHpJROiPYapFvrCBkz+zS90l0zz/GEHsn82nIzg
 YdFqX34q6FvcXobDTap7MsS89H78mzayKwcrY6jWOuH/InS3jB5QKDB9GLWZf44cjTwQFQxDRyQ
 9ZYS6QMEk3QT2rzJHV8Zbv0otsKnL56bppHwxUxT3fR6VlWIK6h8n1FIxarxy0pKlWNMlXDAdMM
 +oZA9WyEYJ7XcogWL7T0bWcGAHkH0ZxVjr5ZxOWhGJcVrw+uA1Ua+og/Nj5QEt7izEDDJViQdT3
 nw3tSWaFoLj+9FhGzT9rUGXHx5WzFeFXnnSeisWncaPHEYm7eL2iPs0gCwe765s1iRXYkJJACN0
 86p47cRVHDTdoN4jXbYQtIBjDEjQjA==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e596f1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=tTas10tDUONazNPxbeAA:9
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: d5AY5o_kLHx5D0NbsoqjIzr7E469CGg2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

AIC200 uses the newer "XBL" firmware implementation which changes the
expectations of how READ_DATA is performed. Larger data requests are
supported via streaming the data over the transport instead of requiring
a single transport transfer for everything.

Co-developed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/sahara.c | 138 +++++++++++++++++++++++++++---------
 1 file changed, 104 insertions(+), 34 deletions(-)

diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index 3ebcc1f7ff58..b126cca937a9 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -159,6 +159,7 @@ struct sahara_context {
 	struct sahara_packet		*rx;
 	struct work_struct		fw_work;
 	struct work_struct		dump_work;
+	struct work_struct		read_data_work;
 	struct mhi_device		*mhi_dev;
 	const char * const		*image_table;
 	u32				table_size;
@@ -174,7 +175,10 @@ struct sahara_context {
 	u64				dump_image_offset;
 	void				*mem_dump_freespace;
 	u64				dump_images_left;
+	u32				read_data_offset;
+	u32				read_data_length;
 	bool				is_mem_dump_mode;
+	bool				non_streaming;
 };
 
 static const char * const aic100_image_table[] = {
@@ -216,6 +220,11 @@ static const char * const aic200_image_table[] = {
 	[75] = "qcom/aic200/pvs.bin",
 };
 
+static bool is_streaming(struct sahara_context *context)
+{
+	return !context->non_streaming;
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	int ret;
@@ -265,6 +274,8 @@ static void sahara_send_reset(struct sahara_context *context)
 	int ret;
 
 	context->is_mem_dump_mode = false;
+	context->read_data_offset = 0;
+	context->read_data_length = 0;
 
 	context->tx[0]->cmd = cpu_to_le32(SAHARA_RESET_CMD);
 	context->tx[0]->length = cpu_to_le32(SAHARA_RESET_LENGTH);
@@ -319,9 +330,39 @@ static void sahara_hello(struct sahara_context *context)
 		dev_err(&context->mhi_dev->dev, "Unable to send hello response %d\n", ret);
 }
 
+static int read_data_helper(struct sahara_context *context, int buf_index)
+{
+	enum mhi_flags mhi_flag;
+	u32 pkt_data_len;
+	int ret;
+
+	pkt_data_len = min(context->read_data_length, SAHARA_PACKET_MAX_SIZE);
+
+	memcpy(context->tx[buf_index],
+	       &context->firmware->data[context->read_data_offset],
+	       pkt_data_len);
+
+	context->read_data_offset += pkt_data_len;
+	context->read_data_length -= pkt_data_len;
+
+	if (is_streaming(context) || !context->read_data_length)
+		mhi_flag = MHI_EOT;
+	else
+		mhi_flag = MHI_CHAIN;
+
+	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE,
+			    context->tx[buf_index], pkt_data_len, mhi_flag);
+	if (ret) {
+		dev_err(&context->mhi_dev->dev, "Unable to send read_data response %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static void sahara_read_data(struct sahara_context *context)
 {
-	u32 image_id, data_offset, data_len, pkt_data_len;
+	u32 image_id, data_offset, data_len;
 	int ret;
 	int i;
 
@@ -357,7 +398,7 @@ static void sahara_read_data(struct sahara_context *context)
 	 * and is not needed here on error.
 	 */
 
-	if (data_len > SAHARA_TRANSFER_MAX_SIZE) {
+	if (context->non_streaming && data_len > SAHARA_TRANSFER_MAX_SIZE) {
 		dev_err(&context->mhi_dev->dev, "Malformed read_data packet - data len %d exceeds max xfer size %d\n",
 			data_len, SAHARA_TRANSFER_MAX_SIZE);
 		sahara_send_reset(context);
@@ -378,22 +419,18 @@ static void sahara_read_data(struct sahara_context *context)
 		return;
 	}
 
-	for (i = 0; i < SAHARA_NUM_TX_BUF && data_len; ++i) {
-		pkt_data_len = min(data_len, SAHARA_PACKET_MAX_SIZE);
+	context->read_data_offset = data_offset;
+	context->read_data_length = data_len;
 
-		memcpy(context->tx[i], &context->firmware->data[data_offset], pkt_data_len);
-
-		data_offset += pkt_data_len;
-		data_len -= pkt_data_len;
+	if (is_streaming(context)) {
+		schedule_work(&context->read_data_work);
+		return;
+	}
 
-		ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE,
-				    context->tx[i], pkt_data_len,
-				    !data_len ? MHI_EOT : MHI_CHAIN);
-		if (ret) {
-			dev_err(&context->mhi_dev->dev, "Unable to send read_data response %d\n",
-				ret);
-			return;
-		}
+	for (i = 0; i < SAHARA_NUM_TX_BUF && context->read_data_length; ++i) {
+		ret = read_data_helper(context, i);
+		if (ret)
+			break;
 	}
 }
 
@@ -742,6 +779,13 @@ static void sahara_dump_processing(struct work_struct *work)
 	sahara_send_reset(context);
 }
 
+static void sahara_read_data_processing(struct work_struct *work)
+{
+	struct sahara_context *context = container_of(work, struct sahara_context, read_data_work);
+
+	read_data_helper(context, 0);
+}
+
 static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
 {
 	struct sahara_context *context;
@@ -756,34 +800,56 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 	if (!context->rx)
 		return -ENOMEM;
 
+	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
+		context->image_table = aic200_image_table;
+		context->table_size = ARRAY_SIZE(aic200_image_table);
+	} else {
+		context->image_table = aic100_image_table;
+		context->table_size = ARRAY_SIZE(aic100_image_table);
+		context->non_streaming = true;
+	}
+
 	/*
-	 * AIC100 defines SAHARA_TRANSFER_MAX_SIZE as the largest value it
-	 * will request for READ_DATA. This is larger than
-	 * SAHARA_PACKET_MAX_SIZE, and we need 9x SAHARA_PACKET_MAX_SIZE to
-	 * cover SAHARA_TRANSFER_MAX_SIZE. When the remote side issues a
-	 * READ_DATA, it requires a transfer of the exact size requested. We
-	 * can use MHI_CHAIN to link multiple buffers into a single transfer
-	 * but the remote side will not consume the buffers until it sees an
-	 * EOT, thus we need to allocate enough buffers to put in the tx fifo
-	 * to cover an entire READ_DATA request of the max size.
+	 * There are two firmware implementations for READ_DATA handling.
+	 * The older "SBL" implementation defines a Sahara transfer size, and
+	 * expects that the response is a single transport transfer. If the
+	 * FW wants to transfer a file that is larger than the transfer size,
+	 * the FW will issue multiple READ_DATA commands. For this
+	 * implementation, we need to allocate enough buffers to contain the
+	 * entire Sahara transfer size.
+	 *
+	 * The newer "XBL" implementation does not define a maximum transfer
+	 * size and instead expects the data to be streamed over using the
+	 * transport level MTU. The FW will issue a single READ_DATA command
+	 * of whatever size, and consume multiple transport level transfers
+	 * until the expected amount of data is consumed. For this
+	 * implementation we only need a single buffer of the transport MTU
+	 * but we'll need to be able to use it multiple times for a single
+	 * READ_DATA request.
+	 *
+	 * AIC100 is the SBL implementation and defines SAHARA_TRANSFER_MAX_SIZE
+	 * and we need 9x SAHARA_PACKET_MAX_SIZE to cover that. We can use
+	 * MHI_CHAIN to link multiple buffers into a single transfer but the
+	 * remote side will not consume the buffers until it sees an EOT, thus
+	 * we need to allocate enough buffers to put in the tx fifo to cover an
+	 * entire READ_DATA request of the max size.
+	 *
+	 * AIC200 is the XBL implementation, and so a single buffer will work.
 	 */
 	for (i = 0; i < SAHARA_NUM_TX_BUF; ++i) {
-		context->tx[i] = devm_kzalloc(&mhi_dev->dev, SAHARA_PACKET_MAX_SIZE, GFP_KERNEL);
+		context->tx[i] = devm_kzalloc(&mhi_dev->dev,
+					      SAHARA_PACKET_MAX_SIZE,
+					      GFP_KERNEL);
 		if (!context->tx[i])
 			return -ENOMEM;
+		if (is_streaming(context))
+			break;
 	}
 
 	context->mhi_dev = mhi_dev;
 	INIT_WORK(&context->fw_work, sahara_processing);
 	INIT_WORK(&context->dump_work, sahara_dump_processing);
-
-	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
-		context->image_table = aic200_image_table;
-		context->table_size = ARRAY_SIZE(aic200_image_table);
-	} else {
-		context->image_table = aic100_image_table;
-		context->table_size = ARRAY_SIZE(aic100_image_table);
-	}
+	INIT_WORK(&context->read_data_work, sahara_read_data_processing);
 
 	context->active_image_id = SAHARA_IMAGE_ID_NONE;
 	dev_set_drvdata(&mhi_dev->dev, context);
@@ -814,6 +880,10 @@ static void sahara_mhi_remove(struct mhi_device *mhi_dev)
 
 static void sahara_mhi_ul_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
 {
+	struct sahara_context *context = dev_get_drvdata(&mhi_dev->dev);
+
+	if (!mhi_result->transaction_status && context->read_data_length && is_streaming(context))
+		schedule_work(&context->read_data_work);
 }
 
 static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
-- 
2.43.0


