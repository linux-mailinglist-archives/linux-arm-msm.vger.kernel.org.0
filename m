Return-Path: <linux-arm-msm+bounces-98644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAQDD7SYu2nwlgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:33:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E3A2C6D17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:33:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1353231A978C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDBD346FA9;
	Thu, 19 Mar 2026 06:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Whn166aW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cq2Hg05M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEF534DB7B
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901927; cv=none; b=JlXGxxZFDHdfRnKfGT4z1P2IuoIvHyTvsj3W/aMEnfq7T1k45QKDEdETZj97hL8jcGOPObd8lAvq0FiQuDJS+DbVIfeWeIlGSWTgU4ijqxkYD1fN+Awd0xw3e6nQiQbbQnRLv7ms3yiASVqZmds/zNz3kZH5D9RhM901GiN3S1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901927; c=relaxed/simple;
	bh=D9kJlDoQ6LGAQMXZQh6rystru1KGUPI8NHA/TRw7+VQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n+JdJq6Qzdi5W6FDetWlnwCIskT25ahUi0b5Skohh6CF8t9lvHm6+byn+LFMa9r2PgwSj64ynHMT9Mm/3EYgEVPeshp8lLe6ZOQD0SpGN/XFDRDZkSWEc8s40RWlQy+xnCqAPBocxmU6XU9ZSxdB7CBTnsNKAFfxAuC5CsvTtpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Whn166aW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cq2Hg05M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XJZk3573655
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=; b=Whn166aWF+XL6yG7
	FGBOscb6eQy7j9Si80EhSoVjfzaM0FEkgX2cWAxkFlVNumEzhyPzOM9CmzWdG1qA
	MZQQI3LX3k7bg9IChdDCQsLasLxF2SAcluNgscqujtiG4IxilP9rK0D11/49d8DL
	ty21gWcNCSyy+9ULXhqcCZKLtXUj22qbjv+ag9nO1PJOjF/notp8RB1I6Jr9FqO6
	cvRjn7Ex3O4eiegBLvHEkL4HhMZ6bxxYMIuZi6XeL7dvhczmWEwLGX5SWZHZw/Px
	uthjzhpknujr7XrPFNiCdVRPrBSlIMs7ySDYLOtD2q3kpdEYSwPE2dzw+XFhxCGR
	DvBxRw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d083r8nds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:32:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0601ff3d9so8407045ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 23:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773901925; x=1774506725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=;
        b=cq2Hg05MKPH9MpCEJLuNPezx+7qHAsqd1LVTSgwTuUFYz9YPDoHze5GBC5GTomOjei
         uW56tuD7iGxmISqz1Mb6bYHoUoOSUVAGfaQIAGwRrwTmCG0oPy2f7DQJ5Y8URvwb4KYU
         kpXDVvpWxc7aLGjgD6CZIQgL+dsWnWvyTZ0u3HZFE6OgpKHQHKf5ddo8aUYKSnVPM5IS
         Z/ubzcChZh3mubPerruWWbgXR/y1gF+7tnRImdi0T2OwsoGrk4sWjOOk0p4oEh2xupZC
         c2BTt5RIl9aBS8vpdFhanLd6mjX/FhKViIWkNcAPh8IfSb3z4iicgarXkPPh9sQOeAJK
         r06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901925; x=1774506725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iImuO6SGxaLTCiAHgKuG3rSRhW0OgS17DvZFF+54V/Y=;
        b=nGjDu8ECqUfp3jqFuK2rSTDeZPQdspUnFXkcfFFsHagJgKIZIL1+71uTHZOFQZ+TP6
         vQ48TCSJc3JYuPbVBpK9f6b1o04lTfEgRbwbySTtBg34+I3FN/fF7vRyFtaBXxmRK21j
         voe6m8XdEefD1gKtyxlpHIe73iHGEQEvbGjAgsU9hJkaMhNPnI3iRfqMRKdRpH3ycjrZ
         IyFXGC1okiETGswACB80esqkzx+L2mn8TBQAR36Gbc5yHnxlk1F9rwoPkmj8Dl6kRWG4
         68iGlJh7UDWTnSpRqNJZXQuJNXjoRBxvjuch3BvsE3aLY+paLdkbr4p7YSc36SaZ1f4g
         9RIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv4Wu+/FuNe78d4yOmbI74eREJ9Su0F095TGFI/Q3IjrggiLVVM80n+jjZtEYXgLkjBc9QU0Z198iEyhGe@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+9bzk9m9p//BOapyrhihP/F8TQXeuHvL1e3x5oB3DAq/LsdHa
	wjxydWXScDtkkLFid4akBALMd9U28MMT+W64/F0bz2yos5YgHHR2XKQAgQpnXWJdU0UWc1lqqHO
	ux/flVBQpyNwOe1Z+q/T4XjsoJkweB1EpmlbnuEQ5YdRWP8V28TJoyIcATuGLrcN+X3JN
X-Gm-Gg: ATEYQzwXhNEmHxhcGNS5qrW33dYc/s0SGTterWrCpbrqViE2O+iz9b70Don52MW+OzC
	eRc62imebnfgHjVnb9f3y9h0N0PMEzl1VC1AVkKTeoIrmNjG1ts2wfmKr7JyYZXeYK/jLqQD8qW
	kf8LQQLyw53/p15dNbCRzzIFp6QF3ElUgnDHPEmDY2WLD7rBe0Xyn6+aTI/0jxaJC2iISMrE+YR
	8oaabqDzLe44wxNAs39q/+9T3lH7090uUMtf8nmac4ZyeLCH9gKs8gY54ixolncbamZ/VSBt8f8
	rM7O/hkHalpGI/+whSQbU8uvAihbOFU2bICaRYUZoBNO9vSbqcBdVnzKjQ4BCUJc6mkoDF+NkcW
	KltLr5Iw7s6j8chz28XL84B2FFOS/sxjLr0dbbFBN3E9sx1AI0J8=
X-Received: by 2002:a17:902:f547:b0:2b0:7177:d5e5 with SMTP id d9443c01a7336-2b07177dc04mr45425245ad.43.1773901924738;
        Wed, 18 Mar 2026 23:32:04 -0700 (PDT)
X-Received: by 2002:a17:902:f547:b0:2b0:7177:d5e5 with SMTP id d9443c01a7336-2b07177dc04mr45425075ad.43.1773901924217;
        Wed, 18 Mar 2026 23:32:04 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm48572485ad.57.2026.03.18.23.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:32:03 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:01:44 +0530
Subject: [PATCH v4 4/9] bus: mhi: Centralize firmware image table selection
 at probe time
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-sahara_protocol_new_v2-v4-4-47ad79308762@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773901902; l=3898;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=D9kJlDoQ6LGAQMXZQh6rystru1KGUPI8NHA/TRw7+VQ=;
 b=vr6s4lpUaWr2T9TkXlD+KdE+YQxiqHW3dkYcMsoUITH9JLmrkM1V1VinIAHZ1bzHa8OPBMlFX
 aLXDFnx7Qz7DIK4WvzLkJn0afD+UwqZPiaiR3bpdRalFoHWK91wWibP
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: 8MIlJW4EowxW9qDrIPon3Gp3ORnqb8my
X-Proofpoint-ORIG-GUID: 8MIlJW4EowxW9qDrIPon3Gp3ORnqb8my
X-Authority-Analysis: v=2.4 cv=ApTjHe9P c=1 sm=1 tr=0 ts=69bb9865 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hNMuCp7LqqrRSepR2eAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0OSBTYWx0ZWRfX+KohCT97a77B
 GRACkC6wYUuhm8pwvb7PkZnx/Jdr92ojgnc+rU9thITleeBefoSCbC86QzhLbFF4DvxPFFU97Qa
 fswyL/VoAO0CQwVKK3EjwdlTJ6bK3QoTPjioPJ2BE3LHX3rZTncHSHiiOuUPNY2isRl8a5kmDW/
 ZtL2CyyRzk8exMyqT8ktz5jblIyHnq8GJ6nY6HVK7gB5vZvNF8Y6nJcDHAxhWCs5EBHb8r3LOMi
 LTolueyZfs1dt5paHJpFS7WN2g5K42+Q3VU3l3uaV1F0Q2Dd9rIQthjxY2Js9RjoijtKtgdv3eI
 p1GLoQ6ugLTP0NxQM6oNz07e3Qlrx+0fVwGOCIU82JRJX94pi120mz2hpItHm3Z/yWL4m8c+Fc5
 UUK/2Y+ZAjHkhQGZ0ReOwIY/w+s8SbrcWVCtFItoytpSUtaIIhgSnk8/aYZpCnmMg2anK9YnEgX
 CoRC4ha28acFtdsNBxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190049
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
	TAGGED_FROM(0.00)[bounces-98644-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: A7E3A2C6D17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


