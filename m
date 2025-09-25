Return-Path: <linux-arm-msm+bounces-74942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D2EB9DA02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 410DC3BFAE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938332F067D;
	Thu, 25 Sep 2025 06:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cbw6CExh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CD22EFDAB
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758781798; cv=none; b=u0XWCI7Qm6i8Pr5Z03HuPUxXsoqkaSrXWTt2AUbApbjqohwuWCh7XR3HkjuOM7lFvqN9CZJuvPFkB9w/cZ/Ctl59ku5ZYIHNkeWKGVfuXbFgQMbPAR5H1T8mxIOpm5Exk5lUzLYhRUjns8cGXKuKO0QIzDJnDhcr7KfQGbAf/ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758781798; c=relaxed/simple;
	bh=zAluZpUSdpNgn+3ulofSw8QkVZRy9NzA5+UkWEERqLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CC9W6FVVt4Kh4lGVDSgr9GRKTsAuxYFWb3m3oMOvGImMDcpesaUH3rEhNCpyrUEKnxxPSD3x3lLz5uYbnjpoASqMpyHo4iMKYpma/8FHZSbypzT+XwJyt6L76vqsgh4W/R/5KHp0lUMs2MbEGk37b++x0cAGCBF+d20wXJ6ebNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cbw6CExh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P4a9Ob026667
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ueg8cSB9cvZ8zN3y2yyPUU6opBQriygJdKD3HM9HZ1c=; b=Cbw6CExhiWtoiCM4
	5WpRZqowOQtENxXL8KK0X5IWnwNBwDHbr9ottS+Hr/o4AMp59qEsDjnsfIpOO4fH
	WhGbqsvvEunx2Bjkwcc+hQblYQTy5NJ1O2TPsBlkjlDtubnNwPNCnE6Wx/wxdIMr
	+39fiK3BV+nKYBupcl6GLdkxP5jvXHcfeLJTmVY9emwb29UZ3RThWx6YOjQNeEJB
	+K2I86IkXblt8Oahw7lc6jFGJHn/B/SEIOxNSvgaR1R9UbjnFp30miJnSHiHp/WF
	PEe3XhwVM7dJ04uVdXa8kl3gFgTwwIniSdXcCQGppT0sypWwF5Ttv+xmvAosKLe7
	azqYyA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49cxup08ca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso591128b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758781794; x=1759386594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ueg8cSB9cvZ8zN3y2yyPUU6opBQriygJdKD3HM9HZ1c=;
        b=Nl+Z/VCv8aYTInDNHc2dtx3y+F4/F5zAOm2sl1iO/2SMT/nUFxOvZFaOgMQWL7bkB0
         /e0EvWPt5R+No/8xxIEdtSITuQJTHEaJeSaTEM18UAZed9dUk+dmb2SyloQ7gYDzTZMH
         r9nCBQkcjrRjrjUGV/oVV1tOt2Zxdfiv4J7U2o1w8E5CQ6g6T6EuBsZiztab3TKRX+YZ
         F0iIT96FZCJ2x+4bcR3W/DQ8fRW9VJiReSDGduu1tccfTHw9bIRE4mrkzupnz4ebi5tE
         HXon1PB9lg739Kf1NUdAq6JxAgqphH9eLXpgUWMKbFu+8IcpbLhK5fwhKjQa+lktvD9r
         U18A==
X-Gm-Message-State: AOJu0Yzx93cV75+gRPTgDKXXkhYlabRfdc/5++whkYUMdsSOKkuPsKrx
	IEy0QBdeinLiuqH/dM17DVwVIvP1SXraYWRts3bwNPQq07yHWccHby3Wd0yFDQ+HI5KsZz2U65h
	yX5uOJQRDfaXpvPw+M1RU7hnu4jOC84VWmHBqQQg727290Ritp9MGbPm+FMjzRy6/QGDtS7ckC2
	jB
X-Gm-Gg: ASbGncv3UAPZYD9vdmeVhZjQQQU4oga1MKQpFOGZUZ/OJGvNUtLR6krgN3bpVwU6jIZ
	ma1cH1PUVOiYEBjvfZUl+5JyF3LxCMBOwdTo0CV+E7LT/6ivV0FV1PznKm6QCgwCOCY7bMLfP8y
	w1tTBtFp6Tw6dL/+PpA1eP08Am4Gi+/FSJGySaOpp+MImpz4qH7fBxkAU3eoE4B4wCieU7kUEWI
	p8Mg/dgBWrZvrLLrtCX9jVo/quA6ymWCmFoQUXvGwAnlvPBi5bJJ8r2N4vyc4VHZ0iM30DokXwd
	3sXBNF2nK2cr9LX6BqkN5vOXhMBb4m09EuFdkK6AR+SRMzB1c9KKj67wDzgvoC5lWi/Npk/hx2z
	gl2cUwOX6ULSW9po7bWsfgu4gx7Wvul9F9F7kTCFhI7aaKGGNfQ+Feu3vpqSV
X-Received: by 2002:a05:6a00:854:b0:77f:156d:f5a8 with SMTP id d2e1a72fcca58-780fce1fb4cmr2847510b3a.11.1758781794430;
        Wed, 24 Sep 2025 23:29:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDHNVbByT2YfiBzQeOeuygXP4u8xrlwF4Xrp7NrE3lyiiFtUAMelKHPzX8XSDaQONjz3u+Sw==
X-Received: by 2002:a05:6a00:854:b0:77f:156d:f5a8 with SMTP id d2e1a72fcca58-780fce1fb4cmr2847485b3a.11.1758781794013;
        Wed, 24 Sep 2025 23:29:54 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810239136dsm952962b3a.5.2025.09.24.23.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:29:53 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:58:24 +0530
Subject: [PATCH v2 18/24] arm64: dts: qcom: glymur: Add PMIC glink node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v2-18-8e1533a58d2d@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=B4a50PtM c=1 sm=1 tr=0 ts=68d4e163 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=eTml_EgcGECvy2QnpD0A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA0MiBTYWx0ZWRfXzKBEFXOUKPBb
 h7DFB8XJeFTjOjyg/xeXuJXimce/G4fYmE0zp1Y98vYrzwpEEPcivvnvaYpVXVrBSZq3BFjeGAk
 WpxTK2PhMrIRLplDaq6hIWU4aECP1Dis0UinTFZLKbgy5mk/RGpbgVzO3PPvbVGmbYTdrD5H3+B
 34m/fyOnpfR/MtQFsBN+R3zxQ1jHxqp+hFGaV56ha3btmk49TdnOffzqilfckCf+cHPHwKFSvlJ
 WyaIg6T7mKJSPOOwlIHMpTnkIlATONnj/hd3dH1KILotDqwB+gu8/b1+LCQ7WWJEkpcFg7MQi2j
 U7h8IlBSQVUVczxfRBF1fCpgYtY9pfyovsfcWQjQVJbnOupLXTGS+KL0A9tX2FDlGWtaWVy8sla
 NPU3bvUo
X-Proofpoint-GUID: gb1HK3UVJU3aQ-QlK4ZvJ9YYlAzFAfs-
X-Proofpoint-ORIG-GUID: gb1HK3UVJU3aQ-QlK4ZvJ9YYlAzFAfs-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509250042

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Add the pmic glink node with connectors.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index b04c0ed28468620673237fffb4013adacc7ef7ba..3f94bdf8b3ccfdff182005d67b8b3f84f956a430 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -79,6 +79,34 @@ key-volume-up {
 			wakeup-source;
 		};
 	};
+
+	pmic-glink {
+		compatible = "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+	};
 };
 
 &tlmm {

-- 
2.34.1


