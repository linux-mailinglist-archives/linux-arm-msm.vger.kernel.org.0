Return-Path: <linux-arm-msm+bounces-72507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC59B486D6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB5AE3AD58A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F128F2FDC58;
	Mon,  8 Sep 2025 08:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MEVFM4hg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BB32FD7C8
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319679; cv=none; b=ZPk0JO/wTz3jytUGWHeRdLnwNLQ253z1bGVQg+8j5oVVwJj4Kj/1fKlEVG4JFHi/XnvePG4oh6PP0C5t4iVh3B7MAOAxF3WpVdPryC/cW4KaBGSoDjK60PM41Th+5oeUM+ofqgNR/504Z0m9CAagANdKpz3Zpq85vHnHhYnTfCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319679; c=relaxed/simple;
	bh=/4ZTJGnGR5GHDhrjOUf5bHrQ1cpXckbW9O7yW53a0iA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O66moZw/G9fOOnQOeRfq6Ch3kDTaqT/454B038EQJC3EtlFqL/VZl5WCX7GeTR0r3t2wIfSQOjav2ATtir2qDGwrTh+bphqRBkbOV5eCNxKRaIJ3gYBRPe155cbiJa2aMIdWeztUqAFOpzVHlfsjmH8GB2U2C3iAVRzGr4anWMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MEVFM4hg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587L02dE013523
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	URCNjVbENokOE9jP4TmSk8RRgC/EOlHRv5J0OYYwhW8=; b=MEVFM4hgnWkMuj8o
	NFj1h2i9kxcnrnAhClcXs6uh0qBLs2Q1KaxfuQ2HDTPfD/zzH8kJuCaTzEwSNXuc
	jkfgatBGAa+Ff2Df5zYk+uENLxC43MSB9GzHp3umEmK7YLz/QpLDdb272Tll/fM7
	qUwyeMBrz/UCQH8EjjkPS1ONLOlYZHVX0iquLlBg/SgVLOzFevWqSAuujNgFiU2A
	rSXdQ0S/2FWaMy53msq8sxCy/Ty/ipy2rXtAfNwMLYFby1XCRBYSBHTG+PgWdBsK
	HgpsNd2pSfoh86NFp3DNDBm9VH+ww8dD9Rl49pC8GCh45fveW5/IWhFDyaJrolNQ
	FJzKhQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqfuq6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:21:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24cc4458e89so94530265ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757319676; x=1757924476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URCNjVbENokOE9jP4TmSk8RRgC/EOlHRv5J0OYYwhW8=;
        b=dhs8d8OSVheeXugjlEqogkBZgMdHhnI7gFgLqefiP5JcnonZ0/15bmf47wahMlN5Y4
         1iB2i/6bRTk4FFtwU5u3Ffoj3o31iZ4SagWz/lr+ki0vkmeKiRfS7efAPOEQ8T0aGnsv
         gUL+aPMr4o4cLxWW3cNPVvjWM9guudfuX4GvSFESr9C76GrQ/OtMbMZvnm6TSdO5eKMw
         gBo6jO35pk6WYyAvRmpzkcutTkY2ry8LvI29AJaBIY5UkII3cKpx4bCR43GsTgnY1J83
         4iHtn7R3i+KLjlyMfYbKHfmnobB6qS+DSY2Y58+fqCNbf/r68FxpalQrMZf+jIW7SMgM
         +NsA==
X-Forwarded-Encrypted: i=1; AJvYcCU73Njudt+Wa4ODTikiIroAzskp3dFweGygFsRfwnApaNYekv94LKqAwVemdQRvzQpCxGzcbi3KkvyEl7cC@vger.kernel.org
X-Gm-Message-State: AOJu0YxK2Zb5yPNbUgsEmAKfgACyJgQxX5hjW5G0B9N75H5BN4bRhxGy
	b19ch6q+NGZCgZYFHIm4vSJ/Lwmmz86QVCBgExRlO5hawYQOBNJS3S6rWJfr/A+wyVoO5DO+HE4
	9YrvuSPYTH2qUdrmpy1to5YFcHoI3i3uSo6OX3e+UaB5alAwJLghK5fdRCJNB8XhGaZoT
X-Gm-Gg: ASbGncvdA18R/KsGCaUJuUTwkzoB0WeYtk2D00cFtAjJZ99jisE/tdZEujWHYM1AmQI
	25UWj20HV2GHfkPXlPuw9LQuPJT0v69YYlM/x6XFW3OKfmxwn97NMzkN2TIrwkc2D7qUu2rlT9A
	8cphHgQQkL5FN45KNvDdT5QGEq6AadwLgNwTlj1BzvcW14UKxYkzFU+AM5z9B/YksHEXO4wFZvW
	hT1GiAm2NlpwMNgjO1AvBIjLzO9iCMR/st6cTQWnA+KaK3eIRoM7SBL/ySCkDUCY+Yh0ykWWRAa
	WCBfgKXkS4hVPl10IX//Wo4DLsSn8XF1d8db7UgazWVgdMwESWlEU5PqfLP6m3dM7lbd
X-Received: by 2002:a17:903:19ce:b0:249:147:95bb with SMTP id d9443c01a7336-2516dfcd7ddmr84033785ad.13.1757319676051;
        Mon, 08 Sep 2025 01:21:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUVS2mXFhGtkWxSMzeASlmhLdAgvZo3EJP3gdXk7dKlzPA07k/IJbwS1KpZbz7wAZsYMfudg==
X-Received: by 2002:a17:903:19ce:b0:249:147:95bb with SMTP id d9443c01a7336-2516dfcd7ddmr84033485ad.13.1757319675569;
        Mon, 08 Sep 2025 01:21:15 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccfc7f988sm104852845ad.144.2025.09.08.01.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:21:15 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:50:03 +0530
Subject: [PATCH v4 13/14] arm64: dts: qcom: lemans: Add gpr node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-lemans-evk-bu-v4-13-5c319c696a7d@oss.qualcomm.com>
References: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
In-Reply-To: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
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
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757319602; l=2037;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=sJt764nmIn3SiRpMOA7PhBLCauC1Z3J0FkQW3/5alxk=;
 b=2Cs0qSl19IFI5Aem/1KCsrfdDTsyphhbc2bhvoK5i1FcCTq5fwvREsgpZNuGVgOGZALk0gprY
 nvkZwTM7RU2BDgjU+yZJ13HL4Q8KE9tyVZc2YdF17at6TFixvHiLIs2
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-ORIG-GUID: ozr5XPmDu6AjyB8GBdt24AHi8iJMuF-g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX8YL86slTEQrn
 AzwJRDSgoAOIyNfBbqggvfYzXel9o/TDgdHEka8lkmwJmh0gIsjedZduFHfFQp1rD6WCpz4Qi79
 xtAG6IaiU1T+xBhxr3aJ/vsQtV//QMOtNw3fpcDa0mD7kPRLwK6UvVpeBdTAu2umOKFmpDPXuUD
 n2kZXNsYBgdgcYX8NI0+oWCzeoB0ivw5WTxXVzyDvx6xjWlvBokvWjsT3ZduVAQO+QzyZTwdmoA
 KAarzN//PA1XAH0PmIL2ThqEjJ1KaOBLnGlm3k8vOzNUkeW4agq0mVCitib8E9Is3d2+0TzRUd/
 44JIS/gOinn6J8+m1ad1co/YVe/+Djf7Ep4+POYjDP4Yldlr3cK8hxqzN1t/d13cqSYKoxAOhjj
 mVZY5rsw
X-Proofpoint-GUID: ozr5XPmDu6AjyB8GBdt24AHi8iJMuF-g
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68be91fd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=vHYnVJDjh8PKMNTngWAA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Add GPR(Generic Pack router) node along with
APM(Audio Process Manager) and PRM(Proxy resource
Manager) audio services.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 05d5da382bca..068acfa9a705 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
@@ -6759,6 +6760,45 @@ compute-cb@5 {
 						dma-coherent;
 					};
 				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x3001 0x0>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 	};

-- 
2.51.0


