Return-Path: <linux-arm-msm+bounces-104687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKtrFpA172kw+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:08:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C01B1470972
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B0563020FF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 10:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594283B585D;
	Mon, 27 Apr 2026 10:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NokANQ8/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wb+wm/cL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9F83B3C01
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284350; cv=none; b=stqiujGfsA1KJPMq9jdiR988dV+PflI5NiiZWx9LtRZyOSBoj2Ax88Z+UR1jWjdkQksJQ8sSZLDON/1z70To1KQMMcEKK8/pbdGQJzmdu4VzwtWzaaDcNQnEwHYBaheTjDg7CqvVQlTAmIEi1mxU9cR0JTMGy0yg78DbTAJsjpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284350; c=relaxed/simple;
	bh=nfUlgRiZuBNEE478C2TaHpdYARSv0jZSyoCpVTzZyeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=McbAM/Tobx5LlzeLgX+uGWpsbWWblIfIeUGnHCUkJfDXhAj2iNxxtiK/Y8zPEqqsGkXsXcYSrhVWrTfTOgkdmCKYFmE/hSrTxxL6cQ6xMSNq7JMwbVS1WTT0kErwVEsjuA+VnueGyBpkWeizjYWUvSQM3z7aBvYmXZTW/JSgWU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NokANQ8/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wb+wm/cL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TAtR861267
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U8XPHuNlG7Wle+hcGKTRA3//qZHMPcvdNl/NeojZNNs=; b=NokANQ8/mpSaPPra
	UmzkjeatozBpjPsLhWEMh+cfAm0RZFOmxKPGAWoLdjhWYcTULJDzo4mueDVXIqOu
	988dQNd1lTkxaitlQ3tbFVrH/B4wRcJpRnuQ6kCMeDhVVEAQJR8+HlI66UmgQ/s4
	enB4xQNyofMAu5HekIb92oQEQMMSfRKNbizOlK6eLwFMo8o3c+p/nb8B28L7ko2K
	/O8Eh03sr5XdlAyhvpwE+KxWP5yY11KYmIz6EsYNvAUND3UXiauEsxfW/ko1Qk6v
	OQfexkwu2I4hjn7s093nL7rnRbPg3H7UmeXxPEnRalGLh+I8YVwe6ysIJ1HK6Ei8
	j+DWvQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnpw5ks9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f9aa52c92so10352276b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 03:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284347; x=1777889147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8XPHuNlG7Wle+hcGKTRA3//qZHMPcvdNl/NeojZNNs=;
        b=Wb+wm/cLwP/WBqYx2Nf6KkKRUt/3+Z4N4ijVUgwR4bXHAoAl/geKofdrtsnaoleMbJ
         Fr6dV6yyFmJ64XQoBm61LNNhdGjvwgFc+ovq59TALN3ZXQbfozilwhg5e4gfEXQw/TDr
         ALaFml11BILOAHHzoA88letLAwYzzW45zkDRAV2oyDtZELJ30bpt4Jw1Dj0neBeKEq1G
         C0lOPeUiGA1ab35uiku/iPkLTa/7C1PvDxfTabOuhZ7HT3xvYRdc3VzhZdHhm9HARsS0
         TzZAoH/FhItxkotjQ3RpJXNva+ohRdmZYsiIb0oWqNhSJum5jYhldhLQ/Am2/IwWP5jy
         3+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284347; x=1777889147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U8XPHuNlG7Wle+hcGKTRA3//qZHMPcvdNl/NeojZNNs=;
        b=pRshvGkMDZeobt27Qvm5mLwb33vqZmU7f0R44rQ79Bqps6OFUtROaiAnlZQE9K1qLT
         hPxAF5pHpSxfTyrK1ixepjKC29VdVJQntlDErQHCe+2rjlaank3+U4kAWVPfRvGtTcW3
         vQu2rtJpsRO7s3rw/9+iPDCLHPwB926zgCbzKZZHBtIcpccp5FZMXbHRsBC3+OrNsNhH
         DfHDCKBZsaRP2Nu3k55S9fq3aYdpYjkHylZxa77iXPofgxhYdqm7s2DGs8c0Orctmb4M
         9dKjphdcLn/Nsf/VRvgTb31cH80RuHwcUkOTtAL+29BvhRUpFmu2YCRUt6a/pKR50pM3
         r08g==
X-Gm-Message-State: AOJu0Yx7jBpGWmEb8BVbvntHhSF/5juMSQHu1qbj1IHaB0bbYI0AE7xW
	aRXhqnyJtZTVSt1RHDS4GKMy4fhwt9MKnCVuGmrWJFGmOBT3giXE5Ee67SVoe899bXZrEFukzmz
	WouVz5S8f3G3uPH4CuZM0VkSM2JyH1zDdo7s2/zbMRQDtdFUcoq9gW1GhUqaIzWnzF80H
X-Gm-Gg: AeBDieu9jj3xcNvPqvgsMgScGU8TzUO1UKlKcVkEq75SpzxFodvN3feVV65rt5Rq1+F
	wxxh/PoxyDdaUbHygUpYRjsYSXC5pcRiA84OlLMYumJc3ZsgkQ0PG1rQYTm2hdhZOS2f54zMbkj
	gzd6EleDgDmSQlprcHn4Zl2TbxrSdoh4MOjkzM/Xfrw0UunZNbyQ+c6BhISmjr1xjXt4O+2tOPM
	aFS0jldYXSSR2EcAi/5AlMONtOsH9balWNyGZx51dKuxVsVsbqUgqyDkj4gG9Cf/r3aIkfTb3V6
	MhXfk9cWCzNHbxKisV50O8bYMA640h/IFdExv0JOtvsrQWSZhtluzbATl2+MGQxBpjbfkm9zxtK
	yieG67OA25XMWDDcQOIRPY7FfStVXtm4pjMVeWa07K1mJ/JlescUcr+b6LtbWtRPV25DiEodGVa
	vJ1BgaW17LQ0/1hNsd3pVuvJaubQAzKQNTQK0lMGBpl6Lv
X-Received: by 2002:a05:6a00:bb84:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-82f8c8c29b7mr43178184b3a.30.1777284346975;
        Mon, 27 Apr 2026 03:05:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:bb84:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-82f8c8c29b7mr43178137b3a.30.1777284346499;
        Mon, 27 Apr 2026 03:05:46 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec24850sm33004008b3a.60.2026.04.27.03.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:05:46 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:34:55 +0530
Subject: [PATCH v8 4/6] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-add-driver-for-ec-v8-4-702f74e495f7@oss.qualcomm.com>
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
In-Reply-To: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777284317; l=1504;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=eCeG46QNcGH6Tou/jfnrUot8SRLcYov2KTKbb+oU9wQ=;
 b=R4pmf9MfiwAHnwpHq4Nh2RqUo50xBcnNU0DaN0m+FpJphfpbIE4Pa095E2cFbOQge2DxKYPt+
 y66GYgeeuUxCYdPOomFmHI3WNimbhwS6xixfKHMlyGyvX5pyeRAE+aM
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwNSBTYWx0ZWRfXwk/tEuQnnoZ0
 l9vRmJqCrRpZqLSIZ0JrhSpN+OcztyZleVyotfYsEaLDF2HkClvxWnMqpryPJrG+kiwLBjY81s4
 MPu2ePsg2O41ce3BIs6a7LzqVjygJSPM0LmLQP7QSGtPAMJfY5DqaLGrd9Iam8F++Xkr/GE6OxQ
 w9z/NC6yY/2WDPaLWAXPwyJPhuVABVga502B2IRy5O3r2zaNUOfUFNNQsrpOmsm7WPh7bhNfm5M
 uEx4Rm0rbghCk+4E71U+8QHyNz4+Km1JjWXLihr91nSEvU2pXjhRXxQZj1Lurtff8hViPp22HIL
 RsPDI1eA3lQJIfOj1D3KV0ENqIjxwQ5wHZF2gF9qJPHMnkYauKggaLb4GV72zQdjDCT2KtHJBpi
 2QOl3aXijFRmsVt+W5hFFtXpO2wIVZxHiLxkeexdixVtANJgsTgLKEDqLVfzEoeFiP7B8ed1HmJ
 Dk0pccua7a8fg/zDG2Q==
X-Proofpoint-ORIG-GUID: YUDPwYag4-e0phsv27JVNAKWdA8G_U3s
X-Authority-Analysis: v=2.4 cv=RaGgzVtv c=1 sm=1 tr=0 ts=69ef34fb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gaXMZf0GDK_To7W6ZIUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: YUDPwYag4-e0phsv27JVNAKWdA8G_U3s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270105
X-Rspamd-Queue-Id: C01B1470972
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104687-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,4f:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.76:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
temperature sensors, access to EC internal state changes and suspend
entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index a9c5c523575e..9602d65c8b3d 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1074,6 +1074,16 @@ eusb6_repeater: redriver@4f {
 
 		#phy-cells = <0>;
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1523,6 +1533,12 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1


