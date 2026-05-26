Return-Path: <linux-arm-msm+bounces-109902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKsYK6jXFWpYdAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:26:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B212C5DAA02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D439B3014259
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB95B40F8E9;
	Tue, 26 May 2026 17:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/RNcKp0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HhxmCh8T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E339407566
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816086; cv=none; b=q5nzsExloizH5P0gq9fXAxINVVaselEP0I+wG92WdeZTkT6CdPqPmXrHbewRSPU7tpTJpvVsyUyMVyM1nsTHufDEZT+w3DpJrE1R+vjrsskDZDBsKJrRgvxxTKwH30fW0pIAKuy/OgI7ew3kuSUToK31Q9i9j8tfoB3Lx29F3H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816086; c=relaxed/simple;
	bh=yjG0ZkPea0MQZB8Ro4nwY9C+0MtvN9vUu7BaeyXSwZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KDvzWV3IIjo9d9FNv+95ClDA71dXfVR8aV9t3R92cmUIV9ozcM2/4PC0t8+pbGXJEFlrgdNKwF4ZcYAIAqdHkjI6QHKUMHQ+ou3sffIE0xOLLBR/kFtTdo2mqs4HUlrEDdbLsv6yXRMNOc5OyQ5Gzot1Chg9JTQUi5AF2C79Gng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/RNcKp0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HhxmCh8T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH1dHl3147108
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YXwhiw58O1/l3Q2qihgzAE
	f9+dmrEGGZSXucLn4h8Po=; b=O/RNcKp0Ff0VJITtlIWt86SHvPe5nLsD/zWJFi
	ipEwbmm+peJP2FLeGsa4GhfTkJQowVfeUAjMgM1pIL+7YUGFx2f3FliTA724bLZn
	PEbWm6JNVS0EEU1PEh6nVP1cK9D0N0ThoZwFeU6hmsTSsnc/T5Fs+WvOCyuVybaW
	D3lUJUysFSWZv2xZqKtTdvouItwSL1Hisq2ZQa4wogiTW2KCFIGJJdtAli7TtLmx
	ay12rItspVD2Trsr+h5l9xniKxKD9agoRJUMlglt1D6beRGADqR+UmJamQnEBQuk
	YyKEfbtE4mI75a8q0IrCCNtnkFoD26c81nTqIfJmKQRzEVrQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3u5xb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:21:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba86e35aa1so172558155ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779816079; x=1780420879; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YXwhiw58O1/l3Q2qihgzAEf9+dmrEGGZSXucLn4h8Po=;
        b=HhxmCh8T63rU4WY6W19YXavtGJrA/0PxzYIxsyWZxhv56Xf/JW5JxML+f5ByiyUyo5
         tIPhm8U4fzIIRtU03f4yy8pcj44q4piYb+3VxfE5msFrLN4/pTuo5ctZ154om3XsGQr9
         1eHgTXsZBPZrlgxwJJKVg6EklzIk9A7TipKLpO1nK9xodSGs/nqLOF7Hc67V6K8wOBb/
         EO7FxJQ7k6vUWdeHB8+ItushHNLTtQEPTo3CkGeGAV0qahcfGUW6UVXtwEVRTMf3fpjt
         x8dLUyF81QYGfGeDIXS9DVAXrv1rvILvYsun/oZtn+HB4pSlLITsbbP88n9BTXaVOZud
         mT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779816079; x=1780420879;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXwhiw58O1/l3Q2qihgzAEf9+dmrEGGZSXucLn4h8Po=;
        b=Ac6av66xj5TKTRrdiDMYXZcNLFW2gkAwoehwwg3lpa+pI2theCv7885ogxOwScCK6P
         SCJmBZ0xOWLM5BZQK5U6GNlcRG842FiQRIYs8jBUKtmUq73qpTDdR9NLrzITDaehUktm
         OqhPL5pxN76oU+IOyDIj/9ey5wO27NKuXLyCosFHMlVuhxQvMHQDdPqz9fLjHKaUQ/zR
         mNUAtEPDihBbmX1bqnoh2iXraFtVUUX+werpvCqoJWt1r4MtCoqe++acGXnI1I5mD1AW
         3vyrWgXd/w5xIUwmzJPvL1mw7v1bqikpES5KjXGdMguWYo196vhOQ4+ReNijdgVtUeui
         lyEg==
X-Gm-Message-State: AOJu0YxNigP3nAlOrlHXb30wT1U97oI40Vb1mjn2gDP6iuEFq6o6jANJ
	xTgU3shUQ1Z6D/oD1hMASXL4sB7pd5ZZhMLpQtrgjN48TK6oBmRdVHupfTBz8kWgwZ7R5cBYSKc
	u6xGA5U6xlMHOje7kPxLHDFVoE6AtONkokxqslz+aiYM+g4oGO7w3XNdWXJYU67U3H6jozPzgdP
	u8
X-Gm-Gg: Acq92OGZMXTQC2L3VzlsrUWXsYO/h9snt0U+kyno3ctxFOJ9Pe8eU5A0abvSrhpPidT
	RA4vsZ9dvkkK/bgR2dOWds1iJfNXPS66oROQsgVS34R9CDzF6CNpMim5H/BZ4cpgzHfYwEQrtdt
	y5WGMLMBEHFxKQVDmfN1y6lE5AScD26wef/jCYL1yUoB3AjTz4N2fwokSn/Q2dHTVhXiC7LrmfJ
	YUwz9lEMrTc63Vg3RAOeMyHNqTM4LuMGUi0n6a7dz11uR+olI/7n/U0OPsn/7OgbTfcf8BNDBl3
	tWvjpegxEaSUDb4CBILkThiam+IIAuXShUsLgyR1az22S2nfGzjd6LtOylZzm/YIcwQFuxgjQa2
	R98hd9V7QTcq8t0HUOGtcURtrLJrqQjcT1za+shEifc79
X-Received: by 2002:a17:903:2284:b0:2bd:412:21fb with SMTP id d9443c01a7336-2beb033eeeamr221857235ad.8.1779816079324;
        Tue, 26 May 2026 10:21:19 -0700 (PDT)
X-Received: by 2002:a17:903:2284:b0:2bd:412:21fb with SMTP id d9443c01a7336-2beb033eeeamr221856885ad.8.1779816078749;
        Tue, 26 May 2026 10:21:18 -0700 (PDT)
Received: from [169.254.0.3] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695b83sm120401815ad.9.2026.05.26.10.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:21:18 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Tue, 26 May 2026 17:21:02 +0000
Subject: [PATCH] interconnect: qcom: Enable Shikra interconnect driver by
 default for ARCH_QCOM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra_icc_kconfig-v1-1-c589db2d023c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH3WFWoC/yXMQQqDQAxA0atI1g5oRKVeRUTSNGoURpmoFMS7d
 9ou3+L/C0yCikGTXBDkVNPVR+RpAjyRH8XpKxowwyorsXI26RKoV+Z+4dUPOrpHTYRlQXVeIMR
 wCzLo+zdtu7/teM7C+/cE9/0BjcEB/HYAAAA=
X-Change-ID: 20260526-shikra_icc_kconfig-97aa253a7132
To: Georgi Djakov <djakov@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE1MCBTYWx0ZWRfX082jA4x1tHBx
 jWaB7PnszdmSkv+4m55Pl5TYAtwwJwQKqH8bDoz+luo4ct9PV/Iz+V+L3mJFmiVIOazh7j/Tl6e
 xcDk3Km+i0A6UsUHmQvRW1H0w/Ku09erB41miFm6U0rcZm7lATsi4VaGgOZGB8Ejhi4xx1QO2YF
 KNNShX4xKv2IngpUgwIO4Zt2QS0fxOkg0GLMRYn72DqGWdqg1Fp3V+QmjB4oJ4K+dSmwo5kylHK
 2KKUWJNbQpliuHIuG07R+dtkNIGCVHliI7UUw9R23iaaa36Fp8pEplh371EJbCx5DtHPsnPURRN
 zI1tciGpVMQfghc/21SQOBGoj1BqpBolPbrOfsgYjR1PbHKip/rOCEBnfCiNPyMEkIvSp01H+UB
 9CQziw1b8IAe9t454kJh2t1jPOWKNevr4bYWV44bAkIj7qdLDcSh7CwcXV/ydD1nj3mKRH8HnlI
 LcvQVMsisIcu0EvC8hQ==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a15d690 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=oqfpOdYIzx1nRLC6xSwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: XcmVC-SkZaKW7RNprTenQw-Osj2HsWES
X-Proofpoint-GUID: XcmVC-SkZaKW7RNprTenQw-Osj2HsWES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260150
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109902-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B212C5DAA02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Interconnect drivers provide fundamental NoC bandwidth management
required for correct system behavior. Although systems can boot without
them, power and performance are impacted.
These drivers need to enabled irresepective of the board variant, design
or configuration.

Enable the Shikra interconnect driver by default on ARCH_QCOM by setting
 "default ARCH_QCOM".

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 drivers/interconnect/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index 5b8a094ca4ed..baec7eb4c24b 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -333,6 +333,7 @@ config INTERCONNECT_QCOM_SHIKRA
 	tristate "Qualcomm SHIKRA interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	default ARCH_QCOM
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on shikra-based

---
base-commit: d387b06f7c15b4639244ad66b4b0900c6a02b430
change-id: 20260526-shikra_icc_kconfig-97aa253a7132

Best regards,
--  
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>


