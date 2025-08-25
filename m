Return-Path: <linux-arm-msm+bounces-70700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C12B6B3437E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 574685E57C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949803002DC;
	Mon, 25 Aug 2025 14:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fvYDCdH6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37862FC891
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131512; cv=none; b=cM6Vu1hnCrFHSbiLmZY1WXY7vZSXoFgCue4d2YFxclU+dYtezyBSmo1LQfxls4Bya+v6wiMOlGna0oj0qxhRQx9cmcAMrxx2lMHO+PPPjAxnqZ7MzzXPi6K3GtIZQWc6sR/qDXCb9d/NC+5uifAFumIH6eVlltI34uPu1pW3hIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131512; c=relaxed/simple;
	bh=gAhbe89jtUjMs+tCQuBkomsR87IKhc9qd6HJdgnxz8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jYJMFJOlZlVsb/dpGQ8h06F5XteWFppSuF5H1mF9jFCDV2Xvgi2ZKSzwscRCn1t7jaLdjOufHrYcTVUASEK0Yioo5985opy//vCJl0DipXZ9eAjhOM/U10F6Ijrgjmje8SDUxGLFmxRS7IkGQZTKA7SXzwUKXO+s7gwQ2DW8SDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fvYDCdH6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8Tn7L026626
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uJhqvqQDB3HVRz6gPABXZ4Z20PbjJ0Q4eZGeWqXXZ84=; b=fvYDCdH689Qc92QY
	XDgTTOW7ucZm+OLAYHd8f8/cxjUySobH98y8j9U+XUQtNeua1Z0CyEzuP/YkwE1o
	nSMAggzfsh6RjBsNf1DYg69EJbGDaruInTTPylL7FnJ1l/MyTtTOucUJrSuFcBCE
	6DVYZ11sWKuJune9ss157KL24+SZ2rDxdsXUkE75GM/0TBG2xcCGSma2cPoXip8O
	MBd765ieEazK7RYPDJfxLXFiEdKw4l8wP6T0qJ45ma4Okjp36z0aWDUMcqEYf6pH
	YNWWM9uZBkJ9Zpty8laI4/fGpLJa9ElFZBE7gHb0YqyHJH4NVFt5zsH5l8CPEbcJ
	bgiY4g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um5edc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-771d7aa1470so924344b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131509; x=1756736309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJhqvqQDB3HVRz6gPABXZ4Z20PbjJ0Q4eZGeWqXXZ84=;
        b=EyEmfn8SX1c2IVYVe1/aVDlPVtY4RZKWAsVaVEohfA4osBmIwvVWvtu9XMzoRe3+r0
         l/Rl5So/MH1h3L3W+uEZg82wJiN/Cz5qSps3QdTljZU7olFTG/4fqytxPbY3XSne0TDb
         270f7mnKWe/uY/wJBDLSWZAbTmk5AYVONaCpJ0DxanUTx1/4AZ2bCpE5yGNMc8TfUt2Z
         sorTjXVBu4jCVr4bv7gMKYKl2nGPtIa5czny+pZ84updWxUNu1jocus0ZjR3++BZ0I3b
         iZMlIEL+vh3tDYIX6NvJaytUXOZ7G0O+9ijVUfBhpnSY2xLlfyrxCMqstJMlL/Ygjb18
         DzhA==
X-Gm-Message-State: AOJu0Yz2XNTzF0rXmni2gVM44Wd24z85P+jfqEyDRKHxpWOZAA+kZS1J
	vCG7BATCg0V1ktomLiK86LxG7C/maifa+P8lOAF/MyruRGBt9uv/gWQlWGr12mks9nO9DOkFFyI
	S6TY2EUeY0thaEmX9Ryt/86ZayX03hOsUzzILcJsjYwJipmj3kdNTTzh4wpWHam1HpX5P
X-Gm-Gg: ASbGnctLV/tS/EZ6qzWLl0LieanmSQRXh05gR9QU+jNeGaxEObgzseIdjN2M6rpF5mo
	Swyymu1B141uvq0gBjvL+Bx5YG9xrOUPRvQz5JxwY/Ip5mGhU+I5Pv6zL7I9DM9O1kwimBFaYiX
	JzrYO/PFilb4dbKndcrdmkaQfujORiOg0CrkZdodJua9ZZ7sBpmOQCUJB8iu5yhFC6wcD2CLWux
	TlcMQerEyUXmhwUmXPvVLRizGvFU0K1KJud/p+0DVcrSSch+z5eM7KWmYAM++0+W+vEIyN4NFZ9
	tcBAg+dUedeqvkashamFtdQkHOYY4+Uq2X/la1NCIAl0do/briTtLh1DAw8wGZxWvRh3EJs=
X-Received: by 2002:a05:6a00:99d:b0:771:58e:5b10 with SMTP id d2e1a72fcca58-771058e5ff3mr5451510b3a.8.1756131508922;
        Mon, 25 Aug 2025 07:18:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFNAi2rKuvat9119atkAeteEXRTs4Acy3AzEJ3ZC9cZKTCP+PnnhPW5x3T71qafgNzNby4LQ==
X-Received: by 2002:a05:6a00:99d:b0:771:58e:5b10 with SMTP id d2e1a72fcca58-771058e5ff3mr5451471b3a.8.1756131508321;
        Mon, 25 Aug 2025 07:18:28 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:18:28 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:05 +0800
Subject: [PATCH v3 19/38] drm/msm/dp: no need to update tu calculation for
 mst
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-19-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131421; l=1000;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=k1m4e3VK8u1xpO29Y3ltxjmABJorHzY7vguJ8hjD3qQ=;
 b=VkBvuFrfB1Ql4nqRlzbxrdOEfh+A3k5m2zJ0uZQo+MCP9ZGY9kVnH5NQQ8GIU33xIhfE9xTnD
 t6SQXjThQ+0Cc5q6e25GBxtl56Isg88ZTWiukWaloHZXTwSQmZ40lsh
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ac70b6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=nb1SeSCrlpLBeGjklAIA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX5akaFtTyEMl4
 NL76lcTX/nudLnxuMmAJ/AYmQs8xvKBfoU/B3OpDI/rd8k7LGY+7O9HPZPRszOtpcGlh1UFB/ur
 NYpH6+I8WCz63Da2NTyjNbCwO3b7AIx3WFViyi10q948DMg/hLnoxQDRPFXEYX17xrbFqCb1dCE
 vt1eXHfTQZwDaIMZTF8c0gnIx80a/R6/5DyELrGKFYl94fEx4kYvuPPSNDGpJqF5st+59Dx708F
 qzDJtc16M6sdEZ6ueininqJhSIeSO0CQCJN28wxs1sYvQFzDyWBAkjyyI2/Cc+lRYzL3Y2SRUJw
 cggwPooytdxsYpLjtf7Wr9VEeUy0CIVfdJ2xtbnHK+QuHTwaq55XLPp5yr79IiKUslJWSUqwba2
 rwbfrqNN
X-Proofpoint-GUID: MtDDAD_vXhM3CqeKKGfS6Hli1bay4Op6
X-Proofpoint-ORIG-GUID: MtDDAD_vXhM3CqeKKGfS6Hli1bay4Op6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

DP stream is transmitted in transfer units only for SST
case there is no need to calculate and program TU parameters
for MST case. Skip the TU programming for MST cases.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index d562377a8d2846099bf0f8757128978a162745c3..c313a3b4853a1571c43a9f3c9e981fbc22d51d55 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2685,7 +2685,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_panel_clear_dsc_dto(msm_dp_panel);
 
-	msm_dp_ctrl_setup_tr_unit(ctrl);
+	if (!ctrl->mst_active)
+		msm_dp_ctrl_setup_tr_unit(ctrl);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 

-- 
2.34.1


