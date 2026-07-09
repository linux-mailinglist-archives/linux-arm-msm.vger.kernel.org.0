Return-Path: <linux-arm-msm+bounces-117846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AeX8ARA5T2qccQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:00:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9475C72CF43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:00:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=W18p0KLO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dyfV0tcu;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117846-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117846-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CF0C4301DC63
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 06:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD403AA1B5;
	Thu,  9 Jul 2026 06:00:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D7F3AE198
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 06:00:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783576839; cv=none; b=rk0BQ3+mzh4TUf8zFJxOa2CfCgqhF1vhCa3voTaLI6YpHwD4yRhLWXRanDCBVPo7BRad2o+NuDp0iNQD2/KIzBuwDAWSZBoUJDGCwEdAaBy3/2nMIXsONPlQJZGdu2VHzBmPX5CjrXMXRFt6JQKbILCWi0Gdo3K+HzUSP2tEKi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783576839; c=relaxed/simple;
	bh=IAMjpAROrbIxgKLXNKMtTjoTS5BkaDQyk/j9B8rbF60=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l69ajWrWMnAvRPaXk59Rca6BpS4pMKnuztALKdDoZLA1xLy6P5PbTFNcBWLBVbB7jLvagIv1vNMr7NOg4ZMRgy7Sx/bZbQLD0LVl3sNa5DgkFJncuaVIeu/OsyPJiZDxdMMoQGFVCD1coOp6Sat0jGy+gAyYGS8iVyXVil1naWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W18p0KLO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dyfV0tcu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960agq837432
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 06:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KVejRE01iSJ9Cu8Vv9/R1+qSCrCIqHbYQPC
	pZLTjswY=; b=W18p0KLOMqGgiuhbsBZ44PvbjZxW6wgKHH4ebgV7ChQ5lzGfKw4
	jKV9zTj/d3hG+ns1/8t6yRA9n1rNkjzW4Xmeb+mKP8WU7IMj1z6nSiQ0qV8cSg6d
	75ZsBmvDJfqz/zoSbxbH/SV+arwQcmJfIY8GRqcbkbFuQk4zGkMluvFFbCRpOkcj
	9oAUklE8k3iJbJKkkvJpxUFMfm8sB8cCXVdHbOmrvj80LV/XmMNFAQ4yxJ31IiNH
	U+YcFj/r6Q/1otLfYS1CoNYbx66HWYu6M4u9qvHPJSBp+HjPluJ+M9DTp8xPAcmt
	19aIauhynvKLn79unjY0DeyJB55v5YA6+bA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwajww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:00:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so30942745ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 23:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783576808; x=1784181608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KVejRE01iSJ9Cu8Vv9/R1+qSCrCIqHbYQPCpZLTjswY=;
        b=dyfV0tcuCBScPAhUp3SJ9DbgdpZuz/SZLCQTcvUiW9SumH6jsXUubCEJw52uaIk97p
         B/R0XPSf49dOA8TfhUOr/EV4+H6gXcmnNfC0koZjCY+WafoVZ0kQ9FusP7DI6kscFk8L
         XHYYkc5nuYT3HlJFjnjDnej8oHT5tINq5So74eYDtGyX876/MjYuHe9W+hPv5gBi9DdX
         4z+hv44s6XbpDuRTAxKW/zRrqwluPHOhdpScT7RXvQIqfjHMbrmVGSSbPW05n4S0k35J
         W4bupeGnPNgPhc743MOy3fFN81h6Ij9em5RvNjzZuxMCtmB2ngcHE3MZvgrl43GRoDY2
         nuew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783576808; x=1784181608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVejRE01iSJ9Cu8Vv9/R1+qSCrCIqHbYQPCpZLTjswY=;
        b=Gg/T1a6jip1DFwdQmypwUaWBByPKVfw7ZmcpMhMrSlMgkxJ4uuz8HNbNwv4MRZdWVq
         TO7zcVAHjlAezG+VuwksFj+Z+om331oYNrMwmtFM/RcvLsxJUdqfHN4AoG7PNabaDzcF
         zDWAK9LzIVqiF/8Aa6kLMeQVKLZso4N/x/Mhr1cQ814E+JZDL3hGZKRyqkgrqVqcVW91
         +I1vjxjQGN4YU9oCdzLtUwezP+LhMkJNIyCrAwSa2YNcgn3lBY2ITUpmmIZ0Xa4uNYQJ
         +5gjkgypYIPwA/ciZXXs+o91hi+UHRux3Pa2tW9l3Df1HbjdrcQ7mMWIKjjdpDZUahZV
         NrZQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4X1u5Vxc4FPyUG3CS+Zd0eENg7q6Ka4Iyfi/61o1Z4uKD/XKqrIxrrkjgk4jDIIphFBKBRz8wPUqTnQvI@vger.kernel.org
X-Gm-Message-State: AOJu0YyfROSNr/+y4leEO+h/2AWmDxRR9jZgoXUNd7ndi9ZEhpPFCivF
	MiF1Nta4Nm1hIBhbiNM4waphE/jmroGUhCjsHrlA+JsPn77aKSTfGIRqftbU9VTt1u354GLu63M
	VSlOnC/XkKQ8XUJZOqIkDcG1Qb4z3sDr4jCz6ky2YU+UrqPUVkkwUiyHaBQ0H6ZNJlVsN
X-Gm-Gg: AfdE7cndKvW3AeiAnP3XKmhWAMrY9HmWUV8IXbrj3T9yFmqWxXGVLti73yUoCAeJNsu
	TXZDpx49eq2AIao7jpRxVkYcRhAgnrr1Fp5rV2hzGHmdmHCDEuXXDDclZZWtwrnx3j3oQXOPLIc
	MeolG3eqbyBPB44t4tRkULGY0luVvIrh7Z9tvHGvVA7pWylmsu186IsvgYQN4BfDq3cTObmwzNx
	cBHyZHEVKpKhv3J1mx2Tqy5gL5JOS3vw7tiBFZsd/AIslJ7id3cpAwadVthEFBsTz+rpHTWDZ6L
	j3ern2/+vr/1kIYuK13IQkioJntwxSkBH+KIZrufoKyE+xW8gUDcDgQeV0rfOzf91+jQLovxd6I
	pOcjEhiifKIioEL0ihStYbVgorv5G+lBaUHasMlYowcNh1g==
X-Received: by 2002:a17:903:22ca:b0:2cc:777f:d67d with SMTP id d9443c01a7336-2ccea42ca48mr61321475ad.30.1783576807286;
        Wed, 08 Jul 2026 23:00:07 -0700 (PDT)
X-Received: by 2002:a17:903:22ca:b0:2cc:777f:d67d with SMTP id d9443c01a7336-2ccea42ca48mr61320405ad.30.1783576806265;
        Wed, 08 Jul 2026 23:00:06 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5c361sm37864555ad.80.2026.07.08.23.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:00:05 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
To: mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        andi.shyti@kernel.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com, aniket.randive@oss.qualcomm.com
Subject: [PATCH v2] i2c: qcom-geni: Add dynamic transfer timeout based on transfer length and frequency
Date: Thu,  9 Jul 2026 11:29:58 +0530
Message-Id: <20260709055958.4089039-1-aniket.randive@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1NCBTYWx0ZWRfX9jq/X5avyqEm
 RMjd95B/8/e6nAQVtpPQgSePFW8/Obz23kiEPwbpYtl1yVqaKEUWl5inxTawQbaAWp6lPeVWL8X
 4YIHDbX9WD8MOyNRmQGyPsZQBM4flxQKltAcBI3HXZ8vBe9/+SC9wB4p9PZM3ix9bgvqTc9NP33
 JRVbsoYzGGQQWAon/zE+bn/L2Qcsiax5soEQDQaXICPrVcvZPfQOIowVaw32lt6YqlIzZhOR52T
 No/AXFV8u+z38llZ9UtQMdjZ4GndMx1qZKe17MErFdYi3itFmyiXGeZYdZLPq1MG60HZyCGnYfL
 dGrzDrPXhdq8giykU9WoamZbhRhxGC2KA0r02668/ey7cg+q8OExfdg+Ra3tlou7MZLJnlZkhQX
 DFBThcdi+thOl8Vhq2XfxaboiqPEsgUOpvMfPzNBX13sMiXsi16kaN9x46Tl3ZuavRPVafoBKhS
 HVR4W3vIi1rdKBtgAMg==
X-Proofpoint-GUID: qoBo6huy9Vw88eR8ffo7QlUqx8RrBh7a
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f3904 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ThEsosvJOpkTSRB3RXoA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: qoBo6huy9Vw88eR8ffo7QlUqx8RrBh7a
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1NCBTYWx0ZWRfX2S5Ib0nCplId
 Vh+xcvxofoZPGchRqDRap7YKbfJNss/bTdBlzUdKZVPN7skW1b8QMqQQa0EPatVw/QpLo37AWtd
 1N/ks/nFoGRnPKyVB0h3EEkJd4ml7Pk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090054
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-117846-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9475C72CF43

The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
regardless of message length or bus frequency, causing unnecessary
delays on error paths.

Compute the timeout dynamically from message length and bus frequency
with a 10x safety margin over the theoretical wire time and a 300ms
floor. For GPI multi-descriptor transfers, use the maximum message
length across all queued messages as the per-completion timeout.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 45 +++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 96dbf04138be..d43db77b3678 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -74,9 +74,12 @@ enum geni_i2c_err_code {
 #define PACKING_BYTES_PW	4
 
 #define ABORT_TIMEOUT		HZ
-#define XFER_TIMEOUT		HZ
 #define RST_TIMEOUT		HZ
 
+/* 9 bits per byte (8 data + 1 ACK), 10x safety margin, 300ms floor */
+#define I2C_TIMEOUT_SAFETY_COEFFICIENT	10
+#define I2C_TIMEOUT_MIN_USEC		300000
+
 struct geni_i2c_desc {
 	bool no_dma_support;
 	unsigned int tx_fifo_depth;
@@ -204,6 +207,16 @@ static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
 	return -EINVAL;
 }
 
+static unsigned long geni_i2c_xfer_timeout(struct geni_i2c_dev *gi2c, size_t len)
+{
+	size_t bit_cnt = len * 9;
+	size_t bit_usec = (bit_cnt * USEC_PER_SEC) / gi2c->clk_freq_out;
+	size_t xfer_max_usec = (bit_usec * I2C_TIMEOUT_SAFETY_COEFFICIENT) +
+			       I2C_TIMEOUT_MIN_USEC;
+
+	return usecs_to_jiffies(xfer_max_usec);
+}
+
 static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 {
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
@@ -445,7 +458,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
 	dma_addr_t rx_dma = 0;
-	unsigned long time_left;
+	unsigned long time_left, timeout;
 	void *dma_buf;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
@@ -470,8 +483,9 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		gi2c->dma_buf = dma_buf;
 	}
 
+	timeout = geni_i2c_xfer_timeout(gi2c, len);
 	cur = gi2c->cur;
-	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+	time_left = wait_for_completion_timeout(&gi2c->done, timeout);
 	if (!time_left)
 		geni_i2c_abort_xfer(gi2c);
 
@@ -484,7 +498,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
 	dma_addr_t tx_dma = 0;
-	unsigned long time_left;
+	unsigned long time_left, timeout;
 	void *dma_buf;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
@@ -512,8 +526,9 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	if (!dma_buf) /* Get FIFO IRQ */
 		writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
 
+	timeout = geni_i2c_xfer_timeout(gi2c, len);
 	cur = gi2c->cur;
-	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+	time_left = wait_for_completion_timeout(&gi2c->done, timeout);
 	if (!time_left)
 		geni_i2c_abort_xfer(gi2c);
 
@@ -591,7 +606,7 @@ static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_
  * geni_i2c_gpi_multi_xfer_timeout_handler() - Handles multi message transfer timeout
  * @dev: Pointer to the corresponding dev node
  * @multi_xfer: Pointer to the geni_i2c_gpi_multi_desc_xfer
- * @transfer_timeout_msecs: Timeout value in milliseconds
+ * @transfer_timeout_msecs: Per-message completion timeout in jiffies
  * @transfer_comp: Completion object of the transfer
  *
  * This function waits for the completion of each processed transfer messages
@@ -601,7 +616,7 @@ static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_
  */
 static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
 						   struct geni_i2c_gpi_multi_desc_xfer *multi_xfer,
-						   u32 transfer_timeout_msecs,
+						   unsigned long timeout_jiffies,
 						   struct completion *transfer_comp)
 {
 	int i;
@@ -612,7 +627,7 @@ static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
 
 		if (multi_xfer->msg_idx_cnt != multi_xfer->irq_cnt) {
 			time_left = wait_for_completion_timeout(transfer_comp,
-								transfer_timeout_msecs);
+								timeout_jiffies);
 			if (!time_left) {
 				dev_err(dev, "%s: Transfer timeout\n", __func__);
 				return -ETIMEDOUT;
@@ -736,8 +751,16 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
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
@@ -851,8 +874,10 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
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


