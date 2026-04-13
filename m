Return-Path: <linux-arm-msm+bounces-102912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GzDDFiy3GmbVQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:07:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 830C93E990F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAF74302C350
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A453ACA73;
	Mon, 13 Apr 2026 09:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWYkF1tH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KH4XCXIy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A383AD53D
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071137; cv=none; b=hhlELw6pTWzP0OhUaGwXIAvL5eL5GPfE+KuGbRvixUlV6wan0yIvUQ2NgFV8FsDBfEtgs8XDCK/NAnegx1ZBgbICw06XVUXIvmkf/8AEILzVtC7oOZyGpK5AvEtEC9pDbVBxdYd9k9p+LK3qsJAZpvYsajUJ5lzsUtTSGwkQsPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071137; c=relaxed/simple;
	bh=EoMB7UoiStbHSBMeq8ZVueYt4jkQJS1HZckwlVOvKm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GNFkkXf791vIPTBSWM58riOnh3XcynazLi0WwB6W4ww2rjOjwSySVVsqBrR74PkSuwCeGD75NOYObtHjXSJ4lowtPhnFr9RqN+U5b6Xr6nog9mepjiNN+yEGR4R7htUjmZelX932FXcxgw+oEIF7MAR+QdxbB1cSgkrD9rTShEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWYkF1tH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KH4XCXIy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D4ifYl2785889
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/O1zcfGsTer4tXwGzbegxRSeRdL1qrj/XaG
	YJGnMpLU=; b=lWYkF1tH3ofkGXV4M5q0XmTmSNeQQ/3qDdFwfD5QCIfwk5Vkfrb
	Mrt88pErNAxVtZH1nGd/GCUjFeqSrc4ZnJlh+KtFQYpxg/w3a0XURsF7LleFYzYT
	Vg0BG5DL9VqsLAUGuirtlDPuKbXcbXb7xqgy24+JE6QEWh/y7ivn5BCJ2EQc73Rv
	25EEBImIo0TmFdEcs0OFdqx7WZeUFNBtcaJxYQrOjW4yCz5sUFic707I9MKo1P6r
	P8i3yzGbbZkxU9hL4LbTBsCh1UrsH6Ep9zr137n6pQQiWqAd6pUma7tl73j0Y7KQ
	hodcAePt1WDQpssxu6+AvL5mCWMSzsqO04g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbpc9q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:05:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so79912891cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 02:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071135; x=1776675935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/O1zcfGsTer4tXwGzbegxRSeRdL1qrj/XaGYJGnMpLU=;
        b=KH4XCXIyLKH7muxmLBfmlIuBAAlN+eGCWp4sLCclnnPoyg2tLjUJwuWo3htQ2Q8blE
         KVMiE+CH5p3xQVra0K46h39ZTxfONDjXXx3rfsGejbKtp75J2VZuExjpfpP6T0qvCxXw
         4lPri1orzurDAv2WcAf8+ungwvtTvkMyfEAs/8j8f2X0Zcm6Dk+J5kg7P/JgsAfu7IKa
         5npct8+Kks5ax9cJ6WxrcIL3YK7xvrJUYmBl5ulIOaYABxbDAPMIjkMVhRYEpzk1xJGG
         SL2xaJiseA6TiaxYZN2nEZuMLJAdOSyLGv66qMzFUcfdBS4yqbKwHzlctERLbNABcw5P
         degg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071135; x=1776675935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/O1zcfGsTer4tXwGzbegxRSeRdL1qrj/XaGYJGnMpLU=;
        b=Rwh/ewWy7x25qz96LaUxsJ8JQA5bkyQppKlLMmNh2d0pN/njm549dt38TO9+X1RJpq
         ueY4prjFXfnTLpFx1zSleQ981/8wyuW0mfsv/xGy3fjmzbN8VPaTEKfp8HOefXeeMeAp
         HXc8JICbZ5coixrMasvOvfH+eQYeTtk2m14v4pKVRjeEIVIVReZxWu5gO1wJ1Nk/sXuW
         OoiFjIZhs+dRDmUWtRgW7XEcEPzukV3V8CgLXHc+JPECUi1jYus090hYP1leH9/tYpSV
         hqYWbP9T/4497bEMj0uiEwDtZva0+zhjztQtgctbBJIGnF8a7RutVbHE5T8wmTLYn3XH
         zstA==
X-Forwarded-Encrypted: i=1; AFNElJ8mBOOkPr2/vgsQ1QF+Z5BTggdO6/AuB5OakMa6XUSNxNnldDRLjTsjsdhNHBBKDAPn5if9YottQmrhx4Wp@vger.kernel.org
X-Gm-Message-State: AOJu0YwcVAx5xMrOyD0g/AKFIGoVij/T0tk6IQXLcl494RUR7OpuS7Rq
	x/ZjNJarO98wPwYt+nGRM7kBufiCCiBW0/oIfl36ww5vgcVOnv9wfMQX0KeDTnKh5Kafa2+SO1M
	2zkZf3UCsPpmYAAD01KbHC2hvLascifIO9mxOx/E0yyHXIFAq83hgmbnXuLoerCm7xHww
X-Gm-Gg: AeBDietWSy5sA98UUBH8UzjmH0txIE18x3Rr6nR0YOra4ohNTM7bgaqFDxr44ioCaAC
	9q1onDIQ+v8y1g0FVYUJTA8CnHQKThSLjdphXOnJfCLNwE1QgSEsOtHZ7wC98mwmFach+FgrgiZ
	KcZeYv9ucMj37uOfs/VVzFZDEd51THC4iL0NJabmy/UMwyndrmlbcv7wNBibuUZbmKE/CX3RfJn
	NVudkzrPDouP164swfMiH0en9rKvT3QItaGbXzjmDEw6LHD1OduVzhP489UU9UiI7k0+CvhCkfe
	Hi8e3Kys7aOfaU6jqUee+RFNYm5ooNaFoRi0kOXLI4vFfUbJgj+ZNQdJzKbjLCsxl8A+AI60Yb5
	jrLcOFLdWZX1kawQ3hag2XOJBv99XyAIHyawc
X-Received: by 2002:a05:622a:1b24:b0:50b:4eb9:a97c with SMTP id d75a77b69052e-50dd5b66409mr175432601cf.15.1776071134829;
        Mon, 13 Apr 2026 02:05:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1b24:b0:50b:4eb9:a97c with SMTP id d75a77b69052e-50dd5b66409mr175432121cf.15.1776071134241;
        Mon, 13 Apr 2026 02:05:34 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5b56d1asm270409685e9.15.2026.04.13.02.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 02:05:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Dang Huynh <danct12@riseup.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm6115-pro1x: Correct touchscreen GPIO flags
Date: Mon, 13 Apr 2026 11:05:28 +0200
Message-ID: <20260413090527.53000-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=EoMB7UoiStbHSBMeq8ZVueYt4jkQJS1HZckwlVOvKm4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp3LHXtew+/THa/ZW3QxIHoUVDNI8tVAHwriS+q
 I6ibfojmCCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadyx1wAKCRDBN2bmhouD
 16t2D/4z2IUrfD6nyxcywzUeAzl5yy8KHM2vUnjwR6EWL0dLrTp0N9rqnmSN9BYkrpGeVqI9R8M
 3QP0dgV/BzfrspQgawHEfuiOkUZEMN/6P8IjVLTyRcxiGETdcs5p9nbDpxFt/gwwoSTxqbj8uvI
 Fxb3yWKFvG17X5NQ2pWFSFUldyYbBCib1L5Rkpe97vnbWEOmAT8BujWosj3G14p4RWEKue4P1M8
 8RBmPXtZ4Zm9i1pitYYucoF3DLBtO3smeYT/swtYwAbWSgAvB2L7IBTEOIkcnStDUps7hWXW2C1
 Q7hEnOmcFq9Dw5zYaXsuX49tWQXZ1BYQfbM4of57CYs8KTMLKAyUk2ErcxqG4m7+XsuuIirhjSJ
 PAT55TrV+OMnGfI6FdMaHhwS0WVUbvJ/bc5fU40o6EEiyqlhFRK6yGUB5w6yv8chqtCdgFpW4z3
 lq/OEQLhll+5KKgJ004e0JG6CuNCKDZ4JwcPW6SgCZr273O7Tgrhnvtxib7xbtCEmqOSFUWpOBg
 eN53tCZGGPz27NRq5XhKIdrz/WSGDVArmNX0pvA7358+wVJvkRhdGvbuFrKhV5zYWrTNiRd+L9Y
 iNiCwGTmW3lS3YmEOnY2W8nwoPKuAJ7/6/v8BtzIhMWmM/Zi03aDkiIxNM+vUqTnAVfnDYPrRZw tOxXXiuD+iQRm+g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69dcb1df cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Fqtji0Tb7apkAwCtZtUA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: HmNtGChgH2jS5wWBidjy4Wgw7MZbpMAl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OCBTYWx0ZWRfX8u71CXZdJun2
 jqLkvj17uOXR2pXGQcFjvjkgzG9Mtz3w/HXf28R+/U3m4hE1LEaeE0dxYtYCXB4m8bQbUHyZPNH
 XQITzKLPSjijnkl3+FMfUpAtQePHdx45qr6qWc741iaNIJb5hG9JoadgzEmKwOTLNawn63QdMlk
 syZ3sgExF6U1FK1b2uFzMiuSDJPe9r2pZn9a0cX7/5Qx2OwkgFZND6akHN38vb+c3glDeY6wobk
 05i9Y6VP43odHEc76CDJLDggz0J3D6b6w1Ymwzww2mzqqxWlsGlLlT0bxJw762iKXejxlNo5bnU
 B+42MIqosW5fAlCC6CIg0+DTWs4Lj2wPyKHO+haDGeY7E/GaaC0Es0t1UaWDnmwsPrMl3cmQN5A
 l8GqlXxUSUdAeiYjNsl55YkKqRXlHlWJpyNfGPeNMK47+NhZvrPdyTnwTeIY58pFSAc8NKQWHkt
 TUHu0eX0QC+Kts3ainA==
X-Proofpoint-GUID: HmNtGChgH2jS5wWBidjy4Wgw7MZbpMAl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130088
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102912-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	NEURAL_HAM(-0.00)[-0.998];
	DBL_PROHIBIT(0.00)[0.0.0.14:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 830C93E990F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

IRQ_TYPE_xxx flags are not correct in the context of GPIO flags.
These are simple defines so they could be used in DTS but they will not
have the same meaning: IRQ_TYPE_LEVEL_LOW = 8 = GPIO_TRANSITORY.

Correct the touchscreen irq-gpios to use proper flags, assuming the
author of the code wanted similar logical behavior:

  IRQ_TYPE_LEVEL_LOW => GPIO_ACTIVE_LOW

Fixes: e46b455e67f8 ("arm64: dts: qcom: sm6115-pro1x: Add Goodix Touchscreen")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 466ad409e924..1095454716b1 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -151,7 +151,7 @@ touchscreen@14 {
 
 		interrupts-extended = <&tlmm 80 IRQ_TYPE_LEVEL_LOW>;
 
-		irq-gpios = <&tlmm 80 IRQ_TYPE_LEVEL_LOW>;
+		irq-gpios = <&tlmm 80 GPIO_ACTIVE_LOW>;
 		reset-gpios = <&tlmm 71 GPIO_ACTIVE_HIGH>;
 		AVDD28-supply = <&ts_vdd_supply>;
 		VDDIO-supply = <&ts_vddio_supply>;
-- 
2.51.0


