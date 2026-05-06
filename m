Return-Path: <linux-arm-msm+bounces-106156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLSHFWJ2+2lVbgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:12:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 309734DEA19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 649A13006134
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 17:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143D74ADDBC;
	Wed,  6 May 2026 17:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OivMl99T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cxpTvBaf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD3A4A3403
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 17:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778087514; cv=none; b=O2ppiQja7DnrHtNL5BF3OtAqgBGG/vMGzDlKwF+1eaUy7Svn18HLEQ1Bt9he1Qc8DS2dMDLmaI7UvFb+/3RqRtexy/JBXtQ5Y1JdDcWPvyfR1tvl9HOqguBLaghL68Hz9colY7nUxB/nmpEhuboMkCwVx7xY0F9xQ7tQLsMym9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778087514; c=relaxed/simple;
	bh=/NsgYCf/YJOjQfBrxIduQkHUSM4dKNrQiRj00JRK8V0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FRWfCOnn1FIJuIeWdwQh70yDomnVfmK/QvPbpDJAoWsBNiw0yPcPNJQbQf2qUJninLrS0n8FmjcQ2NGWYmdpSDZoUSDa3cORHOeXHma4MZW0BolLDfOCNKR8VvpRtg0Zq7naK4shdwT23co32oqdl0GZ0RmaLCvTr+VaPvIS82E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OivMl99T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cxpTvBaf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646D8YRn1527956
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 17:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QpEOCCW2frO
	5RjDS7yw8Uzvvr6ebtp3PdlAzKWnUJ/s=; b=OivMl99TIdvd6nhFOLOP//OkGBR
	HsseTZsMnMJohRoaz6tMCR5J+QnNHTZlLGlZj3GuGU22pm6Dfr1qf6KqOTIXAqi8
	o76Hecpwwvo6WA/p9P/afRpimk9sOm+nLP5gq+9LwHFdvue5jvwrfQ7CM9BiY62A
	F0oXbl4u8RX/Of9RemnVrrUB5uk2RUHNBp6bCNtQjHU1o4E42RbnpLyZF9niKpER
	lDu0D5eu9FC4MEVG0Y3L4Jbec3VavTRCrC5Fi3rkRhAHNx/++mNVupt5mS40BkMU
	uJyakgrxn3Vh+IGyQIX5NGecIzVWfUs40Tes39S7zjURdwgbweQGxyzJV4A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0128aav5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 17:11:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8230dd941eso459234a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 10:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778087505; x=1778692305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpEOCCW2frO5RjDS7yw8Uzvvr6ebtp3PdlAzKWnUJ/s=;
        b=cxpTvBafGC+LlpIuR6x1GIYBQ3wOQW6jk5R10LQlALXdEIH8ly/VK4NmTbNn0ax4Km
         zfcv27B/srDVHzchJOycBrOxlEmaR8azoMPi356knOl9XGeD3JzZRsX1Xg9nD1jG1r1m
         2keHFi+Bk/ReHvvklZetmB8l2My27L6W9FVLSowfIem+XBxWwKKxQ+deK5coi6t8PPfP
         yCAhAlRp05N/gThOzY8WtRReSprjbhDosIC3Urz9I7IljKEZEiubTxlTTsPnlGo7cB+0
         9jPPMYvzyu0S27gHFZMshzmD0aGTpBcsef+nr5Nkg5OnvExAmWLqd/QAyeL1XYvxheWv
         Vvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778087505; x=1778692305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QpEOCCW2frO5RjDS7yw8Uzvvr6ebtp3PdlAzKWnUJ/s=;
        b=c1zDsm13G5+29Q/R8fMCgPytCRqmpil604xVC/OfxAXcp3kCma50B/VhK1P1gj7wOs
         VL6kfwcIo3YfD++q+zzbct4d8rkzI7LP2LtClmV50upE+I5umKYmoPOodlXgZgqqTTBL
         AMeifNMWd2Qc29p/Q1QmJ7REnXmjW1GK9T70zzWrxt0FB2Gze+KeWmLuFjoeiH0TREXq
         Cbsv57M6gGxxmwMX4li29W+EICNGsBtEm1dFf+0N7/7gPG34Q3A2qcoEV2fTShKRYGzQ
         aEiK4WT3x8TiKUGq5IZyokXztb9LfmXi75iLcYybv6PjIjBd/fMNpQj5eZjHjMs0k31P
         0GdQ==
X-Gm-Message-State: AOJu0YxQkgJ9eGT7cXqBX6yENf+hTXpAGd3sIt/oRlE8WxvIW2+WT2TN
	k6rY3tYzDC8JL0mgYciMSJTjOLJm0/Gs0MwS/Aj1ygLJe4Iv1LJGCd582DFexpOe01zYRRV33ej
	ZW90NIYGJvmF6VnJm+INVVutYZn0jc6GJp8AG5hmdZpC3zdss8QtCEeeurqlBIRSL1Rn5
X-Gm-Gg: AeBDievKndl+QwwJTEtipMfnJ5pfTONaNb3SwKT0fa6radyVTG+hCLvTIK/c6ulflAg
	S0uBg+9Kcbsk/ua6p7TxejJIPs9ppKlox+CWFl4v/TnHo0B7QLmf1Lhbmp4+n43riSz5dcAywKu
	XCllSi3hk6ngtBk7YMuKJTrrpJXgSx5hJM7iDhAJhC1cdd9kRGBZwPtyWRMX8tSkEwcardaHzMC
	vUoMpIT4E368Gh9fN93FQDEmoljIRNBQC04ysXtOy7tMqIThXwxiYN0vC8cSCzJNo6I8bYB2pLv
	sktXr9EoD7BZGHJpw6HXKlkTiurQn57GYGz3L1Ylfl/3ShCEds7VCq1fszTetwFBM9bCEaZENkT
	VpeT3EW1cP+DhXcXW34kfm0Tpu+IZmklCkfTox+8+/8w=
X-Received: by 2002:a05:6a00:4c9a:b0:82c:9c90:6ea0 with SMTP id d2e1a72fcca58-83a543f90e8mr3635789b3a.3.1778087504828;
        Wed, 06 May 2026 10:11:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c9a:b0:82c:9c90:6ea0 with SMTP id d2e1a72fcca58-83a543f90e8mr3635759b3a.3.1778087504254;
        Wed, 06 May 2026 10:11:44 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839659498f1sm7685226b3a.17.2026.05.06.10.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:11:43 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 02/16] drm/msm: Allow CAP_PERFMON for setting SYSPROF
Date: Wed,  6 May 2026 10:10:26 -0700
Message-ID: <20260506171127.133572-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506171127.133572-1-robin.clark@oss.qualcomm.com>
References: <20260506171127.133572-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VpAl8I9syTYC5zJtHAXaQJlQRJdo6Tq4
X-Proofpoint-ORIG-GUID: VpAl8I9syTYC5zJtHAXaQJlQRJdo6Tq4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2OCBTYWx0ZWRfX0paP4VMebLbq
 WXVFnXWQkGnFhQMAAzYKytCNLLs/BDoiT/4xtitK/UXvd22vJNekWqJ1bfBAnlsZz17LyXqR9Vh
 9nmMwtD2GGF42auKL2EHDnuRE8Rw1Tkgb8jH+77lSVvuiRTd123shSMo9SmkMxCqcg15ZMBzYwx
 QU6toqt/aoLxxe749hFgEPh75jVVyKWK1yJ6qlEEJwsY2Klk6DW4rkm30xzQYYN8ayTZnBH81DV
 8ofbNkFmBIHe3RnOlNluG0TTrAyyk2A9+nNSLnK3DlFwip9qG2kJKl7aVsrzDh08ktO5bZXzOr0
 XM/vODKdHal0pxQxmyeWomOEIYEBLnsMzhNNiCm6HgTpLO4CGN9Zy4HG3AzpuCtkYpuIs7cRh7Y
 EG/1tRmLMZLQjK1RI+acLtozEbEwDpvxnz3MHeAWqzHPhym3USBMaFfqeedpwfIb3F+K7hszLxk
 7colaoZfftFkxH9WcIg==
X-Authority-Analysis: v=2.4 cv=A8xc+aWG c=1 sm=1 tr=0 ts=69fb7651 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=ZRXlmS4ShPoOlOK7p90A:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060168
X-Rspamd-Queue-Id: 309734DEA19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-106156-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Use perfmon_capable() which checks both CAP_SYS_ADMIN and CAP_PERFMON.
This matches what i915 and xe do, and seems more appropriate.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 66f80f2d12f9..72b71e9e44f0 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -494,7 +494,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		return 0;
 	}
 	case MSM_PARAM_SYSPROF:
-		if (!capable(CAP_SYS_ADMIN))
+		if (!perfmon_capable())
 			return UERR(EPERM, drm, "invalid permissions");
 		return msm_context_set_sysprof(ctx, gpu, value);
 	case MSM_PARAM_EN_VM_BIND:
-- 
2.54.0


