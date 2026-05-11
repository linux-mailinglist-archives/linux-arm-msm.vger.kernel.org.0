Return-Path: <linux-arm-msm+bounces-106928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNWjLlTTAWryjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:02:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2426450E7BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A027301F35C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016273DBD54;
	Mon, 11 May 2026 13:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cruGJbn7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L+q4kjdt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7271C2BEC5E
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778504466; cv=none; b=jddisKkq6qTju6//jCIgZe8PPniYW8t4T/brRW7Qv3npsIK/se5DhtzBN0W0SGhEPc4goZTrwuNAqdUSfi8N/DF/BQLwJndYKw4wJkQqWndaYpbasjI6Eh2+RRzk1WLF+uxRfAhFNJQ9Xz1Duk+2+Egn1rG7stqzBKVQ3sQgFv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778504466; c=relaxed/simple;
	bh=/NsgYCf/YJOjQfBrxIduQkHUSM4dKNrQiRj00JRK8V0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZNNAOGDZXCxbvhDgeFGXs8yYcuN8nIpDsxHe+r7V1EnuPukxXE4mKim8qMqWq1bWFt3dd9Rq1SfhFwXhn07wYQAH0XdRjPixv9mDdWjirJcxYmU57PCGteuPe4gjiAC6zzXvWMUdb/95gS0X4xVyBLtet5mQhHFcVyMNzsd+y3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cruGJbn7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L+q4kjdt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7A6Z01258560
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QpEOCCW2frO
	5RjDS7yw8Uzvvr6ebtp3PdlAzKWnUJ/s=; b=cruGJbn7sIUATh10M5jsgXz85VI
	ZFQeS/jgS81EAtMJOouCdBmq/AZU/j7r+Dc8Th34AE5K80trOIi02nno8L5DzvPZ
	iTE+e9u4KyiJHkeVQzIFY7bPVu5f07PwUJHUWwU2ruEiW/w/rNcGOFMqenoEvhDy
	/Bvr933ptoBRGor7izAH1WWWpxFsjltZ+jm8Q5g9N6p4ViG8ysCHw419acbnK39n
	xvHm8Bo8GjIDoyOrbgAa+cWXCb/NlZOR6Jvc0Tt/Jtf5ilBFTQ0qHlAu+A5LoF3+
	v+x8IWKwAVNFvDXctuRJdtNi6EfTTeZDX/CFWfwKUVqZM1BkWH8PMFqordA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag217fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36603ad6709so4561540a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778504460; x=1779109260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpEOCCW2frO5RjDS7yw8Uzvvr6ebtp3PdlAzKWnUJ/s=;
        b=L+q4kjdtLYq3JhsJMjWlC5NzM7w3dmIo5CBT3OTcGFF4tbGFszc4dj3whZYegEFNgR
         vy8q2lYIEUHa8W7W9ysPBMIIZvUOE2fHMz5LIion++a8N5aK/TeR9CgFfMkgmEvwwDt6
         7GT/6YrSavEWfa0Ud1Zp+F9MIT7bt/k87Etl7qCbH+tX5cGHBdlaA2x1qSMf4WEQ5+SR
         KojYw16QGTp/xsIsrSNspGfVwxRRHsnyJlfwUUB/q5WHWXEp+AAFp+WmNI2bLmWo1/RI
         vOfc1aoUoXai1Qn+jUmqu0biU43qLJ6IgC74SxOASrqnA5eHhsjQkQDND3dstWw4eRQa
         vCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778504460; x=1779109260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QpEOCCW2frO5RjDS7yw8Uzvvr6ebtp3PdlAzKWnUJ/s=;
        b=WFot0NYdiqDV9FEyZHny/VnYMFOqTw6nC/3NN+/TZ/AYjycmZyozNgrMw4zdMKVoxl
         vvMJFwxF0u3+UtnisRJK0vXWRIogd7yBIo7yofO/A8NDk4G116TNEJYxGEI3VgEV7t4c
         X3w/Nt8kJOxhDd9dnGwMI1NH5Ei/BtmG/RIn4pwfE8A8rHH5cPOfULTq6YZBtHHwxyq5
         h8sBGtuIzWVZKNgcOThLXpY1jYFiLMIgDB9R8aRi/sV5RgzkkmXBUHWfEuy48qCpdnYR
         oOnN1hSzsncD7ymNYn+oqLYv47qygNLJW1vq/IGiSuM+lhom8iAJCCepzJhAWE4hU+vS
         zw1A==
X-Gm-Message-State: AOJu0Ywu8eg1gVhq9WMVqekFNCEqzX2azRgkNR2wPzIgdaWWHLLl09AZ
	EJIQBFANh9XrnqOxR1TRRg8ciOVdOB/S2ZhV8PfZuybPB+V1idu8k3hd0QQ+23F+CV1Cxfa5n0H
	snMH2Bha+w9AnebUpvnvp5g+5zbikntGsn9HjWZzHGrhKTOyemwEdd5+C0NuiBFBYMvzR
X-Gm-Gg: Acq92OEUu3ZA9QaM26yLHHNblAIsdEmlwBVGwEsuDmuWMKmi6EMmZtGKkcuJimRGQQf
	uuRPYycZTzIcmltcdc22yox8Fn14CVtKFfcCnIg714r+B2F5C0H0aWJ33uYE8M3GniUZEWVWajr
	khn3ojkgYLEjGvCLohQwB+HkbSDqsXRB01+EKLbGHICLrVOruo8LViwHnmpb5/TKIWETXjFAh31
	lbUVnaP0oqYOUaiomey/ryvdjeWyN/6UwUWP49k3OxqBlbrXOzA8gYkEmg5aN5gVYchTeO+yCp4
	pWOWlA42WRcI378R1dND3AsdOqf4bSDuzKNrv/Fz3w2CkmgNB9pcIPzSZIkQrvbz79awn1iErpp
	eJXngnDkN7VWlrowgy2e3XqdiShN3xlS1
X-Received: by 2002:a17:90b:6c6:b0:35f:c729:de9f with SMTP id 98e67ed59e1d1-3664cd49ad7mr13656732a91.27.1778504459904;
        Mon, 11 May 2026 06:00:59 -0700 (PDT)
X-Received: by 2002:a17:90b:6c6:b0:35f:c729:de9f with SMTP id 98e67ed59e1d1-3664cd49ad7mr13656661a91.27.1778504459326;
        Mon, 11 May 2026 06:00:59 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d629f40bsm7782246a91.7.2026.05.11.06.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:00:58 -0700 (PDT)
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
Subject: [PATCH v5 02/16] drm/msm: Allow CAP_PERFMON for setting SYSPROF
Date: Mon, 11 May 2026 05:59:15 -0700
Message-ID: <20260511130017.96867-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511130017.96867-1-robin.clark@oss.qualcomm.com>
References: <20260511130017.96867-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KbZzrtYR3t3h22MHUaFDPM3zGVYNY3oR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0NCBTYWx0ZWRfX4vowRt1Vnc3i
 96ijKyiwbo6zcHzBZrjsxNIbF9myjMPbrb/OyIH/ZhNFwuCS2qkCpQXkNO2nBbjLS/f4I3Lu2v8
 5dDvq01nhGecMhwmQsbNw6ItAvqy6zt/x0kzW4CxXimD8EgrHWKP2nq3p/bcz8NMhlwhHA0NCdI
 OapHr+mnZLMKvf1gnG2acic7kcbjycUlYoGMKYK0YdTxyfkz8SUbgKDqT4r0FPwUE8rAdKVrMh5
 EmM1EnrlR8mce5K+WwdHOkFmCdJ0K5gVEDQEDAqNX7KAYXM3cwP6WQDYFBNaKndH6iogia/bTWY
 bNDUFpTW1ueodL42rQJOluJHEY1gPvsM7eEwhnyMgrdQEw5fzOd4XQlQX4kuOQdj6RtdR7KW9ax
 Gi/Y4DqxMN7hQ/4Tv9AM4UpscxbT1LcjVMH5ml1aKANwioZWsy/AitIhCbp14hkp1+1NLpRIBny
 Ho92ngJJGB51QCKuqgA==
X-Proofpoint-GUID: KbZzrtYR3t3h22MHUaFDPM3zGVYNY3oR
X-Authority-Analysis: v=2.4 cv=NODlPU6g c=1 sm=1 tr=0 ts=6a01d30c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=ZRXlmS4ShPoOlOK7p90A:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110144
X-Rspamd-Queue-Id: 2426450E7BC
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
	TAGGED_FROM(0.00)[bounces-106928-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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


