Return-Path: <linux-arm-msm+bounces-103239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMBvL8dE32nzRAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:56:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5484019C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF10130CF4DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 07:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B753B27D4;
	Wed, 15 Apr 2026 07:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h/t5IfgF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XxCzG9Yh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921AA3B635C
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 07:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776239603; cv=none; b=SRLyw84ed9ajqaf4nUESoTELomHEJHWdkRYedVTAb8GX+QngM7WxqgzJCkTsVQsG0NMDq3+Poddx4fjYEp9Vkor9obsI3rjPWFV6/XHjfet8NLzXzAdnBCNuiVhQgERgBlaHzje2KD1c+P0zUVucMxxIAVQcOIGwNgUgp2fEdoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776239603; c=relaxed/simple;
	bh=F9nBylT8gwdnIzBW9sQ2lF5pOxrCapc6iKyVgITuQhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mjpn5yJ+b0yTR0XCTWtNCrK7+XYzvmEEUdvFALEtdT7TpNRx2DtUZ5oWoQ2Tl11EPFSJS8VpUNbEcjcKbKsHdHNLgGjT09/1i3bEWz9dHV7tI4yjuboz1DKU3NZ5kz2uUzWNeTvMEYQUSlVv+Z2CCznSzpThhaIbAwfKL0sk/yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h/t5IfgF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XxCzG9Yh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F1fC5L2005543
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 07:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1N4qQvo1hCeC8p7xFW03BzTAJTuJ6TB5gImGlhTYjJg=; b=h/t5IfgFkyrMbGQs
	9751o6vZNUQPgTjiLxgpitpP9t4IEIuWSU1MO8RbJHQtjuTDuXODL0FzOC7tYMVT
	eVDswQp5v84gUkBzq3TuEW3plkumGgcAScruWBYsGg8tCROp1LpXSEijDYU7ubTr
	wizQpRqw91tryjLrv8Sn3HjhnO2LLn+iZFvo4iL+CO4iJ/oLT5D+n/6JFWJRwATo
	DQcEXM6aaiVo3TBQsmjezwnzf/7b+xRaXeMjnDrTB5ROikVlleNxjcW/19Mprd0T
	Ns4NFbDmNunUb033gXtyw+p0Fr5n33S/Cy27KJzW9rXp97j/lKvnSRprDtWloDFh
	dE5FXQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrsjtr2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 07:53:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d58bed44aso192097741cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 00:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776239600; x=1776844400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1N4qQvo1hCeC8p7xFW03BzTAJTuJ6TB5gImGlhTYjJg=;
        b=XxCzG9YhLmTZKWE5cr30lcDw9WCQmdG6HO/c+U3jBFgTfL0258MJ2jaL0+5ijmD+Rm
         mtwjoGLAuREuihVWS2jR1OiUB0USXXsY0rVM5t0rK2Ong3Dzv52Xa4OtaBdKD54BHgIW
         pM2Ewc/mCfy02zoRzTdjhhiEOmmt+WyAZGwPQlfh38aEaPRE7qnJjiCD6w1wQ1XCYitQ
         qGugr5Ofrv39r7y+joBAnsa3OCw+cb5hOLSEexiCreVSZp5jBs/PcWCy9nvggDFbf4GH
         6XAqNhyDdAxWHTVwH6Iz9kEGJS650LIdQcdtZ2/686A401/t8UisST/TBYQD0pxnGscu
         No4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776239600; x=1776844400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1N4qQvo1hCeC8p7xFW03BzTAJTuJ6TB5gImGlhTYjJg=;
        b=AyR/jewQvIMLxmNQSnABMlEeOXkRAFeS0OcrZzF4jhNowHyCrWeuGpYpzjriZBZyQM
         bvDiloFvG5dDHGRpj2tA2uOWE+RTYuPdbCwaX8NjjUstKZTI60YNqGlOTnrOOaG/OunM
         D1fwgFEiDsIraxE9aPq92eAn9Tt6j460pIHXgH1lbNFagAhYm3OyF1TL/nkWi99xa2it
         tk7FwZlQbP/+pwh+xYZQzFr3Ht8W3fL8jnPHXmf2y1wZuhoNW1m4TLtXZvEww/kamkJL
         NDOqzyrnI+UxdgChU519N9X1R4uKWTFrOdO2RYkPYvl3f2ZfwA8jS45NfhwwwGJisEss
         tUKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7VrUexkROUNB31TJkVzok0oW/j3K/Fmp4lfIGLHD8txiAQffYqCMqnduhj/lmVzt8RGTyUfSswGMD6gnJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxEuFehWd/y852OaCLDOuVvzJsQCslAHT+oFSUEojgyPCN1YlvG
	RKaBR0JWudJcgo6XX+oHOOnp9lm9EBkXaDr+E4/eZ5rtZ2rVdctgIpyfds72Iy5n+YPiaelRWyt
	mnj59GkclZtEBN7rCw6Cvd+5BTkZE8eNMhDdO/p7ALDwgAiI6Stnbu7B0DQ7rVjrGsQHm
X-Gm-Gg: AeBDieu8F0GiVSswxSBbiSBxoTrJc8gDkctVfmzBrcXF2r1/UUsIJWMV6miQuPyqTI4
	fcGVuw9p0Y4xCK7rjWXBq6nP3eqUlPE06GHrzwKDwYqaZCf3DeSLUjezMHgnzUwMUhpY5H7t5H+
	lvTyXt2lRGCvDV33IUcT4FSxRtTyQV3wOdiryFdjEq7Se3OZcvXfJ+WvRHozzF2jsniwtOLHPYa
	DmCFSHIIcDzbs2mzabA4sMvhDhZ2S/w9oJ64GtHHvBTSmhJIfeaY0I4wG1UrPn5nULKnWi05mYW
	eqeD3CJCy43e89JqRpOc7H+Q68rxpZtu/9ee8927nvjboywyixQ3kVgbDIpvaOF7nhxAgu2DiLp
	w6VfSAHOQYcxEGUbYh1SQMTpS06urNGqBmpU=
X-Received: by 2002:a05:622a:4009:b0:50d:66b6:1564 with SMTP id d75a77b69052e-50dd5bc5171mr313668101cf.14.1776239599943;
        Wed, 15 Apr 2026 00:53:19 -0700 (PDT)
X-Received: by 2002:a05:622a:4009:b0:50d:66b6:1564 with SMTP id d75a77b69052e-50dd5bc5171mr313667911cf.14.1776239599359;
        Wed, 15 Apr 2026 00:53:19 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f0e7ef99sm19334975e9.8.2026.04.15.00.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 00:53:18 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 10:52:56 +0300
Subject: [PATCH 1/2] arm64: dts: qcom: glymur: Mark USB SS1 and SS2 as
 role-switch capable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-dts-qcom-glymur-usb-role-switch-fix-v1-1-409e1a257f1f@oss.qualcomm.com>
References: <20260415-dts-qcom-glymur-usb-role-switch-fix-v1-0-409e1a257f1f@oss.qualcomm.com>
In-Reply-To: <20260415-dts-qcom-glymur-usb-role-switch-fix-v1-0-409e1a257f1f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=973;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=F9nBylT8gwdnIzBW9sQ2lF5pOxrCapc6iKyVgITuQhw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp30PfkenHSe6gkGBuoiFqm2zafXz9Uy46ab38N
 eb6QRC57uiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCad9D3wAKCRAbX0TJAJUV
 VtUpEADDgJe3/6XZFGZcnU4ycaPlJUPWn3SVzP2/Iu/CdyrVMwEE9DgHkDcSp8tpylaAVtJ/Qeg
 13uP+pt91oco4AklMXU7ECSG0lTMU8lwQJs6+KGrIhiwV3D+lvxsRUpcUlaNxNhK8A4xsVGn5DU
 4Dez1S/gZRXWYWFVbx0QVPa0duK75Fc5eTJ1r9OzZhTubwdVA69QJ/+goTJJNeQOccy/PtSHl9K
 iCgNvSookpVnFXcPPCob1keioBCZWiCft13kyIxTuH1mRm213dUqpeBF6KueHltG4Mk/lp6QqcJ
 uJo1ug6lzUrCeVqu8TgfwM9HDW3I72ttds828gZ+FvXSBEy5fmRNGMhJMpvMFdcgXaX5FPWrVCl
 qGbu/xuGLDBdLSPWgzNPq+jt/0+1bC7kztad5KRrqrISVUy89HuEgJFpyCLSZLZZhNXsL/PCJss
 H0nAh+k5kvyKwLywRxz/VP1ijlRBKJ3SDsYTDBzhJwM7dsyZTUgNEOx4TlNCJbPnr32zQ7DFqak
 CRJ0u24xT0nDfZvpyRNMKzu38jNiaQIVkDweIgzeqMbyYs3VFmmNlgQdBg7dPyOV3SX2OuNcjYL
 oOcfjsP2UD8Vbo2qQAQHMQz+SH4c1zqPk5Nalj76Yg/dxFOzEI7hgWRFPyEG7RzYxaeKQ5NBKqC
 Fi+lUHZZraHmIRg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=WKhPmHsR c=1 sm=1 tr=0 ts=69df43f0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ub0iOiB/G/eXZwGovfl9ow==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Eb4xW9vDPm6OQTOasFoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: CbL0i4bhqv9Bo80m3lCV9kjehliTb11y
X-Proofpoint-GUID: CbL0i4bhqv9Bo80m3lCV9kjehliTb11y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA3MSBTYWx0ZWRfXy8ZdpNvlq0Kt
 sQ6UO9XUDc7a7DuM405EwXgIWA1h+Ft+fC0uWFN+KF14vOyWBD9RzaarKSY8NVk+yI7v0kcYc1v
 oOAOahiBcAzOxFy9NEEazujx0h0jnaqZ71ox8xm5YaFR0CTwC9DmA4nqQ9iU8MwDQNoICH0XmKG
 pOVOwDzJ06QR71rKfPEbiy6e2rzrg7OFdqV4OKW2jAuguaBW5Fju+MKH1soI0wSEB5X+XbrYfzm
 BGzYGbtmMVw2vP8lAztyaU7QSmXr7B/nnD3UmQjOl+MgDiDbt5RTffhua/HtzzWxLeeEDkYa6D6
 It3GsOrlG6WZ1AWkHTQiFmP0OCwTnkKtBCdQ2DsNtBrFRs4tLzeFNdEGB1eDmfmA8xaByINdcX7
 S0LkKaW7G3dZwTRYVgEIo8fNo3euy8oUU1N5xRt3Fqq2k66wenVW/JED/hYHkttPsthNPxPZ8Lt
 nZs3Q+wjM+yHhBXRAEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150071
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103239-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,a000000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1B5484019C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Like USB SS0, the USB SS1 and SS2 controllers on Glymur also support
USB role switching.

Describe this by adding the 'usb-role-switch' property to both controllers.

Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77..0251ff43d594 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3928,6 +3928,8 @@ usb_1: usb@a800000 {
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
 
+			usb-role-switch;
+
 			status = "disabled";
 
 			ports {
@@ -4001,6 +4003,8 @@ usb_2: usb@a000000 {
 			snps,dis_u2_susphy_quirk;
 			snps,dis_enblslpm_quirk;
 
+			usb-role-switch;
+
 			status = "disabled";
 
 			ports {

-- 
2.48.1


