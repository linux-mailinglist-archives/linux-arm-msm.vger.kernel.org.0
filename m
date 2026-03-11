Return-Path: <linux-arm-msm+bounces-96978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6P/nEW1msWnsugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:56:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DF0263F73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E109C3063D44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 12:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450AE2773CC;
	Wed, 11 Mar 2026 12:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HdLC+8Ky";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cpdHrZM1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257C5253F05
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773233614; cv=none; b=HJGrM4KZtcAThoMbFzyWrlsW7HurinqLlMG0Aj4q88IoHM1eLk3hph4UhfLxuwCwHYKm3YPKL9JkHsiUlCBdHvs0rka9J2IpOHsl4BGTvC5wv2ZIuANIhIlXnNmWLSSNg41e/KDpUQPNbcWMIvehH9gznHEvYRGpjsTY797srzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773233614; c=relaxed/simple;
	bh=Pd7Hbm/FXObN75fvZURHF4pktPypvE6Fv9zWvkXllNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Lv1m6AVdeXhCS2xiUGkB+ScU4jI5cuTVCFzvyGXb9C7S36Rxj0V83LTUF2gHZPhLWorV2t5PLevs6U8rsMVi/u44UbMxufRjzmgV3CaOOk/31cW0e+VAIoeu+WQO3bskh5wRzzSTcI0W/azRr36ZTx1tw5M8jKRwpAZXyLG2wIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HdLC+8Ky; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cpdHrZM1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BA5dZA294270
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PWh6IGq/8ag1gtw243P3Wr
	2/vj3d+dLlU0tnIp3rGZM=; b=HdLC+8KyPjBWdMGMhrqe+jOSevBoYUlM3AQU9W
	avRTXa7W5z3lMbHDlu36RZSmnb5XCVGrFaUPtH0gGa/CVnVAdNasdMxo+QexCOco
	dXl7v/Yl1tMbWYAlrb+OedYK6B3vsJmkKdCMtBvbB2FLwD+WNbx0Y6RPCvzH9d+S
	RHiY5zMFaWCGZiIblhO2ADlTUos2eoFTN/TeMl6LrsunlbYOBiWO7i2ADZXGfmoK
	zY80VbsDqdjaNu5VMf37rPed363WnnchET4uGBv4HD/+83QnNJtR/HUKrRSSryLc
	EsllqwqyCYRdLv9hRkHztfrQLxfsJ4v0PwcaUxmbABI/ypLw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu6bb8hvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:53:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb706313beso1866951485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773233611; x=1773838411; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PWh6IGq/8ag1gtw243P3Wr2/vj3d+dLlU0tnIp3rGZM=;
        b=cpdHrZM1Qio6AmJG5Vb5Q5gdtVzd5gsYTjnms7r2NobjCFlpWp/xdMMohLeuFS8TH7
         dsSA9Dx9bU7P+msAUQoE3xy0sN6JRivNWgcbPaA+GF3oqLVP+OjqjZt/1/Z6hyhCvt2a
         HwGPicqoXaO8gh8rLfzOgS87tqjr9XZtXX/8p39vCwIcrmGG9Q/TH026i27Jw2p2CmYr
         k66ohAMo++igk7T1D/J7k12tdNodXSPs5YeJEqPvf5dOpbnO3iMwS8qxOzWQYzK9NHGJ
         vGzSQ5PF5pNPxHfG8W0BuCqEyRYygHzgm6FNeeG7l/JExeJqeZfWzu9s1EA4Tpkk4zWb
         vwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773233611; x=1773838411;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWh6IGq/8ag1gtw243P3Wr2/vj3d+dLlU0tnIp3rGZM=;
        b=dtfjbifGmOFsSxB7B4mmZDUAzkXwm4JkUb8fOH2GVfN3x8BaEL2bgkVJ2GZwFRzsBF
         QInj2gxhKU7doeb1JLww7bfNaxnMt+N+WNFahgzFnC39NJIbT7GEL7mSbzasaR9jV9oz
         7SH9Rg/HpnqsQt+VdUpN/0fSemXfLTasceNIzMMVCeogVxKuCEWE2rfZH0f/TOBhVR/W
         4vvqrkmRNkWpghUCRHYIkrIb65Z7zp219TGC5lexgeE+H5c7vr6DADP9FXzHu6EfZ2YE
         8iBWg1y/Di7IcSOvrFt30o+S3tGBLYJ1Dh8IWCNJ2QelBtxQIURZHH/EYe/+6EN9lu8l
         INcg==
X-Gm-Message-State: AOJu0YyIatsp6+3n1Udd8kd0CZxVmKO72892jBSzNtKeHNvYFIVVycoI
	1JwSXQz8WB8OvJQtb1Fak+RejoYJzqcKV0oiP8WP5PIujeZLxKZBkkjTcm2PghKB0j3/DRkMIIf
	tuxWy8cswHfHvzKI+KPHukXDWBcJoUhxLSogW1lo1Z3nqR7WvdFhJBN2DfpMUq6Vkg4n0
X-Gm-Gg: ATEYQzxTj6Cb4PtO9yD7vstaQoUSUc2kZfDKGCtYLTLJNz74I7gtxmkCz85tXjUCiUR
	FENGnjoe2Kwh2hQo2PsxYYbBpuuSN0aUoN2fvPiyyNKhh7O31yJ8d3/uh7IFtifRUhDbYBJtsHS
	05CZP55v/cLEwBTqhw69QxBniuYGAs/QPDVozHX1r4E92NaqTfu3BQNVsLs0Gb+qWEe6yUmwPhF
	nSUaVkTPLTeNXGhhzisJFVxic7xYoYnDs/hf2OQNbPNWyi8nxk8Aw/dyjBt7YyAZU7WV8LkKdt3
	7WeiikAYHknM9m4jRCIg7kmT5V2FUkRA/MlczY1p3FKdD99gMTWv9NXQRPfgdFL/jt41sb0hqTW
	1Addx7vO5G4pC1vRD+gwjZY/Y9p4tgA==
X-Received: by 2002:a05:620a:1a17:b0:8cd:982d:410c with SMTP id af79cd13be357-8cda1a8a6aamr298193385a.81.1773233611105;
        Wed, 11 Mar 2026 05:53:31 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:8cd:982d:410c with SMTP id af79cd13be357-8cda1a8a6aamr298189585a.81.1773233610495;
        Wed, 11 Mar 2026 05:53:30 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854ad5ee37sm40833315e9.2.2026.03.11.05.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:53:29 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 14:53:20 +0200
Subject: [PATCH] dt-bindings: spmi: qcom,x1e80100-spmi-pmic-arb: Document
 Eliza compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-eliza-bindings-spmi-v1-1-1a20eec1179e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL9lsWkC/yXMQQ6CMBBG4auQWTtJBwxBr2JctHSE32glHTVGw
 t2puPwW781kmqFGx2qmrG8YHqlAdhX1o0+DMmIx1a5uXSPCesPXc0CKSIOxTXdwF/eHIL6V6Bo
 q5ZT1gs92PZ3/tle4av/8rWhZVgxKSyt3AAAA
X-Change-ID: 20260311-eliza-bindings-spmi-8d49b1a61d03
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1385;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Pd7Hbm/FXObN75fvZURHF4pktPypvE6Fv9zWvkXllNw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpsWXDE0hd5D5VWsjquyXv0ycRjnuNt3sZPsQ+m
 ZbNMk1JmOSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabFlwwAKCRAbX0TJAJUV
 VoriEACgsBjkOSOSVDQ4PNolNMFZogl1ydVHx5SXHKTN4qrbT4SR6fh0XV6l7SuabkEcZOyppmW
 LgFLr1H3UH4A2PhNoNBBP1meXHN0bQ3xTr1AsaHvL2K3xzb1kN/dvlX0q8Akgf06HWMkWg3jCY5
 HgkHdROy+6sKq33Q76hMTjCgaf+673z60FdqMIi+MvSfByMGC177HPSQhrjdGmIZxC/jcOj8a8k
 vC8hJXpdL069dcf2IgUnFqIbdx1ZkgsKjOHInBvbue7u5XluYkj9XRgvo+3k1MgyOTApOa4mr7C
 9PXjToDpMp1HpZYDjm2R2dKptsVrTZHVxTTUl/LXAfcnFIJ8zRDV0HIFZLIgnxbzgq/CsCxo+X4
 1YPItX5PvRuJBYTwgLxkWVypcjcKTqZ2MsNTRnUzAgY76lz5ZBr9JQ6dlJ9PssYTF169/AQonMB
 Q8cx6FbjJyLqv8eNYGxE0yNeEWK/S7NilVnhAbAFTkfMgUqSlOp2QsGJKwxQMqnMbQqfoLbLqfT
 wx+yVkAfhGD2ugcPjNyQFdL6PeSY+C+5tjKRlka3lqCdhVbkett6gu38QqQAOumwIk8ZZ7s857e
 g7wNIHrl1QI8NiX6NcPQpr9v02yh/zqPHMVwNweIT3PugvBXKyxbwKgziZIXxHp/F+ruiOJ1sQO
 6r9XaLrD6Su69cg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: DaGTkp0VtBwTjP1gaSOBY2r4OKcLlK19
X-Proofpoint-GUID: DaGTkp0VtBwTjP1gaSOBY2r4OKcLlK19
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEwOSBTYWx0ZWRfXwb3/R55ud6s5
 2J8WGwEbeEtzs2rDctGpo3p+/fnQmPgHi+eFED7vwEtKzpwhkF2/Hxp8eXcyknTNz6y6M+IdVV8
 0AKyDAeKmFylaAJ5Z5QM+91Jg+eF4BQ1UVP9bzax6bbi8srOJYgCf/pvJlE8ZKPpGvzhM96IOux
 k0H6+KAZDxIpLbvmznv+XZZKjtiMDnpH5SxpPKcpIapwM5GVAdEDb7o+VKuhdSeMCu9Ma3FG3rV
 5S/8SwyUgAT0QAm9bDuamG9MZdytS13Ck3TXnGbMBMUpXYdwBew/Crhg1ZozmVgaWp5WDCdEIr7
 INwOAgZoEsOLdyazoxEX1a/OcQEyTkn3/RqbJyMF6QelnsPfV1dq984uNW59gZwXSnzZ4gG9i0r
 AtTJqBCjHvXr/vjLN9Fc+YoKPWRa5WQ0THhyHeJ2LlZCvshZjeR73btfDjc3aju9vqwkE5NMirh
 6XFMoM1GcoebY3L3tPw==
X-Authority-Analysis: v=2.4 cv=CKwnnBrD c=1 sm=1 tr=0 ts=69b165cc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=f2GZPE95ynGLZrnRSRsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110109
X-Rspamd-Queue-Id: E3DF0263F73
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96978-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The SPMI multi-master Arbiter found on Eliza is version 7.2.0, yet
driver-wise, still compatible with the one featured on Hamoa (X1E80100),
which is 7.0.1.

So document the Eliza compatible and allow Hamoa one as fallback.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml     | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
index 08369fdd2161..f28cdfc9cf0a 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
@@ -24,9 +24,13 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: qcom,sar2130p-spmi-pmic-arb
+          - enum:
+              - qcom,eliza-spmi-pmic-arb
+              - qcom,sar2130p-spmi-pmic-arb
+          - const: qcom,x1e80100-spmi-pmic-arb
+
+      - items:
           - const: qcom,x1e80100-spmi-pmic-arb
-      - const: qcom,x1e80100-spmi-pmic-arb
 
   reg:
     items:

---
base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
change-id: 20260311-eliza-bindings-spmi-8d49b1a61d03

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


