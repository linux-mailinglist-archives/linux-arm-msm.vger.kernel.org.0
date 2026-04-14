Return-Path: <linux-arm-msm+bounces-103190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NQTBkp63mkHEwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:32:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 537883FD1A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BC1E301113E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A06F3EFD38;
	Tue, 14 Apr 2026 17:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TegUvhl1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RoD8lTzk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4A224A078
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776187974; cv=none; b=Ndr70aEiKogfdNkvdKyi4qJ+QDCq30b2wJtC/4HKgqVrRnouC8ntnR9ihwSobKzHP31Vm/6eMewJjBuY4Mw4MzyomuvT8TO4YYVq2nlmRCrl6WmZ5WEB9UkjGHhMD31revF1UfTGx6fMx+ytdlWh6aUjP/NervlzV4AbQpQawxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776187974; c=relaxed/simple;
	bh=Qp2hJ0+XQd3YS6P3qfXzhh6oR/gbLj6+qtfqHBspjyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T/06KLSq//RBgklBFmS8oZSjKyoCfEgmnup1GXFENHl99CfCZJCi6zGDKTY190nngJFFUT9rb+rcFN1vAOt5jmD+8smD9pG5yEQW7zNwSjDx+/ukVzL7muQkWiS8fJhW3AlX4nmuv0rsvVVmY5WHk3RIq+yoOu4kAxXZ9zrN2bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TegUvhl1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RoD8lTzk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBBKHn395771
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tDoElzImC55GhbsOnTnYubuG5j8YWefLUiY
	xQ7/dKxc=; b=TegUvhl17fE7uyfmoVq2ExAQn6ImTXFyAhFcfv6HJPiuC7HFvSp
	MbkKBrPwPeA97wikC1acn6tKTJD7Vm6ienEJN9Ce9G3fJp5UjnQG4IHjrghb/b/h
	cGAuTkI5N9z2vp/p0Xkb1+FP1ecKMhLD1kN/1JW8z79NagwrJ9j/5UVoIYB3Bdr3
	+V5W7rBDICvdtt/F6RkqvAL9RB7RdhMdeMb+7kLrHRTX0wYQb64eYl9z7ev4zzAn
	Cr1S6RpOzYmvdLtAm+tsJIcEcodGohEA4dyN6rdLeBFdRX2UlteTHog07yXNrbxo
	lYW7T99tWgP1PUE1IImiJ3aV1S7YkSjIeZA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870uttm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 17:32:52 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56dabad2c48so2695363e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 10:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776187972; x=1776792772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tDoElzImC55GhbsOnTnYubuG5j8YWefLUiYxQ7/dKxc=;
        b=RoD8lTzkiGzcxn3mlMcPvNBGwteSZEk4dehOMxqMPP7TNtL7za1n7m727u1q6db2pk
         Ke5UlaYEW0ZWo+XcgxyE7BAOlKV7K81yYISQrgxkHyfK1/Gx1p5CMBz1Aep2dNe0DBtT
         PxA5nMCFgxHcetICtoJE+TTf2WgCDCgPqmPMdFU0zWkLwrd4lNXK65VH3uHue8XOWCls
         I7TYf8LZ6CXVeL+px4vVvOgc0wweNbvqR942ECNCaRHhzQJWYIAQml7wiXuxD/77m/ml
         y8lJ4m/PhGvaPIO9AHZ86Qw7U9o2mabbLYtJISUwVy5+g7Qxjo7jcKyJGwuB8pejF74S
         T9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776187972; x=1776792772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDoElzImC55GhbsOnTnYubuG5j8YWefLUiYxQ7/dKxc=;
        b=pWYJ8j1t8SrjQxyrUttiPvJZzWNlRsx3/ijiWda+WiA+P6uD9kBxa1dcFIHhVSGMEn
         tSnhyBOm7V4qSvd/rVOa/u4fif50y7J7aTG6yk2fEyWq14io/7Ne8e5pI9BloKB/X9oZ
         if2T3r1Lgfr2+60C12gRuO/cww+xoAU2X4Qys13rXgm/6IfuMy9Tg76lLXcGKu0rUUYR
         jVUst72+gTkPX6oRjygAU4sfUVR1EpGmooJROAM+Kg3WoXuR0xV/n2NWVjn23hn8gbr2
         UhFqT77KTKYd4pFCVGV5TLszYORlR8Mo0lVoTP1t+4rQ6xJSZYYox9ekdxWflR+56qc6
         G/GA==
X-Forwarded-Encrypted: i=1; AFNElJ/rjiuSDS2kcOpONH051m08BBBnE/EGSGEpLJ0/dV3ZaMES0z+I1R+0sgW3OxfYdnPFwipPs287+oKCawL7@vger.kernel.org
X-Gm-Message-State: AOJu0YxGqcSySsFyQu3+MjxS8Cd+e9yAvZnbEJk4QH1jOvhH2uBYi9RP
	Kh1GQpDnEx/uCqblevg3h0+QoIFQauRKeBZl00v+z0POCa8V6MulXdcnXi8XUAJZdAWG/U8pG6u
	LfHMHAaHip/ThCP0p3QJgQHoOej2hXjU63jiUCQtB9lcGS8AYkMiK1KY+2zg+SN1hj4Z+
X-Gm-Gg: AeBDieu/XwPrEKd2nOmAoX2/8pVrPvmZsgBdtR/EvR578TUjMCL2xLS+XVzY5PGLdA9
	s2nxlnFDhzEwCiypTXz6s0wMsMmyWNHpNmKlfyDIXSljLVEOB8GllaRpg9tCj+/EMG8WEMV9kzq
	/ZwEi4uM7aH/wpiYJcUnap0dPqj9Q/SEv/2LbkP1c45cxvB9lOnW0qRZFqjUncP7ONXAQ4rAkPA
	uNDQaer/fmRtewvawVF44RnnOfzbRLByQYoV8Ilzqvh+bPYdxn9dKRhfpjVqJFvtzwHsEFICU6u
	Rj62rDfMdaKOCyZytX5F68Qbop102p635ZMKYLBDF+X+xFIBWXnohtrdSSKtw/RYJXPx8eMGZUP
	RVm1BrQKaxVcCwgiBZCsTHY3Dgg5PibjtH0eIV/KGg2t4uAqMT7gqFol9omBUWQ==
X-Received: by 2002:a05:6123:52:b0:56b:7484:39b with SMTP id 71dfb90a1353d-56f3bb67233mr8324030e0c.4.1776187971615;
        Tue, 14 Apr 2026 10:32:51 -0700 (PDT)
X-Received: by 2002:a05:6123:52:b0:56b:7484:39b with SMTP id 71dfb90a1353d-56f3bb67233mr8324021e0c.4.1776187971187;
        Tue, 14 Apr 2026 10:32:51 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6718f52c111sm1289110a12.18.2026.04.14.10.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:32:50 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ruikai Peng <ruikai@pwno.io>
Subject: [PATCH] accel/qaic: Address potential out-of-bounds read in resp_worker()
Date: Tue, 14 Apr 2026 19:32:49 +0200
Message-ID: <20260414173249.3672053-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Tq8_Vf3SIPxtlr9etfg5qcUNTtYwgt76
X-Proofpoint-GUID: Tq8_Vf3SIPxtlr9etfg5qcUNTtYwgt76
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2NCBTYWx0ZWRfX02jgfxqpnJWk
 n7EG6K46kAPNFcX5gtFI7pCjuZM19HFib8rak8HZWLX3witA3sH3EIz3+KbQkv1pI3if2JSMXYe
 fJZy0pmvjNyf/n5U9Ei900dKXC/VslayE/epy2nx2p/0baUwQZlLcF+7HR1xq8UThUsRjMu5qGL
 UnAdNV3MzwcJtdssxQr46WJwATLpJIRvwdO+bmwhzc021Pd4+skyJSClIWVtkhTTLHeKu80iPD7
 9FSlS7v+NJT4uG8WPF+5Sh6AC/DLhWep8DJ3M8Qu+fe2ccybGT9lQuI/QUvFFJaAyfRIHPzUdi5
 L+MzvSTu0ijKhcTkhkxZO4YZoTA3ferSI+nCHnFCalafdQyiQc3qFTLMCevo0JYRGHXtarwM25I
 w0JT7jIr5/rF2DrJ3HgKmomLlMgjtHDWDmPzbcDEJMZFynonTpJfGqShtdhCO8N7cbbwFSaofnA
 6U51YeOVnYYQa7hzEWA==
X-Authority-Analysis: v=2.4 cv=MK9QXsZl c=1 sm=1 tr=0 ts=69de7a44 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=BcBWGRYXcgCxByWW27IA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140164
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103190-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[youssef.abdulrahman@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,pwno.io:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 537883FD1A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Although 'commit 2feec5ae5df7 ("accel/qaic: Handle DBC deactivation if the
owner went away")' fixes the scenario it was intended for by walking the
message and only decoding QAIC_TRANS_DEACTIVATE_FROM_DEV, if present, it
skipped over the bounds checking code that is included in decode_message().
This could lead to issues such as reading past the slab allocation's end,
infinite loops or kernel panics. For those issues to happen, a malformed
wire message is needed to be sent from the device.

Instead of duplicating the bounds checking code already present in
decode_message(), use the function inside resp_worker().

Reported-by: Ruikai Peng <ruikai@pwno.io>
Fixes: 2feec5ae5df7 ("accel/qaic: Handle DBC deactivation if the owner went away")
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_control.c | 48 ++++++++++++++++---------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index b21e6b5b3a10..818a77adde2a 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -1075,11 +1075,13 @@ static int decode_status(struct qaic_device *qdev, void *trans, struct manage_ms
 
 static int decode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
 			  struct wire_msg *msg, struct ioctl_resources *resources,
-			  struct qaic_user *usr)
+			  struct qaic_user *usr, bool orphaned_deactivate)
 {
+	u32 msg_hdr_count = le32_to_cpu(msg->hdr.count);
 	u32 msg_hdr_len = le32_to_cpu(msg->hdr.len);
 	struct wire_trans_hdr *trans_hdr;
 	u32 msg_len = 0;
+	int trans_type;
 	int ret;
 	int i;
 
@@ -1089,13 +1091,15 @@ static int decode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
 		return -EINVAL;
 	}
 
-	user_msg->len = 0;
-	user_msg->count = le32_to_cpu(msg->hdr.count);
+	if (user_msg) {
+		user_msg->len = 0;
+		user_msg->count = msg_hdr_count;
+	}
 
 	trace_qaic_manage_dbg(qdev->qddev, "Number of transaction to decode is %llu.",
-			      user_msg->count);
+			      msg_hdr_count);
 
-	for (i = 0; i < user_msg->count; ++i) {
+	for (i = 0; i < msg_hdr_count; ++i) {
 		u32 hdr_len;
 
 		if (msg_len > msg_hdr_len - sizeof(*trans_hdr))
@@ -1110,7 +1114,20 @@ static int decode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
 		trace_qaic_manage_dbg(qdev->qddev, "Decoding transaction %llu.",
 				      le32_to_cpu(trans_hdr->type));
 
-		switch (le32_to_cpu(trans_hdr->type)) {
+		trans_type = le32_to_cpu(trans_hdr->type);
+		/*
+		 * orphaned_deactivate is the case where a deactivate response
+		 * is received from the device after the user owning the DBC,
+		 * and the message requesting deactivation, has gone away.
+		 * In this case, only process QAIC_TRANS_DEACTIVATE_FROM_DEV
+		 * transaction and skip the others.
+		 */
+		if (orphaned_deactivate && trans_type != QAIC_TRANS_DEACTIVATE_FROM_DEV) {
+			msg_len += hdr_len;
+			continue;
+		}
+
+		switch (trans_type) {
 		case QAIC_TRANS_PASSTHROUGH_FROM_DEV:
 			ret = decode_passthrough(qdev, trans_hdr, user_msg, &msg_len);
 			break;
@@ -1430,7 +1447,7 @@ static int qaic_manage(struct qaic_device *qdev, struct qaic_user *usr, struct m
 		goto dma_cont_failed;
 	}
 
-	ret = decode_message(qdev, user_msg, rsp, &resources, usr);
+	ret = decode_message(qdev, user_msg, rsp, &resources, usr, false);
 
 dma_cont_failed:
 	free_dbc_buf(qdev, &resources);
@@ -1607,22 +1624,7 @@ static void resp_worker(struct work_struct *work)
 		 * response to the QAIC_TRANS_TERMINATE_TO_DEV transaction,
 		 * otherwise, the user can issue an soc_reset to the device.
 		 */
-		u32 msg_count = le32_to_cpu(msg->hdr.count);
-		u32 msg_len = le32_to_cpu(msg->hdr.len);
-		u32 len = 0;
-		int j;
-
-		for (j = 0; j < msg_count && len < msg_len; ++j) {
-			struct wire_trans_hdr *trans_hdr;
-
-			trans_hdr = (struct wire_trans_hdr *)(msg->data + len);
-			if (le32_to_cpu(trans_hdr->type) == QAIC_TRANS_DEACTIVATE_FROM_DEV) {
-				if (decode_deactivate(qdev, trans_hdr, &len, NULL))
-					len += le32_to_cpu(trans_hdr->len);
-			} else {
-				len += le32_to_cpu(trans_hdr->len);
-			}
-		}
+		decode_message(qdev, NULL, msg, NULL, NULL, true);
 		/* request must have timed out, drop packet */
 		trace_qaic_manage(NULL, "Packet dropped.", -ETIME);
 		kfree(msg);
-- 
2.43.0


