Return-Path: <linux-arm-msm+bounces-63455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A86AF624E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 21:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 648E23A5D27
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 19:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08FC221638A;
	Wed,  2 Jul 2025 19:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YPexs63C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BBB1BC099
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 19:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751483005; cv=none; b=C6lY/V6JDJteQ5/nZjBMnEa+gESjGugY3Zn5ckGjAk4qJXpwrNnebeAhku8EJlQ7ax+CrJyl1Id0aUoGh1Jms6BYUUvSU7+RvZU9TYwbPsHase9zYftqpfMIU3/0IIMJ9J/XnZezjtaIFxZbpZHth4AKeSCQb3tn4r3dzbbPY/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751483005; c=relaxed/simple;
	bh=thzIBqrQ4Pb3YzwV2H9FsMbTdNK4Z2d+/wJVbDL27vU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cO2cRqdPOOV3SFvxWA2Bum0nYafB/Oox8MheQUg8S15DHQCEs+W6xQDBSbr4R6TlUveIL63yBm5Tef08st799VruFM4il78g9X2upQ9p37lKcT+5JTWTxwMvoFUZyqAQ7+mizW9YvTOGfxGcFeKh1OiQXiUgE6jsBiXl91DacI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YPexs63C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562FGSQw025048
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 19:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8zWjMM3vTvg
	rkjTYr2fejrs2ZdcqMCLb/nSokNAjbQc=; b=YPexs63CoxrF6YUK3sVamLlUlsi
	BfIio/Xv2nofln8QZiYvraQifMdCN/74+pK2Ym/CrtBkJGgHFQ8+Gr5KNtAdLz/S
	ihdCMsel6JYdJaqOsla1kkV20HRAEyuqRR7k16Qg4RPsgNEwB3K7HbJpVzSt5Eht
	m0nWf0bMMWyoFpUUWao3a4c9P0c3v1JFxCtwtV2zYJjUkM+W3lmH9/yZW6xTvvJi
	H8sAxRRuwkCB5I0Ralv0H1Np2c4BQnPHY1t2l0pfkykFz0Qw3ZbsHFivo1Zx0kag
	lWsBsyqKl+KTGVSTqWjJTpVjjUbeviEQRwVZlV1PoVMKFfmhBOj6/jrvNuA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8025jhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 19:03:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2349498f00eso1468025ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 12:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751483000; x=1752087800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zWjMM3vTvgrkjTYr2fejrs2ZdcqMCLb/nSokNAjbQc=;
        b=aj29O/NPsyX4Ee+z7Tgrwl9k9WhSW6ms1SzaVOeFuzvC56xjjFiXd7Ix6U9EKJWaxM
         YxMINfxeGPGb+mEgXHYQxH+m/AT8psEm92sjug1UBLGB+qhWov00ZwYkrBsPNw6rYLV2
         m3tNZTiaG/7gkEhHhkvsFOR/6fEMXemHA64Ty1qAGR78OIetU3vyNprXE091B1QlKsqi
         Opb6FRc2FLRydD60D/yhAOAul3CKrsYNHEQGsh8OWvkKmkXkW7hbajisq8pw1UMxKZEc
         YoW7mcShgg8nlothj+EonUUZN69M+jNKn54OgH70nS7Rmkret4/KhXkjsflnX9gKZTeP
         ncXQ==
X-Gm-Message-State: AOJu0Ywrfp+4f0AZcPAhd0jL71r8afIVdVqHecXzM0EUQ1UOIYpWplrS
	daeaZ/vdCaHI/i5kV160Gx0jkdwzmT5oF6nTACBKCmyZe5Z4YGGVyA6+uAzHaXbqWLp/90pJkBZ
	4xaRLaObkb+wDYBF7wtid4CImsOVC2Cfov9ABgPh/s0Q6zEP0aI1vpsMBn67EuD3T5QENHBXjuY
	2f
X-Gm-Gg: ASbGncvG9LRDm4lhvI1H/Pwc1z93YlSZp57imk9MI41G4mvZPIQcFD3b3pzohjXu4dZ
	jUYJwiJT1TWpDQ4RBsMauFVmFsHh7M9m9CG2DoadhG37LwY4uvyeiQhCBIP82HerKbEY+DjpbHj
	LXqFeCi/1eM9qzZAXCj+UVbOV+dxFlPX0c1W4RbK5mB/u1n4fCeq1KoPyG1W4l5uhWgE99p/Msm
	asN8T0drDXMsIac4iLvi6cHHA+9N6qAxCDEvxHlRmsLX3Hb4YO3gE1sJ+8uxl7ynwsJTu19qaPf
	7Myuvu/DonBT4aNgOq//RnRACvBqCNIKSg==
X-Received: by 2002:a17:903:31c2:b0:235:e94b:62dd with SMTP id d9443c01a7336-23c793f0b20mr8643625ad.12.1751483000289;
        Wed, 02 Jul 2025 12:03:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGIViSrY5Xq1XMHCu9BSAtE0RQhXUpkJt/6iEGJjkGtqZjQvrnJcfYnvJF9HqL7P+iJ9a5og==
X-Received: by 2002:a17:903:31c2:b0:235:e94b:62dd with SMTP id d9443c01a7336-23c793f0b20mr8643325ad.12.1751482999813;
        Wed, 02 Jul 2025 12:03:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f1c40sm137079185ad.67.2025.07.02.12.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 12:03:19 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
        Kamil Konieczny <kamil.konieczny@linux.intel.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH i-g-t v2 2/9] tests/msm/msm_recovery: Wait for devcore
Date: Wed,  2 Jul 2025 12:02:42 -0700
Message-ID: <20250702190249.376313-3-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
References: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mrIHrTygPOY-kwbqLubMc-WzbCDx4EER
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=6865827a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=wbXP5UgKaa9MPXhy6qkA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: mrIHrTygPOY-kwbqLubMc-WzbCDx4EER
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NiBTYWx0ZWRfX7t9oIcEiiI7l
 ZAev1Lj+TaEJHvKTaJ7QEFZTT/OVYnjJbn3csaKufw1ULk/nY1KEOUAS4BLqz5lI9Bdq9nEDWT9
 +KSVWzlgNxBcISRLDd+yQ7GIo0qHaxtizF2BuRBbPJLElznsTeCCMP5T32G+XzNxyvWAW5FDtB3
 cTk5hZjAukcCH5kQME2ZAtlJMsPvEGJF13yuJJuPCnI9HTc6U0/m70gToY3BGdpDKEG+xnz1X7d
 r9dhugGqL8JyJqNpdV0A56SPfH4yJO7jWSAj0j3vnyz2jPxtvRwszd30w13y3tq0/18X5UagjQ9
 hQCArypMPieyiVOJO7jhWA9ZSbFniATVNu6LyTXkb2i2Bh2gQCnWqaRXmkNxC4ORqmMUX7Is9ha
 mNkpdNwK7ub7GuZ7T2X01CjlvtBfPNcxjfXT7sKnggC0W6103hoWnn7c81G2inYXJD9zcG02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=940 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020156

The devcore could take some time to show up, so add a igt_wait() with
timeout so we don't fail the test if the devcore is not immediately
available.

This addresses a source of flakeyness.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_recovery.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/msm/msm_recovery.c b/tests/msm/msm_recovery.c
index fbe26e687ed3..433392079bd4 100644
--- a/tests/msm/msm_recovery.c
+++ b/tests/msm/msm_recovery.c
@@ -44,8 +44,12 @@ read_and_clear_devcore(void)
 	glob_t glob_buf = {0};
 	int ret, fd;
 
-	ret = glob("/sys/class/devcoredump/devcd*/data", GLOB_NOSORT, NULL, &glob_buf);
-	if ((ret == GLOB_NOMATCH) || !glob_buf.gl_pathc)
+	/* The devcore shows up asynchronously, so it might not be
+	 * immediately available:
+	 */
+	if (!igt_wait(glob("/sys/class/devcoredump/devcd*/data",
+			   GLOB_NOSORT, NULL, &glob_buf) != GLOB_NOMATCH,
+		      1000, 100))
 		return;
 
 	fd = open(glob_buf.gl_pathv[0], O_RDWR);
-- 
2.50.0


