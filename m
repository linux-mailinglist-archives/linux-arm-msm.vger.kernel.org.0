Return-Path: <linux-arm-msm+bounces-71389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67648B3DF4A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 11:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4FB517D8FF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 09:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB90030DD19;
	Mon,  1 Sep 2025 09:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJjSUUcw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CB530E854
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 09:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756720719; cv=none; b=edL1WVALxsTn0su7daq7Q+IiHHlRYxMFmSTwnV14VuBf9iCGCFsWEJg77lsv+7xjzx4UGnqjGgF48mgZ9l3rTRiMQNjZK6XOUD2bDulS6NrQtu9bg9j/DGhe/mViR6YN6VevfhZC5itAOcqyZJd5ow/+NDQYdN0C+0DUK+gU10w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756720719; c=relaxed/simple;
	bh=xP+KCWOk9SNxzFjMtHR6U06UR7/RbmmfOmVurK6QZow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q47noOF0sJWtsc5jRZcIE99MMs/mrkN8NC1k4dRmZjuww8f9uaO6dpV/yMdd42tzxdz80qJAn8T56vjYcmztxMjNgr7m6rkNDM/LJ8C2ZnM3jNxyQ2G7hrImpz9/0oTFTTWlJVIsWHeGXo4Kk5Cif2tReyDY87fvnZDaopnVc/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cJjSUUcw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5819eN7H013665
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 09:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nc/Me6JhWACWqZ3Seo6sntz583zORBKIxRCpmiza2Ms=; b=cJjSUUcw7rcCaAs9
	3ece+tFyKmFvLsxDYnjr0bmulVlDEjpqyScfF1zpBz9X/si+oa/G6vGyOlFteiNl
	cIlGpxJAxbNKtQBvcanLte4fWozqrvFrFWrOnzCl0UCU0oTDeHlqw4srZK/CrnVI
	u1EomFOYJYfvDf6vQxew/+vcI9vp2DxDV69EMeeCWeGwgEwjCLqhF9si8tXOkDVN
	3Tq+ZlMApckfndD4XkvAlZkacIWNHGB3UOblJ2rpc+k+zEgApFWGYKK6LuRLpaiU
	HNq0oWpodbTtoPoCQHwhMFnCfT5GNS3Sj8kjh8ZaY2oTwhsR581j2J5NrBcx/sPK
	Ll9N5A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuv928-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 09:58:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b47630f9aa7so3623630a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 02:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756720715; x=1757325515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nc/Me6JhWACWqZ3Seo6sntz583zORBKIxRCpmiza2Ms=;
        b=B8N4OcWRFJiwL8nnHAgkWUmKUgMkqavyyYUcFwLdQM3keMOZAeY5tj8M7vbdcoD7Iz
         EgOdw0EEKdhlQz+90CnI4K7TeW73eJmKi58xY5X0FGKQEN+TIbfSGECofTrFycfJRz4/
         orcVaubx8voa2i3Kwya2XRs6uwEMH98ngSJzq3ITAwzrFhGa/Y9ryUL0eAnlGXBwJ53R
         2vH7nzZf7i/mQ57PQK0DbroXWXTzf1QP/SMh/CX+11QbQU4NddjF/iSggftb4xsolXq1
         Iwp7/VKjieRb00jEZETEz+h61qwry0Y621tYEwZhv5dc8Z4F8x3nehULF+37OPIb6BI/
         4cRw==
X-Gm-Message-State: AOJu0YyaSIhjy0FW/rVEC7Yu2Rrb9n8tuTPNEBhOLyuSGWvpVeX9NZ82
	azFFvAg9+DzTC1HWhpNcDVRNxpyvK80MlvzElh3+KU3/MdowpTsvhTPnVrqW38Qp+86QV/8S3YZ
	IEBrxGYH+CDFHg2UwernGF7VOLVeHVFyuJujG/IWv4QCeV94kej7FssNUqvpVmg0qRDhw
X-Gm-Gg: ASbGnctPg6OwE9tWZs0igIaymEo0j02IfqZID+AeokeO693eO1/nMkU29uB8BPEDDQ7
	WeC+MZloYSpyuxnxZL2ij/AMwudNBb0CpgfONPkt9eejtdSGKe9wfSRNaWWCm4xvS8G/m8WoTqh
	QdP0Enx6XUzuPn+zLrS3tDNfBrUL79LpBKLz1rVNmsbFhhltBiIzY19b2KGkIxKhSEVkF1ayI0f
	q21AC19WBWBasIC8HUWnyjG7ItSJdmeJfLJzgDv8hn9H4Mnve4xekeMufRZndAgfn6jMJx9HVen
	VLsct/OlvUmTJyjXM8Xr0suNCMUnmsninJLJ/tSZGSTjzPKl0t2YcTxE179xEJDZ0hAPLFY=
X-Received: by 2002:a17:90a:d403:b0:327:e0f4:93c8 with SMTP id 98e67ed59e1d1-328156e3403mr10453245a91.35.1756720715349;
        Mon, 01 Sep 2025 02:58:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELPKocoeFWcHuBmJ0qmsn5YbGQOyvdDQm/Bwbw5KgIEgQX/1K8sTClC0rbHAhXOKucBgdKgQ==
X-Received: by 2002:a17:90a:d403:b0:327:e0f4:93c8 with SMTP id 98e67ed59e1d1-328156e3403mr10453218a91.35.1756720714887;
        Mon, 01 Sep 2025 02:58:34 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26bfe2sm10305656b3a.14.2025.09.01.02.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 02:58:34 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 17:57:33 +0800
Subject: [PATCH v10 5/6] drm/msm: mdss: Add QCS8300 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcs8300_mdss-v10-5-87cab7e48479@oss.qualcomm.com>
References: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
In-Reply-To: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756720668; l=1044;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=xP+KCWOk9SNxzFjMtHR6U06UR7/RbmmfOmVurK6QZow=;
 b=GeirIYyOUXVPOWPSskOREOmICTSCKpJng0kNFerFH5dqKzpm3oLQ35QPAuWOKEVhpy+YF9gM5
 KLrQ5nU7/SQDePMf//NeenzMFWPPPZfEe3rrbvP2Dup5ClT8diq6E0b
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfXyj3VZWlb9KHA
 litkdVdL/CDieda13fMd1+tyRND8+VV7cGHS5O7FJIlX+VUl44r4ZrDPXGDyai8/3PFedvk4n1R
 SXSe8kWmWZtylO1r2RU65z014a66FwNbjue7pFFgJyBtjx0e6inmJZWCahLIz/FmvW2ZS+Rqoba
 4L7tgdfPl96ImHAjbPoKRDqiGOth8YExaZQitX7wV09tFFy1ejDNhZXfFtZ54ak9oq9n1+PCXTR
 ULM0TpU0VBKgfHhT4EsO5dIpcbl1syK/a2eWSc/fN+sm+872k+4ap0vqmU+lvNpEyssG+39gXdc
 hg2cBTvg6ZDBETi7WGfPIGrIWI3hxx5aS9ajaCxsKg4vaR/MM/yqCVkftyjZeoAyPk6l7JbJnXh
 HSANs2SE
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b56e4c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VHyea80QRMuD3TjLfpgA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: X2nUrgnVwkWDgcOqJKagULMrQXB2ef_i
X-Proofpoint-GUID: X2nUrgnVwkWDgcOqJKagULMrQXB2ef_i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c044db8ac0c478446d211a982cf0350..db2f0064eb72e8a990ff4806f60be74d3ff8dfa9 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -555,6 +555,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sar2130p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sdm670-mdss", .data = &data_76k8 },

-- 
2.34.1


