Return-Path: <linux-arm-msm+bounces-91918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJM/ED2LhGl43QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 13:21:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C04B9F25A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 13:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4B455300824C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 12:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E842E3B960B;
	Thu,  5 Feb 2026 12:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETJ6b5lQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PYjxng2n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22D43AEF29
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 12:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770294074; cv=none; b=Y+zbsMlg0eXf9XeTbzEWYIJurR1XpldAMJXJm8A4paEksn9CAZNNWSPuj7HRxyCxnWsFZSxTva41CgN4PNUQ6kYuYQDcM52j2/3T47k2/e/wjcWbmI5Shtkp3pttIsgTT5eMrtyPZKaQRKqL1YzshGH29fHSGcmu534KfNz8kPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770294074; c=relaxed/simple;
	bh=ZJDwIAd9ubN0TqTyRgpQBA5ygn+ZkTIIsUJvbfJB7Mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QLd7mQvZt5/HuzvCc1j03gg5YZin+PA4OFLTnJVWX1P+a5XLxtUVqNv2+OBM31QPIJu+3iQBoCQifnAItZMYbGd+xCoEZk/2DTKKOhrN51avoJvCooLPW3P3F21AXldakhq//00t3ExGkt/8z0DUpcdhC9mJEvvtGO21LS1UQDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETJ6b5lQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PYjxng2n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615BlaJU4135816
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 12:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qdASJwP++iHL0ezr6b9geVxlqJ0ibz7Ub3TyWiBaIqs=; b=ETJ6b5lQ+Eh82QIh
	M2FhHN50sLPhNHk5Y4M7i4Ea3KU9hx5p0zIpVPWiI7VI7nLYvz4aAWeuzZ3hONll
	h8eFLMmJq1KaEwqxO1gG9pE8UddrK4QIvBWyHs9gvAlSeOQDEYQt1BSu1cTGNjl9
	CaQ9JD0tz9mVyeljZG16gb4SE+HMNS4oLm7PHQwU65wyTTPZ9BZVCIUR14DTVI8B
	XFKG+Dkitbj4lLE7MRF+8+azUdZIc4QpE8fXkfOxBykt6hBkRjJdhH57ea9Xhvs7
	LTwH1wjI2KLIPhaKffAcLx6UbqxDbNObvlX6dKW0Ap1NaSiP/RpJDohVLE9lSVX0
	vJpFjA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4tn403e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 12:21:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c52d37d346dso560703a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 04:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770294073; x=1770898873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qdASJwP++iHL0ezr6b9geVxlqJ0ibz7Ub3TyWiBaIqs=;
        b=PYjxng2noGgVMRXI/OfX5y0RTDEEfdC5i74Lnlej7bY4pBKoLL0iY8DLjyDvh8D6Tr
         VMFm7eTycJHMqXZAAu8xomat3D4RElsQ+LRV2wmojH72DPKSUPEYZe7FCDXPhe7xsn0G
         efQkJlfYAa4YAYYiguJ/B4DyjIAW+tMwnmp7kT9WSFNvD9Z5Niv9PM8fiPm+DIlHvITk
         v6MNJP5OYqdfM0upoIEOm2QxpgCgjbSNkWyzFbYAN3s9Tq6XT6By+SVGEe0Y7Uzov/R1
         3s0iuKBPHVvDPmGVwhWEeqLDeYzZlMiBGqo/h65LIfbFXzGf/FMxkAqJh4d8WMTcIsOS
         n0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770294073; x=1770898873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qdASJwP++iHL0ezr6b9geVxlqJ0ibz7Ub3TyWiBaIqs=;
        b=O7MRf8PIM/kyx/mbJyLFnhSDptXWQhDHYaWVNU2NQD8SjPWrB6BQnGLp1N0Gf1babD
         EeH6tXzAOQDHP9NcjsaMw6B/2V1C4CbwYqyU1C5rBh23Byq3lH1oS1Oq2sOamMdun4TS
         2ad7j2ZyOFrHN3TbejtQm/smYLo/4yHUOlpjw18460V9NVAV8X23Q/WuiW9pke+vacLr
         7fwz8K2k46Xrglb67z34hJmcUQUtHC+fsf3DfEPdE7YcrFdZozTTfxbXWUkxTaQ+/2gO
         uy7L5tJtqoYl6GMFKLbLl8G2ac2gf9rp4PHAcIlNex5Ply9jF3HkC1oFBpBhS9Wkl2+V
         zseg==
X-Gm-Message-State: AOJu0Yyqbmco6HaweR3MjxSNdTKs4UeqtJKP4pAKKK+Cwzt39DPTOKJy
	GjidQ9w6zawslaimnMCejB4pCyP1216D/2oruoG6vOjWQ+egzvMR2yhp/D0mOy7zLr7qI0HdRgf
	tNtBnno4yX45URGx8BTamqPX8ivXAPUsYNgKG+YuDzpV0sTaIJaOtCPzlQRqbHBLNoBH5
X-Gm-Gg: AZuq6aI+eSOYH2meFhAda+qqq5jyTLNY35MgH1PHEiqY+w0doH2Y01fEb5bYHqW0sNh
	z/GBP5dTwhTT0Ex0qazb9JqVexscmr21TZiOREJxtXqyO2KCBnR+71Vvy1oGstuQAnHH+tGYtiZ
	iH7tX5ctlvEhJz6xofDe9BJajhQ2x7ci4RPB+PcjXqQqZKh7/cMWVMQqZJndsugQDpq/4PgB4I8
	WusWhZ0MMVeEeIw8POQcab+98gT0Teuy0yIvINY/2FSDpcTYtjLMV5TEayHzJ2nOOEEd5vz3r8f
	iyPWq5OXowBFbKAyzT+bthigeRYiv/2WZRncNfIjsaZ2gx2P1PTFOdxPJZGdKrKmGHXOhUeNeKM
	0uVdMSAFHwTmNbuvWST6u7Ivull5/hCHZt6J1osO9u0WJR7reFDg8VzTNL++EDq132WgieMzHdW
	twKbmj6dOBG35ItdawjWN9iQ7mTPiLnA==
X-Received: by 2002:a05:6a00:391d:b0:81e:96c9:1320 with SMTP id d2e1a72fcca58-8241c7425f1mr5906173b3a.69.1770294073492;
        Thu, 05 Feb 2026 04:21:13 -0800 (PST)
X-Received: by 2002:a05:6a00:391d:b0:81e:96c9:1320 with SMTP id d2e1a72fcca58-8241c7425f1mr5906149b3a.69.1770294073015;
        Thu, 05 Feb 2026 04:21:13 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d1c8c55sm6262715b3a.24.2026.02.05.04.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 04:21:12 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 05 Feb 2026 17:50:41 +0530
Subject: [PATCH v7 1/4] dt-bindings: arm: qcom: Document Glymur SoC and
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-upstream_v3_glymur_introduction-v7-1-849e7a9e6888@oss.qualcomm.com>
References: <20260205-upstream_v3_glymur_introduction-v7-0-849e7a9e6888@oss.qualcomm.com>
In-Reply-To: <20260205-upstream_v3_glymur_introduction-v7-0-849e7a9e6888@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770294063; l=866;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=ZJDwIAd9ubN0TqTyRgpQBA5ygn+ZkTIIsUJvbfJB7Mc=;
 b=BsomlnsGiA37VHWxiAQQFu+fMYOTc5oDlin9eGR27Gr99KtwzNgvCi6VqpN0gulPFZYxfy0te
 d+aXHi+uMLEApLX5i4rZqEH6TZ5cHuTn4cW8GMwBvCdyDuRETC+TpdU
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-GUID: vTou6nPcj7t9kK5RWrRBSnZeQWhDtvW3
X-Proofpoint-ORIG-GUID: vTou6nPcj7t9kK5RWrRBSnZeQWhDtvW3
X-Authority-Analysis: v=2.4 cv=Dfgaa/tW c=1 sm=1 tr=0 ts=69848b3a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5v-pcvSp8lN47LZtJicA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA5MiBTYWx0ZWRfX+5lWbCFWruxK
 NQMDM7pXQ7aUjWUuov2a4VdGDddFm0J0QhpO8AcmqqUe8CMlDTF+tRuCdfwH5Bk/Zy3LIahb06d
 kc7weOxo0C4uu4y2eexCgzz6vT8RvjVrXiEBQiLogAuD8NOsD67CimqingUhnrQYIk+WbetrYTr
 Nwq+dtNwG17LlTlb72L2fe+jTFH2AyAz0ZhaAPxG12czYnJmkRaPtfMR3jTSE7BR4gfWFjpAUNQ
 aaUGBsb3woz+vDgyUpX6N/tgB0GSmyuQQweUH0h4GYuPyINYWv976xSNg7sbD7X+6XukwZzvoHk
 +HXmHAyxeGnb+ibwIQs4UV68tQbwsHJA2Ce3WW7m+gHeR+ZwRklR+r77jd+iLSyxZo0BpMk0dp8
 M9uezqJm+AW737zRQHuJRyAkd6VSeChs8sDGv4qOGrWOFmn0eXB75zk24eJBSlPZxOa7l/8Jrna
 FU8y3E1N3mtXLK93GYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91918-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C04B9F25A0
X-Rspamd-Action: no action

Document Glymur SoC bindings and Compute Reference Device
(CRD) board id

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..5be53b50f5ad 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -66,6 +66,11 @@ properties:
               - fairphone,fp6
           - const: qcom,milos
 
+      - items:
+          - enum:
+              - qcom,glymur-crd
+          - const: qcom,glymur
+
       - items:
           - enum:
               - microsoft,dempsey

-- 
2.34.1


