Return-Path: <linux-arm-msm+bounces-99455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KtwFy3XwWkaXQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:13:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F1E2FF661
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BE6230783B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0B45B5AB;
	Tue, 24 Mar 2026 00:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXIl4gjM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SwUbG/Tf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2137260D
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311060; cv=none; b=n85MnOSYvmANri65sOS/rZUXidQgooydcxT0XGtdVzhp74iHn4KbFgEWc9xNwiH2+LQr4IPciUD1V03ZttKK6UReNg8WlV5C6yOtBa1D2B6QxGcF7L6X+PsTgt068X/nepTu+/wYRkvR41bT7AjYPAEizKfONU/yIhDJlgxTHKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311060; c=relaxed/simple;
	bh=ve60Hat4fjDGd6a0MMY2a+1ZxOsOvrbkOAK4ZWhT+wM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RVQoPEqzG0wZLuJQLteFjwOZ47ZfvGWQ0OqO2zfrMK2mwW3HbiS+vqITHK3tNwVuJl7MkRrwBFttwAbn39RvXCrO+q4I3CxFbVOpVhcGT/uASDtDdKJxgZT6znMqu7xdV11t6SajbBmIRbF7CEbpUgqlX6Nrm6qzzPXV92xMS7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TXIl4gjM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SwUbG/Tf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqd2d1762212
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CsLnVUkiBBNLZ7fR/kaHQdxLUTQ7WZot6+FHpylt1ow=; b=TXIl4gjMgU3py3l7
	mEwMztvdpvvfSzamSKkNm5FydLFJtIvB6faC/2WC8fZ5wQ3+ztU+onfogHfmEf6G
	cpenWMEG2DTKSOVm3wrfcsgrzBcgfvG203mRk+YLXTGTxO4U6BEFpxW6PZb6TsTU
	XcLvHq9ba5p1M2JcH3aK0RhlRoTjOVJxa7/851G37XRGfjFxmvVheUwSUu9fn1/t
	SVLqjePbN3FAYFRG4U9Ykso/QAZWAUJmEfqUrj/fUU+0EnXfGe0shvKux83mSZv9
	Tc87rSxUDAm+42kCSshgejRdag5hwoX85zQzLfPvt8o8xzCr6LKreHnzaM+LWr90
	+y8uKQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f0a132-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:10:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b469e5543so7819641cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774311057; x=1774915857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CsLnVUkiBBNLZ7fR/kaHQdxLUTQ7WZot6+FHpylt1ow=;
        b=SwUbG/TfL/rskNEj05GlSNOkC9CghsNeNvLKW5XONq1W2fHGY6tPqdgXIM6TS3V4QP
         kergu8TeNNn44xQ5zoePaYs1bm/u/UZnTfvP3Xud7QPRfWrBfGaMPBYPOJFQulDQbS8W
         r61ocsHO8lEh8Mc/1FgWhdNloE+3dxHjBZN0bF4oPvsT81sVJVIn6tuobUcwxXofMV0O
         s60bLoP5XwRoplWkhkDjNkj8dnFwDlahCCu353P0BVQsOhxEhoSFqf/V9oMt9lrVb88v
         iV9W3Zc7OZhIA85vyad02gFi1J6QlYiNCT30IkKU/2OAkAk8jjYRiFF30vwTGjNwrj9u
         P6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774311057; x=1774915857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CsLnVUkiBBNLZ7fR/kaHQdxLUTQ7WZot6+FHpylt1ow=;
        b=dEzwmO4MafHUdMz74it/3IKrLmbrBL1exPIVxt8OHpkgPWA/auJBlhGpK/33GHjHSH
         QyTuIc9PV2q4+g4CXdNGTsj2Nc1fGObUZFUcZr+sZK3ARpA1ICU79mfI8l6ZZXRsktGk
         q7jXqPDajR1Dn98vGq0Iri+ZsVxR2/jeYWi+vDpR43HLt3Li4wVAEs5josVVCFvwlw4b
         dmBt7if3SsIL25E4gDARb4yE8BoxEaZZLg5yvfiGYnTVKhO3lpsP4sf8hDlD8jLjQomA
         847rQHHp5oHSTNuG3iUppeJFw3yIrcvjuQZG+bWC3O20paCA9YmOq+r5t37G7Ap1U9+I
         CqzQ==
X-Gm-Message-State: AOJu0YzdoGfalGNR+NO+9cJZ0FqjmCeLm5TcBYUuemGbvo2acJDf1zRp
	yJreibNKaLlR3btX0wQfQZSBJIXyHpgNhiNC78QEAYbh/A73ib3t1Q6vvcmXFqIzpnN9VscpUky
	eHWodoBDTKJMC0F53iH6wRXKLTiIU7OoWmNPg9bI7lkIAmS5lhTIsF/Z6KipQomt9vn3I
X-Gm-Gg: ATEYQzxcrps+JFUetTN/9x3rQlgMkj7U7qN8cPJaR85FsbqkCkK50N2COpsQjYnPziG
	hDmEZv7ee2P2unpPvm5O8yApPDzsP6Uj5lW/J7slsj2fGWOqLFcNTd60RJGm6+jJWW2Gk8QVHc6
	8K+Ufs/HBJYvOyT+Y6u8WhZvkMJ0+PPYTk53phcAs/H/jyrpEekgrJMPHd89uR2cKMUejsHwxbg
	kYB5OSrEzNE6IJKoSxNbUZ5ESE0wCHAVyYlPWhMAqLzrIN/v4zAhyRqLei0HJScre5C/en1pXVz
	ns10yG/yHV/DIstD8hw0nzE3f0OFXfLTHmIjuBqaGN/TKuX3Bc/Bn2TosjgQ7bwcgpCX42caUYQ
	Ws2kxDeR/HFEvJznxFje9LSlZ+gLK9HOCs9lTlwCwPeeuBuNvAZWtNJlCga5NVaoLsndfNIKUUt
	VEeUONGOtEI5WFED1K3w4oCt1WuJk6LMwQW9I=
X-Received: by 2002:ac8:580a:0:b0:50b:3ff3:f489 with SMTP id d75a77b69052e-50b3ff3f5ddmr204223771cf.34.1774311057237;
        Mon, 23 Mar 2026 17:10:57 -0700 (PDT)
X-Received: by 2002:ac8:580a:0:b0:50b:3ff3:f489 with SMTP id d75a77b69052e-50b3ff3f5ddmr204223451cf.34.1774311056745;
        Mon, 23 Mar 2026 17:10:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf99820f6sm30339021fa.19.2026.03.23.17.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:10:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 02:10:37 +0200
Subject: [PATCH v2 1/9] dt-bindings: interconnect: qcom,msm8974: drop bus
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-msm8974-icc-v2-1-527280043ad8@oss.qualcomm.com>
References: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
In-Reply-To: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1735;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ve60Hat4fjDGd6a0MMY2a+1ZxOsOvrbkOAK4ZWhT+wM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwdaGRap0iSPvKR6JSr/xjyzH+jJGmbWjfWsVS
 dwH+EadxRmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacHWhgAKCRCLPIo+Aiko
 1QaNB/4/5/jNDRGwUjDlVM8PaEGhw9u3STuu1Pq+JLvRYT/EPsUyKnqKARk4oBruWFwvlpDWVFf
 82cqfnQEtgdGgVKCcA1fd7UWkIy6Ts3+u7YXN7iR1v60kD5wqMVMWiu+vAmA+6i2qYs4WRJ8LGn
 pWUhM9GfyBehiB8zibsSh163wb1I/j7xV8IzdDVm+qHW/4oFxYSCJNxO0wlSkNFoV+AIQnt+Ex1
 rIm9r+EbgtnAk8pIcmQlbGlv+ar0sc8M6/q4yOY75dG0NJrnrErGMSu3gOfIhUycYfPnSth8Ukp
 r0wZi3T5LYi7/7U5gRD5TiF604+lRiFiJEE0kBO1sSr7eapD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c1d691 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=xO2zaiYFPJaqVjnw6b0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: HB1vYjOoan-4QMS_odKW3VKnvqb33z9J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwMCBTYWx0ZWRfX/8OFIzlNdLJ/
 1Y3o7JJ5AQuvgN48/2hUnTm8s7q+l37ZKdg9mmoZuoV5FMCOZiMLedm0e8h6DoCwiDK8XfI+gxJ
 SKB4S4q3hO4e/b13FBfvt1Ynih0Ph3vs6KiJYH8mG/Sq0Gg0Z8ZQ6IF7Se1x4NSQuvFOy4rb/gI
 lBWI05au6lAVPME8UBO6Ea1K06sK9i4NEnITmFGXUmAjXx4RSNHcLI4IixveASLkWlRO4mY9Sb6
 V5TM9wlg49HEVXqVU+f2qVxrIFwzbT+hfYwTThonElT6KKqhEZgufwKG0Elgen9AOY9kjzG+Faa
 d4nSqqz2b2mH2QUNWF2MyleGELsLBUnR/fdsN9orUHtM5q9826V2QVfTlp2j/WZbh3g/sXEZDCW
 vdDAuxwmpuk7yCe8UPFk7cEUNw2ER4GR1CxVTsTdPn4m5Uks887zoOhDwiS91zvqko33Fwwti+m
 gDwG9XrnUJIwFNYxNiw==
X-Proofpoint-GUID: HB1vYjOoan-4QMS_odKW3VKnvqb33z9J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240000
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99455-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C9F1E2FF661
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove the wrong internal RPM bus clock representation that we've been
carrying for years. They are an internal part of the interconnect
fabric. They are not exported by any device and are not supposed to be
used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,msm8974.yaml         | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
index 95ce25ce1f7d..89a694501d8c 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
@@ -32,22 +32,32 @@ properties:
   clock-names:
     items:
       - const: bus
-      - const: bus_a
 
   clocks:
     items:
       - description: Bus Clock
-      - description: Bus A Clock
 
 required:
   - compatible
   - reg
   - '#interconnect-cells'
-  - clock-names
-  - clocks
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: qcom,msm8974-mmssnoc
+    then:
+      required:
+        - clocks
+        - clock-names
+    else:
+      properties:
+        clocks: false
+        clock-names: false
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmcc.h>
@@ -56,7 +66,4 @@ examples:
         reg = <0xfc380000 0x6a000>;
         compatible = "qcom,msm8974-bimc";
         #interconnect-cells = <1>;
-        clock-names = "bus", "bus_a";
-        clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
-                 <&rpmcc RPM_SMD_BIMC_A_CLK>;
     };

-- 
2.47.3


