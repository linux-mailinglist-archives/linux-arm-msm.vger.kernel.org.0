Return-Path: <linux-arm-msm+bounces-109860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMbJNaC1FWrKYQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:00:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A54B45D832E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E1CB3018784
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0635405C40;
	Tue, 26 May 2026 14:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oCEl6biR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LEUxFiWh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491CF405C44
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807239; cv=none; b=uPEpCnmiSnI4ac50XeUysx+Zc/zfCVvqpq5JItMz3e4II/GtdSEZJ7Uydyvc1jOZSxcwQ1l9gCarACArRJ9128IKIe7S7BE+uz19NHoM75d4U42UzJ8xhnqyueCACr/XZrxDUQSJFASdaSoyDxg7Ps1TWFc9dnNj1JB9h3JoAMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807239; c=relaxed/simple;
	bh=8VWbdGkuGsTTTwEXrzMET+OwRMV8Bxyp9scuxw0paE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fYmicc/3oPG7NDss3yGgZQ0LfooGUU/OCkj4dH6kIIUOmxIsqt0sr7EyiPRdfm4PKhdW1N4wfTcmkEQSyWTDckPB9ukwGaf2sTJLLXBFDkvFeUPTxEKqlwEaVkrstwG7j8ftMvpi1rdQ0cRb3CAl+DTQYo0cjmYmY6ZRRAGxT9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oCEl6biR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LEUxFiWh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsaed1575513
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uZWxbq16V5d
	ge8U1KgQgWh7So4/tb8nUVOkQSVzqIs4=; b=oCEl6biRCeCTYulMumpMNwJUeIp
	pX3rblOuDvA723Y4LkqWTwAD2ycnETTh/Fvn6zJNwLGwtcAIPMLPcMJ/9XTcN5e4
	waXkdXj1VqQBL1YmYCXzvRC9bAx9VuRfKN/SGXVwNdWkQtchG+5HkRPf0Eu/LsNU
	OE6mVXlAbp+2PXFCGBM1KwrmhMPNnb7gLp9Xv1gQAFxP/Y1OJp8KXeWsJVkEQoy3
	HIohgZBSqzfPbQlJAThBE9xQB575PyJj7dvfchesMtTew4w9yTQcAs7gFAgtnIFh
	f6tPtpBpaAURMoRwJL9KFoq787jVBq8QdZEEdaXwEpwBTTD6LNv9EfxvWNQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqvwvp3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:53:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4530a90fdso42549535ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779807237; x=1780412037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZWxbq16V5dge8U1KgQgWh7So4/tb8nUVOkQSVzqIs4=;
        b=LEUxFiWhoO3DmNG5Q+4fH7Au4PnMoCTCqQWTsrGMCSMTf5W1xPfI9XuHXIsMv0I9tK
         Df0FNoJYU5W69TcfIdbomgZapTzEJbeToAfn/tywhwKRDbxUas8zE288tcvwxQb26A/b
         l+QCyFrkOpp7KkKzMOxUUEF5eQptp/BmfAgrKhxIgDWRhU+lDG6KSIWBcrn/kjuCQ8pf
         UbOusDrdIHscnRAD0ftAWnaUPTKrNxAytP4sNWtuxZEnnCr2CYwomNYAvzR/PbuE9gVx
         ThFOk8GqzGNPLfz9hBVN8oUNLfZo+3Oa3cdCucBcShbyDf9xEypdjcYJZwCk6c26m/Mg
         azWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779807237; x=1780412037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uZWxbq16V5dge8U1KgQgWh7So4/tb8nUVOkQSVzqIs4=;
        b=HTvUOJnmLKtK+UfDscD+5i+HzMqtRVoquor9SFBZMZquYFIOKPzbZER/P9fweLp1Zf
         tE0VP5elNYgBqWm22wQGT4D4W2Y93iOr5sM5hqjI06e/KauHOLGOZG5EdnkuLMlEepiN
         52CgxLozjnZwdj+RO2AIACY1vBGxHj8b6xmNODbl1m7Nktdprg2tzkLRJPzzmuAEXQds
         SoN+i8nBB5i9A6gGc6sZEaG3CuqV16iGjcOD62X/tUiLwa+CdO4tBRj/tvaSRL1HS8fK
         sNlUzNhXNF2hejRLShbaAjGN9O80ZzgBfqrFIURdiwci+6BDGi4u9bqmu6He0JFaTS6R
         eCqw==
X-Gm-Message-State: AOJu0YxQd1Yry8OS3Z81HycBxILm023DjCqD+bL3ADtYVT4lsOWvTh68
	SMWXXiJIKkVFEFesMrFkBmB4/5lwQAQXiGf3FNaQ6aiYzGhpcannUq/2Sw56Iu1cQ62yeN0aVL/
	Yjq64C0Q1YFa1qKrn9x2lci8a0umwxBVKv+qEFCeMkem68+BQEtznJhsqDL2hu0907Yhc
X-Gm-Gg: Acq92OG807KjOpJOu12GUgC+2gnDMwVRhEaGoEzqyTTJSX+StVKT7TAiupQp9VHSO4G
	F2m+bw8p1wDb7AJvKLVx8cxXyzDN/AgBUKvBOA2hdwdFzzGnOGfWIbxqbztfgIzQKxyk99Gmlml
	3p/LI6bAqTHBIUWBAzxSRAOC2JQJ3Ab7SO8xEBPzN/fHJuoSjtweI5j0FFXStthlAHSs+qR1Vd0
	W0PlXOxKc8tYebHhMEpFcTkueF+yFBZJk/e4Hqc+aNT71SPU0Jk6WL1VLhF/k/r7Q7n2cqRt32x
	shlXET7ESrUrcm9oYQu1NF+TMva5DJZ82zLP+AErbO9vAVzgYZN6UhumMJQBb8xeDBa+x4xIbUU
	l0eC2UcpQor9NsF1nyuo6EntN2JmUcB18B3ajQAPmz2k=
X-Received: by 2002:a17:902:ebc2:b0:2ba:6ffa:bde0 with SMTP id d9443c01a7336-2beb065b797mr204911365ad.19.1779807237044;
        Tue, 26 May 2026 07:53:57 -0700 (PDT)
X-Received: by 2002:a17:902:ebc2:b0:2ba:6ffa:bde0 with SMTP id d9443c01a7336-2beb065b797mr204911065ad.19.1779807236553;
        Tue, 26 May 2026 07:53:56 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56c4f8fsm126715195ad.26.2026.05.26.07.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:53:56 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v10 02/16] drm/msm: Allow CAP_PERFMON for setting SYSPROF
Date: Tue, 26 May 2026 07:50:36 -0700
Message-ID: <20260526145137.160554-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526145137.160554-1-robin.clark@oss.qualcomm.com>
References: <20260526145137.160554-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: sdhWWdRdxTwnqysi5uX7wZStfr_ty9YX
X-Proofpoint-GUID: sdhWWdRdxTwnqysi5uX7wZStfr_ty9YX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNyBTYWx0ZWRfX9Qz6YGyjOe48
 ubE6jq2S9DDxF0jWbOW/aGE4Tmnh3TVlKPRtNjO0xekPXgl/a+vUKS68nVTLTO0o6wG7P9porxo
 IvLzYba+qCZAYJqR6E9tBuHWWlUqeq3aVbr+F9rOHvzVK/ZE3/7DSz0zpfmqX4HBE/CkleL4FGO
 w46aE/rrSHTjAV3WwtnjJnlIMTx6V0Vyj806CNWWQ6DQsue5gXi8KEh4JOH2ge798tY1/7V743g
 fcapGSAQYOMMJZGyr8putCaXDdi1Gcaid8J+DJYHyukD4NG/9Uk2O4CkAbCm0W8OfyXc1uHkSiY
 8/2qLOtsjY95j+k10IUgQ0At1BzCXS3+PcX1gFxu4t9TNVRqWXLlBYudff4Kxg5dI+Z9Bg33UlU
 xiWaX6m/set5+RdKwkRMuFKR8djUJO2EoZRTLDO9F8is+M9GmxgM6j9qtny+incX7UpBBOP/W3N
 Sc5KYAMzJ2ebo+U3v9g==
X-Authority-Analysis: v=2.4 cv=M4l97Sws c=1 sm=1 tr=0 ts=6a15b405 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=RIk3oTIWcAeXYnX0VHsA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260127
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-109860-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.984];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A54B45D832E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use perfmon_capable() which checks both CAP_SYS_ADMIN and CAP_PERFMON.
This matches what i915 and xe do, and seems more appropriate.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
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


