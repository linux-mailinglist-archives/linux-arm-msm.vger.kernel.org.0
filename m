Return-Path: <linux-arm-msm+bounces-103958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHtBLAyA52ku9gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 15:47:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C4D43B80B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 15:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 822383047514
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 13:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3D93D7D77;
	Tue, 21 Apr 2026 13:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XC26Fe9p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IOL1aCr1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE883D7D79
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 13:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776779156; cv=none; b=e6lhinChbgka9Wgj1zJo+2r8L/kD5yRnI7i+8oNgT3J1YoIrj4HR3piYYJVKIKHLBCPlKRabtpMq6hquYMRgMRoYkEkYCMBUCnO6h/zdM7FJo7yDdeaY9RlmYEMk1jq2inin5KJFkjg80CWlqDrgx7LuNue4IH2e3KTNrQBDkjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776779156; c=relaxed/simple;
	bh=XeZeJuF6uvAcv7KAr372xNVFlk4zfZMZani3u+5iV4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PEaU/8jObiPy+mLB11KuOH3pKRQwh+6HXN6KxaWM/b8xWW5vs+IA8QQm4+1kqeR+fXej6wNywgF7PT/UVlXp9u2yAFhdkVKerzqDohWUhMt4ph7heWP12K9hF15/v1n0Jrykzh+caBeU1BjKeWVNLCFjZ7sNaOIkoEiq+T/leMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XC26Fe9p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IOL1aCr1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LBp5M91014344
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 13:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DUDWNPv56pzGDwMOM0T4WCyvB822578wRecc2vE97I8=; b=XC26Fe9pa6hL5Vuy
	pqpPC92+kCIdAnDO6MZ3+tQnEjItNcH7UaUN4I2k+syGHjVJKPl3fwK5/7+R0Xw3
	cWMb5gURf85BuNVlvUMbVGMKrJS2+ld4S9AfdC1T9r0f1icIrDRqFc06ftAGC9lA
	GVomYhbBqPx6iEIKMj3IQrFD0NEmwmyXN2bQ5D6sdiDMw/qBsJC7n6CcUkeTjfdo
	NFIKmu+u/QxVsTfW5Tc/1FmWdJ5Qepo31Mk0Tn6A9PBGMEtIegGftz+ujPzI6xJa
	yUWMu3KZfRBy1CM3AQwfd1SCudB7KA/nSFK0b7obI7LtwrVEwmTbylKIFfpzrKD+
	H8bbDA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnt903d1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 13:45:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e423a05c8so7271961cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 06:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776779152; x=1777383952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUDWNPv56pzGDwMOM0T4WCyvB822578wRecc2vE97I8=;
        b=IOL1aCr1Bso18SU7GkiiF5SGHgnJ/mxLT1xmDAR1nm9uL+8K68hu96EnIqGAgHnyBM
         S+OSwbybKKy2Ber3coLAIEVL1ThQTJ2jaSICVnCBCz22dHCEpsAARRdmnohxxGtVdtV9
         ZWHJOMIc+AOjbGSRrVxwq4G+kZLqWePYkbgTvh/ETrXxVaHdBX6KlL9vOIKavDMWKLP0
         j+py9alwqP/N88VwL5LDhh+V4gcluYo5EwQi9hCSqOVxQ84191cLaCukB3d4Prfg+obe
         xED7JHc2vHFo4GS3s9pXb/wkPKDTnpOh4ZSetXhihnwONUOAn/ExnYb9UxEwFXYQuk9w
         Zzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776779152; x=1777383952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DUDWNPv56pzGDwMOM0T4WCyvB822578wRecc2vE97I8=;
        b=ClAL6Ql+TpqKvFRzTElyzHo0hX72yUmVW7SBAJ9pUnkWJCW0AGyhceGwrT46BFDxT9
         3W/Prr8Lp0SzClAyT9c0FOOBVbGO4X4iBA6IW6IXAqdFK6/2+voQpZBkhnpyTtcG0fBD
         0Ru5i9jB/TW0hDIDHmJZSu5GUoJVQqbrkRwkBd0vZlQw/Ef5hpKfUIEmWx6q+XWgCgQR
         HHQ5TpyB6eBrVPC5ZZaXk0haw3OuPayvxxPxp1TtWyXeVkBAOgvRAR5Zeitodbx0iL67
         DSwSQWlymaJWq4eEeVQCCWMzPz2+tGBQqciQVuOH6RMxf4g333zBP9P3x8BQ6f9bjpXE
         WuaA==
X-Gm-Message-State: AOJu0YzNQRKayCU0nRwAiC682yXNVX+kHi75jlTQiF7ItFlSY/jo47M6
	2V8vBCmVznIBFi3FugSqwBj2bup3tpVYLAhqUVxc2LJ/RbRdF06cNiZqRR4wDflgDtkyf344yk9
	VwiUgyK68JuaKQWWtx1ATbU+rJtMbF3byEQmRvm1yfyhEXFBuSJ/SOqvnaDyRBqk9Ly/5
X-Gm-Gg: AeBDieu9ue+jgB0ZAWaa9fRL/omVcFgNWUwdX2Iiyr30+KAwRPzpE/4PdBgOaNp+bug
	lvyrhk4VCekAeDbX38WqPDqITPNSVPz28y9lTcbzn3ZlywMBoAhOxhZIL59G1aNYurNdg1ppiNr
	WTObXQx2qEON3Z7KDU0aVq5wKR4KFSUPTanVjE6eID6dM3FTwsNiFkGZKwEDnava0VFJd6SRxVB
	NBREHHm6zpqsH6H99gMIi2GelXz9Hxqd9hnRn/qDWmKDV9xC7Go6u8/pWFEbituJU0HWda/dS0N
	Jm8JfOnV/d+eF0KRkbyA3kfTFhQnuKZ5ikETfAKmTFUQdO6hAKZjHkxpK2MB5wWE7i+m29QMFJJ
	upC6U7C3YYSka0peJz+X8n33t8kO2slbMpxo2i8NlLWlFDi0Vub/e12Q=
X-Received: by 2002:ac8:7f55:0:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-50e3664b47amr235411901cf.12.1776779152144;
        Tue, 21 Apr 2026 06:45:52 -0700 (PDT)
X-Received: by 2002:ac8:7f55:0:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-50e3664b47amr235411351cf.12.1776779151531;
        Tue, 21 Apr 2026 06:45:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1249sm34508647f8f.5.2026.04.21.06.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:45:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 15:45:28 +0200
Subject: [PATCH RFC v2 1/3] arm64: dts: qcom: eliza: Add display (MDSS)
 with Display CC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-dts-qcom-eliza-display-v2-1-67f8cf155331@oss.qualcomm.com>
References: <20260421-dts-qcom-eliza-display-v2-0-67f8cf155331@oss.qualcomm.com>
In-Reply-To: <20260421-dts-qcom-eliza-display-v2-0-67f8cf155331@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=12639;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XeZeJuF6uvAcv7KAr372xNVFlk4zfZMZani3u+5iV4g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp53+JAABtnZspv2Av4I1mKS0VF0639+9k2t97H
 9qcyTUS5RGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaed/iQAKCRDBN2bmhouD
 12NJD/sGDUI9VyOr7Ln2IQzmDIx0Lou3QOtG+UZEAbV9Rgntr2gxEiOoS2UsMstqUip9cZvKAcw
 nFu/M3IszMh3nqmscH8bvyByH+9uH8trMSE3i75ruquuxBI8MAOe8XVVHK4MZFRYaMeVRb0z4Lf
 omIV9/e+HkaDHej+tN2SA1fa9lLeXA24T5AI0Frx49UqGUre2EOaWK+elWFmVGNP0HrXx8TQUBg
 FRQ9L3kQ9bNURn1boLYIoJjD5aTx7b+k9Iqdndpi/p8ErWEpDegF9Ah+SpveO79Pg+6Shz6yn1X
 pvZAEPXuYdosWQ6wrlR2p0436Enf9zxIr1MCo6zYkSuQ+xj8SH2JK39RgKSEoDjoeruqSCsu8gw
 KiKEdwU2oGFO2Jxl+K0mIfSWUY0KL5NRdAuD5abV+BRX8eJWI5NfbidxAJIR6La1amophW5oo8V
 qS1+7zgS0xsyoO5JlS17ShmhWnLc6IVChn9TrxNA/N06NMJBMiDHGerGmdsmkyjiefhDSshamwh
 3OPA6jjxjeFm4keuXXus/tNVx7l8NNp8ZGdyIW+OkXfdope5egEsJI8UP4DM8ya0QwFKKcaJ5G8
 gzfnE1wUCELZU/n4GXJrZt896FMfW+rN6Yz5Nvs7bfjJvZ1kl4uRv2Lc73TboJjhHKhXjgunApp
 rLhpjuI0LsR5S0w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=KfbidwYD c=1 sm=1 tr=0 ts=69e77f91 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Z4dGOmx4_2OG3a6VxIoA:9 a=MG4ypNE3HnhXRXdW:21
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: smYWpWA12Z-hq_K8W0KiZdnAN4ezmTsj
X-Proofpoint-GUID: smYWpWA12Z-hq_K8W0KiZdnAN4ezmTsj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEzNyBTYWx0ZWRfX86m6rSrUE3cT
 t51z+Ba4x4pk0OR7h04vhpnsruq9SLGvdr+jYUYhS466gSr4Bo4v6qdjZ0aPgojpFPt0XjB4FLA
 bhOUmXIeghOFDbfX4x3j9GXkJCNqjMNKpFAlHkHEMA4cQIyAstT4dYOPqcxfVWYz5W7OrwhgGkM
 hHNUiMw/RsXfI/WZ0F2ZbmcvHiF8XHS3iak2+4ZLzMkHjPwy/HJRSkDI0ecD31HQnbWjSHeO9Vh
 ht/AJhqeaGrRTHnPWeDMqvc6pHDoBsI4bono4fqlIagonIYLTQ3//5gyKFPNxc6aVSpn0a04mP0
 ANDItD6dkMFnKowNssKU/DMBrvV1Lff/S7NMoWJwFocOsznQ7HAt6OPeOLDDewLf2xwmhlX5la4
 UgnofKO/w+LFcrr19+HnDz9i2PwKu8L4dvc1pQ2whm8N2GqkQ/mGHfAZxPM/Ud1ZxDR5+D7qAnl
 2H3ayc01XdwISVH20FQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210137
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-103958-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.1:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ae95000:email,af54000:email,ae94000:email,ae96000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 01C4D43B80B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device nodes for almost entire display: MDSS, DPU, DSI, DSI PHYs,
DisplayPort and Display Clock Controller.

Missing pieces are HDMI PHY and HDMI controller.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Lack of hardware for HDMI testing, but the work on drivers is in
progress.
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 443 ++++++++++++++++++++++++++++++++++++
 1 file changed, 443 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 37baa4b240d6..f235a72365f2 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3,6 +3,8 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+#include <dt-bindings/clock/qcom,eliza-dispcc.h>
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -1035,6 +1037,7 @@ port@2 {
 					reg = <2>;
 
 					usb_dp_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp0_out>;
 					};
 				};
 			};
@@ -1131,6 +1134,446 @@ usb_dwc3_ss: endpoint {
 			};
 		};
 
+		mdss: display-subsystem@ae00000 {
+			compatible = "qcom,eliza-mdss";
+			reg = <0x0 0x0ae00000 0x0 0x1000>;
+			reg-names = "mdss";
+			ranges;
+
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
+			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
+
+			power-domains = <&dispcc MDSS_GDSC>;
+
+			iommus = <&apps_smmu 0x800 0x2>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			status = "disabled";
+
+			mdss_mdp: display-controller@ae01000 {
+				compatible = "qcom,eliza-dpu";
+				reg = <0x0 0x0ae01000 0x0 0x93000>,
+				      <0x0 0x0aeb0000 0x0 0x3000>;
+				reg-names = "mdp",
+					    "vbif";
+
+				interrupts-extended = <&mdss 0>;
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "nrt_bus",
+					      "iface",
+					      "lut",
+					      "core",
+					      "vsync";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <19200000>;
+
+				operating-points-v2 = <&mdp_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						dpu_intf2_out: endpoint {
+							remote-endpoint = <&mdss_dsi1_in>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp0_in>;
+						};
+					};
+					/* TODO: HDMI */
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-150000000 {
+						opp-hz = /bits/ 64 <150000000>;
+						required-opps = <&rpmhpd_opp_low_svs_d1>;
+					};
+
+					opp-207000000 {
+						opp-hz = /bits/ 64 <207000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-342000000 {
+						opp-hz = /bits/ 64 <342000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-417000000 {
+						opp-hz = /bits/ 64 <417000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-532000000 {
+						opp-hz = /bits/ 64 <532000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+
+					opp-600000000 {
+						opp-hz = /bits/ 64 <600000000>;
+						required-opps = <&rpmhpd_opp_nom_l1>;
+					};
+
+					opp-660000000 {
+						opp-hz = /bits/ 64 <660000000>;
+						required-opps = <&rpmhpd_opp_turbo>;
+					};
+				};
+			};
+
+			mdss_dsi0: dsi@ae94000 {
+				compatible = "qcom,eliza-dsi-ctrl", "qcom,sm8750-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x0ae94000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupts-extended = <&mdss 4>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+					 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+					 <&dispcc DISP_CC_ESYNC0_CLK>,
+					 <&dispcc DISP_CC_OSC_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+					 <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus",
+					      "dsi_pll_pixel",
+					      "dsi_pll_byte",
+					      "esync",
+					      "osc",
+					      "byte_src",
+					      "pixel_src";
+
+				operating-points-v2 = <&mdss_dsi_opp_table>;
+
+				phys = <&mdss_dsi0_phy>;
+				phy-names = "dsi";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+
+				mdss_dsi_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-140630000 {
+						opp-hz = /bits/ 64 <140630000>;
+						required-opps = <&rpmhpd_opp_low_svs_d1>;
+					};
+
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-300000000 {
+						opp-hz = /bits/ 64 <300000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-358000000 {
+						opp-hz = /bits/ 64 <358000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@ae95000 {
+				compatible = "qcom,eliza-dsi-phy-4nm", "qcom,sm8650-dsi-phy-4nm";
+				reg = <0x0 0x0ae95000 0x0 0x200>,
+				      <0x0 0x0ae95200 0x0 0x300>,
+				      <0x0 0x0ae95500 0x0 0x400>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&bi_tcxo_div2>;
+				clock-names = "iface",
+					      "ref";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			mdss_dsi1: dsi@ae96000 {
+				compatible = "qcom,eliza-dsi-ctrl", "qcom,sm8750-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x0ae96000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupts-extended = <&mdss 5>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
+					 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+					 <&dispcc DISP_CC_ESYNC1_CLK>,
+					 <&dispcc DISP_CC_OSC_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
+					 <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus",
+					      "dsi_pll_pixel",
+					      "dsi_pll_byte",
+					      "esync",
+					      "osc",
+					      "byte_src",
+					      "pixel_src";
+
+				operating-points-v2 = <&mdss_dsi_opp_table>;
+
+				phys = <&mdss_dsi1_phy>;
+				phy-names = "dsi";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dsi1_in: endpoint {
+							remote-endpoint = <&dpu_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi1_phy: phy@ae97000 {
+				compatible = "qcom,eliza-dsi-phy-4nm", "qcom,sm8650-dsi-phy-4nm";
+				reg = <0x0 0x0ae97000 0x0 0x200>,
+				      <0x0 0x0ae97200 0x0 0x300>,
+				      <0x0 0x0ae97500 0x0 0x400>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface",
+					      "ref";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			mdss_dp0: displayport-controller@af54000 {
+				compatible = "qcom,eliza-dp", "qcom,sm8650-dp";
+				reg = <0x0 0x0af54000 0x0 0x200>,
+				      <0x0 0x0af54200 0x0 0x200>,
+				      <0x0 0x0af55000 0x0 0xc00>,
+				      <0x0 0x0af56000 0x0 0x400>,
+				      <0x0 0x0af57000 0x0 0x400>,
+				      <0x0 0x0af58000 0x0 0x400>,
+				      <0x0 0x0af59000 0x0 0x400>,
+				      <0x0 0x0af5a000 0x0 0x600>,
+				      <0x0 0x0af5b000 0x0 0x600>;
+
+				interrupts-extended = <&mdss 12>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				operating-points-v2 = <&dp_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+
+				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				dp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp0_out: endpoint {
+							data-lanes = <0 1 2 3>;
+							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+						};
+					};
+				};
+			};
+		};
+
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,eliza-dispcc";
+			reg = <0x0 0x0af00000 0x0 0x20000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&gcc GCC_DISP_AHB_CLK>,
+				 <&sleep_clk>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
+				 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+				 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
+				 <0>, /* dp1 */
+				 <0>,
+				 <0>, /* dp2 */
+				 <0>,
+				 <0>, /* dp3 */
+				 <0>,
+				 <0>; /* HDMI phy */
+
+			power-domains = <&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,eliza-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x40000>,

-- 
2.51.0


