Return-Path: <linux-arm-msm+bounces-94507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKVHH1jkoWm+wwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:37:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 206911BC136
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:37:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE99130965C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 18:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10970396B7D;
	Fri, 27 Feb 2026 18:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="glUMHt0k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cCg5OLSP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8BA38F241
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772217414; cv=none; b=anKr2oxCOhs9ohFAWjZK8MrKkdaN2NtV96lo2+XhmL1rCA/jS6vf8yUbVb6237CKFHJp8dl4853izTRzkuD/oJOjZgPeW8/Rx2gjQGhTUF7xjKRcA6L2EEELy/rXxtiLllkazx6d9Ql+stYoLHrtumkzcyRoqC+wmz2j8xfPXWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772217414; c=relaxed/simple;
	bh=MnKwn4c8r7VoVfNPJZe9fCXyDmkqEkobHa7wzCeEoMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cZlSUI0LG5TK25+u/M67SzlJvTzUn/86UBxM0glq1j0wd6kcEva7stx4WChRk4GGOraIwZCizeHUMsxPNe+5LyjpSCdeoWq6jAR5NPD79E/zLMjExMf/bSfs8TeL/CoJt82piFtqiRwNXzjror2qf/IgqI1HJPEJp/jdDZgPglU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=glUMHt0k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cCg5OLSP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0Ixc010580
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KGJMLgt7ilTd+P7ELHPD6A2rgqs3i38pd9WfoMUHTow=; b=glUMHt0kD+/cBU0j
	L6M5kNoBLeNadKa1sU+oFK9gHlfuwXbbVzD3A3do0gNWCCz7DhFzsWnB9QhV7C2x
	10AfS96BASSuk3CWVeNPB1G4N13hcc1wdbS/ENelNtpbFTB4S56EnY9a+dN6sXRa
	7KBmj9s3j4YEr5tbetahfTvbiZyLBu8uhHwh/M3lIt8Q2Mf99/6WaZ/nG7dFb7HC
	rskZ6/vLgqPI0wWMQ2v5gQ91gMJ8blqVB8yvbG4O19q95PqDgElTQJMQKZ4NIRrg
	3r66su0ZRx6nrdPhtsZf0HyvtPZgJfb79u/mDwQmh0ILvLjxotX9Qqdey7AaX1lB
	kULUpQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuytv5ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:36:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb0595def4so2302106385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772217410; x=1772822210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KGJMLgt7ilTd+P7ELHPD6A2rgqs3i38pd9WfoMUHTow=;
        b=cCg5OLSPHD5Yb7iGJ6abI+ZDNeoIzc+ZeArdX3hXYRTLaIYqt2x5hNeiNtaq7AEcVK
         a5WUURkq7+PmBpy0zW9ov5MKNDkyRhtS9uxgdAnPS0HTKqUZbZrK5BCt99fBiTXDIFov
         ow49ygf0raQqsSEHXGVDahkXWOMCsJWBZzO1hO7vJjj+f2dXBb1UPa7wnT+xo2dhud3N
         TpLQCLgzhG4QWgjlzQX5CZC6WQX1kH/YQCUG70Ai+qIKrCWlzFMjxqc94Sd+67LHMpui
         GGkgVMxo55Kzg5u3Bft6J1xl4F6ul5DYD01g6R93eZZz9f6M5KJXT7mbWItaniJ6vXzg
         xxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772217410; x=1772822210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KGJMLgt7ilTd+P7ELHPD6A2rgqs3i38pd9WfoMUHTow=;
        b=m2OhiP+kaobkI0mZvh2OPxVPuMT1SKWJlz1w0aLFlC8F6XX/SLLDV6VPzQ0DzvjxLi
         MZFr27+pXEn5PTO33dWKxR5YPYfVGsssv2q0bnFRj5RoJQY5FYihnIXQsVsF8JG/zp4C
         xXxfGnFbb7P72ESG++uqOGEn6vIxxkvkf+LUPVYu8fUozi8uKPIIcjtwgDyhecoGe6Z3
         RsTjXrbpr9Q3Bjkij1ffMf3WBXevrwG+DMFX//SkKrspagZqRlOp04WzVVVlVu7+PRzA
         7ugSNNLkbCYIPT+EdqF3z2DoGcZojbNEPkzlkurbs7fBt1mp5Zq9J8ftuwueIHsUCDyK
         agTg==
X-Gm-Message-State: AOJu0Yz0Baf5Le6Gv6LE+cg1o3vca1rIDgq7WiKxkzjTeWHO5J+wfK2F
	BFznpv6PenCuqd2FCJg411XXcOYbRnyxLyx4K+Mzv5CoPkprneCRhdFp6AjeJjOC0d5ySO7TXUW
	G2+NMKI7fCOeLoH33Hx7maWnojUZBEOqKTRTmjrvwo0bsdNL2O49sBAhcVciyXNeH6dZ6
X-Gm-Gg: ATEYQzysKO6/6n5IMZ8nIItJ3ht+1EPcZ0cb5hYrMAsAMXcZ8pw4X39bB1OPoP47VUF
	wFSmTSqdmpbDULpX6uLreyKvD8uw07JDke1wNCjxQX9Hrh92VvCSy9Vvd4YMtRoRV9ZWdZVLwTF
	35UQraw4ffHx6G3KncopUntZnfph350d6qQAmJ7tU0jFmswGEG2MMQYvKE8alUoGDJBB3BkTXRY
	kFfIu6A43n63w0FFmfkh4LcsBnE6YktR3+tBlwFBOuRBAeCa853uYdyCSRt6fxjWnVXYNphzF9/
	3gYgkNMpAuowknVOpAghFk8HJLNQhPJThk40JjKqFWvqWmE2R8B6+10h/H6SDjuXEV2bfzp1wIo
	NI/FvhQNAv03x+qRDg1yWM7C0LKbWQ5fYM9eqfQOgrUbAHJRw1L918YMk4U+u2yjzBQFR9V7JlL
	C3HlRYpDYSbOc+FzISClJSlkgrhmS6r+V0ogA=
X-Received: by 2002:a05:620a:25cc:b0:8c7:79d:f91b with SMTP id af79cd13be357-8cbbf3527d4mr897662785a.6.1772217410540;
        Fri, 27 Feb 2026 10:36:50 -0800 (PST)
X-Received: by 2002:a05:620a:25cc:b0:8c7:79d:f91b with SMTP id af79cd13be357-8cbbf3527d4mr897659485a.6.1772217410096;
        Fri, 27 Feb 2026 10:36:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bca0e6sm117082e87.29.2026.02.27.10.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 10:36:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 20:36:40 +0200
Subject: [PATCH 1/7] drm/msm/dpu: drop VBIF_NRT handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-drop-vbif-nrt-v1-1-2b97d0438182@oss.qualcomm.com>
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2654;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MnKwn4c8r7VoVfNPJZe9fCXyDmkqEkobHa7wzCeEoMg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoeQ9O8t/pet96OPdRmkeW2M1nsgKUF8BZQaIy
 7wH4sk3MeiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaHkPQAKCRCLPIo+Aiko
 1WVNB/wPuWJbRQaFjbKoUYgouaJh+77RW6B49NPjzsfRGMyMwuGGomiKiB7jhO6ELJXNmodaC7c
 0shroZMSYTNwuRfQPqaZJ2ZG4zwx9cA4NgmsubFMiOdnBNiOVggi2aGuBzBmf5XmFSX9RWF4/I4
 CblybVJzv+5+4IGY3xWyuYZ7DVwMbRk8pc3mIAUT+3l2EFX57tFP38leFWrBCeTjie5+Awnv115
 bwwtxYRM3XWzqxSDSEM7sFgRR6MGgbhEYRCB2U9X8REYd8ybMcMPVmtvJ8+2ZgrrWAn20IluM1+
 6UkxVg7osSYPXdvCYg9lI6VEt1lIiKdWO9plBYoq7/wN3c6+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=bJIb4f+Z c=1 sm=1 tr=0 ts=69a1e443 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ygBLsu7f3sOcc8VWtk4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 4j_iyitlCWMQS9ZKyHdsDL6TwzVBv7bw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE2NCBTYWx0ZWRfXyie4Jqbnu9ct
 H1chv9xUx0M/Y3FYp8hUzMc6psxOILhPRGlwZmMGqwl89J+j2gU5hPDbz4wKe0Jkh45lzlz59ky
 ydKUpUreAKQjHU9IvgAHupmtVHHWSw6gsnjWNFxd7mGpngxXDduHL4J6tZ2E0Xh9Yvh8V7fxdNL
 6BTdqGtipEzvCtFn+xQovkfhRc2QYwNdOuQB/YpIev9oGGACFm36coEr1ikASeg1Rel6wMjS8aq
 oHsdvv3rRd6jqQ5aEjohnPMaBASmpy+3HNuG2YlHM7kip4QFs8cmuI095TFNyBOt5k4juXas6Wa
 LgVMWh1bg8+q/kI2bhh8SfmhXRPZUz9+bX937yL2EaN+AGNQcneMNsxEddqr1VrmnoVPlz+J7wS
 FtPZItu7MAzYlBcv0RKku8QBsVErx0oNNPmwQp3GNczayBRFR7BXWO5sLxFFsoaezza4H9rN/su
 X89ZAF3/7VwTHKDP+0g==
X-Proofpoint-GUID: 4j_iyitlCWMQS9ZKyHdsDL6TwzVBv7bw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270164
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94507-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 206911BC136
X-Rspamd-Action: no action

The second VBIF instance, VBIF_NRT, is only used for the separate inline
rotator block. It is unsupported by the DPU driver and will require a
separate driver (or separate instance of the DPU device).

The only possible user of VBIF_NRT is writeback on MSM8996, however
writeback on that platform is currently unsupported and it's not worth
keeping extra complexity for the sake of that single legacy platform.

None of the hardware catalogs entries actually declare VBIF_NRT, so it
is left in its default state.

Stop pretending that DPU driver cares about VBIF_NRT and drop it.

Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 14 --------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c    |  2 --
 3 files changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 046b683d4c66..f3cb827034cc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -286,7 +286,6 @@ enum dpu_wd_timer {
 
 enum dpu_vbif {
 	VBIF_RT,
-	VBIF_NRT,
 	VBIF_MAX,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 61d7e65469b3..16f129625795 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1357,14 +1357,6 @@ static int dpu_kms_mmap_mdp5(struct dpu_kms *dpu_kms)
 		return ret;
 	}
 
-	dpu_kms->vbif[VBIF_NRT] = msm_ioremap_mdss(mdss_dev,
-						   dpu_kms->pdev,
-						   "vbif_nrt_phys");
-	if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
-		dpu_kms->vbif[VBIF_NRT] = NULL;
-		DPU_DEBUG("VBIF NRT is not defined");
-	}
-
 	return 0;
 }
 
@@ -1390,12 +1382,6 @@ static int dpu_kms_mmap_dpu(struct dpu_kms *dpu_kms)
 		return ret;
 	}
 
-	dpu_kms->vbif[VBIF_NRT] = msm_ioremap_quiet(pdev, "vbif_nrt");
-	if (IS_ERR(dpu_kms->vbif[VBIF_NRT])) {
-		dpu_kms->vbif[VBIF_NRT] = NULL;
-		DPU_DEBUG("VBIF NRT is not defined");
-	}
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 2a551e455aa3..ede38b3c6f8c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -24,8 +24,6 @@ static const char *dpu_vbif_name(enum dpu_vbif idx)
 	switch (idx) {
 	case VBIF_RT:
 		return "VBIF_RT";
-	case VBIF_NRT:
-		return "VBIF_NRT";
 	default:
 		return "??";
 	}

-- 
2.47.3


