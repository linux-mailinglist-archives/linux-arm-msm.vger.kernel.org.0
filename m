Return-Path: <linux-arm-msm+bounces-55304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26108A9A7E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2E0B1B82AA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BFD8221290;
	Thu, 24 Apr 2025 09:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GeAz1bXC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C522207A2B
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487040; cv=none; b=Xp64+69yUdi5kvzCKpOOEtFzajDMrw3WBxJCH+RdM3p+b1Vfkr5U7IFT3drLll3uQnBzagfz38KIC44cVh5qy8thzpokCCxmiVfNL3n5lTo3wVgl+hKbdIZU6NxMg6Rb+i1fAHE5qc0Lb8u6mwlyYPMnQbmpgXkPqRycQryChU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487040; c=relaxed/simple;
	bh=2IiFHS57P0Bigwh2VE2RlX6r/1GVPFLOqjH2EKejpCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jEHlvng66P9vovtliyxNI91qM0Dpb5e+Xit2NGz7mzzg6Gk5I5uWyp6yQvUVRpeCDTVzyfGsgQCwBGMu7i4KkBJauyaIdmMK+VtBikgLBrGdAs0dyRDdqm3vEL6Qmcp/JwggA4BaoZ7qjW6KkPuHd0Fv8NBKlcBHqqhRz15LwKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GeAz1bXC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FFNc011481
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZ+vVgitO0Ee1t7phggoG27ofzaDJceAaCxWE+985z4=; b=GeAz1bXCbdwy0tf9
	c9Ii80LxEJDaDB/AQ0b1vGzUy8runmhLtDvNXcihUdAJe8LfwEqH/z5cpdr2m0PV
	hQBf3ciHAJ28B1TxoU2A2D9SaaMggw2DJGKYCYxTIzIIrNdh9Sm6jXqSkT3LLugB
	ZyTVd4ksFdJOylM7lLbHoDjA763KuX6TCll8Na95dVDdX0iXsyteIlr2lL0tPGD+
	EufdSYI4jJgekOtTm5htNa8AYd0JJyuTYG14GKUX+Gqjr6YfAaG499SKNXqilgIc
	4BOGPCU7uQF2qHFI4Q6JlWHc8DoRvNxoQyEk6VPhzuopIBrKzhtFRwVbWDDrO2RJ
	Z2OhmA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh250e6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-47699e92ab0so15823431cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487028; x=1746091828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZ+vVgitO0Ee1t7phggoG27ofzaDJceAaCxWE+985z4=;
        b=Vr7DlDao0CPzjZ/bNM+XLei0GICts3KOY9PEPVjXMPbg0aTxYOtJqqYX69EnXF5AnA
         zBsYgkwRHw+KYce5QRmtApfpxSWCnvoKfbyc7O69PwwFHecJ9pa4zFdwNaruf793j4IR
         2eOIWBFMDHmBVhzvSL/sKkqzS1RgVqRK1Rc1kbvMzqoicGCunzL7uSB7SGKw75WQI8d0
         93zeNm3NCMeJjGPCIzdc3nraeEd03GoYOLyR13hhZTnKhv5U4iiyRPNl/pQo9LtIx2QX
         9YFnXo6LpmciAhW2JRmfFlszPEBiQCqwxvMtJ5cDBAnuJ+RsCNrj/k/ri8LIs8pXC72w
         huCA==
X-Gm-Message-State: AOJu0Ywon79t2H2ce1fhZ+JRCgA+gVcFeUz3c92VQ6DhRGFZl+ls21xy
	MO2RzbYj00LdihVz62KQktUBUZjPUDphEkf4Hlkd9NkWCMHIyq1RL871xDRRRk8uDqmGwYC8MAX
	e+3//Lpe0X9D0aheT1HgU5bU71gRHtLbJPSbJlj6W+NNMcTfgi1sct151ECZPLwYx
X-Gm-Gg: ASbGnctig4HC4JUPOM1WNnkjRnbo0XDUZbq9VvIwQeNtpmqJeas0Kd9mN5GGYFxNTEh
	gFGxzmhha6nudRYtybxLWVNLBFWV8S9BFw0WJ9sbz0by8mlFgnED7nEnOeT4NgkgKAXEbe3n2dz
	l1MawObiVneajOpJixjgSKj02p26M44VRvzv+keemtqsoAaQ7wxq5AnEF8vK3VpDGtN6UL6+tWX
	A1g6Oda4wRY9seYGZjqXKs92/lJbVpoMAMKmVcRS+ocVzrxDfIxCQAfJNoq55BC003LYYL0g9sw
	aRc2Tdx3HgVX8KzE8fAL95kHiiUYlVLJUl5p7R9vvjrdTpbawzK0vnB1AaXyfZAkRRJf5TRnclN
	ru1g0bbdrHyclMuyj/Pm/IAqT
X-Received: by 2002:ad4:5bcf:0:b0:6e6:6b99:cd1e with SMTP id 6a1803df08f44-6f4bfc1da40mr29821056d6.26.1745487027904;
        Thu, 24 Apr 2025 02:30:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnpSqDj4Yj7waYtWavXO85eCg4746V1n57mMjk0jgaE+hvzrSPBmolL9okputlPpS09V2cHA==
X-Received: by 2002:ad4:5bcf:0:b0:6e6:6b99:cd1e with SMTP id 6a1803df08f44-6f4bfc1da40mr29820646d6.26.1745487027524;
        Thu, 24 Apr 2025 02:30:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:05 +0300
Subject: [PATCH v3 01/33] drm/msm/dpu: stop passing mdss_ver to
 setup_timing_gen()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-1-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3649;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sURLU3QRO4lBSIODQBucrC/9R5zvezCH7Xkam1qgsTU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSpsfUttjT/E6RZYKlS5nYVZCE+2yoZls12h
 D4PfcXaHZqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEqQAKCRCLPIo+Aiko
 1bTFB/92pxDvmbvS+yabonuD1bCGKJY1BKkJm6f8na4d/gMftQ1VQUbSnqYCO9cU6vZhMrL+dLZ
 0fC1YClRxEtSzSqhFHU2kR6/0CRnRGt9AK40wFlV42PLNkotShDhBLDNMy+j2fmve2qdCeGH4vs
 nUkgTSxi9weAx9T3ow57fjVNPSx+u2D4sxBZBobPaFPr6Q9d1tLoNx8HFAMihc8GDzNrC6DU8A+
 7z5NF9vPqLCmJo00slWXzHl6cxMfs/qDmHxT9wHNFXVS07DLAK2OgqpglhhmGTtVQg7atcqdeDq
 oyChjjymCjHzxjJImyQLDrYx46Ny2vdpwjPUUBkXEVZa7yua
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680a04be cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=Fc1Z5Xec4v_XsjI5eh8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FdsMDjB1iwsf52lVpR2bFZ3XtIC5Ro_q
X-Proofpoint-ORIG-GUID: FdsMDjB1iwsf52lVpR2bFZ3XtIC5Ro_q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX+gZfBSXajB/L CkCeRVS8g446cEFFbdPK3UoAhH0WteaCBC7yaG3DAB9LC/EdtUHN+eNrivuQ9svSaZXt6P3r/AX ABHvXXXE3JVzrYfRaMbxr9t9TrjlU8Re8QKKdDfToJJ/hUUqpthAt5qB0QRf1dxK88igtwTcdY0
 Z0f4sElKEGkgje+kBPZ+zPSTAzAN2ljREK3N77HJx0rMeNeCYDZB8DOJRh+IXXxMUzoq5P1olkh QtPNYIwbn6LwWrn/7PXnp/bKsHWXW0oibXhi3HPu68EdWI+ApXzomFhz5+VEGRjzTnunyY5Z1Hl PcAo6e2YKLUT+IWwc3uVq0gbMY4QFmBpPoJHvERaY5jSR4Twp+BOCNGUcVnJCY2qUkBlAMeEoU9
 D3jjeCUb86jihNKf7BHUerM8V76CextZ5jpIkH6nnYcTsc9ePr+FII++IWk6GCUsmhKq1alN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

As a preparation to further MDSS-revision cleanups stop passing MDSS
revision to the setup_timing_gen() callback. Instead store a pointer to
it inside struct dpu_hw_intf and use it diretly. It's not that the MDSS
revision can chance between dpu_hw_intf_init() and
dpu_encoder_phys_vid_setup_timing_engine().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 7 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 5 +++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index abd6600046cb3a91bf88ca240fd9b9c306b0ea2e..3e0f1288ad17e19f6d0b7c5dcba19d3e5977a461 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -307,8 +307,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
 	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
-			&timing_params, fmt,
-			phys_enc->dpu_kms->catalog->mdss_ver);
+			&timing_params, fmt);
 	phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
 
 	/* setup which pp blk will connect to this intf */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index fb1d25baa518057e74fec3406faffd48969d492b..1d56c21ac79095ab515aeb485346e1eb5793c260 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -98,8 +98,7 @@
 
 static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 		const struct dpu_hw_intf_timing_params *p,
-		const struct msm_format *fmt,
-		const struct dpu_mdss_version *mdss_ver)
+		const struct msm_format *fmt)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
 	u32 hsync_period, vsync_period;
@@ -180,7 +179,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 
 	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
 	if (p->compression_en && !dp_intf &&
-	    mdss_ver->core_major_ver >= 7)
+	    intf->mdss_ver->core_major_ver >= 7)
 		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
 
 	hsync_data_start_x = hsync_start_x;
@@ -580,6 +579,8 @@ struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
 	c->idx = cfg->id;
 	c->cap = cfg;
 
+	c->mdss_ver = mdss_rev;
+
 	c->ops.setup_timing_gen = dpu_hw_intf_setup_timing_engine;
 	c->ops.setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
 	c->ops.get_status = dpu_hw_intf_get_status;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 114be272ac0ae67fe0d4dfc0c117baa4106f77c9..f31067a9aaf1d6b96c77157135122e5e8bccb7c4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -81,8 +81,7 @@ struct dpu_hw_intf_cmd_mode_cfg {
 struct dpu_hw_intf_ops {
 	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
 			const struct dpu_hw_intf_timing_params *p,
-			const struct msm_format *fmt,
-			const struct dpu_mdss_version *mdss_ver);
+			const struct msm_format *fmt);
 
 	void (*setup_prg_fetch)(struct dpu_hw_intf *intf,
 			const struct dpu_hw_intf_prog_fetch *fetch);
@@ -126,6 +125,8 @@ struct dpu_hw_intf {
 	enum dpu_intf idx;
 	const struct dpu_intf_cfg *cap;
 
+	const struct dpu_mdss_version *mdss_ver;
+
 	/* ops */
 	struct dpu_hw_intf_ops ops;
 };

-- 
2.39.5


