Return-Path: <linux-arm-msm+bounces-95882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFAcMH8Fq2nDZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:49:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21978225719
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5EFA30A7565
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B4E3FB04E;
	Fri,  6 Mar 2026 16:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLFbSbs1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fTIyG7bM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFF341B36E
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815653; cv=none; b=t6MbXVEEfx0dOHbCFH/8F7wQ9HNRUCJc6R1NBOE4fT+aq6fp5UOpoiu3kTSET7NCsp4F8nBr3S+JFPJFnultbddEiUYeLsCRpy6gt+krmjSR9QdfLOp1QkRJBXbkHm5zf8TeptA6P2Sui0jCxM8PECFGIGVGagX6Cmv+9uiykS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815653; c=relaxed/simple;
	bh=vcRHbEAGLYLgXe4iaZftIzhetGkuS44tvnfyt/ZXY1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sYJFm4/svBo4cWtsMUkMMGLCithYAbTammLa9nGumOtgvYN/gvX9qibj1k9fwRfJrNxqgNV0GIrgx4OEoOKNO8ayIsqx9uoNwmQtj1AiQBGDoEnosj6PlgNeEx1/scaEt8YgZkdfUvJtr/QlY95staJMwKMQW6WMpNSOp6CiASM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lLFbSbs1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fTIyG7bM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Freqh2009623
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tABjXUq/OjxQFlltJI7qwEI7Ulj0yf3Q34M6i0RzZsQ=; b=lLFbSbs1utfFOzhT
	MNqN4JdLQ/gvQYGAXTfaKD4P6yfbNcY9uzCf41ZsXgKMJadHItt83twX3qhbC8lf
	hUDsr8jEaGbGCSZZN6GJCTHR74h/854kMP0QlCWQsc67v3c3mOt5m6qP90seRu//
	CcuvZtP/pl8aQDOFhHA6UKUKX9om9xK57tUVkKiIbMXSQibzEqfnc33zllTz5sA0
	p5SokMCIv5oq4+6bXYHaP/2Qb3V1zQrS5nVp1lPqdpqbHHaPGYsnAx3xm/sR67/j
	KJCEwpndr0mF8/jMvEMna3kO6ov4vv/B7FCKfFNgCivzVmJsI5PI0v5/h+4b0wNq
	kc/oEw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ahcjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3fae6f60so6040583585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815645; x=1773420445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tABjXUq/OjxQFlltJI7qwEI7Ulj0yf3Q34M6i0RzZsQ=;
        b=fTIyG7bMI7yD+vUIT9Jw+eV+bm3K0F9W85SxCEgIaYic9X05ltT//IBQEL5U8f7sfW
         8it+sAhpImUZZTPPuecJ9og1N9gqziY/a+qQzx1Z/XN86zTI4KWA3wxAkPFDj8Cpf9Qx
         s1UI4++xWvDU5IVp+2V3nWuoTF5JiQaRJnehuefJoWYDpym2o3epn0rE0s2EElX6GGUF
         rX9V/LXW/ibKhhGO7mGYi/DlcRlZVpiHrbvAIeJeD/kl0uDTTIyo2Dx9Cb5yEvd+XHDW
         IJsPBFFZo4DdcqGD24VTTr99mGOvR8AYCyLAV9y304NCWsBoVtwUOcOhtQimvVEg3ne3
         7LTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815645; x=1773420445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tABjXUq/OjxQFlltJI7qwEI7Ulj0yf3Q34M6i0RzZsQ=;
        b=uH4okwEEH/kqm6cDh9OC17ORRz8050KzkrK6kuA0Hbz+iCkmkNke738UdK1tfxfxDS
         pi/lWotCbuRGkFzgj4xLoW73XkRx71MEzIIdbiJeJd6yKloQB4tdR7dvv9FlYce51L3Y
         KxnqPSFGiHJviOw+CvwO4uMaMnysvbvTdl6v496uuH3WKGK3Zq+hK88i4y+VZtQ/yWoL
         +57gFxB6tFoE1afT/4wCTndhvSvTgNCWrB1ttGwN6pO+SmyF2mAhK+vz79HfTXPIlGwf
         BZv3AheEqDICCowJYKCOzggmMlsYY2M4fAJ8koileh+wBQwckHXPHnZZKqQw0Iyv6MAV
         Dxjg==
X-Gm-Message-State: AOJu0YyYHCI3p0qVsXi/iBs9W/ESG2E5pTX/ymY/01FM8uzhRIIBvUGO
	l+JQH+vJMA1GZpiYDwGAVEr57B1BwWhwP+sK/NCafdy3tx3j+m9+TQhcp9r+dBZUcixLftO1hjB
	rV5FExj1SXVdwufokAIqg0Tw8748ebATVMhg5bOjTRRdu7Ae/BRcVeRQwtoLnSC6tBXgj
X-Gm-Gg: ATEYQzy3WH9oQ1bl9WGC9wSrCTmh7c5EbCnz2zq8dmkClLjchgcl2553MoS0i1VEBGl
	CK4EwjiI8XNwY3j161mA5EbEsg5hYSVO+XOAI7FFEe9jeHPp3hmreX7RbhsHydO4B5vclAhthir
	qO7BAObqblLFvikHyn8lTLZZDL9CsepCgvmH/88tJOBwZvv7k4HfrYYSy4qfiyzijpZENajEaE9
	qQs0ukCoGbnZ3dDvDcU6WKXDiID0BSUPqkWXrg0lpNLHLR7k6r5HM7v+KFgMVG7t3MkRRolra3K
	IDrpVZ6SHf3/5wF76/PGJiReUxrCFUpyR0Lo4h3SS3LUWxfOnutZD4QiHzOYUBa8rEzYGRqfIzo
	6NaA1TIsuB6d1gyIWhgG2wuJCgcx5VEHEWNcQg3jAYOsVOOJvSyvVD2m5lWqSi4JmzOqB2McAJP
	0Dl0E50akTppPkiUbEi12viW7qrBAM78nd8PU=
X-Received: by 2002:a05:620a:199b:b0:8cb:5566:c947 with SMTP id af79cd13be357-8cd6343c5cemr797014785a.17.1772815645288;
        Fri, 06 Mar 2026 08:47:25 -0800 (PST)
X-Received: by 2002:a05:620a:199b:b0:8cb:5566:c947 with SMTP id af79cd13be357-8cd6343c5cemr797009685a.17.1772815644753;
        Fri, 06 Mar 2026 08:47:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:12 +0200
Subject: [PATCH 06/24] drm/msm/adreno: use new helper to set min_acc length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-6-9cfdff12f2bb@oss.qualcomm.com>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vcRHbEAGLYLgXe4iaZftIzhetGkuS44tvnfyt/ZXY1c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUN0M51LuLgAx3YyuCL48phbnK5fMROS9qi1
 euBp6KEcTmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDQAKCRCLPIo+Aiko
 1WJlB/9Oz7JEzX3QKA7BjY8IyUp2+2tsRDo2zVU5FKUVwpGc9iyqGM4h3U1PlrmwvgX3DV0dVvh
 CV2xUDKSOESWI0vMmSyFDF8wMGMcfZdHX868x5tsU90+PDmp5lhO74oXF49f6a2Gz08a9hoXMI/
 LLTSoslChzkN0lGLVH8rRiQRvBztGeiyt5FtXit2+diGGo7K29j8LlYymUZ1/ZO5+pqSe0vFEq2
 JenIZic/ODA7a1FXTiS1gWaRZQWnge2646sghNpqP56COCqOe6L/TiRPD6WbMhImm8TbuZvxxhp
 jSebVtaT4XqFmziMacklq7vcn2lzi/g2/5QvYZYrc2wbP+ix
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: HHtX-0nHrZ1Oaut_9XCSIhYOgZ_E3cO3
X-Proofpoint-ORIG-GUID: HHtX-0nHrZ1Oaut_9XCSIhYOgZ_E3cO3
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69ab051d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=X-e67srwgh_QgMMAbO4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX5PrKRaz0L9UC
 Ma9sznhuoSJOcgqSUHXnE/PO2aTtos9+8w7Q5MjfSTVyZ66VbI7efTWx1/lj4vyDknFh02w8T1+
 +rN6zxkQ3WrUsNGaISS0DMkUQSEUfiTTpr46Z9jMBmU2xYvVc9tmN2qQrZI1J/DsNFs859u3kCo
 fjAi2OFXO942zrv8PtVNS8Gou0eEwZfuQzlblVwMhkI2F8hXC9tPEwxFs9WZuSgY/hsuqAFJ/WV
 W1uAsWTlhj3jWbLl85h3sFroVg0rQYz8j/T6TNVaKjMUNhGaVjGQVsXJfM4iVvAm5H5Ef6RUEVx
 CefA/AtuHPt1o6N32lW4nhNkEX1aJGCrunEBmfsWQm4YjH1ej281OVMwsD3wANboRp/1siNkXKd
 umMFin3Btd4Y2DyWiyQOdfKu8/5r7+68FGSnda6vWH9awReB2BBWbHbdbrh6n7cArGcpsbcuDKN
 fff+1dXRB3uwIH4QovA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: 21978225719
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95882-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.923];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Use freshly defined helper instead of hardcoding the checks in the
driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6eca7888013b..2027e479d5b1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -744,7 +744,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
-	bool min_acc_len_64b = false;
+	bool min_acc_len_64b;
 	u8 uavflagprd_inv = 0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
@@ -752,8 +752,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
 		uavflagprd_inv = 2;
 
-	if (adreno_is_a610(adreno_gpu) || adreno_is_a702(adreno_gpu))
-		min_acc_len_64b = true;
+	min_acc_len_64b = qcom_ubwc_min_acc_length_64b(cfg);
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |

-- 
2.47.3


