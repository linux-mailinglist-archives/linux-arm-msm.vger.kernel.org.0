Return-Path: <linux-arm-msm+bounces-89964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CK4rGduRcGkaYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:44:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCCA53C5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BB2F9485D39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 08:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D413A1A45;
	Wed, 21 Jan 2026 08:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TxMwatJv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ETFbN4Gj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A78366544
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768984891; cv=none; b=r8ST5FDs3+ZmXATKO0/lr0xFriExZS0NXxlE6DHfIvOMsifEJwd2X5SmA3SC/pWnZLJYlqOP71Jf8B/tAfPH5UVjj+SWGFCV8HBFgqGv1RXpdyUd0VTMzv14pcq6WNRkoB8OZkm9LrgfQDbnR/HXgta9izMgOk647mADCifmyFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768984891; c=relaxed/simple;
	bh=tGll1NZ1pA4+eOdvi26PS3E8EZix7M+Uzc8MRUn/cMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LR5uNjxgQRdSacxoXI+XgYnY1EKlRiscwVUZpsH19/5qNNICl3Hp3eOqgoG2vIqLCg5pilv1RrIvl2QcBAhbdfhqH8qe079stsbyyvTiMs/DsflEuQL8vHlF7En6H6cKi4EW30XzZRjCtI+ZbEjnrH2pEjJ7cm4TYZqHvumP06I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TxMwatJv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ETFbN4Gj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L6XSu12938620
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yeMFdnZhct9ypef2FzFYAq
	U9V0XXunlpmva7L5DYImc=; b=TxMwatJvAWfEEezD9TQLcdUEnuNhAoQ9zJjrei
	I7IDBjvU0rv1leDvEXd6iVG+hzrGcktfwuhVjeUv4oVwIWntBw7bwSGysmZpCtpk
	FEpKXG34z6ObY1FIf6N40021MWgpXMdty7VAD9ON/lVI9NlCP6qunlIpAFjaFuKL
	JbreGAk8fxxL+UcNs4H11vjEr5NWB0EMh92MzBiLVotGZST5oAfUMGWQ13wAUiv0
	BiqsXY2EMKTCN5lSHuslHS6qxdX9jcusgSJxjuR2ks/n5cS5KbOwq9SFm0VCggu5
	N35Uoj5S9KHV0PuM55oWNFOwCWsSe8xUmdINZMy4VsqZe5yQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btsmu8e5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:41:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a69b7813so1242383985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 00:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768984887; x=1769589687; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yeMFdnZhct9ypef2FzFYAqU9V0XXunlpmva7L5DYImc=;
        b=ETFbN4GjlFWSdsyZfwQ+ICBwlqB+6O+Ab0Mv2udSztcotLdebb1KPLxyFgzOUZwmOL
         60WR4D2OEtH9LLDm6oQ5gFP1mZwieYCM2F2YYe+39S2qt/tfnrFUqbKxtIh8oeh3FC8Z
         7xB12BLHK5hbzddEEiRkNPylHK3y5wQ3M6oklf5WH26vPk0qj6+iSlzdN+os6xZ5+Nxs
         0+aVJQlQLkfwWewWeuNZX5P1OH6kiOlUSoWSYFcQ89dVVHtnagxE06DG2snHkP3DNko+
         n183IqLPvSleDM13h/5bIN7kVjOBbYYiCiZ2VkHcjGaYXZMmfDIczuOr06ZKg6TrDOGh
         yGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768984887; x=1769589687;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yeMFdnZhct9ypef2FzFYAqU9V0XXunlpmva7L5DYImc=;
        b=KKD2B/5uIhiYflBHIY63bEbQ031eQQPREirAnX9AJVT735TCjnta1znycr8N6MYsvr
         xJibMXqMdZ7lEXreVWoI9ZaysEEC/VgLN46N/tUU5WpHedXq+quVtQmx0va19a/47aXk
         qOmCSsz5ylsl5Kck/NroGXMMnWCgzcH0VQf8q1H+NS8X7XrFuwzKIXk4OdAG51nHBICN
         bUzMvkW8S/3M44Nqs7kB9I3z5cpxsUz8xDOM5Awx7KhVUzqL5iuPowQUTlVbCZHEiEwG
         6p8BDKeWQ2YgD/uH3E3InYNrCunA3rqAkMlfZWVNYpSKWqOkG6U8yvyH1xbZWXE2jcG9
         FV5Q==
X-Gm-Message-State: AOJu0YxThy5FWVsme9yB3ox8HOZwOQIrhNzqzs9tMGtvIUIvyf9kNk2m
	0dZSMX4M/MjANCDBjLBZnoqKmzIPsO9ouJkeMKtrmB9yY5AP3cJ/fsLimD1hZX6xekoYnUFkiww
	6gXIAsbY40B9kLH88KNk++la3CvyqZrqlf/1byRinbZAtqR0+S8Yc4vbAnqluXB9/OYnt
X-Gm-Gg: AZuq6aJb66j8nYzbfW/mTIbONh8rlM+zlIwZsS2fhq46J/adnZbxnF0FL3s8qTupt4V
	Bfnwr0PY2u19DTLIV4QkF0JuXSmasIbRi6XnUr1BraitlqUvSwix+Qa8bu6avhr0xdes+LinoMJ
	bCh4zphM7TmhVxZEvJgf1y7UQpFbKizZxQlmo7PcwobCSCxZNxGQ2AARlIBZf0SD1grcWOqvbs1
	pE4Oei/DxL4w5RlWVJ8Y5ahh4JReCRSWDqVPaNxcQ3wCTMoCqPhQcIeuGp4gMQEKP9ZKBYsoeJO
	34vlgYJr1dz3lpgwH5/VMRKJkJWj8WP0N/gA2TMpQVNjgAl2CQY48tLVGJI27Vq/TH8KKCVpgMP
	blcmdFtRMo4Cf1MPA6xRQliFFnkBCt8yRoS6wkCq6Yh5DBBIJChovC4O5nqAJ3OFZIBaREFQ5YK
	13ksnw7Zmdi3oIyiMaIM8UtC8=
X-Received: by 2002:a05:620a:1aa3:b0:8b2:e1bc:f2a2 with SMTP id af79cd13be357-8c6a693b4a1mr2256019985a.54.1768984887424;
        Wed, 21 Jan 2026 00:41:27 -0800 (PST)
X-Received: by 2002:a05:620a:1aa3:b0:8b2:e1bc:f2a2 with SMTP id af79cd13be357-8c6a693b4a1mr2256017685a.54.1768984886832;
        Wed, 21 Jan 2026 00:41:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384fb8ff0sm44465851fa.45.2026.01.21.00.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 00:41:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 10:41:24 +0200
Subject: [PATCH] drm/ci: ignore Gamma test failures on Qualcomm SC7180
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-dpu-sc7180-ignore-gamma-v1-1-84f2cc2beeb1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADORcGkC/02NwQ6DIBBEf4XsuZuCrdL4K40HZFfKAbSgxsT47
 yV66WEOb5KZt0Pm5DlDK3ZIvPrsx1hA3QTYj4mO0VNhqGTVSFUppGnBbLV6SfQujonRmRAMkh2
 GppGG6SmhrKfEg9/O53d3ceLvUgTzVUJvMqMdQ/BzK0IO9xKMvM3wL29FUddKKn2qDRFSniZ0F
 in5lRPampSVr561lu36gO44fscVQW/XAAAA
X-Change-ID: 20260121-dpu-sc7180-ignore-gamma-dcff660aed40
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Federico Amedeo Izzo <federico@izzo.pro>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3136;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tGll1NZ1pA4+eOdvi26PS3E8EZix7M+Uzc8MRUn/cMk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpcJE0vJ9qnJj640jYv7D4WAB0CGmIqVK9Myr1L
 //sjjLua4OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXCRNAAKCRCLPIo+Aiko
 1ckRB/4xAwDRi6sP3JPena9Q9IIv04FnFRN77ZfySBh/iCCpAK26tMGdSCoJeID61W+rgMDiHXi
 J30FeyoZ3vmRQK1t5lIW9UYvhvG429IEqU+gSum2ZJeh9l7+ECI1eD5MCDn832HCKM2x3bFXRho
 P7qZQuRpPQ5CD+Do7Fj0zQvLDNsz8aH2lonteSFpzQcj1oZcdcLNdwRZx4fAXlFMClp2euOxWF2
 06f5i8xlHUjv2LuW+E0MaIhmU561tWQmsw5dGLinDzCDUa7kaf9sY8SvOzn+SSIvQ2RDJWE7c4C
 CiXx6wL5sQQHIQwfmmOhT3WXPnYZWZ1+gy3j5dM6EzPOmQvV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OaiVzxTY c=1 sm=1 tr=0 ts=69709138 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=k6hloDn7IRukykq9zegA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: C_8Ik2R5AnHSgGY58GEDa_3dbnsa4LqQ
X-Proofpoint-ORIG-GUID: C_8Ik2R5AnHSgGY58GEDa_3dbnsa4LqQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA3MiBTYWx0ZWRfX5Z/5wNEo3xoX
 +EUb53j0wS5V983fwQi8xtTcuxn5RWuvrfiRQ98HZ2q6ZLVFNRD3lzFv44jFZPxCyJnzszpm6bJ
 wVxzkjWbAYmCiuz0PlTgU8ZyyIGpOqTp9WPDEhh4s23o3p9sZqFlpGmqRe0aIuNSZGFE0u+EHTl
 1pUP79oZm+7Lv8xdBo/sI4tW46dIUHWEQ0eslyv53aEQ/q7SC3MV5RDSGNlsfR8dRPvgs/49zfj
 JAv+I3O39Ciqj8d6TV47skkNj0mKXDjWL/Wbqr9/E/7PBqaHMHBFoFr4i9N2bHQB0hgogVIhkd/
 tVtqqSHUe9szXw4qeis6O2/RI/5qPvxFvGwj0xZpCN46SVqUFp2FEWrWWK6L+dmcpYk1iBfV7w+
 CCnQckNlxqtRNfDOaRfPYIcF5LCiKDvlfvkdxH02/JiPL+zSjtq4k8MsAVHDXrYQkOMqXcEklDr
 f74iawTP29FcMLore5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210072
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-89964-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,collabora.com,linux.intel.com,suse.de,ffwll.ch,izzo.pro];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2DCCA53C5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It seems, on SC7180 color conversion results are not included into the
CRC calculation (unlike SM8350). The fails for SC7180 already lists CTM
tests. Add gamma-related tests too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
This is the fix for the IGT failures reported with [1] applied. See the
pipeline at [2] and [3].

[1] https://lore.kernel.org/all/20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro/
[2] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1587979
[3] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1587942
---
 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt     | 4 ++++
 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
index e4a8f8352cd6..ae36a39619c6 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
@@ -6,12 +6,16 @@ kms_color@ctm-green-to-red,Fail
 kms_color@ctm-negative,Fail
 kms_color@ctm-red-to-blue,Fail
 kms_color@ctm-signed,Fail
+kms_color@gamma,Fail
+kms_color@legacy-gamma,Fail
 kms_cursor_legacy@cursor-vs-flip-toggle,Fail
 kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
 kms_lease@lease-uevent,Fail
 kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
+kms_plane@pixel-format,Fail
+kms_plane@pixel-format-source-clamping,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
index e4a8f8352cd6..ae36a39619c6 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
@@ -6,12 +6,16 @@ kms_color@ctm-green-to-red,Fail
 kms_color@ctm-negative,Fail
 kms_color@ctm-red-to-blue,Fail
 kms_color@ctm-signed,Fail
+kms_color@gamma,Fail
+kms_color@legacy-gamma,Fail
 kms_cursor_legacy@cursor-vs-flip-toggle,Fail
 kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
 kms_lease@lease-uevent,Fail
 kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
+kms_plane@pixel-format,Fail
+kms_plane@pixel-format-source-clamping,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail

---
base-commit: f185076da44c774241a16a82a7773ece3c1c607b
change-id: 20260121-dpu-sc7180-ignore-gamma-dcff660aed40
prerequisite-change-id: 20251017-dpu-add-dspp-gc-driver-c5d1c08be770:v3
prerequisite-patch-id: 7a52c31208202effb5cc4b7aaf6d6a75eb9a258d

Best regards,
-- 
With best wishes
Dmitry


