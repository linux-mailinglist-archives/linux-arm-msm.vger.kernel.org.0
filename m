Return-Path: <linux-arm-msm+bounces-86591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BD12ACDCBF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 16:42:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62D993004406
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 15:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E50830C61A;
	Wed, 24 Dec 2025 15:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C1vPqkrm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K48uiPUK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8D730B532
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766590965; cv=none; b=jx49EdgNqb5i3lchC/yhvOGAuFlZN2mRXjgZL824BuDWm4NTjVuAwlngFCSr/WzBvBK/vhUHKvdiDM/u6KRS+rMtiLaY5bOR/pRhai6Wo3Cy95a1WWmWfQdBBq9QS/S3IHUat8P1m7rVdBftbqwRRQh1NduxDloSKK5kY+dowNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766590965; c=relaxed/simple;
	bh=KGT0ib6f0S9x+W7J89kuc0HaNX2OlP5UrNenSreVEj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eKO2gzTrHhetjkVmlCcREui1dY+HR8A4naE6JzJW70u8YLWEekwdCJ/PKlqKQ6ef0jAgABg0J6ahIBSxxrlWoTZXp6Syz7g/NF2Oo2SGfVnzNIk9OLI5R8q5N73x10dWXu6UWJNey/d4ZCC5cg5BFQmIQSPH1sjswxwBhAo2qls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C1vPqkrm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K48uiPUK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOEOF6l901837
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=; b=C1vPqkrmPQ8EOKdV
	9t8CJTtwYStkgR5EM547ilIAjZu8XQgTv0aKTYkDxAKDzYVaGGDBWPM7joNzhvMi
	w+HPpGXf5pfAIUdBQEld9btArFjUMFixaLUDURJTW7Yb9q800V/0qsVExSvTjPyP
	6kW/IunB93/DrwQALwW+hyRSRCz4by40MKoGndCS6anWcJkDafsMjnfyGL9gNgsv
	oPs6Cko1EK4Nz6d6kIAdWKiVbY4CtWQnbbwdBbSeUFRzch2LF7JGTFIzHDhYb/O6
	xcgDmtQDL+jTmcWIHk8ahF33SULriSUpWzRoqxIFbQHw27IukSjWnLghsleYRhdf
	kNAYMw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8hwe0687-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:42:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed82af96faso119135091cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 07:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766590954; x=1767195754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=;
        b=K48uiPUK2BEEMgK2hPWjOuB5b58bQO3zaWF/oVKFd1E1ayeO1Nz248qR5oeliobl8K
         /bIND0rnGyEVVUL4TERa4h2m6vwApXaXhofBh3IM64PKULiWyrwQj2CZvxO5qordFfiI
         JcAHfTjcF1xMf4BE/0T7ki1U6jDuYe9szeI+H2ORB+Hv4Of75m4JM344aBENAIxpDn12
         FmuKCAbUqH/UAfjh+HJqqbta4vEjExnSTizlEQVFAvLKDsCdLozCTFFmrIpK9+KqM76G
         oapcjHk7l7A0a7wg+DENGhoaStTU8X24Tf/PGqe11onwNBOuaFXHbygqZSbWooOFknvN
         ZVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766590954; x=1767195754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=arjhpi8+qGbxWhcL6W8JUcOjwqn6XDw6bd+kn0lzFcM=;
        b=DbzH51Dhgr4UbRZg5Ir4PL2NK1Pf5/P5+1csRdyUrP+4eKKT8/k2WDtgSBhv/VABP0
         Y7JT98Ppa8lmI/tKuBujBZSOm9U4Dha5F2PEKrTJTdhmWUmkOWDT8A4u5D5KALhZPHVc
         4oLMvYtm/jCYBV6tjeBFAcItsTaf2TCXXRMNX2sjE1r/t78tOGXRMz9Y/nBbrYaSyfn/
         N5qY3yx4GmeNRLL46EfkSQSMxSENdY1p0xOYTj4V4ladLUAhND95F3QrAbNP1jFXiXmc
         nXhqaFsu1EteqjVRzg3S6gYJHyPtYrrRqRVF0yxDXTpMVuIph+aSkrbBuwwXOhsAnAjk
         KusA==
X-Gm-Message-State: AOJu0YzFMV0PXGY3IBzJvD72gBNbQFJG9W/bR9OwmR/e3zAPdGs4fNkz
	u6ViQqEzUSoCOqt7qH3JuTu1lXjRygywXztMnUrikOd23KQRMNM3HzzR1RgCf0a+EK/9zxA7qhB
	NwUic61fSOPTSSigykge5MT8yfPuPsM0J8agqAW1a9L7VRqVVAbtXkckqsHmnMzLxxaNy
X-Gm-Gg: AY/fxX5HyjWa1NU+cZiQ04aQGP5jia61XH8L/w0LimS8RVW8CLp0+gwqsKGn/jOZoHB
	pstgiG3tD++fGMzazSmM0lqZdF/d8Br8KNwIQp/3ktCiP7bIoH312dc5oDSkIp7NPxxwVDkSCnM
	XBj9WPa2Am4FeNN2hh/EUU55/BChER4GRQ7YKqLfQxeUnlaR+/xr7UaeKOEwgEnX1vr+uWxnNHA
	saTqDkiVsDDIJ99mHnmOVWeGOvQ0HR8jW3lM2L0yVqPpmnUd8LLxDOCGz5vbFHRES7+h4SyGpD9
	meoVyP59vFYl2XM+ER1CHGF9+cf7flQcn5p1MBG5tGMIwgc5xhjj/RUvtqFzwNaYVxueCsLW8Hp
	iXkw/i0bhuHb7eZgjMT9+bZo3lfoAPEqXCalyvnendeiAWOmSxp8ZXMV81cjGuVImo/lj+lHYL/
	9wNV6AcxV2TyqVPtYwwKR1pdA=
X-Received: by 2002:a05:622a:1aaa:b0:4ee:1227:479a with SMTP id d75a77b69052e-4f4abdd1c34mr264654961cf.84.1766590954451;
        Wed, 24 Dec 2025 07:42:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJUaulADrZuO1E1rW2ACXAChMyl7OHsok4EwpCYelhHOao/akwZn/I2B3yyVgUqAj/Qpchlw==
X-Received: by 2002:a05:622a:1aaa:b0:4ee:1227:479a with SMTP id d75a77b69052e-4f4abdd1c34mr264654761cf.84.1766590954069;
        Wed, 24 Dec 2025 07:42:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861f2e6sm5071562e87.69.2025.12.24.07.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:42:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:42:30 +0200
Subject: [PATCH v3 1/3] drm/msm/dpu: drop intr_start from DPU 3.x catalog
 files
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mdp5-drop-dpu3-v3-1-fd7bb8546c30@oss.qualcomm.com>
References: <20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com>
In-Reply-To: <20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3891;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KGT0ib6f0S9x+W7J89kuc0HaNX2OlP5UrNenSreVEj4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpTAnnziVXM9tBiur/oDhZRvJxxsxCPopAEmiGt
 2MEGkk86pqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUwJ5wAKCRCLPIo+Aiko
 1d7bCACvxx6Jb0d3zC1nbjim5Ae8mQk1udJasKB08xZ0ijR08IxUFrmLeIaiubgxLVhcG4Kbnpv
 c22USuQpHqJHXMIXwmCfvDGpoQcGZSahvx1JIamkDA6Zx3hYZZrcJ3CWZbOeSwKEUWspVqO+QjD
 VKM2MF+2TKvxiC1/Ve0S3nQ62khUCnvzqvO5piQGtqiDZzEaxlffUTFSw8YZIxRzFlRE3uqCxGx
 KCNkZ3frm9K24UnpsnxOdN30Ca84DElh+CkljqsprUZw76UokPej3azZhkycGl5mht7YlvFeyUE
 KI5hck0RZ5iIzl6vKN/3mqYOjXjhuP14CmCpm+pj8svbxE49
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEzOCBTYWx0ZWRfX2cUxW6WqpjqL
 3ttTH6ccsHB8Cqt/rrRYrkgSMqBvrqStPwZkgt5LYgZ9xRjV71+NOsxSh04wLKO+IEB1EW0paVf
 nU8SmMtktxh4+1zigv/TLZ0+gz24WxoYKO31Ia0KasKcmlmJXsuPx1F9oIHq57GjTnjtujq+iG7
 CTY8t0VXQrwLfwQkSPyYyBUglZ82p9OvWZOb53Kk7K6uBINJms0Em8o/l7ruJ1hM5+Z5uOqgRI9
 f+zBI10HciXNjIsmpNgTF2TDzvPNHgnmXu+oyQ9jHDvHiTbyXgEqVCAfPB40nTc3nRmS+6BQBNj
 6X4lKWw67KLsKDMqi41jdaWV77o7OMvrKR0m6GaJ/Pbqxmp5ZAVmfv2LF3w3WdLRUBnpO09YJks
 DNl0unuWoJ21/sYTgdUS3UfsPCmZ/h5ig0kTecXzIhAlgZ8YrggQphHqyD7t0ykmTjz+bDYrANP
 cE6DGP505DV/7mROCjw==
X-Proofpoint-GUID: cNIzcuXcfiRTEacbr5TvWzp_NEGVtD6P
X-Proofpoint-ORIG-GUID: cNIzcuXcfiRTEacbr5TvWzp_NEGVtD6P
X-Authority-Analysis: v=2.4 cv=P9c3RyAu c=1 sm=1 tr=0 ts=694c09eb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-wdOMmJq3JXEukoY-DMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240138

DPU 3.x don't have separate intr_start interrupt, drop it from catalog
files.

Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
Fixes: 7204df5e7e68 ("drm/msm/dpu: add support for SDM660 and SDM630 platforms")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 5 -----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h  | 5 -----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h  | 5 -----
 3 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index f91220496082..b1b03d8b30fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -42,24 +42,19 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 8f9a097147c0..64df4e80ea43 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -37,24 +37,19 @@ static const struct dpu_ctl_cfg sdm660_ctl[] = {
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 0ad18bd273ff..b409af899918 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -36,24 +36,19 @@ static const struct dpu_ctl_cfg sdm630_ctl[] = {
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
 		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x94,
-		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
 

-- 
2.47.3


