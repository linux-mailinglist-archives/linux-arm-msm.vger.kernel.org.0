Return-Path: <linux-arm-msm+bounces-107609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMlgKiDUBWpUbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:54:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F666542927
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 748BB304545A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3047D342C9E;
	Thu, 14 May 2026 13:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cCqwSZDZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O1zflbY0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35523EFD0C
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766854; cv=none; b=Zy5rNtqR7CLeZhu9xeIP0W5gyBQNgCELTbKHy12nNHwXhXfqfKiKuHtQLtmQXV6kum6mwZ3K6E/bnAB5ibn+8amlxmh6cNqMYDBjXWXGNalRMrOOd7vG9Pi2tJmMmrzxutiGz0FsioQlLjNpmfSQN/qBlASUyTMjt24S7u+6BUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766854; c=relaxed/simple;
	bh=hNYajq5FoO8Ohwqtcny4uUuWTPmnir7ozBVWoOEnOkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LtplVpuBTOvzdgUzmq1eP1jV3y4/a06SkqpBmTfMeiNWUFN4FwcMcD2RmEJ3jLOeX0jM6QSgyacLq/7mLgZGTWbkJBhQo6u4aoOyIpqomsYq+/uJ5fwCT/BSnH74LbtD/p7dOiaiW/moeGGzCKpxGcR9sK0cWuZuInUiE9HNrAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCqwSZDZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O1zflbY0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBejrL2555023
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=r626fk8GTYQ
	7mVDurnFWdbX+Kfuz+zSekrPETuLYfy4=; b=cCqwSZDZA/ZNXKBJmVr7z7Bktxx
	UVxsaLFxNfkUHMEgmLfDrTkhlkQAn1d8jSnNYEkqL+DnIdkZhebLnz/56GLpNrAD
	JQDkci1gMWs3NvdVMsAiAEDjbmA9sSsu0eUA+Ha1jDTMFlwyFDEp4N7CEK/GeXBd
	e1FzjkuHX2n06UoQqE9xx1Fw0LfN+R5uT2P8KUPQIqDs+OP1mnTrr665pUDQI4ZF
	+HQ4NXS9nPEn3VcF59xxp+kxzOLeDBvQQGOxsizT4SbiMWyaYyE96W8XgahQIWWl
	nsJWKBWKlNkUUcJ5r62dmrQSWruq5LPCqn3dxViJY/qrm3w/OrTdG+HMLDw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5b0bs1gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c828659ecd4so2783441a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778766851; x=1779371651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r626fk8GTYQ7mVDurnFWdbX+Kfuz+zSekrPETuLYfy4=;
        b=O1zflbY0YEMOUBPkNJbdzRJNKDU5T5iEcKdovPgqY/Sly3UqBYIUy3Xx/rKf7FQ08w
         Udlo75En8lM24CrNu3MVHlINvT3AE/RjSdS76D1I5hGQVhch8AZnyEppbIcDwggus9T8
         qxj//9FU+Kv+XJyiL8f/FjBBPGAEFzWp+OcmS5ltTSrJL07/JvduhNgMGmSKEOmT8QUH
         Rz2RbO9U16sUWewHbPmRYSW12oe11NUhQwUU4RA45pUbbQL7MPetuI0HuoEEzfSXbvcm
         IA5FPg18T75aL9wnoYHoDmcW120yCBbqpFr65s1DyjiIQ6g2V0Z0fLI7TAgPvn6jpD4v
         x1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766851; x=1779371651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r626fk8GTYQ7mVDurnFWdbX+Kfuz+zSekrPETuLYfy4=;
        b=LuLmL6e93wi8iKIUbgKdupIF4CSuL27CxIyT/pmCp15Ieb7nkxteYKHDk0LttB1n2D
         iqYM9PDOmnaBGJkBoseHTyzpN9x/40X+9JepgH7EJx+60saadKL7xZ5dlzLaI7H4z8uQ
         B30VX3JuzJs7NiFwEwXbLWirfaAK1QQ5763f/bEfAwi7QDaOasGtKGnPsqw//iL0wwqr
         NS9F1uEROzqAHKv20XAJZfS1CgEuXqQhO8He96rQrpQwUJeimlX/ncybaju/s6r6N9JG
         fZF7WamsBtGR2daNO/p+WQdcUpjzt51tB2jFuZ+g1ZI2atwm4AToXLARJ0afyZn23I5Z
         9EpQ==
X-Gm-Message-State: AOJu0YxVc2Lw+4FxOH5ufmjfZHbvEgQcCgtKxxoNHf/UkFJAutoxYYjK
	Ar0WKclVoqkvlwAmCn+nnMm46gMMM7rFJ2cqZz4dQ+/SrOFVExtoLUc5+9/WyDNvFo+/cjHqvez
	MaSNk8zDKNuFp08l4OAOSoKjm2QK5BcKbdIvy1kXw7kyNPswVZeMPzELlSl+xvBlkQKyr
X-Gm-Gg: Acq92OEorqYK+WZNlwdDF5qArLxPgKY4zgLPMYN/xTHdFsxkJKKkIZZd7TV/zOlfUz0
	xuaixRo8s+B9PZb/QnYICtkkjNWFwJ38tVZAGbMJZQkkqNf5v29fG/V98RRwWWmVMsr3K9XIYwi
	XzQdYEYBc8hSs++rS9vh5d0ChWnOrIOYNqjkjLqmVxTrKot3RbeRa7VXP3K4bPvZR+fum7rn05V
	LAx1boZbUpJ0Kp32dfdgb8JiKqRtMcVa1ZRV32lxNWkg85uUgOF/5FpgE5EpcDpAH+jiuBPmoWz
	NVUQJgXMnyKhoDcaB3WHt2lQDk5aCfKpTtMSCIu3NcojftktO1zt8BuOLrMqLs6w9OY6DzusR6/
	NzisfT3xIVSjMKtj9hQm+OubNvXh3FIxY
X-Received: by 2002:a05:6a20:7354:b0:3a2:f402:50e0 with SMTP id adf61e73a8af0-3afb0b13093mr8611796637.52.1778766850459;
        Thu, 14 May 2026 06:54:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:7354:b0:3a2:f402:50e0 with SMTP id adf61e73a8af0-3afb0b13093mr8611753637.52.1778766849955;
        Thu, 14 May 2026 06:54:09 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07d2f2sm2417535a12.10.2026.05.14.06.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:54:09 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 02/16] drm/msm: Allow CAP_PERFMON for setting SYSPROF
Date: Thu, 14 May 2026 06:39:50 -0700
Message-ID: <20260514134052.361771-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514134052.361771-1-robin.clark@oss.qualcomm.com>
References: <20260514134052.361771-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MCBTYWx0ZWRfX8ThhiXwD75CS
 rBiYMfZAvZVcVATh0JxUWO39ZyQVY5AoT6auNLZkK8Ht1k505mu2SzLl6IIbYJeYrtnAplyohFA
 JeFCJhApjEJfpSAiWJX9Itkd3T7eV/uuiPBs308Hme9HSqgaaEMGgX06FH0iKCVKGPDszFVJ16J
 TKCpBiCqXuTg/ouVt2PimzkYgwdO+Cgw3Qc+peUZ0YGl7+AhZGNefLwowcqWVz23yAwifHk5Tfe
 KpL0JcbWEAV9Xwbzg3kqCubsglni0ZkIi3zBvmnoehK1cKjtYx8+9IfZxMiAvjaVc4EXe9iAqNB
 dO3L9JPzQec1WxbCfduSmDzfURzCyGvlWfiQC6yl9LYR+lL8ELR0xMXmkARakIV3Blg2jXoNJje
 cSwH82g8Bwr9dajj1lVfwc81fuijSXOmIQnvsItcbS3K1lzUrifF5oafZ81yloljA7XkhaaMKat
 byU0Oc+f8dl0HG1t2kw==
X-Authority-Analysis: v=2.4 cv=b+2CJNGx c=1 sm=1 tr=0 ts=6a05d403 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=ZRXlmS4ShPoOlOK7p90A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: BHFxkCMIZNLXJvjSHpHrB3mdaPl0szXv
X-Proofpoint-ORIG-GUID: BHFxkCMIZNLXJvjSHpHrB3mdaPl0szXv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140140
X-Rspamd-Queue-Id: 3F666542927
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107609-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Use perfmon_capable() which checks both CAP_SYS_ADMIN and CAP_PERFMON.
This matches what i915 and xe do, and seems more appropriate.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
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


