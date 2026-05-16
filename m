Return-Path: <linux-arm-msm+bounces-108003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM1rL9RaCGphkwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 13:53:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F5655B8F8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 13:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A73593008257
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 11:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179583DDDB3;
	Sat, 16 May 2026 11:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ie0T8854";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GGZ0fd0M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54FF3DDDAB
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 11:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778932433; cv=none; b=kV1GU2xTH/I142w7d/K5OExsi7EEZFKHI5lNmwYb0pqduRtJ6AK56KUahxr7yrJlF4tUazFcUX4ded7ItxjAVf34yHEJ2wJl6pw8y5izaC7gJoG/ySZ+s6bGP1lGwmeR+DtXoy5aiAOc86wndHUUEwG+iJ+F56O0qXRj9rYUeV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778932433; c=relaxed/simple;
	bh=T1EcXcxWq0rQvQxiX8jHAnIiOpw0u6XiHh6h8Y5al8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M1TpHphjWZdwzgpVmeoCZ8xXFctZsMXr9aq9ClZ7etpgJOelZWBR7jzwLqCJ0C9wn17DfRopz+Gq3NoRJ6SZ+2G6XlRBK3dhs7M52fdrN1xM2N6MBuITnqcA43mNB6uq3QhijApyHpR8EbGu0H7rEBt8nFOp3kYB/TsVK+wET6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ie0T8854; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GGZ0fd0M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G3n8oT3269592
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 11:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+Nopaqt4P/VG1rvKE+IVOo
	VaDtQUdLtKRdO0so13yBE=; b=Ie0T8854wudsdJ4qXSusQPBiQ37uBKioqVfMPS
	By4n47/0lvgq7ttHXx63pjW4rPaS93xMRiX1GInCPKbxzbnYGSmX7ujiXXolr44a
	rG5h7RZS/dRKRu5JfnKq9muqPSZ5mFN2QH95/BY/cA7bZ227/e5YlHLcKKekWm5B
	UWzUTdlY6WRclKjXI/67uAb4e9wGefSjE+hrU8HcaXSvEQ+mVuCVw9mktLvYmwnu
	mtIldpxNwOllvYDhPzxuu6kEdffOVkj7Ky/xtkVoYWVNiSbZgAWMQvlkxYOmZlg6
	XT5wkphfAVrIQSFNvHe/mFsFfCOKxgBjb3mLiD1+3ZfUicTg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g0s04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 11:53:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-90d2d8dc97bso197611585a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 04:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778932430; x=1779537230; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Nopaqt4P/VG1rvKE+IVOoVaDtQUdLtKRdO0so13yBE=;
        b=GGZ0fd0MCfoYN1iz6vXeVWwPc1azISgwzL3CEnYammqFfKDCCd71bY2q3lfYpxU7gS
         5PUCDUHqH/fmp0of2frtb3JF3a2OY3nDfWp0QmZ3b/K7+7AMI3EMYcVaZYVS3Kb2/QkC
         7OKLkIzxhPkssJf+ykI8xqqFYoZi5r0LoeQU2mIxY0PeyS8/pxWkSKlJXWC5PgvApvaE
         /EHt3bAS0KQVek9Owfg2Q7QM+NPL8Pi5eoK+vXhB2BMYK3cQGmExfrFu1PC/SnVCTCcc
         iJaHZBlP78lFE/7+J/U39P31nKLvHptu26KzJLbmkN3mq9EwjXuz0eU8CKPbZ72rw0hb
         kNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778932430; x=1779537230;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Nopaqt4P/VG1rvKE+IVOoVaDtQUdLtKRdO0so13yBE=;
        b=InUxl9W6+ZXJ9ksrRXWb8vT9oMt281QuWxY0Mo4vomZ08XpI45eXPBtEACu95mmOAj
         GgqSrsy01+bPzfLY5ZyBuYkSqH3T5kUxaANKfOwfsvJS/ludjC7ejR0jYWheg5+Fno6l
         OLaLU8mGpHB9kJ8bDmz3ROpuqMB4G13jh+sr5K5GEQJFMw9HpQGKDToGVi2ksFakGoB7
         17tOBE4pi8n+ZnaBzOjrKsV39pKP2r0fYOIfiJPr0dMqlLWu/Tujsx9enN4NvP1I23m3
         KiqdYlxsS7izl7wZnkipNPKL8O6hBUyqJgweEcFkfl3wKmpxY338+bS1v6WzieWFViWa
         2OwQ==
X-Gm-Message-State: AOJu0Yw8+A1IkJs1GcTSbzWy6YZhc83ujFFbyZ824fbqXEgbyArmtN6J
	HF1Bnx/r6nV2sCH/UfT6Os/Wu9J6fWy44q0ypd/wBgpFet+SaXD4Q6MuS9pAXYPKQV0yHx/rZtb
	Sqdzs+rrAGSVKQayxr++GhMZWBAzS3Yn1nmqIwpsAfWEVUGV4FXnLhFSRc/NifvESdZBD
X-Gm-Gg: Acq92OF4z8Q8xh0rfp1ndq2rS3d35BuKxwaKlwatwGRUZfCyv5/4IZePbdvXymFL0sQ
	KJC0fT/XV7d8mXgTdBAJNWQGEbQg9NiOOzzaS+McI8xEP0FepVFLyX9NJ566SHL7g7hIuJ0awA/
	tAVLD5Pt6LA1WSu/ztNMZV83rKH7qrWoZUX+F+U/dtT/GmijcwJ10XfqrBRzoiLDZ5stEuig8JM
	PjQ+si0P3Jogl1NCGRaTXzAkb44PbTQYuHr9rJM2/RtY280jKesdBeionvLhWZnXBgxATwyUmF3
	eb069gPIO1cDbHViviaexyPvPVpMGfhNetJMHVHuQKIjmBfMZ6dvwuQ583I1LgWa+y0Cg5nSdkR
	PR6Zz8KirPSwXD039Z8revXNWMiJQDjzuBTXGA4movDUkAa+NxHGgcacLVhjAlPLjHDGe8MG0Cp
	qBZY/874P/fes3I++s1V13e7wC6dLsSr61xzw=
X-Received: by 2002:a05:620a:4556:b0:8e8:bedd:14b7 with SMTP id af79cd13be357-911cd75d7ebmr1186970785a.22.1778932429920;
        Sat, 16 May 2026 04:53:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4556:b0:8e8:bedd:14b7 with SMTP id af79cd13be357-911cd75d7ebmr1186968085a.22.1778932429417;
        Sat, 16 May 2026 04:53:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164c4b73sm1947270e87.55.2026.05.16.04.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:53:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 May 2026 14:53:45 +0300
Subject: [PATCH v2] drm/msm/snapshot: fix dumping of the unaligned regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-msm-fix-dsi-dump-2-v2-1-9e49fb2d240e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMhaCGoC/22NQQ6CMBBFr0Jm7ZC2QCOuvIdhUdoqNZZiB4iGc
 HcLxp2bSV7y5r8FyEZnCU7ZAtHOjlzoE4hDBrpT/c2iM4lBMCFZxSv05PHqXmjIoZn8gAJlqYp
 Wc8mMkpAeh2iTsY9emi/T1N6tHrelzegcjSG+9+rMN+8XkP8CM0eOZVGLI6tLI6r2HIjy56QeO
 nifpwPNuq4f3hp7Hc0AAAA=
X-Change-ID: 20260515-msm-fix-dsi-dump-2-64a3bc160da6
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Salendarsingh Gaud <sgaud@qti.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3628;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T1EcXcxWq0rQvQxiX8jHAnIiOpw0u6XiHh6h8Y5al8M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqCFrKTbeuaUtQ2yYqRJ15mWPB6rp3wK/V4PG05
 XzVTEWRHGyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaghaygAKCRCLPIo+Aiko
 1WQzCACWO6+MmByjin6N2P2AiqIRhQRQ/faI85C7RppHihUqm5HdCwZDGTmWyeY/8yJOg9Q28rX
 gjNmQMSNY5vnfg5vFYQdMv1t4C3UXGg76qeMGBjsneVxLm7tp4qYQEtmKaIWqaxYDVgt2orc6dS
 MM2dtNfkkr+dqbEW/E4jfzJcpRZdZ27Ziju6d1ohq7F+oZ9KTdtRP0Nq3lGyCImaBPCZ4wMvkCk
 YTQOToCLX1aIAAk/PeqY6Hvq3TsmlB62n+4ZQ+lELd+kuhLP0ehV0DaaZZcGdz61beZkWVqZnoH
 LSIPRlYMYLXq8lfPZ0kl8O4aXcRVpGwRnbRGJR00nXuhsa/O
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDExNiBTYWx0ZWRfXyUADrlb9OKTB
 J/Nis8wa3jlT3Ckak35Ftf1iH0S6WMMFuhCyM1qy5DAmJ2Wmqoh2fEOA9aQFFbfBJ9VerBoZIOR
 Ps4FekMtnyDNuUQqMqLf0mjIYmkuHqglPzWnolgwYAX8n3yxxikJm2+6Q5/lfANBpiYCJoBzL/N
 Ko6yv5JEcGKlm+C8bPpQNxZFeYqaaqMTnQL19ZSO3oJGkPNtIPctm7n9PGNxSCh7vHXqNceN81W
 FSpTs93Z1qyQ0D2UPqhAQVTsxafpiWugTCRAY1t0xbzLBnnJHMiialwJGvo5MNFfXPlJCVELwGb
 NWghzCdWXm9/JDztpY/bJPSnNP4705RhLXPV8R35gh7RAaLr+sC1PHTiUhhiVS6wuQ/SurjCLeL
 sn1mpL3kIOdviqKFmlesseJKlbP5Y9qBY4IGweD5PQTUm1vd/JRNmspHExoPTo9qz2h97wGE/09
 uZKP+nh0459Tl4ayv0w==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a085acf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=IVn6q5FHpPisWK92jdoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: LokeQ4ZdQhCLrK8BLfzimnVxSCUt9xaz
X-Proofpoint-ORIG-GUID: LokeQ4ZdQhCLrK8BLfzimnVxSCUt9xaz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160116
X-Rspamd-Queue-Id: 67F5655B8F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108003-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The snapshotting code internally aligns data segment to 16 bytes. This
works fine for DPU code (where most of the regions are aligned), but
fails for snapshotting of the DSI data (because DSI data region is
shifted by 4 bytes). Fix the code by removing length alignment and by
accurately printing last registers in the region. While reworking the
code also fix the 16x memory overallocation in
msm_disp_state_dump_regs().

Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
Reported-by: Salendarsingh Gaud <sgaud@qti.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Drop the debugging clause, limiting dumping to DSI control regions.
- Link to v1: https://patch.msgid.link/20260516-msm-fix-dsi-dump-2-v1-1-43928094d25b@oss.qualcomm.com
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 24 +++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index 5e151952dea8..c8a10b1232c2 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -9,7 +9,7 @@
 
 #include "msm_disp_snapshot.h"
 
-static void msm_disp_state_dump_regs(u32 **reg, u32 aligned_len, void __iomem *base_addr)
+static void msm_disp_state_dump_regs(u32 **reg, u32 len, void __iomem *base_addr)
 {
 	u32 len_padded;
 	u32 num_rows;
@@ -19,11 +19,11 @@ static void msm_disp_state_dump_regs(u32 **reg, u32 aligned_len, void __iomem *b
 	void __iomem *end_addr;
 	int i;
 
-	len_padded = aligned_len * REG_DUMP_ALIGN;
-	num_rows = aligned_len / REG_DUMP_ALIGN;
+	len_padded = round_up(len, REG_DUMP_ALIGN);
+	num_rows = DIV_ROUND_UP(len, REG_DUMP_ALIGN);
 
 	addr = base_addr;
-	end_addr = base_addr + aligned_len;
+	end_addr = base_addr + len;
 
 	*reg = kvzalloc(len_padded, GFP_KERNEL);
 	if (!*reg)
@@ -48,8 +48,8 @@ static void msm_disp_state_dump_regs(u32 **reg, u32 aligned_len, void __iomem *b
 static void msm_disp_state_print_regs(const u32 *dump_addr, u32 len,
 		void __iomem *base_addr, struct drm_printer *p)
 {
+	void __iomem *addr, *end_addr;
 	int i;
-	void __iomem *addr;
 	u32 num_rows;
 
 	if (!dump_addr) {
@@ -58,6 +58,7 @@ static void msm_disp_state_print_regs(const u32 *dump_addr, u32 len,
 	}
 
 	addr = base_addr;
+	end_addr = base_addr + len;
 	num_rows = len / REG_DUMP_ALIGN;
 
 	for (i = 0; i < num_rows; i++) {
@@ -67,6 +68,17 @@ static void msm_disp_state_print_regs(const u32 *dump_addr, u32 len,
 				dump_addr[i * 4 + 2], dump_addr[i * 4 + 3]);
 		addr += REG_DUMP_ALIGN;
 	}
+
+	if (addr != end_addr) {
+		drm_printf(p, "0x%lx : %08x",
+			   (unsigned long)(addr - base_addr),
+			   dump_addr[i * 4]);
+		if (addr + 0x4 < end_addr)
+			drm_printf(p, " %08x", dump_addr[i * 4 + 1]);
+		if (addr + 0x8 < end_addr)
+			drm_printf(p, " %08x", dump_addr[i * 4 + 2]);
+		drm_printf(p, "\n");
+	}
 }
 
 void msm_disp_state_print(struct msm_disp_state *state, struct drm_printer *p)
@@ -185,7 +197,7 @@ void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state, u32 len,
 	va_end(va);
 
 	INIT_LIST_HEAD(&new_blk->node);
-	new_blk->size = ALIGN(len, REG_DUMP_ALIGN);
+	new_blk->size = len;
 	new_blk->base_addr = base_addr;
 
 	msm_disp_state_dump_regs(&new_blk->state, new_blk->size, base_addr);

---
base-commit: 11ff30385c8ad7de9862f4f1cec424fca15a4f13
change-id: 20260515-msm-fix-dsi-dump-2-64a3bc160da6

Best regards,
--  
With best wishes
Dmitry


