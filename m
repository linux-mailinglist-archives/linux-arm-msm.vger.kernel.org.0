Return-Path: <linux-arm-msm+bounces-73733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E08B59B34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 17:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8EF346333C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 15:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A4034573C;
	Tue, 16 Sep 2025 14:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XfusKa0S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5321734F481
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 14:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034797; cv=none; b=omdS2Vjuo7P7pf8vfOT9pSf4mTgFn0fr6NLWvHqQXb0xRhdm6N2nMbo0QiWZWnWx9ojAJUpTm1iVTvdbXBAqdZoWJ1pKTMNkzHkp6T27wq2S1PSc6XdttHTxTXIOUMn6n0p+aOMgSTWOsVTVXGIhN8vwPJKEv41OvAlwJN3HvMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034797; c=relaxed/simple;
	bh=2Nt/WViwfyk1OM7Esn+J4JmZrNIA4MYrfc77+xCl288=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APCzXpVj4zZjLJXUJZjpo9gsiMTJaeihkREYlEAltym4fAIcTv1O9DO0D9R7jev2Ij2jAC0/39NGvke0AI2APh5SXx43LvyHHKB7Tor75Q9efOgFsqPIS7qBzL3d0CP+fBUdEUdin+Ss/FJzdiTNnjQQ46VzaqaQkvCpPB0/L8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XfusKa0S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G9sOYg001666
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 14:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XxJ1YelP0P/MEMkGmrnvBSD031m8K/rwDAJvdjwN3a8=; b=XfusKa0S/birWy7k
	/XRdF2GH8cOcoUB1W1cXoQuiT8bfmP/oUXopD7VnXVokd0XLO2Q2j7qOwwG1zARH
	GTwBwXb1vNgXcya19uA9r/acedUKghoZMXShpVQn8rbaujz98xX/jEOyk51AWbKR
	mGviXbL1Er9q6R0CFX/JbdjMTBc/mYlMn+F6v42L187GsTNIHJGwqzVN54T8f8vD
	+pjHrTPfIyP1b2eHprC59T0Y8k+TIXiONL6x+RlWWw2Q46+oEaT/RMO5FipKxzHw
	Hgt9+8LR/cjG5rnfzIw+szGaRvX1dT9UlAhcGS4co13cOz/Z0AConxz9eOqueWdv
	4gl5sw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495eqq085n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 14:59:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-263d67851edso55927405ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 07:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034794; x=1758639594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxJ1YelP0P/MEMkGmrnvBSD031m8K/rwDAJvdjwN3a8=;
        b=CZsOVJYUmu4/Kcsw0a1zFaxfPNCy4VjlbFQ2pzFE5nO3/pB4zVTranei9UgSM4iWg+
         NYhfl1dvpsylaIkxaDClqwsNLAZIARmQOAy4WD4YXK9/Q609//g05tEyT+9pprUvJ07n
         RMzWuVgNe2v5TMiKMd/XvD9WfxWgUfqDgX/qKhoj7dU0y9wGjoUaWYqtnkgwyFfuAOaZ
         REydUsH87wXykNI//9xbmx9UBs9khXnCv2wFJkTh+NUqjgNL7u0T/JxJ4UextSSINUxR
         OvP/z2/7cEy1okCuZjhFtdsNAcHwY2pcWqw4tLRqW287fhKks6FftFJeBHq9bcAfz8XO
         fE5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPENVlY5QbuV5ucSiFgA6zkI269Bl5uID1qi+aTAEaM8P3fpgKO5XP9xg/WG/gNBIKSqtzXPsXPvDEtlQk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+iGgxAXar9gfoe+l+2sHib229F9Ysvb07m4q/17RT7IbRcSTu
	TJQFjoAWyMc17PY9UkO56kqP57MCzbLjsmoIp2lJaHrDOYLy5NqPff8TMxFMFV0kW7r9CWUXRci
	czje1dyiACXzEwXTECPuY/x+tNMHhDuaX4DxNhB1EswZSW8iu84DHNKDg8nxaLNOwOevQ
X-Gm-Gg: ASbGnctiWmt/dhqDFr7k7sT5pXNA1FWS9FJ5OpZz+is4fuH1rvDjTZUS5AVw//PEEM4
	vdmqQa6Y07Z+wG+kBpSvpizbhEcnRG75gQLBJj4xrvIjOE2t6VGu7zUpHMJJ+JDNRePPfveHIFB
	ewAXc/YurVKLN2g5s8AQtWPPx/E8WvDSld9l2n5f66HvJk+8whdUrdjGTh45XNlCliCULE9UyGu
	mWAWh9pWDXgJM65wigpamIaalV2SoWOGSjqw3fhvlwxWom4MD1iUuqDN8WMB0mNtjbp/mKQI+cv
	WAfjqsqDCBeSnWy+T0i4NCa7QoX1ogDxk7I5+4nb5+AY06VSHVShKNwR/wpxYiTbcM9s
X-Received: by 2002:a17:902:ce81:b0:263:3968:5911 with SMTP id d9443c01a7336-26339685af7mr113520535ad.60.1758034794441;
        Tue, 16 Sep 2025 07:59:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBKRspoWP15CqUB2yFIJlfOBXgK+lGPz+ByxAJIF4pwJhl1lPwAbpVj3lSNB+EVNj1pqElnA==
X-Received: by 2002:a17:902:ce81:b0:263:3968:5911 with SMTP id d9443c01a7336-26339685af7mr113520265ad.60.1758034793892;
        Tue, 16 Sep 2025 07:59:53 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2651d2df15esm74232615ad.45.2025.09.16.07.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 07:59:53 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 20:29:25 +0530
Subject: [PATCH v6 03/10] arm64: dts: qcom: lemans-evk: Add TCA9534 I/O
 expander
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-lemans-evk-bu-v6-3-62e6a9018df4@oss.qualcomm.com>
References: <20250916-lemans-evk-bu-v6-0-62e6a9018df4@oss.qualcomm.com>
In-Reply-To: <20250916-lemans-evk-bu-v6-0-62e6a9018df4@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758034770; l=1374;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=MIs5mqG0clseQiptNt7kkk2bdolwAQ9t0S/sVJLewOk=;
 b=HU7WP142411mJ1xhoSDVToZVg4hEjSVd+9TznIykJNgekMuOp3FQoFPXGQ30F6knBFzqB6DsR
 y0OARcqMwIIAlJhUSap0I4maVjq2mGL7jpRy6NuZ/mROwBn9xisvh7i
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: iiVR8ha_Xyu3X39TfeXyBXtnZilVuqcz
X-Proofpoint-ORIG-GUID: iiVR8ha_Xyu3X39TfeXyBXtnZilVuqcz
X-Authority-Analysis: v=2.4 cv=XJIwSRhE c=1 sm=1 tr=0 ts=68c97b6b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=5DqHOVUeJ4EYgL39aBIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDE4NiBTYWx0ZWRfX97BamHHSan/Q
 1GWBMR2XDp7WsBJB7zI7vwc2s9tGA+1FwZsiN4OUNYwtRcR4YuQSCqlYt25IimL19J3SAPuJK2e
 eF8yuXgD58LmS9wA/pDZbtCgJxsEuZCC0/uJTofE+LItWpnqzNhN9+6wRVjLkXXqRVHJHJwU18j
 QpWYsC2c75S4Bayv30CldwkV84sqjJkHps+Nzkt6Jl01/Infs2Ouc3Ui5nwDre/y56W3nnkdiye
 SeXXg49APEq0WLR6E+qW5vZq1gfnUwbiSi2eCJIi7j5SvQi5qPhsfl3iW6posZAkhY9T7DgRSQU
 vkwdqbNYgIGpeWiM4fzBvtQmyH1XJfcVqj9TDNpmSma5PMozCh+S3yLZYk0NBjvrHZmAsdbJls7
 qUmPMN+/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130186

From: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>

Integrate the TCA9534 I/O expander via I2C to provide 8 additional
GPIO lines for extended I/O functionality.

Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 4da2c5a12c1f..d1118818e2fd 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -341,6 +341,38 @@ &gpi_dma2 {
 	status = "okay";
 };
 
+&i2c18 {
+	status = "okay";
+
+	expander0: gpio@38 {
+		compatible = "ti,tca9538";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: gpio@39 {
+		compatible = "ti,tca9538";
+		reg = <0x39>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: gpio@3a {
+		compatible = "ti,tca9538";
+		reg = <0x3a>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: gpio@3b {
+		compatible = "ti,tca9538";
+		reg = <0x3b>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+};
+
 &mdss0 {
 	status = "okay";
 };

-- 
2.51.0


