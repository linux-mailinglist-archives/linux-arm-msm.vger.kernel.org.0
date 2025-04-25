Return-Path: <linux-arm-msm+bounces-55596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A243BA9C48B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 12:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE11117429C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 10:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2320624466C;
	Fri, 25 Apr 2025 09:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCHfUH2e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC1B242D9C
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574728; cv=none; b=UwJad9F7wYolxc4AHOGxS6RRD19Kuk9gFlm8UAmACPYc/xSTl8khBqozHQR3nXLlcinI2cMPo6aN6huhsV5Egr/myjHJIu36cGPHFNAaUtlFEKuDw/az4vxYbC38aTbQA/tL7T1ivsmUEf7AnFxK+uoQduMR2ifyJhTCUG4sNq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574728; c=relaxed/simple;
	bh=QKNaVn6QCseVUR4BUepdIAxDPpNjR38Pq6lvhCZCros=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H5YoUnmc5kKkN9NekamQO0vSfhTsIwbsDl0GhIPB6mYNjlX6j1Xw3BWtxUsfnY0z8WPHDtZybgFU1SNoDMueDgE5k6HS1wzdQ4k3Z5xKFF88AmI3XVjVgqAVrzuOIiseuFrZ4XYW0NVJXKQsP37JRS8zyC4Mg/rn4kH9GuQnjQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCHfUH2e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TDTG025215
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZfczLUxnWTdMqDmkRvetbnLGF6+K+kBxElbD/jIQGQ=; b=mCHfUH2eedgMf8ua
	ulLCCbT8l+iO9zEcYHxVfAEbKNLEPjskH6QYR4aFYBOmJXnpSM03V2bXh/F/drKQ
	4cVAJv8UBOyV0M3gOz2X9rGsOD5iIk6ASu/EMV0ASJHRuaV7azWaakkhKWt8P2lu
	jVl5mCOHytZiKDKP6xtUHuYCReLv1ihhWOAE2jjARbQOkPpNca5xqI/1vsDBgsi+
	1bnaxGr+CEn0H5uTpuS1Tp0v6IICM7smLCuzmSnISk383jrM7R6+fZEfvmV+gnoa
	ES3SH7dV2FBN9zonP10IKL7rv8Hcwf4jhzzm349/LSj46EfuYozOQyeye9dy4Er7
	aoPQ3Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3rg28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:52:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c791987cf6so422905785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 02:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745574723; x=1746179523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZfczLUxnWTdMqDmkRvetbnLGF6+K+kBxElbD/jIQGQ=;
        b=cjCZEE1U2qzm7ngTm9bif4olE8SHWN+WhwyEw76y8oshd+Y0q2x+j1t0dH1kYI0bGr
         0dKoyotKE8SinvY+D8qT+nHlblwTA1tlojAsi4uE7miRyuo0MvlnMAH16gHNS2+YQfiL
         PqDHZe68yLRVG1n8xwg01JgZTIz+a7on8+tJy2bXvqLLMxnV7fhYGSj/I8rDOw/3t/o3
         ERJzfMqixMX/lw92hqWANm1r3QP9aGw79Yg8+z1nV96KLNOyi0qzbVJV6r/PEik6w1w/
         GL+g/M6jNc/c27HKkItJ2Umh8h5rUGYKCxpThKGL6fJ+yP2d9/0e557HAV4r+rCpIVkj
         2hRQ==
X-Gm-Message-State: AOJu0YymM/94beRkRQww2Kl7cUPNGhzP0RqMJ2dexxUfbhcUJHKf/+6r
	r382V+2UytOaPDXfBbpx8PfMGauYsk+rm0nQYhv2HOnZpI8qRLzyDGQf0uriWQZvE8j5X/JQ/4i
	7cPYYFzqX1drVYr0cVuxPLfa7OTp4ntmGs2AZQu6EX8xNa+qhdhuD3ETwL7Yq8/hC
X-Gm-Gg: ASbGncv+rWh6lDZxxAq1LAjs4jwEgscdPJ6GjCrQxHuB1toR1LFJHI11GJ75Dd28MGQ
	ETHs3T2Vq6Vn61BJFWtZ6I/mSyTGtx68kHRljF5WzkVcHHr85yprFr+fhs8mjG9rzPosvOW+sp8
	Rap1bHyU7/eqsA1MxUl0DHjVjvY4byVwegR013d9YPolchAzDmhYMFbR2GmvyK+jQSkT60MM+Wv
	2JlRstgVTgzEB0n7AplmdfosqUpaQ++0c1BhBQXD9VbVtOnZHINwwAiOIbzYNyqQBuBnQ9INmNB
	YqDtdtBz0Dt4Nb4ys95BXJayTuDl+rOaneNXN6Ep9iivJp39RVkcN39Dp/qjSBeXkWspw7MdW1Q
	sZS1Ji7C+CCvRSr1WJ2W7d3g8
X-Received: by 2002:a05:620a:40c4:b0:7c5:53ab:a745 with SMTP id af79cd13be357-7c9607a9524mr306224985a.36.1745574723404;
        Fri, 25 Apr 2025 02:52:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcOR5RT8Ys3lrOEeDC6ELuWjVuKpQ4U7qX2eJ0JrlAWEm5qUDXGcz5n45dHFY2oJeOok/1nw==
X-Received: by 2002:a05:620a:40c4:b0:7c5:53ab:a745 with SMTP id af79cd13be357-7c9607a9524mr306222285a.36.1745574723063;
        Fri, 25 Apr 2025 02:52:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7c99sm539164e87.218.2025.04.25.02.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:52:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:51:54 +0300
Subject: [PATCH v4 4/7] drm/msm/mdp4: use parent_data for LVDS PLL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fd-mdp4-lvds-v4-4-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1330;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5QLeLaZ4u0g3jUxOIWPZIeS25ToIY4u/0NRZi3Wj6kk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC1s5iD+ue7B/ncg0smiCdmNNJbzhQ7e2zXxwh
 CKQDUKIPP+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAtbOQAKCRCLPIo+Aiko
 1cVsB/952BXavkqHOo9fTgYGdajfI8ZXs/aaV7h12vKdVkwrLrXZPXL9YdKOWBEsnBCViNDKJz1
 Sirzb/XOt5rdGdbbG9Jrkkkl3EHLgHvvpAIuJFeOjVv28YnIr0Ik7nKELJLcU8pxyNLsIsSvHQC
 cXg9YZFkfWhqvC6M/UNgNqLj1hmh3Iy8qx6I4osKefG/0EhTWPYMk1/K/Hfff00JHQ9PNlExzay
 1poSB6PmItQqmNE+OcyvBHWJQRi6YyL4gps1DDO4CstG++o/Rk3da71KT5wnhpdKvpLd5W3Zbig
 pZ739t9ddffJrjlDV923QPmg3hLU/Ov+JyVSbN091wfkTz+9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: RJzoAX_OGWsWa1cMJiTm5ocN1Zb0iU42
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfXzQSyHa/VNkjU aAIug9nMFwi04swShLfxkHxGUyu+rsiMi2hfB9FE9ryqkYfX9w+1R8xUaZqAWFfg6zd/YPZ7ZDD Bfij3ng9kvxiThGoxEC8afpjldtsCh+N6K4pPi1aPB+QqPRGUx5NkkknSE79I+PN3dlH7rffFmd
 N2qDtNnTksobc45aHbOsvzsieopSK2ZRBDnxmrvw1oQyHkaBXaRhRltKR7LIP58JwxQrRvH0jl+ zzc4B3LNe7vJim3X0GJjpDldcA4NPsA6g5Q4BMH+UUVuPxofaGlmdFcilhpzUFC7yyTqeUIjx1W iw8lqLLM4qT0aysHNYQu4sQWbpsfM2vfksRdTWuF2/5zcMqxCKMC+8HeZitMXxmhDQVGOwne4vx
 uiauiP5qTP9mXa5jW+WzG1C1mohxVcQx3nQ/qb7lBjufD5XCljUhjCeceMc8ZfE6xxuAOOxm
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680b5b44 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9KfIv9cJTkqftt8VF2oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RJzoAX_OGWsWa1cMJiTm5ocN1Zb0iU42
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=914 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250071

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Instead of using .parent_names, use .parent_data, which binds parent
clocks by using relative names specified in DT in addition to using global
system clock names.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
index df2bbd475cc2a11da20ac07be8e757527ef41ae8..fa2c294705105f5facbf7087a9d646f710c4a7fe 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
@@ -122,14 +122,14 @@ static const struct clk_ops mpd4_lvds_pll_ops = {
 	.set_rate = mpd4_lvds_pll_set_rate,
 };
 
-static const char *mpd4_lvds_pll_parents[] = {
-	"pxo",
+static const struct clk_parent_data mpd4_lvds_pll_parents[] = {
+	{ .fw_name = "pxo", .name = "pxo", },
 };
 
 static struct clk_init_data pll_init = {
 	.name = "mpd4_lvds_pll",
 	.ops = &mpd4_lvds_pll_ops,
-	.parent_names = mpd4_lvds_pll_parents,
+	.parent_data = mpd4_lvds_pll_parents,
 	.num_parents = ARRAY_SIZE(mpd4_lvds_pll_parents),
 };
 

-- 
2.39.5


