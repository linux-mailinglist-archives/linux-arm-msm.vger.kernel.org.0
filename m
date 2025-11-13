Return-Path: <linux-arm-msm+bounces-81716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A09C5A908
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 00:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 476D43523C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 23:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA0F329E74;
	Thu, 13 Nov 2025 23:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQE1C7LP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ENnil1+0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1999D329E52
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763076604; cv=none; b=tS/5oDsotx0Iw3M1g+CQ6zHZLs90Ii7oti5A7omo7mOhSLP5IE4B+4fBhE48PBcHzMwFY5MzfT/YxQT8+NjRWM4NlPhGTDTtoG6+sjS4BXbsqwZndbeYGK2RXG9u1eHT0nisw1mbXbZvYGRPaNsbTcWpjaz5oYx5rBKhJk8k3hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763076604; c=relaxed/simple;
	bh=B0t21POhzhnkPllkO0aJhsfTVayUVxYvYda/rajz62U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o1NY7ofAxO8DAMsFBRIruTlAcHpf/FPIcZT26cDLwdumeajjJtHpX+1iIvTOYsHkO/7wKsZFPHn3e8FaOHRdxRDyt6eqFwClZfW9X14EQ/K9MiF0FZCOhrm0BUjJPRaRcV6YwUnlhdEi0z/gAX/srhl/3spfldk7VZ4cQJe/IKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQE1C7LP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ENnil1+0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMalKn1745323
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U76nAoGUFZhSMgN3LNNB9B5figDIPjE3gLJdeoHmGms=; b=UQE1C7LPJm9301dA
	s/+45xtya6dKHJw4ywyVCmAOJCFCYGSoQ/Tw+B1jQvDUtVdlltohTbrtBobkF25z
	GglE27Z7HJl6jHg2K0tw3THfyt8p8k2uzgtwWCmAZGw5SHhNnY8J91QQTkTTGOBW
	uBPuulh//YChgSmCTokka+eZhRZRQJNTTw08Njw30JbZUc1Y1b9exRrPE0PcQKWd
	BB0CtBOI0BQJyCd4Jnc+OvWkK8UrxSE9W7I/DtJpgbuHvDd2zZFKk+HnaYo8E+0a
	O8LeWLrwYi3t4/S/34PGPxlGx5jGPtgG5c4vbPl6RjBwBCKQ7sYQE9hIK0saT4+D
	ZSUG7g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9eg3x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:30:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bbcf3bd4c8fso1253805a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 15:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763076602; x=1763681402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U76nAoGUFZhSMgN3LNNB9B5figDIPjE3gLJdeoHmGms=;
        b=ENnil1+0iD8LhhKliPXk9LBKx1gInt1A+9uOaY8LgYy0kEPKIl6rmf5MbB2hWfZuQZ
         Gb8nENf2ECHsx6RiKDDZziiq0abn/dMmQ60WPza2N0vPRKHcBiyX4E0JIwtUoWzpBPCd
         xtz0ZpFL8vWCqGIfjEHNdIFWccbL8eI9kMJuKf+pXAsCLarYA4WXqc9P3feaf5t8pn3+
         C85aq938EJmIcIEhDA14QY6NsUw426IEUGvwslwRFEi4Cv18fAGniWcJwhqZsN0homsX
         D2prxp/mLbKB4A9vSjsCWMx6DwHnvl+h6X1yIdfxz2X8UUPFQNYAxqNJWatAqJxcJbzR
         KLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076602; x=1763681402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U76nAoGUFZhSMgN3LNNB9B5figDIPjE3gLJdeoHmGms=;
        b=T6M1uLP7SwMZFhlkUypg/USBMACznwgmnqr+6fgY2+cVtVKCPWbB2CgeQSXmFAja6M
         gU0O/anO3o5uTkfrdoHOIpRk37OA4CKLtaukSRio2iaH3fbljistSUtqYxhS4Kz1aZCy
         4UTqUee07WkdhnaZVJL/zIcT1xc1hbANLFD3VB9tRcm3NstmEVuBEFD5DRUMipN/r2K+
         UwBfDgfgcjcf+kfA1J614FEoCSoTaOhLAHg8wYjXBtXIl+g+WesDZbHc85Nb+xbvuTEu
         xHknVbq97QsBsmLxEELzuov4LnXl3zfG/OFrcPdjxGRbne7W0skRs2qwotXII4n5UsEa
         ao0Q==
X-Gm-Message-State: AOJu0YwAEOj9meCKodtBbeBidcq0Up5mKRswrb1R5tcGO7OSMfkRCGLp
	O62rVeH23yNoHzOHGx8477D04qgC/SKZy8QtmJwsnr3VDADz1HZ3ESsa+/70bGH0OQA5M9ev2+E
	GQhFZDMOwjxiptd96FF88p0o8H/sHmJnH/C6+bAmX47g3s4mknvyaIxlPwDKHEkRXWwkt
X-Gm-Gg: ASbGncvhPmPeuskB9pUUw2JBNVDkWuSKiQMFjX4ekFgY9Ogoe4GEGxvpBnegoQJYO2E
	Lcs007vfRWTEdqvosMajglBZmhhWT9RBBzv+ZLgjienb2VojIBweDAH2aNAVl8TPB7reFB8Z1Qd
	FKvsM5yRcNghHjfBY/O3Y1QhGeMoAN709NMCYkZBrLjRe2rVxLxuPrGUON4NHBuGLJTqLWYRG+2
	28Z55QTyqUyUyyxPrc2BnDVJG4aX+cKfexWNt9ZTeRy8Y4S+4omWb8yUpis3k9MpzvL4VWRCgpt
	pTL3cYkbfy0bTP+bjcvklbqadisi/UcYzx9HjcjxISyK7XDPHWHzQQeWhneJ61ABdqkPiv28Bqr
	Y3jo2qQcIGDrDM3MDPQGmmco=
X-Received: by 2002:a05:6a20:394a:b0:347:1a7c:dea7 with SMTP id adf61e73a8af0-35a52789993mr6748086637.31.1763076599064;
        Thu, 13 Nov 2025 15:29:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHe59CpeNjRSyNw92JEuQdzL8WkgOpZ7xPVnMY1vuZEtJlI/TUBl0nb1yLfJqJlaxIYROr9Fw==
X-Received: by 2002:a05:6a20:394a:b0:347:1a7c:dea7 with SMTP id adf61e73a8af0-35a52789993mr6748048637.31.1763076598546;
        Thu, 13 Nov 2025 15:29:58 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 15:29:57 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:58:59 +0530
Subject: [PATCH v3 02/20] drm/msm/a6xx: Fix the gemnoc workaround
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-2-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076573; l=1529;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=B0t21POhzhnkPllkO0aJhsfTVayUVxYvYda/rajz62U=;
 b=/XPn6y9/sGaZJkUAy9FCP9e1/me5R2Ws/cxZiiYLXvbvNvzGaU1VsNsVvvUc5TDgOddrJMTKG
 G4t91gdKb/CCVOPapjdmn8NaruZHcRKYOt5SqLB3n0oACbqmHWKpKKW
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX+ZnNUNgFVQl2
 8m4pWsuisPaUscEH4dEY6b1sf16tXwMO/27kiBEiqwu5vZbrNEUc1NiKl/atrsJZt0f4UrHRugc
 IJGxW6NzNQlvaRZ8uxSByAPzELz6XEwRn9nOeeo5vu5ctdpTP+MMNnLepUOTppM0jv2a3/LMgpq
 e6VsqeDBQYZ+7J7E4A50J4JMUna0W6y40/3/kOtdRHluL6exR7pnyEiMpEnC4NvfdWKVT8RuctS
 jM7an9jGIwiFhw3IgUmVEdGqRzrTKEnz8f7KuUhMrGhxiMlEujHgP6nwtY1ywwb9RhzzdkK+gK0
 028acSMJcS/m/+lVjkmdvv44+fAnZN+CQlrSfRCZXUaTWEjkN1z7KwDEIk7lJAJ8vZfQPVF/u+A
 P/f0Hi90HsWFVSoATbHx43btqpp5OQ==
X-Proofpoint-ORIG-GUID: TYkxJu2HOubUpyv5s-8ec65kramoNZxX
X-Authority-Analysis: v=2.4 cv=Afu83nXG c=1 sm=1 tr=0 ts=691669fa cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gggc3m2WwWe7Cuz57AEA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: TYkxJu2HOubUpyv5s-8ec65kramoNZxX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130185

Correct the register offset and enable this workaround for all A7x
and newer GPUs to match the recommendation. Also, downstream does this
w/a after moving the fence to allow mode. So do the same.

Fixes: dbfbb376b50c ("drm/msm/a6xx: Add A621 support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 4e6dc16e4a4c..605bb55de8d5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -485,8 +485,9 @@ static void a6xx_gemnoc_workaround(struct a6xx_gmu *gmu)
 	 * in the power down sequence not being fully executed. That in turn can
 	 * prevent CX_GDSC from collapsing. Assert Qactive to avoid this.
 	 */
-	if (adreno_is_a621(adreno_gpu) || adreno_is_7c3(adreno_gpu))
-		gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, BIT(0));
+	if (adreno_is_a7xx(adreno_gpu) || (adreno_is_a621(adreno_gpu) ||
+				adreno_is_7c3(adreno_gpu)))
+		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, BIT(0));
 }
 
 /* Let the GMU know that we are about to go into slumber */
@@ -522,10 +523,9 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
 	}
 
 out:
-	a6xx_gemnoc_workaround(gmu);
-
 	/* Put fence into allow mode */
 	gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
+	a6xx_gemnoc_workaround(gmu);
 	return ret;
 }
 

-- 
2.51.0


