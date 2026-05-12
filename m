Return-Path: <linux-arm-msm+bounces-107163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mF0+DVh+A2pV6QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 21:24:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD485289D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 21:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62E6C30D3AE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 19:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C71D384CCB;
	Tue, 12 May 2026 19:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQ1PfBqW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NegG9hse"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68E4375AA8
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 19:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778613721; cv=none; b=nIEmbczDvKi+2Zo3+eXZ6HKzOcMah0Bzu5pRCOO+qc1Cq+Q1/R2cpEsP3h/2Ex0hPxmrv6bn9hj5tS2DKHy0HOhhnACF+6diVMgxGQ4xFN8+jedZsEa4nDlEkdMQEJjsVpSonhtaypRckHwvEcwMQ7+3tXwlJ/1zO7tLtZXvELE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778613721; c=relaxed/simple;
	bh=obY0yd9A9w1nKiCc00V/sWC5PfbbK/PzpgmtQExUcNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rnOkTm+yJBjq/kQwgpMzVhQMjuxeVGre2CW4sb4rDdg3NrDFAv4C34ywNrxENCYOjBYAZnBl3wucyhlnHcG19IFgYgPnvRTtFYJU3D/3IQYDKNkebt6cbb4B2OgWeqPczeVWnAtpADuAYtQflGosnphmOp2vzGLvYz5Z+ijAmN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQ1PfBqW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NegG9hse; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CFLOiJ3421935
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 19:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9dYck4F1ifiwH0J/tkMJzJATF4TXnrW2srpgDnF4SLU=; b=fQ1PfBqWK4vDsgBm
	ASJFjwaLyIafukD8fECkcArllj+7wqOucIOdTZ9SaHXQVZhlxRgPKS3VZPkjdY13
	TieageF+GcI+pm7PH9pyulrrEyjtlzGB8hR9kb2lFK/WT0cvDoL4oi+zFvfXI6x1
	nr9HF9FtBP/q2pS8EMRbRCY8n2mqRj7FspPVyu8CdA9ONWKr+C2VBYTAxA9VCAvm
	hKNfIx5wS5SM2nqdpXQYGxviuDrsq8DNd/szkUj7vF/YgFavfaiPn/YVswi6vS/f
	e2kIR3rbu675gKQ4zKSwNp4NuRItafeSs4id9H9HXWoskC7B+BOKE4vitb9rWyWx
	0JTlKA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9ryc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 19:21:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8271fb43d0so2062646a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778613718; x=1779218518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dYck4F1ifiwH0J/tkMJzJATF4TXnrW2srpgDnF4SLU=;
        b=NegG9hserGzlEDKBeRkhqrbU8f/D09kmW8e5Wtafk9XAWMkUCYASRbXQjdli/JpiGJ
         4TFPabPJiJPpEnXHyKN0UFiJsjC2yGYyqd/TiiFDlEoaOgUoUce51qu8FLMTzhbkZJZA
         nOk70fZXpwgk39Cg5CYyn1B+Q6Vh7i/zVQ480/HdWKro0wZ4++4rU5MGE0Wrl5lq9W8g
         VNFI5bdHEmpTPuIT2rYmRO11XqXhj4cVpdpPAHIEsYaOrMt44m4Rmg2ncXO5H6RMdtUB
         7JtXq1VMCoDSVXZMTYuWAFkyxtKORmP0bGOKXO3nWumCjQfb1n811+X7WcAfJZIaVJSW
         qcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778613718; x=1779218518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9dYck4F1ifiwH0J/tkMJzJATF4TXnrW2srpgDnF4SLU=;
        b=o1RF2VX5cr3LGK2uH84esHv7hf64HB0YyR7gybLaXFUFVwzPsVIj3ShEXftTzqCgts
         oYefmgcgTMFeE0NC427vKsM+o6QmdrJtqKmrn1Psb2IR/6jVLM3JzL6Z0DJelR93RCGY
         Co2m/mrpWp4M0qKufir5yARZMV97Dr3JYX0zrBiRYKQmgL5cjuQCJEx+i6GTreBaXWF9
         dxVmYw8HQzaxwYJcSkvK46T7L+YMPfwGq3cscgVZVLBBDrsowEBvWtRQdF8d28wVZaGs
         36ijC1slTfxPbbd0+vCGACOggpG0QYKB2zIXw0AgFyMexOHv61YtuPQnYwdnYm2RVfXp
         o2uA==
X-Gm-Message-State: AOJu0Yy6t66ZTmff+MHn+K4NLnr2jfaO85agVJyaUcLcI2TJZJTyuSAB
	jeZxQZT8OKIeWdHFV/LZlS9bVWckNVbXxqQVomDCLQ5KWSZUydS7BvYtPLl8aHn6Y2gEUeqmSWE
	ARzsAlp3L1X8QeU5FyTLLRVrszW4plGW/rc+N6bfj9jbzrtGfk5D4GpcdGUwbSme7RuVZ
X-Gm-Gg: Acq92OEBCvlZrgqRtuUyeV8g7lBX+TkwHuCLIskCv97+N6RiIOZZv+UZqY+M9uGQAoA
	cmd+o3StKkCJStYhPO3Cr0sYz3swBenT4CCRtM8/xC46M7dAHnJnwqkgC5pgMCeezgXB8rPXGk6
	PcZpWLARkHovHx0AJqSW+gFaDQToRTt8GzkWpmug3SWGh9n5x65L2Dueex6zg3h2Y9r7gDqDgqX
	NGf+vrT+rrT6uh6gCnpqIGGjS4iMYg4fe9SwQ1IzVXGTHHbgdGsZjTg2bOoprYV4LtEEaFGm3w1
	oS3UjWkrZ/9Sws2SnAsVn2fa35G41izvX+gaAJEv72Qafw3nMXe147QrcjrZTqlM2WmWWzzycol
	/Y75/SXbxXv3zf0QxBn62dlXLcvFsaXYp3pnTQSEtvT6VzQ==
X-Received: by 2002:a17:902:768c:b0:2ae:cb0e:fd59 with SMTP id d9443c01a7336-2bd27133a91mr2513725ad.8.1778613717154;
        Tue, 12 May 2026 12:21:57 -0700 (PDT)
X-Received: by 2002:a17:902:768c:b0:2ae:cb0e:fd59 with SMTP id d9443c01a7336-2bd27133a91mr2513465ad.8.1778613716644;
        Tue, 12 May 2026 12:21:56 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ead90asm141250585ad.72.2026.05.12.12.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 12:21:56 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 13 May 2026 00:51:18 +0530
Subject: [PATCH v4 1/6] drm/msm/a8xx: Fix RSCC offset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-glymur-gpu-dt-v4-1-f83832c3bc9a@oss.qualcomm.com>
References: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
In-Reply-To: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778613699; l=1052;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=obY0yd9A9w1nKiCc00V/sWC5PfbbK/PzpgmtQExUcNY=;
 b=WFrdXoJxRMyXFTXXynT+vDwKDHONIdU5yJw6WcZBGk2wkEkuw18xTJtD0Ah268ZR+tV/3Pzjv
 W3m23loJVEvBmUzKN29QDTNc5Dv9Uv0e4liGaVXV1DuPDjaagm7KW4i
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDIwMCBTYWx0ZWRfX8YOqmX12L46k
 F9LrW26vHU/3wXhLH2mqsug0sf1t6mG7SHW6ASAZ1jGI9pjgR4+CtGsgZ0wtuMQueVMZoj7P8pm
 CRA/eMc9GCRFP4uXJpHYoTrdnJldFwUlRqf7QtOL1uysaV+NNPjD4jYXskGrDnjP+Q7i2jrIY80
 uaa0cG57CTL+OXML8q5z5KRz6zn5K16Vm758OC37WLDU4ex5jJ6tB9zYrMWy/2hQhVPkRSNwfte
 17+lQfGImQI14EJyS/EKdo2B4MOKwpJy+5JerAZhj8Dfbkx2YjhnzTFY27ykkj3Dmi4So4e+7mB
 yR/mv48/j4pTqYKA1v4p5aeRxYelj4EPbHc1A9VR4hiWEI3DNICrpHVgrIqb4P/3WwxBMTXFZt/
 SFKP2L7dFDT3ebvAP2NUXFQIOm1okhsBa1ly4MuTw/VYkMOKq/b5YKv0wKpJlX9CKbUAm++YhCQ
 +Ssb5Ag7a5/yl1TSnqw==
X-Proofpoint-GUID: M_ltWY0X2srCaxS3_kIU3osbKVdV9UyA
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a037dd6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4MPhRinBehVJTi7DQIkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: M_ltWY0X2srCaxS3_kIU3osbKVdV9UyA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120200
X-Rspamd-Queue-Id: 7CD485289D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107163-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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


