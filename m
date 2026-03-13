Return-Path: <linux-arm-msm+bounces-97512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMPjAVMUtGn2gwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:42:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF072841AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3A9C33D63CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339AC3A6B69;
	Fri, 13 Mar 2026 13:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7zHNuPM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PP7S0M/T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE5F3A63E4
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408249; cv=none; b=RDsNtBbT0xGjpxMyaXeHhY4RbZybJscwxzKebwrQnQ/eEGuUkRGjVOLv0HK5vB/4gdpr3qxCfS986y/iMnHE1fAtgrIwByVkzGHwUUa48MmkOSdXN2RyldPuheN3F4VCJuGO1Y539mdVyVdPP0y5QjQmbFqZfoaVxxn52OycUCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408249; c=relaxed/simple;
	bh=awssoOLX2hyFvkI4vDBZ6gn5gwKYmLjvJaDdHsXjp2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H7V9Lz95V7xJmURVZZPLBWiuwCFTQyjXYuCG/NLhUsgPZ0mfCCpG5w5Nr/s5JGye5eRoq+rBfHf/Ya88vR6wb14QHyZfZLJfY7Og/xyr7kGd8/EQaNSMMxSriItNxNk6jM8wwhZwyVOuLyRJ1rWvggY34rxwhw7BFUQ/JJf8cno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7zHNuPM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PP7S0M/T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DA7pMc1749162
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BCDKqOoVrGCzz/kPg4ndS/MQ/dmIlT+UZRgUfG7y0OY=; b=M7zHNuPMy4QZT6p3
	Zn0YKpIlHpcVkA0xxU7gHKxauTf+1JV4j6Fe1VZGldng8OQl5Z2Ncqf11Hi4IIw9
	o63zdJqyLa6B42zTpEDE2gPSMwoFUhhpzAkLIbEaxW4Y1X/TUaccAAPcBET/oRe2
	kue2se3ZCOi6evQGAMAHcYNPZYGVYRQrYr3DqeZoH4jhqUZvplaID7hLsXS51EAK
	doY4Lc2oTLIS6J/W16u4a2vNtJ9u47fvAs0NaXQhcbh9xO42MGiZVSM3ci0uSp1P
	Vh8IqMH83cunuDAaqiWM57WjWiB/JQJSeRaYf13iwN10+teWzw2e0mI/kE5LKB3X
	IdXHtA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvgj6gkns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:24:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd781c0d90so1773707985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773408246; x=1774013046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCDKqOoVrGCzz/kPg4ndS/MQ/dmIlT+UZRgUfG7y0OY=;
        b=PP7S0M/Tnh+nUKy6NLZiiXevxjE44jiKBhaMmnM23C5cF4fn1xEYgt/Y2yB7erb2SK
         mK22ywW+tT8sbsdap0/6rnQ+EbSNdtiybR/xEdD6vFK4y1il+GLno/XC0NxqD/08Ms1w
         cJfG6QBg7b3JAXJVsRKLLnKIIcWZsXJk4Np7mSA2aL5erZdV12ClNCyHhxe7hnAjAqrq
         c7ZZCL5yeewZnj150cJLt/sKnADwthEAdV2ArpPS4Yw2t9g+yryAa4AdJxwpJBGNZji2
         k+p5/HueeJeNA53l4G4npjnRG3yFl1b9gPUIui7f/upNcrca/5hIN+UZjV9FErccvXIm
         Py6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408246; x=1774013046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BCDKqOoVrGCzz/kPg4ndS/MQ/dmIlT+UZRgUfG7y0OY=;
        b=P1fEZLrv/2SgJrwZOiI4wr7MX2pc0Z7XvqCaZuyy9NA1ai3vQeN0PghnFsR5igQAIm
         y3mByfPKCdd+dvQfJiI25SMLnrx0QxqHh8BkXXu3GERN7I9UqtBZXwWgJZ+kOjzKkrNN
         YaWNmOVEzzlUkpLmyxPDEUMZ8oiA3v1yJiytdfNNwLnbZ5YkxEjrSMFLw2RYD0zBRQxB
         ImIK4yR7cyrRNndGKW4IiX67nB5TrbaKI/IRfYWIucOdxUu+w2nRBrxirzmgNRHaXGA+
         4cIJdC3kbMHkek13vU220o56uGgndfOIpEWh4JJklBeeYDDe3WeMhx0/7UCM+ESM4gGv
         pQ5Q==
X-Gm-Message-State: AOJu0YzmcWYbk72Qj/74MASDSuC/lX7HrqidUBksQrl9UolCLHTBcqp7
	fe1Y3wIrpdlidaYZTN+qiDuvNQudaJJSxssahwhRpYeq5cMgfP+KiXFxWYSstU98vrg5vmLtOgh
	Zo+ITfhHMfT/mLVYg3z9pD5bjYRV2O7xHN0Z3EuD6Zj3WZ0cq5xKcGY9phNBf66VJ0Bph
X-Gm-Gg: ATEYQzz7YA7a6sTjBVF9fVc2XE/4Lkb0PVxtdgyueCmarKCP/JzV1tzcL+pnt+D4XNT
	5Cq+7mWYHsnBuufyLEYb4fXZkMe9Imo8EyUEhJMmUeYpZYk45TKkxI68eeFkKVSTF0doQyUpzc+
	IU5u8Fm/mM6AV4wlqkCaq8oXP+lsNXiCd1rGM8G7ZU9g5TFc7gUGaoVvHQcf0hChVzONCRQC2uN
	nSrmJIXi8OqEB5/N+ZrhX0105NCNC2KPnuu3iRLJk0aX3tJinjKbtyEfTRq5Tv0aUFCnH1IBAK2
	mi5QIq2YUNpUvSL9BuM7Ng6XTnpEPX/EQ8IoF75R0tzvaC2rr4sjodCBS8P4/VYeR12kKmwQuqd
	XA9bBbys6pEZHMMYOjMtQRsT53xM=
X-Received: by 2002:a05:620a:25c9:b0:8cd:9322:7c4d with SMTP id af79cd13be357-8cdaa776c6fmr821669385a.5.1773408245459;
        Fri, 13 Mar 2026 06:24:05 -0700 (PDT)
X-Received: by 2002:a05:620a:25c9:b0:8cd:9322:7c4d with SMTP id af79cd13be357-8cdaa776c6fmr821656885a.5.1773408244282;
        Fri, 13 Mar 2026 06:24:04 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19b936sm20294793f8f.5.2026.03.13.06.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:24:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 15:23:50 +0200
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Document Eliza SoC and its
 MTP board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-eliza-base-dt-v2-1-bd91367d860d@oss.qualcomm.com>
References: <20260313-eliza-base-dt-v2-0-bd91367d860d@oss.qualcomm.com>
In-Reply-To: <20260313-eliza-base-dt-v2-0-bd91367d860d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-7ae85
X-Developer-Signature: v=1; a=openpgp-sha256; l=935;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=awssoOLX2hyFvkI4vDBZ6gn5gwKYmLjvJaDdHsXjp2Q=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBptA/tihw2Hj469Vvl5vGhwiC0T/WKiWfBrhPZw
 7KvRudW6zyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabQP7QAKCRAbX0TJAJUV
 VtgMEADMJa47Ea361vJcip6SpB0h9rFWRYbVyzLmQZ9xC4jd4Rel7s3B13k1iP0b0Ye52xDRLcQ
 cz6G5UShzgJ3/XWsv3spH4ma7TJLZbwOyloaUaxj0huBb5OZGCeGfV9SGhyn/jeIh9QjVsO3sU6
 qUFqFhhaXJYV/OXQNZv25deGvzvT7A10djBniuNLxaYtXPtSidmvspiqy3hF4QmCUFEAXCND+qR
 F5AFmbWGi3fuxMW/CgTyZGPEc2Y6PAD7eNL/aU3CQxhmEhMTvxhgkJAc6YAPkDpm0qjWXbp/ngr
 Rh7M4MA7Drfnn7bDKGSOkj79wbvhyahSP/qqpw73Ej/ePL8Ub1bJRHJUEnmpSe2UdPtXyT/YQaf
 QGmY/jgPYvTSnioKEOIQL2akXU1kDOXGsmdqZTs34HYYO3lPYl6Bwq2rRjwgSnXGrWK8tgWyt5y
 zb6QSx4W9LEXiGrBMdzMFBpbVI4LV8Yr3mCPzZnvYiilju688o89PwHh9cIczmMKu2MhnIlc9pg
 gKFjBtRzYgCu59dF1XOfscwLkOTWIDGcNQc4eLLO89Ft4/yIiH/8YGKpziZfBEhW41klvS/jONT
 qBDisZuBauAYnEezcCR3TuV5o6nY4ltBv3cEpvdONG5cf8uDO0/AaleQC6e+tRyE8s9NnWOcWph
 3hqwaXbaE+7cTLA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwNiBTYWx0ZWRfXzzOSAQak1hHv
 xWTkLPBh/yE26Q33+mK/0gRk9pyogVVcnaGCuiMvd/g4LKVJ+eFrlwLK0zaL0LMm7hcTiCfrhWS
 5VscCpmQsYt7tU5ScI8qDkFtCIOrFPLczFlQ8iXw+eat8oXaZ2ARAbpIsjiWqdYgDJziL0uqhuX
 68AipWRvv+rLtWmpMbL/dkk7rIdV2ggIOr9x1BiA/yKnxof0s5hqrEVqLV+VbAW8ATiRqIEjscp
 6f2QNQntQeuyORyRw+vPbN6W4J6znI9VAP0UAiE3RX2J185riLSq0ckdlywDL+uu/RDPJKM6oU/
 kCwsuf97VSksSnXzd1bRgV2X8oqqgErXM4tpM40wgE3vY+0mbLTKUQrUn69ATae3FZfxCqfaxXn
 kHqgO94FWhQB/3TzK7Qt4xVZJ5lH0cC9yUXWL2/dZS9EqwFNnx4XIuWieBiSwGjgVY5/tD0DVZe
 +BdlEpqyI8YsKEgOS6A==
X-Proofpoint-GUID: eh1JocgOtyxrK93fI-b_dX-bqd76W0OX
X-Proofpoint-ORIG-GUID: eh1JocgOtyxrK93fI-b_dX-bqd76W0OX
X-Authority-Analysis: v=2.4 cv=H+vWAuYi c=1 sm=1 tr=0 ts=69b40ff7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=g0bKRNXCHv9dgr-Vmo4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97512-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7FF072841AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm Eliza SoC comes with different flavors. There is SM7750 for
mobiles and then QC7790S/M for IoT. One of the boards that comes with
Eliza SoC is the MTP.

So document both the SoC and MTP board compatibles.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d054a8f5632d..458c98d2c2d6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -61,6 +61,11 @@ properties:
               - qcom,apq8084-sbc
           - const: qcom,apq8084
 
+      - items:
+          - enum:
+              - qcom,eliza-mtp
+          - const: qcom,eliza
+
       - items:
           - enum:
               - qcom,glymur-crd

-- 
2.48.1


