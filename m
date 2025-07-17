Return-Path: <linux-arm-msm+bounces-65560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D34B097E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 01:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCA8A17F896
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 23:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57CA227F4E7;
	Thu, 17 Jul 2025 23:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hJ6yAY0O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BFD279DAF
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 23:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752794939; cv=none; b=uN2K/TwJUutzD8SrqIqLdt/4H1csSbbsDm3D4SYYc1rkgS594ErkYmLxezJ/hNBs76VmfD0wiA5JAvMZxYPH/hyiwTegD8EuhGhxG9Ay5FEzNicCaBLB91X0B67HLtc890gbDpRzDzbuacN7Hvq3gJws4Xkk2J5kEPqfHSy75VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752794939; c=relaxed/simple;
	bh=O2cCbqOAEvqsb54sdTypVBT8GhswTdQfTJ7kSW24Q7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OKegIJV83Hr6Oe5S/PUM9JzuzXGE/5IazNANTYS/kXY6eYwbi8o+L4Lkl7kvfM5AANTbbU22HsqKeKEKkIVBMmpZOOEli65jEa4wB70/DnPiHNn/PdLv84HIBYOKq76Sqx7pnfuH7eYD/fZ5Y/WuNumw9pip57JsqUctGagflZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hJ6yAY0O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HLjNMh028066
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 23:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWByVXuqTAYkmR6e95nPijhHkyi6G8c8w9KcZupqunI=; b=hJ6yAY0O14NAP0SA
	OD7RIk1xgMFCFV0Waxc6glqINKfqNrshKx7X0m+j1IhGZTgu4SKIcyaO88U3fK93
	N/RKgxJxcUmMYorqd+tANjfAmIXX2xtm3ZsKQ4OGannWCaKJIFYdvWfJbaRlo4XE
	3hGm948gTzjskqC0wBuUGVM432JOTHdn510OiakPXvjx5QkFPic9x1vCooGbZUQ7
	f6/1yaSjf24JUbcCnCXhx0yq9e+s2KCzPX+ViaqgfGrJLEyP/8erLk3wZn5xF/R0
	KKRazVs+JRI6XJEmg2toHA2p/Lk/xI+DYUvClM/8Ri8L5sG3TbDtvgmo3tj3Yl+0
	e6vusA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh61q11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 23:28:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2356ce55d33so23726725ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 16:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752794935; x=1753399735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWByVXuqTAYkmR6e95nPijhHkyi6G8c8w9KcZupqunI=;
        b=hhUlISLvqFQqFDZ5gPWQPe6a4ZhY5h0WOFb7dBUL1FiJcuE3zIImYV62IqZFqnUoIV
         v9ENDd4HI+SK4bvZx0kdGVhv7D22fnPlv7rPbC8zXQrU0v87QYdJxMb9F7uQb/UsEoQY
         rbPtpsZ1f+j++xE+mR3mO9ao9Wl9BEoaX5HvKxQ0WHlGn75hyGRjljt+MyqmxBAN38qx
         UZRHR7XVF1uKINZgmhP8VwKKjAJBTCeddfZcd9hNmX6rVlp5Zb8LGbO7sk5jiWMX+Tlv
         8BMIeH4UPmO/mq8D9QVWgZsMHp8NBvuBqVTB5Qa9M+hGFuU9iEN9Q0wKl4Cq2AtdEm6Y
         oORw==
X-Forwarded-Encrypted: i=1; AJvYcCWTI0ywtuy3eCflox4KOBbOuSP6Kc4yNJAIjdkN4yDfQ4dCL8Ypt9VtR5qQkCmxDAKms1DAGOW8zTGjgVQX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb1bcgV0jctFMyGESTJxEL2TO8PAqo7OLfXo4eYTL7CWSv9KMa
	RsWd33siZ6mCuW3RvTUpp/gKG7/C5SSExrGGQqptd1KNtFGQLxfQ1ut2ibp8pR8k5f2jzMaZzRV
	XlkTtQVXZhk7Iaa/h6yNcaRDCRJIRuSaNlF4J7VHUtmC+k30i08K9nZdm6qU3r5CrBA1g
X-Gm-Gg: ASbGncvwKhaIwjiEM1T4IyUvvyElshzF6fymtpoGNCF7YRY0Xq0HuWacHl5Tr0Zmfe7
	t3k3aH3W9Ck+7K3NYCYDEchEm0CaY2jgAsnTE1qX+zTY0fgs4WB+b6kRM4DEs67+gqPTMjUlRQu
	hTiwffTdKtqya2uEArnrjW+d6UhynVwojsyDlSPU7EZ5Av1bCXuEKLwlFiWL9QD6qdF2ivsvAAd
	JT9HxtZliwnyKRcy1WLG1YHD61kxwOb4pMWVNVSHsGMNOE8j7eXDyW1zaM70TtSk3S0Qo0w1ARU
	ttqogQBq/vbHdY2NIb/GVBtvLOzKug79kKxMNxFZ5b1KlwuO/QOvgmdrHfmxaru3+I0+3+goyJP
	bGZBc8JbLqv7JkdqPvdxv2M05
X-Received: by 2002:a17:903:288:b0:235:ed01:18cd with SMTP id d9443c01a7336-23e3035f782mr80881135ad.44.1752794934705;
        Thu, 17 Jul 2025 16:28:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHy7EY+GZlHPcNHVs1AkXZZ2eIbMpFdFBa4h83G1a5pVhnBvbRDWLwMJEYWXJSA5sRyT8Jqsg==
X-Received: by 2002:a17:903:288:b0:235:ed01:18cd with SMTP id d9443c01a7336-23e3035f782mr80880715ad.44.1752794934261;
        Thu, 17 Jul 2025 16:28:54 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e3cb7sm2002195ad.17.2025.07.17.16.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 16:28:53 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 16:28:44 -0700
Subject: [PATCH v3 2/5] dt-bindings: clock: Add SC7280 DISPCC DP pixel 1
 clock binding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-dp_mst_bindings-v3-2-72ce08285703@oss.qualcomm.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
In-Reply-To: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Danila Tikhonov <danila@jiaxyga.com>,
        cros-qcom-dts-watchers@chromium.org,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752794927; l=911;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=sZ2y2IyaYhBO6AuOxdT0mFWtWBLRRO6rCaMc6lj8Ipw=;
 b=JIQEhhSfOyDoyV7zPgQsd3A3ppzobltB2q4r0El3ARcu9XmGhKVnrWAmOUE30VXrx8yJGe0zd
 e/IkHZCE9atCpqRREuhMprBnDp3dtKBR9yS3h9V0DD0pruyJh5ZbmIW
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=68798738 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HZRYMJrZkReahVkyUwcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LKfyZf-DmrOiyxyITY4t5hqP8rYTbiH2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDIwNiBTYWx0ZWRfX6TUpZk4+GFbR
 nAMs0m4xSohVFPJ6GctMeroJNJI3/vguveXvjiNpIuiDtR/DKtBY5YV+NMKZzRr6EORVxqfJRve
 zBCpLhFTxkxUFKnetYzIzN9UZj/T3FuIXsOg0Dogq6CBqQU16b7fKk/UkzFSPVRnFhwaHIM2pVo
 8xupSsRxmhs5Z5o1NXGxJSsPMHFtmWer0Pe8OE8mDAaS64bFNGxmRo+QOEvYOGLmU5iEOtN63Ah
 iT6V0P33C19n6v5dIjmoRSZeYG44t52kGbAcsVO5wH2VN36b1qodHUAliOyV/DmFyym9+/rQGMR
 jsqHajtnOuo+WrIUopF+1RLWHY5vXjg4LNHnK0ayfpbl9q50B4jVV2A8gC6xYWgHWv4K7T+hTD1
 WDKPxWsPCBcBcnkLVtatfDRO1IJ4ZZLp/2+ZFwunIDRn8mrrQ9srtRVVmN25lni3JYBBJsog
X-Proofpoint-ORIG-GUID: LKfyZf-DmrOiyxyITY4t5hqP8rYTbiH2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=880 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170206

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add DISP_CC_MDSS_DP_PIXEL1_* macros for SC7280

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Acked-by: "Rob Herring (Arm)" <robh@kernel.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,dispcc-sc7280.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,dispcc-sc7280.h b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
index a4a692c20acf..25f736629593 100644
--- a/include/dt-bindings/clock/qcom,dispcc-sc7280.h
+++ b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
@@ -48,6 +48,8 @@
 #define DISP_CC_MDSS_VSYNC_CLK_SRC			38
 #define DISP_CC_SLEEP_CLK				39
 #define DISP_CC_XO_CLK					40
+#define DISP_CC_MDSS_DP_PIXEL1_CLK                      41
+#define DISP_CC_MDSS_DP_PIXEL1_CLK_SRC                  42
 
 /* DISP_CC power domains */
 #define DISP_CC_MDSS_CORE_GDSC				0

-- 
2.50.1


