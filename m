Return-Path: <linux-arm-msm+bounces-100289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JIjGo91xmlFKgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:18:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C28344177
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4AB13309CC48
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB59366069;
	Fri, 27 Mar 2026 12:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bz/IKWRf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kHAOcawe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672B9396591
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774613638; cv=none; b=KI4SmHIUO8+rG5Viqrj+KubDPXDsxxz5CqsuPnzaxQLwXxlWtQ6f6FlGf8jTb4w4Psm8L2nk6FpQ3nZS1t1SVWyc021ellKjzYxxRhdKffjd6+9IgaHGu6XrDAWn0g+Fsrysj8upltuUmM7mTKlEeTNy+QjceVmdor/ZVgITric=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774613638; c=relaxed/simple;
	bh=OYhouiq3q0ZDatpkP0Jk+C4Du/ssLvYTFdzjmmNjzZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZAB4YVyigB8Seew4xQBZCy3MNyLIWJfnQ28FLZqLyUtyz5JNq+0nfIkTtEAGqpHzk/7wqC5Fw3I3cqP6FMe6QjABxQv46KikX1KVwqWBTopftlrnGjhiZG9eDUJGULmmlYaFE+XQ0QXtohmapzVG9X5VltzP4MWShb7DhcTvTB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bz/IKWRf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kHAOcawe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vqKi298556
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nCyZJYSNUFNBG4vYgpcbj48rTe3RgrEG+krWZIRlkrc=; b=Bz/IKWRf300lTy2t
	4FYH33FDDGHcmTKXcCLsqG+BYP5H4rnawdm0Abu5sEdUOSZAvflb5ZOozYXNugLC
	b9gSCLTpq5AXA7z22/AdgOXxb0Cd4Rxw2J2fMp+Zah9PkkmVS8eaWBsK09vGW0FG
	+K1UnIgzDksR9cviRDwi2qmukpBPq87GyxjjdHtKfG5hc81Dn/s3iM4l5oGB4lH7
	/orayNsWOzTzGaxQ62kMiWu3dM+Htq6pKNwSgNndhwsjCn5BTgZG4NmmtdQ1tCqQ
	vtaDvEahBz/W4YGZHMimEZMRQt2TATH+Tk+IVhUXNVERvmMPKIC0aWgMGP7UngYb
	ESiNHQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8u0m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:13:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090cc6a7d2so61777571cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 05:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774613636; x=1775218436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCyZJYSNUFNBG4vYgpcbj48rTe3RgrEG+krWZIRlkrc=;
        b=kHAOcawekCCIoH80pKGfZtkOJytBMZXuS4iZw5/7DA42UXUkfpKE7mP0LqnE2FUO7j
         ZJuLrKMELFoZK6bRx9ENk+FZMVu8oblypwvu3NlRHI8kN7FycdaecCPRo+F8ueYFBs6Z
         UTns5hafbWlsHuSeK9dMRgpOeY3lfy3w8Si0qmXpogFZsiU5YZ2EgcSNzDfokb4Jhbce
         Zyik5fj8gzbw31y0ePL0T8Jz8OYu3dDY+ITn4uZJ2/RCp99NDAoZ48JRrtQ4nazdmeS6
         SZptiZv5I5nLWfHB9u11ForCfa3p3scxMcrlP2VqAYxGZcRRzvq9T0dQ4U6AQxQwfgcu
         ljJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774613636; x=1775218436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nCyZJYSNUFNBG4vYgpcbj48rTe3RgrEG+krWZIRlkrc=;
        b=hall/6+Zkf3HQFfyznsXhCCbgNerfPutxZM2oYqJNoUr0Iv+IMTyVWURTfIPCOI6BR
         3SLrj1cRYSBJNhmCUH9fNdAZCtPtePgjvYsJl89JbBmd1qrUSBeEEfvlk/s/VTA+0nMW
         eFS5OzROWspOOZG88YYirR1a2VribW/VbOtCIsT9zMs/5ZF+c/jKkr5ItDyw5Fh3AoS1
         ZjAtO5kctygvMiCxsuu+OIQky9xcfA/twRp1kg2Dhr1bN6rvEctFbWmHrroHL9h2eZza
         AhlcS5g0iNiZ7ihmQwnrQ/qCNs0rsVKD8ilfJyZFYU0C3exWsQjaA7dnLYXIjkl1X9MA
         RZnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTAVUch1e6zJrOfnwQygOcqTX1kaD3QUs+/V0CWmMdD3lagRLtii1tUhoqkHKZEXMGaBXt1gCf8Wk5Yvmb@vger.kernel.org
X-Gm-Message-State: AOJu0Yws/6zYS3q43FY5dFERTEopcTPptfWM+OMpYg65SxjbWLwEY28y
	2KOoI5Hq2qVZIZNUOL3SAwiC5UyDxCTFEkV8Ux88YGko2l693klybgYdJLLGXZ2sqLSNOzLuY/4
	gOLvKedeEoUyqd6y5Q2pSYf/VejFFwZudidx2RpS0F5rUwwu3fwCeRLydZdWXL3nuPd8k
X-Gm-Gg: ATEYQzw9xAwbm0jyBjNwMeb12Y6BASxxpm9mGqCuLYs+TV7X0uTn9jjZDivgh/Gc2Lg
	5VIbLeXNhj/Ppg+PXqP/cI7yUNUAutSzwNCdLWAzMAbFmOsSZHCgxLmDdrIb9t1+Xq9hr14GLMG
	vuMzuzDuNHGyty500nKadNfO8PCwzUr3Ab2JND7bpDRjbL80pg7ArEvp2N1mTqYBLe8dYnXMrm4
	w7tk74E4RYrqKqpGnuR5uDiTZrkM1fcRdeopBU3dGMWXz1BViZLCMX1K6JNzPlbQ1KeMwXOn0Z5
	uGzAlEP7LJRB5cGSkVVndqkgM+HXy7z/cSEoKmm4DhVaUB+tAwLAvw0z9IK+WO1FXecXAj1FBrG
	Sb2ZB4qUoEwL5cigzY8nRgAsFtU0=
X-Received: by 2002:a05:622a:1aa1:b0:509:13a9:552f with SMTP id d75a77b69052e-50ba37f68b6mr31657771cf.18.1774613635529;
        Fri, 27 Mar 2026 05:13:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa1:b0:509:13a9:552f with SMTP id d75a77b69052e-50ba37f68b6mr31657141cf.18.1774613634939;
        Fri, 27 Mar 2026 05:13:54 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919dfb54sm14647927f8f.31.2026.03.27.05.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 05:13:54 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 14:13:40 +0200
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add missing power-domains
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-1-f14a22c73fe9@oss.qualcomm.com>
References: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
In-Reply-To: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=OYhouiq3q0ZDatpkP0Jk+C4Du/ssLvYTFdzjmmNjzZk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxnR8x1193sU8zac0btSsLrcziiHBxywYAio3H
 yRvs7NAfWaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacZ0fAAKCRAbX0TJAJUV
 Vo8READFsryJswnsDm0PlANo3n4UaqFu16h59gBNGshdYL6Z2/9dqsmnIDRCH8ih+s5DATAmX3s
 3u6GfXnHKX2CIwlmuThO2454vSlkDr4T50cBiJnL3rSAiKlmp64xxyjk/kVbcZy9EjX1Xee1tNk
 ixK1bqr8XTsvnS9J+yvDYN+2FnkHUlzxbKCSfDTC1or2JWXTiAzXVkuINGOQhudSjx1a1vkzjNC
 A0pgyGhpRizKFac3HnVGFly126JNr7EzFZHJS9KUxBKL25fyiNe724WivjdG7SfMRfqkHBdmoa7
 VXH2hitIYW0z2uBBKneTPUoSRmo2u8ahrSeyIf0tgKtTpIKi/ofvhxbJ/4jLVfBZuwdkXiLgWZf
 rcDxmvKSm+94fw3J672FNdbbplRlvtIR60ME2SwFg08gC/o6L76T9Asy7f1m13w3Ae4sRviBgkm
 YPjg+LhYq2vF1wqifqFQcRZc0sCN6LfCT6UYPtWno19xZvb01EogYBmK9RddTztYvuv+sqprQLh
 7JZK9giBjgzdbrzs7gQHrWn4jzQos2ZZyoosBbyrJ8g03ulfjfKODzmN4Uh13XT5WYAUGLEaXmF
 e0dF9v3WiJr9K1WF+Rk/h0tIdp0a1t6Etblm3QlHMzuGpiZOjCrLh9KQ4kICq0zFBMurbkAUvy1
 Vfv389wdsGdXm9g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4MyBTYWx0ZWRfXyd0nRuZBNY+b
 F5LqgC9sQhTKchQuP9d4+vySPw9ZUBj+r1CUPa5PlcJp0iHsQ6BAN/h4v4qHDvXIZLfPXAlbppz
 Ug6XXQc/hwA8WfFJEmLro9tJ7XL+PvtJubvSgZglKBQOVHPdOf8u0GJ2e+rfLOVjc9gm6xYpeD/
 a5kfZgF3xta6p7Pn9TPATgv4vogbhOO9FTVW77n6txmJJ3HfGbXHGJ96GXA7PPGt4kvCPpn89JI
 18CcxkUD4IOjee9D3LgWJL5YqmXlmqYRZ2g/fqctfdXuwYfY2FdxPmelqEF/qWi1TzZYpOgpzf2
 huRBjX9lQLxpz7vUUVdZHtGRcsw5oVqGEa8NzU1aVfwD64pLnwOp85U48hmAodcecsofFWUFdg7
 D+XoV+lQCN1n4HeoUP4512B2RTmuG3Qv6yMKQN6aM/AEjYKNaQwTfVcGiXkaFalWkMBIi88pZsR
 QwpUVcboCICMwnsP70Q==
X-Proofpoint-ORIG-GUID: 9-PDrL1daVex1ua9AJLudUS6hKAnKGgk
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c67484 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jcP1HsbDA0ark0d7qT8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 9-PDrL1daVex1ua9AJLudUS6hKAnKGgk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100289-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.1.134.160:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 25C28344177
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In order for the GCC votes on the GDSCs it provides to be propagated
to CX, CX needs to be declared as power domain of the GCC.

Document the missing power-domains property to that purpose.

Fixes: 95ba6820a665 ("dt-bindings: clock: qcom: document the Milos Global Clock Controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
index 60f1c8ca2c13..c65a6ad893d2 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
@@ -35,9 +35,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -48,6 +53,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
         compatible = "qcom,milos-gcc";
         reg = <0x00100000 0x1f4200>;
@@ -59,6 +65,7 @@ examples:
                  <&ufs_mem_phy 1>,
                  <&ufs_mem_phy 2>,
                  <&usb_1_qmpphy>;
+        power-domains = <&rpmhpd RPMHPD_CX>;
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;

-- 
2.48.1


