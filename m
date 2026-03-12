Return-Path: <linux-arm-msm+bounces-97228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LSFGWTAsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:32:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D449D272A6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:32:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D0BF3093271
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4F63C9ECD;
	Thu, 12 Mar 2026 13:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IlvWnZY+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTCNo93z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C713C944A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322189; cv=none; b=TQrKJBgvrtUIWAKphktkyC+zV+sggCvjzLCktLnOG3EBrYygfw98+jn92qzj3gEKhkD/pWN44/XL8B9C/cYqIkZDKzQsBq4VGl8P4hxYOfAkIb/1AFBPmDd/wFjT79EPC94k6OCBKkTmgW4ZVitj6c8tTZtLVX6tEoDRNA2dx74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322189; c=relaxed/simple;
	bh=vcRHbEAGLYLgXe4iaZftIzhetGkuS44tvnfyt/ZXY1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TtMUe4dA36I8SW/WQrp1yEFcLzDwZP8Ed91/vUOp84bVJLkATRvenFpF7PiPOFl69htv8oegpSAid4eVa5Ty/28yFfpsai+Li7sA6dM7MqEw2DeE5+ftg9iqIMUsUqc5QMcgv6LWiKwIrBR+mnAxjqNHJkK+6FS3FXEKuilHsR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IlvWnZY+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTCNo93z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CA6GDE263415
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tABjXUq/OjxQFlltJI7qwEI7Ulj0yf3Q34M6i0RzZsQ=; b=IlvWnZY+mW3yuJLB
	60borKwhsVIPGWbcwdqQipWGHZ8lFPiDl+WjkyfhrKIOn/prUIQw1O2SeLgrBGaj
	bidNLEEZ08qfNh9CqbrCRUmV6Il8LthjjOh+LxgFi+hlWEQ6vcXb4alwlA/5UB/3
	niBja0IKTPWjICEiUuEvwLMVz7m0dEMpGqb4nq+hd0tU1O8gfcgWeoZtQ0eHg2OW
	q1TV/Nbf3IYQZ8JVkpMpvm6pzQ8WSFqBYKsDhqBmyM5e+C9ze60rb5XJN+Osz17f
	YBDbEFe99xQvAm4YRvOWbdlnMfX2+jkt+z0AVqhBuK6KQK4JWLhrAfxKUpf1PIvG
	TKWRUA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4yj64c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd81ce6fdcso978554985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322186; x=1773926986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tABjXUq/OjxQFlltJI7qwEI7Ulj0yf3Q34M6i0RzZsQ=;
        b=KTCNo93ztSoGp1XmLiIn+aPuitl6NLKkd8rXDS2/A3L1zuYbCc0XLxaeFG7/VmxEO2
         ScF3Pvo7H8PN/Cs4hKtcFRYR1NwYyXCRnLJGWKf9EHLClYFKyvhsw3fgBR/2ASDaPKXD
         uEQc2Br/iJJDRD1BB1OALCIt6CuSHORdVMImKna4+P4wh/EANUNah4XJBRT0JMUpkRiP
         3CIeKrR56t9U5KVkzByh0RtZe7ZC7F7xiVUj4QtOGWf4vzb3b3002RNUN+1KxTCt2uMa
         yHw+jkQYehqOtnj8ufSDQDXvdGOa4qSdj42R9oCCdmxcPsfxxPpg8QtU9IdrQSGKOTwg
         cUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322186; x=1773926986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tABjXUq/OjxQFlltJI7qwEI7Ulj0yf3Q34M6i0RzZsQ=;
        b=Vdt6T8YoTwkjfu5tMzDvqoNK7qX2z6iOF934A+J6cyE4hVh8JaPcuypBvAZujKLPbf
         MIYIQhLaJ1AO7A4vZr/dQDqNhVVpqrijofZpiMI1PTgph/I5Q0iI6IQqVOONSN2OsSQU
         NzTbHJOQGwftTkoUoDDvKb2XgociSBAIWKiaab2Jr7QnmGg2Aends+GtWVzgNLQIyBWS
         MFpGbN+mUV7X0kE9MX3Fq2CW6vECLRKvgIx7++IKZpmmt5pn8catc8mKUU/1+Wdycr5S
         IB6XYr2vHLN/Jsb8/hgCwCavXSotfh2WyfBiCoXiWHGmUZ5SVxOkTomUJyCdEh4i9FPS
         DP/Q==
X-Gm-Message-State: AOJu0Yw3ImxFL5z9aP6IVtpsM0V3MJ5MlciHW/+SwrOu9IU3hIQtm/xB
	Iq89wVC71pBZ46NntRdZH/bapf2Ouca9AUghOY2GPiHdFTTPmqMjH0k0ieFB/Iw2RKNDadsPkno
	3SlJFmtVYzHkQLz9Y4TKZbrvm0KecZRqRo13ckQapBGEjTgcUjy6JvZpXwkR4+UbwQRkC
X-Gm-Gg: ATEYQzye3aabWr45iSVG/Q3Wxmi4az4R1D+Wm/4TZ+EGL1y9z1BKgFETBf1SBB6hLKi
	8qZrkFXPYx7h+/m+DoZpkPXrvhnB3jynm6tpAJJgo+9NwlYAsUE1/8NpvUsLqGK/XaWgztEd9Sm
	HfPFIe4sr6Oid8qTys/bVGnn8HEtUX6W3UMdPrvEZef/zm9Dy8kIeFD53U0Z/7fBM8m/nzquCdX
	cfMP5aLpmAZetUVE31gBJyzrg9MBW+x0FtxJ/LQwDS0AvJDF3X8TRdmKXntzPkWVwNiD9LNs66F
	u/eM+1HdKYAIAb3WR5l1yi3gutWMaGBqkN9GKUuYDaIcVbnkJ3q2EYX4RhMFA7D2TX25egvhrkF
	StHCQhCsAqwy4z6s2kDD8O5UFtSFBKqBhhT/BnKPlGc33S12TFjzADilea5Q3jWCNGpQq+uyL0p
	A/5JXonz16NlvkJvdt+iCuSK7rQspxf5TYCV4=
X-Received: by 2002:a05:620a:2916:b0:8cd:8ddd:2699 with SMTP id af79cd13be357-8cda1956f9fmr801124685a.24.1773322186391;
        Thu, 12 Mar 2026 06:29:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2916:b0:8cd:8ddd:2699 with SMTP id af79cd13be357-8cda1956f9fmr801120885a.24.1773322185943;
        Thu, 12 Mar 2026 06:29:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:29:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:29 +0200
Subject: [PATCH v3 08/27] drm/msm/adreno: use new helper to set min_acc
 length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-8-b7e8f800176a@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vcRHbEAGLYLgXe4iaZftIzhetGkuS44tvnfyt/ZXY1c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+1rj+PHUNlD0J8j3P+ZVuif5d8CEw9DAHQ5
 ab5tj69UE2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/tQAKCRCLPIo+Aiko
 1XSjB/43r7ue2sSmqHbXg7+6qoUEbRedeQX3JwYda/B/TL6hkDaz92L4KI85wgZFVOJ46+V6C1Y
 LqWePdp5OnhNo4QXCFSFY8XdflEfMhWA6mCqo6ifFJ9qF9x0H/z+4jsTMqZ4sxPcylTcaLg2Eo9
 eYR29itoR1+Tk6aQcQ88K88I8g/SQoH+24vB2qudT5X6mvmnbJBqp0kbbqMKilWPgXPsJwGHpmr
 G70fHNeUKKjR3PRpwcDmLkRubSg/7Nh/9h0LwaWee9DNoecIAWVBvvjBdT5ujNbDr152Gb3wKQu
 /fVGIPQtzaiQX6AiuwtDtQTAcqxCO0SkU7NI1J8dU8xeS1vS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX6Q214Tw1nMQM
 L6MoKIbcKujzyYn7QIKZoSL/UtiCyCKKfcKMydcdnBl8h/o1+bn6zl7cJS8hS9W3eFAg5ThCd9k
 qa0x8NoJsTwsuT12lgaVygt7qlMCqYXykZLXDX6+lvg+urrPa5h4H15Z8U3E7FEhFrHejK0vo7q
 +LK7gnYsgOjEbAn2Dx/Z5mqTFxj3t0x688Co4aEdkkjZ2IpgdM3AJ61wT4ga1l5HzZyt++43wW6
 YTDh+Hn8TbUrvRGEimBRxHpueoJNRhBsuh1agfORWrIXUGX2/9JXqnnDrI8zxLW6dB6oReKrXYf
 NnF1z5b3MCgYuHKiGzhoK1xFGr6hhuSF3/+0bMqysBlR0xOlU4sD3I4fJR+v091SuX1tJd8SNAM
 rF9THWCaDLlt0IfOZrsALuHq7mt/Mu+YS1H5pLRVn+Ga0mBXL4drYW3zBKsA47qVyiIg2DXmzLd
 T9hf4ZTuI0y4O6RE6gg==
X-Proofpoint-ORIG-GUID: JTbx-MszQ1KVlCcA3OxbZY0wscMUshbZ
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b2bfca cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=X-e67srwgh_QgMMAbO4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: JTbx-MszQ1KVlCcA3OxbZY0wscMUshbZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97228-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D449D272A6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


