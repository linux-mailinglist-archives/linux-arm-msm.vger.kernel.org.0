Return-Path: <linux-arm-msm+bounces-97239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFFHIVvBsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:36:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 464B8272B3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A134430E32DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A60C3CCFA0;
	Thu, 12 Mar 2026 13:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U48nWBVH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RFIM9NQ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC013C8725
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322207; cv=none; b=EEQhZ6/sHFJ6y4mDUB6zgmVcsb52WAM3rQNJ4NozFFKxjcp4bDl3MgGyVH1LYfKXFmGakaW+sHfcX0TxNSgDo6+sknvjDbI5HPqts9yA6NOydQH0YKnJAGsNUfDfLV0s/sx2SaLO0MtJoUw8wg6phTd8WTDW5sF9SaFS0rjksJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322207; c=relaxed/simple;
	bh=OzjscEd17vm0sEmzoIKCQmPPncmXbh08UBSisc3cBL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jbXHBA+1sFcLrn/m3X62rIl7t1T36rLWrmCtNk6XzNxd77W7moFZ62HTv6MVMCfD12FjZM4N3w8FmXAcAlUSHea7XqqVuEt6qjvWKXE7KgczRN884jCCg8faXPoYh9clW0DjtL/yZFOGfSezVI0TH9gzLHBVd7bzQDe/WY2Tlvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U48nWBVH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RFIM9NQ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C2boNk1740509
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ibXJK/eidhWImTas3nSeFi3FQ09IZIZ6J+RmgmMVE8E=; b=U48nWBVH4h9ccIGx
	G5G9l+/VMgyjuh5ma+kKIydrM2tmHFnmH11tmPWqFdTqAainp5KKANP0w3kEoJyo
	51xLDDT5z7xL0441yX4uOQLBGTCovR3vH02ZmcGY7Uj+heD/jeLu92Nff4x4MVVm
	da9xGv0HRCuIJ6hu/+QC18YJazkJqOaX8pqj6cvZpsWI7bFqU3HA9gJ31Hav2Ydb
	/DqdeIIBIMgci6piqU0Q75uuo4h55o9UcjQyeEHNqOyp0Q0Ra3n9Mp1dTm25HsBz
	AZZ9oQs+IM0NPeTIOVi6u5rT5ELcAhNw3OkCzN8hR05xWdTeDTFFzVBAxz9k4sQn
	P28mwA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvdhjup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7de0e161so653563985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322205; x=1773927005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibXJK/eidhWImTas3nSeFi3FQ09IZIZ6J+RmgmMVE8E=;
        b=RFIM9NQ9WTf6o0YsMBJECXOndl8mWXv7WQ3eCi9pnuVuwnHe2tyfwXN44QwneKQ7IX
         nWSje4mi0cfcpw8sDT+H8rcZax+T5wuG9qrSzn1jnJvSMTO05dqGsZGdvUFq3b/UOA9u
         h3kyfgq/Vs3+f84kb6FagG/Xb14OBNSSbW90P1qmUSy4JgLGbTDEZ4Fn/XCMhBs96r7i
         Dxil+Saftj0krBbsv7njfT5HnnU1CkMV8GwQUI4qsgbu3p12lqTd1rrq2FippsSPP0vZ
         duwKPkxN1AfbAJ6x3IVLF+9bfDSAaKXekCzhaVVviYr6s9QKJSol2W/EW920SwiqqK6O
         uHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322205; x=1773927005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ibXJK/eidhWImTas3nSeFi3FQ09IZIZ6J+RmgmMVE8E=;
        b=dKam8nbN2sE7WbE/IvEfKx1IwBAR1QkravLip4/tAvVDgH1G9DvcrYuGLkYv7WobjD
         mWRYnYlONI1/ZtU6I9SJPaAfYEafHaRNntnf8N7v9dzcrFZOzKcAcWZJyVVcEcXydBB1
         rkeXzDvs/mP3HtBotCOZfFCkxoS51ty7eh9uhk8ydmtPh4/fMdWZYngYGya79FrfupKR
         koq7SWa0vChzbR2XRFqZgCeZB7cmmSM5Bew4xYve6gJWyoFosPDpS3h5N9+SzNoMyeMU
         Pds0bIh6wkbrd3oE4TMGUwBlU/wptmm2lm/uQro2g0fvaJEZeyEDJb3X+RaYh3K5s/Lb
         dogw==
X-Gm-Message-State: AOJu0YzLgIgVHPpu/ih2KlyF3dUU6cDQ9M60PukBcOHYO62O5DtT1Fat
	iu23h1W0m9NkFKEsR7C6A+e1y1tMD2vYssptBQUWP0iBByB1Fp1UVYqmdFhdfK4FhK1Admx9js5
	TDNnOoOu4LRw39bqdkv1Y44fTD5qgWH3LjrXQi9aJtGP8STqiIBBNevYjHFv6sQDKYaHe
X-Gm-Gg: ATEYQzy74jU+phL7XnZKu7qkI4LW16RVuGBej9Aojt+TUqJDu/hT+h5zVA45McaF4XX
	1zA17NEvKZB7BY6PMOv8400yeopkzeheHo/5um/uytHRbYpJF5TdsoPQUfZ1bYKkjLun+mpYXLX
	lPQCu4cKtS2UyUNEHXkrS7yzD0U5uHSBnOu36rxTsDEFihWwQxhn1R8RdLFbiQ0j2eIjTuPdXy6
	v1g/WAf/Ihhr1JWR+c8QhkiNVInOSqXQAQEyeWfrlnRLRfiLYQ4YiILk4ShhXzTBwnPKSal/ovK
	n8dOZ+wRoHPmGSQ/tmYaxjAvTjQ/KwFD+lftjHhO23r7v1/ZXysmk9w83WffI1iYeP7ssW23wUv
	IvLvTK2I8u6QTAIxWMtAPZPvaAzHHDdtr6rUS4+lnwM8ZKfgs73PsCVKY+SezLyJOLb5n0H4uH2
	U2uJPZtzlJtMwyZBF5rqcaP9orU+O+iO2zi0c=
X-Received: by 2002:a05:620a:4413:b0:8cd:917a:2026 with SMTP id af79cd13be357-8cda1a8a5ddmr897757285a.79.1773322204424;
        Thu, 12 Mar 2026 06:30:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4413:b0:8cd:917a:2026 with SMTP id af79cd13be357-8cda1a8a5ddmr897751985a.79.1773322203931;
        Thu, 12 Mar 2026 06:30:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:30:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:40 +0200
Subject: [PATCH v3 19/27] drm/msm/dpu: invert the order of UBWC checks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-19-b7e8f800176a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3131;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OzjscEd17vm0sEmzoIKCQmPPncmXbh08UBSisc3cBL4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+31jp24c7kNb3Kn/dSjdS4l+mxF8W1rI8aW
 F/HpdgD36qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/twAKCRCLPIo+Aiko
 1YtBB/0drMmDeVpRsOqPVuUA9kPWhmGIlenEluBir77EGPRRGSpKMOnfXzFsdoDCU6u7C+1NXdV
 e9FMebCHKxWML6QKtiBZNGLOCuRzB/h4Q+ZlOKLSyazTVaTkv2eKpy3bR4tWABzAyeDVkitQLBX
 41+S0155PayZa5CCA//b5wFm6s/MRpPcUVWFJbFjBEqz6AJNVvBDJ6xAj1q5secQEGB4WTtLiIO
 u3GfRz97H3+/jJ7JWGXGQh1XNu4nwMIfrT6iBMY8MS/n81lZen2anVo/Q86THWuhM14Vm044UtN
 GQSEMwM8Y7QZGL/UwTiIACMoGDJwQ4C2SKW+OEeG2m+mPjdr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX4qcmB+YWlCuc
 oxa15ye6/JobeuhTUld2GWeF2hI7otLkFZcbYCpOZGQznAfRUhHPqyN6fzX6duOFGTvgyo8RdvO
 whZLuVU3avK9+isxrsv4LlMQFVRtFRA+/JycOApLScpdvDcMDVeEIMArcsNaTX7gP3iuTzhMnop
 TaklkRB/oAMTiOyXT8n3wrEAdEpDH9SejhQLeP5NmMc6WU8FqtDU++gWqfd7xOWD55prJ12iJor
 mwPF9cJsH4CYpW3bDe+/yCu9C4UPounyGaVPyFlr0DltuXzN+mHGQjiUu0BZtKYq7pJhg3oB2Di
 Z7UAIkAhW2NUCAe1/baNrwZcFUnCMMo6MVxZuOPK4r8EXWtaawFVYtom6WbLvpd1rFdQ7gbQnBR
 ta7VRRdl7isMZtQZ3z6etEmUKc1pUPEmtIuuovCuuZybGChpCtWXEO8joF8ggNvlND4GWgQDgoX
 qjtbl89BZvJGP8aik3Q==
X-Proofpoint-GUID: 3Pt0Dbe4Nvp9xODVddU6vAckTtsba2W1
X-Proofpoint-ORIG-GUID: 3Pt0Dbe4Nvp9xODVddU6vAckTtsba2W1
X-Authority-Analysis: v=2.4 cv=XsT3+FF9 c=1 sm=1 tr=0 ts=69b2bfdd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=l4KHnsLLE-ungWRp-RkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97239-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 464B8272B3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Unlike other drivers, the DPU driver checks for exact UBWC version,
making it hard to add minor versions if necessary. Invert the order of
UBWC checks, letting the DPU driver handle new minors transparently.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 36 ++++++++++++++---------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6089a58074ac..b5e50fc1916f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -310,35 +310,35 @@ void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format
 
 	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
 		u32 hbb = ctx->ubwc->highest_bank_bit - 13;
-		u32 ctrl_val;
+		u32 ctrl_val = 0;
 
 		if (MSM_FORMAT_IS_UBWC(fmt))
 			opmode |= MDSS_MDP_OP_BWC_EN;
 		src_format |= (fmt->fetch_mode & 3) << 30; /*FRAME_FORMAT */
 
-		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
+		if (ctx->ubwc->ubwc_enc_version > UBWC_6_0) {
+			DRM_WARN_ONCE("Unsupported UBWC version %x\n", ctx->ubwc->ubwc_enc_version);
+		} else if (ctx->ubwc->ubwc_enc_version >= UBWC_5_0) {
+			if (!MSM_FORMAT_IS_YUV(fmt)) {
+				ctrl_val = BIT(30);
+				if (!MSM_FORMAT_IS_DX(fmt)) /* and not FP16, but it's unsupported */
+					ctrl_val |= BIT(31);
+			}
+			/* SDE also sets bits for lossy formats, but we don't support them yet */
+		} else if (ctx->ubwc->ubwc_enc_version >= UBWC_4_0) {
+			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);
+		} else if (ctx->ubwc->ubwc_enc_version >= UBWC_3_0) {
+			ctrl_val = BIT(30) | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version >= UBWC_2_0) {
+			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
+			ctrl_val = fast_clear | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
+		} else if (ctx->ubwc->ubwc_enc_version >= UBWC_1_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			ctrl_val = fast_clear |
 				(qcom_ubwc_swizzle(ctx->ubwc) & UBWC_SWIZZLE_ENABLE_LVL1) |
 				BIT(8) | (hbb << 4);
-		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
-			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			ctrl_val = fast_clear | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
-		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
-			ctrl_val = BIT(30) | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
-		} else if (ctx->ubwc->ubwc_enc_version == UBWC_4_0) {
-			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);
-		} else if (ctx->ubwc->ubwc_enc_version <= UBWC_6_0) {
-			if (MSM_FORMAT_IS_YUV(fmt))
-				ctrl_val = 0;
-			else if (MSM_FORMAT_IS_DX(fmt)) /* or FP16, but it's unsupported */
-				ctrl_val = BIT(30);
-			else
-				ctrl_val = BIT(30) | BIT(31);
-			/* SDE also sets bits for lossy formats, but we don't support them yet */
 		} else {
 			DRM_WARN_ONCE("Unsupported UBWC version %x\n", ctx->ubwc->ubwc_enc_version);
-			ctrl_val = 0;
 		}
 
 		DPU_REG_WRITE(c, ubwc_ctrl_off, ctrl_val);

-- 
2.47.3


