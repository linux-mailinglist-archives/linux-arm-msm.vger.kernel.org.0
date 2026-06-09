Return-Path: <linux-arm-msm+bounces-112128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IfhCIQjrJ2ro4wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:29:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA21B65EE89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:29:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NJ+7Lmkx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IDuYf9S9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112128-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112128-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E21E30B8281
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 10:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316D039D3D0;
	Tue,  9 Jun 2026 10:23:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899753F4DE6
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 10:23:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000630; cv=none; b=SR48a+uyEeTxXfHV5kGVYXTr8mi1ER0DG5K1sY4UnBWk6gByGyhLRxbZxv+7mmyMNf/Bpx+Sit7wIDbjaT5dJP7V1sC9t6RYu4mQdn0F6N25RDGVvGr5ttE+r7Z4efek+MHsSMN3jvQzXvar4udCkcYP4VT/A8MK4xk91b6zBXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000630; c=relaxed/simple;
	bh=8WSew3hSpaptpk+MeVkGct4Mo/+dI6jzC6p+5jGzuy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HMGhSSfv+fTrTVdMPKP0aTzdKyB/VXA2pbWfzZUMqC3+rMwr94+YvjYwWyAJU+XICfX0lFXCIcf+C+zS5vHfeu+g735jsOzTb0h1ogxOxXOJgDmP6RE6S4Zv8hlfCLdYviEF/1c7ZHLP50u5IzCScLXJSXeUr5zmBbOLE4AVOq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NJ+7Lmkx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IDuYf9S9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xG1N2327360
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 10:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oPqS4yKwId9kzNQEd8gVilqedOfKFCI5+ugJhmdNjPE=; b=NJ+7LmkxK/J6zt99
	02KJGSE2XdNoGlLg5yfBrNRQhYrG88HuN4HkiPDcnELV50OiU0BUXhswvfGhddBF
	3F5WjtygyPwNMDS4DVgr5KOOaffBgHLbKRy9QtXuVIvqZTMIQnKDr1jf0fLR78cv
	RfFE0PMTXyBVqFjTgjpFM0vpb6kDSh5UgNLS3hAquIm+9jWMjsa2MYDR9LPfdKlK
	RDsxpiQeXWAbeECNu+YUKwXJhwY5dhlvv50fEsIe/2F3JIRvGwwPHt3VtCH0jLFo
	7FbLwFxN7KBECWUyqMxugB360HJlf7kccPxCnYW/bvUXYbS+/7dXvlFRT1nYlGCw
	uMXz6Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt0edf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 10:23:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf11699875so55586855ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 03:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000626; x=1781605426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPqS4yKwId9kzNQEd8gVilqedOfKFCI5+ugJhmdNjPE=;
        b=IDuYf9S9Poy7kMhvkvl1j8OBPyYJ5nouN/br7oWoE+tS/UbGQzDZAPwV3CY8xTSZVa
         WSV3epDEcNkjqbCZ/7WBpRORsSa71er2j703B6rf4+9m44iIT3DOTTrCvpUlB6bh1n3d
         gbDbojj3jRrlEZhNv1CWcxRl8GwaQ9Xy9/BjmQiR36E7p2x7xShj6blVnCbA6AK5Ma+S
         peyLdZ7WjUMBaW3AMZV7Pwa25uP2M0OSq1hezgn/FLvgUi3LYADmfLadYmRDp1CZZuHM
         4hPuAl/RG5BONOz2mHscO2Fg9XF96EG4fuZmLfWl5nacZBapoHmhpHPmJEHLs0t8Onqt
         x3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000626; x=1781605426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oPqS4yKwId9kzNQEd8gVilqedOfKFCI5+ugJhmdNjPE=;
        b=An3AW9qpz7aCkJY5f4Kx/ZoINuTPWtMnKKtNlXAx4A3UvIDws+RUrLYCyHS6H0hsVO
         RWRGqlzNb0V3VPpV4CGgJcXaN5fCrMYRUpafI3IdSmtreWd+sd6TQJhXGkTfMLNOSuxK
         zrcixA+4xhMax2HdEfUft2ilePTCaepvtxMXeZrTsEO0mXaCnBiqzOUTihG+omEqgkwg
         bBm9hUCLk+IH8osfjw+aYaOnpWFbfyVC9F+QwIF/51oGfMhiUen534hYEKIGyWMRClnx
         gQeg7qW+fO7AdjVNKK0ga0XOxdef/SXakq4UDxciAiV8eeuuR5jyKNnRs1X0rsjkpQI1
         2Gyw==
X-Gm-Message-State: AOJu0YycAH3IUjvx133fj0vtwN2PwgkGnkZfcCCSZUt/+lGQMdMZm5XX
	5cLh6ZdoPywvzVlTY9er6n8isxpl4P77YJa7IEfeh5N92boZg1hMIa9gxWXPgB3jtyr0mKCGAnK
	80ZLxbBHxMKZFqInOTD/KMLgFoCTKu3m8KQzsEP6fgvIlIDimkvLNcQCMJrcov8IHE0SM
X-Gm-Gg: Acq92OG2QQtE4XqfD2VDRpIVUcxH81osZwsAJLS06+FWCM1WmfkTeKv9ZaEDB/OgSrt
	pTGzfZDR6KgUQ9TTiaOIGyKqCGBioWCGZps/PlsK3Yqbf0wgzzPCuxsMg7/YkTesgOsHoGWoBmV
	GtGi1ug+ccDOQBSqeLQ3wHUTklqEZDsxTMZuRsEeQa1u1ZQ/G55V9xMt9hfM4EiekbPXFs4Mg/s
	sBFRuiBjMG+UZ7OK4h7K5FEva8AOaxymYKzBS3DcGV0+HMYJp5h0++cSP5NEyFisE3kknY6MiH4
	DStVQH+lLP1C1kfcfOtrOoG++aIcmyRfFzd0KViuimzMsxdzeEKGb2Iw2q/pq3FLdFVuhA3F2Xd
	k1kTpZpkNmQqXBMSFGmyfdkMq01lPscR62DKmiW+laEyk2kIXPOTWYCkCTaxBUw==
X-Received: by 2002:a17:903:230f:b0:2bd:9b0e:b43a with SMTP id d9443c01a7336-2c1ec7a81e2mr157908845ad.7.1781000626341;
        Tue, 09 Jun 2026 03:23:46 -0700 (PDT)
X-Received: by 2002:a17:903:230f:b0:2bd:9b0e:b43a with SMTP id d9443c01a7336-2c1ec7a81e2mr157908305ad.7.1781000625736;
        Tue, 09 Jun 2026 03:23:45 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c2a4a64e22sm14738915ad.61.2026.06.09.03.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:45 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 15:53:00 +0530
Subject: [PATCH v3 5/8] arm64: dts: qcom: lemans: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260609-qmi-tmd-v3-5-291a2ff4c634@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
In-Reply-To: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781000588; l=7485;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=8WSew3hSpaptpk+MeVkGct4Mo/+dI6jzC6p+5jGzuy8=;
 b=W0G5bCMvhjAOgHa+lvuelaFUBBAf3sgOnY30RtmbzjoA4/r6cr3vWejESvTf+aWqf02B9rkyt
 FDVCDOYAoqEAGxRNNLuL6sDKMe3x+Q+rEA2d+/DarjcWg4mKfRzLUJl
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-ORIG-GUID: -ogK8ehPYblJBwhKMBtT5lZ7knrMHXvD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NyBTYWx0ZWRfX3eAylq894+Ee
 tNjI9vulvjSOE1hT34ECBVhN1WXqaoMZtgdVk29KZbLiJV3L9mWen5e5FclU968QRmUqdi4urlc
 MWiy5zLNpo/FsLDskHT8ocHGpulsqnpp/erUv58DQPWtz2IaLQMYbwJtZ6LizFe3HkfLbkrSzEy
 SEkuneMA+lFbScZwLOdjgnTeFqRdvsihTlO7y8vR6+0I3ZO59a24xzhs0zIMSjhXW5SxHs0QeZC
 ZSRWrrOZoE1NJ0tSjBny+bfzDax/rafQuJPpBQmzJvHNbQe7fMYJZJdEblAacOeKoLB8P9uHUjp
 xGLGnyu4Tg2bwJkMj2ZDbgfeHGcO3g/Ln0Tn7PqxaZkHVB0CQqcr/wVq+gXUWg3rOvfp6DsQ2RK
 kISofBnYQAIZ7QHO9RM27kpUhYETcAmSFVRmdnC7Md5q6i/Kh0WyROkPs0WRZOZ07ihf/0RjMG8
 ePTfpp/FzvW8xVFvaEA==
X-Proofpoint-GUID: -ogK8ehPYblJBwhKMBtT5lZ7knrMHXvD
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a27e9b3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=01plALVR7p8jgSNDLXUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112128-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA21B65EE89

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in lemans.

Set up CDSP cooling for both instances by throttling the cdsp, when
it reaches 105°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 126 +++++++++++++++++++++++++++++++----
 1 file changed, 114 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 353a6e6fd3ac..c55f95318707 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -7777,6 +7777,9 @@ remoteproc_cdsp0: remoteproc@26300000 {
 			qcom,smem-states = <&smp2p_cdsp0_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <2>;
+			tmd-names = "cdsp_sw";
+
 			status = "disabled";
 
 			glink-edge {
@@ -7916,6 +7919,9 @@ remoteproc_cdsp1: remoteproc@2a300000 {
 			qcom,smem-states = <&smp2p_cdsp1_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <2>;
+			tmd-names = "cdsp_sw";
+
 			status = "disabled";
 
 			glink-edge {
@@ -8764,7 +8770,7 @@ nsp-0-0-0-thermal {
 			thermal-sensors = <&tsens2 5>;
 
 			trips {
-				trip-point0 {
+				nsp_0_0_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8776,6 +8782,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_0_0_alert0>;
+					cooling-device = <&remoteproc_cdsp0 THERMAL_NO_LIMIT
+							 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-1-0-thermal {
@@ -8784,7 +8798,7 @@ nsp-0-1-0-thermal {
 			thermal-sensors = <&tsens2 6>;
 
 			trips {
-				trip-point0 {
+				nsp_0_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8796,6 +8810,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_1_0_alert0>;
+					cooling-device = <&remoteproc_cdsp0 THERMAL_NO_LIMIT
+							 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-2-0-thermal {
@@ -8804,7 +8826,7 @@ nsp-0-2-0-thermal {
 			thermal-sensors = <&tsens2 7>;
 
 			trips {
-				trip-point0 {
+				nsp_0_2_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8816,6 +8838,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_2_0_alert0>;
+					cooling-device = <&remoteproc_cdsp0 THERMAL_NO_LIMIT
+							 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-0-0-thermal {
@@ -8824,7 +8854,7 @@ nsp-1-0-0-thermal {
 			thermal-sensors = <&tsens2 8>;
 
 			trips {
-				trip-point0 {
+				nsp_1_0_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8836,6 +8866,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_0_0_alert0>;
+					cooling-device = <&remoteproc_cdsp1 THERMAL_NO_LIMIT
+							 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-1-0-thermal {
@@ -8844,7 +8882,7 @@ nsp-1-1-0-thermal {
 			thermal-sensors = <&tsens2 9>;
 
 			trips {
-				trip-point0 {
+				nsp_1_1_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8856,6 +8894,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_1_0_alert0>;
+					cooling-device = <&remoteproc_cdsp1 THERMAL_NO_LIMIT
+							 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-2-0-thermal {
@@ -8864,7 +8910,7 @@ nsp-1-2-0-thermal {
 			thermal-sensors = <&tsens2 10>;
 
 			trips {
-				trip-point0 {
+				nsp_1_2_0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -8876,6 +8922,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_2_0_alert0>;
+					cooling-device = <&remoteproc_cdsp1 THERMAL_NO_LIMIT
+							 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-0-thermal {
@@ -9018,7 +9072,7 @@ nsp-0-0-1-thermal {
 			thermal-sensors = <&tsens3 5>;
 
 			trips {
-				trip-point0 {
+				nsp_0_0_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -9030,6 +9084,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_0_1_alert0>;
+					cooling-device = <&remoteproc_cdsp0 THERMAL_NO_LIMIT
+							 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-1-1-thermal {
@@ -9038,7 +9100,7 @@ nsp-0-1-1-thermal {
 			thermal-sensors = <&tsens3 6>;
 
 			trips {
-				trip-point0 {
+				nsp_0_1_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -9050,6 +9112,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_1_1_alert0>;
+					cooling-device = <&remoteproc_cdsp0 THERMAL_NO_LIMIT
+							 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-0-2-1-thermal {
@@ -9058,7 +9128,7 @@ nsp-0-2-1-thermal {
 			thermal-sensors = <&tsens3 7>;
 
 			trips {
-				trip-point0 {
+				nsp_0_2_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -9070,6 +9140,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_0_2_1_alert0>;
+					cooling-device = <&remoteproc_cdsp0 THERMAL_NO_LIMIT
+							 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-0-1-thermal {
@@ -9078,7 +9156,7 @@ nsp-1-0-1-thermal {
 			thermal-sensors = <&tsens3 8>;
 
 			trips {
-				trip-point0 {
+				nsp_1_0_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -9090,6 +9168,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_0_1_alert0>;
+					cooling-device = <&remoteproc_cdsp1 THERMAL_NO_LIMIT
+							 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-1-1-thermal {
@@ -9098,7 +9184,7 @@ nsp-1-1-1-thermal {
 			thermal-sensors = <&tsens3 9>;
 
 			trips {
-				trip-point0 {
+				nsp_1_1_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -9110,6 +9196,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_1_1_alert0>;
+					cooling-device = <&remoteproc_cdsp1 THERMAL_NO_LIMIT
+							 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nsp-1-2-1-thermal {
@@ -9118,7 +9212,7 @@ nsp-1-2-1-thermal {
 			thermal-sensors = <&tsens3 10>;
 
 			trips {
-				trip-point0 {
+				nsp_1_2_1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -9130,6 +9224,14 @@ trip-point1 {
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_1_2_1_alert0>;
+					cooling-device = <&remoteproc_cdsp1 THERMAL_NO_LIMIT
+							 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddrss-1-thermal {

-- 
2.34.1


