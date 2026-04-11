Return-Path: <linux-arm-msm+bounces-102794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEcdOOVi2mk+1QgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 17:04:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0AF3E084B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 17:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA7283037D67
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 15:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A622390C95;
	Sat, 11 Apr 2026 15:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBsE8uBl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cnt9b9te"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD6F390C8A
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 15:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775919805; cv=none; b=RY8A9yBElhxcbz1MAWbgqWOWdEcdSWOBKuVsNtbJDg24v956UytDy2rDKxhj3q0vBRPExHAfxWJLXtiAJTTMX2uUijd2s8EgrWKhyRVbLxY8BcD3mioDoFmv5EXMPz2c2vjjhdljFAAQiyfKeIMRAR/9UHjEEnRyE0vQTlXbNSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775919805; c=relaxed/simple;
	bh=wqrddaN2n3jhsDS5bOtswpSG/pYxUxmxlP2rec6vn1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WV02rAn/ajhAqgeMZv1nqqtzaWfX9nLeWfltbTA5SHcibnN35O/Wbhl0P9xs25bREiMhisVto8+4qMRckWy8cbvZS1xg0K8FpUfM9aDrn2ybpp5DHuaZGNb2eIl39NRUaFmm+dOhVxk1G5IdGXYgokH+UOGB+GnsaZXGQITA+Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBsE8uBl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cnt9b9te; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B485RE1201549
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 15:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PHh3WXbGAb1Hiz3qnT0RDUFz5kZgQ0qJD7o
	12cchoac=; b=kBsE8uBlHXRBrLzMHZwcg7vOOG2w4CtDybx80mHiY5nAzkS/kfP
	pXEjYR7C/hro16s9b+F67by1WqLzsKB3+avbN+DLZux+oy+ImEpAwc1x2et2ONv2
	OG5t+DgfrbR1735ZG9WTZlTBKp2/XZDzjz9yttzaQ/gDIJ77qGGd3n7x4QxbK81L
	KOJ0xG/wW1YMzs/qJ4shkUs6H8L3N6guLN72PQsXHbft/oVSo47oipR3ULJJBr3u
	5hdaRvDU9L0t6xMsUOSOgJjXhfK2p0lONR3pUbwSCHd26dAjp0uwmUyJpm/qoxZO
	gfKgubk6kj0VMPWr6cIYsUrOH864dDRxqnw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jrwj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 15:03:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d9278587bso2985550a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 08:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775919801; x=1776524601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PHh3WXbGAb1Hiz3qnT0RDUFz5kZgQ0qJD7o12cchoac=;
        b=Cnt9b9teLcRo5m/g+nW0TS0DFrtZS+XwqnAdooEPN4XUoo5SjUSJmiX6LICP4AWnE/
         e0211CgBCzwHZwdQV9O/MlYbk5eWhU6nXy4kDBFKzsPSJJdkEVI2ZoFS0FLtZTfBLTOG
         Eslagh/6VUObL6wXG3Kxatu0nHO4LWlTHXhBnogRuCpM2u//RsUG0UQ5PcWDUhjJUMm8
         svxiDVMvJ8ojUQpTcqkuzdsbTiDewTVTmQuLrJqloisFxlzB/eyrAE5T7C3/6jgR7lyU
         4RPCy5562O61hTLItVhzjp80IE25yXHOhYmwxiP95b0jYvwljQ3+e3zni182bhZ4gnT5
         cqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919801; x=1776524601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHh3WXbGAb1Hiz3qnT0RDUFz5kZgQ0qJD7o12cchoac=;
        b=KkWF98aYSpjXQPLnLCkXBmhy6baWyrtrvhlgmat5BuB1YjrNwl/R41rBH6RGaEggZ5
         eRAR3wHo+jTqXBBNLKRFePw/IltcVYX475TqTKH+BZSX8HVRgqCEIX3T8nVjkNHWaxGI
         zXa4xgvLFzAotZxicXOYWsdqPEY4+jirjMJDsKyv3UKfvybxvDgmdCzxXrJDPYEmHopV
         6fyZu9zuj9Q2+2PF1I7rfoeYUY6S1xsX3ia60A76zUNK4CV0SCztSsscE7ivTtJj7k7k
         aBDlG+NvMmprLvjWIwigZmkELtqBbHPZXKyvxx9HjiHEGvz0oycUKJ0Os1+EmkFDgRhB
         elng==
X-Gm-Message-State: AOJu0YzEDIAagg/owMnWvuNrRfOwXo9uEIl0p6xO3gyAzXQX9MEJNYa9
	je2JPHDzzhqPrPoXVft1WHMOUHzEJQc+T3zGDjfmmnBUyh4LwWVnt1G9+cb8mHPvW/Dj5Byt60r
	V2Y3cEkw6Oxfo3xOYUhUfbAbxHkG2SlhsfkJvU3S4hqcPgz0qd8vOVywu+D9qX6aRSbg4
X-Gm-Gg: AeBDieshFvQ29O6zGr0dARTXE1TcS5s5Jst1va6Ch6HbOivmibQdHgKh9P1UXYIcqoc
	Ml5miGzI3FpPHEFZ3JugrfsHWGiol7uX5FlHZw5exvhZIirljM1SJehOB/3Xt3O9gaHm2trFtMn
	7134dErbGlbFCFj+ojqGB0+emergFHi3drnngjUl5b/USgIj80No3vtklQmDU75a9WugduV/67l
	dJuVr0b5/39Ml8ukXIvjd5JWH64byi+HtzHf8Q164AxQ211trDw4IM9BKp8an3MMmQFNFBalmzA
	YTQSUPW+xk95/kShAU8cSLgyxnNjOlTXh4beeIDcYVjVmG+VCjmxBjMTZ7Zego46b11rJCJiuOI
	FvJkJF+ayDZVdMfZpW2HcokybWgOnVP1H
X-Received: by 2002:a17:90b:224e:b0:35b:e591:99d1 with SMTP id 98e67ed59e1d1-35e42867676mr7143927a91.29.1775919801009;
        Sat, 11 Apr 2026 08:03:21 -0700 (PDT)
X-Received: by 2002:a17:90b:224e:b0:35b:e591:99d1 with SMTP id 98e67ed59e1d1-35e42867676mr7143842a91.29.1775919799729;
        Sat, 11 Apr 2026 08:03:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e35178460sm10101089a91.16.2026.04.11.08.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 08:03:19 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx: Restore sysprof_active
Date: Sat, 11 Apr 2026 08:03:12 -0700
Message-ID: <20260411150312.257937-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEyOSBTYWx0ZWRfX76BtUKIp+I4N
 bMD5vM/ca6AceaJ+VUxcqnIsbqlVT2f72hqfoBuINcU7SB01JvJKM9sh/sbf+MwklyRfam046zl
 alGCbYNr4mjjLR9UBHWyWnrBlfNsU0BoLxIhKfXbVdmaZ6uu7XuX2X+BIgXzofiWKVCGPovXutA
 R03QZ+m7tLTDdV2L8l9GjXCAHo7q7qKm6hHgpb9jNw9er9dxQHWE/35gk26da4/RvQMUPiQu8cr
 pmOGHd2m8GMYNqSDDmkLaBevGYKa2+Wamqa1fH0PdzXvKcf/wFx1hazdDw8GWfivR5HHNUm2d+a
 /6eJWmCJoXNH77EANFbD2KdTLQ58wd7O8BJAQwwNIqrhb09pECm6SiJx3ENbvfbF8a2dm7lJZ/G
 4Yrh06cOK1x1C3+wSAQWDZHUUXqnP3/i0dePxoLLV1/eIicJVWNrNQQIvWYzQtWwyyVLqun0qSq
 V2+HR7DmgYXfA0MGhSA==
X-Proofpoint-ORIG-GUID: QS_V4viVlNaLrqzjZFkbI_zv-7T6Ua4V
X-Proofpoint-GUID: QS_V4viVlNaLrqzjZFkbI_zv-7T6Ua4V
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69da62ba cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=j-UvV4qsuNM6PKVMxMkA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110129
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-102794-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D0AF3E084B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This got lost in the shuffle somehow when moving the vfunc table to
catalogue.  Fixes inhibiting IFPC when userspace is collecting perfcntr
data.

Fixes: 491fadb2b818 ("drm/msm/adreno: Move adreno_gpu_func to catalogue")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 85607706779b..14b4f4921991 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2751,6 +2751,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
+		.sysprof_setup = a6xx_gmu_sysprof_setup,
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
@@ -2819,6 +2820,7 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
+		.sysprof_setup = a6xx_gmu_sysprof_setup,
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
-- 
2.53.0


