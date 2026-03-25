Return-Path: <linux-arm-msm+bounces-99786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OpbKj50w2n4qwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 06:35:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6F931FE23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 06:35:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2A773039EEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 05:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4BD82F9DA1;
	Wed, 25 Mar 2026 05:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+MD7Rfe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f8kEeoBD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF23279DC2
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774416954; cv=none; b=FeIsdMJ523c7KwQIgwjN80CiEXzwGpdJ2cgOaa4YmAgEugbPfuCsB8k55hjUcXzQmBPUcdVcqtNAQMLV7Bc3XEbasI9iE+S5gK24akSQeXkYYG12WP6++k6+phMvAeAaBfaqhObVC8DxAPcaoSpE4MsOFZdI3et3Im+jXk5fc6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774416954; c=relaxed/simple;
	bh=6SYrootL3V+BiYl0EiXK7X+16sioFaPUb6abtFLoYf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RKU90WCZO2A2pCwp2byVq+FuTAfSxe9nEVfvekJyM6ASh5bszsQOxJkA6u30FgSOqPBFstVrA/4vfB1S0JSBLOedHT4vqGXF7FHUPaECNuQsO5WGtTJ7GTTlWOH1PI4EltCgprE/GUUUmLS+8SyZ9vmGV9BKCk85v87siVuAgwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+MD7Rfe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f8kEeoBD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OMeu463420001
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ah6pnoecTpRh+rlGM17uJM
	CQiJAf8kmPiVhn1k1UV4s=; b=T+MD7Rfe8C+eR5bn61S3co3W/JRsaetdMyeHgH
	oVdmeeSnvevrOPEg2iEELkzXHH7OyoAnpAqE5OvouKUBFbffQeHjPAgrODPeJ6ff
	VPrTnZ30ocMdD6LKigws0/wmxycqaCLdYAVMVaq5yALoK8mvU5QmaDuE7JBt1qVy
	2GgvhPdr1Y6StxvNn+3HVz6TGG3rM9F9MI8Yyy/BT7OR3RsXbik1sqqwtI9sLQMF
	z4dL5EqeIeAF+Xi7664r6hasPtgiPGWbKhlXQ00dXkxIq1p4zI+ruG3o3lC8tl6v
	vvZnNJMJzhUZJ0xjJebUpIWx8KwIpgJ3h1ZuN466mTsw4nUQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40f4hmtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:35:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b34223670so18220141cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 22:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774416951; x=1775021751; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ah6pnoecTpRh+rlGM17uJMCQiJAf8kmPiVhn1k1UV4s=;
        b=f8kEeoBDlLdKe9icVtVHYhqQ4vz8m1YX0W6a8v/AUi/Ly7o7uQySC2c7e/7hP1kzWV
         2VT+KmlIdOxdGJCWsmoahHvoGtL/DCJUYgaGtzM3pnpVwjJavIkjzmL/93fofyfLXlwS
         ez0Bh9fwWRb7fBRBpyhoIloPV0HNu1FiBs3tOGvsmWRW6C+XLVJiBLLG1Ef7qswDmfh2
         m/3ZOrGqd/kkJbyHVa12x3ekKRczZ9b+N3zJnP1HstURyDCsqghRhHezciaWHBDD2pk6
         ejB+jTAWF4AYjDuaf5yaOzbZrhWHIDc/xkrTU7NIR5ERTuKruEjNfrB3vE6+zdTj+GAR
         3/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774416951; x=1775021751;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ah6pnoecTpRh+rlGM17uJMCQiJAf8kmPiVhn1k1UV4s=;
        b=g2CoFyzYA0NBdankZPEcnPSRD7K6RMUSzXPWk0qVw4H/FA/OsblMu/zU+5tb1K7ijL
         qo5pV/ny9Twxg6cgrdOu6nhpLvarOvv6oBuQ94ZITt3epDCaVbdJOYiGolcmeRygP9R1
         DZl0DeHnZqhaq9GDHfNlOAjm0Bu+fvclVl1GtKKkK3TvPwRERNlJqXv0p0oga4TMt0Xd
         vaOG9+1x22cEHacZbQ6iDNzAxsuLPHo7Su8VYPUdKxtMMuZLjIDdCNAJcgDKLQChlluL
         qaCfxURl8iUydgzN2tEa9HxfzkvxbAIDW/ji8hYGqiJUNEk3Rge75cdQ0nyw4KO5j1lz
         U2Fw==
X-Gm-Message-State: AOJu0Yz7vo0IEzvRDbBJU52Zbpq5unelTT9JpkT3K02GRMHWYyAIPWK6
	8/bEXDgV3Voz3PfBZm2iwd9iXvDZICTGkBqoTlSir5kJ1+seg1foh+EXZpQFa4/msSsG+7SU4te
	WuAZ7UZQMOqpcxMDGg8YdutcRVkaAbUCFyaj2n/mNDc1Jvd4zOzYxJuWSrNPd8U94bOULflcCS6
	1a
X-Gm-Gg: ATEYQzwObs5sg1/I1KBzti6cp+DJvy6o/lKCZzMNSPMh3bRXNnlKSzxuaV9oZAP1V7i
	Q6UOXPTTWNna19OUpdl+M5s5GV/FKu+20RniQ64/mW4vtgtHTCUikZvzlYv5W5f7fE/mFSlFNuA
	WCRHZYqYo8Ubi0VwBue1BLjEPZTNCokc4CQYLXCzC3Opll7vM7IicAJ+8zMXo1gbUszZ4/caX9D
	41fFnjTODenAMdTZWvA4yLKA90VUIZyWHTYluHNvBcWTlCOKcxwJIGpLIuheikBmRFGaCREhaYk
	kQE+fBx4498iDIaLs/HCid329eRE9+RTlJusFtlLVEJQhXgs+UFWdEUykPWdS5WjaLDomwymQAg
	fpCMjorSkQ6Sn3d2vz4etmU0mO+keeRAObR6ZCIjsPCG+akb6IA3kKEeJ9IVhdjXyqPRDAy48yW
	9+d9FvpOMpfjaON8R4d2EYyRsUk58dXoIJM1o=
X-Received: by 2002:a05:622a:244b:b0:50b:4f56:f6f1 with SMTP id d75a77b69052e-50b80de2459mr30344931cf.35.1774416951583;
        Tue, 24 Mar 2026 22:35:51 -0700 (PDT)
X-Received: by 2002:a05:622a:244b:b0:50b:4f56:f6f1 with SMTP id d75a77b69052e-50b80de2459mr30344811cf.35.1774416951166;
        Tue, 24 Mar 2026 22:35:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207454sm3572766e87.48.2026.03.24.22.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 22:35:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 07:35:44 +0200
Subject: [PATCH] drm/msm/dpu: drop INTF_0 on MSM8953
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-drop-8953-intf-v1-1-d80e214a1a75@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC90w2kC/yXMQQ5AMBBA0avIrE0yKhVcRSyUKWNR0iIScXfF8
 i3+vyCwFw5QJxd4PiTI4iKyNIF+6tzIKEM0KFIF5Urj4JcVy0rnKG6z2BEp0oXRbCzEaPVs5fy
 GTfs77GbmfnsvcN8PNxJdvHIAAAA=
X-Change-ID: 20260325-drop-8953-intf-a002056b5ebf
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1299;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6SYrootL3V+BiYl0EiXK7X+16sioFaPUb6abtFLoYf4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpw3Q0Dj9yZcEq3K1bh0Ph4u2LxWZYG97PFR7O+
 /60a2ZiyWCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacN0NAAKCRCLPIo+Aiko
 1QQUCACCaKQ9oOfC3Y/Kx/OgB5O+vcQUoXkjhsqUsRQZgrUNzfo1B+wP1QThX0/Byc7XqUgPjbN
 CqtUdcmXfwOdyjRfmHJ+5Dl/W8XF6zAD3T5bGl41VmxVYjrmI7ZluW+l30UzELOgenObG6vC0k4
 TyJPe/RDy4KJDbl155uTbLrjsB35RXlv1Wq8aYjWYd2kje0Gg84iIvU2349Qvtz6aAsMQhzn1nh
 GRkflGHu33rqFDKS+Lc9PpgJ2UuH3IkqvwLL14ca9MOBhf9G6h3sdA4Dw+fbC+IyRu1cEfq5IgM
 /C9peAvl2Rsja7Bcmx6jGc4h0KLpG3yZp0fFNKgyW4MHOq+Q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAzNyBTYWx0ZWRfX0LTy1VlvUsJ4
 UEdqV4FrCxE2PAXmdtIllzF9Tb7wqDVNZB3nVbtwe/On4AFJGdZIBAeUhXzPdnRB1z5/cMH64zw
 iLI7OL4ELHAuatiFMJpx5db4uQmEYw6/CkqEzTOdmvc90gVcuSdT3d4KuNzJrpH6Rnpw/6/WsBb
 AILqovOHahb2UDe5Q3x3thKSV7qjW74HevWtrngrZh++bbMSzWD/K+o7t2ayM6YWm7lXk9WJXaz
 XPJFABd/XNUBHs+/VOGkOJzipR5CW3WhkekAVsqUccMVh4cjRqmohs5vo4/TsR5rmWAbOCQG3Mz
 0B++iyJh37Lwrw+20BkAHQy5mo30+nglVwqwUE9JMDqfybVwoc8mDbFR4JLLxgym0hwV7ErZ9gz
 hK0/AE/n97howLxy4tgp3VdnRmJ8BKa+la/33AGz0HkJyIYU9OUHod4hANi17AhIJl/GGJG6etY
 r6zc35f/iodb/DmHVQw==
X-Proofpoint-ORIG-GUID: MsMCex_AUELxcN3BM2JVRiYkTubM0w_m
X-Authority-Analysis: v=2.4 cv=Cd8FJbrl c=1 sm=1 tr=0 ts=69c37438 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ncbHsLySchLQHkEGmEUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: MsMCex_AUELxcN3BM2JVRiYkTubM0w_m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250037
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99786-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EC6F931FE23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is no INTF_0 on MSM8953. Currently catalog lists dummy INTF_NONE
entry for it. Drop it from the catalog.

Fixes: 7a6109ce1c2c ("drm/msm/dpu: Add support for MSM8953")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index b44d02b48418..2162ff917b0f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -121,13 +121,6 @@ static const struct dpu_dspp_cfg msm8953_dspp[] = {
 
 static const struct dpu_intf_cfg msm8953_intf[] = {
 	{
-		.name = "intf_0", .id = INTF_0,
-		.base = 0x6a000, .len = 0x268,
-		.type = INTF_NONE,
-		.prog_fetch_lines_worst_case = 14,
-		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
-		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x268,
 		.type = INTF_DSI,

---
base-commit: 6efced27f5df9d7a57e4847fe2898cdd19f72311
change-id: 20260325-drop-8953-intf-a002056b5ebf

Best regards,
--  
With best wishes
Dmitry


