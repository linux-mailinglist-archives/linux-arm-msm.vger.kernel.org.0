Return-Path: <linux-arm-msm+bounces-94299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKh6MUFRoGnriAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:57:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 310EC1A7193
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:57:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EEE33155363
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 13:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97AF626B756;
	Thu, 26 Feb 2026 13:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y35umf1F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XsGBKSf+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6D836A025
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 13:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772113753; cv=none; b=gUyxf/rZtsTQZFlStRvcEKV8HTtWvQMo2nwcXRZUNXHqims1hnOlC0Ght0bv7/ib2jcA6Xn5CE8djyTpeHi5d7jjj9YL87kXlnMBuDOqsJdN9hALL7pwP4PLW/xA2EkoEskoImHyByA3eRwQ9w8UyQfnQ3aI8WrfSYq8LK2reo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772113753; c=relaxed/simple;
	bh=8i8tNnbsqOxhBX+7vt8ZmweWiDsBCJ1prDtobbiR6z4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GL1IS/QVt9v/Z6TzdlRcDNTLiGyr14xEX2r7duqKAZiUAJ6kmUFO+vSN0H2L21grDPBhYEYUsYlEXBYMs3rVuRWPyG8wa4++14X0khK1cSqDqy/FpE0SJRNPSwzvVCWkQ9JD4UEXOzlh/tUsUcDQcPxNS4KRoiOWSIQZTX7JkD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y35umf1F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XsGBKSf+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAKlox906822
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 13:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YtUMEIXmDJnWNO68ZEgijJ
	9MgAuywjdoylJ/BWpR2xc=; b=Y35umf1FJ4OdTunj84WKhtwSsSeR7cePIAakHY
	ObS2dOHRyGUPJoaFUvaFbVLkP+aR/ul3C0aLDn5XMvDQYjiddFMFMaE4fUpygyI/
	p+51QOj0QT7K5/jpnracgDVmCOrsMPMo5d/To0+dWEVAK5/W31OB5KYR5xJoQI6J
	THRsu6L3rlM0WIN7Hm//9l4MB4ZJaGSuW7b48akGKmak/rMLFtS+fFuNFGxi16sF
	1UQ7coSBRNYANrb6OsrV7pP0h4xFP3PdkljCsjoABmj/mMsJEfbkys2OHfUaRbyr
	IvUB/dC/mEXOWhCoNg0favVcPjQVfxZeNE5dUfhRo044rA9A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjk2v0uw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 13:49:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ed6c849so567912385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 05:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772113747; x=1772718547; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YtUMEIXmDJnWNO68ZEgijJ9MgAuywjdoylJ/BWpR2xc=;
        b=XsGBKSf+zZ2xVmfQn436aBOoNomHHMR9Ud2E4UINmUPCCyfW3L6snApqeoMewIGJZk
         mdHWdIaqOtrjo37VrghTYwLq78yTwBBGchL7hHVQpQcOijHoc690fggTfLIJDPaQkM16
         OvlAPqxEF/uJl41qkxxRVNt0b4GQLnUhfhcRJY1VCM7w10IHC5+S2GQYa4AoUOIxMzAh
         TDwuhKlAVku6RjX+ez3Lga8coe3eRA1njshXFax699rAFlQJ/ptuGARtR2MX66u22x1B
         HnWmoEUTWHHAVX9MK+6K/ay+FbXUGHhiKpdneldqBrG5H+/1QVwPA6isqPaVYW3G7GI3
         TV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772113747; x=1772718547;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtUMEIXmDJnWNO68ZEgijJ9MgAuywjdoylJ/BWpR2xc=;
        b=RVhgnL5TAk9eFj+h6qy9geWz0KHYKr0FWyq6wEbYXQiEb5RJNJK3iDcGIAztCI7f5f
         Tt+W8CkPturjpDTsUr+nubTF0U92Z475Rpwt1TDpA6ur6s4O8xqAQvLHQp8PNJhUgB/Q
         bGsPXsJBdU7C5XeLirVBX51ezDDSTsLoWG+1N3ejLCEqmVV1X/l9bMPhWTew2FBGgVA9
         er67qrQ27JIWsbSKVhwWu2S28I1A3zRHB/5FkT4DMp1isLCP7cDOuGRljXoDquO/PeCU
         TdKjnkKABG6i7vh4SAQgp/R/aizKZQMPsNI7P34DdPg3h+UL0RhT3a2rR68BrBgcimNu
         fVtQ==
X-Gm-Message-State: AOJu0YxpQlBNuBgmnu8E5ol+LYA+vmHbvezTY133nUsAsn2cug73gVhU
	ZptXkDtXUHQ2QwxVaGtRSPAuqHFktigKNH/iZTkM+wi5CH1o9tC5WvegVqoZdGWHYl5O+T3r1NA
	cbQGR3CoBKGz0A1BGCdzi+A3sX/29Yjq0c/2/F5jLDGC/8BQsIelseGEWpFAhSFXuXu8G
X-Gm-Gg: ATEYQzylPh6NNBFsTha2NWz5WnoI+2OywKARnJoPHTHCd/pgc/2Njk0joYx9DZD11c2
	5s5W2rRdfiNKfeRdb68h+C+SJfSdQs2bgqdWVmsGSrpS6FF1hKpwjafZeT+0tM21vmQkJUWE9iA
	joH/JfjB4vOumQrdhacCzDjk5wkXE1mjgRJkdj1z0Zn5IpSCwP+oRC2MBfjSdBKKo9wh9JozFbY
	lOjgzeq5bjYXiIVWnjDP3zGO3bLA/CTUk8JaQFs8h+XuYWa3wjZp+aMsy3eEvw9heVPrB9nvicM
	cQvuy2VLFk3/bwPw53v7AoiYM+YnuSBzMPOyE3eWBhYwVw0tGvnRgnvh6pcEwOhh7EsI0kfNKHW
	y/lOx0gIIp/863NGN9uR1k8NzEnN7qqZwAOVd/G0bg/7/6bHmxxHwKeTmLkxZupHfrUJUbomIXF
	3AU5g+G7UVFYyTxSTEGBynxN3gluM5w6jty8s=
X-Received: by 2002:a05:620a:319b:b0:8c6:b45b:9e2e with SMTP id af79cd13be357-8cb8ca65f49mr2439751585a.38.1772113746809;
        Thu, 26 Feb 2026 05:49:06 -0800 (PST)
X-Received: by 2002:a05:620a:319b:b0:8c6:b45b:9e2e with SMTP id af79cd13be357-8cb8ca65f49mr2439747585a.38.1772113746254;
        Thu, 26 Feb 2026 05:49:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a10a319f1csm846490e87.54.2026.02.26.05.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 05:49:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 15:49:02 +0200
Subject: [PATCH RFT v2] drm/msm/dpu: enable virtual planes by default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-dpu-enable-virt-planes-v2-1-87971236fe86@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE1PoGkC/4WNQQ6CMBREr0L+2k/aRoS4cuUBjDvD4rd8pAm22
 EKjIdzdhgu4meTNZGZWiBwsRzgXKwRONlrvMqhDAWYg92S0XWZQQlWikkfspgXZkR4Zkw0zTiM
 5jljr2rCgk2FFkMtT4N5+9uEH3K53aLM52Dj78N3Pktyjf7tJokTdV5qEaBoh6ouPsXwvNBr/e
 pVZoN227QdyWdPVyAAAAA==
X-Change-ID: 20250514-dpu-enable-virt-planes-7b7ce0a6ce2a
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1449;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8i8tNnbsqOxhBX+7vt8ZmweWiDsBCJ1prDtobbiR6z4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoE9RHq3AyAQJWnBsH5MCEJxQnuBUPW53HTlwK
 0yZO/2Nk/6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaBPUQAKCRCLPIo+Aiko
 1acVB/0e6xKqCxQipAifHQkcio0bhtrcjkKLq/BZqsqhl3U67aB2T28scuPBnmmhFeDsoeBqyvL
 uGvULJiypwpTuVzA/O+Z79t/eed2ScR6ww8tp0JULhHyqzTas5XjeAFuBApM/2WFaSQwr1J3PqW
 kNudw9qgXlMv9oBUCRmEd2guJy5oXuHgHfTVO4g0p85Kmjg8RgF+VxyO9UBOSVF/kI7p1OCg+85
 JnBBHL9UIVhp7n/tv0HKDfWGcbCj5WbHttatrA2qs8AvT5RXAnVf6RLt+TSjzSg0HvhgZti4dOe
 KlRydB1IPXuR5DWz+lkc4NRNb15H34xJDNJUx1QRRRsRZaRv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Ue5ZMZ2VTf_7VlLaA8U5-rNfUOsDOn_n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEyNCBTYWx0ZWRfXxBmfBFRTR/H7
 2Ws8e4Ju/JW+UlePGCkixpnklmATCeUFEG4CjMYgpN9vTnItsk7OJrkhZTOAqxyAZh+9GrPZ5ZQ
 gEpZnA932xdEUrJQai39lWVAhcDKmCjYi6gCfEN7YnTq7p/ppksbvYEZiZlMwmnwxXTvjJneY8p
 cN55ksTkwDGOIhy6YByGIeuMwQvpOgC58vKm1/pEKNksg+G5HVd34cZctsuIRdZxebuzKTQsLKx
 9LS0ZmjIRkbx4U+wK6h9ViqcBSjwWJKH6xLNMRyEO2GtGkUYg3bcpJgpfLI/v90isTxgFkh/5UR
 N2DFcbQK9h1oWmziVp2r/biiYjtNNxRIWpZTO53x8UMrobu/JJyMSeS2yrcrSzjPEA5sat/ejAC
 LHUF1LMAZd3fAS95/NmZIlTpiOub6zj7+Q4YPA9UyZgiEt5nWhM3U4Cps00jX4JTYN/eSmSKgpL
 DGpgUPhwpmZ56ZoOrxQ==
X-Authority-Analysis: v=2.4 cv=PO8COPqC c=1 sm=1 tr=0 ts=69a04f53 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4RDPIAw37ivmvRzZDt4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Ue5ZMZ2VTf_7VlLaA8U5-rNfUOsDOn_n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260124
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-94299-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[quicinc.com,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 310EC1A7193
X-Rspamd-Action: no action

Turn on the switch and use virtual planes by default, enhancing
utilisation of the display pipelines. It is still possible to use legacy
implementation by using `msm.dpu_use_virtual_planes=false` kernel boot
parameter.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
This is being sent as an RFT for now. Please give it a test with your
compositor of choice. X11. Weston. Sway. Wlroot. CrOS. I plan to turn
the switch for 7.1
---
Changes in v2:
- Rebased on msm-next
- Updated the cover letter, targeting the switch to 7.1
- Link to v1: https://lore.kernel.org/r/20250514-dpu-enable-virt-planes-v1-1-bf5ba0088007@oss.qualcomm.com
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0623f1dbed97..7c5b3495bddf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -52,7 +52,7 @@
 #define DPU_DEBUGFS_DIR "msm_dpu"
 #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
 
-bool dpu_use_virtual_planes;
+bool dpu_use_virtual_planes = true;
 module_param(dpu_use_virtual_planes, bool, 0);
 
 static int dpu_kms_hw_init(struct msm_kms *kms);

---
base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
change-id: 20250514-dpu-enable-virt-planes-7b7ce0a6ce2a

Best regards,
-- 
With best wishes
Dmitry


