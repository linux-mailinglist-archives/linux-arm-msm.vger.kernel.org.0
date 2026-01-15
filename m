Return-Path: <linux-arm-msm+bounces-89104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 853A9D22997
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF7653096731
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 06:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B679C2DC333;
	Thu, 15 Jan 2026 06:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYnC3pEq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="afqh+d3H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE362DC767
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459390; cv=none; b=iD47U2CqW4Kb5abU2aOSSF1H5HGRZuuBl78aT1WqDRHJGrXpACuIwtZMJJvQERo9fzczoKcN/mCbgutSH5zGo+v3SqswjWo72fjyAQjttBTTlHqMQVZI7qxubtVmG8YeA2piFkHngaepcx/uUO2la0pB+FIcM1E4rlueegQx0dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459390; c=relaxed/simple;
	bh=zY4nzOqgWJG5FPNxJMdBDEouCKDXTgLe3R1UeHOD92I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dGAnHvkEdnsnBTPCFZrSa80yAxJE4V8qhT4SXOYUbFQua5Sy3OqDLqTttrD8Lit4FCMIfkIFsyehPayqb7QU7quQrApw4Vb5qk1VxCurdLKWqenOnoGe8bpYT6TBuE8RPl60PvYWXMCJ53lx+AUs18ITc8uD72IsgCwmQtPiI8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYnC3pEq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=afqh+d3H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6gHhQ1554646
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dmhupPitsdTjkBnqD47avl5GqkBsMwhxxsdVOhlkGsg=; b=aYnC3pEq13NOl0D6
	CRyuaZQ/llGcUzK12fja7wcH9uY/bn8/KERAQ80JAbApXZp1rnMxDpCKXUrwvh3E
	brEFeJtBXwZbiqLIT0W1q3r0CuOREUY5ziX1gedebF7zGU9aJmnkmnGnXbErLyE+
	j0fe3zA3J5PBpkzPYL3KZeF8pQIV6VoVN1jcsPMVUgYMf4ksSsg4tf8K1tYiq1AZ
	53oMZyTUU01QHtWlVZHtr/J2kki8IYm6McIzqVhMeIlMo+6ZQhP28SPrqnCHw0Xl
	PigTixI3THhBWDMuOk2RnTX4Z26oNkgN20cbxWPtA6IT1utKW4ycsZL/Drc4LEA5
	4MNWRQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp9x8u95w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:43:06 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b1766192e6so996676eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 22:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768459386; x=1769064186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmhupPitsdTjkBnqD47avl5GqkBsMwhxxsdVOhlkGsg=;
        b=afqh+d3H988p4JbXnvz7XiXgpKMyDDunQ/ijV5NBpk/tE4/H9jx17btwKqp5Z5dH2l
         VQGPqLKlBhz2L9GIaNyeeULEuf7EpiK0JF3F/cryifwHs2KsxeMJ8M88CwiVkQ1qBvNZ
         shCA/mUN7hSByrh10kJ5y0+lOmNBaCPD6XuziF+xC2F46ft5sRMPj9xADWJ40M8PE3Dj
         aJp+2nPakW8H3iwqz1rzRJQpMgIAi6p0KhR2xGk/cL3AWrPKnKAXL5zLWQNbr6jU4NBE
         FFywJpTFA8dItiVaD27Pz3zQ3GF6NhdYtoOq7ciG4J90ZMe7hnEIg9XXFGCKrvq1vDPD
         mo1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459386; x=1769064186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dmhupPitsdTjkBnqD47avl5GqkBsMwhxxsdVOhlkGsg=;
        b=O/fJ5IyhHkzeMMwa0mDLSG52Fg3Iro6ocLPBNlR3Rm67VyZE6aLo3jTyG9yEwepd4S
         ggX+40tysizUm7nZc6KNAzkc1ad3h0pVB5LwpPFySk3KgDIiYQzhlXkgTkNRX6K0RIPR
         Sy7NV0xdI4xdMvstYJVyOwZ5+UojIRPPQcKoyWJBjrpCxwkYljNjULyBXgyvzV3rq0nP
         bt7+fgJE8WsNMJ3q44rJTmd6M2+aGyFl1bAjEpDPlJIjF0VcCaZtX/fVNyjRaC2V68R2
         APnHVbhlYafBfuwUDsnam1YNuYu16CrbAmLXR7KPznITI4YgUALuzfP3ntmyoZ0Tg3y0
         vjHA==
X-Forwarded-Encrypted: i=1; AJvYcCVnrbSIbBJiueaTs+XV8cZGfXyjscofWqm1nGH1p4FU3AT9RtcGWWIsSvPskeNwe8U2fwCP1ujThm3urJH1@vger.kernel.org
X-Gm-Message-State: AOJu0YyUSVTSLvSFu3q8txZxPWd5TIR8URvy70Bj5PhiOktCA7JT5vpY
	fMK45vuz30aXYxjesq7FiI/7OzhVgm2gsVlsgJTgOCUtzlc8R0fnNqrsQBzgTdSHCdbYp35qTfw
	6fJQWqeRkhgxqxaJaDdFefghlHr6yk/XZ0qNrf3DtT1w4MLIUdVnEHl1ukbeAN7BnhaW2
X-Gm-Gg: AY/fxX60dX+4BFqHl9f7ApJd0Rz/3KohKTbvbwqDBapaMx98msbyqO6o6cAfUDJlpg5
	aVj+/wCj5e8ahtN6xSP66bjkjQSOtBig4UFQC88osyzMpxRWSjoFOBzSDcGzcT8aQo1qraHpi+f
	1st+YNoXyRhfzfZqKUVEvv2qvHG8Z8qxsuEuMAHkpQkXkLoxf7y6kv7RbP8PcLGEPjLgclRPb/U
	UNO8nvwjb9SVMszpulsL0rpNhQWXG/hGwGDwcTWKb6633g2DZXBg9D00h7ba3/8AVwf41+MQjLB
	Hby9VBw4c+KxMORFcYJqYSMLSOZyoBjN6QiD1zywL4K6YbmSuLf8tM5HrecZO3fbI7U466UuTqm
	APb3XHV69IBFA9z7yBHAbKAOm1mbRvyF2elX8pvqYLK8ySu2A8+seoqN+8+92
X-Received: by 2002:a05:7300:8191:b0:2ae:5e28:743a with SMTP id 5a478bee46e88-2b486cb19ffmr7343790eec.17.1768459386020;
        Wed, 14 Jan 2026 22:43:06 -0800 (PST)
X-Received: by 2002:a05:7300:8191:b0:2ae:5e28:743a with SMTP id 5a478bee46e88-2b486cb19ffmr7343760eec.17.1768459385506;
        Wed, 14 Jan 2026 22:43:05 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1775fe27dsm18986471eec.29.2026.01.14.22.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:43:05 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 22:42:55 -0800
Subject: [PATCH v4 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali ADSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-knp-remoteproc-v4-1-fcf0b04d01af@oss.qualcomm.com>
References: <20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com>
In-Reply-To: <20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768459382; l=1365;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=zY4nzOqgWJG5FPNxJMdBDEouCKDXTgLe3R1UeHOD92I=;
 b=toivXADCe6mAOdKBR7sWknEUl5lsvBrdnAuU8d28JRYpOA788Vjiz0TwRqNb5G2TTVuSK4n9O
 /5hSV+9ILC5BiJL07KrGGrFT0akFBHpg3FnvyFkVQIIWmyyHbTpCHBi
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: dZe-fMcMKVs13LysJ--jMCLatWniurS_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0MiBTYWx0ZWRfX4F6PIVT7oPLd
 rFPEdPx2ioF03nXLbLCPjuWWA3PzqC952/DWKDFezLCVJFm+wSRFHQWuWL4jJ2+C/541i2Wfdy6
 nRxkfxlG3/9gzzpQQtfDlAbGgAjaAMHuQNvMtfbn/I4cCpsn0bltHSkoXO7ZLKbPoTFAGXmqKSW
 9OqhPkeL9+3IwiI3t36pZs2ZTAbK6r4bgtqeLFEBuKHqykpmWuRY1/U3BEcyJvctStS820uFEfV
 3/SXtaF1ntne5s2pRuCMq20CJ54ySRzYQt+9n6ySlCZArrW1QPlHUnEZlEts9WmJhAo0B2KETfA
 9r4Q9B5jhgKocCT27lfDeqD3eHPUW5VkrgX+mTQCV3nlW6Kh+tbGAaLBF7NkyPdS8rR5aR/W3Es
 0QtrS2H+3KZ/n5npcimKpilVc5OhHfWss2Lt/LQ/sCXXvypfKFl28sSg+V/vTjagJ73KIyVbu59
 E0atYrmg/UATDwzs+Jw==
X-Authority-Analysis: v=2.4 cv=HY4ZjyE8 c=1 sm=1 tr=0 ts=69688c7a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7zWBZCs1gTFKjwm3VpwA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: dZe-fMcMKVs13LysJ--jMCLatWniurS_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150042

Document compatible for Qualcomm Kaanapali SoC ADSP PAS which looks fully
compatible with SM8750, which can fallback to SM8550 except for one more
interrupt ("shutdown-ack").

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 2dd479cf4821..31dffd02125a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -28,7 +28,9 @@ properties:
           - qcom,x1e80100-adsp-pas
           - qcom,x1e80100-cdsp-pas
       - items:
-          - const: qcom,sm8750-adsp-pas
+          - enum:
+              - qcom,kaanapali-adsp-pas
+              - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
       - items:
           - const: qcom,sm8750-cdsp-pas
@@ -95,6 +97,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-adsp-pas
               - qcom,sm8750-adsp-pas
     then:
       properties:

-- 
2.25.1


