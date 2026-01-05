Return-Path: <linux-arm-msm+bounces-87505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1801CCF45C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 16:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A551630D8AEA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 15:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B4F2E54BB;
	Mon,  5 Jan 2026 14:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rcx6WHlL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O1FpRnBR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8012D9782
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 14:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767623833; cv=none; b=SSoRzWl9UCusFFaEU6KioPVk1Az73nTSExixvSeDQX0inU1rlWvxluSiqBuiIXVNh7g7vzIR+O1uczdQboMBI5UPR1311uok1lSPLTuPGDQLF++2XeHek0KNY5xO/uLqE10PopUitZCVBM7joKGFF2jP5fIp+mgQ+CVXMUesIg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767623833; c=relaxed/simple;
	bh=VWNI1jRoAcOtzMgRiNIx1nsy6FziB+nBMqILT49pY5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQfmAlFKDwSV05Id/iXlFWv0BAW+s2c3dHnefLq9sY21PUxcmEm+w9yetw44pwGwTSTCnmlvVEnXzd48F446dpncdGmSA4xK/+Dr54llb4ci12xAHRcJRlQvv0IwgxZ/tcFUEZoobjl25Js4kR26p8UTSVmynCAiYfmUSCrNk2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rcx6WHlL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O1FpRnBR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605CntvJ4032720
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 14:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HyfuLivv0oj
	zm7fZ5quMbz8PiyW8n+OAjsdu0D9Zt9c=; b=Rcx6WHlLnRR87CBh5EhFWBW75OE
	hmPh+MPavnUj8b+0ECUAp485HnYgKFOCE0fz2m6gd3I8kExjEq+y1J102K4z3d0Z
	7K+BEW0LL4fHTgez3ybN+uNxK5TiLmwSHfb7v+JJHGfVgM1YkFnQLTHYkUGgsvGJ
	XFIQRbxNsEFNVYqlokBbkL995BfNFOWHgx67paQlFo8j/teUdrlqSi8IZRyQAeG8
	fG7Y24iIimysv/Z1IX6spvynCVciFhN/9S8eQDdM/DKjchyeeqk6JO1EFihdr8FZ
	vYmVGGnoVUPhP54NzFZPuh4teJExyXE66GuFfw5nZqjnGkiw8q9Qih1WD9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg79nhfm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 14:37:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b22d590227so1612631285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 06:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767623829; x=1768228629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HyfuLivv0ojzm7fZ5quMbz8PiyW8n+OAjsdu0D9Zt9c=;
        b=O1FpRnBRS4HI1iRzUuW/hRUB0sBEiLiVOJ7JIWM+qV/aLcj9NZbLhsAFm/wxnMQ7Sj
         iZveQtKy262n9zPde+TQlHLcI1+C8qbqfjXKvqpj2nakFLYvaTXYB3gXtbOrf7pUGFwp
         KLgpLXGQYdsvaV/ZfcpJIm6tbUrTGEpId6CC+eBM6qRmDgzaWQwiH8yYoQsEkD68Xld7
         6F3TjRF5vTRy9XhCEBNS7YCc3cN7PgdP07zenx6c5TQf5bT9fYN2sP6NVCbw9ng+ypki
         maUVziZcWM0PpmOwrHHEgJYsAJWpmxmFaFrrKUEeQQpAQ8+JXDRyYDHwFceUw6xspU/q
         QgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767623829; x=1768228629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HyfuLivv0ojzm7fZ5quMbz8PiyW8n+OAjsdu0D9Zt9c=;
        b=nmfB+mTVFTTfiR7Q8YZud1CtNTwNnjA84pbXyLgnTfXnFccdlvk5i7AA/mFWo5l+um
         JSaHJKjvyM6AIpcGVwcG24e2Ym5NBVeMd9gvnAZINyASPyKUQdEqGYZ0q3W0qGhU1ivY
         gz7l8zgaYnkgxEr8YFLX/Bx5mHFFHO4EQAAzb7NiO9yl+PmYOEdmbzWl9Ts1Q+pJPIGc
         ubzUEXDerTJJmR8UpTMrAhnDbBJ74gBqnuX01rObXmyhL6H2OVHO9rQ42AKxR09vdXRd
         mYCHFrgwKiybEiqVhaQUecP+Rjhxftk6nFdFplCJ+6bfR58zfFiymqvlFGYKkiGo8paU
         dy9A==
X-Forwarded-Encrypted: i=1; AJvYcCVtYkkmHQ2bndTSKih4WdydoksATUGhemtxKd3r5e3n09oxkePF8hRuwN72NRU/DwbITPrTxSHXqPeEIch/@vger.kernel.org
X-Gm-Message-State: AOJu0YycHMC2O+SF0oYVmAQBBwQuTWz/5oa84DEK935c0RLSS+tp/jsr
	Arr8sgC1uR08Misrxgs9aW2iaVUdk7IgiMiH7yenANHHQHqWQOU13lEQQtJmoaOn9rwPIz6YZ7g
	0P99YrCJ9QVGv8mckJbFBXX+pj6y/8V/HvGFfHJKj3P07ixjDQFJk+j2kG/Xv56v2uPcJ
X-Gm-Gg: AY/fxX6+cXLeHkKVzSl2IagTpWElCnIht9GRr9+PnLZy0KKdEMM/yJjoNH6qq3zurHd
	h0tLw44L0omi9XzcA9tOSFI5X5Z+acrspEhhMks/P+NTlt+bcbkxHAOTQLctExn+7Vly06x9a91
	ZWfTXzUyHD5T9oIczAnhqpG73XFW4LLxFFqK7sYz6HKEZF7Ky2cowcXaqLO+W0HyyV94J/5pPrY
	R1R6Hv66f070w8CVDc7xMelKdz3c3VPL2aEtzwmJFOo0PfzkHIXiBYXhxVgIuD4W6klGXNdBZjv
	i75e1FuVkdBeCka/dF7R5iPA9OmCUbJBPughDf/8jHj+L6VNN1xLVHwxC8v/RVuGMqA3T4VIs2f
	A/rBlRmKwDNzdkxwffkr7PvXIPQ==
X-Received: by 2002:ac8:7e8c:0:b0:4ed:e337:2e68 with SMTP id d75a77b69052e-4f4e18edb62mr524990061cf.81.1767623828585;
        Mon, 05 Jan 2026 06:37:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlPyAVT02REUX2WWFLbiHvvDtYy4oVlLSayGGRdMm53toElZ+gdUshemsdZgp05CtUIgv12w==
X-Received: by 2002:ac8:7e8c:0:b0:4ed:e337:2e68 with SMTP id d75a77b69052e-4f4e18edb62mr524989561cf.81.1767623828049;
        Mon, 05 Jan 2026 06:37:08 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b84267ba062sm2914066b.71.2026.01.05.06.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:37:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/3] bus: stm32_firewall: Simplify with scoped for each OF child loop
Date: Mon,  5 Jan 2026 15:36:59 +0100
Message-ID: <20260105143657.383621-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1803; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=VWNI1jRoAcOtzMgRiNIx1nsy6FziB+nBMqILT49pY5U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW8yKK9tMDmS+zd0tePA6QT2rHsIHZg88Ymyoe
 Dk8w25ZEk+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVvMigAKCRDBN2bmhouD
 1+3rD/9zZs9oF90xAbOCMgh/+yckTfAbUBo5OCflXmVjKs2R8jj9P9tppyg+0WtpSxckQ2/loT2
 Bz4bdQug4tWNk77DYqF/78UUoiU+n4+MB76xQ52+v6kVidfukNewogJ3XbwWcLqI9bPLzveOXrN
 9qzurfXAqJHyA+QCQU2UPkGeBIGoLtSOO8T6rasnVPcFhL2vVDjyuPJsRGqrvwswQwKrCxo8Nt+
 9woqC8XBTtWsS9PMeNiJjMWKLMJzFihykyxlSWjKFOACfskhm3xwsUr6/EURdqePu7M32NZKr2x
 K6wtz9ZOW5af+wLTbfNwiXgjTa+qm4+Y2ogk9pCUm8bBhM1CsKLHVyJpSeb/pxLyaR+Xr74KZTQ
 L9E0Wj47K1PDu7RY7N/h6VNKDHrc3Nbg1RTaHsagk2rXRjxcMO9buEQm6UzG19y/1tSxsD+NmNT
 BD6Ez+IWf/uyKx2BEn2Pgx8QrEmezCDmfOOQx0oU8p8xsG7CwcoPw6VNosWn2gQ2BMZBXIH7kyp
 KGbVby9ANtxlGYmEt6QpxiH5J3Wc5CsNq1xyrKLZIe41a2vk3Hto5NfvbaiWvXcgm77WiegxhAK
 e3AupRZbgmjnIZ55D8DlyVcfl4N3OJGNCb/VZI/T9GxScXxLZiVd8MwbGc19X/Z/2E4PLt1WHQm rg+KWdcqIjrlHcQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vre2J1RXTXHDDlSo17vdHbJPDe3GlknK
X-Proofpoint-ORIG-GUID: vre2J1RXTXHDDlSo17vdHbJPDe3GlknK
X-Authority-Analysis: v=2.4 cv=Y8P1cxeN c=1 sm=1 tr=0 ts=695bcc95 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=r8ysD5ROA9t2CGWeXHcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyOCBTYWx0ZWRfX10olhb35oTsX
 IlS0wYlXQZocNOClCD9edizCvP9Nfkh8WIamDlZURgKjUWa5AGRP/xaLR5Kl2HX/OY/odeSJps1
 BqTGBqKtp3rQbMcaOMojuiy6AlMSVNCCbdsj8kVzL9pL/OcafcL9DFK+6x1XSKzWguSnfIZ5Ml3
 E1oy3urfgCXS82dRBN8J9O9uArHTzZoWReAfP4mdcVPjAXSHCFSoC80zpV/73dQ7brO//be9Lf0
 mvesU9iWpbZRjeIDy4Yhvk7wNBSJICx5pqplpj4ZdUO/D9dpGJ2d+puRKr5/J1iZj3vdoFqoN+O
 fdU+jEw2S1OBm9RlCHzzbMieECyJTwcOllmjXyyCYNXJ3CWmWz/laMSwTNCMyVxZVGwngsqIE8h
 uRb4Gs/oOJ/rnGI+8rNd1gcjG6WyRqitYTUcJ22EIn56uPSHqgsYHOBb8hU/4/adwuqqQy4y7nk
 9APryQ1ckmMC1Kfct3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050128

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Add Rb tag
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


