Return-Path: <linux-arm-msm+bounces-106165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFWcNZR2+2lVbgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:12:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C21A54DEB2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 197C3300AB1C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 17:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01754BC01A;
	Wed,  6 May 2026 17:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oMnc5Bn1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WYeeIizD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D794B8DEE
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 17:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778087542; cv=none; b=asN8qT5pA//dIAcW/wI675Jnzx7o1mOlmeqek8trRVi447SVg3MeBAa38sfbFAdxRxCUxI106LJFpx3O69oRUqGgO6fbvWg/CBTAlw/gBzXZBbe1yJdMt2R45Hn+fyTCZ01NUfQWN/7WLrtKuCEAFqQBfRSsO6NPuerHkUeqb8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778087542; c=relaxed/simple;
	bh=/luFySN9TuTwP132kmsdb3FQnU3x5xvt3hdARMrrktA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aMrAphvt76W6xM/FspyGLcZJsCuiDKaeWHjhkJa/Yg1Tk528iSS3QuZmw7E5qtzrqjSTwhBYKoQuldnXWwLp+Fsb7Q9nlcqBj9P51xMUGlvu7X86ZJ0QOWBpQf+prUEWP8DdRziMrax/bsH6G6EYOFI3wMf2XgjD1BEy5RImzhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oMnc5Bn1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WYeeIizD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646D8YS31527956
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 17:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V4uUYe1yUyG
	7QRKd8WtYyuBLYfX08jPs1+jI/fe/6lw=; b=oMnc5Bn1/wESrN9F0tHA858g7/o
	sSbECMG/4E4UhxTBSEsDG/tnP6zNyXGUAnNuVwX7IAgR/5PMyaWBGnt/YhJsqTKn
	yLKGvF9kKhi05ciJ5XkjzvtfzqY2B+RXlOOXYgw+GP5QV0LwJH8webNlNbmhV7A6
	SSjcRe1bknOt7wDB+yD8M4KZ9bbNpqJwZFtjiOTtjgsYLtgTIl2Ij2mYY3HCV626
	p5tiPNdxMTXby1mYlq/mqHmFX60lfvZv2qXJE9mJT3hogmOVjujtxyqhDbRZFPGk
	78unQblFSsAf/CRWKK0zFcvlhN3nqobLq0lfDbZ6bDIaz+gUfEiBwJzclTw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0128ab0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 17:12:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba15e384c7so24251915ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 10:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778087533; x=1778692333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4uUYe1yUyG7QRKd8WtYyuBLYfX08jPs1+jI/fe/6lw=;
        b=WYeeIizDAKeoczFr2ReGMdKXq2qSvqgZa4TdwsuSQczeJbs6+EXN0J0kyAX/zuGr2B
         jMO0ysfV6pr7uQ58abq1lcicGW1xXLB5XbOWouypT/F/FKTE2g5CRek18Dn/48FMDJjB
         9Hp1xFR6584BMS+xYJUIbPXU6y/hU/HqTTcRdJB115WTbxO1r+Lc8OiVsGMtjICc1nZc
         v0KzrpCg/CvRh/iTV3B9LuanQeHtWI2+LEk9bSIms0Vbvp20P6IqG0hASZhDAHVopf2F
         SLXNEzW8qGoR+YH5GAE2Kg1ZtQhdiOmhLfwHaqU9etXWimESXdbJDIwrXI8UZlYZ9ZuJ
         u/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778087533; x=1778692333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V4uUYe1yUyG7QRKd8WtYyuBLYfX08jPs1+jI/fe/6lw=;
        b=bQku9yNhBeyCMW19Tkd9brkgnZl/SNQGbzy3i6BMsW7xWY89GUkcl7wQ0UyTVYXK2D
         V3mpft8+Hjg45ulYbKt5EwGjWSiLMqg58IOoGmtleTP3yEeWeuhPBSmPJZ0/a5/yuDMU
         juJnewIEC9VQF85oJlf0h+BoBJ0X5RyR2qmXoJQezeKVcbyeDbOCJ8fWfHt5f6jl7Ups
         TmrwVZ5l/mgQEMn+DOXdd+YJ15/xc2wqnFaZAfE+CcZbFUmlcAcHAIlu/CoGAGW9yKA5
         lwcV0mHXB8j2Y4zI3f/CqKLMRvwfLQO8WVW6sgFi3uxRaWbSLKPD2a8DOn9I+/RDPN6i
         5Ppg==
X-Gm-Message-State: AOJu0Yy11tOOIcgiAW2WAhmBXMeBq3fnuAm7IKyZO4dWWTq4NtJNJFDJ
	VKqYhX7/1uqC+BHNC2v9fBEXr4TqludCq+sTiKkbhLcZQ1aAitqf6q4sVBdUlK0jJrRFkbtGH+4
	hworZgy3XpBDyrD5Ln4e0127HZhj/+brH63USHkHzJfqj7asNvl+4MflwWvDo/btfCSCq
X-Gm-Gg: AeBDiesE6l1jVi++uCQeEgPDgqO2OExcFbpQugt3/CkWPiM9GRpgYLh+DTRmvUcYyC7
	86XPxyF53d0BEFdJ4VoUGjju3yesNuQmDh25rrUZX63oR//DH6/b7UAiaMhnk3SxAl1SOPWRvWE
	QEnOAs9eFEKnCah8yfcCmeZWNRvF3elFCqNVoU4FwXRQevpZkR0sa4RxE4N5yMR+sDYoKuNcluF
	qr7X1M3EgkM8N6O7CJ7C6LaJwwGPFX710JitfZwvBIZmMzEUbKxXB5Y+TFHDd8E3fR9swu7k577
	YA6N5lzxGs2FyKbfGfWpE7wIXKMrmDzByuoYn1P2UcdRSWI5sf+AuC7YQiQfqYKCFbxUZhZhVD2
	H5xIIvmtD8HzbPO2Hu5USD9kekVg5dmjEP1Mf0V33Y7M=
X-Received: by 2002:a17:903:3bd0:b0:2b0:7d3d:756a with SMTP id d9443c01a7336-2ba794c05aemr52703035ad.35.1778087532905;
        Wed, 06 May 2026 10:12:12 -0700 (PDT)
X-Received: by 2002:a17:903:3bd0:b0:2b0:7d3d:756a with SMTP id d9443c01a7336-2ba794c05aemr52702605ad.35.1778087532341;
        Wed, 06 May 2026 10:12:12 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7ca10828sm34251455ad.56.2026.05.06.10.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:12:11 -0700 (PDT)
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
Subject: [PATCH v4 14/16] drm/msm/a6xx: Increase pwrup_reglist size
Date: Wed,  6 May 2026 10:10:38 -0700
Message-ID: <20260506171127.133572-15-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: -vQfqRGI4ZVjCqKwPmqDeENoR0Jq8K76
X-Proofpoint-ORIG-GUID: -vQfqRGI4ZVjCqKwPmqDeENoR0Jq8K76
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2OCBTYWx0ZWRfX8/KRH9qj1j0A
 jAEjElJg9ndKDvbP+ZgIqhdLVxHln9AFypdTFFQ2S/dta7Id1gA5Vk21yu1vMvK6spO8KJ6d8r3
 pAbCp5nGSj4u2OH497zjZ1YxxLhry6Rn2cwFXT5Ka1rIbCDl+d4kcJNmvWQHwdGdP3xPwWTYdwX
 BNvgIH6AZFGsmlAgGw/NovDGV3ysQP6JNuKxMhzGa93epNi2PPRXGbV8YVP9CR3PgQyibk+Vh8t
 usbQugQY/16KMrfAj9ZGtriBqdLykqM5B0rCJZxzQcGwsQHEuJZWDnop6UVPcKpCqaiCnUsr8ua
 GpjaT1MTQw6i6FNWw1YKKeqxuV4tcXFoo36Dc7766zA7DUTdFOWVw49PPIkAQMYa0bGc8hzMJld
 lu1fUjsu9u98ALDWdKmiQEXEQefPRgcFhX6ixDmFb1VghpMjPqrqmcrgnJ1+Bd2N2pWlYiCuB7G
 dRYUC3VOlbFLfDA/XJg==
X-Authority-Analysis: v=2.4 cv=A8xc+aWG c=1 sm=1 tr=0 ts=69fb766e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=8lTVeMJbxB4f0FvlbnAA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060168
X-Rspamd-Queue-Id: C21A54DEB2B
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
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-106165-lists,linux-arm-msm=lfdr.de];
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

To make room for appending SEL reg programming.  Without increasing the
size, we would overflow the pwrup_reglist at ~190 counters on gen8.
Or possibly fewer, considering that some gen8 counter groups also have
separate slice vs unslice SELectors.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a329d20033d7..61c6b0e781ce 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1183,7 +1183,7 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
 		msm_gem_object_set_name(a6xx_gpu->shadow_bo, "shadow");
 	}
 
-	a6xx_gpu->pwrup_reglist_ptr = msm_gem_kernel_new(gpu->dev, PAGE_SIZE,
+	a6xx_gpu->pwrup_reglist_ptr = msm_gem_kernel_new(gpu->dev, 2 * PAGE_SIZE,
 							 MSM_BO_WC  | MSM_BO_MAP_PRIV,
 							 gpu->vm, &a6xx_gpu->pwrup_reglist_bo,
 							 &a6xx_gpu->pwrup_reglist_iova);
-- 
2.54.0


