Return-Path: <linux-arm-msm+bounces-95968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNG3JmwPrGkbjgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:43:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ED522B854
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77385305BFDC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C196357A3F;
	Sat,  7 Mar 2026 11:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WekjT8zM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a8sWamLc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2250357A20
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 11:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883738; cv=none; b=F5U0Y0SnmiuYPsw7ZjiZXRsw5Ez1VuQkdw5mgVlNhN0SN1HTAOtJougSVocNfA8jcHA1tSB2DtuggzjxP8PGRudo4DDpNsQy1DsXAqDXalqPogHGkxkse2kw4zMNEVG0oLK3eTfOkml1dlCRM88gEhlqEuHs7CHAC6Lc0W5Ib/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883738; c=relaxed/simple;
	bh=D9kJlDoQ6LGAQMXZQh6rystru1KGUPI8NHA/TRw7+VQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oBReYetM6O+57reZiYyUT5gOfAzhkDtn0pKeW5Dm4I0zw34TcutTtIGQ8oS0wk7LTVMD4kBl25Z4DGuToIhLCttdoaTOarOT7cHI6wLshmtKFO8uLxdNPLcJV/W1awX8Cj3/68B8q8UGvQb+hC9vEbIOGZ4OM/S7z8XtlxECtXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WekjT8zM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a8sWamLc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6276qqhG3098381
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Mar 2026 11:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=; b=WekjT8zMSpAi5+2F
	NOC5OFX4Hs7Lvw67uEwHoXkTlsSG9brO0irqbmk5NV+pK6evVNNk31KGWrOem33d
	lwy8sOLdr6VKl7gUlygdv/+fsJXXiNHrea0cqIOeMe9ZzIiGtE14uJZP1sYtBDTk
	a9yK+cr+GE9TsHDNzE49XRpZMM0FUU1R8C182+F4yLpw243CUPdPb+cUYR+XykkS
	fKObjn1Fvl1V9jWgXOrBWiv7XAactbecX84059nCJ+6ebDoAcvltOSyolj7Ya3pG
	YL9wGJO33LUEyBQdHuEPqFIXJttvP+lG68vka83+W9yZA/YHMG0sfnFf7tdSQXJB
	foSrtQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrgugp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 11:42:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae3badc00dso81045905ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 03:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883735; x=1773488535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=;
        b=a8sWamLc4lNN9E3rG9JDnNZrVVGG6IWCMK5aUg3zTn1maRT9m/nlUBDjsminqEoS7E
         vKmtCf56Y6R0EW5qSoGTLDVKxe9yURIItaCxUwn12FOAM2NqyiyDUPNKjD+ZNYca5gZe
         VrJvqRBKRnYkuLcCUOJ+uva/TE3QJMXxNP3u/4u4JLSu9EZhno7QRMLQ0xFZVkJmyOXi
         7r5pZ/ui4PdexAVvhjFS9oh2TsyZA8EO2s904MratS2ueG1ZZq6vMhPX1qc/I1TMSnDS
         nR0xZHV/ggruJTgF02gk2FI2PsAkgcrSJ6vwfGU3y71ZufM255RgnSXh7v1Nh8myXhOi
         AcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883735; x=1773488535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=;
        b=XeCRd+hZUjHMPApZdNk8iankGMt0pgqnafSmQ+/u1+rObXW3LZl0wzOdWH8Kh85jXQ
         ZJMxaVYHDId5h0YZ8xlXwPZj0vqyEzEnY2Exiclqda+ltpxz2S0DPJLma8YeoBwlQkKY
         YhdK4mZ+VG16tHmoi6YG23TQBB73DEA/XUdDrsyCVCAJvF/ukgUL40edbS+F6odl1KN2
         WNd4yM+YE4Ns4Akx/HaFc77mpFWxdm7khsN16iDdrT2nyuI1u8lCF1ALasoisIbF/BPt
         i31QRzDAyJfEJftyKGNw6M1ZHgPD4tVJBDX9bGRBvOGkDs6jMFXUcUMIXj8DXTHbtnRa
         rjzg==
X-Forwarded-Encrypted: i=1; AJvYcCWch3UTmtra/I71ZWwLZWIq3tCV8DzSeAfajhjLJIe3JTcfRk/JKMUW8umVofKm45uenu3nVgx4Qofwdpxo@vger.kernel.org
X-Gm-Message-State: AOJu0YxQc2j+uZt0/Mce5AqX5w7p+GQJ/geghV+N42zOTZbeMXNAIAqT
	V+aFqFpBKdNwCfe8a3W5KWgDffWGTvNvirHPs2vE7OveDRT72YNGgSLbHSKzHB8eeOHOzZC3PkM
	f81zIbVYa2q2GEkxWuCqFZNuGMEnKiLozO+pt17ter9i11bh0mAioXySogqZUmHi/HjPIYRNZnQ
	oE
X-Gm-Gg: ATEYQzzL9J+k/TxVJVkFNrGF2wB2cQ8SvNXiOkX5JpF3m+trEZRXGZZJ7sSLNQNZ/QI
	nhOd23aM1D2fOL6li2MRvmpO4hmUHWjNtovxt0DS5u3lmHBP2X6KVqT92o6NF31TqDKrqmR+FrP
	awLAks+B2jWAaoGb92layc5rvkwpdCOlnpghX9g80DH2oK5XMit5v6HsIygpZprO+HG7uBhm72v
	sqPCd8UKHthc6XDgvSg+4ImjlRKP9IcpTVwwLwpJRdY0wQrzwWjvyxdIOIiPTsp0HMNzO7QdGbk
	rQinRKPsiK9iED7HbxrFndhSYkSS6AFzDUz+B8i+m/g8OBmin9h2C4nqm0dfnY7sCdcS9t6GLOo
	qOBJBAsWMEX+gRC9Bhz9g5mvYnSPk4Mi8kT/JC3+R5t+2v4Mshr4=
X-Received: by 2002:a17:902:ef46:b0:2ae:3b36:23e7 with SMTP id d9443c01a7336-2ae82398d80mr52195465ad.16.1772883735203;
        Sat, 07 Mar 2026 03:42:15 -0800 (PST)
X-Received: by 2002:a17:902:ef46:b0:2ae:3b36:23e7 with SMTP id d9443c01a7336-2ae82398d80mr52195255ad.16.1772883734674;
        Sat, 07 Mar 2026 03:42:14 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:42:14 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:25 +0530
Subject: [PATCH v2 4/9] bus: mhi: Centralize firmware image table selection
 at probe time
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-4-29dc748b5e9c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=3898;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=D9kJlDoQ6LGAQMXZQh6rystru1KGUPI8NHA/TRw7+VQ=;
 b=AaVGqgpWF7eVrREnt5Y5EO03kCIUBYl4kZdPLgZDVTiiCm1Kho2b7UaZcoD4cMrp/CaoDgmiD
 nVWAvjGkYNWD1NS4wgwp5xWhVrRF461rQtmOaVvcy6WrppQya1xF2rq
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69ac0f18 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hNMuCp7LqqrRSepR2eAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 9TOW2eZ8te1q1Dp8WZzuQYtmnVW4ziSM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOSBTYWx0ZWRfXyWkPU99fHW8g
 Z+oDEZFsqkWhXYm/XdGdddOUWYo2Mbxh9o7nPXGUmOjAXxTmai9KVbePAOZ+PHz/6pgc77YIBTY
 34+Wdte1Z6/i5xRK4luyu/ghnMdL1foN1ncq4QLxmR3rOY+DNIcNG+qcT2VvaoK92IM1uKz0pdm
 ceraNDsC+PfnxDkcXyH3+869vmPe8X9Z6jAOsPW081rtna90pax6vhatBlKFzMX5Q66g6eqtyRW
 aMkJaiVu6ROb9yGSsgaeNl16PXr5rae7TVOVEJoZ3DB86ioiN8UDf6w1gYE0eEW/WVnKcVi2Ulj
 ImpAIRDiF3crqvfzJjL4QbnPsa9eLSHSBglFAEpJ0UFsMsCg1K/mZUpFO3fx1nbuLTUumc0JHPq
 MqOmvDI+XPN1dc3flsB2uoIBzFENa3QxdxKGDH0PJoYuYVxD5GI45IHNP0wsIXjMziWHFI2lpMC
 3wKNiz8cUCuiErEzKXQ==
X-Proofpoint-GUID: 9TOW2eZ8te1q1Dp8WZzuQYtmnVW4ziSM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070109
X-Rspamd-Queue-Id: 19ED522B854
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-95968-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.934];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Sahara driver currently selects firmware image tables using
scattered, device specific conditionals in the probe path, making the
logic harder to  follow and extend.

Refactor firmware image table selection into a single, explicit probe-time
mechanism by introducing a variant table that captures device matching,
firmware image tables, firmware folder names, and streaming behavior in
one place.

This centralizes device specific decisions, simplifies the probe logic,
and avoids ad-hoc conditionals while preserving the existing behavior for
all supported AIC devices.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 66 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 58 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index e3499977e7c6b53bc624a8eb00d0636f2ea63307..8f1c0d72066c0cf80c09d78bfc51df2e482133b9 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -180,6 +180,16 @@ struct sahara_context {
 	u32				read_data_length;
 	bool				is_mem_dump_mode;
 	bool				non_streaming;
+	const char			*fw_folder;
+};
+
+struct sahara_variant {
+	const char *match;
+	bool match_is_chan;
+	const char * const *image_table;
+	size_t table_size;
+	const char *fw_folder;
+	bool non_streaming;
 };
 
 static const char * const aic100_image_table[] = {
@@ -224,11 +234,50 @@ static const char * const aic200_image_table[] = {
 	[78] = "qcom/aic200/pvs.bin",
 };
 
+static const struct sahara_variant sahara_variants[] = {
+	{
+		.match = "AIC100",
+		.match_is_chan = false,
+		.image_table = aic100_image_table,
+		.table_size = ARRAY_SIZE(aic100_image_table),
+		.fw_folder = "aic100",
+		.non_streaming = true,
+	},
+	{
+		.match = "AIC200",
+		.match_is_chan = false,
+		.image_table = aic200_image_table,
+		.table_size = ARRAY_SIZE(aic200_image_table),
+		.fw_folder = "aic200",
+		.non_streaming = false,
+	}
+};
+
 static bool is_streaming(struct sahara_context *context)
 {
 	return !context->non_streaming;
 }
 
+static const struct sahara_variant *sahara_select_variant(struct mhi_device *mhi_dev,
+							  const struct mhi_device_id *id)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sahara_variants); i++) {
+		const struct sahara_variant *v = &sahara_variants[i];
+
+		if (v->match_is_chan) {
+			if (id && id->chan && !strcmp(id->chan, v->match))
+				return v;
+		} else {
+			if (mhi_dev->mhi_cntrl && mhi_dev->mhi_cntrl->name &&
+			    !strcmp(mhi_dev->mhi_cntrl->name, v->match))
+				return v;
+		}
+	}
+	return NULL;
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	int ret;
@@ -797,6 +846,7 @@ static void sahara_read_data_processing(struct work_struct *work)
 
 static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
 {
+	const struct sahara_variant *variant;
 	struct sahara_context *context;
 	int ret;
 	int i;
@@ -809,14 +859,14 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 	if (!context->rx)
 		return -ENOMEM;
 
-	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
-		context->image_table = aic200_image_table;
-		context->table_size = ARRAY_SIZE(aic200_image_table);
-	} else {
-		context->image_table = aic100_image_table;
-		context->table_size = ARRAY_SIZE(aic100_image_table);
-		context->non_streaming = true;
-	}
+	variant = sahara_select_variant(mhi_dev, id);
+	if (!variant)
+		return -ENODEV;
+
+	context->image_table = variant->image_table;
+	context->table_size = variant->table_size;
+	context->non_streaming = variant->non_streaming;
+	context->fw_folder = variant->fw_folder;
 
 	/*
 	 * There are two firmware implementations for READ_DATA handling.

-- 
2.34.1


