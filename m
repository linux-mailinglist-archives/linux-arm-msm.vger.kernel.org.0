Return-Path: <linux-arm-msm+bounces-91819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFzcEAZ0g2mFmwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 17:29:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC94EEA3D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 17:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A79543021D01
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 16:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FFD427A13;
	Wed,  4 Feb 2026 16:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YvwwIGUS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jhqjpr6a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2814279FE
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 16:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770222560; cv=none; b=ZPXSDtBL5NjAcaUPE3Ir6viLXKZKhfm28LuqsQrhlKki01uD7r8co4/T2zEt5bddKSAZWXTQCyTMdean+3xv3WNWqkGXOkR3NIB7aGoCay/qawFhUHUGlAYZ7NyZ/ihpVLVSM6aGxsN5O0Ih1M2aF37KNIPd6GXPEAgMFhPohl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770222560; c=relaxed/simple;
	bh=3me1SodZTkHVWGIC0kYi6tRJygZte7A7CmjLrhhOe9w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bdm/YZiCHeMm+g9gKizW5UF+ALxy+ikA/BE9DRP9+DQpZ84e3O0qsR2dMD8SbZQtMi6AwU4gwVJiylG8rPzAycpPsVTP6Bwl+Eyr6brE4gd6fqCBAoGkp+SqiaLWxRZLUJUWf+/M9oknEVW5UjukCaH6FGkXfrkO5FUejEecmdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YvwwIGUS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jhqjpr6a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614E4RPx943650
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 16:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HYH50Zm6WCw
	xpaucxpsuIwIJ6T3oQhCQ2WmmzPUspP4=; b=YvwwIGUSXTGXSY/Mlh2fpz4u/Mb
	eO05hW0d/HuBOorz3SecgKJqaUaX2U4zhBy3/5U0nrMsBlwsiVpyRY3qDRKJQ10z
	v6Dc0vQobj0Wlq1WRDl7zRhkEheaVNpsVw8CVHQyglWEDTeU9bkQPgXTGkUzgaSg
	Vb/TSsVlmiGdDTFnlS+8a/POGGqLFS38IM1eB5t0ogaRix2XrDn4mKLV+7VXEQYY
	Uktd+6lZI1bJezkA1vbL3c3GRsGaEjW/kI0vdE9UPHMjt0elF+haCuFRcPDZ2EbG
	yZmDex7GwMvuwexFidloC3ZlvTwJvLXrmmuHuZzR5xG4sFwYiDwnT3J47pA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47ja0ghu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 16:29:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c61dee98720so4198726a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 08:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770222558; x=1770827358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYH50Zm6WCwxpaucxpsuIwIJ6T3oQhCQ2WmmzPUspP4=;
        b=Jhqjpr6aj4qvseGKY2rtv891GN86LwBESwyffo/quB8PaYmMVsMyxq/nC6QkyPwWcb
         Uioqtkan4S8fmR0cJX+UtXVmXG9vSV5uVAFet3kydl0DIA0dzY6OzfNV61/rB+oHLoDD
         Lj4/VaA3q8BZsFTBLUviGCB2fSFdSQ0//xD+bArcBD9SrqJm9EEgYNXzCCKQaD1sdfxe
         A+3loZ5PxP2x0cyErOfScyXsELGdt0j3xXZj5kXMelaKgxpgx7wyUTrQk/Ngmq+jp+KL
         S2MNxDHWTukcFVgQ9nIAZqsmj104CDvdz3KMaqC/QJNzZq8+cckQ0LmX2oHQLfl+9SSZ
         XOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770222558; x=1770827358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HYH50Zm6WCwxpaucxpsuIwIJ6T3oQhCQ2WmmzPUspP4=;
        b=GRbVE67A+zKsEb42z4I3d/9SRnjwuWz+JHrNEC6mvIpMnas3avtGYTM3ulPXjW9gGt
         +/S40KR1KUgncAXbHxL34Dliukon3cBNTbqA3Fn6164nQLtqlEVYhpXhQQ8J32q/hjqK
         ZGLWzM7mIxbjTFS84Cs3Sxpv+hgje0xhLtY93PcUxgFwSw6SS/wicn80prh5WtgOIU8r
         c3QUT1TJt+rZ+L2lfIZrMkLwiKboL3h+gCoCxaVYEyKlqlnm8etS1uVNt+0IkmgSZcwb
         DJtQcKAQzrnyw3C/X7aQwVPA+/S9ZdYpDN1zwOwz7L+V8RNAgfxxhbd9qk6z9UJrOuFP
         T60Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxD0qAqRflI7ceM5/Iq3VAaAr5kcmZEdWE08rUcRAohcU1W4iPCInrFuihkpQR8i3uPmug09CG56uJNeSf@vger.kernel.org
X-Gm-Message-State: AOJu0YydTT9E4vz2I03BH3OCWcJZLeRs5MxDBnM6xIHPw6BVcCaRjoia
	okM9JA3EMAAl0nDggj5ltV2L6xGmARw/cUaEzHpcJb2cJfKFl638ESylBb0rKaTdI3rdubwaEIr
	WB2c+bIgaYLFqDJ+0OYQT4yrQ0S5FIawg94SR3P3Dh0EJjMQv08DVdbNSwYY1J+BMESMN
X-Gm-Gg: AZuq6aJAEwtAv1rMg1BxHOqZ4bISDcLPJg7lW6LvciSGyGli44633mthXi0vxLARh6h
	8cvoJXoT9a6PGSLKuEcIdwI3i1Ori74j0cRMXaaXDJ36HxPAyjiQoVgn2PLlAxsWuZpKO5cAxPi
	q/xPn3VxB+M3/FH1Cy20LYJllciKsp4t98qrxvbCz92EshpfnYS/Ef4aqeIOVelx5rhNz0wOstC
	4r5/SRi8UvMnhrW6Fb0ZyeyvOqbO+yPJ4o7DU29mRd+S3vO5wCQ7RXwISc1sbd44jLtEDVylobu
	jeC3tBIYoNXQv15F1+yuCxxk6SiZibD4OfBaOtaO0Q+1Kof3e3BfgWYVqobINadOUgYSi+uBFaY
	MNHfrUdrSSm1ABtSJo1E0Gud4TGzUUTJdIsUb6+fz/YM=
X-Received: by 2002:a05:6a20:43a7:b0:38e:9e77:9168 with SMTP id adf61e73a8af0-393725d73e7mr3446751637.79.1770222557967;
        Wed, 04 Feb 2026 08:29:17 -0800 (PST)
X-Received: by 2002:a05:6a20:43a7:b0:38e:9e77:9168 with SMTP id adf61e73a8af0-393725d73e7mr3446728637.79.1770222557396;
        Wed, 04 Feb 2026 08:29:17 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c8515f36esm2546878a12.29.2026.02.04.08.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 08:29:17 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v2 2/4] spi: geni-qcom: Fix abort sequence execution for serial engine errors
Date: Wed,  4 Feb 2026 21:58:52 +0530
Message-Id: <20260204162854.1206323-3-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260204162854.1206323-1-praveen.talari@oss.qualcomm.com>
References: <20260204162854.1206323-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RALmrBZvJLR5n1MhiU1ZuU-IqnE2_q6Z
X-Proofpoint-GUID: RALmrBZvJLR5n1MhiU1ZuU-IqnE2_q6Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEyNSBTYWx0ZWRfX+o/1+5QcI72Y
 F+BKhL3d1wVaoLV7HO5I+bgSHb28sCtVRKZD8abPfvMwJb2qD9YEEo5fvbEwdfJCqGGZi5HTpKB
 pdl+N+Iix6nasCjItRPY1UTjJH9q289lui0VHrPWAaJBezx9Pa4xsKZOlVF+ten58iaPYW9Lwu0
 s1AxmRSxTiCLW1cUlLldx7ugA+StjrT2zQBljNPBfQzEEwU5BsfPpbv4cT38CfpTFjLH6+R09rt
 ENpDFbHqhiJGLl9ynLnoBriJ0H7yVISXC8fQgb5Af0LlW5aCODE0Pdg30/pHr6hqMDqG7BRqBsD
 sEiMJPWQ2yB5oluE/txmwMB8FqXSdaVpvoUlEiplcu6GOPx9tZpqBNwg+4X8N3DAN6XaMLc5C1J
 gi/o+RqdV8z0xPuBIZE/f3PmmqW23USWOx0KZrTAHZStLqDHkFSBEmEwMdSlmp6zJ6VXtLFkbWJ
 GVZLXQdUlz6wy28vLZg==
X-Authority-Analysis: v=2.4 cv=a8E9NESF c=1 sm=1 tr=0 ts=698373df cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=PwoySFKYIoUPqChjOH0A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_05,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91819-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AC94EEA3D9
X-Rspamd-Action: no action

The driver currently skips the abort sequence for target mode when serial
engine errors occur. This leads to improper error recovery as the serial
engine may remain in an undefined state without proper cleanup, potentially
causing subsequent operations to fail or behave unpredictably.

Fix this by ensuring the abort sequence and DMA reset always execute during
error recovery, as both are required for proper serial engine error
handling.

Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1->v2
Konrad
- Updated code changes as suggested by Konrad
---
 drivers/spi/spi-geni-qcom.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index f886a9ba56e6..e48aea7ce681 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -161,24 +161,20 @@ static void handle_se_timeout(struct spi_controller *spi,
 	xfer = mas->cur_xfer;
 	mas->cur_xfer = NULL;
 
-	if (spi->target) {
-		/*
-		 * skip CMD Cancel sequnece since spi target
-		 * doesn`t support CMD Cancel sequnece
-		 */
+	/* The controller doesn't support the Cancel commnand in target mode */
+	if (!spi->target) {
+		reinit_completion(&mas->cancel_done);
+		geni_se_cancel_m_cmd(se);
+
 		spin_unlock_irq(&mas->lock);
-		goto reset_if_dma;
-	}
 
-	reinit_completion(&mas->cancel_done);
-	geni_se_cancel_m_cmd(se);
-	spin_unlock_irq(&mas->lock);
+		time_left = wait_for_completion_timeout(&mas->cancel_done, HZ);
+		if (time_left)
+			goto reset_if_dma;
 
-	time_left = wait_for_completion_timeout(&mas->cancel_done, HZ);
-	if (time_left)
-		goto reset_if_dma;
+		spin_lock_irq(&mas->lock);
+	}
 
-	spin_lock_irq(&mas->lock);
 	reinit_completion(&mas->abort_done);
 	geni_se_abort_m_cmd(se);
 	spin_unlock_irq(&mas->lock);
-- 
2.34.1


