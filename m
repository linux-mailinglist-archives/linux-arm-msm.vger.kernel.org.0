Return-Path: <linux-arm-msm+bounces-104979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMgSJaah8GkQWgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:01:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF97484747
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51C7C30AB716
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8514B2D248B;
	Tue, 28 Apr 2026 11:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R46NEpFH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KIfxg1r1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420633AF656
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376686; cv=none; b=Rw/FGWVvzeUyYLYGuifKob3yoTuebSH5AJUNCdD9EZF0A56+g7i05+EBM9i7KwJkiawZrrIaCRqrkAOtdsBafqnG60boEy4za66gWUDAo2/pf1m4T++00Vj4nF/TDp61PBkHl2Yh0k8oXZY3VC9Q9qwTzyJZb3bgWJpu8ijLytI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376686; c=relaxed/simple;
	bh=Mc8FjzNqLYO97VrVnYWJLdHqaKywApqHm6a8Iy0XDew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gphMdvAhpyZWsmWQOl2kRIt4KMuKBSIeIyiz2zMZqMDx0Dwc14BS9vRMelZccQ6cgezlwmxAC4UiqaVsHk3YHTmTv5uC9ldkOShwgdPJSR6viZ0IyCB4ssMsPm+GQYO69+VlVtejhNAlXiXFewZ+/KY1nGkGevUN9jEdh8fRQRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R46NEpFH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KIfxg1r1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7vqbY1744980
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=09BroutM/9gDoJOGvfmXR5
	KlUs87eYX6swD5gKnzJ9o=; b=R46NEpFHaQxzelKZ3rLK2p0ApMzcbhCCEPBoIo
	rGMdM6dn2PRO35xJS1p/RDlUXy/4awq6oJGFUldereMCLRnDXFLJ0PfAK/88ryhv
	NG5L/SWAK47pyMHIyqvWePPbSXZ8xN2bnWxq+mFX3bXMF2HSAvUKgfIN/ldg7oBC
	fTEwVHQdUPsyVSUxOMFNfkSTS4dxSubkN+fDgoUCLU9t99MPvAWjN06tyR8IbJeN
	UPLVChFaws720jVPgq9hEk6CHe/LGQ1rszYuoSMLxVeVERVDPGbEDAZmDeGWA78t
	GS6lyHpsDolv02vEoFZkXuD9WDoKAl26XbGcvN51fRSWEmGw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtryd8v0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:44:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b249541063so101406995ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 04:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777376682; x=1777981482; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=09BroutM/9gDoJOGvfmXR5KlUs87eYX6swD5gKnzJ9o=;
        b=KIfxg1r1ETQbGzYY0gxSpDKQ9DyHIshnQMtVysWY41b9ei4b2NZT15reeZJb4wDvNM
         J6r4Q7AsHQrlV+wi7TaHBdIsmZ7h9Pj4ciyWjQv7+hk4WgBdgWTAezIuegY4jnozenCU
         0EmCqkZL5L0PT7TEKxJpjVGZe/t2DUWqEtOSqG+gjqz25y/O3N9oN2S5wulW3HATFtER
         2jf54GoJ340M8Lb03quDfeHxBm/msybBmS9ivaX63zYv61I3yQAMQW1gdQgOvP/VjkF+
         hs9+ZLERKsYEW1klhvPkv7BW8FzEZQVdzuuVTGguX6yyj6BXKDj+nbMINJxUtYSTKUfx
         xYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376682; x=1777981482;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09BroutM/9gDoJOGvfmXR5KlUs87eYX6swD5gKnzJ9o=;
        b=NXfoO9ozpfSmCsgdrQM1AAeanlxkUc86j2easDwyctJ5gh7k6fO5yTZDnF334Jfekc
         T7+PFxkrY8YIjm1OsBZ/sAljv21Uqf38LtSylqS8R7T7GoQPJCiECo0H5+c25iCBYFKG
         KXBLrFJXBiQvvLW1NfuPRX4BuJZi3tp8HXN+vXeVFv6VIs70KDjhXCaRn7GO3vqsWZa3
         8BSeV2Ra0mNjYZspptHL3XLqobx07fYAgxaUYzejBhV+0KPYyy+MMqITQiSOR8irYf4/
         gM171xmB6BL7tAEz2ZQ2aEB3wpBGCVVzY3cPDriz5DZdIK3ob7d8o5I2DNnsukzsMBau
         on+A==
X-Forwarded-Encrypted: i=1; AFNElJ8DMoo+jS+brGbm2L5ouDH5PpV31+leDZts/MgyYe1X9vfKYQYegqYRoyjEFP+a0gNzHSd8wULZmFwidiZu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8KHlaqNQNuj1p4JrSlXtycpCNv6EHP0ICYKuuULO6XPdfSO6i
	S0rdb1vAaSrVSU6+I6quxHGbfr5sy3fqyvtILUjZlFuUgZ1DrVe5X+l9oKVbDDz94R7H3nm3VkC
	edq+x8JrVrqfX1wYwAp1BcLte+323xL+yoZFHCWSJZvdGImmez6gKXX08gz7Vy579/4IL
X-Gm-Gg: AeBDieuqahHOHpoSpVH6T+GwYoI7ElEY99vAPp1WakQH1ObiSUM5VTWKeUluJenHj1n
	bWEzB+KdaSMwpyrTWtI1IwET4CCi5iAykfsGpdyzfxPerf4UmDez7sFqtRotBi5bpdNO2Ol0Q3b
	9ZGesba3Fbsx6kLC8e2Kui9zn30fS+cSgpgLCx0MVX+GCcP4pWDJ0oXEWUG03j9Ntm1k5E3ctMa
	CucA7yEnGllnUFFNNog5zNE91sMb47CpQ4m5fMzMlKHeyPHSrSo6hG9F0diwVuoUitj7KO0mR7J
	JlcgE1kgqj8VRhc0Ttw6XHN4LuuOHdirRHKjUvLUlbfCF5pTq8ikX8HEATQy3oOk6/ZX/tk2Kq5
	/IamNSwsHt7kGpTBRJUe5f2k2bkcifQfqzKi7NaINvaywkuDuid5yFpS755I=
X-Received: by 2002:a17:902:e0c6:b0:2b2:49a7:a5d0 with SMTP id d9443c01a7336-2b97c43c7d4mr21606455ad.11.1777376681875;
        Tue, 28 Apr 2026 04:44:41 -0700 (PDT)
X-Received: by 2002:a17:902:e0c6:b0:2b2:49a7:a5d0 with SMTP id d9443c01a7336-2b97c43c7d4mr21606195ad.11.1777376681241;
        Tue, 28 Apr 2026 04:44:41 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97ac79344sm24929735ad.42.2026.04.28.04.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:44:40 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 17:14:25 +0530
Subject: [PATCH] drm/msm/dpu: Fix Kaanapali CWB register configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-kaanapali_cwb-v1-1-51fdb2c65498@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJid8GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyML3ezExLzEgsSczPjk8iTdlERDg0QDU0tDizRjJaCegqLUtMwKsHn
 RsbW1AItL2lFfAAAA
X-Change-ID: 20260428-kaanapali_cwb-da10a05918f3
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777376676; l=1593;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=Mc8FjzNqLYO97VrVnYWJLdHqaKywApqHm6a8Iy0XDew=;
 b=WpSvQEIdc9OGOio+CXTzxeFmNzf+MqRABXzaCHKZggT5hQmx1zke2pAiOD2YPMzuCllhHumgS
 KlIbH3aEGS8A5XE60zVpzNMgeru1WQI5Zt6tBV8XbaCLPllwh6Mz+IF
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-GUID: oCAAp616GdKzmvxMeQhcasiM1JOyDQqY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNyBTYWx0ZWRfX2H5nJC3OiOXA
 onpt/zffc9wSmZA/nKU4PQ3vTs/Mqn4QNXZZJPIDRXgporIOH9zbvWHtKoKNjlqEaVux7v0Ugx3
 Z5tuKoIjicgJXrtxqBhNFugoDOt9dq3fHUN56KIjSgL+PnFqsylhEKznCIDx01i7sWz0BRO2exL
 260yjNvxJ0uds4YqJdEn9Dh2o7pqVOqqNN6s/rwpk0QRT/R3QdDLcJkilE3zauSvPzlr0mndzzi
 vqEEiNB25RMpJyBfqkJHUL7If3YIxWiKpOxANSQKyRaCCiE3O8azp/QUKe/8lStHL2mNoyj/nUX
 +hNSGk3nOA91WnGKFRPsVG7vukaUT/wAIfDIp9OX287r6RA5KNS8OuoOK+q63QpR0uDcedWMHh/
 XEwsnYJAB2Dqy5xAR829+cENqOsfHLERff6V9zfP7xlwne5V91LIK4eDV2ZC/9VWmBAZHlsCTGh
 9Yx3qGp7TyIKaUard+w==
X-Proofpoint-ORIG-GUID: oCAAp616GdKzmvxMeQhcasiM1JOyDQqY
X-Authority-Analysis: v=2.4 cv=cMnQdFeN c=1 sm=1 tr=0 ts=69f09dac cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=R4znKvNRx4XoUvq0kpoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280107
X-Rspamd-Queue-Id: ACF97484747
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104979-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RSPAMD_URIBL_FAIL(0.00)[oss.qualcomm.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RSPAMD_EMAILBL_FAIL(0.00)[mahadevan.p.oss.qualcomm.com:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mahadevan.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The Kaanapali DPU catalog defines kaanapali_cwb[] with the correct
CWB base addresses for this platform (0x169200, 0x169600, 0x16a200,
0x16a600), but the dpu_kaanapali_cfg struct was mistakenly pointing
to sm8650_cwb instead. The SM8650 CWB blocks sit at completely
different offsets (0x66200, 0x66600, 0x7E200, 0x7E600), so using
them on Kaanapali would program CWB registers at wrong addresses,
corrupting unrelated hardware blocks and breaking writeback capture.

Fix this by pointing .cwb to the correct kaanapali_cwb array.

Fixes: 83fe2cd56b1d ("drm/msm/dpu: Add support for Kaanapali DPU")
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
index b7b06e45b529..06da1583fb1e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
@@ -480,7 +480,7 @@ const struct dpu_mdss_cfg dpu_kaanapali_cfg = {
 	.wb_count = ARRAY_SIZE(kaanapali_wb),
 	.wb = kaanapali_wb,
 	.cwb_count = ARRAY_SIZE(kaanapali_cwb),
-	.cwb = sm8650_cwb,
+	.cwb = kaanapali_cwb,
 	.intf_count = ARRAY_SIZE(kaanapali_intf),
 	.intf = kaanapali_intf,
 	.vbif = &sm8650_vbif,

---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260428-kaanapali_cwb-da10a05918f3

Best regards,
-- 
Mahadevan P <mahadevan.p@oss.qualcomm.com>


