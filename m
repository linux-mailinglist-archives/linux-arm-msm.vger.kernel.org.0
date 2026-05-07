Return-Path: <linux-arm-msm+bounces-106363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIDvIc2P/GlhRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:12:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1FC4E8FFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 142CB309E47B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F2A3F6603;
	Thu,  7 May 2026 13:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGp8fkXr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SkS/TmAi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475AB3F23D7
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159014; cv=none; b=PRe+gCjGoqpkXWAYEz0yuA06YO0EUp0tlC1mIfsqJQjUvP5FsE9PZ0mrlDc+UoiFAQqVtOno2T2Xe1i30TkGhhdpjZHVMfdVti9EsvVPFrpA46hm89u5TWmb4apFcAps6gSH4RKDZ0hWSy0kdu392rM6BnuMwSQrI8n5JrdX+4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159014; c=relaxed/simple;
	bh=u8w5QRXYz08nzTFeeOvvUABZylvk58f+hXEv/T/Xk9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WR+EleVrxzA4UCNV+gkh7sz5sU9LOi2sJdRDPkTlhvURLxim9EWsZm6mons/HitIf2xrLHuklPgyWKHDsoNX24BldCB5AWuemF1ZArDEZ+YVp4tAugej5vNRBTywcfdlAdlBx5Y4Vz57w6DmAsf5wUsn7RxVs9rfJdy44y+YTX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGp8fkXr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SkS/TmAi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6477pU0G1424462
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VjEGhwhCmeNmMAb5JNSZqAnfeaakx8wynUdLZKg6xFk=; b=DGp8fkXrCuYypnaj
	AcDMa+a/vTMndheBd9DPirsrEHiVjkgp0VWHUR1daixP5IEPAI1R3DXJGb6egjfT
	schPSuiOzOhUEU8wdd3dt10IEoyVwMGeuxAYt2mNlvcdkCQBs0qrlEt+N0/Q897E
	wZK+XNRb9yX8u129pekGE8Jq0oaVnsiz37OIfTWgihAhn2Pyfr0NiiEhyfbyN2v8
	eAEqfvfgZP2rMSkE/yKqZ/rRrC0yRFIL57snQJVtGb+FKbBShvS6pajn9LZsu7kG
	K//E4jhv0mqAwlgBBj4y5mLyNYUZBQJV3N/siDd7nDcKgSK1xdq5/HCT6r4oSZyO
	C5zm7Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfs44j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:03:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba115ab6bbso8410795ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159011; x=1778763811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VjEGhwhCmeNmMAb5JNSZqAnfeaakx8wynUdLZKg6xFk=;
        b=SkS/TmAiEQqWbWb3YHFpFj7s9G6piBt+r+DkdUUt7rljltcGW83PVnGHcfExeMttYp
         uFpo/q975eqQftHS0RzkwLoAJsxtOezMQPfiSMy13CfHRUwHsAs+Uj3TSR5PNMMkv6xb
         1+qR+TcXEbfzmrofLSkKzXf0FoEH0ZSQw4YWJA9t4HJI1X0bp4KiId1H53+Kichgrl1T
         cmfWDSZU+OSFUmi6KTlWQZiTYEb8ZyOykiRa07iav58nkPOmx5RdlRYJpBHnWPK/jW5+
         GCSdrvWEOgYFK0Xx4YI3RrbQ6GFQOpFiMnf6rSvKYfSsatnbSmuSXUzQ/q0tK456JyMT
         uxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159011; x=1778763811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VjEGhwhCmeNmMAb5JNSZqAnfeaakx8wynUdLZKg6xFk=;
        b=MJ8bqjh1lqUTD8SrLoHPhSPbyLPpfT+vQjqYOeRKail5tCDTPsW+YLEfoyz1XDbRRA
         CZtJy/tSC9CIBqTmm0WjJcOTo4yv6JpT0BbC7l6GFbQ+dy1nlfSbyGIeNH7sEg+RZrr5
         SW0paA4at00eN5RglzG9TM2wPGpcMJayuHeva1Gd3WPNIq21DJQq1p5f6txmnnewAZIK
         xA9iFxxYRhNYxQqE4Z9aN443G2jjpAwpAdPZ8hhf0kNHv7rLGfelGwndkdwnb2cjVRtw
         VvFmJFpz0yLU59Zr+BXaBUFQN+2e5FK67sTQ3DwGt0zJ0c4ZyFxCmYc8jkP4dwjr4yBr
         7m4A==
X-Gm-Message-State: AOJu0YwtZUIeJxuGwtZaf46KZ/Aw1QoKZgDohEpihiEhy4IyoUcCrzYi
	0MHqtvvGljq1j3Z5m7q6Ow6ZsNBWvbME9RHGqV5gDgYk+qe9o2YSWBuWynE/kRZuw3Gwlbgq1uH
	Uv+OW45sGGxDYnvt9RXpGxLAQrDB9mmHqklIT7phuh1CsPOOF7HHNeITI2/M3kvcclVeP
X-Gm-Gg: AeBDietnUhk1BgwywPyacPJNo2crIRKY0p89BWGrtPfSNKMYqtLk1kzA1BVhgHhsqYD
	1doUUClABrH2uvSBxtSE68mVWnnY+Rhz5CTr5HsuR7N+H1KfAn9kjwzpBE18c6pTP6tAIT6Da9F
	IGz+6lkkNG4rZo4/BrQT/tG0Ccdp7eryO29Zi98TGmqou6/nXSZyOCRZFJ4oEMOwq2YXKsAqBAu
	lW8WirkKu+Ip3/F6c9/aNHAEtuPqybmVt+Ovo7ZmO+AylVlYSETV/3INdf3nA36PwWhhNtRQnVJ
	AoytTK8PKR+huBv5NriJnqvbKMJ5gX4lWk0ASe3LNBCz+2DYjTA3pjn+87X5xYzW/kvB+B7WG4p
	PsZwdncRXC5oE1iqm6kLlDl7SYriD+x45IUfJoFQd21hebK+eY2nukQzB0osnrLFdx08vrqUR9L
	rC68O8wUPZkRnqX7aqRb26pn2tMjhu4uIxAZWkIdlY//8naQ==
X-Received: by 2002:a17:903:390f:b0:2b0:5ae9:ee4 with SMTP id d9443c01a7336-2ba79285966mr77063565ad.5.1778159011002;
        Thu, 07 May 2026 06:03:31 -0700 (PDT)
X-Received: by 2002:a17:903:390f:b0:2b0:5ae9:ee4 with SMTP id d9443c01a7336-2ba79285966mr77062925ad.5.1778159010398;
        Thu, 07 May 2026 06:03:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:03:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:04 +0300
Subject: [PATCH v4 08/29] drm/msm/adreno: use new helper to set min_acc
 length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-8-c19593d20c1d@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=u8w5QRXYz08nzTFeeOvvUABZylvk58f+hXEv/T/Xk9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2F0+NpfaspL8pZUBBp+X6pZBEUAoZt0Z8/F
 qWGy5aY9D+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNhQAKCRCLPIo+Aiko
 1WBOB/0e0Rj4/4LpRbW1tMBmidfdTUOmpst7orERKAS5oMvMZ6Fzgf20IHn0/f2Ro47Kh54EGTC
 ToSD6h+9tJz1o8bbiAGX9uGhQs1d8IOpn+YYHKLVjHkmPVo5vuvV604vhULn6eNMhE8Bh7ITHda
 6CuRLQgPOQXqtzTPXenTT4KbEodTsnrugbZEIXWxkscSLB5uTrkMYZdnxvIU5HEHyVVEWenxAIc
 91qEZhqIWIOgFJxv9t/QT6fjG4xV3frBQV53+di8HYj2bYmypovZz+UZEKhtqH2kfrelFJc0HgH
 IjfpJvlsvdAXo8wOwXH5teP+yyn9U9wrtHk7yH836EBY2VES
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fc8da4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=X-e67srwgh_QgMMAbO4A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX1lEg2YCRGOdO
 t72SzMX3/mb8847oLdy+NGeRl2TVFhEb9ULSMbcIsV54qTfHDR5YY9nxXRw+SIDUyksu3lvqSWc
 RNC5XVEJ+lHjFEZL4uFBjrCCEu7vHPbgpZWkFlJJfBaAkOBFi2HDQ4m2GL94pzCz42pHY5n9khw
 5LhiV588/0riijjMyl3OnUatEPoAQ5uNlAqiWe6r8f9hiDvze1irdNJSm2sLtR+QL6Fq443Ayzc
 yauQqxoUQfr9dNt0U9oDAUuEENHDjdWki6ZOtq+GaTfowtjuUMmAE79S7oPo1ITgJ6lAKYr0Lzc
 TLmEnXhq+I1wH49PyNmngPGVenst8x+QxnaFOBOhUzkOE3QUSN8awb9XMlxXd+TFwNNH6XFjMs+
 O4+5emwLAQHrhxXheR6M8rAd00ik/lL6dlW5suFjMmFk9bC7a1/ZcRqAHd51JdZQZRYj2T71pRw
 7y0kulPdDYQD9uwatcQ==
X-Proofpoint-GUID: wZQQjLVIwOqkN1TVEEj6nnrwfZWDxrX2
X-Proofpoint-ORIG-GUID: wZQQjLVIwOqkN1TVEEj6nnrwfZWDxrX2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070130
X-Rspamd-Queue-Id: 1A1FC4E8FFC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106363-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

Use freshly defined helper instead of hardcoding the checks in the
driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 1d998636c5a3..812bb95e8011 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -748,7 +748,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
-	bool min_acc_len_64b = false;
+	bool min_acc_len_64b;
 	u8 uavflagprd_inv = 0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
@@ -756,8 +756,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
 		uavflagprd_inv = 2;
 
-	if (adreno_is_a610(adreno_gpu) || adreno_is_a702(adreno_gpu))
-		min_acc_len_64b = true;
+	min_acc_len_64b = qcom_ubwc_min_acc_length_64b(cfg);
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |

-- 
2.47.3


