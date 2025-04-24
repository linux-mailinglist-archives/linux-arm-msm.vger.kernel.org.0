Return-Path: <linux-arm-msm+bounces-55302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA2EA9A7D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C24757A9CA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF6B221269;
	Thu, 24 Apr 2025 09:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GdOFmMR2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E06A221260
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487037; cv=none; b=IMQ7AxL85eTnTWJNwWOccovvSOWyYsyB4Kqc6yFeq9j82nN3TNgrxOeNrlnngwvgNLF/n5FXGpfq7LSuGju6D9etIxraJCsGBxbuGwxejpkZ1Ve3SpM2ZlqTyRSTamum6JzG0g+UutNiun5WT23N65xQMbzkQIuCcMQO0I55SWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487037; c=relaxed/simple;
	bh=4p9sBWIN8YkcJelXyV+UcMZ45sgycQrXYsSAAZuvWu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YN3H64mk/apExDZ5ExGM7yEBSCXQuQCyEa3jK2Zi5R4KKtgt3UK9/B38EPcYuV8guOYSWvulkd0NqqNx0xL6X12ag3QutCUWwD/Ku+vGi3ab4MKyZaynXoOIRJS6uMCWn//3Tc4AsG9aU9o2sIzMvOj43AGEFjewUWO2CchZdJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GdOFmMR2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F9PC010294
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3h8IwCQygULBCYKUzhqZAZ0C4RUrKlRlSMDkS+Z3mD8=; b=GdOFmMR2dRM+TZyp
	glkhuB9JnKoiX4WZbUocXi127fgxsHI9BBa5LCyygPe6fkHgmIrJGdyUTS/it/iA
	ZNw8SBjDeFpKynHrkfdO+GaGro2wPZK3PsGdgf1HnncWKb2txEc+cb5AZwqf8Ep6
	qSDbxnuJQjcdulgUb0YYtpBbmJsmx8BfZThJTNRFV3srR+4nKmNgjQjvEQBouBWY
	5ukDgk3pNeWNvwzyVK35E6eP5Zg8ARcxP9AlURCpnEcjg0cJNOwYK/km4jQjujPe
	uiadU50Ba/fDt/zWqdV5fQ2MntkI6NWvtNc3NU70BK7alx3h3t1pCExX+urdSAIM
	J4nDsA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3mymb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:30:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f2b3e4c176so17090726d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487034; x=1746091834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3h8IwCQygULBCYKUzhqZAZ0C4RUrKlRlSMDkS+Z3mD8=;
        b=nBj3gUR+Ba4RH6TiAt/wg74mUS0qCr96voGYXyRIP9zrIppUqBuhBNdgJWoujOuUVg
         vgZlturaO4Sa27+RpUafKPrpPS7R2if7qlXA++af4uUMGys6UGlG+l37qdEYW0XQT0U/
         WEUJzfpSeDI+OQXqiUzETsJlpk7HcFPaLHfLpxzEbwyRh43Bbqz3jb7OCDMQUd7to4KS
         Hz7vAF/B+cc+Kw1JRJOwod04ocPuRshKUigwnenIHFtjfq21NcJEncdYTkTom5aN05ZS
         UCHRpWt2lftq36gGNwocl6452KRckioV7XHdBk2m78kyrVkD6dWIj9s6yvn+adXpn3MG
         eYiA==
X-Gm-Message-State: AOJu0YyCOM20m92loiLd5T2FhAB3JeCas/eh3pP8pXAXW5vz95+6yuBt
	iXxGVH0BVApwi0q0DU2mIJWBcwgDEcakWovs/J4iiMlehNMoFx2+g7EGx0J9Qykr2cizduosrDE
	GexP5tuq9Wg4g0hiJ6Ua5xCOFnGcclsTE1JiVBcjhI+HtI9qcWXE38d8JZbSMOUYY
X-Gm-Gg: ASbGncuRJxjSQOHlEj5q7oHV2tj5Q4y5BCysNWfrKCQeSORYeKIwgD10pkM1agk2f03
	PlBLwYOKgGPS7uDEH8pCn5Te70h7KGSYmUbvaLY1bkBJqdUWgk+XwzO61Z7D1Dj9U3vKWyG/HMn
	b+aJjZ5ZPpBDQdBQU9ena7BoGaSW2+bdky4GMrxnSf9JS/xmFybraa6r8xdXBnMu+d2ckOp9pjv
	tl7L+lh1Ui7BXbsK1dQ+g6rZVkc0eu5JJWq+iQVpDctqbCjk3WJRwQIHEgHUv9ZJKY35Q8njWLR
	g+ZDk6Zqt/QIM4/luZJtSTX/IJgX7TAKsuD/Do2BENMSPXUp0qTI/wuUwMyKzJY5AOKk4wLZfIb
	coUsGdibgIZlIoFUapEPn1Gge
X-Received: by 2002:a05:6214:190:b0:6f4:c2e5:9dc5 with SMTP id 6a1803df08f44-6f4c2e59fc6mr12092096d6.44.1745487034056;
        Thu, 24 Apr 2025 02:30:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYiPdy8b33rsIWhjyFiQzIakpdZn+3nbe9+UAF3x7yXZ+JZYFOs7kqMnbbBxaZc8zFD/lqsw==
X-Received: by 2002:a05:6214:190:b0:6f4:c2e5:9dc5 with SMTP id 6a1803df08f44-6f4c2e59fc6mr12091676d6.44.1745487033547;
        Thu, 24 Apr 2025 02:30:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:09 +0300
Subject: [PATCH v3 05/33] drm/msm/dpu: inline _setup_dspp_ops()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-5-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TzajbLeXFeWcm21J+7IjoKJq84HYxMWKTI0BXOLnjkU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSqIqH1D8iy9QmolQ3g4lkccg43SLzxBrGRz
 ZKYMKQ4OPuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEqgAKCRCLPIo+Aiko
 1YI/B/wOv26Yb4VFOEtRUKCRC69FKjk/WGSbZOZIhHasZ47DuPlZbmNbEoWj3roPkKbSqrb3uPH
 NOpCq5/ldcFkEgylrt5/V0ZjR6bLB5HuzX4wXuxWTnURrHP19zd/ELzooZaInwfVPG+Hc1/idn6
 ol84xTej46Af/zW3INNdYLJ0JIEA21ZN29TOb4JxBvFdTzKRT+kv4c25lx7IH+1jDHtKQWVBygH
 bWDJyKfZi+ZEEuwdwcOc1lDE8NVWmm+krlQISZ/DhLGX1zlkx3QqzIDxdLkYkyjT8XwibwAM2u8
 mYX4gdn+arbBz8u+PniC13dEB1hynNsB04Yzth2WfFOPhsIA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: XUT8twv29m0pDeMUl4oWpscp5hqdeL92
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MiBTYWx0ZWRfXyy6PORx1zdek ibSWD8JcRODJ9ocldw7kEsPUZo9oapqj0/lldNV4HsY92t5G3lyvoYg+OXTq3/xODRo1i3ICNpd FXQU3PbCii0kNCjcavpzArplrojJVop2jNUZ+VJF8/ydct9KhPeoFOHnIUmEvKyxRF4eQK5zmAR
 QsohxCPpfajhIXf8m3MsreAajcVO4me2JXzaShp+lj/jrSE2ivx0TC7k1XGaPkB8rbvJngCaJ92 mTsD91lvdooZo32eowVMCW4IMmE+6TjtdJZSPFmuAoSifu6SFlh3KC7LWAclIbtWrDq9SBCAI0k 8i0O+qffqoT62vwkVzT8rKvMK3lQUWhuWgzNLDBXvfYo4Yon5gfnBFxGHvJO9EEdKz4IbP9dk6b
 yXUxHYFFO24K0Jond4E1bAiKaXV7YtVPMM4/VjilT/UuqgRE5BTkc3Rre25r1DMP45XEs0D+
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680a04ba cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=ezFYmCdhRMHQQexkQpIA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: XUT8twv29m0pDeMUl4oWpscp5hqdeL92
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240062

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Inline the _setup_dspp_ops() function, it makes it easier to handle
different conditions involving DSPP configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 829ca272873e45b122c04bea7da22dc569732e10..0f5a74398e66642fba48c112db41ffc75ae2a79f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -63,13 +63,6 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 	DPU_REG_WRITE(&ctx->hw, base, PCC_EN);
 }
 
-static void _setup_dspp_ops(struct dpu_hw_dspp *c,
-		unsigned long features)
-{
-	if (test_bit(DPU_DSPP_PCC, &features))
-		c->ops.setup_pcc = dpu_setup_dspp_pcc;
-}
-
 /**
  * dpu_hw_dspp_init() - Initializes the DSPP hw driver object.
  * should be called once before accessing every DSPP.
@@ -97,7 +90,8 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_dspp_ops(c, c->cap->features);
+	if (test_bit(DPU_DSPP_PCC, &c->cap->features))
+		c->ops.setup_pcc = dpu_setup_dspp_pcc;
 
 	return c;
 }

-- 
2.39.5


