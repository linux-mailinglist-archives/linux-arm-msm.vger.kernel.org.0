Return-Path: <linux-arm-msm+bounces-97236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMmZMBPBsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:35:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 428D8272B08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4419030D217B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2AA83CC9F7;
	Thu, 12 Mar 2026 13:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rdfy4LiU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5zgSnkY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDB73CC9E4
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322201; cv=none; b=qIp2JMNloZoOfORyTE9dTqUcOLHNaBeQnhqTD5Tj4qYOVZkyhnV515o4Nzdz0INpeFt/5wMFoehJ9xP3+FzjXIWzfvVSc5k8Ukeuqntoj9MTis1otH/86Sb8cEw2sBZLoV5aspSR8IqLQCyVV0fiuts9ZXUx3nmjzjBFCeMeRLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322201; c=relaxed/simple;
	bh=TtYxTDlV4ADdZSME8a7mAAI2svRlACyoCBLVOWAbvo8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yrp1ozSOSXBVnW3Jh9XvQx91KS7h4QMSur0MM2/yMFn+b4RcsXEvzsNAh/e2a4mA5aWHIeQwJlz3Hs3MnMACzuDbCXjtth+wRjsAKBo1iuPURsw2PFPS/zuKqy4l7i9SI38hV7ydopJtop0Coo1sT9Wo2FAg8HDR8T7Wwg4xOwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rdfy4LiU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M5zgSnkY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CA1sAU3668243
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BRGxG3/EH5DbV/qm/ujSo28MLbGNL8h5SekKq5Cws5g=; b=Rdfy4LiUFOr/CHJC
	ZXwzD8Kdes47Ov2XgqR0+fQDpKJY0ADsjsStABKGPGKU3cWJImPLqaVbURDduaGf
	PwOqW5zvIDr6XuvcGhbuXwp+GqgTXZ4o4XVsskf2SCPHbzcf5GXtc6EF8R2GatgB
	QFIZnrnAZeCPxVhey0FXciy534ci5K6NVDaPZm4pwpNOVsDs0TPjyN2hdXmz+EcM
	VW4CT2l2t5dn6PFIyOK6NpsezUsOt4SnlDpUoUHVdBJrnEI8hxClQfjuV5x+yg2F
	HnjjeN451LJTqQsvwOeOfO5kscfXv64xAEBqeOJfufZa140j3RhG1wx8fqbtzGww
	tGLt4A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh60j7vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd98d96382so120212585a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322199; x=1773926999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BRGxG3/EH5DbV/qm/ujSo28MLbGNL8h5SekKq5Cws5g=;
        b=M5zgSnkYmXHO0si7Fj7ftcUT5g5/lJa9UDoBwHG6uLn8fx0CWHDYl2uQjtU5mQnwNW
         g7NYAvgl/SoBnNCuX0QU5bpEOnKwUR3bT4eAPID8vdPKMQgjPqAUqwTQBEJLYpsw/L0X
         zsZHvUKLqIWt10NO5a2Sq/aXkxjSU1A5UMzKSLDRpPBlFFHP0GVQ6Sk2anVrrCgxX9hW
         BK7tr2v1jHGTH2tUhYJJFo49tF2yb1v6igi7yd06p2Eyjc9hNXblBbpUYBBDH+2x1bHH
         RVQP/qVVB2XuJpZBLKkFQcUpWX8XNE/8+wJnvPef9adrxpDmU0d30rdm19cjoPdnD42h
         T65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322199; x=1773926999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BRGxG3/EH5DbV/qm/ujSo28MLbGNL8h5SekKq5Cws5g=;
        b=q8F2SA6dZ91LWSOnKFkWuqAfDfFB+Y9EDRY5DNZn3x8v5DCFC7SdweRDUa9kCEIdYZ
         Ks25yXHAcuzWIM31rt8kmzmnN1GgiFbQyizOz9sWhBN3XIOGNwXelFeU2Rb/Ybg2wKUH
         mxIN984mgRbzwDJPd11aAf5ECorhcBCF/KFZK7EJlFU5nOj3E9jJtWg8OygHmYBH0dGO
         1IFeqIXvb0RKZBSKXNfmme5iaWWwEJOjjC3w2BV+zLn9USpHhCusc3aOMHmfKGkErtL+
         l+gjLhl9evIqzm0JCMcos+V12EW/bONbhXyhuZhQXtf7LKpewgeP6SmsiuoDXCM6s8pY
         wW9A==
X-Gm-Message-State: AOJu0Yz3kiW4ZaUSAncahLYKvoWKYni/00Nj3YYpndhw9YiDU2A22/fG
	8b0yeJrV98unak6iB7mx+MAakTUpFrsze3t4oxlLKIicWO1AGjrTHqz+Grv86oOD4T6a+ONDyRB
	W34Bd8nQkM0hyn727m6VVSLVCHqMXdqRca5nEpMMRjrgvrFjBtOZYChwCbmi2v8Iy2hX6
X-Gm-Gg: ATEYQzw5KRvi/5CVED1qsGcpzoAgq51ZTnJMofFoeIcdG5cMkQjOiQHaKKHxC1+/l4M
	CRATTRVii49E+5hpI7cITVrcNAqdXxUkrB08NC4o8msLy7JiLRrnxl/XYCNGzMlWoVoKZA+5HVg
	fvItbjvsh3uDGKSM0vAbbhnjPvFT6dU34xw0FBotkqWTYSo29VMHrSzrheP5Y5GWzjO750ECjJZ
	aREt1/VJ0I3IrlGkO83bHdYbqiBim5KFpmTtPrEiJnV3fEns6PQuuM1SbZHx2csUqss4hysXkba
	JE9sZNb1Dq2+9KAcFsNqXPqaFcPOStui1aXjnEr1uEkTCcCgq+rrgChPHIea/vWhAa1olMfzHPP
	qicgH0AfVbQhb9ofoCBkIFMxfhNlYxoCV5HkY00An0dqPV/5RjB+AU4vag91ZTLw4t2bNpm4+Nn
	wHwUkqKkUfKC3zwn1ikEmnQJsfUh5pkibCWsc=
X-Received: by 2002:a05:620a:4692:b0:8cd:8fb7:7aee with SMTP id af79cd13be357-8cda1935caamr806943985a.4.1773322198811;
        Thu, 12 Mar 2026 06:29:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4692:b0:8cd:8fb7:7aee with SMTP id af79cd13be357-8cda1935caamr806939185a.4.1773322198316;
        Thu, 12 Mar 2026 06:29:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:29:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:37 +0200
Subject: [PATCH v3 16/27] drm/msm/adreno: use new helper to set amsbc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-16-b7e8f800176a@oss.qualcomm.com>
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1854;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TtYxTDlV4ADdZSME8a7mAAI2svRlACyoCBLVOWAbvo8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+am/dvbtp+eW7DQsPfqI+kzNWrBh67frSmTWV4xXSxk5
 ouztfuZOxmNWRgYuRhkxRRZfApapsZsSg77sGNqPcwgViaQKQxcnAIwkbWP2P/pcF70bfol8eTf
 hcUWUw/HbL+inXi76P7c6e2neKYGeFe1HFxx/dOSKTXbpVpfbNqU8bar0vq9pNzjTwwHHiebhqT
 Z5U3g/yK/LWpndtAWxSyhFwlvV4uVN4T3rotJCGJN9gw82pT6tiTlhrQfp3Q5p9DCp1cZvKcFM5
 Vo1rj1a2lsUWgrLmthMvq37kxFVcrl8vApyawvFurb3l54PrXOc3Pvsak6y8Xq03aZFwd+lNYTv
 bMkcGlAgOSs9imrLKovKCmmRm7RvrhBWupKbNnPh+4Pl5ZKmXkGLTLKk5Rssyrl3Wusu8Rk1XrV
 xFj5H8khHc6bH7u3Lv4oGpc0SUJrH5t4xGpHXTfDPAM/AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: cm_UqUwSb88MSp-VfqFhyaQwykw-Mvr7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX7LFLoXWJpEuF
 vz78SRKWZje9SRei8rP+MTlKXq5lEOcvtbiW68qIz/JnMI3UKRl1BjxLRqxwpFS30u8a1vJeXiA
 jcApw4dSKbeeyWw0kakqHARaM5dz0pBTr1hgyE00C3Gy7+ntCY4AwlQwmp0LkpMtTgoEGwdKB9E
 MIn+e8PL+ySXg85iAkVCIofHIDT3xvhkMBm/M71RCX6KVN2yB+h+0KZT0NYWleQN7ECFqJvUQjx
 84PTYM9YaM52eeu8ryvXqviHlCNXOkaJ8PqaxHMcg+Qqq7d90LeFqTGRjxI4uMvOhrE8pW5LXx0
 z8TIFeeAEWLhHjgxXifcHIrWe+oxOgYeBbBeXLwcx1FEnuuH4JJlWSTrAr1JvQo6cKHxtqakA9X
 AflvV1YUD6Mw2A2DBOsG8UdmvQZF3ggjRKAspln0NVH2caz1o3jKfSHGjba49uCEClYMVKVYvhp
 e8WKRIYLie83+SthDvw==
X-Authority-Analysis: v=2.4 cv=DsRbOW/+ c=1 sm=1 tr=0 ts=69b2bfd7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=PQquZ71z7Ybx5dfXpIIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: cm_UqUwSb88MSp-VfqFhyaQwykw-Mvr7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97236-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 428D8272B08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use freshly defined helper instead of checking the UBWC version
directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7be31de3b525..f6bd906f2ac9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -743,7 +743,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	bool rgb565_predicator = cfg->ubwc_enc_version >= UBWC_4_0;
 	u32 level2_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL2);
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
-	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
+	bool amsbc = qcom_ubwc_enable_amsbc(cfg);
 	bool min_acc_len_64b;
 	u8 uavflagprd_inv = 0;
 	u32 hbb_hi = hbb >> 2;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 680f0b1803a1..63934d21c831 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -275,22 +275,22 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	u32 hbb, hbb_hi, hbb_lo, mode;
 	u8 uavflagprd_inv = 2;
 
+	if (ubwc_version < UBWC_6_0)
+		amsbc = qcom_ubwc_enable_amsbc(cfg);
+
 	switch (ubwc_version) {
 	case UBWC_6_0:
 		yuvnotcomptofc = true;
 		break;
 	case UBWC_5_0:
-		amsbc = true;
 		rgb565_predicator = true;
 		break;
 	case UBWC_4_0:
-		amsbc = true;
 		rgb565_predicator = true;
 		fp16compoptdis = true;
 		rgba8888_lossless = true;
 		break;
 	case UBWC_3_0:
-		amsbc = true;
 		break;
 	default:
 		dev_err(&gpu->pdev->dev, "Unknown UBWC version: 0x%x\n", ubwc_version);

-- 
2.47.3


