Return-Path: <linux-arm-msm+bounces-107967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PctdEzd9B2qO5gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 22:08:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC25557464
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 22:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65F50301CDAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 20:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D700D38E8B8;
	Fri, 15 May 2026 20:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqFP4vvL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DGZuiKuP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09EF37646A
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 20:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778875695; cv=none; b=b31iYob257WgvEKPiz52f+iC3Xzvz7qZNCIq5kG7DYd+cNEm8AUBkbag1cp21hWYowLzXuvaluJsHQCK22l8TNiSVgfiqiqc3mHMBaCoIhiOG1Ok9uPWCOf3yd/zT34xe2FwGW7DWoA+vuEjaYMWNRIaqY/uaRLh7DJV5Gl5SaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778875695; c=relaxed/simple;
	bh=o9kV/6Us7rXJNj4ajF3ZJu/EnSjV+apOEXIsG2Dy4BU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=imD63NuxriDuginR6ZyEQpHmdFBszKeZCMHb4ZC+TDOV8PGqEKJF/qjvcnRk6LPHBS4nqxIb0hUsHKNQNVFB8hbTeu2my8svse7JTnr3UdnFUmRf9DODRmeVWH1e8eR8oB36VfawzWm2cTI9wmMAGBSplcv1rIdpEwbMYvDWfaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqFP4vvL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DGZuiKuP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FJew0r2276468
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 20:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YswUKeQuCvZnfFCGVsUxz3
	zRKWU8pCLFZV6WgjaX9B0=; b=GqFP4vvLOAHnHRZmh0ZsHLi2IqgpNw3izM2+WS
	L3HGcqQuKgtgrfcPwwwwdsNGaNCG3nHRjBuQI/LiYn1H5iRQaOCXcp8fGhAtm9l0
	GgYa6seJCXF7p+t6z/S7tBI62/CoOa2nemrAxLHqxK/FfG56QLqDnWr7wWaKcGIS
	6UxulFKG7dv4+aKeVGAbsDDubvWTW7l/5ixGmlQyow2C2/Y6aUqUeSN92EkvI3Dc
	PgvTTiSaPzDSqSbpPMBihzxPIOh7DasMK+oFqkOoyeL/KkSYy4yZFqa7s07/EZOW
	y6SCknABrXcQF8BE4jSrypI6nCpKs/8lpK3byUypJcmYBkUw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s4r6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 20:08:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-367f715cbd0so131956a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778875691; x=1779480491; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YswUKeQuCvZnfFCGVsUxz3zRKWU8pCLFZV6WgjaX9B0=;
        b=DGZuiKuPaRumYp+ZNxtQ+SeGrhRUkoea576pUAjVXZFu2nJ+loGNAOAZTNttsD/c0L
         V3WI6jx1RAkuQde0qcLHVsi2vmcpYdJwNlks9IvNCodANtevsi4+7XhSuI1bV2OQo3b0
         nafE9d3ssdbMxof/D8MlWghqFIgn5vZDo2sIcCoH6MEUqWTNdD12C76bKiCRNf5/jEFU
         IEwf4nL+0IpQ0se5QqFT5LYPIdWK/jNSiOFSUh4nKh93Mvs7We2ZK0upFZcvN0hAiZ2a
         8Znw44sYIgjgxdY/MigosXswoWka6Ua3s4qohtt8hF1/2LL/Mi+2dY8m5VhaW3a1ByqP
         ixXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778875691; x=1779480491;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YswUKeQuCvZnfFCGVsUxz3zRKWU8pCLFZV6WgjaX9B0=;
        b=OoZD+Esq4P7CV5eiKNUSq8RRQPt379mO3l/GrW8UtOslf4n3IQRNcUIHnFKYUIQ+5F
         AL/LtYKnhjOiI9aB1xnGirJKtnnYflpqmMExgfZwweIOMObbf5aRDFXlypW2o1Pn/p67
         xsD1nPtcVePHt9Xw3fGmhQKx8U/11gsHh/wdc4Z506vH9ws7sbixN4Iv3qHCbFN+7PZ3
         e1DfIKB7n/ZUvwFYxHlPSZJWpxlPjdrjyXn1xgCNd7RBIgA61cknyU7bq6LkPb+qRZAG
         O/PImhC03OVomOadsLj9C2OdYbQXLtRX5fKAJKGlR6tJcZbx4LAReemx75u4J3vitXWT
         WmxA==
X-Gm-Message-State: AOJu0Yw5Dx0fYSqWkoMXMZjGmpg4bxA22dmHuk3q3BwR0wb6+eox6/Ex
	TtFQEYSqdU6eVEbtCB3mV1VXla6N9Oi1I4iQsVq1SOuHDffu/ZGVfX1tmjVQH83AGeP5u2hvH11
	Km7drBi0CPmv0fEoRDidHr4Ygmc84r05fVMRazllP+WO6TGNchwX+xoS1ybkLMKt8iqF1
X-Gm-Gg: Acq92OEfVzsFnh5suCApFX64MYv+G147dHoeLwBmPF9qi/8oDx4nmzXMYhCZyFQrMuy
	3UST4/Vx3EHXVUMFXlSM7H1xulJ6Z+BSuP2LByev+J70Xm+Nn1CE/ZninFq7sTeew78UFN07C48
	M9ZZrlPT7pvxZuMXEeaPyzzUDAK5ezpZBC6GCX2llZwMhggXyJm2lWyD3uXHdMKDxJ3mrxoahhN
	5UH9rqfaZGx5rNwBMOyQrihMMBhLwlCV8k/HYgCU115lcCefYCFjbiKuTEx4+H7yJnk+tkG9qTT
	cVlzn81x2Yic9vIn9yUFkSo0dBA0mtau9d6bLsQCvOKCsNX2MGNcGItOUD8GZJxbSQO5bIAy1Nd
	N3JhmAod3YdlRFBiTYssCxU+T84uLXjf8UaPbU1bUFI7w9Q==
X-Received: by 2002:a17:90b:4e86:b0:366:527:3c9a with SMTP id 98e67ed59e1d1-36951b70055mr6064007a91.15.1778875691561;
        Fri, 15 May 2026 13:08:11 -0700 (PDT)
X-Received: by 2002:a17:90b:4e86:b0:366:527:3c9a with SMTP id 98e67ed59e1d1-36951b70055mr6063977a91.15.1778875691102;
        Fri, 15 May 2026 13:08:11 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369517a820fsm3518309a91.10.2026.05.15.13.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 13:08:10 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/3] drm/msm/adreno: Support for CLX feature on A8xx
Date: Sat, 16 May 2026 01:37:48 +0530
Message-Id: <20260516-a8xx-clx-support-v1-0-62508bf651ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABR9B2oC/2WOQQ6DIBBFr2JmXYwQq9hV79G4QBwriYoCGhrj3
 YvYXTeT/J+892cHi0ahhUeyg8FNWaWnEOgtAdmL6Y1EtSEDy1iR3WlOBPeeyMETu86zNo4wxLx
 igvNWUAjYbLBTPipf9ZUNLmswu6uERlgkUo+jco9kQh8c0Z5xOIFeWafNJ7600Uj81ov/9Y2Sj
 HQl5oVsWVXK5qmtTZdVDOdAGg7Ux3F8AQHrmyHoAAAA
X-Change-ID: 20260514-a8xx-clx-support-2ee492a88da1
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778875686; l=1070;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=o9kV/6Us7rXJNj4ajF3ZJu/EnSjV+apOEXIsG2Dy4BU=;
 b=+YbltNlKR4NJRnDT4wNqIX62otAiM9ohYXWcOrK/lqGI/vBRWUcG7lUIVYzWoMYzTkQeJ/C9a
 FhroBDfZhVhConhu0DLLo22HL958oUQWjE1WrZwdVv0/WxT/UP2KYic
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDIwMyBTYWx0ZWRfXw9InjSDdA7SQ
 FZlZpSaSDCReNk3JBEE56YsDth87MV3OtRSj0wDFITFilTCtT9wTeKBsKMXEWRxjQ1c3rL+uHXo
 YFgKAs+4YgvG+lKZ25MsaYHw7Fa5iYPRwjzC+qrmDo23gUpncTPCr5btNWfZRBOD6mBl2tWgOMZ
 7lAuKnKK5iKFfI5kE0FeBLq7J3Zt0htZ3O70gpN5+lJkS/DW7Ueqgx76QkK6GP0Rtb//pSgtJ1Q
 yHhavabOMyad7GY576bCm+f6b0AVbO4o4dHSc482EAtuBNLFmmz/fvjp32rUWGb9TRD6nASaPpn
 ttCyPaFeBCeHnXeZSAodeEqG5I0aQYfa1Nyz5zcoxlRZ4/mXweEzZ2+3Dc10Eg/LUUiExpjEELH
 mN1Osp5xLDAEPclEZ+k/EkMG7DUP5DYTc9VcXxsE5ZJ2tAVMlj5ErNgOqgan2izuh4Iko9EBcpq
 XIueXXW8ZsbH452OrzA==
X-Proofpoint-GUID: aNtNI3Ih2s1BBNl7CcstmFWkytu0dq1N
X-Proofpoint-ORIG-GUID: aNtNI3Ih2s1BBNl7CcstmFWkytu0dq1N
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a077d2c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=eLcWdt1m_oQY90vHum4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150203
X-Rspamd-Queue-Id: 8FC25557464
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107967-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for Current Limit Extension (CLX) feature found on a few A8x
GPUs. This feature is required to limit the peak current consumption to
avoid HW spec violation on GX/MX rails.

Add the necessary HFI interface support to pass the recommended CLX and
IFF/PCLX limits tables to the GMU. And enable this feature on both A840
and X285 GPU by adding the repective configurations to the gpu catalog.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
---
Akhil P Oommen (3):
      drm/msm/a6xx: Add HFI support for CLX feature
      drm/msm/a6xx: Enable CLX feature on A840
      drm/msm/a8xx: Enable CLX feature on Adreno X2-85

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 172 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  15 +++
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c     |  71 ++++++++++++
 3 files changed, 258 insertions(+)
---
base-commit: b462608de92a7cac450781f9d8d4c7cf3ccf82db
change-id: 20260514-a8xx-clx-support-2ee492a88da1

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


