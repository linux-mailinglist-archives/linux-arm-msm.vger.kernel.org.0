Return-Path: <linux-arm-msm+bounces-89332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 764D3D2D362
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 08:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D779E308531B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 07:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C9F354AFA;
	Fri, 16 Jan 2026 07:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fPXYdylT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LgVq3Sbv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1564B352F9F
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768548473; cv=none; b=pl1S4r9nZ7vgV0ImvB6QVIQB2m8zVfDJhkLf5BP8G6ne/Gc6l0PznxYR7UNWz9cHVx44BVBJIf2vpDxpgZb78qbhnq8p8U5FCBt22cNcCGXIueIGY/IpK6Q8hV3emVjZatzLnSnZixSrjoe1/5B4v5L423BJis5hpvqp9c1cYU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768548473; c=relaxed/simple;
	bh=TBMGAChYXcRd+cqTtCm5cArhh1vfJdQRxPrvxfqxJi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gqj8jpUApsAn08c1L9NINrP87HLfz2Nv3S1DV3K5XDh7piMMfEtIw0okAlcbecxaKSDCG5hDKo5FCK/AP5sA2uA+n1jEANwWeDCj3jxWlTMrStojSpbcNGcJ8BST4GBu5Jpi+8qlMpmyhp6u0fDaazOGlBnqhnLBqb1NzB8wQIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fPXYdylT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LgVq3Sbv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMbbwI3596358
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6SqJm6kDIAzcW4Krt4Gxm6Mk8UAj2OVBwGK7fUIbwoM=; b=fPXYdylTR+08QfgM
	AKCjVblPIbGwHjlsNIzSCpT9j0JZc8m1a0PgbPuvcTNlz53dqk4pzfmwW0b+uAe9
	ACU1FuVqEHiYAow1Pmm19b2KyJJ2bfztQ4Dq8Kc34KJ4h++uWDhIsgf+MobwRUoR
	qidaMlvuLUu7UAvJsCu/WgA8MeHsJOvFDK6OAB8zRJo5kVYgRqPDHAsVlEIXYCea
	RQzUirZpmSWicyYOkdGlFD6eooBF6L77W2QnOfkf3Yd85KYYk98gg3QKB1My/UOG
	zXZ1hYhA1wDg/uAvNl2VLOr59ES1eBUM/vDMoL0TQqOk9akfL6QQ/X+6XOS5iiBY
	fHencw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96rs7a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:27:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c5297cfe68so349286085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 23:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768548470; x=1769153270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6SqJm6kDIAzcW4Krt4Gxm6Mk8UAj2OVBwGK7fUIbwoM=;
        b=LgVq3Sbv6lLhiKJNfJLLX5drtCRKiAQ1BY765M6gWafNCBLPuKldx7W7fX3n2gClbH
         PKhT5L46tGaazAF5RqvrNA40g5k88OKskEygosOICelEkl58oqPkg5fzyMvDZASO26jt
         G+88GdgntNRoIZedttZA8vBQf4fxMBcU5sInxZ4U9/2+HuIUyV7X1ipdi597xvOqz0sM
         0skv5Zi2Od/dMGy/58u+H3KNQ621q8chCMxXn1Vm8LBKGm0Vndtm8pisZg21PFPdf5Ce
         7ZMj9cG/XEW8nVuaqxmGHYYttrhQg2UIV10eK3glksWizPr7hFb/TqPgMVM59M+cnOP1
         MFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768548470; x=1769153270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6SqJm6kDIAzcW4Krt4Gxm6Mk8UAj2OVBwGK7fUIbwoM=;
        b=QKcm89hOFVlwGhzTz+DEDwIZ1HWHemNK4qPxgtO2AmmDP5yC9IB5E5sEDphDBQNqpc
         KyPKJn5OneSZlXmS4Hoxm3hyKu7CuZmwXz/CLK8rgzwaRBilSrncV9/DGb7skjuCZA78
         j4hYZ9bn4lD8KLBgksDpBIQ6b7CL1txBqCA3HeB/PKDIBuNxn6JiPx+eDvWa/doWYEpv
         2Tk7zkk6chQNxBDuCMviPXf56QdVLpUkSW7guKTvTBP5DdQvr5FE6EP+xpItI0GUvtMk
         CEmSHM/8hqFk7PsVNx5AnCOUtj1GrqVIfmjbK5p+nDx6as5u25KI90sLgt9uM9mNdwLK
         ADUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6bxI13/43sww84/yM3zRDBbfzQp/89Zh+RQeer+8nTakLcydTWTflPhzhhDTUiNDEm6XKlwaIYVYsZ2+6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz38QEOtTNZoNHIL+DnOxYUKo79AskS1DPDFmwKWLa3StnECaKp
	4Rdu8JqwDv1n+38o0DXbdx+mcdAIziakHjvOAlR00ZeYMny5aZUeOEL3DfTQ5uIe1jJWvchboEf
	EhYwOyD5pXZ57bE8RsVpjJwj93IA9zQYwJRc/lrHQE+V/L7jtO7+lzB6tx7w/+hi6dg3c
X-Gm-Gg: AY/fxX5VPOtnFgHPPw9bNO3+GbnJpVOqHZDk6PFfsnGvlsKpTJf7A3IkbCIWdPPHl0p
	vY2d+Ne19OCwQfmiDxELO3zbBRCYwIQSwe/R9UMMtvhV9kkLnqVDAyxn74l3n7s4gkJiUCUsSxw
	uqb+oB2i/VVhoyCcvpLxpRWxvWADAt1hZGwKy/ie35xJ85AJHq0w0T+G6HYIghb+LIT3O9cbzWo
	82OeXGA1Wk5REfwyUa3EeuYoVSpyt3Hx4Rz2HJQGBRPXGedMkbiAmG5LwJ0TJMysFaI/pEQOojc
	ZEbMinFe79wvB3hSgHdqHN7tp2qplXbqtOEu/u+/5yFXJa20pe582TEXsAmoR3mUby1c1qkIFNI
	+m2F1akHInvKztceDBWiWWmatIVCY9GC4HWmG+vXPq7VSJrguLueGY0XKTvg/q3uQFHQWCl/Nk8
	AiwDgA7u7npUHK+G/qv1lvneU=
X-Received: by 2002:a05:620a:1911:b0:8bb:a27b:a111 with SMTP id af79cd13be357-8c6a65fcaacmr291175485a.0.1768548470501;
        Thu, 15 Jan 2026 23:27:50 -0800 (PST)
X-Received: by 2002:a05:620a:1911:b0:8bb:a27b:a111 with SMTP id af79cd13be357-8c6a65fcaacmr291173485a.0.1768548470052;
        Thu, 15 Jan 2026 23:27:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 23:27:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:41 +0200
Subject: [PATCH v3 7/9] media: iris: don't specify bank_spreading in the
 source code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-7-662ac0e0761f@oss.qualcomm.com>
References: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
In-Reply-To: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2351;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TBMGAChYXcRd+cqTtCm5cArhh1vfJdQRxPrvxfqxJi4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehq/i+EvcJfs7BD2mcwrDQr+u6wFEl2Q+zxH
 Wsi59FtErqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoagAKCRCLPIo+Aiko
 1RKbB/9E+bGNVmGoLwsG7R05MoYhqO4MfVYSyooQgbTCN2LCKtGri3Yc9J3s/J+5jF0yxyltaKl
 H8HiJ2cgXNl6XfSJ8TAyRPKFUep8Q97W62/e+ENrkIyIjs24cpnb98GLBndH99YvYu9d67jH1U6
 kCQkw/+5SXh7vzrQARfOzIg+4q9rWWQw8OULKJEPzgWFcDQ9EEF05fOnZmn5Zb8l34IBivqU+MO
 5gj54tPrndMakA7aa/Jrc+0OFEJazd7iolQOb5G0brSQ5eLfGBb2Wn/9XE3bz845LpfH1IRrGcz
 iQ2YSw6COpzsLmAckHmEDJ10ZuFegsm4Z8IYO+70spc5cWz8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfX0EK30BVJZr9d
 iFGgNgeKQruVCZQQgEclivwBJtE7b7fEeGRKLu4WSEYny8vk2zHbOnnY2hbDFve84qm4dVFz5bC
 lmJnTWIHREVrEzImHkgpWhsuBUcBR+d3+3ptvU4xHgMYSFM8grwMqvYwrNjNlnSRG4xQ7xLluHO
 XoV1XLh1TUJjAld9dIYx8rLVDrUCY080l5g3hBHcy04rvDGOq7g3JEmH2bbl9/w2r9/9ssqTTfB
 cUPkITuY8d6vcTpEyEbx2jRQ+u7FmjbrYI7bscpiJsirIEoNdZIp1CaYAzKe7lf3e5X1lttsaMn
 CXNval+vT9qLO1u7220H07jfAs2bYHJoMZA4Z96OzNRxwajdsoD7cxSeJFmUnH++dtNi4wfhsf6
 hHVO7fVscxIBogMYmQRIcrFB7hwNTfdpPBGELMqrJ7dZ9lbAWbR/IR5CLv+d/hA/7rZUqKhcoPL
 Vx9Yx3Pe3XFjC5otVqg==
X-Proofpoint-ORIG-GUID: QrIAGlXXOfXTxT7gRm9sh2bvIDbY5j34
X-Proofpoint-GUID: QrIAGlXXOfXTxT7gRm9sh2bvIDbY5j34
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=6969e877 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2VIzI6ABkMI1kr12n-IA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601160057

The UBWC bank spreading is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index a4d9efdbb43b..a49394b92768 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -200,7 +200,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_spreading;
+	payload = qcom_ubwc_bank_spread(ubwc);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SPREADING,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9f9ee67e4732..f99fcbb8fced 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,7 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_spreading;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 0f06066d814a..c967db452dec 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_spreading = 1,
 };
 
 static struct tz_cp_config tz_cp_config_sm8550 = {

-- 
2.47.3


