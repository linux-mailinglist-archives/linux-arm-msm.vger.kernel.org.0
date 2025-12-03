Return-Path: <linux-arm-msm+bounces-84240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD08C9F591
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 15:49:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id E71623004B98
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 14:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F72303A0B;
	Wed,  3 Dec 2025 14:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TWaaqajh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RaY74vBN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DE3301473
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 14:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764773358; cv=none; b=fI3ClxOHUROJ1bsPcsCTdpa3ZRL0jo/PFJ/2+iwFe1Q1uYeaWMPeh1vlv/JwK0hkTOR3IyCpvDeZtNjszQ1vG2J1cRcIxjOKpULtVswiJrD2WJ9CJo3lFqHf3H2/pZHEM65R8nGGYH/DS+FsXEB4MoUGF0Hcdq4xM2H1TyPqZAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764773358; c=relaxed/simple;
	bh=F/D4lFfA1WQQtOrKqXPgIFysrbIbb9rjcQ+cW7BUISs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L1Bdw/QImvSF/kxkgsleTlf1305FQhawl8BJ8OZeKuVXSXEdZcIrmIDWqYEKGgoDnuvlnfFa0pPXtVeZLxBVwNUainKu6w6rTdlsXZ9uCtbzVxhuIi7yhvnuTfs85ykyEKYf6K4bijRwnIT1kBNBTFC8GzWy3BbJFuzOUZGWRnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TWaaqajh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RaY74vBN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B39rcRF1928885
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 14:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gy1xT8j7X4g
	zk3YYagt60EtlfymffLgJOUngUb8LQpE=; b=TWaaqajhm1ADkWUOipCrl/J/MbF
	o9f/SDvrz7e1TuVzB16agX7PhExXOSWsvbr+ulFZO7glC3gEIhYfInTyUE/D2TLM
	6VN/qB/B0g95mooCSKm/zfzPySNOWrTnUh6l4tq6m753tLKD9LhYwPFisGHOx9he
	6OaQANTmvJ/HKhecVSxKQRlKZbbCGq5kImnPLJ54ZCKwpvicVbB2WjZBvWfnFRSq
	lhQDzOJM13wi7uma6D3evo9oeE7UilU9EChgRBKmZFEHgvDHa/l1e0aQjaH8/MW0
	NHkuABIQqF9zZ7MJxMJqL6315E61Hj01nAsQ76OabBJyGG+Uw1Nw5A38TDA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atjyqgrjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 14:49:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7d5564057d0so7746838b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 06:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764773355; x=1765378155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gy1xT8j7X4gzk3YYagt60EtlfymffLgJOUngUb8LQpE=;
        b=RaY74vBN8HdQwWDIUFlyyEV9kzckrbItBR94h2wQuWDrIpZrIKpbrdfzFxhKSZDm24
         lQ3wxQ1WxjHmnhpsrox1xWL+y96qchHLgUhzOd1ZcWPJY3U8zhd9ivI81V7LCirrrX8Z
         RdtSV6XPIVNDdjRPMOv1QDXo24e8dghthClrdZbicABNYf0eVVlwINkN7tFayaJEmwO7
         GK9lhASsOitzG9K1bFIfOYSu8szlyWwbRgARy0Ou/3ovF/Zrc04fj7PQcCZJ5upuksUX
         94BQTmPNcL24VhgekzWqBGxFOnEjZISV74nNmLt0evxZkSAtRJ07gYuGNXcxYNrJ8hnm
         GuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764773355; x=1765378155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gy1xT8j7X4gzk3YYagt60EtlfymffLgJOUngUb8LQpE=;
        b=wAfJ+lQMxXBtFPBd2ZqWYHXH3UIWaY7Q22a90NOqIGycxrCMbjOlaQ80/gb9YMLVJo
         zX3b899qnyE091Uqbzy8nlD6kzSQvicZvi1i4ju9PGs0cc48gtKVopXT40e3/Wmnll/y
         ujNRLMRghwEGCKtxapdZXPutOYKt5PkLBd9JabGhmvjjzgVkUfAOinJcxWD05aaomlWW
         vr1OJTa5ggPdNuNlTMfJVBrhTWXm9YxCFMunP8WhlgT/jK2oEa90DWvubDAqwGeBjbUD
         3j34J/X4uDBJjjVeyAoNQLfnvcfVve4nc04kC9BSkJaGBmh1ECw8mEtHBC/aTashqUQ8
         M5vw==
X-Gm-Message-State: AOJu0YwO4v1smd7di+t8mEXa2Lu30Wb8t/1fGTZYWKwBLrMgJCG8Sayx
	2p+r5f7zij7o3sjqIGQT+rD/y7NP8cTCru2Hz0Xnk6QElUWF4fOQEdHLscia9/gav5qlKpEIc3g
	DWOiGcFW5LS0zFmm+bQxY6XouEucNvJ7ZTNFRRaL/ZDXVL/gv9AqQcwsMzSsWDOTw9WVo
X-Gm-Gg: ASbGncuO/86UCXVRjgLl3W3iMC+3yi/hni+x96KtqtS6oOKQIoQ32Kz9Uz99kfM6juC
	f7qo4RIOGqcYxmhG3LD5ciRcWppFTyidcHo4yG7kmZU5hwSlK+ECvEOOOwr6g+aDO6GdplNVP87
	66RSbNESJ3SvdqXlIOI/B6J9mTJy/zUq+xJShkOTtN8hPKQgl3lMaQCr21xyGejNhZoqK5qi0hX
	63DXAOvGqTWf5NRRXz01HjhkmUu6MYVSQ/85GcOGDEZcDXUsczSQ0lVSbY0XX2J1+RCz/QnxiXA
	Cb4s1oo7/6jlypLT4Bkal4DhTAYt1/c00gu3+TmK1XORk0xa0cktSMun4T+n+RV4pdu4CIy9kL1
	WpPaAnB4zARhyh/o6IKUpTIELy1eP9osFAjTRUpk52ZI58ac=
X-Received: by 2002:a05:6a21:9986:b0:34f:c83b:b3f6 with SMTP id adf61e73a8af0-363f5e79777mr3228325637.43.1764773354621;
        Wed, 03 Dec 2025 06:49:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJoL9tyhcR+PBC/3kuY/Brlh63FoGfTNh9CxLfKRlIaQaI8V4lkzWBTzhrTAo44CaY4TQ5mQ==
X-Received: by 2002:a05:6a21:9986:b0:34f:c83b:b3f6 with SMTP id adf61e73a8af0-363f5e79777mr3228291637.43.1764773354165;
        Wed, 03 Dec 2025 06:49:14 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d151eb5bd9sm20719683b3a.27.2025.12.03.06.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 06:49:13 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: sm8650: Fix compile warnings in USB controller node
Date: Wed,  3 Dec 2025 20:18:56 +0530
Message-Id: <20251203144856.2711440-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251203144856.2711440-1-krishna.kurapati@oss.qualcomm.com>
References: <20251203144856.2711440-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fpnRpV4f c=1 sm=1 tr=0 ts=69304deb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=W_W4GMoGrKgtJPV1LKUA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: vm1gqC4RxmK0djJV0vvqkw9M8ygxthTU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDExNyBTYWx0ZWRfXz3PbJ3kdNyoG
 afCs6GtGNllabw9Ubv2j7TRgrnEhhW99O/KBhklWwKEZdFT3Cxudc7BZCAIvY1z8aTaIydncSVv
 O5ivHLNzUiKY0wcqd4tdmwS62/wv20Oxo1cYii8jeifzKBbZHsGVueMi+XmRM5IgKdN6oSN0aPK
 PsJIL3dHmy/xGUXblHVa/tQXNVQ7go3CwFifbMOlPsOb39cN/7O2KwUy6BturqJjuXP/wcJQZ4h
 4lT6MZnqxKO1W3cGCG549VL2h1TgiJIiiZOQvZoT/I9M0aVdlQxbZ+yQhrXO/BRxGf9yGHOzBrp
 QQ1urVWJvWV4DVFpPDpVVj7FX/snHbvZbHEdi9fGx2H21LPAEUNm3/AW2EJtTPfZwGAz26wWUpZ
 2dQj0thtyWp4N2LqU+8IM63tM6o06A==
X-Proofpoint-ORIG-GUID: vm1gqC4RxmK0djJV0vvqkw9M8ygxthTU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030117

With W=1, the following error comes up:

Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property

This is because the child node being removed during flattening and moving
to latest bindings.

Fixes: 77e1f16b9302 ("arm64: dts: qcom: sm8650: Flatten the USB nodes")
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 07ae74851621..f8e1950a74ac 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5150,9 +5150,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			dma-coherent;
 
-			#address-cells = <1>;
-			#size-cells = <0>;
-
 			status = "disabled";
 
 			ports {
-- 
2.34.1


