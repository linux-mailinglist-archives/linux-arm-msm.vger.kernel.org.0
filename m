Return-Path: <linux-arm-msm+bounces-83566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 751D6C8DC65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 11:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6D7354E111E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 10:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C359C32C301;
	Thu, 27 Nov 2025 10:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F3iUj+LX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QDG7Icg+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85BC32B991
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764239558; cv=none; b=t9Q3szWV2ETsJzgkpeysoZRpFeZwNpLpRmbgrYWuuHLrZd6jGCjHrtPzH2oZ0+2chQzeaD68e+hthy/gzPQ87Gj13wQ+5ffJuPohJbDRiaIjo9Gv/zYyhBMXdcdc/k+gd7vTGc5MFrpwVnJ8BCF+o8sObokHLLdQfBelSZE76u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764239558; c=relaxed/simple;
	bh=/DOTDoZ0H9Rdr3BBRYStnORKLObpfXOFVbzwEfrV0f8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iwihZTrRIjiSxUVVOB56webEikyzk7/uuCJPBppkbVY29NDj/vS8TIZ4pDmJ9LA8nr4uta1yJrs9yONXn9uTwgGILa8fv4cylykDKeQa0w4mJNZr5BZO3GSsvO44vmlEaVfGvrm4bTStMt2lkv3v71Kfpxfvu0SZoiKwAJuJooY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F3iUj+LX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QDG7Icg+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR9G7Cc606784
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tpYzt4PU0LPIdbJf+XZdJ8ExSip1bg8gPLoUwUltQCk=; b=F3iUj+LXpnTAQnDC
	fOX3Vn3mb83P4tqU/W1fHQfCHSL4kDIt0nsTx5/kXQ4UOTRnex/8mVamRGzakrAn
	SWKUMH1hUTGeMIbYdWzJ4/8rVr2vgMBpo7jY1D3IPHpAiBjtQyZZ5RVHLvYX4/cI
	QvZDazxoiuaBkbkNIQ+Rh7/oSnlKps2NgnvUJEgkFjE1indy5waVhbDJK5mV9sNg
	WU2CKQuiNFAkwu8a2sKCY/YBvIBJgWfnj5jm19VjAvWGrQhbkKWvjH/wLChcW+8P
	4yMaOtBUkxYkuWhqUdZs1+/D+1mOusfyPwHAoZFuPSKB4nyVeIwMHqn5QQJVh6i9
	CE4sAA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apkv5g8ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 10:32:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b90740249dso1131159b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 02:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764239554; x=1764844354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpYzt4PU0LPIdbJf+XZdJ8ExSip1bg8gPLoUwUltQCk=;
        b=QDG7Icg+vzVR6tl2HhjZZWOT7KCaRAWWexA2evA+HztExzi+k7yeC1TdpHqGX+reME
         5McTu3Qg6NKEcfjlbTDmCg4cnRBV04VIX6AIkFcZJzf+a9GvHU9ROR5PMOUgx1lmjpT/
         rweCgY+E0OR0VRidEOQsypEEhR74EcgEWC5eidmyHn4fGRf00j8XULlvjaL3YNGywZ6c
         jYiN6rQ9SKdRnMEHk6dQwPLGZI5mVKBOirAoXt7+uPm2sMpT2bgTxw/z3Z3W+p165dET
         NSkIi9IAJ5CZNIUoO6W8frLJEMMSfJmPhdB6Sj1/GkZn5hVS147PlChixX2T0GrArvVA
         0WvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764239554; x=1764844354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tpYzt4PU0LPIdbJf+XZdJ8ExSip1bg8gPLoUwUltQCk=;
        b=Dt/1TmR183UPOqmzrt56qOVaOURE7MTw7BBRiKJV0oSbvKm2eAeBLLgDuhKqwoIDJa
         WzgXiQMNz6aQwqQcaFXBE2zLFHhiss7bEzue/76k2YMyAx7XZwRfknn80aFHJYKtTqcU
         NmUpVws1ZRiXL+AVCh3gnaoz1ZLfFZUtkQzU4/h3GpsM9XMdxByobDiW01G0DvBGTCiV
         Fzx7YACatgDd7AJy1SzkDC/wuSAXD7hmQ1uJseYV/GBBJISl5bGtE6S+GZPjuljsNQTM
         Rk2KdtUIXIEg7qJEqeqSOg72geFBj4d3FkaBFU4uyfVHFiQMDFj5Wq4DiQ91AcKIubKY
         HJAg==
X-Forwarded-Encrypted: i=1; AJvYcCVEj1YDCmUhz39EEQYeOyD2RvIPhQk+1qwEEhWJ1dsGlrap01T6jtJI3PdFcblyZqiBKacrlD8gAOpbXsfN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzitkbb8Qvzi0YiKOhXEyzZR+6R5bmK7TznLLtx+jRkwhhWOfOe
	3u1oeY+8N8xgkU088+UStohaJFyLHEH0GEgJaiQru1HoAaCPoCYjubW2lmpd7e7KdcZDA69AL/n
	/oSUnrJ1IZxTU82u6HREd/IPAUG6SHR+LZ5H9g9lNcE1bXBmhtPL+PtXZjv8UbqO+XdRDJsdNfD
	EI
X-Gm-Gg: ASbGnctdkkl5Pbt0VkzYHY+woJJGp6X2y5QgqQRBzauZF656JVLPnIEAq+9Snmy5Eg3
	aaOKctHJ9vw6ckF2HofHm4AaVXHkxIRX5XkfZEx9YwIM1CZO3XfY9gARrtImwik5/vGaHmOvrDJ
	5pHZCi1g3/qpYgalqpJZIify7YiDCiNwHm1cEdo4MvCyoH5nZxMAjDJNrwSwbng4t3GegO4se0/
	yqX6Tb98eN+QVAysOAZNZDhFPSdD9PRgtXtIFLzg3EXIuYFCoSCRYyVU+CCOvK57pJrsdVWtbpQ
	iGDEkamsS+QWH+9lHnjAsyVPqThx0Iqcu7LTqp+/CmEflDP7G/nb0OuW0DugkAP941KGR4tgfz0
	Ohlsfx9FF4Pjs/j41vWb1qIhp0zDi5m89TA3I+mg=
X-Received: by 2002:a05:6a00:22d1:b0:776:1c49:82f8 with SMTP id d2e1a72fcca58-7c58c6af789mr26246234b3a.8.1764239553889;
        Thu, 27 Nov 2025 02:32:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7kJjReR2XrEct8UxObPiKeSbmLTG4KJlgckTkwNw68HMQBAKK+DlLZbFHWlcr2ssHWulP0Q==
X-Received: by 2002:a05:6a00:22d1:b0:776:1c49:82f8 with SMTP id d2e1a72fcca58-7c58c6af789mr26246185b3a.8.1764239553385;
        Thu, 27 Nov 2025 02:32:33 -0800 (PST)
Received: from hu-sriramd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f457c38sm1479819b3a.54.2025.11.27.02.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 02:32:33 -0800 (PST)
From: Sriram Dash <sriram.dash@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 16:01:44 +0530
Subject: [PATCH 1/2] dt-bindings: usb: qcom,snps-dwc3: Add support for
 firmware-managed resources
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-controller_scmi_upstream-v1-1-38bcca513c28@oss.qualcomm.com>
References: <20251127-controller_scmi_upstream-v1-0-38bcca513c28@oss.qualcomm.com>
In-Reply-To: <20251127-controller_scmi_upstream-v1-0-38bcca513c28@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: jack.pham@oss.qualcomm.com, faisal.hassan@oss.qualcomm.com,
        krishna.kurapati@oss.qualcomm.com, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764239543; l=7415;
 i=sriram.dash@oss.qualcomm.com; s=20251022; h=from:subject:message-id;
 bh=/DOTDoZ0H9Rdr3BBRYStnORKLObpfXOFVbzwEfrV0f8=;
 b=0iM3i4FAQPbb8dW2gExl2yKg7bH2MhOsbqs1sFf1uA30adOQPKcNBpDvZsEEvBxv1X/JTz3ys
 ZBGf93Ya0BqCVHpYqm2l3l9u4f4hb99h4qbsjUpo3VHim7bRWpx+AUM
X-Developer-Key: i=sriram.dash@oss.qualcomm.com; a=ed25519;
 pk=balisq+aEVXEJ6Gnze3kqbYZiFlsdHUjTSdCvupAeP4=
X-Proofpoint-ORIG-GUID: a5NHvdM5XKd5Z-kMX6gTZrl3EBQ4u8dZ
X-Authority-Analysis: v=2.4 cv=O8k0fR9W c=1 sm=1 tr=0 ts=692828c3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-jDCNdFNlL6vUUFU2n8A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA3NyBTYWx0ZWRfXytnp4xCanfLq
 SUs9vUX0O1Au6EKzrx2WSkVwKpjr3FhKYEWyeSPFRrpADtHEAdGVGOCxVFeD0o2Z0tQyEH/OJdW
 qdDWn4lvPpYWxjhnPO+Hta6/JWqUQHeO/dDeQK8e8xIpuuN3or3LHB4FIJ8rknKO7A3IS8+mn3Y
 RUVvRtL+l0JDoGHIQhadGUKXLozHJyx9REyhB6HgoXG2NR4XutjhNdkjc/Zc6acUUYDWWfwmIP2
 c9TTxykgx8yC3R7g3w7xAODBAXc3G+vBG26kF2e/17N6gF0Y2ad9iKZqxGAHYBfEj6OUPbXFAsr
 H6qB63LBHow7gQWzImgGD1Jkv2g5ZHhBBC15oO576xW8OfIfZ/D4QRAeqkWm1N1F4zxUpF9H8/U
 N7HZt5obtDeICP9jhVXG/wjXaYRzZA==
X-Proofpoint-GUID: a5NHvdM5XKd5Z-kMX6gTZrl3EBQ4u8dZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1011 impostorscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270077

On Qualcomm automotive SoC sa8255p, platform resources like clocks,
interconnect, resets, regulators and GDSC are configured remotely by
firmware.

PM OPP is used to abstract these resources in firmware and SCMI perf
protocol is used to request resource operations by using runtime PM
framework APIs such as pm_runtime_get/put_sync to signal firmware
for managing resources accordingly for respective perf levels.

"qcom,snps-dwc3-fw-managed" compatible helps determine if
the device's resources are managed by firmware.
Additionally, it makes the power-domains property mandatory
and excludes the clocks property for the controller.

Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 173 +++++++++++++--------
 1 file changed, 111 insertions(+), 62 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8cee7c5582f2..d2d1b42fbb07 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -12,68 +12,65 @@ maintainers:
 description:
   Describes the Qualcomm USB block, based on Synopsys DWC3.
 
-select:
-  properties:
-    compatible:
-      contains:
-        const: qcom,snps-dwc3
-  required:
-    - compatible
-
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,glymur-dwc3
-          - qcom,glymur-dwc3-mp
-          - qcom,ipq4019-dwc3
-          - qcom,ipq5018-dwc3
-          - qcom,ipq5332-dwc3
-          - qcom,ipq5424-dwc3
-          - qcom,ipq6018-dwc3
-          - qcom,ipq8064-dwc3
-          - qcom,ipq8074-dwc3
-          - qcom,ipq9574-dwc3
-          - qcom,kaanapali-dwc3
-          - qcom,milos-dwc3
-          - qcom,msm8953-dwc3
-          - qcom,msm8994-dwc3
-          - qcom,msm8996-dwc3
-          - qcom,msm8998-dwc3
-          - qcom,qcm2290-dwc3
-          - qcom,qcs404-dwc3
-          - qcom,qcs615-dwc3
-          - qcom,qcs8300-dwc3
-          - qcom,qdu1000-dwc3
-          - qcom,sa8775p-dwc3
-          - qcom,sar2130p-dwc3
-          - qcom,sc7180-dwc3
-          - qcom,sc7280-dwc3
-          - qcom,sc8180x-dwc3
-          - qcom,sc8180x-dwc3-mp
-          - qcom,sc8280xp-dwc3
-          - qcom,sc8280xp-dwc3-mp
-          - qcom,sdm660-dwc3
-          - qcom,sdm670-dwc3
-          - qcom,sdm845-dwc3
-          - qcom,sdx55-dwc3
-          - qcom,sdx65-dwc3
-          - qcom,sdx75-dwc3
-          - qcom,sm4250-dwc3
-          - qcom,sm6115-dwc3
-          - qcom,sm6125-dwc3
-          - qcom,sm6350-dwc3
-          - qcom,sm6375-dwc3
-          - qcom,sm8150-dwc3
-          - qcom,sm8250-dwc3
-          - qcom,sm8350-dwc3
-          - qcom,sm8450-dwc3
-          - qcom,sm8550-dwc3
-          - qcom,sm8650-dwc3
-          - qcom,sm8750-dwc3
-          - qcom,x1e80100-dwc3
-          - qcom,x1e80100-dwc3-mp
-      - const: qcom,snps-dwc3
+    oneOf:
+      - items:
+          - enum:
+              - qcom,glymur-dwc3
+              - qcom,glymur-dwc3-mp
+              - qcom,ipq4019-dwc3
+              - qcom,ipq5018-dwc3
+              - qcom,ipq5332-dwc3
+              - qcom,ipq5424-dwc3
+              - qcom,ipq6018-dwc3
+              - qcom,ipq8064-dwc3
+              - qcom,ipq8074-dwc3
+              - qcom,ipq9574-dwc3
+              - qcom,kaanapali-dwc3
+              - qcom,milos-dwc3
+              - qcom,msm8953-dwc3
+              - qcom,msm8994-dwc3
+              - qcom,msm8996-dwc3
+              - qcom,msm8998-dwc3
+              - qcom,qcm2290-dwc3
+              - qcom,qcs404-dwc3
+              - qcom,qcs615-dwc3
+              - qcom,qcs8300-dwc3
+              - qcom,qdu1000-dwc3
+              - qcom,sa8775p-dwc3
+              - qcom,sar2130p-dwc3
+              - qcom,sc7180-dwc3
+              - qcom,sc7280-dwc3
+              - qcom,sc8180x-dwc3
+              - qcom,sc8180x-dwc3-mp
+              - qcom,sc8280xp-dwc3
+              - qcom,sc8280xp-dwc3-mp
+              - qcom,sdm660-dwc3
+              - qcom,sdm670-dwc3
+              - qcom,sdm845-dwc3
+              - qcom,sdx55-dwc3
+              - qcom,sdx65-dwc3
+              - qcom,sdx75-dwc3
+              - qcom,sm4250-dwc3
+              - qcom,sm6115-dwc3
+              - qcom,sm6125-dwc3
+              - qcom,sm6350-dwc3
+              - qcom,sm6375-dwc3
+              - qcom,sm8150-dwc3
+              - qcom,sm8250-dwc3
+              - qcom,sm8350-dwc3
+              - qcom,sm8450-dwc3
+              - qcom,sm8550-dwc3
+              - qcom,sm8650-dwc3
+              - qcom,sm8750-dwc3
+              - qcom,x1e80100-dwc3
+              - qcom,x1e80100-dwc3-mp
+          - const: qcom,snps-dwc3
+      - items:
+          - enum:
+              - qcom,sa8255p-dwc3
+          - const: qcom,snps-dwc3-fw-managed
 
   reg:
     maxItems: 1
@@ -158,13 +155,31 @@ properties:
 required:
   - compatible
   - reg
-  - clocks
-  - clock-names
   - interrupts
   - interrupt-names
 
 allOf:
   - $ref: snps,dwc3-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,snps-dwc3
+    then:
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,snps-dwc3-fw-managed
+    then:
+      required:
+        - power-domains
+
   - if:
       properties:
         compatible:
@@ -513,6 +528,7 @@ allOf:
               - qcom,qcs615-dwc3
               - qcom,qcs8300-dwc3
               - qcom,qdu1000-dwc3
+              - qcom,sa8255p-dwc3
               - qcom,sa8775p-dwc3
               - qcom,sc7180-dwc3
               - qcom,sc7280-dwc3
@@ -657,4 +673,37 @@ examples:
             phy-names = "usb2-phy", "usb3-phy";
         };
     };
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb@a600000 {
+            compatible = "qcom,sa8255p-dwc3", "qcom,snps-dwc3-fw-managed";
+            reg = <0x0 0x0a800000 0x0 0x10000>;
+
+            interrupts-extended = <&intc GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+                                  <&intc GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+                                  <&intc GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+                                  <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+                                  <&pdc 7 IRQ_TYPE_EDGE_BOTH>,
+                                  <&pdc 13 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "dwc_usb3",
+                              "pwr_event",
+                              "hs_phy_irq",
+                              "dp_hs_phy_irq",
+                              "dm_hs_phy_irq",
+                              "ss_phy_irq";
+
+            power-domains = <&scmi1_dvfs 0>;
+
+            iommus = <&apps_smmu 0x0a0 0x0>;
+            snps,dis_u2_susphy_quirk;
+            snps,dis_enblslpm_quirk;
+            phys = <&usb_1_hsphy>, <&usb_1_qmpphy>;
+            phy-names = "usb2-phy", "usb3-phy";
+        };
+    };
 ...

-- 
2.34.1


