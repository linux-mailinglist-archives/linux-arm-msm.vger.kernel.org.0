Return-Path: <linux-arm-msm+bounces-102661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPCYAM/H2GlQiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:50:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 850CD3D5354
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E63043051ABE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2344B3C9EC2;
	Fri, 10 Apr 2026 09:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lZ0coo/7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUDkbp0K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFE43C9454
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813826; cv=none; b=Qv4qUcV681z/OGYb3XwmYYeB5gZVrIR+ojDiCH8eXJvccX5crUGlP0W0nAnj9EdLBsy2Jc4/SNrdsJSqbww2FdpJcwNNhce0g/NqyXevg7kfQbxniDiXOaOn6tjjPUFWLHZFnPAGXTVR/QVwuYUrzjkfGOB1m3LfQI0/lebA2K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813826; c=relaxed/simple;
	bh=KuOg6zA+KjDAl5r8ysYKfOvdzBihYfC530yXzHv+oiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t3aZza+FoJUU+eX/F7bR6M8AhMewJupttEqOd0b2+EjMizb4kjjkflVALSb0dnT6S63m/UvTvUU75PpX3nWBpPmeq2viIxmODALJQL0QSpDXezkGdqXfIts9vube+K0RKG0ZbZCUswbE1HxprRMBiTxMHkYo0pptiqDvom9Mv5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lZ0coo/7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jUDkbp0K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A6px9S1729915
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jwyaSLx7WP6VcW777K/h8YgHTkkKgb1+SwGqHORpopQ=; b=lZ0coo/7TB/Kc36/
	6gLEA193+NrnUEVKZLtK80SeQxtk8+jYixo74sUSKKOa9q7j90NLxWewkD+oEI9A
	hiM0ah2txLoo7OVZMpS1p4jhkeKifYgJ1051ntXUZbOPhkBLtmy2MEAUno1CZjd1
	s9MCIMKGscLnSoj163PHKunAup3a4F6n1x/FfY65Vie9u7AW4FVzU2ZShsO/oqTn
	IsUVwCI4UnJ4scHM2k9jf3n1nK0q94XieI195BAhS+knTyvZVxk8lt1EERC4rs9E
	B7C9SXVc9LecpJ2iUy2wNuSINR5EtRftGukLSoK5H2SAwIxseb7vC9b87m6oKts3
	0c9Nvw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckxknf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:37:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d654ade33aso385591485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813823; x=1776418623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwyaSLx7WP6VcW777K/h8YgHTkkKgb1+SwGqHORpopQ=;
        b=jUDkbp0KiOtjHB3jwRrS20enxTe8ehPy5FgsZtbIgiyOehKpEojESV8692kKEV6RU7
         VCF/vzbLRAKwSGLD6qUcBUFwNw2GJxIK8oZaID6/8Fo8Ji37isBewospDSbrNDEaUL5Q
         +j0T2xEKIAfiqoHLHbOIc8bOpCCLKxUJ2dWLL66llj9GMHvZO4P6j8WV/NWS5xNg0UNO
         fpre1p7jZ15cAQWBCZBE5bnKeTKuc3Q5YfX4TNodgQWp8g+d6vQCWUvmWJpNK42gfPXX
         JVcAxvQllwXM6jF7tduyR0Oo7b/dtB1wSufwL5FPOe7G4XQ77dpxg7D4VLu9EZHcZ+Mr
         mQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813823; x=1776418623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jwyaSLx7WP6VcW777K/h8YgHTkkKgb1+SwGqHORpopQ=;
        b=sL3meNbu/adM7A/GUH2kMToP5pGixn1mUntAAqd445AAjPqI67gOA3JL8MDXwqGTHS
         NRpcwsEXzWcxCCTNrS+K17Y98EQmH7Fx7v4SYUZc1LF8m3+vTGTdHAXqAwVmDz1Wle3e
         6qvhzk9yYbSFqf/8vYaz93+OQMGRJu+lI37/YTXPYfs6zm+RpFjN1Gr3Pt+hGzHo3AWm
         ECU36Vnq1KV4FVksWYYxOYfgBn8c03P1L2Qiyu7bCn6Ap7Ez/ZxjblQ5Trp+oHzH443N
         byKdWjvVG/S5gPZYsVJQezaAUOKam8dVTEivpw/IAeq4CHdwMWVxEKmouohYRh3nFspy
         RagA==
X-Gm-Message-State: AOJu0YzNL+LSu3cOALstQC4rlFTb9/33m+ZV+K+SAKwOpFsN0rdqilQb
	lH2/DLS3c5sJyT4/RkIzZ6IhBeCKM/lPYvvT8JZtJDVmm+pg+qZooCtuxe7A7hfsCltB2nULKSp
	ddvDYKfblTAUdXqx4OP+41zCg7RUQhc7+MjIIYTuLVu+JYlaInuwnq208SE6GlahbXCHCJ3Z2zM
	FJoWREtQ==
X-Gm-Gg: AeBDietYIv8p5xeZPpS5n/4xeb4t8xozm6ZxWySl61ANXMfQtIUB2en+VMaYNIJgLBl
	ScqAS0BH72t7fcLvOsfuXITO1ayrRNRW74yECpP7RBQUJo2MLkDyL7VVyfGPIMkV1ZbpaEmwpg2
	eBM6n/OF5NavipnQesJDASeQq6b075iKLg8iBpKpu+6H4WSdVLiuVZu2liwCmvW6JlcWl209UyN
	W9rN3QcINFu91XiIdaMsZs1ZVlBPvY9K4NAxy2R/Xixez9IXaLs2Q4dmHlhQLY+4Y2i98TeCagt
	MXcvVQqMhkmOcqgjJQOMTaskGWHqIFGzv8pAooUUmv+Ve9IbGKzo4brTAz3WDHmTaFMA5gakaSA
	HJU5LzVFY3UmKWesbxXNviOhn17QfnO6z7w5sUTJTXdqU+gBPctzbn/Jvtox4Zhft/31Calk+Kg
	zl5sE7aGA=
X-Received: by 2002:a05:6214:8084:b0:8a6:ee21:6587 with SMTP id 6a1803df08f44-8ac860e5cb9mr27226346d6.6.1775813822788;
        Fri, 10 Apr 2026 02:37:02 -0700 (PDT)
X-Received: by 2002:a05:6214:8084:b0:8a6:ee21:6587 with SMTP id 6a1803df08f44-8ac860e5cb9mr27226056d6.6.1775813822357;
        Fri, 10 Apr 2026 02:37:02 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:37:01 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:34:13 +0800
Subject: [PATCH v4 38/39] drm/msm/dpu: use msm_dp_get_mst_intf_id() to get
 the intf id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-38-b20518dea8de@oss.qualcomm.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
In-Reply-To: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=4727;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=tf8lOCOzq7v76ffznqEiuDk7GrrHfQZgwu4BFyIs6Ho=;
 b=ORQMWvfYqemO7djs1PTxP/rpq2HrJezodh3ZExIRRm3tOzK4xnbPEZB/jepGNbycSBJ65al0F
 PowfyISEfEQDE4aN/faWpR8kD34qe+ZaRf1987i8Dz5GtLLsIEsMRJP
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: lxDW9J_SFwusQxj1ZXD-j-OLSV2nKKdY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OSBTYWx0ZWRfXzNJbrtIQpeSq
 wpvKTLKom3Ql8ZBeOiqk8PCdr3pUMJCACqzVSyiuB1ka09OKLWbtWMv2ZJP+6TmMdohpYW0CL3G
 nB/aagyLaSO+++c9Qzq8UXSwPqd3Ovg0OAy3QyrQAHjD9BMwPdSti8ZsspslF5IpMuD6AjATBzZ
 AI6PG9gDwEf1Vyjvl7SHLgMv+q0gTUNTlcXQ9LHXcLoridNp6jMjK0WOrVrgnwmlzgN2EbTBmdc
 EYuolgyro4yHOo2IjiEWgvm98gMipCZ5hbb1WYGDWmmTwDIzg/oYtAzQ/cacvHaPWUxmk+c7Oqa
 xI5ReuVE7dgOTWYLqQ4Um3h7aO3VV0hktaCGpON4oWxjsgtfgVIImOENgR8xD+4SfKGxhr6FufY
 kj4sjAD6rcEDbYi+lJpxCSSvDd0VaSXvRK1E67GilhhkMyPHWS5zCcHmLl/1BuegMnNLwfsm6WL
 qzVsWNMKPl+Ssg544wQ==
X-Authority-Analysis: v=2.4 cv=OMcXGyaB c=1 sm=1 tr=0 ts=69d8c4c0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=xL80pz1hMqKSlDDrj7YA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: lxDW9J_SFwusQxj1ZXD-j-OLSV2nKKdY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102661-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 850CD3D5354
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Use msm_dp_get_mst_intf_id() to get the interface ID for the DP MST
controller as the intf_id is unique for each MST stream of each DP
controller.

For DSI/eDP/DP SST, the stream_id is always 0, so existing behavior
remains unchanged.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 +++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  4 ++++
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index eba1d52211f6..d6813107a27d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1438,18 +1438,21 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 
 static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
 		struct dpu_rm *dpu_rm,
-		enum dpu_intf_type type, u32 controller_id)
+		struct msm_display_info *disp_info, u32 controller_id)
 {
-	int i = 0;
+	int i = 0, cnt = 0;
+	int stream_id = disp_info->stream_id;
 
-	if (type == INTF_WB)
+	if (disp_info->intf_type == INTF_WB)
 		return NULL;
 
+	DPU_DEBUG("intf_type 0x%x controller_id %d stream_id %d\n",
+		  disp_info->intf_type, controller_id, stream_id);
 	for (i = 0; i < catalog->intf_count; i++) {
-		if (catalog->intf[i].type == type
-		    && catalog->intf[i].controller_id == controller_id) {
-			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
-		}
+		if (catalog->intf[i].type == disp_info->intf_type &&
+		    controller_id == catalog->intf[i].controller_id)
+			if (cnt++ == stream_id)
+				return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
 	}
 
 	return NULL;
@@ -2675,8 +2678,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 				i, controller_id, phys_params.split_role);
 
 		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
-							   disp_info->intf_type,
-							   controller_id);
+							   disp_info, controller_id);
 
 		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
 			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index ca1ca2e51d7e..2eb4c39b111c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -28,6 +28,7 @@
  * @h_tile_instance:    Controller instance used per tile. Number of elements is
  *                      based on num_of_h_tiles
  * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
+ * @stream_id		stream id for which the interface needs to be acquired
  * @vsync_source:	Source of the TE signal for DSI CMD devices
  */
 struct msm_display_info {
@@ -35,6 +36,7 @@ struct msm_display_info {
 	uint32_t num_of_h_tiles;
 	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
 	bool is_cmd_mode;
+	int stream_id;
 	enum dpu_vsync_source vsync_source;
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 89868443c0fe..305d4c76098d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -612,6 +612,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 			info.h_tile_instance[info.num_of_h_tiles++] = other;
 
 		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->kms->dsi[i]);
+		info.stream_id = 0;
 
 		rc = dpu_kms_dsi_set_te_source(&info, priv->kms->dsi[i]);
 		if (rc) {
@@ -687,6 +688,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 			}
 
 			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
+				info.stream_id = stream_id;
 				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
 				if (IS_ERR(encoder)) {
 					DPU_ERROR("encoder init failed for dp mst display\n");
@@ -720,6 +722,7 @@ static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
 	info.num_of_h_tiles = 1;
 	info.h_tile_instance[0] = 0;
 	info.intf_type = INTF_HDMI;
+	info.stream_id = 0;
 
 	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS, &info);
 	if (IS_ERR(encoder)) {
@@ -752,6 +755,7 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
 	/* use only WB idx 2 instance for DPU */
 	info.h_tile_instance[0] = wb_idx;
 	info.intf_type = INTF_WB;
+	info.stream_id = 0;
 
 	maxlinewidth = dpu_rm_get_wb(&dpu_kms->rm, info.h_tile_instance[0])->caps->maxlinewidth;
 

-- 
2.43.0


