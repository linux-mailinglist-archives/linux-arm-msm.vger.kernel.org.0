Return-Path: <linux-arm-msm+bounces-104839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEHtK6PZ72mvGwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 23:48:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5244147AE6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 23:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E76931520DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 21:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5541F3ACF1B;
	Mon, 27 Apr 2026 21:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DvfSHd73";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRaKDDQI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89785399000
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 21:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777326165; cv=none; b=q5fAJJ+oE1jFArDI7zt4+hPL3zEAQ5bwOjCcUAmoRihMHn7Cny4BsgiLL98164wvKLAVazbN/xSh3fsYLi1MeiDnTpL9CaLRA8UqEJ5ZxYAb5k/hNQi6nJR/OmyAa2xTAfYA1SfzrtWZQ9/fwm80bz5M4R/HAWbIvgq1X1l5XDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777326165; c=relaxed/simple;
	bh=Xi8+8vBpk72pueSbcHCY6ojLbswdddkKT2eKqWSkDDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZB5SwMDcjjdTnwc63/VqAFNFSYCqarbNgrt+nlG/rFVyE3g0wIMQFqc5YA9xBHNDSK8vUrAE9PDW9N9LNvlSb44qzQk+2W1hhMR/L4XuOT/N58OeHdJkU39Y9psOcKhiDCtSW/LwnsKIZzSJPyRv5XdQZ2ZSeKUZE2gX+65hxII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DvfSHd73; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRaKDDQI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RGaMPk3123484
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 21:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EkH62hBfkTl
	pUoyRaZs3w4Fu8ixJncnkuN92AWiCoMo=; b=DvfSHd73+kAJ0ftwmb6AtqLiKZl
	/OZsa6Zcf8dspJzo8pFLJ0U5Hfm06LdhFRbks506p9SOAP5GTmjuRq2ipIwaw8b8
	1X/nt1tUNsgtjLUQzbhFR8dDiBZtAdY/BNji647aFuis6PdLwxKQwWzTt+1L+Y8C
	9JMfdn10as15aPT41HY+AfLBYv+u7g/pFz25r+W8HmdSf1mI2hwA+Q+xyt39FUpJ
	4fTSknMLwz9/LIm6YLcLViHiKV2o/kpAq565evuI4s9oi8XB0QvudS3XYnnx+CU9
	nzJtVZOMOHEkY/gs/jwrAhpKtvQiUnY4WC+80ST07/LoajcmTmvktJuDczw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgjgja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 21:42:42 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c35f2c09dso13698650c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777326162; x=1777930962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkH62hBfkTlpUoyRaZs3w4Fu8ixJncnkuN92AWiCoMo=;
        b=fRaKDDQIsw+T1S83ftK40D3VULCXzWkcKaZ/yMnkNUnIga1F0dvDBrWa2BRu/rYP41
         D4fqXWhZ6HCOn4ZlL33y1jGVIyNsrh4zac8jV8y1tFGXKLdLXruaCOqGTC4AZoqYwWGV
         cn7brPOEGKZQOz2ziaBAZkqWZGCGsGsHY+oxVId2Kd/915rsvd3457nLGZ2if4trWJaS
         +BynrJcBK2noZRbv8qNVi4b21aKR4P2rISXMEL0Ts4yFnrDhvDZSyQZhvUp+VWMHkGXP
         dssqmycaMtSgwOg0lG1tNuQjQ3Vfxae2wf+d496bCJBCywavviaaSHiCT3S9NBWWwUxP
         sDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326162; x=1777930962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EkH62hBfkTlpUoyRaZs3w4Fu8ixJncnkuN92AWiCoMo=;
        b=XOA4DT27FSRvhAjRh/pr988eudbdgoB3QCPRyyIdAHrmUa46m5jMZzS/GmO5iSqPXY
         GVamfwqFzkZUSdYzYFZ/2ydIhdT0Cafn6ntRsTYB18thbAlyccoFG/ebtcCZkTlPnGgb
         Rql9n5DC5TXcyXPVdPV0D4UBCzcM7H3PzusIF8NlAwR9oOr+/w5DcmB9U8VYslAoUQNc
         uR6S/XKcXiCOu2jd3jLiYQVQnft417/ukw+JYxgj1Nj3qE87Bxjsmav6gX9fg2qOC1zb
         0uAA1IAMGMLAaMnjrggHpSVGKJwIwS7rIZxaf7NwBIDnuwq3pDbbyH/MqAzk8MVCXlKs
         h+vA==
X-Forwarded-Encrypted: i=1; AFNElJ/xKRLKjvyHSAKMWYCfCSh3pBjtKO0MYbjL7LORQLUNXwsBafYvuZtlg7PNO645binv++3Y2Wu036rZffwX@vger.kernel.org
X-Gm-Message-State: AOJu0YyC1ymwY48fZXCPUpVZMkbRYxExqIUHI538d4VVs/PCs3yuHYp0
	tje14CiD0/wvQh72m+PF3hVkCQ/AoIiqX+Wj2rtFn7lRpIHxP9u0BHSZMlMAf9zrlYQGyACbc/H
	dROP9KGUtr9AQnZDnYkUBA4gIxcxQT5pgC20/0A/mUtxRqBxxibhnpjOe/fPHHhv4ij/9
X-Gm-Gg: AeBDietbM61aZs2Jb8NygmyyOZOxOTUYb8Amx2St7EVRZSUFex9GJLMtl1cjQA0bXHA
	Z88CCRIS8szDrl2GpsLag7DnB0C+5NU2CquQAN5pxwxroYs29hcUOxtUQV+rY0lzEHEKSnYbC06
	DzTaYzLNVYd1Xb84M0aZmennFJMWMYOKB4V/Tai6bj42i7Ocs1K1aowZoW1IspMNPb0pnnRWCLp
	QaDyj1DRkilKcfQjbPl9F5Ti1NYyj49bfr3CKhrYGpYqX0MAj+brnfIepyr56N3Hd/Q18FWtYlY
	v/uM6syfA24e0zwbaQ1hY797vBZTZFEKEuqtsJucaYy6NAWToBzYaCYvfLFsfTJ3RuHHmVI23LU
	Oxtwts0w0H+aCoYmxzNt3H6IAzQG+kA5lHpkF286FCHxrIul3/7sVzWDFcCsnVrNxyBp8jjLSSC
	ab3zI+q5iuIg==
X-Received: by 2002:a05:7022:4188:b0:12d:b2ca:a9ef with SMTP id a92af1059eb24-12ddd987d35mr379654c88.17.1777326162250;
        Mon, 27 Apr 2026 14:42:42 -0700 (PDT)
X-Received: by 2002:a05:7022:4188:b0:12d:b2ca:a9ef with SMTP id a92af1059eb24-12ddd987d35mr379630c88.17.1777326161730;
        Mon, 27 Apr 2026 14:42:41 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm653119c88.2.2026.04.27.14.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:42:40 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com, ronak.raheja@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
Date: Mon, 27 Apr 2026 14:42:16 -0700
Message-Id: <20260427214217.2735240-4-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
References: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIzMCBTYWx0ZWRfX8uDEI6SjF4vh
 vVK5P0bjNCyLcoXHs/ITYAM6+7mgZLi94pov2FxcA+o0rIcrACN+glvMpQcezKMmQdcsa+g2pIb
 rZNUzSmvvPeJjpPmSceXRQctkk+h3oLtvpWlBynTepoHOtICKtP5z49/l6Fu6KnjZzyirA0K5vo
 448qPivVIrUvOPeW0T+B71TM3VbTmLKUIqnIjqP85Kpy5QvSKkkiVeLRU8gB1HlN3LEbI0Fxhte
 TN8kcGf3h8Nzhvnsij0JU0dSKNYF/QLNq+2uz2i1KVqKB6YN4VOUtP2k4gHWPR5Jue2NnEKQCpd
 2cee0+a1SCididEZ4U8lcFPOpkaxtdFcAbHGwE7CLEvKR7iuZCWcfWJaNXwfxPUPWLG0uSaozwL
 6W2/n83oqbUthRLffpGZ2yQw1Rkw/akzMp18Hvi3DbyQxppz6jVXzmRHrluw8b9Cphu3zv4daDP
 p6L4cJ1bxGYU3eP5cNg==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69efd852 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=6lSwUGAo5LeF7p0M46YA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: LJpIhoDb0uv1ZUEMw2d1isrRNxXSghUJ
X-Proofpoint-ORIG-GUID: LJpIhoDb0uv1ZUEMw2d1isrRNxXSghUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270230
X-Rspamd-Queue-Id: 5244147AE6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-104839-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the Synopsys DWC3 USB controller found on the Hawi platform.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8201656b41ed..2d10994f7b44 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
           - qcom,ipq5332-dwc3
@@ -203,6 +204,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
               - qcom,kaanapali-dwc3
@@ -540,6 +542,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3
-- 
2.34.1


