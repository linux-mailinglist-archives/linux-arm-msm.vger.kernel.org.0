Return-Path: <linux-arm-msm+bounces-93373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB7XIM7/lmmItQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 13:19:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A83A215E8CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 13:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3D0FF300404C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 12:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4648C3A1B5;
	Thu, 19 Feb 2026 12:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkAHdzB5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sb7fifEs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBAD3EBF27
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 12:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771503561; cv=none; b=t/xm08lLHHDjQsy7T+Qu01TUJaMAMyMiZZZGrN+wt99fEfLEDg+/hgsh0nPqKxDemINObIJ42a8W7dvGmT3B+ELyujZnH+tC2yX0gdq42XPX9PDeCEy+kSm6wkZ40OEetsx/K6bAw70PD8q8PNn6ta3hKIBSjWW3YfD0RJ3Z2tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771503561; c=relaxed/simple;
	bh=cILG7kZAEzTdG/ciX0BNMM1ChCVTuuFpWpfEtklMVwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U87qkxq7LWEmcSw+GyJXHL0dwMsTAZy8yPamrB+VmDOHP+e6XH9sn6WXePpV/4bafIfOGqBSWU+S/3E0xL5ZOnj5RP4IJ+GXXCkq6akYZz3UMOxAXYfSDT4b8uKgDirBssl5WXuJAKyhanPivFNbQ4gOmCWBnLbg/FRSqkxmjxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CkAHdzB5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sb7fifEs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J47m5x422068
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 12:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R4zw131gS24jr8C8DvGulB
	/BORrY6Rq1789Y5GUHu1U=; b=CkAHdzB5E5+56x3QNm2+QmPUlFsY2CNHsydoY6
	6iqRztaQK88ebTvuIbQSeB5toNV5xWhRezCbfgzxSMXVMX0EStMHRL6eYJ3b9tfc
	d/54uOHjn/EFn14N77nKwOo5SBCvRj8BxI2jmmBX0D0ZoXxW/5UKpuWS88glVRtK
	tLB5hbkFCGM+c5zoHJ9mreDDolB+9kZSvaFCeWT43YRYrkNJ9kzBbLfv1z+5W0oC
	Q/2AaQqO5+njHj1+yomQJi9PP32IYQoLPvufC3rUny+1d6uORWz/8W1We51A19P+
	HvjaYCU6qbENUvr9BSEk4gmmncovp6UWptPqr9Aj7vJsZOlw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd76e4ddc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 12:19:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb6291d95aso1018381185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 04:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771503558; x=1772108358; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R4zw131gS24jr8C8DvGulB/BORrY6Rq1789Y5GUHu1U=;
        b=Sb7fifEsOudO0lrotpmMDln9YDIBdwzAS09Y+WY1appF8oi+miFhszPl0B82sEfhbV
         Zg631CiHrbOi01soRq75R3thBMH+ZpLys0qN6ByU42srXcTsU5GYoo8Y1NBQ+1hnwBHV
         1eRyRdnBqx83jPTAITw9e6lniin6VxAlpG91T3+kfZ1ny2OP6LJZ15ddf/pKAhsGtedN
         3S0l79O1F7XyPXw43tO7Q/iVU+UAD3gEOOCJG8wh8NiGRsJfL3n4FT8d3mCesOOxD5QN
         2e61E9T/xbKNbMrSsgXvUOX4nakmhielw0QDFUVK2kDByNobgm2nDfuosXYr9LVNcOXw
         KjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771503558; x=1772108358;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4zw131gS24jr8C8DvGulB/BORrY6Rq1789Y5GUHu1U=;
        b=tHK9XtKqNkKRbVwU0frTgaxVeHN4P7aneO+0jX3Z8zMgZryHYxg4GvLC4Vblej6Zmn
         M4a+kFLG38svfK4yOrAC3/zH9UunZcPFA1Z8YHwchCGx3T++LiE2FvzmpuaIWeW6VWav
         md97Mpxi5AEYJa4tUUyH+zVFhe02tbAh9HxrZQ2OGXCIMZWakSg8mhfUbXTsLH5t58C+
         FD8jofcghW34Ql0eSkHL+J0bJczow0c+BOTHS6FxsOn6n/4aOi7RwX5Ar1XPFZb0k2YX
         t+uiwQru66+9Fpd5P26RIdwLd/md9P2V48Io8Hra7V7e34lmn91iauVDwOwTHi/PIc+y
         0yzw==
X-Gm-Message-State: AOJu0YypN0gQhw3byD1qwBcdVOjGka4VL10KABRbgi/Sr3fMIc/WeBtG
	dT8oghm7NK2MwbTMIP6uKLGp3RHjKSNcmEa1zRUmzyveWaKbujrbxhlQNwPDzgSuRqCh+MnuD+u
	YzkVzPEZTL/URnOtZYFZqArM2XrT/8hHMlLQqHjmz72k7DA0QfMvY9SKlrqtC3gFqwH+W
X-Gm-Gg: AZuq6aKWbonXqeT2lTz36iCSuJxipjOtfw/j3JHpJ35n7bMPSgaPSfRYfCaa1XTq1Lt
	+wIDyqoMSPtydRDcCfjHyVkEku/ONcPTlwYN49IjUidOr++1NCqTSrClRst4EoQ/PJmVqNDmEZl
	iD6fE5luuqjjjSaUHqkfQgT6SiYJFx2i3CF3Da0PUAJuyKF2s65HHuCe7JLAJWsQxpJnsQsOqwb
	7TsE62HNurUi6wKhY0uRvJSvxfxrAXg/NlVyWrNC2ocoEnu5mmV+R9T1xmh827zM1aOJC4zGBww
	IrW2pALO/lLGYw0ddFwv10iuUjBEGFw9c3uYnbAJ+VgAxOri3aBiw7mbnwJXeGYvx3Qbpo8qEaE
	9i81wl/aXRQPP9CWPoqDqIZbHNeOap/l5lBeJaT8w8UaNuQ1U2xq/icbtGsluveH4SoUd2Qi2RG
	LLhS2Ytku/156uUbnbiia6ISoZmkINbouquKo=
X-Received: by 2002:a05:620a:444a:b0:8c9:fa4b:1269 with SMTP id af79cd13be357-8cb4bfbd4f8mr2213337685a.27.1771503558055;
        Thu, 19 Feb 2026 04:19:18 -0800 (PST)
X-Received: by 2002:a05:620a:444a:b0:8c9:fa4b:1269 with SMTP id af79cd13be357-8cb4bfbd4f8mr2213334685a.27.1771503557550;
        Thu, 19 Feb 2026 04:19:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b90adsm5295878e87.88.2026.02.19.04.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 04:19:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 14:19:14 +0200
Subject: [PATCH] drm/msm: add missing MODULE_DEVICE_ID definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260219-msm-device-id-v1-1-9e7315a6fd20@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMH/lmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0NL3dziXN0UoMJkkIyuhUmSpWmKkVGyQZKBElBPQVFqWmYF2Lzo2Np
 aACgVU0BfAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4264;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cILG7kZAEzTdG/ciX0BNMM1ChCVTuuFpWpfEtklMVwk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBplv/EyRT/xnDFwLoq+Lbzcy81urSNlNBLQdUGO
 aUiqAcARGOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaZb/xAAKCRCLPIo+Aiko
 1X+3B/9bFH4Ytfj1ucqMWGmsDaiqGxetCAHmWIbZwh1+bD19kC09LkMWNoThlywWfHgUp41/xlr
 WBNrmnR/cDPP5/kVf8U37vsW6AHAvIukDanH8hmrQGEGCNalpEHRiN/bQUUFoQmVoG+G8+vsrf7
 LHa25Y4Gq3yqgZE1N4o1Gw9mTjYXj6Egw24cU/bdsebl3Mp2r1w/o4ttNAjpGfBDfRt9breooAp
 eioexEFOozeDg0qaQrK5AkTZjvf7RtAm4+7fG8RICfxnL5N7z6JthnExJ01Dh84W+/jmv5YdE5H
 0/VND3t3FoQzg/0cPO/p4RfXkPXAJ3Mr7MR0BNcOqVkuLjav
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OKsqHCaB c=1 sm=1 tr=0 ts=6996ffc7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=XUzyY04WHD4O6pcxTvkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDExMiBTYWx0ZWRfXwvD0M1HyyhyW
 CqCxg7s91DVAgp6Icp+v93l94WaY5YlTkSkVU7FdYvJIwGTDXz28y6ZUSwjfo1iFeprugHDDooL
 0hepQYUK4alTyEfMBL+2WJ4nBGQ5ABD6TjXIINhjmXj15jP+lGTlFI8OmoJCXfljGosTc+CWPgA
 A8lzfGBCK1m27W0Cgyy4WU3Vq8K1oUu0HXNu/UBf8mPcD2iJjq823oO8z0xHtED6FuTi8R66KdL
 Mf0jhu4m4UK6TxKE60Ied7nv0YsJ7rKTxJ87wj1xfQpaBTuNngjiuqgFQW9LL6ijcws3RT231OT
 tCvuECNVxaus3c45HeqAn4s6fKZJsDmhueILKufvK6B9s02zUs2pxcRTupwHPl3KF0CS9ShKVEF
 Zs+/8xve0o3qPPVN/JbP/tZnar6SusdcRbfepOfWb/ejCpidox5+S9Wy8XKB6ToO4MFDNm++KzW
 valDqDT/gqK+ID65IwQ==
X-Proofpoint-GUID: 8mjxicIjepg66TMHFafCK9Qtg2qy7uh8
X-Proofpoint-ORIG-GUID: 8mjxicIjepg66TMHFafCK9Qtg2qy7uh8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190112
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93373-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A83A215E8CF
X-Rspamd-Action: no action

The drm/msm module bundles several drivers, each of them having a
separate OF match table, however only MDSS (subsystem) and KMS devices
had corresponding MODULE_DEVICE_ID tables. Thus, if the platform has
enabled only the GPU device (without enabling display counterparts), the
module will not be picked up and loaded by userspace.

Add MODULE_DEVICE_ID to the GPU driver and to all other drivers in this
module.

Fixes: 55459968176f ("drm/msm: add a330/apq8x74")
Reported-by: Loïc Minier <loic.minier@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
The Fixes tag points to the first commit introducing OF-based GPU
matching (and thus possibility for the headless GPU binding). Other
are not usable without the main MDP4 / MDP5 / DPU drivers, so they
didn't get the Fixes tags of their own.
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
 drivers/gpu/drm/msm/dp/dp_display.c        | 1 +
 drivers/gpu/drm/msm/dsi/dsi.c              | 1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      | 1 +
 drivers/gpu/drm/msm/hdmi/hdmi.c            | 1 +
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c        | 1 +
 6 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 554d746f115b..4edfe80c5be7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -302,6 +302,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,kgsl-3d0" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, dt_match);
 
 static int adreno_runtime_resume(struct device *dev)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 476848bf8cd1..d2124d625485 100644
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
base-commit: fe9e3edb6a215515d1148d32a5c445c5bdd7916f
change-id: 20260219-msm-device-id-84b95d22c0b0

Best regards,
-- 
With best wishes
Dmitry


