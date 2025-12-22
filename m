Return-Path: <linux-arm-msm+bounces-86210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E00FFCD5AE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41C0B300EDF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77EED33971E;
	Mon, 22 Dec 2025 10:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lW4H9h7j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cf/nV4RN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACB0338F54
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766399109; cv=none; b=Up6qBVZVqujzjODgMoSq5FHfAx/rNEJOIiVRFcvS8hGUMQMrpj9isGpjQ4gPENkcoTWcMdZfgZKNtePT8lkY22D8LS5Yaj/px2xpRMjY6lW5I9BzPazJXmb9yps9FTr1MKMnLB46S2LuanPhp3HedAwi+kyWNlkPt1M8KdFnADU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766399109; c=relaxed/simple;
	bh=GPNHdwwPQhx6RHo0jHkO62FjrR7S3TzTSqPLz/MSGkc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sXqP8OyW7KhpQXotn33VukPJzC0WO8Rw+eSAGBs6iP0HTjyDc+cBKUCbu4+J5osZOEqFE9XDuKYVr2WXjN4Ngz74SLD6ntQhIHb12G1k7R7XtFpKZfZf0417wG+z0Cn5bYGN3mE2grng6d4HpcN6t6Z94JsAigUbug4YF2RCgFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lW4H9h7j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cf/nV4RN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM632uM3106883
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FQG5BqsGnCi
	ZEwc/eMkHo/ya5niea9nDglgo72tq9vo=; b=lW4H9h7jjvTU7HPAwzt9JGC6fyY
	d0sQxoaKD15QBLsBwb2EIIaSWrrYDzXcC/PIPMbEjWa4ESAH0bDvn36VRWHVuIEc
	0fC+bfZcY2+/IqcVbAt0hJhohcZQrMdJKhUjVXQfzR2XRIoN8z7j/lRwyxHvHqCw
	1Xjl4njxNzFmWmRZnZ0ZKbBzzOZow4yadZyxAQPqInaN2gOzJp5jKwlIYu4ejGQA
	i8fCHRz11fVzCw2EVCpgQ0yhCbVIqRy0N8ieXv2PoMEsHPym1y9Bk8oVWzd/p5g6
	1QGswrZJSJScH+AwKYS9ziC4+LWZXfbbGP4glPo3hlytpFIgy7JEGo4l+Wg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mvfmmy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:25:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed7591799eso92347491cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766399105; x=1767003905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQG5BqsGnCiZEwc/eMkHo/ya5niea9nDglgo72tq9vo=;
        b=cf/nV4RNzAted7lyHqvHewjy67mAcAoUpkj03kIkWRggICewEodISqDCTZQnVbpWUS
         +ZHHxAfZa6q63QEOSaiIKNxcV8cUaNK+9NlIrNOyjnwgS1cVlQsBySwCAwjVgD0/EHlu
         os9NfR0JB3uLpeqw5YLfTbYFW81/QuPrDe0xyrSDF/snauEv/XGS4laKOBJ9dmhloXWZ
         o8FEXtdCJuynG5xKGC3UIQ3Z3zgep9PavYRYHHXJcv8doyNSAPa+u6pKvzR+bDO8FX09
         kXjvoW4CqOrDoAB4R3XoQWS5EeV/lDGavFZKqvg66axtY55FuZdrCByG2GBeD6O50WM+
         pZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766399105; x=1767003905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FQG5BqsGnCiZEwc/eMkHo/ya5niea9nDglgo72tq9vo=;
        b=vAehAXa7TGVtR63O43NzWZu+lMlNhcCWesLmDK1G0VhsfG4WLJA13dTrQJpXdypVMq
         u0N8qEqrKnbrKVOF9+f455L+G1fqiwO+iu2xBFZXPXSZd1S4mxtVNUcx+Wn701EDQoR3
         3zP/KyJQboEHSUE2I05pzmq3f/kTrAtYC3y00OdEascCcATPIr7CbXFHDtUEYnoTQmd9
         YyqagaEl3bg5205XAWu9xG+SsvVw6I1DnBIEtg+dtJuAChQUcNJfeKm72vNjwGVb6+nn
         5Vvpsc9oE1O2HJ5tI7K1nEbb+DaH90FuJwxNzGMrfVXHc2sEArkDIiU4kYyGWskkRQP7
         Xzug==
X-Gm-Message-State: AOJu0Yz763t0fwW1Q/Nsn6GUSIiPMyRHxfFpEPcqDcuICeWOjinnNu6s
	qnKW/7UQHHS5/Ot+PP4LMtwp1J93PIEgAczsvM7gfsUAreKtHZ3FWFncSivIOyBwdihXL5kJJoZ
	UTEqyBgPbMh9k5nsxKTL8OSDu+Sb7K89HdBwzEOLfSg1YAmz5c3MdItMvnQtZ6Ej1bxki
X-Gm-Gg: AY/fxX53yS3Mx212t+HVQYDO6ff4NsS0nQ8V9l18h54QfPYNqQCop4Us5wX9OiffxKV
	cooWbpSh7Tac4EFk8O4RqFCPMKpu3EalEldM/P2wGmrI/VTaXyo/BIPdwl6R2+uR1sokyzSPixo
	9t0/iGe1ZYRBpgaEqucmmo8Q57BFF4xe+Jmb7xPIVaSKqEIMMGVBw6hMlhBvodJIeCAcvSKEDdq
	k18xnIZbsfM3JCqz+50/c3EZEhR2SdHxDRu2Gpa8lDFU76h3/dB3lfvtU4AqL3K2JFSnVH15Ar9
	SGWtlkG+ulkcO1pJrs+9KNHDU6oHig8WRV+DcWqYMLo/QEodGZX+U9t5NtF4sh5c+gzjlr15g/c
	ahKD8CZqmiSI1N5j1zh0ArDS2lrxVPxAzOcp5tnewE0eY0boPmt21O/HsahgTk1bLJEc=
X-Received: by 2002:a05:622a:14d2:b0:4ee:739:142 with SMTP id d75a77b69052e-4f4abd9950cmr152195801cf.51.1766399104801;
        Mon, 22 Dec 2025 02:25:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHg72loQVQ3ROxbdMldRDmJqXKjwUSCWfEGLH0PRiH86vimyJapbk+lJWkciAVHhCTHfsSNcA==
X-Received: by 2002:a05:622a:14d2:b0:4ee:739:142 with SMTP id d75a77b69052e-4f4abd9950cmr152195611cf.51.1766399104312;
        Mon, 22 Dec 2025 02:25:04 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac66a1aasm72500001cf.33.2025.12.22.02.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:25:04 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 06/11] drm/msm/dsi/phy: Add support for Kaanapali
Date: Mon, 22 Dec 2025 18:23:55 +0800
Message-Id: <20251222102400.1109-7-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H8rWAuYi c=1 sm=1 tr=0 ts=69491c81 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ab5uJhi7KCXt4xzmVoQA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 3hnHW4IMOBhywkhCp8jINMJqea5CUE02
X-Proofpoint-GUID: 3hnHW4IMOBhywkhCp8jINMJqea5CUE02
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfX7uGd3rMrK7ji
 aajZ8N8pOW9XZzpqZPF/x5eyaPbDvt9SLcTkBRC03HNXWfETQEOAafUY47pmlgHOfWF0KcFy1ZG
 teApsdc6j9CwHpZZCPwB4gGpjfMmKDldcALkj+5GM1Jhyl+unz6upH27WTACSeUBbKoIEWUZ/9F
 7HrrVahgh1s54Jy4LywBxPR95vUaCVWinIv71k4+kmmYn21qsVX1+4hSZFVjjRl/ZUQeV2yWuW7
 4VDwMHVCekyb1QnM4vkA+xcdyog92BVb+j5ZzK2Y+nHskyEkAloNn71Tltq0X+pXY3dGZd6zSR+
 2vB0BymqProvCaJfU/2OhD0QW1tPpEsKupGbkWHKcfm3TeJ6yUqpXmu6hS5mHhcbxbRA9CUyEiV
 dc6gHij+OU/EjGzZXphUGjVjAR7DeXqt5FQNkwFTR0QU7Ljhc8DXz6xxxbzaGOPwYYvS3cmsOK0
 4T8h/RJURT87W0I7aYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220094

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DSI PHY support for the Kaanapali platform, Kaanapali introduce
addition of DSI2/DSI2_phy compared to SM8650. However, based on the
HPG diagram, only DSI0_phy and DSI1_phy works.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 4ea681130dba..7937266de1d2 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -577,6 +577,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_4nm_8650_cfgs },
 	{ .compatible = "qcom,sm8750-dsi-phy-3nm",
 	  .data = &dsi_phy_3nm_8750_cfgs },
+	{ .compatible = "qcom,kaanapali-dsi-phy-3nm",
+	  .data = &dsi_phy_3nm_kaanapali_cfgs },
 #endif
 	{}
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 3cbf08231492..c01784ca38ed 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -64,6 +64,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_3nm_kaanapali_cfgs;
 
 struct msm_dsi_dphy_timing {
 	u32 clk_zero;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index c5e1d2016bcc..8cb0db3a9880 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1504,3 +1504,26 @@ const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs = {
 	.num_dsi_phy = 2,
 	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_3nm_kaanapali_cfgs = {
+	.has_phy_lane = true,
+	.regulator_data = dsi_phy_7nm_98000uA_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_98000uA_regulators),
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.pll_init = dsi_pll_7nm_init,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
+	},
+	.min_pll_rate = 600000000UL,
+#ifdef CONFIG_64BIT
+	.max_pll_rate = 5000000000UL,
+#else
+	.max_pll_rate = ULONG_MAX,
+#endif
+	.io_start = { 0x9ac1000, 0x9ac4000 },
+	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
+};
-- 
2.34.1


