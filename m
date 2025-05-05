Return-Path: <linux-arm-msm+bounces-56732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43207AA8A53
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 02:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D96F173421
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 00:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E816C155C83;
	Mon,  5 May 2025 00:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mo2sEw2Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4481BD9D2
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 00:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746404130; cv=none; b=R6sSOQbauaWjtWZgKWeMt043td0XWltYIIoEgmjrVymyeQTFe8ryqZdeXnb+rrwjbHEBn+bxj4fY6ZbrSo2BcFKVPdoUkYT8bzo5A7GmgiZSAJXrEsKTLLZKGof4YqsdKmS8Qm2mWkbruRgtUaCn2Dxz10IwaASe1nMDyUF/ShY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746404130; c=relaxed/simple;
	bh=bvIhvO1innwyRAbYHqCQ0x70uwNpoIP0GsrklKNFU/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VorDwdA2QWHptRLpBow3tawcB0CkjFuUvASC3PPmuAJv41jvPq2j6n165K+cPa5GpCe/YZo/Qe6V+lAqAgw1P/CbAcW3jUzm8DSy9EvJkmTmHDHiy+nXCeoMQmbFKKlf5MTjRoVYFnbQfcU431e8WvIuSFfKMcqdQgDJRhuDN30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mo2sEw2Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Mt2hg025616
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 00:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AojzG6jCxROBT7DQt2jv8yK6mPKIHDtAt836rfmBsY=; b=Mo2sEw2Z7bVvXTJd
	Okv6W6bM4rmdKV0ks2shTdfFmmSMhuz12Hv2wMT+W7FcA6GOWSik4QlGudbf9TnN
	OXnRX0xnyLtCNKx/OBZimZy3bQ55AIHZMNafJ77/xrd7uVMgqeITFveG+C2QMilC
	gd7wnO88dh6tYFO60Al6q6eELAs7Bg0yFiDDZw1EVzyAtYWP9UBZhVxPzhogi+gK
	0zmuKqMQ9vs0VUlE4bKYgGBbHODwpFHQ96ASAc3jHEEVJgfuT4PstEdZgy9t1HG2
	7sqQ/yuZiI2bmwhFAhNlqEmS9Ln3YJ3uVc68VwjnUsVOr6xfvS1KWiZpTwPeZyy7
	uey8eg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfjj5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 00:15:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5bb68b386so573576985a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 17:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746404124; x=1747008924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4AojzG6jCxROBT7DQt2jv8yK6mPKIHDtAt836rfmBsY=;
        b=QN5APwEvv8b5Z5wLyCgXvVh0OEtnV+RXLpiA2VjrqloYyew+l/UC40Yz2E9oL9Uy/J
         B4EzLJBEJllGIurxqzdxRfwO5OP+zzTS4zI4Fsc7bVdc0Wu9TlrGiz59uyDeod8o2JMF
         3weZpxkmvo5UMM33ulmjAFEGBAf40H4xYNd28YitJ2mz7xIitJq4zD71IPAqf2kmeWCi
         miyarLWU0jSUF28BXjE65uw39R9NqHLT5NUYISi1rC/CP1i00/SgZIT/dImikO26R+Vv
         0nHnopZN+zSgBtncDPhxTeHfznfURcOHfTYRETNfNSai4LfEXsZaxm5f09RtS5iDpwqO
         47EQ==
X-Gm-Message-State: AOJu0YyUDmk1SkOLhlLv0CRrZO3P/MeqK7fpyLICbDSjtKhr/LXulXhh
	9MMFiesMhfJ3PaY/DoNqbEprXIMvYzlLvgFAqY4sjKwW2WA+FPZ7xl8Qt8fu82c3upIZhN7iXse
	4KIfAT70wBNZj+MCgjo7iF46IEvi3l59aNihB22g+bgKNzjtpHl/YqGeHVgryTBnw
X-Gm-Gg: ASbGncvc2Xgd+RIts9eO9x5rKtnAVB8mlqInWdfUAv+A++QGPM958tX1jYLbuhwIp0L
	nwbFO8gxgFH/MuI3Tn+zx0K0a/M3zfGQ7rbxkzqtg1gRr+UBA9udMWtwtTPfnnygIrFhWqrRohI
	3Fj4ytMCOzpeBNJf6YsUgabeOXAOmDE7PE46CO45QI1HXfT+vhoT6tcVohTsjPy07PY4vPwmM9E
	0fhQNPr5//NfIbNIB9BNvz/t4gdV5wZJU+DnteR6ARgZ/c6V9eEu5IjrtgyOrP7kmhC4Gz9efS0
	EXXmdV4pyD8sGN1G2SMKRlcAQuic7E+6IrOwtq0sPiOgl/OlrH6icfAB08bf2a/rMR9MgWnh542
	tDlfKbZ3PoDM7dJrQC3iBXeDS
X-Received: by 2002:a05:620a:410c:b0:7c5:43c2:a907 with SMTP id af79cd13be357-7cae3aa39bcmr693001585a.26.1746404124124;
        Sun, 04 May 2025 17:15:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB8NTXM8sLgxQ5EDQiBqnHjvBehzk0c2YXdh0OUwFkg8Bd4jMJXvp8mozV1nZ8OQOYX3W3Jw==
X-Received: by 2002:a05:620a:410c:b0:7c5:43c2:a907 with SMTP id af79cd13be357-7cae3aa39bcmr692997185a.26.1746404123665;
        Sun, 04 May 2025 17:15:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 17:15:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:55 +0300
Subject: [PATCH v5 11/13] drm/msm/hdmi: expand the HDMI_CFG macro
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-11-48541f76318c@oss.qualcomm.com>
References: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
In-Reply-To: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7KB7IcHxi0VqX9I5ufq901Xoeq2I7R2imjBgnmx5DoY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4YE099AvsjXwWoLAwuWa7JorxAvWKQiHmbIEXFrqcPSa
 w+U1eZ3MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAii6o4GPpeW2a/vS/6uk9U
 Ke9z+qI9/16cupf4P1fU+l7I3hldCjkbE1ZI3j75gdlvod1S/zuJQrMyyr0XdM9KO/Tce9IBgf0
 a06rEpnGW7d71VuiiNeNS9xP+5TGf+Rca20dZK7Q7/np177vE+Wlrpi7Xl+MxtuOTW91ar/fLRf
 HJs9qmVDlT7W38Jtuus5mom6QtXrU7hGd1rjHzNiUl5/wd1Qv/tDbn/NN4fkj235TIj8IxUVnlC
 WGvGKvtnp06/cCqOWq6ebAla19Wthd33IQjn0OX3v//WiB9O4NH4dHClAmLn3QdUlXh+O6xT/LJ
 8twS1/D3JwUSpYPetP/XuPqpxHD1p7QNpfv4LZRTQ60UAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: jsw8SpiDo-5nvMpKJEFgW5d8X9WIecV_
X-Proofpoint-GUID: jsw8SpiDo-5nvMpKJEFgW5d8X9WIecV_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX2toIhko+AILc
 /i0HjKrvEg+xIuiSz1Ndbymlbh/+kU1/YFguCch44sX3nZjjvu8F+dNXZoQyRD8/IO9mjRjzih3
 mDlM95EU9R/0YqSr4wiCdX+FBHeq81O3JsdyS3et3wYEF82JDzmSuKCvi/CiN5OaBsTuVB3cClz
 sPkAAATpmMvq+35l4xJ+XD40MCUAMafB3LXU5+uRYrWD5kCqHmQT6GUXmdH6Jk2jZwp2O+WVu32
 klUgi1zAO8xB5Bbf0oohyU8RnLWaxHBxV6vLZupwMgSHggsGVeSVxyn3ICPDhsQ1AKUYTcEjBdz
 Xr7hORC4kbxYHkXoYICpcP4oDB2pJVUEsy9mCp3rpDFpz6mm0eCdRMOuWEC/FNhekIM1nRchT+E
 BTIywFZquAhJmy7Tz2gfOrsD1hnWGCe7QDlvwN6dv33vOdqkk3MVHSkK20maW9ZASgCXXJ8g
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=68180320 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=Pd00KUci3bVIrXXMz04A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050000

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Expand the HDMI_CFG() macro in HDMI config description. It has no added
value other than hiding some boilerplate declarations.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 16 ++++++++--------
 drivers/gpu/drm/msm/hdmi/hdmi.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 8e6e3e6a04bd2d86bcbd23c110f3533f56c17887..3d10fe6f8545198365a047b2f5652081703101aa 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -221,24 +221,24 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
  * The hdmi device:
  */
 
-#define HDMI_CFG(item, entry) \
-	.item ## _names = item ##_names_ ## entry, \
-	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
-
 static const char * const pwr_reg_names_8960[] = {"core-vdda"};
 static const char * const pwr_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
-		HDMI_CFG(pwr_reg, 8960),
-		HDMI_CFG(pwr_clk, 8960),
+	.pwr_reg_names = pwr_reg_names_8960,
+	.pwr_reg_cnt = ARRAY_SIZE(pwr_reg_names_8960),
+	.pwr_clk_names = pwr_clk_names_8960,
+	.pwr_clk_cnt = ARRAY_SIZE(pwr_clk_names_8960),
 };
 
 static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
 static const char * const pwr_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
+	.pwr_reg_names = pwr_reg_names_8x74,
+	.pwr_reg_cnt = ARRAY_SIZE(pwr_reg_names_8x74),
+	.pwr_clk_names = pwr_clk_names_8x74,
+	.pwr_clk_cnt = ARRAY_SIZE(pwr_clk_names_8x74),
 };
 
 static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index a28437beb1574553c1dc00a0c693b390389353e0..fb64652162b6c5e6e2fe3357b89c40e2a28aa47e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -86,7 +86,7 @@ struct hdmi_platform_config {
 	const char * const *pwr_reg_names;
 	int pwr_reg_cnt;
 
-	/* clks that need to be on for hpd: */
+	/* clks that need to be on: */
 	const char * const *pwr_clk_names;
 	int pwr_clk_cnt;
 };

-- 
2.39.5


