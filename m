Return-Path: <linux-arm-msm+bounces-86768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F08DACE5EBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 05:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 387423012DD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 04:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4D0256C83;
	Mon, 29 Dec 2025 04:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZB8fK9/W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eKLChU5w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34B51D9346
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766984110; cv=none; b=igcKaV8z6Hla4s7uz/R7bcfqiSVXHh107C5WWa5b0BpciIP0ntHyBGlYt+FRZkgBIkgZ051L/huXXvTr4n5oMAuRP1caZ85QETc9bAPReto/lQ+tbY9kxkt1/tl3K0rPvJmPmOCA/N1Y4DsAjQ0oPqUX2LwSw9E3OudR0jYu3GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766984110; c=relaxed/simple;
	bh=Eck/D6KmwOrBysTJIIaZmSoFBAq/RlW1moTUSu+Xl3I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G6RbfpC2MZhyCF6BxuqOvmOxa4mkHbPFM98KVVyX2kvNmrNeMXCy29tq4VaB4B+g9I3HA1O1DCWFqcZtULCi0P7CyZGl4/3C9Qt+mDcDzy6mjSxLwTNnqYHTesm8HNfKKcEnemADTEY+3cPrj4xogBwMwWRk+dGePFgsMlW7iiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZB8fK9/W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eKLChU5w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSMCYxs4160832
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KnpiwG0d//X
	/Doe7m+7TdtdTnhg6HQ3OqoiGCkLu8T8=; b=ZB8fK9/WjSMwS99I+WaJEF6AfQ1
	0DM+dTPlcQ/AqnCfDy0VF6O60j72hrQV4Zf4N0XfHLSbCM15V8nOyOayL9IIaeH0
	2b5hCxNvVX6GX+YSdgY5kpH+1/jaPUULqQg/DRy01tbAnESqHrl3g84rp3zCNm0P
	cAn9VRjdXnuGOdMLPdW0xHayXk9plgEaUwqgEbIdjSfb61PJTdPAuJj4/tCKaCrT
	W69s6t6WAeGMPQ2NI0UgUVPns856N6lSxTC3pQ6DBq81dGVS6jeRFY62TvvAqKaJ
	a0sWsrdiMT6/Z9X1XSGo7xlLSGRDsQUO/Mpoqd81szWjjqGVqgWCbI2yD4w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba71wuc84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:55:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b8b79cbd76so4711648b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 20:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766984105; x=1767588905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnpiwG0d//X/Doe7m+7TdtdTnhg6HQ3OqoiGCkLu8T8=;
        b=eKLChU5wrcWDZSyZqhfVfFt4pZ4ChJPSrkmUswfQy9TmQQTvAS9Zf8weKwZ32+eqWo
         diwOiRZdZcvFYvBemQ8zKg/mu/X+CqmKYoDVI/TRZnWudsCh61UTxnc1IKDXAoPmZisA
         vBn+GjT2sPdbseBV4/QiD39PNueTNUf12jx6y/IjC5hwAstPtLPSYzgyc23EjmfmlL+x
         6piB8DNKns1rflVpJEC6u2FFkgfnV5sYMeC2ISZl1XMeFZkt8S7GQbJFvdlGHo69nU51
         CvXKWBdsnKbZr6uKRrtHLnmf0ih+8uYH/diV6EHIT0VhbkskCyWyjJX7+wjam7RSARRt
         Gp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766984105; x=1767588905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KnpiwG0d//X/Doe7m+7TdtdTnhg6HQ3OqoiGCkLu8T8=;
        b=dX919jrUDGNa7OkSB28nK7Q9x8nDMgpi+PLPhZBczbZqf8o2gM+zS7O6ua0BhpdOYU
         U9pls3cFc0UNmRvuEG4n3jX+bBetTjb0Rrccj54f/O5XrUgIUu6VFZGY+LlNtLR6QDcV
         vv6zNJQcUcAu9dVV9vZqzAvZyclii301eEQuIWoOoAJf9AFSmEbX/x4uLvBGaSi6jhEM
         KZpzWZLIMPqk90qzXBGDHMsVrivP0ubxIrRqQa+R9xXNw+FtP/ldEAzzjgSSj+D+aWnd
         dLeuOzt4PoWofTMbm0USQ+0B3R4UDrebpUdgBpZtpZkhU4JMMkiAdwBqec7FX4w2jmc3
         vKew==
X-Forwarded-Encrypted: i=1; AJvYcCU0AdNWpYJuD625Fe4U5VJ3z7oWOL3FnldRr7Ihx0Y8E+qhwiecDb1QLTpR5J7kIaozz7qmvI2ydkd6MoFa@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhb2jtmQBY5YW7IFaEMqQG8KOh81zuPEeh5fptTvxoWRQNPzDP
	BDOj4uzdw7ciIMR4vj4r6iVTjcfU+iBb11N0BiZA8gthZgHcDhDX8jElpujxN+A6tDZZDcuYPzO
	Ml7p1TM3xM5TJPEEX9PEbAaizHY0iJm43gyEwliq1B4sr9dtaVuJmMLEr2OkxJDHjPgdh
X-Gm-Gg: AY/fxX7Cl9dd3Nem++UySkzwWq175L+RKN7Xr9ed05VVUes2bI1SDJfOcIWDFgXyA5E
	K00My5I+CMjUdtmLw6tBU+C4nZ/knxhtXWyXlkVZ+y1g0evQ+xSL4o0/p9iQ3O81dTZO7HrDKSZ
	jnSFNt7xuMwk0Z3o6ESw/gKbwoRpapKNmj7KWncvuI5eKPzUjEl5esfheQugWs6rhChKMuzK79f
	Cakz1AnzxIZOweeRkAnE+AtetlXm/Qu7aMRsorpVNfFmCB7vW6cMUlfLlQBJkhRfSuAxOWGnB9Z
	uvSRxeIj0hoJcljKZwBf4dwLvFKokelP80y1J4wetm1zOcYMayvTyidPv5bIBwt+0h1IiNbbhtX
	V7jc47oP6C1GEs0gI5Y7lxloVKNBs+fRY8XHvaazWclY=
X-Received: by 2002:a05:6a00:3014:b0:7b9:9ed7:538e with SMTP id d2e1a72fcca58-7ff5284dbfcmr23117376b3a.4.1766984105368;
        Sun, 28 Dec 2025 20:55:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGA+ojqnMT0CK88BaGx451YRPBiqYCNxKV9loJofxmWkWSa9imhXwL8/X0UFmMvdGgSGCMHg==
X-Received: by 2002:a05:6a00:3014:b0:7b9:9ed7:538e with SMTP id d2e1a72fcca58-7ff5284dbfcmr23117363b3a.4.1766984104791;
        Sun, 28 Dec 2025 20:55:04 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm27902080b3a.39.2025.12.28.20.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 20:55:04 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        alexey.klimov@linaro.org, krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 01/12] soc: qcom: geni-se: Refactor geni_icc_get() and make qup-memory ICC path optional
Date: Mon, 29 Dec 2025 10:24:35 +0530
Message-Id: <20251229045446.3227667-2-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251229045446.3227667-1-praveen.talari@oss.qualcomm.com>
References: <20251229045446.3227667-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA0MiBTYWx0ZWRfXxjXkCKry+5cG
 54ri+E7a8fbK4DaGZe3h8mdtDVD9O3BNJXTGN3jNnne/fRZ2voDpRMHc1hLOaWOAE310D/RgEgl
 PIXgtz/8ewnSkW9PKu/U+M3hOmBtGD1vz3f8+D9bgVXTCVcg7QKVQdALmoRpE5fik+r4ips7HID
 aTq5p7AHnpJmqA0kiab6nojtkIb16epaUN+cJPYziC3Fc5WfLyhopGXLjQf1zwaaCacAx4usYt3
 YLLb8cSXYrDIQ3hNPsFEVz04bXh4mqcUH1pJW0eIXbu02CxtuglCnlwyFZGhnjjJzcMgKt2H/Yc
 tIzGXrmz0VUYn7vrzG1KQZEplcqOnNy0bf9Js4jNSjuIZxIkeWTXK70/KPnOU6nr1Z71Wb3719X
 4teaMtIEV5nAGK4FMfFt3S8Pz3LLdJpJsA0mW0z/0WEweAqd6WUJlCK5G7uAJKi59vGkxQVTWLg
 I6Hgj9gef3fpnciwX6A==
X-Proofpoint-ORIG-GUID: joi4URbYy4VxeMz4hTE5lJDj04buKgJ2
X-Proofpoint-GUID: joi4URbYy4VxeMz4hTE5lJDj04buKgJ2
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=695209aa cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Wptve8LSCQjy2B8HgooA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290042

The "qup-memory" interconnect path is optional and may not be defined
in all device trees. Unroll the loop-based ICC path initialization to
allow specific error handling for each path type.

The "qup-core" and "qup-config" paths remain mandatory and will fail
probe if missing, while "qup-memory" is now handled as optional and
skipped when not present in the device tree.

Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1->v2:
Bjorn:
- Updated commit text.
- Used local variable for more readable.
---
 drivers/soc/qcom/qcom-geni-se.c | 36 +++++++++++++++++----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index cd1779b6a91a..b6167b968ef6 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -899,30 +899,32 @@ EXPORT_SYMBOL_GPL(geni_se_rx_dma_unprep);
 
 int geni_icc_get(struct geni_se *se, const char *icc_ddr)
 {
-	int i, err;
-	const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
+	struct geni_icc_path *icc_paths = se->icc_paths;
 
 	if (has_acpi_companion(se->dev))
 		return 0;
 
-	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
-		if (!icc_names[i])
-			continue;
-
-		se->icc_paths[i].path = devm_of_icc_get(se->dev, icc_names[i]);
-		if (IS_ERR(se->icc_paths[i].path))
-			goto err;
+	icc_paths[GENI_TO_CORE].path = devm_of_icc_get(se->dev, "qup-core");
+	if (IS_ERR(icc_paths[GENI_TO_CORE].path))
+		return dev_err_probe(se->dev, PTR_ERR(icc_paths[GENI_TO_CORE].path),
+				     "Failed to get 'qup-core' ICC path\n");
+
+	icc_paths[CPU_TO_GENI].path = devm_of_icc_get(se->dev, "qup-config");
+	if (IS_ERR(icc_paths[CPU_TO_GENI].path))
+		return dev_err_probe(se->dev, PTR_ERR(icc_paths[CPU_TO_GENI].path),
+				     "Failed to get 'qup-config' ICC path\n");
+
+	/* The DDR path is optional, depending on protocol and hw capabilities */
+	icc_paths[GENI_TO_DDR].path = devm_of_icc_get(se->dev, "qup-memory");
+	if (IS_ERR(icc_paths[GENI_TO_DDR].path)) {
+		if (PTR_ERR(icc_paths[GENI_TO_DDR].path) == -ENODATA)
+			icc_paths[GENI_TO_DDR].path = NULL;
+		else
+			return dev_err_probe(se->dev, PTR_ERR(icc_paths[GENI_TO_DDR].path),
+					     "Failed to get 'qup-memory' ICC path\n");
 	}
 
 	return 0;
-
-err:
-	err = PTR_ERR(se->icc_paths[i].path);
-	if (err != -EPROBE_DEFER)
-		dev_err_ratelimited(se->dev, "Failed to get ICC path '%s': %d\n",
-					icc_names[i], err);
-	return err;
-
 }
 EXPORT_SYMBOL_GPL(geni_icc_get);
 
-- 
2.34.1


