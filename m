Return-Path: <linux-arm-msm+bounces-90047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OEZFmgHcWmPcQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 18:05:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EB45A49D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 18:05:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C9F1178E09E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 16:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E9436E46D;
	Wed, 21 Jan 2026 16:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DxoGDr0G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DFXb4Mqe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F41A369231
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 16:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011368; cv=none; b=eWFTkmMlf8f5FNpTxAseEelFpiXyWEBFm0U0iZff+R9gVfPpruVlaaBpJEv63kgrHGzGnICnBJEU2xgQhtc24asTSiLLN0/xewpRGDU5loyndNYk4yiDLgAdgPC7xjdqu+hn9YkP31LAkyb6j4ONZqtSXI8nzddaQ7+yD7+oiaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011368; c=relaxed/simple;
	bh=PaTkkbTLymilZT5IHeccGXhs5FbYXmRp0kXnIdLl+/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sMUQlK6dpHQnbt3KLExWFr9cLqc9/mbjiOcQtmFGAWR+9Chg7uKx4sEkUhXmdhqQCsv+GGh1EVp1Jxn5rqFVDGVgjCP0qG+eB0lE45HpX0ER1f5v54svE4tgjMUW6DLEF1XVimcUseQ9U4coiOXzg6eMGsd5QTZZl86STX3CbW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DxoGDr0G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFXb4Mqe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LAmsWw3315761
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 16:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aMdXQSvss6tWFyMGcNBPhn
	c7uNK1YRXhNFqpjDjbWyo=; b=DxoGDr0GkOfW2gIbT31Uz4ZqrMqx2/E5LGQbyM
	RumwKOKl8XAi3mebUuhlcrDRXWDNZOS4zg86xfbrczh10X16bAi/DeYJxnvPDjTW
	2NEVeNvgp61UWDbaeY5pBfWpEcMb09Nj0xY7W2COoLuJ3fQyGmRA5geanm5BOGsH
	6QqzjpJC4Um8ZTypX72LqL4oJF+3g3IVeFeSHPgNL9GmT7BlrJAo30PWvR1B9r4U
	20YaugDfvhM8DN1FW9NT7noOwpZ7a1eJI7P5VlD+Xt0qHKMYSQR3zJyFCjg37yVR
	gNs/kwNV72K01edCnY1p3sFuZycL1olbFIM6Py/J2KqoxJow==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btwcjh244-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 16:02:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c64cd48a8so44244a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769011365; x=1769616165; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aMdXQSvss6tWFyMGcNBPhnc7uNK1YRXhNFqpjDjbWyo=;
        b=DFXb4MqeJHP40rzgn9gX5uOMRGX/1kZudDVtpfXoKNWD2SP9yZgVdw6MrfmcMguTmz
         pD/GmZR0enGxox7CODvnNkpYQuko/rrfHu1JtoESFpw5/0rIAqfeGeIZ9cYbgESQLo64
         JAP5xCTIsj57BzYDNRZWjahFE6PY/Knld3/LI35j1LbCW+3uE9kZxKPeDeO3nS7dF7o8
         pbHxQyD/PJBdSYZvSNMHBHhGqfdS+xRATcmqdqaGh/tfFIcCdWtPOtrCKzXqnMv/+KYE
         IW6BeuoIgC2OvlYJKKvvtF79//g+/SRUYDC/l+4rRidHud86D8Myx3M5uKHHZ1R3HK+8
         FAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769011365; x=1769616165;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMdXQSvss6tWFyMGcNBPhnc7uNK1YRXhNFqpjDjbWyo=;
        b=Tc8mreEehcCKGz/c+SWWcrzVmtJJgSXibkzOtg7+P/bW2yFvrzKHK1MJE+2pflLuBj
         WbGMFOQ2dDB4q7ZlvEQjeKgJL/swIjz34mlPsp5CUGnm1qNyBF+bfTmfwFMb8MdDRjVG
         /itr6axScyH2WATndOxrKrJgNSN6pYbs7YcL2/Du9BYYXUMIB4abcqFvxJ/sWmrmBb+x
         Kp8Rrrj503RZKARJ+WVKzdn9eYq0TZ/54+HSINuKwf+Pi00bUNQMXvasrrPyFvDFlWkm
         JiseEzXiXEWFQW6pLRl+bjnA4H5DWAdL7f110X4LWUNnbcZtymJ0lzqGCvvCf+cToNBA
         cQbg==
X-Gm-Message-State: AOJu0Ywu4QBdHf2dMRLkPBWT3SQn/xEIZBKbP2eSbrkz1DQbCSI08d0y
	gvh3M5Jut/D8bH5BLWqFcMpTlWNpH4OqXOfUJodBgqm4EVz63CfAp0MyoHe7EVzdjTVhZR0SsPd
	fxLF6JIs7jX5zt7RMiiFkP4lEoMWjPJ2HbQ5sOTwRYE01QfOWuTttxrfqud5HrKEDMgvW
X-Gm-Gg: AZuq6aIekkruTsrqOqXYjCVIkS6PbTyz6MOKsj16k5CTKfYjqEfiDsETrV0xopaWL6z
	OyXrXGiwI8bqcP7wmC3yQyJg2KeDl09vPNYL/2BlEWWqY8C+D8Awc/OhxrEGl5NjezHHaFnWldx
	dKlZdWc1t87GC8fREuk4wCLR5xorgZVP9K1OYobILwKI4qT2b8SoE88bUM82u6/cTU5aK4JI60g
	+gM9+m1rpjIzfDgOhoyPtawDCiC0wYIaQjaGKmF0u9fS11uZaSeJxeDA273QeFt91AJpthwNPpb
	IXDNLamkJxj4U9K17x0NW+PKRrUltV6EIKJig0DC5AV2RgcuY8iZ00S1MX0oRCAhTqIirR5HyR0
	XOyUqq7UjIVRCat7YgBz+r8WQASNnSvoA4g==
X-Received: by 2002:a17:90b:50cb:b0:352:d59a:b28 with SMTP id 98e67ed59e1d1-352d59a0c07mr3968719a91.19.1769011364752;
        Wed, 21 Jan 2026 08:02:44 -0800 (PST)
X-Received: by 2002:a17:90b:50cb:b0:352:d59a:b28 with SMTP id 98e67ed59e1d1-352d59a0c07mr3968652a91.19.1769011363854;
        Wed, 21 Jan 2026 08:02:43 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353032f5e46sm1123495a91.7.2026.01.21.08.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 08:02:43 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 21:31:57 +0530
Subject: [PATCH v5] drm/msm/a8xx: Add UBWC v6 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-kaana-gpu-support-v5-1-984848af12e4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHT4cGkC/3XQzY6DIBQF4FcxrIeWH63aVd9jMguES0tmEAtq2
 jS+e281mXRBF5AcyP044UESRAeJHIsHiTC75EKPofoqiL6o/gzUGcxEMFGxVrT0V6le0fMw0TQ
 NQ4gj5dwIrhuruNEE54YI1t1W8/tnyxGuE9Ljdkg6lYDq4L0bj0UEH/Bib6KnPvk9LtrDbSSv2
 YtLY4j3td7M1+GtiWSZJjOnjNaykqxjNWNgTiGl3XVSf6/Hdrit6Cz+Ic55FhIIdWB5o7SpoC0
 /QPIdKnOQRKgVkjFdA/6R/QCV71CTg0qEmgNA10ArbXfIQMuyPAHCiVk30AEAAA==
X-Change-ID: 20250929-kaana-gpu-support-11d21c8fa1dc
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769011355; l=1710;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=PaTkkbTLymilZT5IHeccGXhs5FbYXmRp0kXnIdLl+/0=;
 b=rXu9YJKS9ujSb5yaEUR2l2aYorjvlsWV7pynHqrZWZahhpAS72Vx7fVtv4Qe6+d7fBolYwErJ
 VKSvfw4oiHkCxTeAcGIyxWG23AW5Gb6Kk9n8pIY61s6/gq+UvyO+cuO
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: FSleIweFwHJ2QkowStvugczQsx9Crq9n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEzNSBTYWx0ZWRfX7D3d3heE11RW
 bsV3XoArdoF+xP3iRugQolgG7YQ1SWu/onEs+EpIDnR0PTa5goUsBucZS+cN5FGngWbwjqNZNez
 p4wHxYbxpf/E3TWP/t/ar2W69jbgELnLuE61UdX66Z4696bz3VHoK1vvkSlAT1ixYGwWy5wll9w
 6XmdUm3IPuzLSN8ZrlHUHq+8FKs+TcbclVwGmex4vD79VqkwU7qQci4q8W25vYmQluw9qSAQOsJ
 gxe16Zuu1nZejnopilPiQhB+k5lVLxsVXP4WtCVxAEuUXRIpZLcbsu9Cxx6umODslvuMGl1Ku9w
 lCPhRyGNnMuD/if3okRmK5NjzUaIl2SYp100sPC21pXrsud30Rs9M953348NA2l+3p7MYcmL8DU
 kFAB4LpJridqrUTBqfF2Dc77/GqicYer8USe9nj/RII5E9jVxSPgnTXx/hf89JptsMaHonkUs8V
 9EB8ZJYB+uWfI3AZZcQ==
X-Proofpoint-ORIG-GUID: FSleIweFwHJ2QkowStvugczQsx9Crq9n
X-Authority-Analysis: v=2.4 cv=JpD8bc4C c=1 sm=1 tr=0 ts=6970f8a5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dVXzBuOjJOJ3YG4SI_cA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210135
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_FROM(0.00)[bounces-90047-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,marek.ca,cosmicpenguin.net,arm.com,8bytes.org,linux.intel.com,suse.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B7EB45A49D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adreno 840 GPU supports UBWC v6. Add support for this.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
<< Trimmed the cover letter since b4 folds it into the single patch >>

This series adds the A8xx HWL along with Adreno 840 GPU support to the
drm-msm driver. A8x is the next generation in the Adreno family,
featuring a significant hardware design change. A major update to the
design is the introduction of 'Slice' architecture. Slices are sort of
mini-GPUs within the GPU which are more independent in processing Graphics
and compute workloads. Also, in addition to the BV and BR pipe we saw in
A7x, CP has more concurrency with additional pipes.

The single pending patch in this series in now ready to pick up into
the msm-next.
---
Changes in v5:
- Dropped merged patches
- Rebased on top of msm-next tip
- Link to v4: https://lore.kernel.org/r/20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 30de078e9dfd..5a320f5bde41 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -276,6 +276,10 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	u8 uavflagprd_inv = 2;
 
 	switch (ubwc_version) {
+	case UBWC_6_0:
+		yuvnotcomptofc = true;
+		mode = 5;
+		break;
 	case UBWC_5_0:
 		amsbc = true;
 		rgb565_predicator = true;

---
base-commit: f185076da44c774241a16a82a7773ece3c1c607b
change-id: 20250929-kaana-gpu-support-11d21c8fa1dc

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


