Return-Path: <linux-arm-msm+bounces-87247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A12F1CEE9F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 14:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFF5830230D2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 13:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE68E31D380;
	Fri,  2 Jan 2026 12:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kO+kmW0l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fdgi9H9k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CBD31D36A
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 12:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358238; cv=none; b=E0uholHNQTbJfIhaaNJbF6J1RTrySFTKwguX8CbJWqariKZ2AKj/x811tlSnDEcJ9yfyMt5A/TzfYGAebjeYvyakBjyATvReAcsxYgdx+5PJZw4DxrymAF2ulpFrimFeP0ePg11K2JWYNc3Y8SH/7ehTxN8DSiDuSEFhIfDYtgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358238; c=relaxed/simple;
	bh=6VNzNxSib1wkBf9CiN0oOnbkb/ZpPRHIUAnKhtVhq3I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lQ4BS8xdQcMl7hc+UXMj/yzLo0i14mxFPHKYaiAYQ+4lxwMWESUs++nii9Hs9x15uJVeIIPLFfa67OKTP9ZNmZ5IfvwySoUIyIL8S8Vt3UoEqQkZnW4w2knYPC70uVvShqt7FrzWicBVFhFeDS2RxxXbrk/EYSmC89TtPU+BvdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kO+kmW0l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fdgi9H9k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029VviF504457
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 12:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Fp4+mJVKTQoSMQr4XwZyr06u9mVCIY8JRYJ
	cNq2XkTM=; b=kO+kmW0lNVd26lRH7eeO4vrCFpMkm3VdsG9TrpFeOIvLVYvXuLj
	lW78omeY+VGMmXCl3udEvj7JxFgTF9SI19bI4ItSgjLhRwFGNTuGwi7HtbodoZ96
	+gzAf72tSTeMbQvHUpign1x9gks310k89xww7rxTkoxyjsl1o6wTuBXkF+HT9lr2
	AOwCIzIT1OfC0pa50poVtLO034BCSlVovXiOlh0OBZ9NB17GOklwd5tzbLfiv7f0
	/0rXR9u3mn7jCHAfIVpjW5dUUf4VYODx+XgMd96uaWtCkD3zqkQtU0Rm+iXlGM1v
	bt7684Ls6CGWyClSF0StNBSWmlS6kNQbb/Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be8bk8qkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 12:50:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee04f4c632so238209671cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 04:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358235; x=1767963035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fp4+mJVKTQoSMQr4XwZyr06u9mVCIY8JRYJcNq2XkTM=;
        b=fdgi9H9kC0Co2FqSkVX7SAIY1su8monl3RAHh9Wmr9evHd/o2EA+IjmQX4sj/H6AFq
         KICUW762NDFRx/IDszWLvZBpdxsLBdb2bllGR/213ihLh7FohnJ/WmnwyKIx5VE+3WD3
         XADImSiry96QJj0SlSyBgRR+FAsZiBPgEMmHneUttid8MDPAbweKKdQUaAoL5bZt3STV
         CAzTstAcASDkejfyHncp9yPRWIwo3LzrsVRuQ5ZKCgcANIlbHmAgYBdB4dsWMesml7t/
         hxRJBqbYfbE1d8tVwoPdsKqv1PQYPsFgSQrb5c1LWl9FXllvhkV+OyCKvZ/vTwOFIsCD
         GO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358236; x=1767963036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fp4+mJVKTQoSMQr4XwZyr06u9mVCIY8JRYJcNq2XkTM=;
        b=ltEfFFO4+aGw3V+9l8zKoJqVurSFPFaf23vAHaO8F5EleGCbI8MgFlCwfgbr+ZOQHh
         6kLDrKTY+KI3OigDlvIdGssy6XK6BqVJdtgPQVLwSj2vc1sxALR4FOQTJYofHljw5AGv
         PBKZc21sW3G5kOQNb7Pe0Y6mQ9MfrQs3lEfKIxNJwJIINTDAf68LzjdAuWT//KoweoUt
         qOy9k5Axxyl5LJpCAqRR9+Ey1fma3FlLiiFs+6wMvIr8TCVlf/He/ZBdl5ijuvx7B2Hp
         h7J6lQ+oEjhXjK/6+wGtEqq6hGgzgT7b7R68YGePjARFd001yApKg0YSMNzPmG/1pDXy
         miUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr2iPe2MtImKWVf29MmZTlV5WC7oH1yMotDdLP88KQddVsWVWJo0K7ontPBHk+Y5B4ZCcjpE/mFPxQxkFb@vger.kernel.org
X-Gm-Message-State: AOJu0YyBvwGfAmP1BoHyHiGsD7OyCY6Drog3h1tCwQQF0+xWYp3cU2SE
	4kJEaRhay3PXRlOSQgOyyrh8O/IaZAGCjQjeP6y9+mSZTXRhmQ5+l/VclONBFoi2QhV+IaW0knS
	dmgFqHNdCIhMJOXtlSghhVkxMfsnd9NlPHtUN4yUQ1HqL17X48preTbZ9DLFHsDItXSv2
X-Gm-Gg: AY/fxX4URQeFBs0szrZFY6uz1CvGOjhhrUn23ZEGYV5NMC1958a+ecgHBB76WvaIpuH
	IqD1UglLIxwd31Hz58dZGBHmSnDl3UfdauQ1h5ZGV2CdOlvMc7qI+pzalqZwGsUdvnIPChzTlay
	fYQDQADn8Dj6bZLXZs0zgJNFFnAMZjrxQGHgLLaljEoYKz+cwhRBgrIqcOSaKbJCFGImwhvEmkK
	aXTYjEW23RdU0h/be/lJkOvYaTrqspsPqDMFhnf6Pj0B4OovqZSOAAbCT/dm29+bGYjINzP8q9Q
	ufMHO7Byy5/rioQoKLJZCQp2ctebwRYNazAD8KvueEven5T4oBhniPyj0bTKiYM7vml48hU5J0B
	DESd3c14kEPdbVjbK+jLq8jlkzA==
X-Received: by 2002:a05:622a:ca:b0:4ee:219e:e7b with SMTP id d75a77b69052e-4f4abdc6496mr664749141cf.77.1767358235604;
        Fri, 02 Jan 2026 04:50:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhOqJewLADG+gjoDRNMsJwaKZguNA2D1Z8aonmvGmrKk0faqGUMW/pOTGdomDowabAEFPXCA==
X-Received: by 2002:a05:622a:ca:b0:4ee:219e:e7b with SMTP id d75a77b69052e-4f4abdc6496mr664748851cf.77.1767358235199;
        Fri, 02 Jan 2026 04:50:35 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346dfcsm889545645e9.1.2026.01.02.04.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:50:34 -0800 (PST)
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
Subject: [PATCH 1/2] bus: qcom-ebi2: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:50:31 +0100
Message-ID: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=6VNzNxSib1wkBf9CiN0oOnbkb/ZpPRHIUAnKhtVhq3I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV78WJWOEQE1RlvmbLpGIzhsW70lWCb8Rfye3o
 cP203mpqqGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe/FgAKCRDBN2bmhouD
 11byD/46+NpegSknbhVdWe6q9ZcMwNzNNur4ERtJXs14JROinZOMIGkhhv0sG9IZmwuFjWvGjdX
 S8kM8GTYRxFbzvUwmjAgR2RpduZqOD4jXHXwB3p4Tl2oMBx36m3OP7yYjBs1Il7aNV1yOXFKwwK
 fckUpCVI9NxXQULZsYYVRiYkW7psB1LNwkgfaREvum03RSIFNOjOJWize2DF0lYOSAxyEhbCjEQ
 Rt1H6kJkXViUjlFxuuf32zsOI0oq8R4eW3V8N4iQ5dyVDRKrY3gqbo4SkT6srAxmjRRGFEgj3xn
 xTACmyMpsWVZ6vTzOenAV3it3qthTezkP/yZoaYywXFENtjLjhUvSnUXNppCTl9wcS1jqRo3cGW
 WL138RTvLXFsx/3u3Z39JmS83Euo/RgVVCnl1n3TmDzViTVYzwud4lGFOfYWvbOWRFimk0UaTGo
 gA6MwU2AbvHlixvLu0BvDhgS9jjep2su0U3VZfCFacbjPVzu/mX3Ek6JhPkJjXz44oK85ZY67yY
 qM+5bKnejU3CM7UiLcpATMhuRRpRUQvyIaU2faZ3/fz+xoSnfPVFRP2vRGlKH8sMEkQtaxS/X7Y
 /5qVLKkAB8FpEHky5pIVexTNZRVfJJlq90oWAlWai6mNQmTh62A6g9xM5hsRUY1cApwJCKgfTiK tSpbAD/9s3EJb/w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExNCBTYWx0ZWRfX7UwQWT3oqVZm
 2no2ZnaNjAmyAnF0clA3CF5LuwGwJxRkc8cirxxi79Mpoapdhi+ntGbSscCLEigrgpl0QJZkeTb
 UHeCnffPc7BJYIs8sZVEdxUBwFuL90ivFymHCN0IgDyedGnFcNzsBxqbx6fA3HKKQKXKACwfsC3
 4LW9REQcgdq4K6LZUyvgfWpBET5IAZfojOhvhv4lhHmk6wKPGOwm8n6puYaeh24bG6+KPCpowvu
 yu/6fCXIhqK3B8x9HeoJ2lG6t7pZ+BG0dtDMpo+Hgw/FDN3TwmOKCpl883Ocpk/jtnWzEVRKu89
 QpHRuMhC/a7adBemHA5C7KtGfSK79Z8MBHyYdYNiP27QCh9nUlM6m1VUnAGLI02+Km2mKrVtdYC
 d4SvMPnyHSKd3c9TaMhuPiHH3vmZiwI1/TSYUw0T2BJBi5iEy5q/WrDqLqh40Ij49/24k1rkFt8
 JvdMFccusfZnLIK991w==
X-Proofpoint-ORIG-GUID: JjfdaO8Vqa55aU0y7k2fwkln6uT6_lp4
X-Authority-Analysis: v=2.4 cv=d5/4CBjE c=1 sm=1 tr=0 ts=6957bf1c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mc1TC-L5zOEaToRhIlkA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: JjfdaO8Vqa55aU0y7k2fwkln6uT6_lp4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020114

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/bus/qcom-ebi2.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/qcom-ebi2.c b/drivers/bus/qcom-ebi2.c
index c1fef1b4bd89..be8166565e7c 100644
--- a/drivers/bus/qcom-ebi2.c
+++ b/drivers/bus/qcom-ebi2.c
@@ -292,7 +292,6 @@ static void qcom_ebi2_setup_chipselect(struct device_node *np,
 static int qcom_ebi2_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct device_node *child;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	void __iomem *ebi2_base;
@@ -348,15 +347,13 @@ static int qcom_ebi2_probe(struct platform_device *pdev)
 	writel(val, ebi2_base);
 
 	/* Walk over the child nodes and see what chipselects we use */
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		u32 csindex;
 
 		/* Figure out the chipselect */
 		ret = of_property_read_u32(child, "reg", &csindex);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 
 		if (csindex > 5) {
 			dev_err(dev,
-- 
2.51.0


