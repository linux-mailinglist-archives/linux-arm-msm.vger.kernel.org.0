Return-Path: <linux-arm-msm+bounces-98645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yN75LNyYu2nwlgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:34:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C79C2C6D3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B06F31CDF72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECC53451CF;
	Thu, 19 Mar 2026 06:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GiVy1Vmx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPHl5Woc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F7234F487
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901932; cv=none; b=o4zMtMpVBj7obYOsbQ+xTCiTbxKOcD4/vE5rvM7P736VgOoY8VNXEm/QGQRM1RcEJ+k5uFmNzmRbpULPJjy0qQTV4d8fOumX0WIYoKlpps/8Dkhq9c6MJTCS/RdeNNzXyoRdr6x9jbvfW597MRcjiei2sqT/zQwMfg4bbmNVG48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901932; c=relaxed/simple;
	bh=9iJZxHKj6ceRf6SQQXFuF0UcjhRsGt64qimhRUDtN+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ReBz63ACZK74q01e+eflxsZdEahSpXg3OPbkIS602Gt3WzMKv3lV87d+oNBFcu+UctA6ii0xkHZ2N8ziWiuGnwnmIbEa1K9CjkqZt2xCXEKS5ZHZBzeqQDWWsfHBD+4yVNv2bzkwe+9eStYCis4nGwnQGmYK4D+uwi9M45rkAOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GiVy1Vmx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPHl5Woc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XeHB831318
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qq0/fBoVIDcZl7c9idmvD5vhhJIbEk2C9ivXkYLSvdo=; b=GiVy1VmxXUBWGMVw
	rhBiReMM+VZlAF5Etd/nwMhrISpyo4tFZD26N2zTt4WQltNJOYewDgkfCQyjYiF7
	Dj6yC/Z6vNnG7c19WCxdYeb0ydErGZgWfT7gFZ49NrGIi/+BhF8RB9yljIzMmgl5
	8Hg0N/mUpIY85mlUM1/bjndxLwsHDEflDIELwmqB9eKSpzazjuyQ2GN+f9nflL2l
	XCxP+xzxwZfwPd5SBI6SwlEQCS+w1atfye01pJpCe1xwmkTh2DCaU7QxmjIR/Shk
	DA/VwLsZiEWBOk9gyN1UySyCxS+JK3zEzFCn5P+TZSPpCc3qPAtKuVr/lpik7Bqp
	QYM9Pw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0032j6np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:32:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae3badc00dso6694425ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 23:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773901929; x=1774506729; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qq0/fBoVIDcZl7c9idmvD5vhhJIbEk2C9ivXkYLSvdo=;
        b=kPHl5Woc89wBPJkmFT8SFtWZhiF3pRMTFGypEfSjqyJQ6Mmqay3gX9FBpwM9rsqN4v
         Yop+vPbhc/jf9ELo4gaa0Jj8yz45gGfSfy7NLjGNbCPpR64YZHR7lQeXamxJrXiO7O+C
         pUdHezF61bDGzudkYaml30eu4+ugEOLlBBe4NKTb0rkje9r0uXcNm8bu9C5nmzSY1HyC
         5um47qFJZzCowOe2vrgc0h6eLlua/Z87JF4IzKXBZKe9y2N1bSou6SbOKGOmHYM/Sgen
         Z8YyTMO29S5DjwJpJjdDWNogQUpxtv2F/TC+R7HiC1hWH6ZWpaOAy3VbE2zt6GmWYOeS
         WtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901929; x=1774506729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qq0/fBoVIDcZl7c9idmvD5vhhJIbEk2C9ivXkYLSvdo=;
        b=oqVmW2Pra/98eEm3NGjwT+8BU4Ciui9wcvp3eHXMyc8dGcSv2URU+RCxEjgh+f8P6P
         8Cy835O+KMKC+ok+gZF+cemmgetIGrqwlqSrAwYfwRcewHPLcAkN3DH5vqAUJLWVPF33
         1fZYKS1r90suITjLmI7fYasQZF5eX/cp/YbDQ7atQs/sH35Xpc0XWBjxYUzZF8O5fYol
         j8Shhz4PiFH+lPOd9SjxuPijOtJwSyKRtSmjo+d26ENgCBnnaGwBqLqcEB2D36KnjCup
         6SgMrHg7jgpTHXE91xnTkKE/Q5wm/n6wWOUyNnIMYOZiExJ7w13H17u2ALptEtWeq9FB
         +NPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUkORUDhkKRGSKWl/MQKP9DsFVE8mO3Oc/nFwQll6spHwGARt6FgbO/X2ky0a16P30mHhx2uUc+IqBPjZm@vger.kernel.org
X-Gm-Message-State: AOJu0Yywmoyj3azADRypKmOHt/q8lyyrdcaZ/I9mDi/ISmQYogp+AJK2
	3GugCWBJjTHa/U1SvY5W2wt4bFrjn+xDrOamv49LWFKfvcrZqnZCy4m2Q4g40onOlFeQPqjWjeL
	3bpEcFhJKCYpmHM5ssi8XP7n2DGPDwGktJqeBT366bMdizgooCo/u2eD/z+MgWeUheNep
X-Gm-Gg: ATEYQzxTkkkwlknNry/OqHXQRiOinAGR60maME5qVxtcnGt/WA/8/BtcbcrapcYCUmh
	rHKxeV5/iyCDeO6f57qgFww+7SdOkCZufW0QLpdQlRyXG6MGi8vPgDsSRLSbhN6ogHpWxzy6mYO
	FGLlpwpmyHcFOEC8mbiDAV7thMf735FIJG97yircf4DbLCMrUDsuMVb3ISUVmcEsO7k+F0zGMTl
	PXB3GQZni29QBfnQrwOzU72NOtvh9s/cN/YgpyWj/R+hk1FdbwkwhRsw51tlHnXaDN1lSY7uVOy
	xCSXntIuqqgm+tl98JAUiiN1QSMOM0rFQ1R2T/KxqmdLDiPfhLk/7+OMyiWJT/lgCUv2smJRpsG
	+4BvjCe9WnlQSBRrVU23w2RMxNcHWRcZ21mw/lF4X8eHK3nQYrpM=
X-Received: by 2002:a17:902:f705:b0:2b0:5d60:7f3f with SMTP id d9443c01a7336-2b06e35b4demr63812505ad.16.1773901929100;
        Wed, 18 Mar 2026 23:32:09 -0700 (PDT)
X-Received: by 2002:a17:902:f705:b0:2b0:5d60:7f3f with SMTP id d9443c01a7336-2b06e35b4demr63812295ad.16.1773901928598;
        Wed, 18 Mar 2026 23:32:08 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm48572485ad.57.2026.03.18.23.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:32:08 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:01:45 +0530
Subject: [PATCH v4 5/9] bus: mhi: Add QDU100 variant and image_id firmware
 fallback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-sahara_protocol_new_v2-v4-5-47ad79308762@oss.qualcomm.com>
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773901902; l=5038;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=9iJZxHKj6ceRf6SQQXFuF0UcjhRsGt64qimhRUDtN+M=;
 b=/wsjS4Mb50XnI6cIGT6SBvW/dCirIKCjrFdPrSRkNy9DwEoc48RM2a7D6ERQqxMoFRMNyY6GT
 nS7kxdbRRAfB1mI2EAuRyKzKX0ZxgWz0uvulhmpiwIc51noTnTYm9+I
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-ORIG-GUID: hqCn3g4ahQmebGLCylRYwOM8-ffPllAu
X-Proofpoint-GUID: hqCn3g4ahQmebGLCylRYwOM8-ffPllAu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0OSBTYWx0ZWRfXxcE1m4tk2ST6
 zXd8tgNVX7bTZCyqIVSpicThEaOlDvPkIWApbejLt+bS+yQ4QrwQlvRD5vSMrgw7d7DyM7ITOCT
 YcsjzxBaTNMHG2zOOsEUFYJzvUVgIS/arUd0IZ/Lc5vEX5stajePLThSxSpHOGLFm37kwjuhMGP
 p/aFizcmdR/ZuunzqfPe4UHuNG9vt6IOiDxsDVHQjcUo0ebIhhobWS7dJkix6eaHawUzh4ou21F
 3JZ1it//1c6SxD0GTk7FuFKX8kSiSXJpjbov+YlqAiuSBjvbwMucmht12zr0GV3MgM9ccR4hOXm
 zp+P1aOqVlwn4STAvgqJzohvLvvEYI74j7o/LHrFJI3mhXF6FfW9ww+DxKdzDpUbwAWXzITyMw5
 U9b120W3OewVCw5zLS5X829rkuh20Xdw2zVi4gKzVGgjLsPcpVxkM7+mM459FOo6VOcOPfCOdzE
 HhOxQGhqgQV2wmqD7Yg==
X-Authority-Analysis: v=2.4 cv=WO9yn3sR c=1 sm=1 tr=0 ts=69bb986a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=g53SEPjKJ_zQRiRrflAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190049
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-98645-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5C79C2C6D3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Sahara driver currently selects a firmware image table based on the
attached device, but it does not recognize QDU100 devices that expose the
protocol on the SAHARA MHI channel. As a result, the host cannot associate
QDU100 devices with the correct firmware namespace during image transfer.

Extend the probe-time variant selection to match the SAHARA MHI channel
and associate it with the QDU100 firmware folder. Add an image_id based
firmware lookup fallback for cases where an image does not have an explicit
table entry. This allows required images to be provisioned by the platform
without requiring device specific client drivers or additional registration
mechanisms.

This change only affects devices matched on the SAHARA channel and does not
change behavior for existing AIC100 and AIC200 devices.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 77 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 72 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 8f1c0d72066c0cf80c09d78bfc51df2e482133b9..4ea14c57774f51a778289d7409372a6ab21fea60 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -234,6 +234,36 @@ static const char * const aic200_image_table[] = {
 	[78] = "qcom/aic200/pvs.bin",
 };
 
+static const char * const qdu100_image_table[] = {
+	[5] = "qcom/qdu100/uefi.elf",
+	[8] = "qcom/qdu100/qdsp6sw.mbn",
+	[16] = "qcom/qdu100/efs1.bin",
+	[17] = "qcom/qdu100/efs2.bin",
+	[20] = "qcom/qdu100/efs3.bin",
+	[23] = "qcom/qdu100/aop.mbn",
+	[25] = "qcom/qdu100/tz.mbn",
+	[29] = "qcom/qdu100/zeros_1sector.bin",
+	[33] = "qcom/qdu100/hypvm.mbn",
+	[34] = "qcom/qdu100/mdmddr.mbn",
+	[36] = "qcom/qdu100/multi_image_qti.mbn",
+	[37] = "qcom/qdu100/multi_image.mbn",
+	[38] = "qcom/qdu100/xbl_config.elf",
+	[39] = "qcom/qdu100/abl_userdebug.elf",
+	[40] = "qcom/qdu100/zeros_1sector.bin",
+	[41] = "qcom/qdu100/devcfg.mbn",
+	[42] = "qcom/qdu100/zeros_1sector.bin",
+	[45] = "qcom/qdu100/tools_l.elf",
+	[46] = "qcom/qdu100/Quantum.elf",
+	[47] = "qcom/qdu100/quest.elf",
+	[48] = "qcom/qdu100/xbl_ramdump.elf",
+	[49] = "qcom/qdu100/shrm.elf",
+	[50] = "qcom/qdu100/cpucp.elf",
+	[51] = "qcom/qdu100/aop_devcfg.mbn",
+	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
+	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
+	[54] = "qcom/qdu100/qupv3fw.elf",
+};
+
 static const struct sahara_variant sahara_variants[] = {
 	{
 		.match = "AIC100",
@@ -250,6 +280,14 @@ static const struct sahara_variant sahara_variants[] = {
 		.table_size = ARRAY_SIZE(aic200_image_table),
 		.fw_folder = "aic200",
 		.non_streaming = false,
+	},
+	{
+		.match = "SAHARA",
+		.match_is_chan = true,
+		.image_table = qdu100_image_table,
+		.table_size = ARRAY_SIZE(qdu100_image_table),
+		.fw_folder = "qdu100",
+		.non_streaming = false,
 	}
 };
 
@@ -278,8 +316,21 @@ static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi
 	return NULL;
 }
 
+static int sahara_request_fw(struct sahara_context *context, const char *path)
+{
+	int ret;
+
+	ret = firmware_request_nowarn(&context->firmware, path,
+				      &context->mhi_dev->dev);
+	if (ret)
+		dev_dbg(&context->mhi_dev->dev,
+			"Request for file %s failed %d\n", path, ret);
+	return ret;
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
+	char *fw_path;
 	int ret;
 
 	if (image_id == context->active_image_id)
@@ -292,8 +343,26 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 	}
 
 	if (image_id >= context->table_size || !context->image_table[image_id]) {
-		dev_err(&context->mhi_dev->dev, "request for unknown image: %d\n", image_id);
-		return -EINVAL;
+		if (!context->fw_folder) {
+			dev_err(&context->mhi_dev->dev,
+				"Request for unknown image: %u (no fw folder)\n", image_id);
+			return -EINVAL;
+		}
+
+		fw_path = kasprintf(GFP_KERNEL, "qcom/%s/image_%u.elf",
+				    context->fw_folder, image_id);
+		if (!fw_path)
+			return -ENOMEM;
+
+		ret = sahara_request_fw(context, fw_path);
+		kfree(fw_path);
+		if (ret) {
+			dev_err(&context->mhi_dev->dev,
+				"request for unknown image: %d\n", image_id);
+			return -EINVAL;
+		}
+		context->active_image_id = image_id;
+		return 0;
 	}
 
 	/*
@@ -301,9 +370,7 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 	 * Only the device knows. Suppress error messages that could suggest an
 	 * a problem when we were actually able to continue.
 	 */
-	ret = firmware_request_nowarn(&context->firmware,
-				      context->image_table[image_id],
-				      &context->mhi_dev->dev);
+	ret = sahara_request_fw(context, context->image_table[image_id]);
 	if (ret) {
 		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
 			image_id, context->image_table[image_id], ret);

-- 
2.34.1


