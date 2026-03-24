Return-Path: <linux-arm-msm+bounces-99744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP+TFt0Ew2lKnwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:40:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D4A31CEB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F399E306586B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 21:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F8B3603F6;
	Tue, 24 Mar 2026 21:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIZk3100";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NMcOoMfJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE6935F5FB
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774388443; cv=none; b=FIka1KPyjDM285UXNRAQKW+8x0QomxIUE/UIi32ETbbgzuxhL9pqhn6II1pflhdN93sEOOK7LIK70kUMnmoqoqkzjdx5RQBJS6ZahVt4lbBpBz0MoMxkxHf+RP5CrEj/lW9L6I0IK1eAwbF031kKBJtCZvqJDNLtGXTsnzCly9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774388443; c=relaxed/simple;
	bh=pkhXmXVZvHURhKHC+nkVUkMTS2SiJKwexdg8OqGtF0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H7AoRpsQVWkj6+QggifL6bQKUSU0bIoA+fGM2bDXPFHV7QKKBOrxxZKkYafd8gOL20inOX8sV87BpKM3hvEZXokJwP2BVpnKNFY+P9A42PXpeXjU1vjNb6kuxaEXMt8sFg2jOdIgybqWpDfaUKP0JwR+eYAW95k4b/jKZtYPIhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIZk3100; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NMcOoMfJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJD9Tf2146781
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bdfpF/yCAOLPD8Ocb2NjP1KqYiyPEETUTSx
	GqoUqFu0=; b=hIZk3100jZEvSvQHfoD50BAdccD9YpqNR+8YajQcF/NaIVjyJvJ
	xqZTeFx8O0cql0VGThVAwP3DVwjUoQV11lFG/FPkeJGYE97fRQt2alsWMAaOfZj4
	Wt4BG+lBY6xfOlV/haIF9o0BJy9+0EbbAl42tnGXxSvjGJIrNGf5UI30DYjDaPuh
	wNA7ug1ws/wSgUTXC1w4MZPNbBuYbb4ikMy3drdGSFf7alMgPKEi8LNDL2rUNYg3
	g84nwS6/4AmmvzrItgYNLW1+ZFylaEwUF2sIKNxFsBq7LZzw7MnCDWyl+hYJ23ty
	gyK2Akp2zV8z5sLDc4r7knivXwgSwRAPZJw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3nexuddj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:40:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0601ff3d9so32008695ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 14:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774388439; x=1774993239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bdfpF/yCAOLPD8Ocb2NjP1KqYiyPEETUTSxGqoUqFu0=;
        b=NMcOoMfJNXvDABCp5LR1vfrP4xPwcZBx2gEFRnz/XdddG88IqyO1tfDeTejHnSg/Xx
         VeWCeEzedbhCr9v4BVjDylvbaIVyQbIPq6PjSx6pW6Y32R/EwGEsvZ8No3yqu8iIHeEQ
         Ocq+9oNABP3A2OtLInmKK5FbuDg8u4ogUr7gOG1SNaQ3uuQzi50hv5mhxglxyCZVtQZF
         2mfgBfJnbc42LTG+NsnO7r2ynpzOm3fW2bjVDgPzyepxVtPizMpLSect9D0LSVgrFpFf
         o0FYW7wvEv6w2fbbK/VkyYY6htuK1pnygVprklBh2QZHJNzupm1Aj3miETxSJQo3CR3r
         tFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774388439; x=1774993239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdfpF/yCAOLPD8Ocb2NjP1KqYiyPEETUTSxGqoUqFu0=;
        b=GqW92ELRx4K7hDlffKYx53j5JQxTM9EyaoNadZyNOvJ5CMebQyMtsJ2NpReizUDOGp
         TjhauJ59ijcy5nt2ntuvpOKBInPaSecbfk3b83ahatS4syIObPx0SPaZ4XHLmuEqx5U2
         OxkGJbe0txVloRCKURg//W4qJkChEBvnITDJoDy+gF2hmRTQj0628E46CnRlEVZdgq6N
         ZYWR+IQbihbv+ZOaJCe6qIPppyYagMWmNIR/zjRKID9/AiLyvglUCr6okLIsCe4wU80q
         cqbCbsSKhnRkdxaSQutvMjzK6R+QC0bYeeCBwJnByQ9T8A4bNi1vyEMZyB1JZTyVJWiP
         zDKQ==
X-Gm-Message-State: AOJu0YyssYXWPeGI21AaKmPvn/YbbcISe1pxArEDzVo+OpSPQqsCcrOV
	MTTyCgpL99PGjSIRl2j6+10bwI/PsNWnNaA8qj/CC8qTMtXD/lwBvWA1QuyVznPwCU/oP7dN4FL
	rQAhyUFk4bI82VOMy4oGcozAH5PGB7XSEqOcuBWoHTWPIWqaZ21STA+XFfnXdFU0PAUu4
X-Gm-Gg: ATEYQzxWTRDQYsTZZPS/6+SOEPCvl1ZqsoUAikWgrJKLVHEL1DWegdfyisZ/rl8xWve
	3MgBSc8GriIkh9yLuWgtPsjGRrgbAK6NtcnaFPiy23O9FrdK2kMiZ64dKHpq0dQoz2UZz1vB6mX
	s6261mkauaDTQCGBxK226zWr44SXzdEcYbeUfpa7hc2Yw/ag/99P3xylLavE4U34vkt2QbFVxeh
	Sg311TPNAf45pEVQe19pdiMJglRLPzHn04Qu+n7pu7Go06yInmyOBVMaJ4ZWOInFAFUZZLeyPzZ
	7aKMk3i8LSDDjwi73N6b7181ZIh5kmj+g3a1B42ZuCqRD9ewSJ6bpssJFw7cIkJmpXPEtonOsjF
	NLzSLzJUJGWWJZGf/Z4YE1yoggv8GSi/i
X-Received: by 2002:a17:903:183:b0:2b0:62dd:3a9f with SMTP id d9443c01a7336-2b0b0a7504dmr11689385ad.34.1774388439389;
        Tue, 24 Mar 2026 14:40:39 -0700 (PDT)
X-Received: by 2002:a17:903:183:b0:2b0:62dd:3a9f with SMTP id d9443c01a7336-2b0b0a7504dmr11689135ad.34.1774388438860;
        Tue, 24 Mar 2026 14:40:38 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c56bsm222384605ad.57.2026.03.24.14.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:40:38 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: Disallow foreign mapping of _NO_SHARE
Date: Tue, 24 Mar 2026 14:40:31 -0700
Message-ID: <20260324214033.1219113-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2NyBTYWx0ZWRfX7tTS621E4Q6z
 sPVhmJ148KbtGQVuWqRoOg/hUXDcfNBy/dcDYOA/Iu1+H9DXgK/8y7WurbFOV5lyekRhkKv2Nxf
 rLl5D4+XsSR/Zh/d89z97oEHohtmsg0vcgJAcjIxd0jhwQjWs1Yde3BJrZHc6fSlUUPGJ8LyH2t
 ZBXD89cX1BtfqwCenTIsk1rkKg5iKXzH+s7gweJVWSBMS5URrkGcg+3ppkDWKGlZUZSt5L/RZbv
 V27Necrh/2hwJ1NfG+wsBIugWFZv5tCyTpdNsGKBNyBLSkdnBCKmtRbo2QoxzEDHr5qsuRo4C0r
 VRLEIxvIHa7RmDVH5A7qRDzliI5L+yVX0b1IdReRsXeZN66GISnrMUAqQ10miQJ39bhOpBijXZM
 WdWATXu4LTGoMsKcFXVVBQ/4Rf8ENnVTFrA762szQA4SlpzpZoBZwDJUhXbMR2g5HTnjb1UOC3G
 zPu3/s/eeZwS1eYOb6w==
X-Proofpoint-GUID: 7OFps6ffrCdSmrJPk7p384ijA21dE7PL
X-Proofpoint-ORIG-GUID: 7OFps6ffrCdSmrJPk7p384ijA21dE7PL
X-Authority-Analysis: v=2.4 cv=Bd/VE7t2 c=1 sm=1 tr=0 ts=69c304d8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=h5gromtfd8Ev_kILMJ0A:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240167
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99744-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 11D4A31CEB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This restriction applies to mapping of _NO_SHARE objs in the kms vm as
well as importing/exporting BOs.  Since the DPU has it's own VM, scanout
counts as "exporting" a BO from outside of it's host VM.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 1c6b0920c0d8..68a8f8f592fb 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -373,6 +373,12 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 	struct msm_gem_vma *vma;
 	int ret;
 
+	/* _NO_SHARE objs cannot be mapped outside of their "host" vm: */
+	if ((to_msm_bo(obj)->flags & MSM_BO_NO_SHARE) &&
+	    GEM_WARN_ON(obj->resv != drm_gpuvm_resv(gpuvm))) {
+		return ERR_PTR(-EINVAL);
+	}
+
 	drm_gpuvm_resv_assert_held(&vm->base);
 
 	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
-- 
2.53.0


