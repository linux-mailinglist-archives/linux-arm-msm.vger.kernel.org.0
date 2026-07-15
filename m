Return-Path: <linux-arm-msm+bounces-119206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qj+gI41fV2qIKgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:23:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE40F75CEF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:23:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lZEk2b+L;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Hj2qQOxV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119206-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119206-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8751A302AE15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0581F43C04C;
	Wed, 15 Jul 2026 10:18:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD1143B3CB
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:18:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110698; cv=none; b=AwhixF07t/XkYXcTKOTlUFM2j7KcDGOori9C30d9Fhp/0+rKbac0/nF8TpCcVPt/eeE4wQBPWqNqPtxLiKnUJCB8hKcZNkpDn4TrpOusis2/ynDN4XJ9xxCCGlpstcxm3klncSckPlolvFizRzMcdJNQjSTlxgu01nEawh8gmdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110698; c=relaxed/simple;
	bh=iMJjmuvPvoYpRAixN62qPcDLK79DdaTSn21a3CqpsiM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Kvc24JK4igh0xfEcGSL/3rNGMSGgwIOdFWASYn56VVDS3f2R1yxfXoN/1sFe/DTd+Z/fgs3lWyc/rfgsT9xn075uwJIvTAiMFk0gm3XMX658mbihAzI0oah5nr/1428IEnAOEk7ucXKhN9fCyoz5zgE+cvhlUdecdGhq5jp1t+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lZEk2b+L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hj2qQOxV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F7mXje3143159
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=R6N0CWGkPVZZZBaPfB3WmWHTmuDOaLDUgxD
	EGdffRFw=; b=lZEk2b+LNVUSg/1a8Nuf9mafJTg9ai8UIjsVqnY9L1PfDiuawkn
	RwM2Dh15emzuB8cGKqrqWvS1KInsUGKThkLn+oZDEm/PsdYIbOpGUbsuSbO5dx40
	04cUmCbgxlhnwnkrPU41FghT70XzMfeJVTe0jRwVVghRHHPN4Mgs8IIKRZ+9KRnN
	CZXKI2UB9FNAcWdykzAoK2vaS8KMfJx+3Rx9JyQQu+GliLYldzCuaAsVGIYDXiYj
	Z5o58RgRLcuAppHbUNiNK/PtckDtaBhAGo5JID9WCc1iFZbS9uodAlvuc+j/0FYy
	52bLZJlH0y8/AdFyntaUOcKI3DUeP0YxU3g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe6528j71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:18:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cce14a21faso37890695ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 03:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784110696; x=1784715496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R6N0CWGkPVZZZBaPfB3WmWHTmuDOaLDUgxDEGdffRFw=;
        b=Hj2qQOxVymQGFQvoGNBvsZo2+m2llFevBJ50lOSgndn8ZGfvO2vuBKfMEWzV8PZPJY
         wNxDtS5IYwKpg+h2u5LoGqu+4EcmJjLP6CkttynbhcW07BlEG/pqR3Jpq6GH4DsQlSFv
         QZo0upQKa6mWTF6mhetaTIumYK+1RrGmYKzaorapE6er5G3OQ/ZvrtBQEXTEasH2ifEV
         3Pn4+639A3sF4JH46Fag7Gx2+3550ymjsUwb2o9GptDnoAlWCRNN+qB/tckXSbJK7jPb
         dwM8DnaN43bXge83JUQpL0c40oa9uTgOFviZ9qWRftF689kZcWCFjqlQnmmRm05UzTXm
         woTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784110696; x=1784715496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R6N0CWGkPVZZZBaPfB3WmWHTmuDOaLDUgxDEGdffRFw=;
        b=QqmXNVPiqVlDj/HSPyakIFmAgN8dfiteh8ga3REWIi+1J3S2QPjc5zWiKg3xlLFrdN
         5ykrtkbBuHOSy0rp0KKV2LIZDEG/BiNRaj5/U6LwE/EaRkhgppgZ2vvbRuyDReyhDcTS
         3NlD+df9PKs+oDe3gb4YN+y4++Sr8PVNyx6ss/BSq2gqRPOxXEFQChDZjlIda+Q6U8zq
         dO2+FMqdA5LJwnwaAVdSPDrQcTmRc0oT8CbkAhyPaRi70+tZEzRNmC2/xFRhU/Xi2WaB
         w8cCjLGsetsVtzpmnUyvN+OQaT/GIl20+kZkUbdxtgHg82c0+mJDA7BOHGsiVNn7k1BU
         Zihg==
X-Forwarded-Encrypted: i=1; AHgh+RpBWi+RvSgoVsbKsTDRmRG912DhWpHlYeXxc7J4twYAPOAd2Fqig3MVT0eQ8p/PQpNPJu5YLfJ7aW8wB5Ig@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn4qojvBMxlj0JI4Ox0tyt/4Se6RV4IQgo5ymZnUhGOUcIZB8Z
	Ei9MkRY8+I8r9AyO+Kcbl2FzpkefC8ZN5YZRvSEAldh1B7mUutGTlI4Pk5fTRHGqliUe4qNXtEe
	vLa5TeqLCCDMfVsEQW8850w1IlTEI47/uzVDMlj4EnS+OhuJKW9kFHVJQ2Zbr1durDAhm
X-Gm-Gg: AfdE7cmiK2vnMdktupT5HhdJmUrwh6tzg0tmjv3qdeemBw0RZiA8MuGHnLSdXLNJ4N1
	N6goedj5VmM2jbaOB6H2a7xUvoNMPzpVWCh1OFFUvU1mGjuLDcCEPebMNZRvm4951M8oLIFQ8GS
	hE/sBNr+qsXaVqxOwMMfp6N8axC+Z3phXuyVwWB9NawlRGmCCKPSR1giBgzkqaH9sUKSPEY8l8a
	Tun8EXSIjPObzKcSIlodhv1MtteTYIKa9Ieco9PcowN5TR/BOezysMIdmSujLhx4fb9dzcaRY0h
	AvZB2pvauKR+T0CIH7WZEuFzeZRM6W4OcRQ34Y/mTgH3LOoNKuKVxlkZOr1ieEWNcu1eOEhfORs
	UZApU/aKSfuOjqgbDl9boqq35mLFAL9h/qlSb/mqjxVNOAQ==
X-Received: by 2002:a17:902:d510:b0:2c9:e846:a589 with SMTP id d9443c01a7336-2cea17f9ccamr157653505ad.13.1784110695737;
        Wed, 15 Jul 2026 03:18:15 -0700 (PDT)
X-Received: by 2002:a17:902:d510:b0:2c9:e846:a589 with SMTP id d9443c01a7336-2cea17f9ccamr157653245ad.13.1784110695206;
        Wed, 15 Jul 2026 03:18:15 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d59e33sm129267985ad.74.2026.07.15.03.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 03:18:14 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
To: mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        andi.shyti@kernel.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com, aniket.randive@oss.qualcomm.com
Subject: [PATCH V5] i2c: qcom-geni: Add dynamic transfer timeout based on transfer length and frequency
Date: Wed, 15 Jul 2026 15:48:05 +0530
Message-Id: <20260715101805.3615166-1-aniket.randive@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEwMCBTYWx0ZWRfX3vIBuEDs4IM6
 H4QK0oHQbnIVFSa7TSUseBdz+Wpl3RLGVr/3jp0rf3qIG71P2C6PWqov3Q21Qg1ynYium0zUT7M
 ehwqH8Lkp8HC+mz88tvv/rCSWbwRAgiOxf1XE7b42OnsvnqNbZJHDgDDnxbmLcu6mAKVN+luh9a
 d6Xko5+vKQ2Yw3j4ddxFHXZ7PmKD3GmQffIA9bn2fZdektFtRS3bPdEtnm2GsZ00Tf/0tIGPqvf
 +dNF2m3AA8tI3gc6aK2iYbTePDlknv/VzmJJixKmXZi3sz493luPrKP9obMVFtIoua7Ks2MbsiM
 FtRGWeLJr5uoOVfx3KEj7mQlbzvbsyrnjEOukif5HFiIQrRPl8SlNQfUS+w72x73xIzNVHXVjLK
 CjT+i6Jg6OktutRfmqWwaOgh1iAvJ4QAL5R0j7aiQ3ShwLSlXFYcQlaIwi5yW8s/yoXgFg24jJn
 P6uRE4AZWZn+mC9QxTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEwMCBTYWx0ZWRfX8Gk8xMDiwyt8
 pujKb59qIB7Bs7wCTiUS5RvqWhGvcUzuYHSA+P107ZoOjiUSvo1q95TXYYnkV+elUsVzyZbXhIE
 uyrVauxEB3tUEKjW6qoBq9SuxBcdf+Q=
X-Authority-Analysis: v=2.4 cv=bKcm5v+Z c=1 sm=1 tr=0 ts=6a575e68 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=z1CpEO-fZNADMcIYu6MA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: m3YTKVmkGwpj1AIgHhihL-Fqcn1MvWwD
X-Proofpoint-GUID: m3YTKVmkGwpj1AIgHhihL-Fqcn1MvWwD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-119206-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:naresh.maramaina@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE40F75CEF9

The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
regardless of message length or bus frequency, causing unnecessary
delays on error paths.

Compute the timeout dynamically from message length and bus frequency
with a 10x safety margin over the theoretical wire time. Add a 300 ms
floor to account for I2C clock stretching and other situations where a
slave may keep SCL asserted for an extended period, including faulty
devices holding the bus.

This replaces the fixed 1-second timeout with a transfer-specific
timeout while preserving sufficient margin for software overheads and
bus-level delays.

For GPI multi-descriptor transfers, use the maximum message length
across all queued messages as the per-completion timeout.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---

Changes in V5:
- Updated the commit message as per the review comments.

Changes in V4:
- As per konrad suggestion used mult_frac() for bit_usec to avoid
 intermediate overflow on 32-bit targets.
- Updated the commit message and added a driver comment explaining the
 rationale for the 0.3-second minimum timeout floor value.

 drivers/i2c/busses/i2c-qcom-geni.c | 47 +++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 96dbf04138be..f011d2564cd2 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -74,9 +74,14 @@ enum geni_i2c_err_code {
 #define PACKING_BYTES_PW	4
 
 #define ABORT_TIMEOUT		HZ
-#define XFER_TIMEOUT		HZ
 #define RST_TIMEOUT		HZ
 
+/* 9 bits per byte (8 data + 1 ACK), 10x safety margin */
+#define I2C_TIMEOUT_SAFETY_COEFFICIENT	10
+
+/* 300ms floor: budget for clock stretching; slave may hold SCL low indefinitely */
+#define I2C_TIMEOUT_MIN_USEC		300000
+
 struct geni_i2c_desc {
 	bool no_dma_support;
 	unsigned int tx_fifo_depth;
@@ -204,6 +209,16 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 	return -EINVAL;
 }
 
+static unsigned long geni_i2c_xfer_timeout(struct geni_i2c_dev *gi2c, size_t len)
+{
+	size_t bit_cnt = len * 9;
+	size_t bit_usec = mult_frac(bit_cnt, USEC_PER_SEC, gi2c->clk_freq_out);
+	size_t xfer_max_usec = (bit_usec * I2C_TIMEOUT_SAFETY_COEFFICIENT) +
+			       I2C_TIMEOUT_MIN_USEC;
+
+	return usecs_to_jiffies(xfer_max_usec);
+}
+
 static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 {
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
@@ -445,7 +460,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
 	dma_addr_t rx_dma = 0;
-	unsigned long time_left;
+	unsigned long time_left, timeout;
 	void *dma_buf;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
@@ -470,8 +485,9 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		gi2c->dma_buf = dma_buf;
 	}
 
+	timeout = geni_i2c_xfer_timeout(gi2c, len);
 	cur = gi2c->cur;
-	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+	time_left = wait_for_completion_timeout(&gi2c->done, timeout);
 	if (!time_left)
 		geni_i2c_abort_xfer(gi2c);
 
@@ -484,7 +500,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
 	dma_addr_t tx_dma = 0;
-	unsigned long time_left;
+	unsigned long time_left, timeout;
 	void *dma_buf;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
@@ -512,8 +528,9 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	if (!dma_buf) /* Get FIFO IRQ */
 		writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
 
+	timeout = geni_i2c_xfer_timeout(gi2c, len);
 	cur = gi2c->cur;
-	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+	time_left = wait_for_completion_timeout(&gi2c->done, timeout);
 	if (!time_left)
 		geni_i2c_abort_xfer(gi2c);
 
@@ -591,7 +608,7 @@ static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_
  * geni_i2c_gpi_multi_xfer_timeout_handler() - Handles multi message transfer timeout
  * @dev: Pointer to the corresponding dev node
  * @multi_xfer: Pointer to the geni_i2c_gpi_multi_desc_xfer
- * @transfer_timeout_msecs: Timeout value in milliseconds
+ * @transfer_timeout_msecs: Per-message completion timeout in jiffies
  * @transfer_comp: Completion object of the transfer
  *
  * This function waits for the completion of each processed transfer messages
@@ -601,7 +618,7 @@ static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_
  */
 static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
 						   struct geni_i2c_gpi_multi_desc_xfer *multi_xfer,
-						   u32 transfer_timeout_msecs,
+						   unsigned long timeout_jiffies,
 						   struct completion *transfer_comp)
 {
 	int i;
@@ -612,7 +629,7 @@ static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
 
 		if (multi_xfer->msg_idx_cnt != multi_xfer->irq_cnt) {
 			time_left = wait_for_completion_timeout(transfer_comp,
-								transfer_timeout_msecs);
+								timeout_jiffies);
 			if (!time_left) {
 				dev_err(dev, "%s: Transfer timeout\n", __func__);
 				return -ETIMEDOUT;
@@ -736,8 +753,16 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
 		dma_async_issue_pending(gi2c->tx_c);
 
 		if ((msg_idx == (gi2c->num_msgs - 1)) || flags & DMA_PREP_INTERRUPT) {
+			unsigned long timeout;
+			size_t max_len = 0;
+			int j;
+
+			for (j = 0; j < gi2c->num_msgs; j++)
+				max_len = max_t(size_t, max_len, msgs[j].len);
+
+			timeout = geni_i2c_xfer_timeout(gi2c, max_len);
 			ret = geni_i2c_gpi_multi_xfer_timeout_handler(gi2c->se.dev, gi2c_gpi_xfer,
-								      XFER_TIMEOUT, &gi2c->done);
+								      timeout, &gi2c->done);
 			if (ret) {
 				dev_err(gi2c->se.dev,
 					"I2C multi write msg transfer timeout: %d\n",
@@ -851,8 +876,10 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 		}
 
 		if (!gi2c->is_tx_multi_desc_xfer) {
+			unsigned long timeout = geni_i2c_xfer_timeout(gi2c, msgs[i].len);
+
 			dma_async_issue_pending(gi2c->tx_c);
-			time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+			time_left = wait_for_completion_timeout(&gi2c->done, timeout);
 			if (!time_left) {
 				dev_err(gi2c->se.dev, "%s:I2C timeout\n", __func__);
 				gi2c->err = -ETIMEDOUT;
-- 
2.34.1


