Return-Path: <linux-arm-msm+bounces-107625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMDGFdHUBWrxbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:57:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 012A0542A67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D8E46303BC24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9798F4218A0;
	Thu, 14 May 2026 13:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJ2A2hUP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SGT8VB7G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D31410D30
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766887; cv=none; b=lwaKUdzD7g8dinO7oQUksMaNsHBLFSJI0cpExSoEZrdqo5c9jHjyeHmKczOEI+RvvvGTrf9GLAdicsnTQQ+Y73Vo800cP96zySpq4K+Wif1xhFbw59pApDrwnukLsxj6zJnOYbFEL8F+MZ9n+HA4QiPrbOCSPbH0p6IzfCPfPoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766887; c=relaxed/simple;
	bh=8mip4aYW915pX9J0+2O7rm1fdDX8AudK3aRzsfX3xKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c+p9cOrxX+P1zbJ7jlNFevJYQv3axcHJ5oLAb4NAWsgs0fnpVsryNstgETXVriaM+ytPD8LW1zi1no88+HdGBfi4w3vLwJ4aq/xtOhNjbK0pHHYiS7Kd9OopbiIqrp8CXbLPcexCos06Ti2zJKAchqdWULIpoEu1YFkjRREt38E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJ2A2hUP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SGT8VB7G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBekjL3062547
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xuhe6ygR1yI
	ktoZp9sFxJLTtkjCvrYy2WoD60aoQU8w=; b=HJ2A2hUP+CGmiN0vNOWTUvpjPp+
	JLqrhQ06jbl/4p3HxRpQQjMhTsj3k7vwrIYXEh53lRjkyCHSfeWuNcee4Gk71TqV
	TtdTlFbCvIVxfVl8NFjYJRw3tHBGQeX8NDokfOqCgWb48515BtXH2xACP2gMcCQ2
	dd1fTjU+xa7nt4/s6Hc9VQlMhTnj+yxILGLZGU8wuQlsfRyDaGEcKT2TlMB63DHl
	+hCo9CdHPNyqPB670SUKeB64Y+AgBECz+loopuPV8+cdDOQzP/poU0gtbJmQNkiu
	gokSLpK4U76LMwe7Uu5ybGEkZzetFFexxuxAvZEs01C/ey17PISFOMFO6sA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e554aa7wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-368edd5fec4so3421941a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778766884; x=1779371684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xuhe6ygR1yIktoZp9sFxJLTtkjCvrYy2WoD60aoQU8w=;
        b=SGT8VB7G8evkB1ujkDKGwP6k97HhitulKJwydhd8w1tVDTLHel7WUthkQ7/vo5pKcr
         cJRlk0rUkqP4gWr+lFtEzsJoTTjh+U54Xol2CPX0WzkPOI37oxLvLQSINRcSy7RLm077
         tp0OvM2HltwoxzbTga0jyJfCX69jdvNbrIvcRJdyr/UvpnnXVjVCZAvg9f6hp3YcENLq
         DlHPo+/hlAZQ+11ZOu0BuHkj4oBSiG7Y6dC87Dk8vn3Gf8L9swP15eZq5OflFtOJrxxK
         2ksAhIRHo3xgCt4VekkyOSLaXLTcyGTnp+fHp47krTQbdnurqwXgvnUQs3IZ//aKOiYu
         NYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766884; x=1779371684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xuhe6ygR1yIktoZp9sFxJLTtkjCvrYy2WoD60aoQU8w=;
        b=LlkHH8oM3k1A8dWC0rUyYEcxv9iDvg59h3DAbghtxLkJXv2jagcD8sZyaCI5qIBf3M
         5Btv62jIdlmQeadP4OIZsOP8uDWYPBJc2Pnwn++giXKE0So3Tg19Fu86V4CzZcXSrehD
         7g/ZGjVIm2dUtDRBbP3v8FQYRDsMpmuONZM2oitVMq4+U1pDoSyaNjQp2SRe/FFWdfKn
         xQlqk9w2KtPvSNkAWkFXQq7YXYkVuQCmJljkX5ZJLHpGjyfIeYZ/HobcjDgLKhFErtKp
         WgvSVwZqS3RPfwVhLfgWbu2fOsuVDS1dXp3yrMuxcF4eCViaZ+z4lLvC6M8mZ3EY1h3B
         Z9bw==
X-Gm-Message-State: AOJu0YzkNbYXHBOAYqu/TUpcdOumukElsrHA0Hjrizn6WpaX7Ng64p6D
	w2fFDSjDc3iVnh/H0oQAnPlzFoMwYqHnsNkv74Y8a5TLFWjJKiwZbrnl8gD3AMx0qj3RLu5I23n
	y8AV8p/pK+2wq1BytNAZ95djvWPI/DPcphB9nmCxybSIV8RVu7rkref6Sfn4pXcS5m91M
X-Gm-Gg: Acq92OGWUZ55bD2Dt1jbNiLF7ZEGGwGeWlVv1/aN5xEHOAqZAre0KbPY19jjGy/ceXq
	fOUFdte9sjn6cAE7jwA6iKpeuTtnnQaeezIUzyg8SJCZnkWXIEX60NI2TiAZjy6KQ0L7NF/3gj0
	/EKFIU+XMhLSok4Cb/oiCDX2/z7leXcu76XQ+C2sLqtsbAmiN0lXNsbjpUsdTdeE9e1AH1xIt+1
	AsqS5wt8oVxz9jy8r2ps78jmWkjTwaGbe9giYQ9NG4t1maiBAymSpMjQ4vn2d+WzkDXtqZSXVVZ
	brF5xj/ldDkOXaNPzUwSyTjM1Jphu5bwSTFCByH5AHijyaT1/LL+S/zpE5eQUUja2o7k76A/51f
	jG5fOwe/foHAREe/uYByDuD+f7NPlQVFY
X-Received: by 2002:a17:90b:2b90:b0:366:decb:d119 with SMTP id 98e67ed59e1d1-368f780753emr7829554a91.11.1778766884312;
        Thu, 14 May 2026 06:54:44 -0700 (PDT)
X-Received: by 2002:a17:90b:2b90:b0:366:decb:d119 with SMTP id 98e67ed59e1d1-368f780753emr7829515a91.11.1778766883832;
        Thu, 14 May 2026 06:54:43 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3694f5cd7edsm48006a91.5.2026.05.14.06.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:54:43 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 14/16] drm/msm/a6xx: Increase pwrup_reglist size
Date: Thu, 14 May 2026 06:40:02 -0700
Message-ID: <20260514134052.361771-15-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: nPB4vP8Pn8hk2WneU5XPKMP1CvGum_WR
X-Authority-Analysis: v=2.4 cv=Wag8rUhX c=1 sm=1 tr=0 ts=6a05d425 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=bkW2Msa_OoTtud3PmHQA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: nPB4vP8Pn8hk2WneU5XPKMP1CvGum_WR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MCBTYWx0ZWRfX+Zkesm4OaQMH
 KHHQGfofcIeUyaizvH1FXx+9cB4VR45gwnKTNtojsTY9wDKlm5AkzG8wmMiaOBPHPzk5IQj5/pR
 X7tQkCh30LihwEXS9h45lw+DRiBFrImQlH43PC4UyHS5QyhhSq8/kmzdsQP1PhS+pxOCQPHbpcn
 sSRjojRX+pwwsaC7dTCznKwdtqKbO0QF8tM919VefrLdM4tbN9CmOP5E2BZXND+DumGRrPyuWFp
 N6Oip7RipGZd4YFkxUvoqY7ywzp3Gasjpb22c1UG8nnQM2YHem+CWTyCyZXwhUe0oy5jNJyT4cL
 uYyWjUXbxkU/j60mmEYU+GHF3niZwv1+W+7ESGgs5U4UlpAhjwT7mEUiQJq8uiooObKJ8Rs3P8I
 tEMRj/hvGNYt2ejD9WfJLjRgpvf9yw3Qglp4ko7NQfUBEF5FS/J9C9CbLLGpvHq9h7aLjwq2icl
 zX97fVsT8a0o4rRaUfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140140
X-Rspamd-Queue-Id: 012A0542A67
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107625-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

To make room for appending SEL reg programming.  Without increasing the
size, we would overflow the pwrup_reglist at ~190 counters on gen8.
Or possibly fewer, considering that some gen8 counter groups also have
separate slice vs unslice SELectors.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
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


