Return-Path: <linux-arm-msm+bounces-92834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id f4ZIDbCtj2lsSgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 00:03:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A150F139E5E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 00:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F37A3016D1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 23:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A657930FF37;
	Fri, 13 Feb 2026 23:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQtGqikz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fCgoFQIT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAA530BF5C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 23:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771023787; cv=none; b=ojJuz+b34cnRqiHsrzpvX0jbMFMhjtJPr6qhpAIqpWyO8dEdiHBvIczYQA+IzdapCKHYjp+VA+4nRgD3F7j7rVZo7/tZ854EFD9BjkDc81fvosoMeERjP6pUlQpveIpr6wb8IXSq6xbB7lxOH1ASM6id0uCOPj4Jj533z6WvxmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771023787; c=relaxed/simple;
	bh=i33TyAUL6ghJdbWFyMgzRLYcTygWgaYUFBacwDIWYoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=thOXZoOF2Ajb6Lid0XMcbhhLVW1YPiH1TFsHFBBcA2Gq+SMwUlqk3c93gh3nkdpSre0+xzEXXwMiALKK+RLYelGvrf4jLi3rQsh3131l09+A4ae3CtB8UTxg3nzYxXq74ECbw9/qqymiZRG8jhRGb7KElsEK+Hq9bugB/UMaCjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQtGqikz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fCgoFQIT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DHrJJl1507464
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 23:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v9zcAzbE8fM7wVN4+5lYRN
	cGLf12p3L4/oFrWpvP+70=; b=fQtGqikzjhoXp1t2H2zKUhQGSfqAnAeEP7nKpx
	5uxZwrWLeMnRZ0i6Gs5t9mQ21wwPqdxc0uh7kySUOSnSvP1XLzu3zMLlwBSnAw6R
	qrebYC8DxjScfjhZDFpsAd0EXMw6vnV61wqFjjcA05rGe+XAz1NxT7lcVX/2u/2X
	ahIGar+J80VfD3doP7gzWWxeMTR8jfSAIzZDjZuhWSb9Du5DpsilBA0pvcBexPjs
	suIQmWSiEzBCHx5mhJAEFUlAOu5bk+HU1JqCfU9zroPC9UsB/hchigoTP9eCUzDY
	4BzILpuZvrAuOBDrGzbzjCgXefq7ACH4AyUwuGwTcvgvuTQA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ca8rdgv58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 23:03:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6ae763d03so173610685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 15:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771023784; x=1771628584; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v9zcAzbE8fM7wVN4+5lYRNcGLf12p3L4/oFrWpvP+70=;
        b=fCgoFQITUxe/f9FNoZ94maNQYz/ZvUZrhCm47gAHLlycpGlZtNy09RO3ibmejKFarW
         +hTg5oNXUuDLuRs4QiYbOWl9MWfQw049Pz2p886WgF5doV3z/F4+rDS6KbP1L94nDIyj
         eC333XPgm25ZTsm7DdDEpIKp4DCJesJiOHW+hJIIxJ+LjkOZFoB5XNAew+YGy82dkohQ
         kCm185IYzvlcY4g3JRUOnBAjhrgRed5G4KLRTPqgAEi1aUyGP9pwzSleCNiSTGtvzDrj
         dq52lLWBgw4Tvz/1/v0NkcyZFbZ90yAzLR9JWBkZ0LpwgTv+Nsi362Pr8FkUHTGfRq7u
         iEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771023784; x=1771628584;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9zcAzbE8fM7wVN4+5lYRNcGLf12p3L4/oFrWpvP+70=;
        b=G2hhUti1H0Auwoe/SCqbmn1IUrg1ptUvsaZS4/c5qV7mnZAjT69ergoht5iSxBwu0r
         dSD3nMI4YO9GPPla00/R2PvSXj7NVxD3+8KzhShiAs/XWyc8ShRAqA4v67iv5BlqjGlR
         Q0MGvj6Cvt25ND35ZVdyHnkohkKoFWC0Dpl4n4y/NzlGWWv4sfHxhUhd+9Is3jJy/K94
         u1AMUxbf7zRi5QmAeLt7xwpwLqZJ07I4+gRzbS7YqT2q0FiHcpTOCsvudriuFSdK8t1G
         nqu5TQDz9pEok5snU2yXQDkdouvw5OCcnaExhICQVw2wnMHBFwjpV5kQPv1msk7miGQ9
         Wk1w==
X-Gm-Message-State: AOJu0YwnDjQvZ4ogWTBcgzkTSz0uQedzNONsoBIiIFZ36o0Nu4MQ2gZH
	5IJ8tchEy77GxE0sjFCleuQFwLnjTz/6Usth2mAzvS/arbYDT1PHKEyAHMqX7F/9aaRvNKIEZuH
	Kk2vxQPDm5c0TRnGMN+TCDgvCH6X8twllwyZXO+/IfRj25w3Qoks8Ermai4xJ0MUMhJUDH3wBtb
	io
X-Gm-Gg: AZuq6aJzxfmEOI34Xx71aKRyLSWWH9iK8typ4pJ79AniIsTzIr6sBjPuaHYws8qYded
	xbAAy3+jhkZQOQ7Xy5Zzy9B73AxRTsys6lpihjqKzZYKrwR9PfUNMI0SKVxDMygSc1pONP1af/T
	TYhCJmnbhGhB3LFx8q6JrzVZcHw7QRu6ELjuGnc1+llSWQTCwuii6l1LgTPC1yjyj7gcXi0pQ4w
	wCGUEvti76tWmsNzqEb6bpAdJuW7Eef2GdGgyYRWmtMa25NcUC9mZo2AguRpheex9YNV2ziZH6t
	BleFzfw+vNRQ6A67mcwzwhW/SqqGpQoDKL5ELbeb8g5b9mrUbzWxMbLBtqF3ZWdKPaxPxkFvekW
	PC0/Oi14oH/Kn+p4wTwRLFXkvENc1TwX8mtdapJVX8X0B8tN9bCK9u8WSUbRYJzdyuh3LJ4xxFe
	LZgs/g3l2ISSn0Ja2sj8AVv3XtaRvjtqtXsvk=
X-Received: by 2002:a05:620a:3901:b0:8c9:fc46:235c with SMTP id af79cd13be357-8cb424afcb1mr449272085a.71.1771023784123;
        Fri, 13 Feb 2026 15:03:04 -0800 (PST)
X-Received: by 2002:a05:620a:3901:b0:8c9:fc46:235c with SMTP id af79cd13be357-8cb424afcb1mr449266385a.71.1771023783593;
        Fri, 13 Feb 2026 15:03:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b062asm1806491e87.73.2026.02.13.15.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 15:03:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 14 Feb 2026 01:02:59 +0200
Subject: [PATCH] Revert "drm/msm/dpu: try reserving the DSPP-less LM first"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260214-revert-dspp-less-v1-1-be0d636a2a6e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKKtj2kC/x2M0QpAQBBFf0XzbIppE35FHrAXU2LbkZT8u83jq
 XPOQ4aoMGqzhyIuNT32BGWe0bQO+wJWn5ikkKqQ0nGSEE/2FgJvMOPaSeUBcWMjlLIQMev9L7v
 +fT9UyhE8YgAAAA==
X-Change-ID: 20260214-revert-dspp-less-8426dee24b92
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3587;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=i33TyAUL6ghJdbWFyMgzRLYcTygWgaYUFBacwDIWYoY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpj62k0mI3LT5UakhcdPql0XWEriNUOHLR+ZgCN
 V19RcwsqL2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaY+tpAAKCRCLPIo+Aiko
 1cLGB/9G2vD96HD1P3/HGbx+hqB96ArIo8y7ugP2WEmk+fgpw+zl+Jw0WEPFyqCfbEApY1zIfzk
 7GCfVr6camfzwpxfYAEPnV0r+JhY0fIvM/0LgndWQ4iVyoU+Q30ywgURP5/EGhOxNBHYNG5s0oI
 auTFdjy0fM05/O55R4PPWHRITrkS7mxa7y58KEVxYZtKCi0uwmQaq7s/DGkw9g+O1bwa4EUyC8r
 3efxcBwnXJC00xL5GrojiGanJPvRMK6XvEGKRtH4IDgBkxaao2ZQIKss+2ygs3kqKZWRhLPg+ZN
 dd9S4K4k1Nl/aT6tDnlpjqUn240/TocaBAjs71uqyuBbEti2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=FJgWBuos c=1 sm=1 tr=0 ts=698fada9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=MJBLmyKdI3ciMax9VxIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDE3OCBTYWx0ZWRfXzufzr5mV8EXe
 2/lVzFYFXVyWtcXqaAwLr23q/5JyBAiiNXI7rvLX3wpf/ldXR0q1vq+V5YJYmonTbjoOKRBj6i1
 yMrSRNI5hD5kqNpuRqooE6WYS3bcRHHzCYaS4QCsRW6OFDrNH0EMx3gJlvHKCfM6kJ71zvs/sNI
 wdsycirKvwpkPbdHVQmXvb1ZZJB7z1TPSOna5VS/f0anId5vb/vYgni2LuzD5lC8w3vkN7M66rw
 eYjlg1gLVwNX9pGIDkEpeATG25sEi/XDkWWkaa73SCvsZqn2IAPemGC7lVo0l5p1fYlw0kd1scI
 o+KXEFJuLyZhi9lk4Rhs++q9Mx13oXv+Kyo7VlRVteeddoAB+e1kkZG8h41YeO1/8An4hRo8D3h
 WZhtEkOeM0gYdu9ri6gpvFKC4BjmiXWlYFenYGNjvGUXC6D/pK57hcjg2yWjxeg0Gl+4wt3L5Ep
 so2NHj2tU2qmxeFwRog==
X-Proofpoint-ORIG-GUID: CRhxviVox70RE5vP4x2_0hsEqvPIpX6n
X-Proofpoint-GUID: CRhxviVox70RE5vP4x2_0hsEqvPIpX6n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_05,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130178
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92834-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,packett.cool:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A150F139E5E
X-Rspamd-Action: no action

This reverts commit 42f62cd79578 ("drm/msm/dpu: try reserving the
DSPP-less LM first"). It seems on later DPUs using higher LMs require
some additional setup or conflicts with the hardware defaults. Val (and
other developers) reported blue screen on Hamoa (X1E80100) laptops.
Revert the offending commit until we understand, what is the issue.

Fixes: 42f62cd79578 ("drm/msm/dpu: try reserving the DSPP-less LM first")
Reported-by: Val Packett <val@packett.cool>
Closes: https://lore.kernel.org/r/33424a9d-10a6-4479-bba6-12f8ce60da1a@packett.cool
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 52 +++++++++-------------------------
 1 file changed, 14 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 451a4fcf3e65..7e77d88f8959 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -350,26 +350,28 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 	return true;
 }
 
-static bool dpu_rm_find_lms(struct dpu_rm *rm,
-			    struct dpu_global_state *global_state,
-			    uint32_t crtc_id, bool skip_dspp,
-			    struct msm_display_topology *topology,
-			    int *lm_idx, int *pp_idx, int *dspp_idx)
+static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
+			       struct dpu_global_state *global_state,
+			       uint32_t crtc_id,
+			       struct msm_display_topology *topology)
 
 {
+	int lm_idx[MAX_BLOCKS];
+	int pp_idx[MAX_BLOCKS];
+	int dspp_idx[MAX_BLOCKS] = {0};
 	int i, lm_count = 0;
 
+	if (!topology->num_lm) {
+		DPU_ERROR("zero LMs in topology\n");
+		return -EINVAL;
+	}
+
 	/* Find a primary mixer */
 	for (i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
 			lm_count < topology->num_lm; i++) {
 		if (!rm->mixer_blks[i])
 			continue;
 
-		if (skip_dspp && to_dpu_hw_mixer(rm->mixer_blks[i])->cap->dspp) {
-			DPU_DEBUG("Skipping LM_%d, skipping LMs with DSPPs\n", i);
-			continue;
-		}
-
 		/*
 		 * Reset lm_count to an even index. This will drop the previous
 		 * primary mixer if failed to find its peer.
@@ -408,38 +410,12 @@ static bool dpu_rm_find_lms(struct dpu_rm *rm,
 		}
 	}
 
-	return lm_count == topology->num_lm;
-}
-
-static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
-			       struct dpu_global_state *global_state,
-			       uint32_t crtc_id,
-			       struct msm_display_topology *topology)
-
-{
-	int lm_idx[MAX_BLOCKS];
-	int pp_idx[MAX_BLOCKS];
-	int dspp_idx[MAX_BLOCKS] = {0};
-	int i;
-	bool found;
-
-	if (!topology->num_lm) {
-		DPU_ERROR("zero LMs in topology\n");
-		return -EINVAL;
-	}
-
-	/* Try using non-DSPP LM blocks first */
-	found = dpu_rm_find_lms(rm, global_state, crtc_id, !topology->num_dspp,
-				topology, lm_idx, pp_idx, dspp_idx);
-	if (!found && !topology->num_dspp)
-		found = dpu_rm_find_lms(rm, global_state, crtc_id, false,
-					topology, lm_idx, pp_idx, dspp_idx);
-	if (!found) {
+	if (lm_count != topology->num_lm) {
 		DPU_DEBUG("unable to find appropriate mixers\n");
 		return -ENAVAIL;
 	}
 
-	for (i = 0; i < topology->num_lm; i++) {
+	for (i = 0; i < lm_count; i++) {
 		global_state->mixer_to_crtc_id[lm_idx[i]] = crtc_id;
 		global_state->pingpong_to_crtc_id[pp_idx[i]] = crtc_id;
 		global_state->dspp_to_crtc_id[dspp_idx[i]] =

---
base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
change-id: 20260214-revert-dspp-less-8426dee24b92

Best regards,
-- 
With best wishes
Dmitry


