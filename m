Return-Path: <linux-arm-msm+bounces-103843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCzhLnqo5mm6zQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 00:28:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5057A434A6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 00:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 518DD3020A9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 22:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D52C3D0907;
	Mon, 20 Apr 2026 22:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NaYBOG6x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SrQANEKz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441A63CFF6D
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776724039; cv=none; b=j1ipvf0aT/JJXVMqCqbGe/gKuXzMUaoMR0nW1Fj9cWOKDMq4eQL0RBMB9KRjtbGAl3KDE4jqesgKqfZ/plQ8/Li5bHOnR03hGfGrZakpf572yBf5N5ryqrE4CFeiNDWNw1ZoC5N3Wa2Ms5bGnQXnHS1lpHJwJTrO11uVVHbEIBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776724039; c=relaxed/simple;
	bh=RMCacskoFmZ9/Ng6hAjRi+I45M638ggU0L3+USVXwaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vEKfsXmMlThPx9sF5xKZfe0tyxkUHwvWQBo6k8J331ofceclWcR543kYBEEVJVRRRWr4QHEpZbu4tkOSJh4nrGw8gPjrKwAwLEZh5AQPBAgck9lDmKbftjWnSdUkIg6hMp/PZlqIm0XdWqOnL+Uc6Twoo8eROT6DFlIbh6x/Nig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NaYBOG6x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SrQANEKz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KIv5oD3212342
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lcPhu9r6gLN
	Un/M0FOO+8vu6c2tQ6RhDeBZbp1avftg=; b=NaYBOG6x6AMpRPPDWHtjCDW2/tb
	FqjGDEoXIPDXVsMj567NoofMztEBDvEd5dOfSqloXCutNXitCXJRNIvOX0MpgiwZ
	EcegMPFubCK+K7zSy6HbeAGt37HgrjTtEEpBMPQDoEkk9uGSevtKArheHEIvL/g4
	dMQVQxH3DSN6bChx51TJ16eICLNQR02KY2FLcxppfDjNijaxT+jXCbKW54Gxm/vn
	WivY4FCwyxcBOtBdUKqyzUgyke82Xw/1UrB0DMYAU4CndtJ09X1J592gg5zTUacK
	lqHn11tY3ULIB+WIjhdjw1quY3s7TbN8+BsvMJNnok1ng1daWcnyS7Or/pA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfcfkenj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:27:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a90510a6d1so28679955ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776724035; x=1777328835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcPhu9r6gLNUn/M0FOO+8vu6c2tQ6RhDeBZbp1avftg=;
        b=SrQANEKzWzs8mu3SAPDb02326Ii5v+KSeC0rbqoraIvOPsIDqPERJbA+AhfAPcw/XR
         M07CGrxDlVkJWmos80g+oWNr8nwNiXYR8XHzfNdKiCpbA20iWuy3WsdZgtFqZL62QyHu
         FfD4fFtpAPbmLdhse2uhBya/n2F/dBtkTHoUi2Z0dfaHCC8Padk+z6l3h3rJPiNJahMu
         ASAllPThH7iurf6pE4EdIHuZMtb2HYxw/eP4Kyrin6Q9McgafNtwP/rcunsyNvwozV/j
         CPkE5t2syrBXxDK1ZCC9U6LdaWGDmw6i1VUDjcfgeK2SWjduEAxOp2voqcUW1v014POS
         rffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776724035; x=1777328835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lcPhu9r6gLNUn/M0FOO+8vu6c2tQ6RhDeBZbp1avftg=;
        b=JHmWOcqWDh02eq4j1gTkW4u9xnyqYhxvXHmF/K4VRGs+EbOT+46III6A/PUcU1k7MT
         RmQ47vdHgDesgfnKkCL1B7NIWbyFLEz0M2sXO8Xv9ZYBhq0TTLyfmaInblgJSJpoWlA6
         uLHsyWuJ5lk4TArsvIWbJ1/2/C+z/45iB+5GEhXXsy0pSoFS1duDLInuBO4AlIGTg/TH
         DNBiHKKbGieNnWc2GyYPDnLxUuACSd9/MW9HF/7YJIkYWC8pAEhJRDbiQYpZXW6B6IF6
         zhdYaKNwChlIk6MO/kXzjaiHh+Rmf0auTJjNQ5g+OxSw3vNj6/UEWG+0GSWkARYUMelH
         93Ng==
X-Gm-Message-State: AOJu0YyQNhy6sZVsMi9WRZ/sN19qpQkA7WYsaFtqsEoofNjXJmVqAv/j
	yxe77Kn+FtKpBqqmxsDPEyYrsNbcHsOZEHCjfrPjjtFRg/+P5+EgD4hwE2sixEkiBcFB0cnhbZg
	UCXbM1dsEZHxiV3e7IaAuhrI7DfL8zypy4mblk+fHmvLD29fu3WS3xrBk9WZzVLqrf8eNvpLgs8
	1t
X-Gm-Gg: AeBDietwqlUP4bX+jlXQ3VfFjV87Xzs6Mc1nllwzM+rcEuDdJuMuyXWIKkFGb3ntl48
	BBKD2R5y7hlyXGTGva7qsw7PPCT1S+pyL0Fc0t/v5PWBxeadrMNG6oOSMz0PkAjSH73SriNfWeO
	OZrG/Zfdjm0oMC0EDT8R0QszP5GVHLADl7h/c/Q+9g300By9psSf3frIGFejJgApOlyp2mcHB8W
	P1C3R4FRn4bne5YTYedziPEtK/eawT659ojIs7XmHv7+QvqLzJwKEFHhOA1Rq62DDisB3sDzhxI
	hlKAy6+EoyCaB7a+++ZcnHR8zs9RMlqTlxGtiCkKEwLH5DHjuDwEuuFFxy2Cv4f4/o9MH+/wiv5
	AnWS4E1SyBIFdU8D5O3pM+2K4VACLLxZ/YF5MPFVOllk=
X-Received: by 2002:a17:902:7612:b0:2b0:5450:a910 with SMTP id d9443c01a7336-2b5f9e95060mr93671875ad.17.1776724034664;
        Mon, 20 Apr 2026 15:27:14 -0700 (PDT)
X-Received: by 2002:a17:902:7612:b0:2b0:5450:a910 with SMTP id d9443c01a7336-2b5f9e95060mr93671745ad.17.1776724034184;
        Mon, 20 Apr 2026 15:27:14 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab4cc47sm116051155ad.82.2026.04.20.15.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:27:13 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 05/13] drm/msm: Allow CAP_PERFMON for setting SYSPROF
Date: Mon, 20 Apr 2026 15:25:27 -0700
Message-ID: <20260420222621.417276-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIyMCBTYWx0ZWRfX6dNOiDJQEnZ/
 HtqZMWFxFr1fI8ZSnylFzAgA8IcBlGr7d2nsu3jiAj4HXVgSWgFybaGnv8yoX4kHWe+w5jH6doO
 /pLbkVutLWFSLoG1AF+vlroiOnn8p8SdZs1m55I+EYlIExqVslQ/29S0y5ldobotEPKNkgUXZ+u
 jKNJBn4p9yZNwg7VNtuLrelkdjzc1EDR22eWemchwof40am3866x9084GPmU1WynSgJvKvMbxG9
 sjpfxmNYUqJGC8dmEqdcM6j06oCi3sId8cz293UAb8YcQp/GEuIcj0Exf6dywE8hW6jIhRxY12u
 oT+EJUV9IMgrtuykcK63Ho1vxloVGuRhSHCSYr0TtJJ3E2ds6TavViPzb9uIGj+wq4Im3w6f6Dj
 vHbvnW+t8lamD0/UuDDY+MTEcuJI4aG1AxI4AMNyBc8cyE3JgVRWLnk4rsIkqCp6AMvVsbHuxBB
 Tmdxh5S7qqQK00s5qhA==
X-Proofpoint-ORIG-GUID: iASEkpM_l6WOVvMZ7ME2Hr4TeDjwu7zc
X-Proofpoint-GUID: iASEkpM_l6WOVvMZ7ME2Hr4TeDjwu7zc
X-Authority-Analysis: v=2.4 cv=L+ItheT8 c=1 sm=1 tr=0 ts=69e6a844 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=ZRXlmS4ShPoOlOK7p90A:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200220
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103843-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[14];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5057A434A6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use perfmon_capable() which checks both CAP_SYS_ADMIN and CAP_PERFMON.
This matches what i915 and xe do, and seems more appropriate.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
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
2.53.0


