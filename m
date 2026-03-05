Return-Path: <linux-arm-msm+bounces-95588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OhxG9RYqWkh5wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:20:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF73920F99B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99B2030E0524
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 10:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664C737E2F7;
	Thu,  5 Mar 2026 10:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+P+Un8E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JtSXN7jZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B72937D13C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 10:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772705848; cv=none; b=c8GkgP3kb7AyULfvg7sBjXOK95E9AmLn0hSrsa9BuOrdI6LlGoD6IKGDp57HoNRXBFSiKpddQ2uIPAForKFlG70qmGlxSMuJXC7myt/3ZCMIEBmOOVSttBatINxPPwZwTXPold5+KxTm2QFaFVCBAPRw19eNsj8x1l6V7yQk7+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772705848; c=relaxed/simple;
	bh=76JSLPRliwCH2DQGBr/s11LQAsmvDKZNerj3OgMQbbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qJclSOwzN6Mo8kuk/CV6YnAMHkxtLMRdkfdFKPiM4qPuJOyfjdWDdgrvcZzU94LxHK/9dKKlyYuUShhjYDoXUxRH8t8gEqLs4Y2mVFR/XJ8pgI7xPiJR3AMZBaULiRoNcm1RV1OJDdSKpsD+T2/LfwvKxgpQgREjvib4HglAl5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+P+Un8E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JtSXN7jZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFpsd861664
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 10:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JjlwyC37ZMKEW9uWvYiZHV/c8H3CQ/IJn8+Myzw34aM=; b=a+P+Un8ECkESr8ly
	CflvRw6US4IorqTkLiPc+zarpjfU9UI8qHAnvrLSFbnioFXPYul8a1Dgb1qbYSlc
	OLcyJNZU9h6zxjcdAoNeAy0EjVIuQkUBax14r3G7rWY27lLTrDLfwbwrh+E8SmR2
	3ba9gdRblRo5N6HE/i9sCO5my6BaY1ahs+AqcBeVnfSSXpPhgD64ANBmZWCzSm7z
	Z6beQXB/1oe4S6vx+Eo63UBGr35bSS2gSzEFtS5r9HRwm8JqU0i0xziAeuoPTFJg
	Oj4rWs4YMEzv+psA/vpXC8BrL0z8CN8wAgBgWRzxpY+5Hw16SpPYC3gcyxZzFCnK
	9d0kBQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wau7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 10:17:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899e5c9edb9so374150006d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 02:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772705845; x=1773310645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JjlwyC37ZMKEW9uWvYiZHV/c8H3CQ/IJn8+Myzw34aM=;
        b=JtSXN7jZyStq+MXTrHaeeG5TM6+ybGcbvPtnavY8k9plVNf0O3A5F+IWzmX23mYW7w
         mlW8dz3KPWCy/QcmoT2doUclh4YkheL8vOZx/6oUd4W1DwZnjvoR+qWRtwxG8PHusVSY
         yki3mL9ay1RmYIz0o6/z9ZkoeKvENDDNG+p6OAu6Xl6HwAEzxc6QV1oC34jLEnnzl/h2
         /Iby7C0iR/hmt9YXUmly6zpreeM8XJvz1JkxSdHzPiiSTZGql0zGgsOVz09gZkbVEvcV
         y526GBPdekt5cpOMT5kqaSRBjJ9y7alqY9qrNLF0NavyOz0jYkyWIasg5Rbnjogjzsm+
         9mBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772705845; x=1773310645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JjlwyC37ZMKEW9uWvYiZHV/c8H3CQ/IJn8+Myzw34aM=;
        b=NbSRmelO2ZtLOwDIr3zHe9MR/mcu/ZH3vav2pkIjyNDMWoiAjzCleA9LVTyDiMXW6I
         Ii7+ClRRon9VigiYUgYOh1FcIERfswCbHcmFUYvNBSlzwWFv59n52CF8zNTYUqfsQwgm
         9+vrGkS+dH2EWNpkvJlFNie/EmL6Pgiw7LICWjfqi1AW/idpF1iu74CStI3vlbZqIuci
         V7waNnvCVPngOzPSeqao7qMF1jQTWTk59wiIfwwBnU8J+iJ1Cq2KhD6PHyDj7IsZIXQZ
         FFUwRlaFpb2JVtp4T/nWIn98jMzUrrvQ8O/iCMtDQd8J7RiegE35rzu6coSe2gek1/rH
         ck6A==
X-Gm-Message-State: AOJu0YxHHrCkwR55PLPwxds8ECy6awnRAGDVrwsJxYpWyY0MemtdMQ+D
	GvdkdS4CCD//KtWNA9etzM1cmnmSm85aFaWaPCa3UGh9Jc3eEgAeAS4yADJI1mdxtQMPAVMHqgL
	i8RorUjN0u+g5Eu0wzeT1Rb81m68d+YdFV3LTfdhfXwYYSJ6jEmyyN005GLjjekpaWXwH
X-Gm-Gg: ATEYQzz8bhXFz+zK3gczNLyD75wls9+ioH53lrmOswBs2EYLzGnmT7M412bUcD7JVYl
	Keh5ry7yv2f4YO0bghgHa7AZJ9iUtvPSGrDGOu/liAXM1v+sELqkvoRMch2WLH0LvQk+WQRc0rT
	VOKikra9UpGrac7fpQ1MBjdzc0f5/EknT4vAqI4zZHmJfM8AiynX6LuM1U5jEpc7hYzuiX1cEUa
	amAyWnqBgrBi33tVzXEatJSBOG7TJxsQtNfgCHz2uZMiBDc6DKnvccnCDeMcjdDz0HZR9MWPer1
	j1WgfiTqfmfKJOf9dsaJNbQfHhXQSX6oxv6MnMrvsHrxfG4ILQoZwotmZOYe/9dlDZjHUTGgsU0
	t4RGttCvC5ZPgtFObkwkZpbJL8fIjMlc/xvN5PUG/NGqMkvLrLaCy29SAVkspIEpgqS6lBe3weW
	4gfzuybmo=
X-Received: by 2002:a05:6214:623:b0:89a:77b:837e with SMTP id 6a1803df08f44-89a244779b0mr20540466d6.6.1772705845343;
        Thu, 05 Mar 2026 02:17:25 -0800 (PST)
X-Received: by 2002:a05:6214:623:b0:89a:77b:837e with SMTP id 6a1803df08f44-89a244779b0mr20540246d6.6.1772705844891;
        Thu, 05 Mar 2026 02:17:24 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507451cda0asm194096731cf.24.2026.03.05.02.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:17:24 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 18:17:07 +0800
Subject: [PATCH v5 2/2] drm/msm/dpu: Correct the SA8775P
 intr_underrun/intr_underrun index
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-mdss_catalog-v5-2-06678ac39ac7@oss.qualcomm.com>
References: <20260305-mdss_catalog-v5-0-06678ac39ac7@oss.qualcomm.com>
In-Reply-To: <20260305-mdss_catalog-v5-0-06678ac39ac7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mahadevan <quic_mahap@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772705829; l=1244;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=tO41DjAOfQzqwZFbNKiKJu3u3O77mCrCtRYIBZJ6ZXY=;
 b=zlSVe181QTt/TFKu3KzUdOpSymLiiZyQyFbIa9D5xvvJSW+y7BQK/5zMvgHFA1dusq9HOeCAe
 lPO6wmfzSQ2BA24CSjzaVP6TSOf7rpK2iAM/J6jZgCGc1Oh7H9L+eyU
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: CRQeq4F78qFK10rGIMmvphMbJZHdS_AZ
X-Authority-Analysis: v=2.4 cv=BNK+bVQG c=1 sm=1 tr=0 ts=69a95836 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6ltB2YlUPjWEuFaGMccA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4MiBTYWx0ZWRfX7meqB3kUvD69
 y7dVDfgygsm/tc5i6LvkPzuuDPPsbe3Kfy/f4YSeWL7bEMgxR5WFlbXu5jRs1b88iZs2ZtaXJXv
 ut5gajNiVOiH5JBeWnbl7k9bbPJ3r6JtQlHAgPrFoKe48GR4QsZMpuI1lUmr1Ez7J71WpFh5vvI
 VUuYBf/Ts8jrivV4rhDaHl2q1nCxCbQ7BD+wRKdF0idyQ+Mi15KdZXPOqf5RazFYPSAATwhHz6L
 4R7EEh9oMcStb7de6NH+ljSn+ZO3T8D83xvK7VGHGaGayxyWEVMy1UlXfqeCNpshbKw92fRl5gL
 wV1H9eBV+pGR3whtJ2CI63mwLWjBwPGglRr/8H3OmOK1CJSoNcSK5iQ9Um8ykZlqYfVfPdQn/k8
 RCe+HQcECEAzO6xWaLYl9uWaQuYdMza9RyXmwxk/DAjdhheT7+RtCpyhUU70LbPYBZ6kYFJMGt2
 yo0/wLZUmsfn4Wk8IZg==
X-Proofpoint-ORIG-GUID: CRQeq4F78qFK10rGIMmvphMbJZHdS_AZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050082
X-Rspamd-Queue-Id: BF73920F99B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95588-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The intr_underrun and intr_vsync indices have been swapped, just simply
corrects them.

Cc: stable@vger.kernel.org
Fixes: b139c80d181c ("drm/msm/dpu: Add SA8775P support")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 6b24e9e84dec..00fd0c8cc115 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -366,8 +366,8 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
-		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
-		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,

-- 
2.43.0


