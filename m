Return-Path: <linux-arm-msm+bounces-85916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CD03FCD05C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 15:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 94C9E303EDC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F1D33A010;
	Fri, 19 Dec 2025 14:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kn8iOO5+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IpoPnRI3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE417328B6F
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766155657; cv=none; b=uIg+qDV9Mn+DLIbZGjBxUyZpGh4E73Mdc+KVNdiD93nyIFxClANyqoCKcGTpK2sIaW1gGGjBzWqcvfipS1Wge3XXONjjGldHzOoDQskp8nFW/qaL270E4qehvI/3kw9OCFHBbqQz5Q4svKs//g+f8s6jRTvHGplIrZmlRUyW9/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766155657; c=relaxed/simple;
	bh=tvnF6b6bmdFNtT9eNlHsTHBdpRoglpPCbrEKqVihJrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XbQCgajK09EEv9gvwZslToLyXdkdvQe7GJ7QkqlU6B6FsGvwq4M8aWybfaMi1vlXnOXrxAuNqOq0oTOHu00F0iBD0sPh6xtg3h/N2yqykzf/yPMyHRsDn3Q4TvAxBaFsEAoNDwsjmo/4PE31z2vEuQ1nIBLEvXTyYQ45c6z0AME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kn8iOO5+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IpoPnRI3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBW21A091077
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xSOvkrCQO6Ag1SPdS9SjxXj3fHZBIceCMll5gHyoV+c=; b=kn8iOO5+q9clOlUl
	BdRAlujtH6Ag7madWJb9IdxXtbSgsoZEjLynmEtJTsZM98by7C1ORVA+oYEeNsEf
	iJFFoGMqHXbpWpuTx+S5IZcLIv4td/B9PPod3MFyIOIKO1mao+QTSke19sOSTb3f
	StoBkLI52lVrvscSbT/OJWe0hi4/Hzcqnec9NWOAiuWzwywo4Qdyg2JdEkhPK3ze
	nzXTwPbpNy5gQroL6yh+1rrt5bkMLVwSbQ8afyp3KTHTVGV+yYc2RwOIvOYn0428
	sJAqf5MRb/BP5jQFJSjMZ3Dvjd6D+lTmzL2g1CMjr3ief6AddxUAnm3ihTqVzRGk
	1nmzoA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2eb056-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:47:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0e952f153so50518145ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 06:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766155654; x=1766760454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSOvkrCQO6Ag1SPdS9SjxXj3fHZBIceCMll5gHyoV+c=;
        b=IpoPnRI3lNu784Kt2V5DrnFpLowm1VRjGJaeKow34xEyEpX+JBDs5BXIFE59P/w829
         SP5XjHmpBB45RTZ0QrepTHBtngRRyGvQ5txgIp051JfgMhTT9BiBsO37YyAYofxPwCT/
         eky3+CjfBwBW7dcoTD6UXhnCsxz31w2bNuiVdPOBtTvl66VHaiwEBNMnMDnI1FZ1metE
         POBg4/JHpzZEDkwYGvo7g/MbAJymWPSzHobuAWDYXDaA/S2r/3aj2AWjliLNCT+lnF7L
         USn9Q0GNIEafgSB1531Q60mDbgsdvosf8liGcBQhgkKQ10bzddnrZqzbZ0uMLsZTwgIt
         q7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766155654; x=1766760454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xSOvkrCQO6Ag1SPdS9SjxXj3fHZBIceCMll5gHyoV+c=;
        b=R8ICya3uCBqlS/LHumM4ksROdEN2AUJ1ZCRTrUpxSYiitPWTk6RP9CiCQuxIc0C2uo
         ob82ERmN1ooJSOKkN5Gwy0wnZ0jBb+t61ZE3b2pU3Kf+zFVAutPznC38erMFexUNffXy
         GVj3kJSr1lMFFwyOvpRbMMZLTnexo1OeEimsZNQpos4e2YSSaUIsFn6zpXZARcaLgyr6
         2YKqdIIka/GwDY4IjZoJY3j8Va1CnGgiETwHNfSt9H4Upl8BPwNbqH23VdKarqaQi37Y
         KMssA7vGHCtrIkgbhkhiwAnLOn6c6O8pVziiFjN0MUIXp2FAfEi9ZJa075VkCLjsr0ef
         Tdew==
X-Gm-Message-State: AOJu0YwhVs5trgU8AlynV5+42KXdD7QBNW8ytJy7Mok6e7CRp9WmQtZ/
	JbAMVqNVFWcOmvqjjSpeOrc43LNOfoNOeaVnoUVWWcO+vaqbXtpO6+hrRrxSTS1zQXCDD4UTX2J
	103hclHuKosNxFXMqiyOer+GHefei+BrN3IEoqOx0npXZM6Z9V53CjrlqFsJT9KtxowAk
X-Gm-Gg: AY/fxX4WlOehDrQ/DYsPen6xyZEjQ9D5MX8pPIUs1xZypJpTb+3lSf/Dir7L7ohPTnj
	0ImqrrML3pMnBfQwmwCEljTlpMiEm0GCTcKUY680LqgOR/aT/PnXjcgdjftbMz6ycfvH5ffIduK
	0jcvExkWjKn1Uox3q8HlOlkqi5xusdcbQit3iryplIbE1W0fXN8dl214kNVsBDVxHz8S/SGD+s8
	3m/gQz86Lc7VBPKWT4AaS+h2VNY9eAYuSa3DYNnUVfG1UU0v3zRNFZzRtXs6Ei9BMpCL9lnp4Wq
	q4+Tp2nEymTHvWsf4Jk1zaHEcZXao/XY5uYwAy+soQj3WDuwOlWV2FuK3zXjuCunVefRy6MXRKz
	pS9iIGM5roy7ntMnNuDuDGqVxfV2cTpfH59vB2ZXHRBS5YDFTdDTOsouk4cv82i+k4wEqa1jwH1
	dqKeDD3+nVUWZ45mhEzF0Vb7PQFHCMkA==
X-Received: by 2002:a17:902:e552:b0:2a2:caca:35d2 with SMTP id d9443c01a7336-2a2f22273a7mr29329715ad.16.1766155653572;
        Fri, 19 Dec 2025 06:47:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtnLKvWRG3pUCwzqHCv+5MQZo6/M486Fc51APt819jom0Xlk+IlUR0S+CC/VXIn21R5e/+Fw==
X-Received: by 2002:a17:902:e552:b0:2a2:caca:35d2 with SMTP id d9443c01a7336-2a2f22273a7mr29329425ad.16.1766155653050;
        Fri, 19 Dec 2025 06:47:33 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm25433855ad.33.2025.12.19.06.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:47:32 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 20:16:54 +0530
Subject: [PATCH v3 1/4] dt-bindings: arm: qcom: Document Glymur SoC and
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-upstream_v3_glymur_introduction-v3-1-32271f1f685d@oss.qualcomm.com>
References: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
In-Reply-To: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        rajendra.nayak@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766155644; l=801;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=tvnF6b6bmdFNtT9eNlHsTHBdpRoglpPCbrEKqVihJrI=;
 b=Vp7nU0Qpmu8QNy/GMP6Es90wP7U+Tkg8a4a8LtexFxSMBJE4HnjZNkMV6cv9B8sekK4gE0j5B
 fgTcXwvfzcTCta8l1FvnyKOEr1QqHNeEMy/yqH0+SqK9pId+RNBE90e
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyNCBTYWx0ZWRfX469gT+drtxqu
 J4AEsfiGWygImfpxjyKhbYNlFANu7mmyU4G3p7wta517xR+m4QRvm75yan4XtUBcnuvhPIAID2p
 4i6bgwjdth1z/Lj/0w1gn+CbtiF0Yki2ERhR3KdpeN5G+ZZmC89vLzVFCOKfLou6eLeV9aM3a7p
 P4tNi2+OBha11KPoKMXyZVZQvQGDiEKDdESIJMOR2UWk1Ng2za0n5s72ylO0MU8hl+isPPCDIRx
 BotvUP0NrrboM7h6kEk32Ha3iMZtJuKu9wfcnnxKz3iao9CzHxAMXeeqjEDHmTfL3ccHE+RuLtq
 7JOLRlCEY+V99C3zQCSzt4vusiplla634aoWdY2mvFk7qiJ7X9uVKg9SUEtbDkpQiGh3m7aTgZA
 g+H+k0z3CdZAFyng4Q/j3Yq7nuZdch5SUHT5O4LKnOpP5JFiMb9bxA+6hAsOgb6tK62hNsvfWe0
 H5DPfRgMN+c4EwWpPPQ==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=69456586 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KVNckf8Hb-gWPUCTgC0A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: adX-i0B_yts4SjbAUMHDwAHxWUEHm1-s
X-Proofpoint-GUID: adX-i0B_yts4SjbAUMHDwAHxWUEHm1-s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190124

Document Glymur SoC bindings and Compute Reference Device
(CRD) board id

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..b6398bc8c588 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -61,6 +61,11 @@ properties:
               - qcom,apq8084-sbc
           - const: qcom,apq8084
 
+      - items:
+          - enum:
+              - qcom,glymur-crd
+          - const: qcom,glymur
+
       - items:
           - enum:
               - microsoft,dempsey

-- 
2.34.1


