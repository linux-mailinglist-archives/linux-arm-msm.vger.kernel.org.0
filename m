Return-Path: <linux-arm-msm+bounces-106372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PPqCpyP/GnDRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:11:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 367EA4E8FA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 847CC305420D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4A63F9F54;
	Thu,  7 May 2026 13:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRcq+4ot";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YmaVHJBW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97112406294
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159040; cv=none; b=n8FJbaFV/2H9SKbF22M0r6frFLoNAijcYHSetuZDwOO4qeOSpvKOB0cPotBUM+ABYkc8tEsgIeIRPTQeeML4GL3v3Gyf2zrxYZ7QFH3PQBkPOpHGpBrm3UPH9bRSb+Hzm12CBfGST8x/A4EbIkvpg70gpDgphJymUBLvKxevn/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159040; c=relaxed/simple;
	bh=b5oeFZM8UPd7zv2z1rm1o1ivK8BBOWD5ytqdmxE1CA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dk6tpn+MLu6WdgNjN2gCnzFJylt5vPZMuJnGbisREf8okjLcY2EVV2kIHiDqCVA1gH8360imxLS6O6J806X+KtgBe3WVlmrs1F3vWnrpOXSB3v6eSiAVZ2yYVprMfis/7s/WR2LTho8cWFGQsQXjlJeL+kgu2bWJwCNUuWZnJKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZRcq+4ot; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YmaVHJBW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BTIVP682791
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AeVRvHRKAYbWbJMpPrGT8xN78iC1aUQpOFXz3bq+KTg=; b=ZRcq+4otWaGHZqh1
	bxnrlJIGhp0MaQq2+CAOumilZ4LzHZdZoJW+BDJwe6YXL+9o++IOgbY8w3Vd8+yP
	czeYPXSQqXMcEd4CRvNSjXG9LNv4y8PnCoCGf7uYglr/F9pZXFeA/541d5JMudaN
	1HKkKcG0FonEzA6uWR6BB1zBGDGStvZcFl6QE41fbCC/jLXPAwwwaRc6Qb5WYoLK
	Zwu9tas/1BXUq0cqXN1rzOjRYN9l+GA/4qRFOIcUli/4dRPolJXdqA83bl5J43up
	FSZEpwjLzHWvSXGVwnrdwlfUwcUtdexExZa7cFrHDcf3fT2bj7uV0D/JZixuXIf0
	5zAv3A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhasn02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:03:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso9459805ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159038; x=1778763838; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AeVRvHRKAYbWbJMpPrGT8xN78iC1aUQpOFXz3bq+KTg=;
        b=YmaVHJBWFgV5U6MU0/QzKkjSmkzXT0TATmd7tNB/9FvB4/Ix2zCPG+pTReJL79wCJJ
         sIdNqG4uuYPFJagwbR4rSCFtExaF27T6qBjjaPKt2CCLy8RLON6rWQtHSmyEPChDEZlk
         ImX8OcdGbFBIL7oMSaY/tsVW0SW9+62BfEIQW3g5vnVMl2PInRJGY5HKvU9Y3nqG2E4Z
         C5zRzmPydfgfnsBX3bohD0HZOycRv0qsbbc43iJ7PjLZHYJlG8AhFZi7ZFbacPat4YJF
         GI4onnwcSk855TCghvA9JRd8Wqi7pjHhyMFBkjXtrEu58TclBB7NcFvhl4oaKOpGwnci
         LBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159038; x=1778763838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AeVRvHRKAYbWbJMpPrGT8xN78iC1aUQpOFXz3bq+KTg=;
        b=X0LSvyjRGaVRzgFTIfYCtXoNbUgyDVFei/eQOreIXjTe5hxYQcmUPWz69+MrRAfZmh
         QHl3sFVRFOOoqquTkM4ErkSXKfh4PU20jqapAmaQ/vJHnPuVxpYpGLkKxzDeXOg3eGSm
         jBJBiNALD88Vpewu2lzZJq06sD9qeJoPIhzcyHm++nhEBoUGIKOngRYQs6v37/Z+85Kb
         K7afNhcyJvOuxXVuzIi/zCk+q1QHEfgRTO6+9WYOctkIaFAcfmzM/uzF5NXrlKs9gYT9
         +HgqXIx3KNBfbi5pX6OiSEphDpjEjYZ5cCpG2dbY/Ra0iAw8d4t7YYaXNf1QkUypu9kx
         q04Q==
X-Gm-Message-State: AOJu0YzpHxsTigQ4g60vndRLCknmp1vWYiegnUU+3y/s0A7GXFHbN6ZY
	86wVl/pmYXc5mBwe4eyD/wUiZ+IMjhYuQE9CEwXdM0ANBGW8lLJtB7rgyHPAThqOzBL32hMN7WH
	LQhkFXuvFZ8ad6iHdIEgr/ymv3vrIR5yXRbtQ07yXg5WPJKkKsk3dkdCg7Pw0TijVi7cR
X-Gm-Gg: AeBDiesxlkfhGYxohpFqb954DazSjsbtxzbmJ2Qj/2f5wimfq+WP3E5jpsWM3cJCiIq
	E/qcvXV8xw2NydhwNYcH3EP88SqKfy+6PgBvKsb0NnVYOwXsycRgfKUudWak42pG73wgbvdXCRn
	yD6xj3xCPPoqwJ0sA+ssg21jGma+RmJ1HXowR/LV3zi/yGXMjUbId8K0z319cw+UW4mhiNo5UEw
	H3Cp0kfqx0apbICGBOHv3LZjEpo4y8vloxXPLhLn6JbOCZpTE9jZRu/BpsPUN4cg4ZbSVVi7bfH
	LWztfp+7+TNV2bTYvhK/ztWYJeungfmO5i8knY60F5xitWGGok+2hp71Gwsx7WhKvroLqp1OKRB
	yMhesXeXKZWrnyrg643PR+DzNpnhKDfPdKLSyWmXCO88MuZDpALO3IqmczpZON33fvKKRohKsfd
	9cslM6Z9Jz2ZAog1Vdn5fFOqPpkT3h+rzEDVzcUH99ZrbdpA==
X-Received: by 2002:a17:903:144f:b0:2ba:359a:9b8e with SMTP id d9443c01a7336-2ba793bfacbmr84139205ad.10.1778159037679;
        Thu, 07 May 2026 06:03:57 -0700 (PDT)
X-Received: by 2002:a17:903:144f:b0:2ba:359a:9b8e with SMTP id d9443c01a7336-2ba793bfacbmr84138475ad.10.1778159037036;
        Thu, 07 May 2026 06:03:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:03:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:13 +0300
Subject: [PATCH v4 17/29] drm/msm/adreno: set fp16compoptdis for UBWC 3.0
 formats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-17-c19593d20c1d@oss.qualcomm.com>
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
In-Reply-To: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=745;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=b5oeFZM8UPd7zv2z1rm1o1ivK8BBOWD5ytqdmxE1CA0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+af3rYX3FZbNBPE/r1uK7Y3d54lX2gczJ+Vaf7267U5n
 t92OLR2MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAihn/Z/9fwbwq7r+NVLptm
 uzfQtVBrxV/F/+L9Lzu1ZkofDpj25ei/X7xbnvidPeRyxnDJ3neZokdyj8vwb+XRu6DqmTdpsnK
 YL2d33tcjWu358zrDFhxnuZ4rZXSvfM/KZ28cf0upTt2oJVbuEXAo/rHBoWJH7ZrSP20Lghuqn/
 UEXQm5fOiR23w9pboFHxekGd/NOmQbcEKavfq5RnbGhYgQ489cXQfbOO67ums9OutidPdPdgNPh
 /n+LX/3MlX3qO1u4F75TT3IRzP98Uk3V9umG3m6HhHlq9X9V/3bdLXm6rWIy/py3dVN5/V2L52S
 wFB+ZAO7SJHV3hV3Q4KaBNnDUkWvij1LW3758uoFj+NtAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfXytIKBOmXUusr
 DpTHiNs7FZN4MJmifHy1uxoSRksfOB8ChMr6ydfeFxgHCcY5nvwwZEbhrdEyFr/nsjkF7XS/SBm
 MXAUmgqIyD/hqd6mQYVTirx+UcyciSfrPCeFjo6ULOBu7Hb+Rb336a3bgZJv9eXiV3pCf0Pl2ol
 iEodrjo34+YwvDSSQX/dOkws/xisewfPyaNHIsJLJmEDzcKhJpXI6MGKgbB3D9utUj4U+q7NQZc
 mGhdAa+JAfiJIeJKqI/HvhFO0jjSo+u3q9A57PWol38NTCvbPe3NMJ6h19jkyJkF4qkn4JEAHZx
 dTORRDRckVGHZvg9ivGcJzjQKB2Gip9xvp7/ClZtdj7ZCRCOhmAd4NQce3QkzcGkLKPZ17gySnD
 YahQ5SXcmLGbH86LFUUJxTRQxyMQtxpZ3KrkpNVn2RN5cwM01OwRQ1SUxRJ/4DxIjo4m3CG3GOY
 NL1itC7/OS3PFnsVOfQ==
X-Proofpoint-ORIG-GUID: A9IKBEoo3k5ySB63v_Zjao1P8idVR7Kt
X-Proofpoint-GUID: A9IKBEoo3k5ySB63v_Zjao1P8idVR7Kt
X-Authority-Analysis: v=2.4 cv=ReWgzVtv c=1 sm=1 tr=0 ts=69fc8dbe cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=CoZj-JnWnDGe1ZqNdgAA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070130
X-Rspamd-Queue-Id: 367EA4E8FA2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106372-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The fp16compoptdis bit should be set if the system targets UBWC 3.0
format in addition to UBWC 4.0.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 7a6223ddd8cf..867c7d05f670 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -303,6 +303,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 		break;
 	case UBWC_3_0:
 		amsbc = true;
+		fp16compoptdis = true;
 		break;
 	default:
 		dev_err(&gpu->pdev->dev, "Unknown UBWC version: 0x%x\n", ubwc_version);

-- 
2.47.3


