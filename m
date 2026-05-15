Return-Path: <linux-arm-msm+bounces-107832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIUtLej/BmqVqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:13:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A86254E332
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A807330000AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756BD478842;
	Fri, 15 May 2026 11:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0RhNdLJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJ9lsKbK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C204779B3
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843621; cv=none; b=Arj0ryBTYIJA4Cin6c7jZexei1Teo51SO4WCjE2QCwaKO9qh1ziaQ3bMliIwnbIL+rIdKGEahO5UZSL48k0yTdU7ScOW4Rf8tCTBKXVENKUsN5JtclWypbjm0dthAkIc8W2HrBBvt3WT5DEFL4lYqMLBQG0cXuZdxVitxqrq5QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843621; c=relaxed/simple;
	bh=mAm7OZ3Q46AvH4ISzWOZklD+Q3AQrXYcCXZTk69msps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eOuRWJvwP8OSqP3qWy7sJjAsxL4y0Dqi4qG5d4qpQIB9AyuCJ66uf0M1dN6NDFSSdwmPCudPY6vmBmg5ypIsllUO/atA45bofkVs3xufSquT4yyV9UPauHIKRkZp50s/5kzDXdWM3YbZumO3Bw4jbmmCmM8IIjPyyLrG4uMjWJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0RhNdLJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJ9lsKbK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5H3Wt4020769
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=P0CpKSS3GC61dL1Uj1wgao
	JuW5tTwbJBq8Do+OZKSRs=; b=b0RhNdLJ1W91hXLsqigq4BTDnrvHV/Vt2bmFCn
	7tycPzBPmHcj7Qm0Wc6xoOPT+WoJulVDAovfNjhI2jy9UcdKPtQbeTa3GeM/xye3
	FGfRblscTOI5TouhTAV21wagM2fi0WryaagmQEmTN3kdgKSk+d6nxDNL5gkCys4V
	VemGTk0AiauWc3wstryyCgziKSPra+CKaJkhipjWCfc7zB7qOmIA3FWk+y97Kk/j
	Bz3KNLeZJIp/wtDLV2uYkZQ2uvcNZ/d7UEAodWBlASK7pBFRh0rMM7wB+Pl/nIxp
	juFQMIOxxt+WFl2GYQgHGrxe0BnSEHXR1xNAwjdtbfBu+vEQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ru0ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:13:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5d1c2289so114813391cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778843618; x=1779448418; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P0CpKSS3GC61dL1Uj1wgaoJuW5tTwbJBq8Do+OZKSRs=;
        b=EJ9lsKbKp2xB6LN1RrY/a3F7vId0aIXHobC4ipLbWoY+Z7Qed79GEz1j9lcBR/zBYa
         Kta7NPBrn6IVgmi3eRuPQ3+/p0OxxRpUYSmQ15+aCmPsXSFf+p9OKcDM/DWj79eWhQZm
         oKxscS7rlwa0kWxZ0/AP7ubzuswfXGwXG5ccl0uKimg2GGx3AAPa1LGwZS39CXcZkJ2a
         zspaVmPZ0iwV434AzlN2LK/v/H6/blkzluk3sUGF1zTC0RkZQfWwDhcPE83eT7rzus2m
         orKcuW43i1kDMTUZ3mhXVaqxtG6cFQLSOPTpF5xZT4f5OM1eOoylgm7xJ6CbeQdq04sN
         uQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778843618; x=1779448418;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0CpKSS3GC61dL1Uj1wgaoJuW5tTwbJBq8Do+OZKSRs=;
        b=TeqJTu1vX8NHWc8Vjdr1LFDo5JwQSLS9vw6OHMgyg/dEmFJjun/xU3wOf1TNbChy5H
         3uhHyKYr94nULgl7/MbZiX3I9cIawwhKXnUo66/xrROZh+shQjwhpvZ4IPe0ar8DPy6r
         n1irhdijfzHk6VwBH7d8r9J/CYJOmA/gt2awuRLLr/loFZlNZVLncq7HARLaEFrF9rxG
         w9s2TUxvq7j5su+X23lpWyUKHKjK9hf/aaaWlhi5ZeWdhXwahhniBXe6Kbq8KKWAlMuY
         a8t97AJXJn/QIBX1ST/iUASuZav2d2HSqSX4yQP2vTFYE6azRiMgjlfz9xtrCaKCHZ3f
         jczw==
X-Gm-Message-State: AOJu0YyFp6Ovw4jOg6HBA7Mc2AbXUaL/QMOTnKTVk2Ksy9Iz3Wgvig4R
	19HahhINLlu3N8ObaZ925MNhBO48fg6NPEIoth1AG3asWVxeq6vlD0MkLhD9ZPuWt+oiO0RozDv
	79M0dMJjXYJlWTNX4Vup9ByKTAHnj/mXcrogun7ddGxFC9k+x65g6ixfJKMOQCiF11frr
X-Gm-Gg: Acq92OFJfadJhb1PGWZnlDotipY0coS5OCaI2IA639A2cSjIr+5wl6tRFKKgKzd5iBW
	u/pv5eQx7rdJCiNgHAOc1QtokhQhr6lvnHzL6JgXQr+cjBfn2oxvmjnj9IapM/vsa7XQFI7Wt09
	sP0w8K6hNRIhXKNzxZhZyOWrv99giCw/n58mH6WGEQiDkJNyUfa3rGntRPhFNkSCTcOYYq7/SYf
	ThrgMIwkB5DB1pFormcb+7VRkBVKorbiTRqsLqdZ9b6GK+zhYAFzk0BfIw9pls3AdRWH0eJXyW7
	XrUXrZ7a2rhdQHiHforBQwYul76cM3xX199zbyIgbyq8llk/eBd4pRcnJkzmaqtYihCi2VMLEXJ
	/kcksCZ0tH/51wWTDG75QHzxSbjaQ+bQKK8qeovA=
X-Received: by 2002:a05:622a:4886:b0:50d:a987:89b2 with SMTP id d75a77b69052e-5165a0df3f9mr43778561cf.31.1778843618129;
        Fri, 15 May 2026 04:13:38 -0700 (PDT)
X-Received: by 2002:a05:622a:4886:b0:50d:a987:89b2 with SMTP id d75a77b69052e-5165a0df3f9mr43777981cf.31.1778843617567;
        Fri, 15 May 2026 04:13:37 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe537ccf5sm56497205e9.14.2026.05.15.04.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:13:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:13:31 +0300
Subject: [PATCH] dt-bindings: arm: qcom: Document Eliza CQM and CQS EVK
 boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANr/BmoC/yXMQQqDMBBA0avIrDuQiBH0KtKFJhMdlbRkVETx7
 k11+Rb/nyAUmQTq7IRIGwt/QoJ+ZWCHNvSE7JIhV3mpjC6QZj5a7Dg4Dr0gbRNqr4zXtqwqZyC
 F30ie93vavB/L2o1kl/8JrusHzuGRLHYAAAA=
X-Change-ID: 20260514-eliza-bindings-evk-1f05f1c699d5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1046;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=mAm7OZ3Q46AvH4ISzWOZklD+Q3AQrXYcCXZTk69msps=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBv/e1aqrqELM6XxlTO9VcfhjQutW4ZQJCKA8a
 P6HkVFz8QmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagb/3gAKCRAbX0TJAJUV
 VrysD/sGss1skg0SrZmUWg8nb06ujiJFo9hCR70htYGqcmt+CG0xsbdcU6oWGd8K7eq9rdwh0Nt
 8ABuqnKSRzk8iAtPh93rThm7vQhDQxyDQZMgav+qs9Bh1jShrMqxiA5DCu5hTq2jYN+fp9Ay68U
 s9xK60Lc1V397UbzWWfpqTygmQWoQwFJe02s3su+9MZruVQZwjXpFw4IQc+sOfLHiifqzlFmhqq
 sB4PWMgrWdJeiPsE4WDL0mvLLjUREkGSeYL9wXEKx4MwQ7d8Glt7PtMohGlXfpKPrW3aoROP+Qt
 Vw0ckCqTbdoWj/PE0c0zm2Ip9lcCsP6v3Wk8sUXlFtdjXfRBldOsnkPIBYzDmrqN9lB/8G6aVCP
 xCO9zkH7v4DX9iR21mXo3NNuS9AsWw0JeHjNiGvjfyVdU8ZuoZHND+sjWkz3VTGHwMfX/xPwp+f
 kWhwlEY9haX7ZJQjkxRu/yqGGHDKYiQKUAU8iAc1ahR/Gi7ApMynUBc/f535zy/T6+KZoQbX1br
 xK6w9fjEmzvJgoNq+In/YPHrBOJTxCMUPiBLIweZ0MtewfK0DpfbKDkTzgudyC/tYYyHalwmFFf
 YkFtnpvKISekfAuHJnTCVdQ+G4+ug6Y/EnEaXjwcpReJHriqL5iL68/VXjSGD1gM3hswDkLHpA/
 KJkZZBU7Q40v4vw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: X8D7NFY0z8ouUHGO4AWHP1xNl3XeOEpz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMyBTYWx0ZWRfX8f8rY+UDMzG8
 F+OQk8ocU1qNGDL+mzFmGLwMocWRd53/xijkunAHwX/p2binVGPp/ZxtyIKlFVE/Gs1ewalhwdD
 8OwuuM/eBJ/PCkfUIUt0ZWZIb3d5FNVBVjxnY/2r2LDl22meZt5r8oRIpk1hU0q5xgtayn0YzE9
 JsuzMYz8uS3mhGbpaLEw7JoZKxfTyZPoWFvzhTG64v6K5uIrh2UeHgwrAxnY77qFGWxmBp3Z6rc
 bjaufy8k16Mr/9zymaudE3r2r5G9Wc/oIgWcKBBw5MtaZwsnhFKlpel00a4sh5JXGsJlM2xvNhj
 oMO4qAp/Ifb9sIDETAStzYHtI0+XlUIaVfRHFsyAvycG4pKoH86kxnrsutttTmOl75hSAU7D0/6
 datzSq6avwS8OfceoXgIsef2XG7ww8y+Y1sNo5HLArQXHLFVQFtR7wl4LHFnq0gyzxldcTbd4oS
 qWYYE4uulwbbJ6wAFvQ==
X-Proofpoint-ORIG-GUID: X8D7NFY0z8ouUHGO4AWHP1xNl3XeOEpz
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a06ffe3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=9sd6kN4QyK7Lnhmzz8MA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150113
X-Rspamd-Queue-Id: 5A86254E332
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107832-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Action: no action

Document the compatible strings for the Qualcomm Eliza CQM and CQS EVK
boards. Both boards are built from a base board paired with a SoM which
is populated with either CQ7790M or CQ7790S (Eliza variants), PMICs,
LPDDR, eMMC and UFS.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 2741c07e9f41..28a18254b4b7 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -63,6 +63,8 @@ properties:
 
       - items:
           - enum:
+              - qcom,eliza-cqm-evk
+              - qcom,eliza-cqs-evk
               - qcom,eliza-mtp
           - const: qcom,eliza
 

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260514-eliza-bindings-evk-1f05f1c699d5

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


