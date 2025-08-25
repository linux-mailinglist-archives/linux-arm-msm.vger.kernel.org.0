Return-Path: <linux-arm-msm+bounces-70557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E721B33658
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 08:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DE42F4E0387
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 06:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EA71D63C5;
	Mon, 25 Aug 2025 06:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHEA1Xrp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088916ADD
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 06:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756103059; cv=none; b=GA/3+6DlU/x3/2GQpMW2smhllRC+lPAtWzSEpqQFAdsxC64W5rRwFbSAzTU42W6O+yGgpm8uZxp+YmGKhZ1A2jh6A0Mnh1FRtz7M2aqfkfBPmA+QrkTObVk07iW1cSiHeaTfMKI2CSxi7w2xXhYbemsR36aufDQnJ2havkSRFkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756103059; c=relaxed/simple;
	bh=pDV3esVJ37rJHD18/1+4VVJFAEYwPV9WfltIHvbPOZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ur2Vp7fpHsHlHEEWC5kM7e3dRAlP24jZuHgLcAfi2K/4YSfvyBx+dHpSjAWzkPj3haEo/aLDhFUjwnjClRDFO/UFcmtoFkfLTSOPaIrOSbK6+g6I5gzRuOD9yGEVPpWJi8mf5uUphjNhJs26Z4whxyosOIImW20c5CUaHalFaeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHEA1Xrp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P5miGd015139
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 06:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6ot9aWQ/lqtBBBdIX+BGxm
	TOjLUKh2Pk/IoKU0iqgKg=; b=jHEA1Xrpsy2XRkZD9a57ao5T1DsqJy86a/+FSJ
	K1VWqsK2MmbZNvXo3W26lhJc4TP/cU1ih3dZ9cTJJhojkPdilqvOl9ZEZT7uKaU0
	luFiH9UA2bMobcAP7CWUxcF7KOgt3a+gq7McxckHSJ2Y4syAzJ1uGAKCaTyO3NDR
	hflBM4UF4NzCWlS2MDy569+Gx7Pn6hPqCZW9hAtI+GsZxnV0JgJfkAPThIJP0lpe
	1/LCDjZ9FOeWy9IaqK7lOAR9gMdWw/Q4Ob2ubZcC33XPkQXNwzpbnnIcv49eAxeI
	CL6A03X6qYafthJH2pnqUwk9Moyoqy4hrR5x3UgRYo+Y8DNg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2m2x1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 06:24:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3250e3b161bso3437908a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Aug 2025 23:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756103056; x=1756707856;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ot9aWQ/lqtBBBdIX+BGxmTOjLUKh2Pk/IoKU0iqgKg=;
        b=n7k551CiQEmKv5VniiAubo0cOOwuarTT2s2aIaKjcGZBjPf//X3z4fyJtGJz+Z8WK7
         Sr/jUV02pZlcrI6P5FBBHxqFxAniGmL//MDQtEfhAFQ1gUf5guULN1Ed06cmUcqHPP82
         zx+DudhFmBg5H3BnSO6IlE1bVx1zowHUEiTGmsU9QIL/7VMVQewfve3FQROxp4/gAWtp
         jBfN0fKxC1v5etmfyHt8zYUAPOr2dxIWLDzsJAvQhOI0NV1Omi4/UMQFAC+Yy+RtFWGv
         nt/Ysk3bS97WbIdd5k5bOuaJZL+v1eHRVhP3N2M4N+0rxiT8mGCjLypuxSmlMNdUG1l4
         7UpQ==
X-Gm-Message-State: AOJu0YzTCggZHEbjqsGM3/0TJ4wYu3YPPtODMDo+AWUjl87LTJ0DzFoF
	Ny/IZt3dXwCjS2WKInY0ZVwke9aU4xxTvpuo3fLL1N7oqw7vXbj9HXpjxkBumvCJJngL/qfWW3B
	W4FLxiuJKsi5MTPGovLmpGo7Ctr85sqSFZKMGTbOY8suBX8QhcRYxm3967kyfP+rvVK5y
X-Gm-Gg: ASbGncsO3+YH9K/I2Ri0VoWBDKi5oYIuOM1ZHRYy/d1WSBCRoMaGqj7jjkEOEYGITWx
	l+7NxtHZUwfEVQaSJhxa1MRk8DudDzSw+rwXRBks5rPwakeiFeIQu7I0zgVF1qewNUCvCN1aeHn
	mP7FoTwvOqx26OB52sSHW4DvXh7yqf4+XxN19GLXoSsrADiLNnVtdnMs6eC2uoesktVj8R6YvWF
	gqI29AFZVz1fjZuy3TQasNgIsK5w7uCiB8gU8/8QzCRuRLelCWW3FsbZLqvaX47jeBESbX4ED09
	SRiIb53YHexp7hhpLem06OgzQVQH/b6JN20PZTXMe0bOosPRPKI6jR0D66utoz3ZLVbH/w==
X-Received: by 2002:a17:902:d54e:b0:246:a8d7:5bc1 with SMTP id d9443c01a7336-246a8d75c90mr61906215ad.39.1756103056401;
        Sun, 24 Aug 2025 23:24:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFu0PgC9kFgAqymgp5aXUs7Sk7dTEZYh9xB1L5IWXynoemPiGcLKopnUoDmeUBnPBnxGrJFqg==
X-Received: by 2002:a17:902:d54e:b0:246:a8d7:5bc1 with SMTP id d9443c01a7336-246a8d75c90mr61905955ad.39.1756103055944;
        Sun, 24 Aug 2025 23:24:15 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687a582dsm57709455ad.36.2025.08.24.23.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:24:15 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 11:53:50 +0530
Subject: [PATCH] soc: qcom: rpmh-rsc: Unconditionally clear _TRIGGER bit
 for TCS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-rpmh_rsc_change-v1-1-138202c31bf6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHUBrGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0ML3aKC3Iz4ouLkeKh0oolxqolxYrKJRWKiElBXQVFqWmYF2MTo2Np
 aAMniJLZhAAAA
X-Change-ID: 20250818-rpmh_rsc_change-a43e43ac48aa
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Maulik Shah <quic_mkshah@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756103052; l=1606;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=pDV3esVJ37rJHD18/1+4VVJFAEYwPV9WfltIHvbPOZI=;
 b=uzasWtRhJpFwi0bwMC+7XNu53NI0g+1A1LiAzvNRTHnSoXrFB1rjqbNTmoYGRFfUF8FpvflaD
 0vJ3yrVITf9CyZddjYjm5A4kF1YuXES8t4RLjyJku4imoKOiOsIsqXz
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68ac0191 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=FMhGUQ7S-oBDvu04OOIA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXz8y/D9xhEqPN
 EvLNP50g1QZ3Vz0+63cDppZh9rZnHWKAtbpxYMQPTfJWGenvpJY9s8pLpfmJGkUhCXwZPOIx+hZ
 EpW81qovKW/mfhMBJHDHJFpAhp8bYNCYs2c2GzPPrV30KaAJD5FagqE47voigflWAZpn72HoNPt
 C5BdqPLAXROg3hIwFzX19GlGKOvAIsxkW/BSGzpAEPhoW8kpKjj1PRg5xyBWixgDMwiIJnllwMF
 VjVVVFMhkmZYKvfvAbyd17+5avBvEaksrMgIqDP4OghP+G2MVli08wX5IwXj8s3ykfg0oUxos43
 rCQqULoVq2J1JyU24MjGM4s5vJ2ZRUWqvVfJeVjXdAFe72Q9dWO2fvpvvNJ9TktzN+JF028S3dU
 LmuJlmD4
X-Proofpoint-GUID: zibsWO8ep03WK8RIykt2Jj1L4OR1xYp-
X-Proofpoint-ORIG-GUID: zibsWO8ep03WK8RIykt2Jj1L4OR1xYp-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1011
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Unconditionally clear the TCS_AMC_MODE_TRIGGER bit when a
transaction completes. Previously this bit was only cleared when
a wake TCS was borrowed as an AMC TCS but not for dedicated
AMC TCS. Leaving this bit set for AMC TCS and entering deeper low
power modes can generate a false completion IRQ.

Prevent this scenario by always clearing the TCS_AMC_MODE_TRIGGER
bit upon receiving a completion IRQ.

Fixes: 15b3bf61b8d4 ("soc: qcom: rpmh-rsc: Clear active mode configuration for wake TCS")
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/soc/qcom/rpmh-rsc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index fdab2b1067dbb13efbbef5cc3ef795a65fc2d6a1..c6f7d5c9c493d9e06c048930b8a14a38660df4b1 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -453,13 +453,10 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 
 		trace_rpmh_tx_done(drv, i, req);
 
-		/*
-		 * If wake tcs was re-purposed for sending active
-		 * votes, clear AMC trigger & enable modes and
+		/* Clear AMC trigger & enable modes and
 		 * disable interrupt for this TCS
 		 */
-		if (!drv->tcs[ACTIVE_TCS].num_tcs)
-			__tcs_set_trigger(drv, i, false);
+		__tcs_set_trigger(drv, i, false);
 skip:
 		/* Reclaim the TCS */
 		write_tcs_reg(drv, drv->regs[RSC_DRV_CMD_ENABLE], i, 0);

---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250818-rpmh_rsc_change-a43e43ac48aa

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>


