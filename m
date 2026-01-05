Return-Path: <linux-arm-msm+bounces-87504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 968E2CF45C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 16:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED7CD30DB4BF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 15:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BD12E6CD8;
	Mon,  5 Jan 2026 14:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hT+urKRW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DL+2EA9L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AF72DEA78
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 14:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767623833; cv=none; b=iuLY5TU5fRHGIpjyTX8F8up33IwE+ebQ5VQEqZIf6HJcXLQLg/vojlmB+SqTC8VaKEe7zCqM1F+peJcNdL8nEyVZ/Pw32GFrX3StCc/MJXK8WPxmjBv3LdwF7M1dTqAse4y5fqb7qWejh74aEjczRTulT9XaoROrWe8hnjGaG7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767623833; c=relaxed/simple;
	bh=JhtX/Jw0mKrE2rMCEG9hntzTYqIHi3SC7k8hVDUxXa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=baVw6cS+ce25yCaV2pKibewlj47/vLTr6WAB4je65JfdMHYH8SkGCt7iw0YurWf1nrpB+XukpLixCAOSyZGkFMUEgGz6fILNyizSHj+puAT7JaBrusH7DGVhzcB6bq0i68pSI7CdfY+39g6WnVacanJzHjW0oUTlJG9Cu62lNTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hT+urKRW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DL+2EA9L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605AYV1M936771
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 14:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FqozQF9M5zl
	w+9sgUgeqaaoOc0kHvJsMdTuoFXpVzqw=; b=hT+urKRWB2PgUU+9W9m2vd67RTD
	G5sZqtP03NPU8xe2O4uRbZbmhxuHsqrSqoO4sOtbmof6cVwcdbna8bnnm/z1BVhD
	lx3PFkOboTzXIUxtR2FJI/aYVujyVeca0KB8rPvN/UzG9j+zgDpTb+/huL0YiHOW
	qNT17fnob5oFSsL9MWzcLvwShr2r94b9UygBl2ZaHHtEj/PHWGeSzE/CxlDJ2Ucv
	PkrR8TQ4xvJ7q2jW79Pqc8ng03Aohpm+r7bPxoRHzvhSDoK5rwo74bAT+G9oR/Eb
	X6K3EuaI9FbQwldOaTCAf1J8yaZt6OjvdJgT4AKdLI65wJAWErdwj6QsOsQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgbnv8jmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 14:37:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0c1d1b36so50075801cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 06:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767623830; x=1768228630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqozQF9M5zlw+9sgUgeqaaoOc0kHvJsMdTuoFXpVzqw=;
        b=DL+2EA9LvUGSFYJbRNJXX2rz2f9gSsxPU0vGBJAgP/ztx5UxCKnXYigcXs3L1tJAFL
         BI4ZE2TjCobl/2VFpjTdPtjwwi6guah5xwbTBw9DV0rQDjP6wc7f6LDhHrcwWVhPQ4TM
         ewFLymF5FD3PXBhFS/Igd3web2czcOjZ54kdUqjYc3HpQTQgnLtDKpTW5f3nOEpNq+f5
         zF/fLuL5TSuSelqwVzciTrG50MTQnsXKCP1JdtBaIqLW5MNMXtvpHUZJa+YwX/casGDR
         WCQ+ixpzbPbe+8v81n1SIXufH8apxOF4Ua6/efYEE2ZgQYmzSco5EfBhAhbx9Vhg/ffo
         U7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767623830; x=1768228630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FqozQF9M5zlw+9sgUgeqaaoOc0kHvJsMdTuoFXpVzqw=;
        b=dZBtPN/I8QsvuGH2a417fglZLpUR69n1MQ0+9b8SqD/8vqnapIeSWYUXRqe4ueRRzw
         SC1hf5QCWMeqjh8w7rillbcdIT+ipHqcsX1fMcnCYrCx0gMOfAmUTaEpUuM4hIW+b4aG
         KTtXm7SkCUHOKnYXeHsCbxyOY4BaM4oNV2y3cp26yaidWBv+TgkvyUbT/mpEjfqg+oRN
         FqebG20baQto8nNoIGR+mMw9AHYpJxevBr2XwJ+40YArBSt1+ItiezHVLRQohBLd/jGN
         Nzm3Hf4gAgRTZNvGb20ouhrGkj1Nvbo2w1VE9DSDDtPXFAsYiS331UTnORa2d8Dm4Nbs
         7kEg==
X-Forwarded-Encrypted: i=1; AJvYcCUOmQoVtnXa/BT137MJk0RYW8s3umEk9IxAEGhsFM008wbYgCgCDxDwYcdRPcBMZJNusVqO67BDkZFBR10q@vger.kernel.org
X-Gm-Message-State: AOJu0YwGut3h0qEXRa2mF9cm4MHdKADYmtoWCX7DNURMzsKwATlFUkST
	aZrmHMkbxoUoPQgbHRIYxWIgh/SPdtLXb1IJooPZhazd5Ar76v0t6xIw1WoGZejOuormiWF0e0s
	GeEUQAxQMilYKEYvO5DHBNpnwM7YoTnMfk6s+0g+DdENDGUKDqiMdEKOdl5JS7Mkz9sGt
X-Gm-Gg: AY/fxX5ZHcazKspMY8J/J3aNCsOUhqxYtHsZtyeZGydSVpgNd6FaqOfkX7Gc/GLsrCX
	IEh6dhBS4M0h9ziFjcD/pGcep5+DGGgwWAgg1KZf3lF0EE6nln9LMHmbeoB7Papx167XolkfsFm
	ZKgPfq9GYIoZ+xql8WiKeZioDJtPgomq3/nsjuUMIf6/jZ68NKscoT+yBlb66VRYqEOPv/6qvd7
	WMsf/Q+hgoM4ORm2MixLmv6EXmXnhyRSwZepuQFxdjybmUr67QVGuJQNWmQlro+R9DABGaX/IU5
	Xk9klZL3W+wce7vUG2roizOtX92ijYck7N36O3CuYChPvFVHLe6Ru1es+yVkonxWyvVF3UTID72
	jGJ4h9+H3Mf2QljYmaleg+hNC7g==
X-Received: by 2002:a05:622a:40f:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-4ff46b05e66mr102381841cf.21.1767623830065;
        Mon, 05 Jan 2026 06:37:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJjWpZc2AHE030Ob1/BCoZ7+aZaco3pbYM4/m1iVzjjWTRyFsEiy5jveuZbG4ytMZcGxbzzQ==
X-Received: by 2002:a05:622a:40f:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-4ff46b05e66mr102381391cf.21.1767623829493;
        Mon, 05 Jan 2026 06:37:09 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b84267ba062sm2914066b.71.2026.01.05.06.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:37:08 -0800 (PST)
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
        Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 3/3] bus: stm32_firewall: Use scoped allocation to simplify cleanup
Date: Mon,  5 Jan 2026 15:37:00 +0100
Message-ID: <20260105143657.383621-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1644; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JhtX/Jw0mKrE2rMCEG9hntzTYqIHi3SC7k8hVDUxXa4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW8yL/ba+hyOLq3Ya9b+2xC+hXQ9RLMEHV4Owj
 9LZU+4DabqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVvMiwAKCRDBN2bmhouD
 19uQD/0R9t/Sz6ycv5D28YQM7k6kABPNb9FjMVhuv7gGXPQ4VAxA/B8iZYtX6lCjaK5+BmF7d3h
 XrhlhtmK0HD5CAhdhNV7Ri2RixOpNXk9dNw6zAFog8FlcPZahMzIo4QT+wOlutTEWCdPK+W86bp
 1UerkQ74pVYKEjaB4gSO/gMFeSM1h4Jrmfa9aa7K6nTOOWXbSHC68m276IQ/1WLn0XdSVJGVrC0
 444dSX/teYoO8GFUN21SWIiDDBWNcRCIQ4aj1HnrNevjTnGqbnmqeRaeHHUpEghce6MIj/iC8Hu
 vzzsJAtynI6xDOe70/tFWbWQb3Evys3t6FNrvULVI/O8oDkYDjRZhdEOtTROmU8jwKPnK2RvQud
 jx7/I8N2RLRNMER/xIJ10OzPK8H4FpVqt16VYDalGUw55n19QNNYIXmHfu7ACFeM/iQ9jH/DHnX
 wy6LWfNqyQpzYCEWz3GFwPXcJTJqlIVRwxYaGVoESUIV30WD9XCvBq06DtsPD8oP3Hzi69LdrRw
 Ul+s9RgHzpF6liooHeDaHDZs4UeZpPnUdvwy28g+JWQ2k5RYM5nFaULfDXGXE5g5TOXtGqIUfkQ
 crp990mGt6mkGXi1r57MEGhLM3qnRkeDVBL3vn04sKrF+WFcjV4zrVQ90FkttV8V/r5Z/LWmSvg VEecn/h3toCBUdA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=695bcc96 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=vwHuHT9Ri9izzjm89PkA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: rBwJljNf4qDjbulkeXDbVWKdqG9Za2o0
X-Proofpoint-ORIG-GUID: rBwJljNf4qDjbulkeXDbVWKdqG9Za2o0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyOCBTYWx0ZWRfX67le1HOrTe1J
 u4cQtTbdqzB69vjzhG+3cptxrSbm26DMdoBlhy1iTo9eUcyqXm1aAe1O78wVinG8XAtPoelFaYQ
 1v3lseBc+cg2JgbunRfdOFYl6WbWJHSHx+vXmeAE+vY/GvhvUQhC+oSTEdeslUSO/BjC4nq4A7r
 xfmFXQOsEoNPy/6akVp+uwH5GFq11PeLzcPsd/LdGCX0O0ACqB8KxN6NUC/MLg1KskZSCEetCFM
 UfYLAA7eofwyjsaaH1TUDN8WF6sEFZ5iXhY485Z0bDWxEsp+HmUV6iMkYTHqEZ3fiv4Jthpn6XW
 XivBilghErni/yghRnSQDoYny3hgDvI1fVW6ORJlES3HKUU8iNH8rOwNg4Av7kRFdbu2cvInUop
 ZJuul8ADm5+Uc3VRcoJMGtorFQMDa8sWXavyJvBHRedhZ5sJ93qzvD0ByN2EnUX0VoHJaV6z7r+
 hA6kLjR4fHVepuiqHbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050128

Allocate the memory with scoped/cleanup.h to reduce error handling and
make the code a bit simpler.

Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 drivers/bus/stm32_firewall.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index fae881cea9a0..92414a4c7bb1 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -240,7 +240,6 @@ EXPORT_SYMBOL_GPL(stm32_firewall_controller_unregister);
 
 int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
 {
-	struct stm32_firewall *firewalls;
 	struct device *parent;
 	unsigned int i;
 	int len;
@@ -257,15 +256,14 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
 		if (len <= 0)
 			return -EINVAL;
 
-		firewalls = kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
+		struct stm32_firewall *firewalls __free(kfree) =
+			kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
 		if (!firewalls)
 			return -ENOMEM;
 
 		err = stm32_firewall_get_firewall(child, firewalls, (unsigned int)len);
-		if (err) {
-			kfree(firewalls);
+		if (err)
 			return err;
-		}
 
 		for (i = 0; i < len; i++) {
 			if (firewall_controller->grant_access(firewall_controller,
@@ -279,8 +277,6 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
 					child->full_name);
 			}
 		}
-
-		kfree(firewalls);
 	}
 
 	return 0;
-- 
2.51.0


