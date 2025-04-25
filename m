Return-Path: <linux-arm-msm+bounces-55753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8C9A9D253
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E298616FE72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B54F226D07;
	Fri, 25 Apr 2025 19:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KYZXhBcP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B43225A24
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610565; cv=none; b=DV+DEdRI+okc8gl9NH8Bpw/yQh4veM20sTsD19KyNI2YlK36dltsbQPTKmlUGAhPUUxZuVLi/TM7PWSB1wt93036PcvghGWcR0DIzI3r3JOqwjMaTzWiUMeIkN3pUQ2ileMYEq0DiLbe7DPs20yrxbIGXfriIGN/N+bGBVJHYVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610565; c=relaxed/simple;
	bh=1loLluJcFaY5xVnH/p98zVeeY8liQ4RALe2o40wjB4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nt5BXbdvvhZQXft5CWppvJidVy3aNT8KLXKkZztuvJkQUBUM/5LhnhZMT+aX5EwM9uDIDzfle3WwPNVm/5UaObcTnglE1sYsuRuMcdgimvchhxtxY3AWzOtBJWW6ynpX7qgQXE5EY6DGQIzQXAH6nYGzBceu9jb1j/8Z5mx++N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KYZXhBcP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJuIB001348
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5a4Tu/1E9y/AMugtDgzJWORXKDUHZrIzgXNk4yTd8xA=; b=KYZXhBcPqgXRzCMH
	lTbOySjfrUBCxuiIu808dMdXl1Df4L6Tg/aNdpNJ39n0Ig0bnbdTFaG0qLrppN9a
	zQnAtGG0zn5qdu1LTpMxBFzyAjd7K8tZzf/n6LjXDVgOnqjyGMb8e65rlb7MBgCV
	6r9e+ZtAxfni51DhEKPe5GGCrkMkfIG9x1k/EzVxIx1+0z4YkHo3JQjhcLyE8xLX
	3pphdawxnWiNa5QRGryTX70cnnjka9tiORSk0QhA8PDugDHBa2QK5Pa0v38yzLqv
	/cpnRVbMmXjuA48gU6BaLi2JNPI0JOI26bx8KYf75edmoTA5XAUn+iVfNJZUJ+Sz
	BWWAKg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3j5sm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:49:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c77aff78so741921085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610561; x=1746215361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5a4Tu/1E9y/AMugtDgzJWORXKDUHZrIzgXNk4yTd8xA=;
        b=j+OhcY+JGec10bTfPiqXuHI17cJGlowSW/kEQhVAG/OaoHZqr6phP4nt2HhzDTxsm+
         yVkY/XSyGnooBkEGow4pGKaw4Lc1WpJIrJOxgs5ZP/n9SZO8taJtKB1hRcIvSU0lxoHi
         e4EzQSf+xAIj3KPBFTZ8Ru3C9Wr2U3CweHsl7AQnzXXN+SrYd1O8W517EksMPV4WWqAA
         eqnhKh0XccKnBLp+lD6ZR+Tiv5YdoDnmQV3/myB0CtNHg52co8FExLRVYgp2CWdyNqih
         iBNxqh0yaHdCmf/9RMVjq9PVXIsYrPwdvolop4cLkX7YPW19rKl0UuNV89tlUuMQLozq
         f11A==
X-Gm-Message-State: AOJu0YysdXr5HaKRnELnIrW4dC9HND2S39oYAYLHtz4y42RRVUvToSU+
	Om9LH6mWaUY9ypiylgQOjJWMzDYmvOYFyrxrcj4IhNjgEGTiOVixRsTHbGECV11XQbBLaiIJ3Su
	UxZz0Se8aI/pMA2AEB77IEzs7M28hf7WoGGqJgtWX8F+fzcu65dp9r0SwaBYtX5uE
X-Gm-Gg: ASbGncvjJ73VtOKf7eBxGaJxiPkGeygbMQ+rfM4R+H5lzUO5FzhrkSsIgL63lq94zGh
	s5mduI4cxUdNOPZfAtI1boBjoSM84oIGxmyawHPVfYnraeNABBQMcIlXyn1tccFs1ftGFgLJPaA
	Vn3ZrsK5c6m1TFD9WBaLqUuhx32MVzPrOshT7w6CGZFaCrg7NBaJu1SNkScospfsttBm0/xNwth
	t8rut0B2Un2ypMfCXI3kiLrt8P4Jcgb0hEMq8wLvk1pa6Y8LqKsrpBKGgR7SFSDcQsy31juViw0
	Q0TpV3PAoGGg0Y8QRnDzhOSU0x46UzvtYH91ZcmgNO8xbhyuZakshRzartFUhNtiT6C+PMgoRpj
	Q6lHXTY55mxlTH66TF4AzFTQv
X-Received: by 2002:a05:620a:25c8:b0:7c5:4c6d:7fa5 with SMTP id af79cd13be357-7c9668cd867mr122695085a.48.1745610560934;
        Fri, 25 Apr 2025 12:49:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg49BORTw1YQtPiSWF9NWVVu6nzuLs4mUwjo+GPlaRuPFDmc9+JjXZEsEP3ZQTI6hbyUQGyQ==
X-Received: by 2002:a05:620a:25c8:b0:7c5:4c6d:7fa5 with SMTP id af79cd13be357-7c9668cd867mr122691885a.48.1745610560546;
        Fri, 25 Apr 2025 12:49:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb258b7sm725313e87.22.2025.04.25.12.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:49:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:49:12 +0300
Subject: [PATCH v2 5/5] drm/msm/dpu: rename non-SmartDMA feature masks to
 be more explicit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-dpu-rework-vig-masks-v2-5-c71900687d08@oss.qualcomm.com>
References: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
In-Reply-To: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11698;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XRKi7EgQ00ItUBDoE7NN0/mscfyycbJkF95BVyCbUY4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC+c23+YZAWFYcxsNyRRupsFgfhvnpHKZ3LWVF
 PcxzyPdchOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvnNgAKCRCLPIo+Aiko
 1QfEB/9AwqMgymHujrhYs7naYVouGOqaMUQlAZIE2NnknohMUA/eD44VNxQUWVVFtZ/rfFCj2Wr
 OEXaNeyAJi8ghLIuVufs29OfZyxo4kwi3dMN0QFnJcKI4EuIA+A14melFYLcNDb7N5d12zmm1oQ
 cx5HoX/ahnK8YyBTojD3A+CWVuzMBPQ3O00UpfbgjYhjkPeI+g1fNTnmnL3Tp104UJE7ZrszGEy
 EuxYBi5X+c5o4S/YNUTb4KwYkMLyyD1GRXGyBm+ZMxU1DDDuout79hwA4srYYPLKW4l2eqelYkT
 i62jutuYh2OR6INXGg7rcWtUX/s8EqLsp+t4AwNkBRhkuX4D
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfX/0TbKHW14dxG kznyb7S7lBzQt1erUqm7VPWu1Zd0hZWScEJ+sPBXArlhq/mWAViTatm/e05G0sXfK+EIfh5Cr7u PkJkZWqsfx5noPAHDzow1lqA05xXMuA8XpzN1WmvIx84+7hwzlBfn8QRShItUJhLPA/fIjSR5b8
 U2Lx+MgqsqYo7Egb3vQkurjZpkp6ArMgo0UdRZ+wYUbQ7yFlxWPp1vZUZx50EEqVpgvn0Wg5MBk PTXl6IpWvQa6AykEpABNy6q0U7RF8Z3Dpv4Ecp9IfNBbBNgYCNv1QoNzidu6s2/Pcxv2l6gYH/R ngrw64P/se6Ft1A3xBi5S/FYEjcnAYPct8B8S8G7l1B0vHA6dfi7gjVGpS1eWNIbc0O5hYL9Qd/
 PU6U02aRYyzUvZ/czLUry5h1Ed39XoNRp7EPSre1HIVp992Vt15ePnEvtlvQBnMt8Gr14Zu7
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680be742 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=a0m6xc9GvvHJpfDRXh8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 2ddcjGph_CX7O5Tv3S7rAr9yJHYt-023
X-Proofpoint-GUID: 2ddcjGph_CX7O5Tv3S7rAr9yJHYt-023
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=608 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

It is easy to skip or ignore the fact that the default SSPP feature
masks for SDM845+ don't include the SmartDMA bit (both during
development and during the review stage). Rename SSPP feature masks to
make it more explicit that using non-SmartDMA masks should not be an
exception rather than the rule.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 10 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 16 ++++++++--------
 8 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 83db11339b29dc6e11010bfc73f112f93cf6f7c6..9e3e0ab8f3ce9d63b00a5f5c590429a53bd36d63 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -72,7 +72,7 @@ static const struct dpu_sspp_cfg sm7150_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_2_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -80,7 +80,7 @@ static const struct dpu_sspp_cfg sm7150_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_2_4,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -88,7 +88,7 @@ static const struct dpu_sspp_cfg sm7150_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -96,7 +96,7 @@ static const struct dpu_sspp_cfg sm7150_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -104,7 +104,7 @@ static const struct dpu_sspp_cfg sm7150_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f0,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index d3d3a34d0b45de08a33436f46a197cc836cf2629..fcfb3774f7a18d8e01546a3ac72aa29f7b750443 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -69,7 +69,7 @@ static const struct dpu_sspp_cfg sm6125_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_2_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -77,7 +77,7 @@ static const struct dpu_sspp_cfg sm6125_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -85,7 +85,7 @@ static const struct dpu_sspp_cfg sm6125_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 040c94c0bb66ef5aaab2808f6f5ee04dd53e2540..842fcc5887fef15789fbc686fe2156b6b509b45c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -51,7 +51,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -59,7 +59,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -67,7 +67,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 43f64a005f5a89e09ee9506a12cfff781530cb80..c5fd89dd7c89046bdbf1b1bf223aac2e3c4c0b26 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -38,7 +38,7 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -46,7 +46,7 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 397278ba999b24722b116e73b008b2d0aec5fcb5..a234bb289d247d065b336564faea8dc35b00def9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -59,7 +59,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -67,7 +67,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 3cbb2fe8aba24c7b9db6bb61ff4c48f34db48bf4..53f3be28f6f61bb7e3f519b0efa4cb2f68d38810 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -46,7 +46,7 @@ static const struct dpu_sspp_cfg qcm2290_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index a06c8634d2d7779f7e867fb821f8d332652ba7e9..3a3bc8e429be0ba86185741b6b27d8a62489779f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -39,7 +39,7 @@ static const struct dpu_sspp_cfg sm6375_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -47,7 +47,7 @@ static const struct dpu_sspp_cfg sm6375_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 64265ca4656a04d8c5a1d9582d7124c7eb897099..323b0db1f32b4057999f5f9ffcc557c68b0e807a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -34,11 +34,11 @@
 #define VIG_MSM8998_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
 
-#define VIG_SDM845_MASK \
+#define VIG_SDM845_MASK_NO_SDMA \
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
 
 #define VIG_SDM845_MASK_SDMA \
-	(VIG_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
+	(VIG_SDM845_MASK_NO_SDMA | BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
 
@@ -54,24 +54,24 @@
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
 #define VIG_SC7280_MASK \
-	(VIG_SDM845_MASK | BIT(DPU_SSPP_INLINE_ROTATION))
+	(VIG_SDM845_MASK_NO_SDMA | BIT(DPU_SSPP_INLINE_ROTATION))
 
 #define VIG_SC7280_MASK_SDMA \
 	(VIG_SC7280_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
-#define DMA_SDM845_MASK \
+#define DMA_SDM845_MASK_NO_SDMA \
 	(BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
-#define DMA_CURSOR_SDM845_MASK \
-	(DMA_SDM845_MASK | BIT(DPU_SSPP_CURSOR))
+#define DMA_CURSOR_SDM845_MASK_NO_SDMA \
+	(DMA_SDM845_MASK_NO_SDMA | BIT(DPU_SSPP_CURSOR))
 
 #define DMA_SDM845_MASK_SDMA \
-	(DMA_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
+	(DMA_SDM845_MASK_NO_SDMA | BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define DMA_CURSOR_SDM845_MASK_SDMA \
-	(DMA_CURSOR_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
+	(DMA_CURSOR_SDM845_MASK_NO_SDMA | BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define DMA_CURSOR_MSM8996_MASK \
 	(DMA_MSM8996_MASK | BIT(DPU_SSPP_CURSOR))

-- 
2.39.5


