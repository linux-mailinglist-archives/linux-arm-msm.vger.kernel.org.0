Return-Path: <linux-arm-msm+bounces-109236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGrKGcwtEGqSUgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:19:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B62E65B1ECB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10ED8306BCF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA4F3C8C5D;
	Fri, 22 May 2026 10:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVtlyU7m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMR40jmR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F733C5528
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444761; cv=none; b=EGTVBF7X2lRDI9lZ9gAcl0FyoLIDWG3V6CYstmZSax3HSncpboUgPS7tPJbaEgUSc5ouqMMgbGRYcVdtAebbnEldB/KX5ERcoQMoV217M7m6Z80kE8FXsAve6pDRVje9CpKEaj7FytiYI9jPnWwI6vi8aW0hMkCYfCkHGhcQX8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444761; c=relaxed/simple;
	bh=obY0yd9A9w1nKiCc00V/sWC5PfbbK/PzpgmtQExUcNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sScCYcf8GiY4ZRw/etF/gPwzzyE4RBnMNSN+OpfC3gyzZlb1AEbuGL1kx2dX8ghGgTgBeOK3qwtogMMcBtM6F6j6D/efETQj07Q5xLhxdbs+5Vvl1J3ap/uzs8SgsquQA15gaivqekSyGLhcJqNz8wTUSrwjX6sQWvwIhtH7Z3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aVtlyU7m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMR40jmR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M96VJN3532232
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9dYck4F1ifiwH0J/tkMJzJATF4TXnrW2srpgDnF4SLU=; b=aVtlyU7mQF+q/O1S
	1s04tHwI4DI6ylk6EAp4BO2qHva42VLz1V/Ejlq087p3/nTCbuE92byMZnA9fylV
	nu1j9+YacCsHELOvlfxUb03c44tZe4gRbhK+3oN7aTXp4hZ7itJXKvJPUWmhj3pi
	1U5QEDSzgCsWndExIMmkqkguioaXwwVJIBEvTxO5SvnUIJQJ7qKNSh2OQhYKmyNA
	24LvgUwTqVlOsGEHoLrk/dBU30/GH2XF4QHYcjE0RpgA3I6gM59AIEPo8ZglKWF5
	RaT2uikmyaW+TKHiNjBdbXS1IoyewaMCSuPar7om/Zn3fZ6fhIGyW6cptlQv3Igk
	0ZuU/Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gvjjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:12:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2babbeff9e4so78254245ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 03:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444758; x=1780049558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dYck4F1ifiwH0J/tkMJzJATF4TXnrW2srpgDnF4SLU=;
        b=MMR40jmRce7Zqq7WG9AyYq2Z9ZjkjyH0qi40ixhLXEI+gk01Of5SMbhxYyXO94hhv6
         zKszjARy/pD4P0mfSiLPhThM0Am2qi44CNcI92ndcp92p7WrUWowvKHCZo8Teypi3xko
         NxC2wMPMFYKxOhA9yb0/LJf/ZhlOjH2jP+GJTl2785m43OJhbLn9tvJbz+Ucxwdy2aTU
         pUgqG4X/loIkxPbOkWDGjPAOJUMtAStBrgiY0S6cbxKeTWtLqaoIpy5AMLo/hlCyDZjv
         i/uwhNvvePgNBlucKi6NtZTolyOBzE4sTgnyHM2pH3JwijMJFEpAmW/Ya/SLgST7IK5u
         inMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444758; x=1780049558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9dYck4F1ifiwH0J/tkMJzJATF4TXnrW2srpgDnF4SLU=;
        b=FvKLAjkMcD5ge6i6NdkQG3TabUFzQKMXOQNcKzPTOefhcAtijq/9pSd0PFFa6WdopQ
         xC1K+2R6AEvf1QiOd2f5lxheC210EY2zayAgggNPY0s2U7HF73oV33moDk/ecXTyiHxb
         7jgt0Rw7xlh15TXJDN1Rs+3zSGM189r5S+EGJC/qnQ0Lj0Z9dA62cEoJOLPaz2oJ1qXk
         tbwq1X0aVx26ZMw5L//RoSHg1jATwyAB43D7Jj+buvh0JmzPinuNywujkWKFGZZhQVJV
         jC8wrIoeZTP1E9lxCP7Q5dkuiVmP7am68IugCEGipe0+YMoEyEF1Zp/zaWAMpgx8a1it
         iCXw==
X-Gm-Message-State: AOJu0YzzjGIKC4WMR5G9Pjz09ZVXRux/WgDneLW21h/MVE2nrlT6WDS3
	I7vL8FxLt+fw16b7CoU6Ga0+q/+rxbrf60gQrkFT/pMs8FDvH6uT4R8OJ/eNdgXvsHYjNzuM5N0
	77jgpyOcnaDwxaoTtdQnrsJtPqR5zfKazFaRAfwb79QI7aHuGMT8JWKV65QUW7C9C9TPQ
X-Gm-Gg: Acq92OFtN4fn7di/WZpiGETWtD+5aK8MC4Ua8xY1jVZmjMGQHfH1Cm3pw/b21f22ub4
	RJJT3xaKROZ4jpL92KHdsBX5yp6E+Tr0km+64uMozzyBN7E8Xj/8dJghNDuvPjk2Xy5jzOL9HtL
	uP/RBJ8wbaFwyfEiE3FEVQh9HkOuQK27buwF0hrgPhs+WExKo8BJWLI0guzUGILm4C6zhNcrzVw
	5+oxIVqsTg2BCdYbUXnO5fzhx0lV66R2F01TDtvQIio0NDQKLpsaLKUFAN72CQPfMTAtVPnHmMO
	A+9/trxymBMsRutjyFbz+TBvPTkR3VzWxVPQnDl5vwLkkYYEwZL9KzQEl74Fa0JXI9o351Vga8E
	5HwvmvUIjG/TOz63Rpt7Vo5Y+MxmaL8WIHmPzRmzgb6e3Hw==
X-Received: by 2002:a17:902:da48:b0:2b2:4bbc:14b0 with SMTP id d9443c01a7336-2bea22b759amr66987495ad.20.1779444758356;
        Fri, 22 May 2026 03:12:38 -0700 (PDT)
X-Received: by 2002:a17:902:da48:b0:2b2:4bbc:14b0 with SMTP id d9443c01a7336-2bea22b759amr66987095ad.20.1779444757875;
        Fri, 22 May 2026 03:12:37 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b4442sm1143498a12.12.2026.05.22.03.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:12:37 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:41:57 +0530
Subject: [PATCH v5 1/5] drm/msm/a8xx: Fix RSCC offset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-glymur-gpu-dt-v5-1-562c406b210c@oss.qualcomm.com>
References: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
In-Reply-To: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444741; l=1052;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=obY0yd9A9w1nKiCc00V/sWC5PfbbK/PzpgmtQExUcNY=;
 b=pdp64ebXg5HPwlKwhpGKdCt4wHbjegnmKMSMu4DM25HTq8+oXTKxhTVqzHseUN+lTBUiptQH4
 KmSKIH80NuvCyqgY5lRGeS7K/Ol9xitlYW+htTssbvNc4sWExXaTNX2
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a102c17 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4MPhRinBehVJTi7DQIkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Ak3OkFUtfccpM7zB-Aqn0yGFFcmeAIWP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwMSBTYWx0ZWRfX0OBgarqIkxyy
 6ZK93lZc07HHjwh6MBICUv/asUoFZ2iuOxQrcvDjWDSihkya8gHa2jU/Pg/XUp+TdorSklOnWAw
 Gd01ChdfUreeX1+TgBEFUtIChc+pZYpCUs0EwZSeag2++8/RSysop4RfON3k5NbaA2qqmhyK2Vq
 POMQ41rmzy7gM1vttEbPKBAcZT9TCabmBiKPoVPX4CWOjpqg9833Mi3LgQxDeeiWe7IhzlZg2Ro
 2KUHGlDcUMEQ7ajoMrvL2vl30AHA5S7hMJFpt123y3kaI52EOKvBxGTMvk//k8u1MWeaSQmjeBf
 c4+kCvuPMgsU2WHhoo3TSkj326dZbKLRBGnkzYxW0VfgKqaHVlgOsKxHHG2O5XERloehQZpknkF
 SimkxlkmWQqAQ/MSPamj/5pkPAeAmGHsSEO2Jazs2A4G+xThB6Z6/YD7SfHmjd4wT+NscQwKvi5
 p6sGJ3aXsGWoF+i3JNw==
X-Proofpoint-GUID: Ak3OkFUtfccpM7zB-Aqn0yGFFcmeAIWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220101
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109236-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B62E65B1ECB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In A8xx, the RSCC block is part of GPU's register space. Update the
virtual base address of rscc to point to the correct address.

Fixes: 50e8a557d8d3 ("drm/msm/a8xx: Add support for A8x GMU")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 1b44b9e21ad8..cab4c46c6cf2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2357,7 +2357,12 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 			goto err_mmio;
 		}
 	} else if (adreno_is_a8xx(adreno_gpu)) {
-		gmu->rscc = gmu->mmio + 0x19000;
+		/*
+		 * On a8xx , RSCC lives at GPU base + 0x50000, which falls
+		 * inside the GPU's kgsl_3d0_reg_memory range rather than the
+		 * GMU's.
+		 */
+		gmu->rscc = gpu->mmio + 0x50000;
 	} else {
 		gmu->rscc = gmu->mmio + 0x23000;
 	}

-- 
2.51.0


