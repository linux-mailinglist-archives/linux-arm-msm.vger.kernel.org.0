Return-Path: <linux-arm-msm+bounces-108040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFpID4TXCWossQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 16:58:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A6D561C9B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 16:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58531302BDDF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 14:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D543BB13B;
	Sun, 17 May 2026 14:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiIqfyFD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b2aZUU0J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7EB3B9949
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779029789; cv=none; b=qx0TxbhWziuYUf2qQz/OQC+AJ9eX8an3HdGGq/twEyls89LEMHtcIg7MELhfdJ/otVN5rM29weFtSExlYsAyWpV5y2q+ijTUK27WhlvzT/DUxBzinIs3PtSWVZgvN76DpnkgWKzWoGjU+dzfX7GB1+45i6Rz2k/Dw77uKzxXSGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779029789; c=relaxed/simple;
	bh=lNe1bvt9AaKEtsTb46bKIiggo4KRYc6vxGn3z7RFrYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mkmn9wcwxiY7HQV9QkX+h2CivAnkmO/iSgGolwCF1Mue1ZDrJg2WLKZXzaFlk71nr2F84COOTd1DlxEfMmEPRPvr5Ju+/+WIWY+QX82sZB1iDYIeAGbMoYIJmifyV9aGxp+DyxkHPmoCd+8YvS9hvKdtt9FIlGIfpq5ueAco9uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiIqfyFD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b2aZUU0J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GLubYY1677666
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FhnS8LPW3BVBUeMEL7hDRQW2qshtCkWnNEHKcWrAxiU=; b=ZiIqfyFDRSlTqFSn
	AXNlqcnSZp8emJnCGbZpYJhuzAoMwa5Xs5c2INEYYfVJ6damWomZuWTVJybFtUul
	jbEwBCmPTjYomkjYw6nJ4odlTPFksRRAduB7pP36exFyCEcMX714+8c1BlAzNtdK
	k3HEDFSyPd+j2h6w6nPcy2xZ0HpkrYvXi8z0k0GomSiWqsTqJ9jGk+eFKWHt3S3o
	q/z/XHiUQ3IOH1iH4lDQ8/9WsP0irGy1CZ69pjtdZ0wIyy4yY0+AIRNP3+VxKUQi
	ExPzttkfpP1J0rgFgSg7iKBTvX6/HpoUQP0l55itFByzGjC1RPa/fHbBBKZsX2ev
	XRTF/A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqu1d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8e8c47a3so47646561cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779029784; x=1779634584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhnS8LPW3BVBUeMEL7hDRQW2qshtCkWnNEHKcWrAxiU=;
        b=b2aZUU0JU23zWON9n3cB7kyR75Vj7BUJXYUYKCgaiN9BcYd/QYda18DQ4k459PGGSS
         kwhUo15lA2JgroQ/EDN76isrvZRmvxDxuaZr36Fy1NIgyHaA6HA6/7rYNFU6rgKXlBNs
         AGtgU1GzcEUUt67P3Zls5kEc3Aw8MGr/1b+XR2T1wFpgPBdxnGH3XhezStd90Ac9asOM
         8orvWjLhe9oDqFhRWQDeZ3QKbpZEykFJBjW9yirnhLKtNHsZoEOMEhU32s0d5Pq216rg
         3xt65qIzrID1H5AMnv5RsdD9tNdqvlBNMCFzdDYEGd1z9YZVgHIi4ibcJHn3Te4ao3c1
         wTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779029784; x=1779634584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FhnS8LPW3BVBUeMEL7hDRQW2qshtCkWnNEHKcWrAxiU=;
        b=ccBlP5/DtqbKkmYf9n+/bUrIRdHX7QoN5xrP8lBtwKPLnkIbIdsnRrTDKgkloeRgMm
         BNx8yiZz9z2XJcGq78ZwRR7g7Fn8eoo/8gfe9j9rqLm/UJXgN7JUO8zQLS1Ego1kNH0I
         Xm6jzcfnjJrR1W8m5mndegE+bcE6nbL+O8rOR97LbP8roOu9jMfOsQ7gusNvICp31zBK
         I4hur8KXNquDL9xaIiRB4NCqndxKsUdbi9iCahJwuWhKrnBzDyfziZl+1HVmInjw7ndr
         tU2u/2RVGFdAYY9h24WU85dUhC3IfcHQtze/gJkO8xuInnfH0xOp5YM+tnYMw4bmpVdd
         2RZQ==
X-Gm-Message-State: AOJu0YxDSiJ9FtUSPYCFcJvGDz3tjYsJogDngEE3/QrXnOhEI+q29qiR
	hdCzy7CefXe/ivNYCBBTIVWERsmVUBqTPLcoE59ayCwi1JFposn2PqpGzpB69Vw/W6Y3/a8Tcj2
	Kbw8ypth3HgEqCBT6lQt+89jgGSSKPoG6y+z0ON6N/Mr/l5Dlnv6h0dRK489oBFjtYXF4
X-Gm-Gg: Acq92OEQ1IolKWpZ9OB6dnyH9GKG8cLzKVME0FDywfmmX7h31DIbH7Rz+D51MY4FGK0
	+wAtybfLdptGsfJYX3i3bY25lyP++5nDk9rAlNs/KgwPg0nLcqexSbkP+2Qt6taWI/Q0HmBgLJe
	uxpwJ//EpcO2/afHoiAYja0VYC1oB7qdE0ddttoUX6U7VcZr2VO5yVnR62sDBVgXJiiGtoBaTR1
	0nFKnSUFSzyeTvVOXmk4Cs6v3k5LsKQ+ZW/sbl3muSRjIj618HBuT7ln1KMxaZFAVvGOm3i0C76
	0WSf0pYIuioN30VO2Q8vrHfo+7mqE8BvY2PBtKd505SZOxb+GWOK/Rht/iP2+toeKEYqCwhd/xE
	VytguF7Qh0f7mNN1lPkRM2Nxz0oaf7MjveJBqlKD02FUriCTgMOxVZ26RSL0WLg1feK13D7CObE
	3sArwtFJput9YHy/PpQsx7g5vSz4DD5u3YVYA=
X-Received: by 2002:ac8:5a04:0:b0:50f:e0c0:9d92 with SMTP id d75a77b69052e-5165a26bab0mr156598821cf.54.1779029784286;
        Sun, 17 May 2026 07:56:24 -0700 (PDT)
X-Received: by 2002:ac8:5a04:0:b0:50f:e0c0:9d92 with SMTP id d75a77b69052e-5165a26bab0mr156598521cf.54.1779029783859;
        Sun, 17 May 2026 07:56:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f118991sm2733339e87.18.2026.05.17.07.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:56:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 17 May 2026 17:56:10 +0300
Subject: [PATCH 4/7] arm64: dts: qcom: sm8550: consolidate IPA properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-ipa-loader-v1-4-3c3764c1b4a3@oss.qualcomm.com>
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lNe1bvt9AaKEtsTb46bKIiggo4KRYc6vxGn3z7RFrYQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqCdcNVZYxAMG6xsjp+yq4Z1BAi7k9Do+EvKZLU
 Fg7GiVr8vuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagnXDQAKCRCLPIo+Aiko
 1dTdB/4vzmJ2m0iDHTkxN8YY2zaR/BOYcp4rkXhqF9dzbvpErLbg1tcTR0rP/Z2i+rr4kzGfFAg
 x1v7pYOVsqeN9E9comShYpR3V73sG3/Eth0z7aZW3vcNU0+oOUVqKpPHKKVXsxcxpfh+ltNAuTW
 gUGjyIB4BeCRhFEKO+9SONmqPt+24UxqOycF0S8WvQd+cUtu+SeSa6uEk23xifvwD+KWLstdjwP
 xO5fOEXwWuqKYsXwVb3+B37pMiJhiWWZGTQCWN9j8mOmObILBailwqRwm4hRp9yacJwphA4bc/T
 E+7GupUILKRb5mWRENd7n9j35xrxi0a93yeIGM6h+qg4bwGj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: S8q4x4Rdf8PW3l24NN-ezSzTuJR6wO4s
X-Proofpoint-ORIG-GUID: S8q4x4Rdf8PW3l24NN-ezSzTuJR6wO4s
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a09d718 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=oHYOqaEBOIRX3F0Q_xUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2MSBTYWx0ZWRfX9mfxjPU02Gow
 ZWI3+COwY0E2zZNwhGpaqLoH0LNZiZJWWSjpEhUGlHpfjuhxTbS5f/Q9lb9EzMID2B9aCgejzME
 EAiRYfw9Xkir3tBpZhriUNcYtSiKZ1bk4VZjOmRr12IIIWqlPgWOFwqEo5KHG8Dp3E4nMCfjU13
 qhDT2AjopjSIlO833snm2dGEQuKsw7mvlQPJvUokL2VfOZsNxVWoM8HT/DFKfySrRfXwXip7q5W
 r6YTaKid8gRSYwF6qTg6lYs4mMDSlngbhCnZ7xMwm/6Bh+Kf/h8F8v+FSVU2NY7iHZ2K271RXsG
 O/vlVc37SgTvG7ShC+ksGiCBhuVZnXqaTQIWIUJVebvJ1+95/g8i0/64lKWuYaS8YkhhfJiuOl0
 FFLfKbxL2SbHCUZfl0jhv0KEatnLpVfOWgJSQqax0/vbKkzTnurMDKFl1Oja7AZVSQGKKj9AZQT
 JAgwKpD+GOMfzwhhr0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170161
X-Rspamd-Queue-Id: 94A6D561C9B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108040-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Move generic IPA-related properties to the base DTSI file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 3 +--
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 3 +--
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 3 +++
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index ee13e6136a82..06d4adc98060 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -939,9 +939,8 @@ &i2c_master_hub_0 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sm8550/ipa_fws.mbn";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 2fb2e0be5e4c..a680ae649b79 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -818,9 +818,8 @@ fsa4480_sbu_mux: endpoint {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sm8550/ipa_fws.mbn";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index b7a7c49db077..e6a1038b497f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3075,6 +3075,9 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			qcom,gsi-loader = "self";
+			memory-region = <&ipa_fw_mem>;
+
 			sram = <&ipa_modem_tables>;
 
 			status = "disabled";

-- 
2.47.3


