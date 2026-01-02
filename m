Return-Path: <linux-arm-msm+bounces-87248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EB2CEEA0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 14:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B7683015D3D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 13:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F065E31DD96;
	Fri,  2 Jan 2026 12:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CCIzaNAk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VmXsHfE9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA8C31B832
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 12:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358239; cv=none; b=SknL5mem6Xsir9JB38fYANQrmxujNGh4Yk1l4EzGXY5yzDYN456ttBsZhTNGZwU87Rn3izaOr+Pmz962zSkSh09jiN85b4H8rkuKH1lnZngaL9B/RHIwJNy6a6T/O7tRd1UK1KEOvRY5SYWDy3V8vfEZK3sClPDR/DdL1o/K8B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358239; c=relaxed/simple;
	bh=L5mPpkKO4ljRUS48r8o9ogYKNB6v9jDL+jvK6L4cQxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hq9x9cDefFhOReAlvZw/brRO/CrWwl0cf/l7A1e0YU4Lta0yFtab6mnjGP25l4CNUaEynVePwVugdrcPGJMc9g225FXslzIratsh9k786g2yk2DAt/8fmpilGW/2EWg3fIi6JLgyLUiC3joi39RRgv+A//YhuKUKLiOPFLYHNy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CCIzaNAk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VmXsHfE9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W2Ml426884
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 12:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Rw9cR7Ugnzn
	RgTLA61pO/jv9aIEOUeA5X2lpjfRbukE=; b=CCIzaNAk4aKy5RKneBlsANQYbM9
	GSLsbcAgZJSVPTziA/4aDpdAOtUHiva/4q1lkZrYnuxKWF8qduJmmsI7mJXgZbmP
	eKS9VulIZnKtSH1PxtXVpYsZ+pPBuVLw35DPmmgQUQeod/zRDqQNnGrYYVFLjPP7
	9ITQFNVUFBfWZGs9vsyAj813KqPSxf4vst4HR5QR4bhJDRpi/Ir9Bkpe8zE8uHFo
	lSpLtiIQNZKK6uemEEu3bnlLnqosZpXH40HENHmnHtb975Hg6YcxJmR7r0bcwMfz
	2Xv7LqN+ZmgB4K9q9SX7EO/1oD5CTzrWroSa6sHK4mNoUuHo/GCrPX7hEAg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be6fjrxsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 12:50:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso478151811cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 04:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358237; x=1767963037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rw9cR7UgnznRgTLA61pO/jv9aIEOUeA5X2lpjfRbukE=;
        b=VmXsHfE9B5Vi1aWmpkKoBdkuzb+qLKCvAR3ujRrCb2rbzVi0QeAYQQiXb3DdT1vKjO
         MOxYdjR8v3O+1Fdw+eCeNv4okppQqy1C4xdPAkhEFhn/NthWpSr+3DqY3Wsb0GqyPGxT
         RYih9kPVsRMUIiZkYwCrt68wq2QZYmUBzKZlsG2GmGatXcrs8nfIzlziOhoc/9WDjD2Y
         Rm7CgynW/uzrelWuJShSvSkNV7YDuQ6bD4Kgm74xU/Gt0MDj4cSpoU1JVn030IZNPyBY
         9fc/9NhqTNvGzYwrK1QaHWwFzirk+UbvysXtD4lfGYHxwS6/jN4TqAXucoWetUvwB6MT
         n3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358237; x=1767963037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rw9cR7UgnznRgTLA61pO/jv9aIEOUeA5X2lpjfRbukE=;
        b=nkvaYLSUZmSBuWddUsCt5gjgnoUnPfmZ7w9k2A9ZEX/TUkGDFLRYRbiPLphKGKiNEZ
         z4NrmNZon0AXIrW7maVMryff14CObfx5UII2ryJZl7YibNluLUEl74jIRDLsyGj93sEF
         h2qdOSDJEHZcujaBrnY+zdU/ZEtE+mDp50+uzUD2DOQDv+IYJfSiugO3EtMo2lB6PAZI
         RTx00vH6X8oP1uqxRNqEW6A3DBKb17NaYZ6g3H/pSi4b6Hi96GwLgRhFtGJKwhKFvWzi
         l0mJGBfxjjBGNrR9bYLtlnRcW+Jeffwm7oX4amVTy4CEmeBCzQookGnrw+dZE1nBTE6N
         /bkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIaqt0aJe0t9brDTYBp4vdyQClBbeKzgPVZLMS3Qjt0tGnvmpZWDn00D2MKD88VeSCawbneIqzFh7RO1Gb@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmgz36sRzNkxbbNGkeYiOF0k+u4LIAeBX2kna4Z0/06fjcWFhW
	JifgT7TOGTS3iGMHMKQXSIghFLMFN2BZ0AtSvE7f1o61vaHFVDADlFHnSwc6UT7pvgAwezop/6c
	iD4ydF8EBRyHsKjKuElSnaQOFSmTEh2a9ZE7wKWu2yQcVKnJKNl1Ox8zvdpckjULLBtR6
X-Gm-Gg: AY/fxX79l3TFgkim9wLwVgONoyTO5CaYRyOhL7TXa0eI34WI7qPhoOUd3JASgJiquMk
	soeGRB7nmBPAk3rRf50JOD8eBLBPRBoX71BdxOU2Sdl7JpELHrb1rAHYUFZt01SHa1/d4gO8kkM
	hkgkDYatqREXpp0k14v/6omGV+NsFTowoBGkGi3JjsKLO8MpKqE0Hl+XUPqBKDMhwOyy4b0UGIQ
	0OC3uFFe1nSUeKipqwSeJdhXz2oxWqCvRr/ZHuVRo9+ba4eBxl+sKwsdqXoaGB2xKjs/GBAq3Ke
	JYWGjdqgevA/GdzTGJeU4c5Xxaox5zhhttXY865GCWQxGqjpVJ/VDwKbHTR6V7eqnEfdM/CJWYP
	MCQHve9w+aAkIJG9bBOZrCGaa9Q==
X-Received: by 2002:a05:622a:59ca:b0:4ed:bad6:9fac with SMTP id d75a77b69052e-4f4abcb884cmr674846811cf.1.1767358236839;
        Fri, 02 Jan 2026 04:50:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIWw0MdhBU4+og+j+xA5tAQD4PqhfRubUFGra/1emxWwHiSIQQApB/teNuq8Qqq8FHeEdaMg==
X-Received: by 2002:a05:622a:59ca:b0:4ed:bad6:9fac with SMTP id d75a77b69052e-4f4abcb884cmr674846521cf.1.1767358236453;
        Fri, 02 Jan 2026 04:50:36 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346dfcsm889545645e9.1.2026.01.02.04.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:50:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] bus: stm32_firewall: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:50:32 +0100
Message-ID: <20260102125030.65186-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=L5mPpkKO4ljRUS48r8o9ogYKNB6v9jDL+jvK6L4cQxw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV78XkJFsI1Cuiz5O917DM2/TgG4Rk+GqB/JPx
 xxyk2caXiuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe/FwAKCRDBN2bmhouD
 19m6D/9/zEO8ErTsO0Wudvym4arS7jvOcS6OLAk77qgDltEerEIEgGErwPOa6Q4iMx7Rlz258eI
 fulIXk82K++uNIIaFat9XX+sgOEfQdwXe1pqog5wQw6RsfNN2FxBAY8uZbJoGgZ4ZOSASTVxr6q
 gMtOC99bGKJw02q39eWNf3ESa2KldfxXycQ1m6BAv3nhj6Q0OMD4Ni4kpWX35rx5+S9JVWoNfqH
 P9cZ4lz23L6H0FauHMx0ytSWr0M2yjp8RWUDuXzqzltcpvUVBm6IHn9+EER4oeHOYn7dPVKgl3v
 xPOT6uVsIdLCGqK3d3Du5U25tUe6aJGSIgW6IQ9g1udMR8GKlJohMJUyTGhmxPohHWpQlBcsDpG
 424aK0KfHT0RRxfuxT2ldH/G4VErYRqmHZ6pSoTSCnoTo1QNDfoy6l4uC+4jqUjJzVKX2f5xCo1
 AsyG1kWMmwv4zmCQCnVIh1Va8p6G0KpJDdYSCfRzVLXu77Bj12BVISP+OxXr+NGJTI14G3e8nYC
 FIHYbq7glAX2LoPaoe1HrRZLURitlsYRmYZIr+rH1Ycx1Abfoc9lw6Dpzd8n17nBuEeJslg2sVH
 nKIXmR6ElsRnJ0Uy6MoWkhlP32kNlseHr11Vfoi7aRsxEko6PAtD4UrY/QcrpElBVwomm+BMv3F biCuEpDVgSvzbKA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Av7jHe9P c=1 sm=1 tr=0 ts=6957bf1d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=r8ysD5ROA9t2CGWeXHcA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: i-p-762kjBLFAVxO5fKYmtTTlx2qtKek
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExNCBTYWx0ZWRfXyuxoOSGCQCnF
 r4NiQAeW9Ro4VQegwH77+cXppmwYrIQweGCbbvWyIAgCYFjdTFeQch9F/aRiOTkj2sGMHD3UMPa
 HZNSOadJyB7hIMIgQb5YS+xwrnSV0Ez/+TpA+K8X8RRYOzLyitoTnaMIDrocI7GjTwTE1G1CC2Q
 USA7uChjN6S5Z6uGlk8h9qmHUELXlgD9mGdjJGMGPgQfm3mDlFneIY1Sb3lVBFpt52x4Nf+uAv8
 JX3x1JdlPS44OQydSmCWbE6waa11JSGLT2LWocU7P+Tu35wMOi6I7+O9WW8WXtFO4ZioTq0mHwc
 IFjyYsog1p30U0J7xyvm60b3CIXPpOMBf/RHcEyCVGQG3ZFYztV3LBYt540pFGFg5KRYeBQQcmn
 erot5c2ilhjAYfxTfqkKGTxePnX/IyDsRbq7zoUxwicqOuasApAe3delPZEqbxKvOYyL6Nh1qP0
 QBdeCv0IiAz6dmRPGKA==
X-Proofpoint-GUID: i-p-762kjBLFAVxO5fKYmtTTlx2qtKek
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020114

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/bus/stm32_firewall.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index 2fc9761dadec..fae881cea9a0 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -241,7 +241,6 @@ EXPORT_SYMBOL_GPL(stm32_firewall_controller_unregister);
 int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
 {
 	struct stm32_firewall *firewalls;
-	struct device_node *child;
 	struct device *parent;
 	unsigned int i;
 	int len;
@@ -251,25 +250,20 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
 
 	dev_dbg(parent, "Populating %s system bus\n", dev_name(firewall_controller->dev));
 
-	for_each_available_child_of_node(dev_of_node(parent), child) {
+	for_each_available_child_of_node_scoped(dev_of_node(parent), child) {
 		/* The access-controllers property is mandatory for firewall bus devices */
 		len = of_count_phandle_with_args(child, "access-controllers",
 						 "#access-controller-cells");
-		if (len <= 0) {
-			of_node_put(child);
+		if (len <= 0)
 			return -EINVAL;
-		}
 
 		firewalls = kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
-		if (!firewalls) {
-			of_node_put(child);
+		if (!firewalls)
 			return -ENOMEM;
-		}
 
 		err = stm32_firewall_get_firewall(child, firewalls, (unsigned int)len);
 		if (err) {
 			kfree(firewalls);
-			of_node_put(child);
 			return err;
 		}
 
-- 
2.51.0


