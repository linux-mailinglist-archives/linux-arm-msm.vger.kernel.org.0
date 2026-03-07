Return-Path: <linux-arm-msm+bounces-95969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBejCHIPrGlIjgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:43:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B9622B86B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76ACE301D57C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FBE3590B9;
	Sat,  7 Mar 2026 11:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7xJadM8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hPaD2VyV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC16358374
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 11:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883742; cv=none; b=L6Y3acCv8VlIrt+3NDszIl38S1fq2ivjhxhAH7aagKaWsWKo5ppb14GKPmqrG9ABzCz50Ffnmlh7pCaAnKCsQQa0RXdlkR0TQrhXFLCuNtt/+0JOzFu16+3lGDpe0CixI2olUXlWI7PE+AXatTWElzGtWZLJD9DQ8ikX5jhWLW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883742; c=relaxed/simple;
	bh=vJFCyjoa95JiLXs7Pz6h5TcdiwCOOqlAIPqInF7ZlGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SR4BwWe7JKd/PfmAPBhkX8BS8pkty9rOVDTjAAcU2H3jyzoMTr5vNVBoWBRRM/UvgumKWl0/qqirBb934g4uOxN78z9Nh/5Cu1O2ghENrrPux1BEyI4WM3DjN8NmurZHo1h1BSIfRGOtViPQ9Ix3qnI59XnweCO+0UIM4gr2fJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7xJadM8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hPaD2VyV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 627A7eWR2880627
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Mar 2026 11:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lZxEXn3sdw5rskEYY6XPn9j73RYtVWhCrLqxpAp16Kg=; b=C7xJadM8gA7u/IHN
	bx4dtl1AbW/A6cZfQt6yenU7Y5LK7ekEYg6RvIcibbyRAJsImpkgbxOYbrCpYEtI
	oqevAFsv8iKFFLexOKYQXpM0l2QqJPVnGMxKl5drDuvkeEU8JmzsMOK05sNKEUq2
	o2gu92anooiqn/tSoEehm0xR8JCq8VorUHZuQc9L2t7poOhjQPaUlCv+V4V/uPv7
	jjXFo/6+6AKqyqAxjZ5hL6l3wYlpI+LTC9N37ZKyDtcL5P7shfnribCKtS/w3WtH
	mKlf2QS8mkf6Hy/qkMeCwZIXk59VMguXNHpVPmieMW48uFGtFyr/Cfrt33m/G1ph
	SY3TJQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc838ppy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 11:42:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae50386da7so39808935ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 03:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883739; x=1773488539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZxEXn3sdw5rskEYY6XPn9j73RYtVWhCrLqxpAp16Kg=;
        b=hPaD2VyVsktmYsd7QAIzIclvG+xrVQ9UBBFzjLnm67hgBlEoeHhb+zx8TquLdHEYYg
         iK+qf3zbzmqGlNo1cXiDj+8BnHFjD82wJQT3U7ZBlSCPfI25hwnkHypDpnDB9gitvXyH
         sQdkYHt0izeIHs24jRec2HZgF9GsoSNZNOT5RTMbAnnXa3/r8uMNUnFp2oP/OUFoSN6c
         pvD8ko1osMadLmj6KzMe+JTMS9BLZzB3x/ImfNsbO/E1gnC8Nti1BGhdVb9QiMntogta
         iiiedIeZRpsUXyUDN/fxRGrQ5sqRAmpUkxsdmtm1NV6qccNcVigu3Xddxx3hOHP4B7t9
         86UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883739; x=1773488539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lZxEXn3sdw5rskEYY6XPn9j73RYtVWhCrLqxpAp16Kg=;
        b=GdjYNt+DE4DvJ391MZ74urvfiF3F8s4FaG3pDfEh1DYKK7hxSonuG8mkGR0o68j1bG
         JdrYya1LIzKeStPf1PekfAyNYRa6fYnxOHUppmC24uF1i7fRq7pfkFmM42nE0qIyR6Rj
         Li6DBG8RE0GCaME3deKYjspdPVWSMtv7YCkPj10eDmmlfAwthPy/Eua3ExNZAS6ulA2k
         DmCRTxhTxDHbFHS4XbW08eQ0aQaEsWjLIiqq9EvausYHzFvkreAE9QAeVgvjo0aQP+Q7
         WAeU9mmNve6BMtzipTpNooghSpGra1ATAva/F0W19/e7uLLqsVNN3lUC0i9DQ4PEf/hw
         m04w==
X-Forwarded-Encrypted: i=1; AJvYcCXK/UZwGXVTgrLLu8Rs1sfLpWbPJSv7BzgZ/u2rTH1HhxQvhhnorU80KvpT/wwbO8PDLkTBFs9d3BXC/yd1@vger.kernel.org
X-Gm-Message-State: AOJu0Yyaq5G2QbcuPaer4WKTMExlUxpkFFGri0YjzFwr71HvqRFu7m/r
	0H7jnMmqs6W2GCcX/No4O2PpY6A0gCF0gs++wNTsyJjrYlmJcSJ2XESCd+9E8J1oymwWJmlb9pL
	a/r0N7rQ5MT9dfv0Oj4Vfwur1FfBtGSXdHT6ejUQdj08vUVX6hpaS8G9asFcdRH4AV1ue
X-Gm-Gg: ATEYQzxKRwUV7PIJ95dC28fOja1de8VPBsOFQ5mcSCXeubJhL8ihRp0p/014JI1FM71
	HiW6C8mln2MMfmT3S2JFp0sfOYd/GfDnGDwE+we9hIDEwk6Y0wbES40JGHtv5yIxFCWQXdEPkY9
	SEe7o3pAQrpQpt/1MpNJiOicpi765Lst8ToQeoQEYdSvF/cFtjGL83YNWJJ1+N37bFQAuY6RCl5
	7ZqsEvaLVq8b6Vih5OI2OTlWIxAOpvBFl8poSGm7OYmO4XpLLsS8Jp5x6z8D/waOfgJeYB4z1i4
	W9/ICgIdbzQ7q8ofU3Vea1PVkIEgG3VK+OTD9nG3OSYdLe240l1H4eVYrzc2UXpmqyHMb39r+Re
	1vmyvpVhwAQFgP7mt8rrDuMVKAfQVt6NzzPcxOUKl8l5io4ojElc=
X-Received: by 2002:a17:902:e845:b0:2ae:4f4f:1672 with SMTP id d9443c01a7336-2ae75c44e3amr81895125ad.24.1772883739467;
        Sat, 07 Mar 2026 03:42:19 -0800 (PST)
X-Received: by 2002:a17:902:e845:b0:2ae:4f4f:1672 with SMTP id d9443c01a7336-2ae75c44e3amr81894975ad.24.1772883738917;
        Sat, 07 Mar 2026 03:42:18 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:42:18 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:26 +0530
Subject: [PATCH v2 5/9] bus: mhi: Add QDU100 firmware image table
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-5-29dc748b5e9c@oss.qualcomm.com>
References: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
In-Reply-To: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=2740;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=vJFCyjoa95JiLXs7Pz6h5TcdiwCOOqlAIPqInF7ZlGw=;
 b=E0DvBMVt1yhlU2+bl19BSbFkyOv8lNtMG/XoDDP3el3kAeZ8yYxst3r6uOujsj9J/WiJJhau5
 3vsjMZdzA9YC4KOv2yPbPKP9Km3C9tjYx8vksXNq6mmqaYpJDw2zjVs
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=R9UO2NRX c=1 sm=1 tr=0 ts=69ac0f1c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HyzSnua-yo5JtJyIgQUA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOCBTYWx0ZWRfX8VOzf6objboY
 8TDfyB/KNDrSV6kAGG8V9hSkDkLfsRj3BRd1ej8+lbiTfqm8pUSyUmUgybwa2/+Ud7kEMBTPOsm
 Qwt8I9xPYbOqRIlBv0O0QxruU1a2jIjE994wrHgsjXJ34l8h6xl9oJa7LKeiDwBXrJysu8J0wtF
 GyAoMdlkOo73hcZVrPyPwCfUUPAUYxm9Q7NqReoEyzBbYnKdJr8Hh9enfZ55Eo4MDnoklnvrnbj
 6kycy/wiD4UVNCBnpKmBD5YgQ7TYFzYO5bK97cCupwoTiX/HCw8aFtT6Pv9fylx5I08rpoFL+Cp
 U24PBIqKeYlJ+9kAYwZNUzvB9tGKVaueMZ5SLr+c1Sp62rYN4GQTxxvVK+yHJIOVhLkJY6homye
 aeujZj343Pqq2qBvt4/kQrDXF9LzR0ZgJX3O85EHtvnz9bRZ/AugRzlLIcbg9W+rpsPU4me+kmX
 vb95JepBx87wIL1/irQ==
X-Proofpoint-ORIG-GUID: gdyDLYuc_obHpApBIFdlgHHHmiat5Fmm
X-Proofpoint-GUID: gdyDLYuc_obHpApBIFdlgHHHmiat5Fmm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070108
X-Rspamd-Queue-Id: 69B9622B86B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-95969-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.933];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add firmware image table support for the Qualcomm QDU100 device to the
sahara protocol driver.

The QDU100 device expose the Sahara protocol directly on the SAHARA MHI
channel. Select the appropriate firmware image table based on the matched
MHI channel, allowing the driver to load QDU100 firmware images without
requiring device specific client drivers or additional registration
mechanisms.

This change integrates QDU100 support into the existing probe time
variant selection logic and does not affect the behavior of existing AIC
devices.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 8f1c0d72066c0cf80c09d78bfc51df2e482133b9..73ae722122a35b77760a4816bc60e6607aa53455 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -234,6 +234,37 @@ static const char * const aic200_image_table[] = {
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
+	[43] = "qcom/qdu100/kernel_boot.elf",
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
@@ -250,6 +281,14 @@ static const struct sahara_variant sahara_variants[] = {
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
 

-- 
2.34.1


