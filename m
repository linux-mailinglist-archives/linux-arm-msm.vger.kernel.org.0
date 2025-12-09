Return-Path: <linux-arm-msm+bounces-84812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3358DCB1639
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 00:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A616C30C04B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 23:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1FD2FDC3F;
	Tue,  9 Dec 2025 23:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d8OTHAip";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CgK5LDK4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9672F83DE
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 23:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765321794; cv=none; b=KxQWLvQ+/QySAZX4DiDLhUdS2zdRvivA4d/Y4apMi3WroPpN/CnYMQofv4FSf6kXew5xYs2BEI9giQ0WyYThDZwYU5ycWNnyJ+w/91E4WdxHiQ3WA4IvSz6aneG8OH68y5pXBk/mKOmBMtaWNFN97OsFpOaiwOvjBa5XMhgteuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765321794; c=relaxed/simple;
	bh=qDZiN8qWhPOK1kIHAnER1P55PF/9q+q+Ql2QMO5Jsjc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jnPnWywo9x/eYFsQ/EZT4ErJn6h/bATQGTeUriZxUjvX4lrmgwY2L0jCLFG4Tud9tzer0OgtpHVFv5MNxOn8bZwL2i+AURwLGJlY8BPXuaR2UmCzEyT3LEC1pZvV3UO+2V4iks/0j8IusETA8QZ8QLDIcWE+MMViYNMifISffVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d8OTHAip; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CgK5LDK4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9MmjL7656484
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 23:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nun6PcARzgeWFRQT6VB65C6yjfRHuUsre9hbMWhcbgA=; b=d8OTHAipTdNEPapE
	rBI8BnU/DgwW4bUGjsrU9WemKU6jpVbQAR/PbOlm2GpuLJ53/vx9IBZ/P1JEeM/A
	9QRwU/nkXmpMyyOvOmKW1sxbaj+lt/qoKydO3u4xfvYojaFwQtRAMWNVU5Sr00k1
	h/E54xbWX+Uw+4/HsL+KX74dCLyDLMBft/ezabX6adjWUw6PyVmUJcKNj1Xvjmws
	7FUCV5nCJPKiW2U3HR3zB513rf4f1jsQERuS9QluJDKqNBO6br782MtfrKVaX57U
	2EbODzQg0OGTYrApCNDtLnQU7aVklCukytoWLPsc6TKj98nKIq3iMgrR7dD2pyEP
	v7YPKA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axjk528bw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 23:09:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34374bfbcccso5254695a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 15:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765321791; x=1765926591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nun6PcARzgeWFRQT6VB65C6yjfRHuUsre9hbMWhcbgA=;
        b=CgK5LDK4KD1hPGufZxNZYKc9g9vP6KwH01s+Aw+enfnfewWVui3IolEZ65J8gwOBO6
         Wi07QijJFtshovnOWr4gQRVEsObZZrZvM3CpylMCnlHnttSZpEeNzGrPfKJMLdd4e1+t
         O/xB1Kyvg0xLQQvBq/tjVkrpCnRQv2bWUzS9kECqErB+LsIbT9pOgWKFCrbc+jF1ZUt5
         iWxkW5vW+OceN26TAXigAjcNgxSOxB99nQJ2hIWKQGqt2AovIdF8B+6HS8AUg/cYGjCx
         B5r0vDYNUXvG1g8j5gsQORpFBsjiD1jBrN/jq00UQokP1QvKaw6rk28plTuai9t6wA28
         M7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765321791; x=1765926591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nun6PcARzgeWFRQT6VB65C6yjfRHuUsre9hbMWhcbgA=;
        b=HlbTxkDMa4GbkKDtV5Eml2l5N9hHyolrRYyMQIEE4GGpSD2IOVpCUz/GFf36WlQFyt
         QrgEylnDQt2u3hdjJSpVRB4t4ssoHGivdGeRjd5Lp7C8PHfReHnmklrFHb0dHxtqI+Am
         mJrIzhrt8d5bJofkQAxeJwJf8bl/dcgyBtBaTpgQpTDYL5oL41AHPDhCyVFmUm2IonV1
         T1jzDdO7x47hO2YNyUdbdf/M49qxUk7pe++ovCKq8cL6rR/Q7gSU6PclSmoOhOe53kKk
         9txaDSdxgOYVdstIyC2kWcjiK9+uP6W3HbEK8AddHjjd4Dk0mdhS1Nlt+32k1o7wEszj
         ACXg==
X-Gm-Message-State: AOJu0YxmR+/QqaWebaqXSIqglGGZONPdQN2AJ80Ri/9Ed4U0aoE3X5U1
	xV7FTHptWhZuZLHlkya2hSL6Qj8qVGLITaUMbzFLcLgfW8yp3VFlH0OEXK2BtFLMn+tGWLb2cuP
	f4IzuenfSTlf0n5e6OB/CsP0LVmh8u1ibWw9wqLpwbaZhfrm10BbocZAVdRaFIRxcQCTO
X-Gm-Gg: ASbGncvktL8MOVsubI9H2+Z8mDEiZlLi37uCC1qSrciPDsaLZLYWgfZZ3MbY3GmkkZv
	G5Bjve0EobBoEHCFmzsYCh90Ok66V08yVeMi+K1BmhQTo0sRxZLTtAmY8z/3D4n2qYPTg47Oltp
	7bDLbz/2y0Ro58r/rCUrO2VuMX26q5pe6SzT2oF3Ax13J8tme1557ZuoJwE56ScES4iyyAMaQzM
	TfBBHsL/RXK4o53O+thbSZ3v+LIlvdXp8JDY0H6ZD0S455anXkti12XGSyz7Fa8UPbydH+XID0y
	TSiw7iykjIszn+Ag2FRyLJAY2ZNbaZaYv9lHamQnw/BdI1kH1gp+4cV64dHgYQMPEPTo6FhH3NF
	85/uXtKyl2HrQz53Q4VP0+ZHUmjpfXMrTtuxFbCBXtmTgk9U5zuWYP9kTmQJ0wQ==
X-Received: by 2002:a05:7022:e998:b0:11d:c22e:a131 with SMTP id a92af1059eb24-11f29669d4dmr307559c88.3.1765321791160;
        Tue, 09 Dec 2025 15:09:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7byTyjv4Ds7LevZmPLqhvm4PeiTpKdD5Ma4epPiMUe1vU0jkIRGeREHdvLRx8BdXVG/TeIA==
X-Received: by 2002:a05:7022:e998:b0:11d:c22e:a131 with SMTP id a92af1059eb24-11f29669d4dmr307530c88.3.1765321790659;
        Tue, 09 Dec 2025 15:09:50 -0800 (PST)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4811sm3338933c88.11.2025.12.09.15.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 15:09:50 -0800 (PST)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, abel.vesa@linaro.org, conor+dt@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, vkoul@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v8 2/9] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI PHY compatible
Date: Tue,  9 Dec 2025 15:09:38 -0800
Message-Id: <20251209-linux-next-12825-v8-2-42133596bda0@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209-linux-next-12825-v8-0-42133596bda0@oss.qualcomm.com>
References: <20251209-linux-next-12825-v8-0-42133596bda0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CDCv5ByMAlddhv7VsaYQiN7hjTj4GIk_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE4MSBTYWx0ZWRfX1cVD6Lv8LUvr
 psZHh2fIiQIVe2zWZ9AiQ9c8cDUmcP3PmeDhA1ht1Y/szfYd0tyfl5c/MYZl5cXCz34J5etJ5jt
 oVaqMR8yxvRoOFgPS291+VNefQH6HXqhVCgERH/nF+SMzvVw1ebJhhO/FCvZw/5Q+4VCaf1mPBi
 veLstGMLPcLJjiZVFJHb/8b5K8Xm4m63mw+sZyUj1S2kXnlUFd1aO+bMBEnkPE/TVmYIIPGos3r
 qSFo4RyLdjzPcCFy6qej+XCuaBci9th37iISvjOrYc6maFKq/qQMHSktaCXwx5FUpAULm9S6ZS1
 vcl8jE5yFPcO0DqPTPLuZVwAUv7tj7vxnbHpNy3GZRV50LhsSLO49dou1o3uye9BJpsFOVMll9z
 3J5Oyiq0+MIrbVZj9he9QvNfryNVnw==
X-Proofpoint-GUID: CDCv5ByMAlddhv7VsaYQiN7hjTj4GIk_
X-Authority-Analysis: v=2.4 cv=RqvI7SmK c=1 sm=1 tr=0 ts=6938ac3f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=y38mCk_zKuY8i2H3vSwA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090181

The Glymur USB subsystem contains a multiport controller, which utilizes
two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC, and
the required clkref clock name.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 863a1a446739..623c2f8c7d22 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,glymur-qmp-usb3-uni-phy
       - qcom,ipq5424-qmp-usb3-phy
       - qcom,ipq6018-qmp-usb3-phy
       - qcom,ipq8074-qmp-usb3-phy
@@ -61,6 +62,8 @@ properties:
 
   vdda-pll-supply: true
 
+  refgen-supply: true
+
   "#clock-cells":
     const: 0
 
@@ -113,6 +116,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-usb3-uni-phy
               - qcom,qcs8300-qmp-usb3-uni-phy
               - qcom,qdu1000-qmp-usb3-uni-phy
               - qcom,sa8775p-qmp-usb3-uni-phy
@@ -156,6 +160,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-usb3-uni-phy
               - qcom,sa8775p-qmp-usb3-uni-phy
               - qcom,sc8180x-qmp-usb3-uni-phy
               - qcom,sc8280xp-qmp-usb3-uni-phy
@@ -164,6 +169,19 @@ allOf:
       required:
         - power-domains
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-qmp-usb3-uni-phy
+    then:
+      required:
+        - refgen-supply
+    else:
+      properties:
+        refgen-supply: false
+
 additionalProperties: false
 
 examples:

-- 
2.34.1

