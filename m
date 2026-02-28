Return-Path: <linux-arm-msm+bounces-94628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAt5L+wjo2mC9wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 18:20:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDC71C4DCA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 18:20:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 818F9303E6AB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 17:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C57A3191D8;
	Sat, 28 Feb 2026 17:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VfSViHF0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ejYe4KRe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9FF2BE7C6
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 17:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772299242; cv=none; b=Ni0Jbf0aGqEnKh8+66kuqR8CUC6roLmWZcrxxN8l+vcaMI9tW3UqCWfehH5zc01l7awI+Rp4vRtK35MsXK0e1obNB2pytuUGWPz0jiTPxQRuqktJzPObr4Ic+GxMIf/s5CmfyrzxT6Y1IKh2HiV6FwkoAr/zN7Pl6t1PyWFXyQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772299242; c=relaxed/simple;
	bh=3bpCONcG+yNO0Z0QsmeAzjerkfH/4aOZ+/Bn/54OTIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YNZQ4o+D1LEv37QAotkZ+WTKpckwjRbKR9HwJthMhSLW8O5uYcfV+8ObtDYmeElb+skUKuSZP2Wf8GdwzrS0c2JqU3ULE5YgQOcRf3vFUOgKjdMG2Vm4lD7GgiFjBi84RZcYFGvPYD8m4/BuX/3iEpTrSZOmBEyF9mBv0A+l64s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VfSViHF0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ejYe4KRe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SH02Zq3444557
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 17:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=di4GhbXiSEzSalaVRYrgLR
	hgIMUKIizf+qoJiGZBlj8=; b=VfSViHF0DfKyr6sJozKZ36z+7w3FZEciMtydhZ
	Mkg63bKG1TkYBBAy+jwJFJWkw19aaMPgW1Q9uwvGsetSSyt9rRoyVorn2S30l4CC
	44n7W7CBJFQs/uDl6WeJqw6v5UhcDAWNUjoVUq8A0JUP3AW33aTiwrVSujrZgfsy
	NmtQO+aVLQu716djita02ykyp0mCdnXHU+Oj6PvVT1gg+WarLqexUzStKGqteZUv
	G6XMZV3wRf6ly0LISEzOrCTMImDGmtmwewPq+wqpRksj/w9GlliW8fhmSrszvKRl
	S6Sdgq+64qOCDDFSP1oCKQYtA44ccQTeAY6fFtyBFGAq0E0g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfgh8a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 17:20:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3d11b913so2599215585a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 09:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772299239; x=1772904039; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=di4GhbXiSEzSalaVRYrgLRhgIMUKIizf+qoJiGZBlj8=;
        b=ejYe4KReFzocGzatl1foY09gtAbCXkXC5eEwLYfHz/P3j8owH4tWiiCAdrybHcSPAz
         ahaP0gmfgc8K5FWdoanGajj/uemKAVLItGu2fA4BSYTWrTiqxZVENRcTOZWpvvXbbMim
         2bKjiBcZ70/6YDL1wzzk3wFACQQbixS6WbUvJgsUAsYyo3Z6Xe4iX3bE3Q9E0r5LYAOM
         kN1uRWE5LTPeyvBxHogbsK96Ri3xMEUj/2mQ/EJMlDty7SFXKnHgI9DYLToDmIzY25Ql
         vt2aD5oN1kma80yXgPiD5qTr6Kq6xD17hCuetBkxbfFMUqA9njGZ18HTLFNW3LeRg3Hl
         tNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772299239; x=1772904039;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=di4GhbXiSEzSalaVRYrgLRhgIMUKIizf+qoJiGZBlj8=;
        b=a4/vKhMXdAi4y1VBmiorxVOqCx3u2uxt+Ie172YBBm3fV8zW/KgBto8EMrEJfmxPXf
         znCGLjzsc8HmXfWEe9qLG3x+K1+8N/CcVGhgmJsbZ5XJQq2NB+kD3iQv4r9T0UT57ytq
         o0l+hxE5Bl6D6YaobTbGyIWZ+pCAPgbiclfhLkYFBl/w7mcKxjowWEt0ARkaOHtBoESu
         ePokaeLdJ88+960ffIwZiCnY2/vNzWQVQPqp2d9iUII1nynWKp2luppOyqi/RQEzVCXY
         PNyKh2lVzex2akzswD1nAZnc/533xcSicxzIxWlqn/PbvqRfNn0bjTIANh7nbbBXs/R2
         7X7w==
X-Gm-Message-State: AOJu0YylL5oBzATRO8hExKTKPXM1y/CCeIFuIWULK+UwcNaBPBLnkETc
	/kv4JZBYV3V8btoD+sze4GIV5cBPyCA8UYjkaYAoA8bLulM4kQpQ6D1m3QMmuaxURxwbqTR+9fH
	TamMs4+HYOQwiy2QgzoVsWX64QNm5IJO2zToN9kNAUI986wqNE0wSJEaO4U1vuDBHPGyI
X-Gm-Gg: ATEYQzxyKHcsr7safXvIg4nyQAoXus6Au96zMoviw2uNEIBIt3U5oZWTtIC8jaFdr4H
	4GuN/Vn9tP3spIVZ52cOodQMMjUaytB8C6Ql4o1WXVQKBX+bbye+Z9gM/ryYZxOKMrvbmaZCKzQ
	6895zumaLVYdjliMUPQ6+S1Jz/EloRpJKkrhL9lBqa+F4ft+lku1aA5yrrEmueNnCAEtpCp5BdL
	vdo+irJpl2eHFgzBi3RzKvtTkWZWZJD+oHDaOfXjZ1x7O7PhnLu9hFtPEWARx3oyZk5+hZyER0s
	i1sfpl60YOBPYiavzELxnnB5JpE+l453DjPejHgQ96Mctp0+hI8j2W6Ofv1kAFeFGVOCDAwZRPD
	8Ib0B7Upv+D/bWsr10q2eSSEpp3MjOvgwwXDcpkoItVLfpH92J5jAPZQeF1uihr68DHUTSyx1Rc
	19xYhlJSetfaS+o2lCZf61/SxFsyb/Rw7Lrz0=
X-Received: by 2002:a05:620a:254d:b0:8ca:3175:cc67 with SMTP id af79cd13be357-8cbc8ddfd17mr899253085a.21.1772299239508;
        Sat, 28 Feb 2026 09:20:39 -0800 (PST)
X-Received: by 2002:a05:620a:254d:b0:8ca:3175:cc67 with SMTP id af79cd13be357-8cbc8ddfd17mr899249085a.21.1772299238989;
        Sat, 28 Feb 2026 09:20:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a118c9747dsm305728e87.89.2026.02.28.09.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 09:20:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 19:20:37 +0200
Subject: [PATCH v2] drm/msm: add missing MODULE_DEVICE_ID definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260228-msm-device-id-v2-1-24b085919444@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOQjo2kC/3WMQQ7CIBBFr9LMWhoYbbWuvIfpgsLUkkhRRomm4
 e7S7t1M8ub//xZgio4YztUCkZJjF+YCuKvATHq+kXC2MKDEVqLqhGcvbCmaNRGnw9A1FtHIQUL
 ZPCKN7rP5rn3hyfErxO+mT2r9/jMlJZTo6LhXjW5Hi/ISmOvnW99N8L4uB/qc8w+03658sQAAA
 A==
X-Change-ID: 20260219-msm-device-id-84b95d22c0b0
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        =?utf-8?q?Lo=C3=AFc_Minier?= <loic.minier@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3856;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3bpCONcG+yNO0Z0QsmeAzjerkfH/4aOZ+/Bn/54OTIg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoyPlLJWJcJT09ZXVsgRibsEDyobt3MXsDbw5A
 TUR7z6jynSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaMj5QAKCRCLPIo+Aiko
 1YRmB/9MmiEXDyHjY0ehqfV3u9XXHjs6QMD1LkVZY4Cg5dv/0GC10Lip74UwtbeXQS16uLVidnl
 caCbkZEHPwlkd/Q1jIpIEy9dEXfvxxkIwpPHCavwpxdCPPGQIaOjTycfBrqEbXkLFV+SITU4Ak1
 F3Srm7U0CThcbQW7GEMkLFARbPKS2GLrV//uBPtj9EuKU3/q8EE3FmJY5HrVtBlP6dpn2zJZpDr
 2vdPiMq4+zlcBYrRyHzt4Qdfmo4cNKbzKf6LGlDBRMTE+yteXWnPg/AE38ZGfu1mjuBFz8AUesg
 z3m65pD3qqaMQHyWXtWA+1MI4rCtNTTx+XuAsu+fAd7Nh2cD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: jPatPp_3sOmidliKsPFR4bbv1JWnjhkc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDE2MCBTYWx0ZWRfX6anmWCmt7nZX
 Ln3a7X070IrMGVrkzvbLB7MQUa+RjXuUMpRbChsl3lT3LokE1s0VLJ0Ow3RaGWKYgx9f7AhbqXv
 xS5M6ZJYEXdaGodCXn7ZigHgFibyh+BZDUy/z1HmfSqOiL7tCL/O/AdjkkzeDt+sob3hWrBNDqX
 +P81T7W49VG6levrFtD/6Uibgkz1BX/zCRbUigOwLy61mBFT7Ny/JXlvZiQ6Uw//pmOZvSBtfwx
 Yn1NaOCeHBtBmh0qBo5lGFI4WPlUyW3+Zv9l5oMQ9aQTvFSEDxkTj2HuY4uYhGgquuBUsgJq9Zj
 FdNXxj2Zd7J6f3J7KFxmuo/WYx+NOUw+6+z8LoedXiT4UtKdZxR6pJ1jNiRW2PQVy16KJZIh2uy
 0cBjW5zNsZAoM49ylZlC2V6MFbChYuVZq3PvcxDF95iQ9sq0XyD4NbTiXRCqOd28/adzyYwtBt6
 9YTxIlFrSmGubJtRLZw==
X-Proofpoint-GUID: jPatPp_3sOmidliKsPFR4bbv1JWnjhkc
X-Authority-Analysis: v=2.4 cv=BIe+bVQG c=1 sm=1 tr=0 ts=69a323e8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=F0DFQ9BaAZryzVM4XpMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_05,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280160
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94628-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 5FDC71C4DCA
X-Rspamd-Action: no action

The drm/msm module bundles several drivers, each of them having a
separate OF match table, however only MDSS (subsystem), KMS devices and
GPU have corresponding MODULE_DEVICE_ID tables.

Add MODULE_DEVICE_ID to the display-related driver and to all other
drivers in this module, simplifying userspace job.

Fixes: 060530f1ea67 ("drm/msm: use componentised device support")
Reported-by: Loïc Minier <loic.minier@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
The Fixes tag points to the first commit introducing OF-based GPU
matching (and thus possibility for the headless GPU binding). Other
are not usable without the main MDP4 / MDP5 / DPU drivers, so they
didn't get the Fixes tags of their own.
---
Changes in v2:
- Rebased on msm/msm-fixes, dropping GPU chunk and updating the Fixes
  tag and the commit message.
- Link to v1: https://lore.kernel.org/r/20260219-msm-device-id-v1-1-9e7315a6fd20@oss.qualcomm.com
---
 drivers/gpu/drm/msm/dp/dp_display.c   | 1 +
 drivers/gpu/drm/msm/dsi/dsi.c         | 1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 1 +
 drivers/gpu/drm/msm/hdmi/hdmi.c       | 1 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c   | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index a082f4d3ebe2..0d8cb362fb0e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -210,6 +210,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
 	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },
 	{}
 };
+MODULE_DEVICE_TABLE(of, msm_dp_dt_match);
 
 static struct msm_dp_display_private *dev_get_dp_display_private(struct device *dev)
 {
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index d8bb40ef820e..3c9f01ed6271 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -198,6 +198,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, dt_match);
 
 static const struct dev_pm_ops dsi_pm_ops = {
 	SET_RUNTIME_PM_OPS(msm_dsi_runtime_suspend, msm_dsi_runtime_resume, NULL)
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 7937266de1d2..c59375aaae19 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -582,6 +582,7 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 #endif
 	{}
 };
+MODULE_DEVICE_TABLE(of, dsi_phy_dt_match);
 
 /*
  * Currently, we only support one SoC for each PHY type. When we have multiple
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 5afac09c0d33..d5ef5089c9e9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -441,6 +441,7 @@ static const struct of_device_id msm_hdmi_dt_match[] = {
 	{ .compatible = "qcom,hdmi-tx-8660", .data = &hdmi_tx_8960_config },
 	{}
 };
+MODULE_DEVICE_TABLE(of, msm_hdmi_dt_match);
 
 static struct platform_driver msm_hdmi_driver = {
 	.probe = msm_hdmi_dev_probe,
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index 667573f1db7c..f726555bb681 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -204,6 +204,7 @@ static const struct of_device_id msm_hdmi_phy_dt_match[] = {
 	  .data = &msm_hdmi_phy_8998_cfg },
 	{}
 };
+MODULE_DEVICE_TABLE(of, msm_hdmi_phy_dt_match);
 
 static struct platform_driver msm_hdmi_phy_platform_driver = {
 	.probe      = msm_hdmi_phy_probe,

---
base-commit: ac47870fd795549f03d57e0879fc730c79119f4b
change-id: 20260219-msm-device-id-84b95d22c0b0

Best regards,
-- 
With best wishes
Dmitry


