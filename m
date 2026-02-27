Return-Path: <linux-arm-msm+bounces-94510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIhbOZbkoWmUwwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:38:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AD71BC18E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 603EF3123323
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 18:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90CC395D9B;
	Fri, 27 Feb 2026 18:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oQaAyuiS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HVwdX58n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C42F395275
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772217420; cv=none; b=FVeL57UwwRSHw1Nt0AoCLBofDNBvlB0k8qkkuvPBtK0IBZ3kXazy1PnyPOTZGlLw8a5U7QdQfwSgglC9ek19/qEAoXXiRYWadE//j8tWCkRNQ4THwwVEIflbGE7CYrYGOreBN2LFFzOt5YKTA/S8PTefSxfMKcXCabJld2tya64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772217420; c=relaxed/simple;
	bh=S9urinrm97a3tn0MebL8/S1O8BaYIJcXVyoMPjUkJqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HOIxEcnE+TkFvR+paBQKnLe3NKt/1bG5rQLUH88b/8OF9grP00LZAmqohSGy9zHoH2s8xEFMGWrCl78KrgxOGutE0ogLtCflIL+FL/RHsvoFU+M0QG92Ua3x81x7lMeppMz+7XyK5swMDlEBY3/NPdS44kSbRAhHltaTkjSx5lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oQaAyuiS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HVwdX58n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0PTX3944707
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Mm3L5n1VZ9S77ktWqS8w18v1vJNzHKjRMTXqXcL5jg=; b=oQaAyuiS9eNefbL9
	tV/wqaAUhIPnQABVgId1X3R/BKe2S1gtprDUR9jRarYx2dM1inc62D9ZuDa7jJB+
	9xwQThU8pYjmJM8EeU5o7m9Ip/v85H7C4THsKP03rG0i7e72asK/OgZYFu3np0TG
	Jy4OfBgCY/OYCEGqLH4DFSaCJ5734sT0FQcXK0uQ3YvWUvhXpKIXq7MDz4UNm0oB
	FbifJZqpkcmnp5lqwKfzrESNpug2jW3j9g2v7t06P65Bk1ovydF1MWAQztZU2EVY
	rzcWhoTvkBPZYn/LKkEgPo5tLYU6OquYDNUlhtE9j9r66tWWDIhkhTsQI/fB05Mg
	T1FkYQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck73q22cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:36:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3ff05c73so1807137785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772217417; x=1772822217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Mm3L5n1VZ9S77ktWqS8w18v1vJNzHKjRMTXqXcL5jg=;
        b=HVwdX58n4aimTnu73EmJ01r8mvkVAZpcgB46IMN/xuTZb5SWjVkSgMrhm5c7FuRjl/
         iRRg2jmTpKab1asfc6WeGmliWzCrXYnwq7beVVjSDKeZ+MgHioIgT6gnXIxosJ/CzS2i
         Ojf0ojDAvg1WFT6suYBZsq2kfQGeEsjlWpV4o8a62jJKta3VQBUaMfCsywAoBxxILZy3
         ppOp8ItdzvTYTabsDDISA9Qz4gswXqttr2sYJ4LVPQlAmcjR9gt/2RW7HDme/mlnOZp5
         NMRbd8bCX0r06RXySMiykni76Vch0MbgB0QmbXsZ10l9SOMtWTQKvARaLnPdcC/VMq/t
         H0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772217417; x=1772822217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Mm3L5n1VZ9S77ktWqS8w18v1vJNzHKjRMTXqXcL5jg=;
        b=PEQDU/QfMH+iFOJzYOvQB1P7p/ikd2tkR8+RMtKLTLgFI5Oa65opbJ9sP0d4mPoDT/
         KsF/RC2yqG/yYD29hG1zTQRhgdTL7ri2Uen8y35GKoH/PQQqapMVVqKhk8sTRkNiBaM3
         DJ0H6cKbzNneTP3Y05LKXsIFbOSfXElUz92YGneGmYkRkh1yDtlE/Iur3+VvN1f6Kgr5
         cZffnv8Pfs1nD5dSMKUvMl78AVt/X0+nlhT4o2VnCZeRjXT9rz/Sqvz0U0rXhBhvA0S0
         /k3d6DH6GJUVEwjmBkC1h1On7kFjdSQACth9rV6qrgNoPrj6K/hzaAwoLQ+1m3oHrFtl
         c1mg==
X-Gm-Message-State: AOJu0YxUb+zR2VeeXoervb89dpqy9qEQ+mK8sKN0m9ZPhDaVAbxgjuFW
	Ap88pd8cH2qh4w9gAtq8gixg6bc+kh/e5cm24jz812CX7rJiTw5vN8fkxAFEzPxJ5xi4YAFNhYG
	0kxkcBTz2uc32+DcMxIIICo9XociVTOYXohGxqqXVOgeYto2XKa88An4myYAAQdUsRrOB
X-Gm-Gg: ATEYQzw8ThZtl2l+4qdaYewnYTWS0zW2Mt6xw5CtcZAWUWp3Y4bwXs7sZEn1EEKIXm+
	9jDWNYI/tNvCnTzzFFxVXk/gGXeIN5ZVd8GjrWR7aal6PHHm49gz+PqVMM8CZnJvBXBqGNStFYP
	bacyYRELAMdUuwVJuc75b0RgtG/5Uo4HqA5i2i+tzdww2NVBjk29E15fR0CRordJjl30CRY8+P9
	b7ZlQ+O/TK9c8GPzSvmIKRfXsE0ZNNgcbVKh6JZLrb2YqLktvXaGF220iOJcImvxkvOHJLLYLZF
	JzljTt4nz+6Nk6CxpkEBpXX9Un5qAc32gUor6zi8zcG11mWJ7U4E6cunO1SlGVKEEvllSK8Y/eW
	TD6WzgVoGMS3hxJnj6Yw9a1CUJbXjU/YDc+FJKqgL+MiTAwov5zOWAPZy+OM3pBg2vY5tvfbppR
	5hqyIzRKypr26B3cplRJcNE5rypjG8vOIhSog=
X-Received: by 2002:a05:620a:4011:b0:8c9:fb29:e1a3 with SMTP id af79cd13be357-8cbc8ef6bc7mr512790785a.48.1772217417345;
        Fri, 27 Feb 2026 10:36:57 -0800 (PST)
X-Received: by 2002:a05:620a:4011:b0:8c9:fb29:e1a3 with SMTP id af79cd13be357-8cbc8ef6bc7mr512786085a.48.1772217416863;
        Fri, 27 Feb 2026 10:36:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bca0e6sm117082e87.29.2026.02.27.10.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 10:36:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 20:36:43 +0200
Subject: [PATCH 4/7] drm/msm/dpu: drop VBIF id, base and name from the
 catalog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-drop-vbif-nrt-v1-4-2b97d0438182@oss.qualcomm.com>
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3909;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=S9urinrm97a3tn0MebL8/S1O8BaYIJcXVyoMPjUkJqA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoeQ+CwjYEc896d2hqJ0Ee+odN7dBHl7b7AB91
 cdjqFd6Y/WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaHkPgAKCRCLPIo+Aiko
 1QvpB/93wIfzoBNtsweJO61t0aiG5sRt2DjU6qiftXksBsD+WybqC+nfFt0/2bfKmfbwLTchMEi
 glGWAVbrB0UawhV4IgxHKZ34/FXiYDbOO6TacVTb3zswtkIvwMgYS/j5gS4mk6Da7EQY7eavbaQ
 aTxWXkGOMSoXzXSRjHdGIM5jvJ7FrTd7EysRqDVdZtUbbRBhh60HiKx7+lOCNw349u55WvMYsfr
 jMtJHWJ/0M4Eh3yRhWNc6ersyJyYCeCU5A7eM0xOrWu9pmHragRiCWHbAuvZoeqB/ItL+QsHbtN
 OXlPqlnMSbvaapdqMI9mhKSut4v1UeR8/TVc1hSYZottX/bB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE2NCBTYWx0ZWRfXxwai8LmZkRJ+
 1FLlQTZkMlwpp91ioM52Lt7rIWdkmEedK3J0AAG3AyLFgy0gCheOXG8V0bMwYI1eLsuIOSUOf0U
 uA+Nlk/8BTVdPuG2dRCuNiuVMg7hUWdyZVVMutpim+FpX96CQ9y0bepxw9FASnxaZvhaUNFJ/0e
 0z46sh9u+8+00mdHbCXm3QnwNaB4XXfNvKYLM1JeWQ2DMOQ1s7rrtMT1bbhldlS/r+VLcJtAoq7
 5ihNPTYO8wOZx+nRa1s048wC2siZM24slos7OU8k8Ri1X/lvIpvtha3l6ColLOWQ23r3gQk3ikq
 PRTkVtLlsmzKhP6T4DRDO3l62KJc8wVNdMQTwKXN60vLh5Bz4TaSKALb5e/+zFl2jK12fQiZZjD
 cp/9MSmatsc/oix4onJMGLxQ8JV1vcnUCnBi/9Jen5fn/zrZgoBYFcK9bHBKh3HBq8iTOvMQgD9
 X9wMF09hNcPCpKMg6Jw==
X-Authority-Analysis: v=2.4 cv=KL9XzVFo c=1 sm=1 tr=0 ts=69a1e44a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=6fVEOi8AC71Pdc0kXHcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 183JaNGwPukTqi9Iloj_HHlDfYhkstTl
X-Proofpoint-GUID: 183JaNGwPukTqi9Iloj_HHlDfYhkstTl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270164
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94510-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 48AD71BC18E
X-Rspamd-Action: no action

For all the platforms VBIF id is VBIF_RT, the name and base are also
fixed. Drop those fields from the catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 15 +++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c    |  4 ++--
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 94c70b7b789e..35c75e11fe82 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -514,8 +514,7 @@ static const struct dpu_vbif_dynamic_ot_cfg msm8998_ot_rdwr_cfg[] = {
 };
 
 static const struct dpu_vbif_cfg msm8996_vbif = {
-	.name = "vbif_rt", .id = VBIF_RT,
-	.base = 0, .len = 0x1040,
+	.len = 0x1040,
 	.default_ot_rd_limit = 32,
 	.default_ot_wr_limit = 16,
 	.features = BIT(DPU_VBIF_QOS_REMAP) | BIT(DPU_VBIF_QOS_OTLIM),
@@ -540,8 +539,7 @@ static const struct dpu_vbif_cfg msm8996_vbif = {
 };
 
 static const struct dpu_vbif_cfg msm8998_vbif = {
-	.name = "vbif_rt", .id = VBIF_RT,
-	.base = 0, .len = 0x1040,
+	.len = 0x1040,
 	.default_ot_rd_limit = 32,
 	.default_ot_wr_limit = 32,
 	.features = BIT(DPU_VBIF_QOS_REMAP) | BIT(DPU_VBIF_QOS_OTLIM),
@@ -568,8 +566,7 @@ static const struct dpu_vbif_cfg msm8998_vbif = {
 };
 
 static const struct dpu_vbif_cfg sdm845_vbif = {
-	.name = "vbif_rt", .id = VBIF_RT,
-	.base = 0, .len = 0x1040,
+	.len = 0x1040,
 	.features = BIT(DPU_VBIF_QOS_REMAP),
 	.xin_halt_timeout = 0x4000,
 	.qos_rp_remap_size = 0x40,
@@ -586,8 +583,7 @@ static const struct dpu_vbif_cfg sdm845_vbif = {
 };
 
 static const struct dpu_vbif_cfg sm8550_vbif = {
-	.name = "vbif_rt", .id = VBIF_RT,
-	.base = 0, .len = 0x1040,
+	.len = 0x1040,
 	.features = BIT(DPU_VBIF_QOS_REMAP),
 	.xin_halt_timeout = 0x4000,
 	.qos_rp_remap_size = 0x40,
@@ -604,8 +600,7 @@ static const struct dpu_vbif_cfg sm8550_vbif = {
 };
 
 static const struct dpu_vbif_cfg sm8650_vbif = {
-	.name = "vbif_rt", .id = VBIF_RT,
-	.base = 0, .len = 0x1074,
+	.len = 0x1074,
 	.features = BIT(DPU_VBIF_QOS_REMAP),
 	.xin_halt_timeout = 0x4000,
 	.qos_rp_remap_size = 0x40,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index fda4f3bdd797..38280d776c72 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -587,8 +587,7 @@ struct dpu_vbif_qos_tbl {
 
 /**
  * struct dpu_vbif_cfg - information of VBIF blocks
- * @id                 enum identifying this block
- * @base               register offset of this block
+ * @len:               length of hardware block
  * @features           bit mask identifying sub-blocks/features
  * @ot_rd_limit        default OT read limit
  * @ot_wr_limit        default OT write limit
@@ -602,7 +601,7 @@ struct dpu_vbif_qos_tbl {
  * @memtype            array of xin memtype definitions
  */
 struct dpu_vbif_cfg {
-	DPU_HW_BLK_INFO;
+	u32 len;
 	unsigned long features;
 	u32 default_ot_rd_limit;
 	u32 default_ot_wr_limit;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
index af76ad8a8103..de70d6b00972 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
@@ -230,13 +230,13 @@ struct dpu_hw_vbif *dpu_hw_vbif_init(struct drm_device *dev,
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
-	c->hw.blk_addr = addr + cfg->base;
+	c->hw.blk_addr = addr;
 	c->hw.log_mask = DPU_DBG_MASK_VBIF;
 
 	/*
 	 * Assign ops
 	 */
-	c->idx = cfg->id;
+	c->idx = VBIF_RT;
 	c->cap = cfg;
 	_setup_vbif_ops(&c->ops, c->cap->features);
 

-- 
2.47.3


