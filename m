Return-Path: <linux-arm-msm+bounces-96180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CZrEbiXrmnRGQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:49:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B95CE236830
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:49:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B2CA302AF01
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 09:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3F63806A1;
	Mon,  9 Mar 2026 09:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BhUnyAja";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OUcJmyqF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782613806CE
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 09:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049713; cv=none; b=i8zEIqVSincEoXE7RcM+ICtdKGYxloikkTQEoGSFXbnsVTxTxyBMTE+BV3+loMLo6BWOHM+N/19Mu9QnTlIdGCRR40zHB0iu7E3c34jq9420Idc3yMZfOa5xXTllwcBUGTldtT6Sw+TKRnPcrwWZAyBloY7NOYRJk9mjoe4sOCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049713; c=relaxed/simple;
	bh=llmH4e6V3hO6E83982AsOxGjOSWUtW0WJVedEVEMywU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kQ8cOlmZGA3bCbOCMG8G+u4j21c6jC0t8o32xKfgeszXKwapslPvDkzhvYzkvcDlOO/tpaxRxQE2FfXASeTs1KolzUVAUBXI66ITkITg7vQJiKP9nbfNYbW8RQMeDTFPN/LmGOrxmFj0+tL86NqfPH1glvEG/kB8sCpb3hn3ZqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BhUnyAja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OUcJmyqF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297fGpE4080713
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 09:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ni0/4keecpjX5VSQGHRPGLdHSb1TkQhd8WAcXKlEV5w=; b=BhUnyAjaLEdiIxpL
	jvTrmaziZsrGUESQ24yWUDhSw0n+/nxKNUZyBXj5Z3vL0raJ/TyDAvOfGFMoO7fD
	oECwOB8zXIBfMYL+bFgOfMP6W5DxqimYpKDyM70cH95O/Li6i8HiQt6RcuPiGVeL
	DQV1Mehy0okpQ/rK67uJ8o7DfFeywOx2jr34169dMM70a5kJeIXj77juF0h4Jc1i
	tMI9Us9lWU+/nMMM+hgU2I2SdGhFzZj8CqW6J6gdItRyVJNiPFKNW3iVpG8YaXym
	+F/ULQWIa1a/DQAwU19YiHn+jiYVyTAzFIvAjpeEuyQjD4oaZ0t8XoF/23aV0R/A
	t4Q9LQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vcu0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 09:48:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae49120e74so75435585ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 02:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773049710; x=1773654510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ni0/4keecpjX5VSQGHRPGLdHSb1TkQhd8WAcXKlEV5w=;
        b=OUcJmyqFy/wVeIm2/rCgyDfhFaU5r0huE9Bzi0Y5ccXgJtLMkWH5IzjZmY4bWvX0ee
         0TwIBxmb3cNt7uoUa0+IiNtX6Y519tL9EauORJwpvnrYZoAyJZF4MIQwlrQd4JjC/mzH
         map51MPI7apfxlbbBNtXielVWgE5dVzaZNgtcv0GL/mc93xtYcJtRt40DI4BRDUc+/iu
         BwAzyZAnGQ/juTX0TVzFrzRiZswQv+qmDkhFmwAUOPx2dfMKyWJgzRvzA6911hwIGAym
         rrjTYNdC5n0UxvvsO8vf4gg2Y5dDMd4Ko3xyeBcI1GqsYSFTtSV6pUv5BoV8CkPqW/Gs
         +6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773049710; x=1773654510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ni0/4keecpjX5VSQGHRPGLdHSb1TkQhd8WAcXKlEV5w=;
        b=ibWtsz8hDfS2/5UMA1IfN74d8s+JAVMJWrgM9uYb8bmPf7d/t+sYMI/0RSuzPdg0Rq
         suhdChurIZtSVqPR8Z5RV1FaActYxQ6GSh5ORleGNQrqzjljq0ZN1F5vO1OgSmGC6VlR
         EjeRjsearGHNOuHKP4QVG+i2gl1O2qIm1ufZloQuoHzzULtwS4CNUT9V+UP4TKV0bcKV
         8P7zV27r0vFRCbwoCEEdfLmyGgE/S2K14sr697/S8RL0N6VJAGl0QvOqNHWJNl0vYdHp
         43MlKpRZJTEXie0VbOfI8b+JJ8mwA1N9VRMhvxQDrQCOXy5kXkJjcnRGjBL5kBcmeU1/
         92Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUrLALTmrqfJdidoo2m9EvJoX15DdxOukwfJdxtORmVX/nspBdTUqe7MIenPhWjPixVLfUfggNecFs7QxgL@vger.kernel.org
X-Gm-Message-State: AOJu0YwojElHcH/eO6L2BvNCy66dyBIhNYjCW4ec3TgiCURhDltkLKHX
	JMF5rLX40ZtWOtq9mIBdPlp4JF3YkYbG37EMlQXYkuCW9T+SBuTsUNNxyHPwnG2YaH/GmMmW7P7
	RZmIlGMqiP43M7kMkXJFJXo1ZmPnvrBFkxFd+fOUg0G1CskMW5HGinEAjoPgpNUpApJu1
X-Gm-Gg: ATEYQzyV1BYJmg3HBJi9vDieU9iNyMIbNYD7HN/Qd0FTsahroQZYsP3olTEzmVQHOtz
	wQWjOuii9Xs2ZHVmzSWu1h2tgNpeWZ3OckE8BCOQ+tGQZr8f7jtb/Vb/ckbyQ9LQtPLtYlp3iee
	U+BuPcMxvXsAWYPoQNmfHL/IKCeJ5HTgui+rUP3Mph0Wsk4EOIUS1mnvsPCdUMgX340EJYBzqNH
	LI9TmiGzpa5AaI2ZlzxIhD/MPBx8wu4Tu/a6FfLLAo0EWJmbdKqiffjpu2jwrrtBa9QnIa2IhuO
	JEXd7kBlYSusQsew8k+l3XZoXl4InAa2e8T/DJAFBIlhq9maWyQyU7ZBRclfdNNC12gOxIgSUbE
	FefY1bOu0Xg2v7LjCBCEAUeLmEbGYD6moYsgJSxy5vBiczevdxKSEnmH1EHo64trUFXm4lHvCIY
	X7IAcwVh/E
X-Received: by 2002:a17:902:f54e:b0:2ae:5b64:12d6 with SMTP id d9443c01a7336-2ae8250bf7cmr106451155ad.44.1773049710259;
        Mon, 09 Mar 2026 02:48:30 -0700 (PDT)
X-Received: by 2002:a17:902:f54e:b0:2ae:5b64:12d6 with SMTP id d9443c01a7336-2ae8250bf7cmr106450885ad.44.1773049709754;
        Mon, 09 Mar 2026 02:48:29 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm104948435ad.5.2026.03.09.02.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:48:29 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 17:47:43 +0800
Subject: [PATCH v14 4/7] coresight: etr: add a new function to retrieve the
 CTCU device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-enable-byte-cntr-for-ctcu-v14-4-c08823e5a8e6@oss.qualcomm.com>
References: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
In-Reply-To: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773049687; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=llmH4e6V3hO6E83982AsOxGjOSWUtW0WJVedEVEMywU=;
 b=ZWwvjevBRuD/l0uekFO+E3V0xCFxTSow6u0fcDJPRW/fuMwYDlO4ra1VdbrW0jw8FnH5JfkuW
 /Fsg2B2btOHCX/vyFjPgGVmo2b+UJ8qqqOk+hMQtjgHLukNIAOBhn31
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: 48ToopXomGtk_1AxnQNvP8y5F022sqPc
X-Proofpoint-GUID: 48ToopXomGtk_1AxnQNvP8y5F022sqPc
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69ae976f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MCBTYWx0ZWRfX8hzpo/GAQgqp
 PR0Grq6OFDEV9bEncdmY6zwskvdFfm6bZz02NlAQLAq9/F5V4bKLLlCqNq3FiO/gFkN9JljnUTu
 AGiChFXJGRicggbjYUcyDIeFinr5qzKKQDJTC7d22fp5FUU/RTsM45IkHRUX+Fims/eu2vTWmw/
 Ae05r6G7VeIigVEVPsUVS74XD+qZcFtsXnViMR3JQuMyVjisLeOnoloQmsr9wmOICcspY4DyhaN
 Bf3G11k76ExMim19RXGydpwMNtT5EduDl+k+iWGIT607YEL/Ujm+/dkF1KqS7B2pgeXWuj7vNLY
 rypmSjJ7GXhU9Ymx60MmfMRreax4pZQ7gGupWVEz4lSYqrlYIrvjSsYiDx4Hh6Y4s3wdvd8+orM
 VNKrx8/7PBxZMIC4+SSZeiCZ3ttdwVlhQoR7lxHkyEbPOUblkSCSMjusv2pAMcxGCtKzgPRh97V
 mnfmCK/WqW59Tim5ttw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090090
X-Rspamd-Queue-Id: B95CE236830
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96180-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.971];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 15c0874ff641..f4223215ef8d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 69d55ee3895f..aaa443abe8e9 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -470,6 +470,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


