Return-Path: <linux-arm-msm+bounces-78724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 558FAC05AD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 12:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C52E235C223
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 10:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09C5313527;
	Fri, 24 Oct 2025 10:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SuzXCVTo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FBC3126B6
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 10:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761303042; cv=none; b=f6VgvrIOzushR8qbpUONYsHIKalk7tiw0WRb0W8iWq4qBAfhyzp0jC6JdkZUIT8ba06RFm40CsxOFnCksNYjeqqiwhI+r58OIeXIuT3pYr5ZKIBmgrlDftbV8fe5L9RZzrzVl7JYu82zBCCDBMO+ZxeclCkm/PUhkolTsHEpGtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761303042; c=relaxed/simple;
	bh=WPGiDfcWovbn61egHdhHxs84SiuVP8EjCt0AvyxtedE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ri+4ex/wUBg8Xffc3Q5uQi9YuH0y+T35hcNku+K/hDOt8o+X+8Hh+SEERyCBRuPFH1sYmARZ/4Qjc2Kc6+GdICvMLY5sFVQW+dubrELsqafhD0xL2NE8/oGNbcqKXIqXBiTguaN8TWTxArUaTrBVqkCoH40tXft3FRjZdiJ58qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SuzXCVTo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FQcv003445
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 10:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i9RE9ZFSbYk
	I2uHWWS1BVwm3WmE2jqPOJsoCfsqTrAk=; b=SuzXCVToIetAtNwUmPP2nCww3A9
	Y1TMmnCILe3kQ53ORblD8wbqTDX/2kojvgbM068z89peP9HVeSTNHw0E6KqnY4oc
	heBvno3Ucwy139glDBqX8XcNzkeLfF8RyJntIzGpvPlydL3q7ewWLAcrP44Sm21H
	d1C+xEmaLNJmju1Gn+2KAeBSdlO+5of7jIuyIP+ybnX8aWnmIbQtuqopVjR4dqVv
	fRay1HpBXw1/piFHy9vzDdC9bd49uVNSFmEC0oqwz8757aiV9YbcaVOtE+M1Yp+U
	Gf59J3byAQASucpJB/0qb/Ajnc530AV+6BMqI1FiPPC6KIyLjE0u6LeUkpw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27jbng6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 10:50:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-26985173d8eso44653435ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 03:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761303038; x=1761907838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9RE9ZFSbYkI2uHWWS1BVwm3WmE2jqPOJsoCfsqTrAk=;
        b=UuuYlcfrPBEX27DUqHkntbLEw/mnmwUXOaHr7j+kHWL+ZsT/MLPXZ+GgqXFXS6RSVo
         SLNOquVQmf0qS59FnA7BrIlt6ZfEtM6tLSYzc2nrU2c2eNberzrRfY5OH0gdkqq77ilJ
         TNvd2fYvFGtmEin0J2Ui8rUgJeCBOu6bxFRy13t6ij95HY6kgR+dT2uwujlJIpOmJQlc
         0eVU7PD69+JEmxcgoowK6Rv5OVjzJt5AWJiUlfQXttLZUmAqGCk1lWoEyN6DQr+RIoZ/
         3XyjH2w4YVgNAcgLtjbcAGdK7VnLDvJGcZh6CQVoabNkJOV9iEFQFDvs+QngX67jqWN0
         gz2g==
X-Gm-Message-State: AOJu0YxmCgLV27RsO3bAPppnKdvg9cWzWg1nMxL6kOxoEKjQNvU+p584
	1rhK7ggA8mL7qp6/Nbr4mjJjFCBM7YqRGtFRyW+yUf1Y55xMn5eR2DAr2Yy4esf3SEEkpP3McGp
	97UtGBJJH67rR+0/an8NlQWJDQinbOpY9nCw9MpdFwjUdWQ6rsERCRoxWzbh3uXX5/sPS
X-Gm-Gg: ASbGnctrPjzmrDBRCaXANWwg/C4NQHYfYZrT9scvmN9M6GkRvqFUPFJXYBwKeMqRUrl
	oL0E4R5B5e6hKSSyGBHBM86efjLN3ybwyOTCpKztcBxqQCelDgRj+IT3zhuSwO4Bkdj5BStK5+u
	SUhuIDlAt74RhOsCUvk0e6mv8qaaFS8u6bG0ZKbqNYwFai1aEkk+Voi8zz8giGU5cpHwaJefcGV
	7ivq2OS6CPCU+U3HBF8V6dlopOA3VMAXIjQ/6pCGbt9sphZ0uYDLdhH7NcUAi6Ye18BqwM2IvX9
	ZLNPndSyU3PElVq1gEB5WNzya+/Rjvi6tMnNWnNg4FdSdjJQigfgz5XR3BAA/brieAoxO33IWPp
	+oVHwDPRUdOmikS8hFTpu/T5H925Un2kWb87l
X-Received: by 2002:a17:902:fc4b:b0:290:a70e:6261 with SMTP id d9443c01a7336-290c9c93c30mr349390045ad.11.1761303037631;
        Fri, 24 Oct 2025 03:50:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXw79W9RUWBmxKCdwnYGEXSMksO/yt2QD3Y/MhqjoK4q5FjIhJjYCm5PRw7UriDx5DKmsJKg==
X-Received: by 2002:a17:902:fc4b:b0:290:a70e:6261 with SMTP id d9443c01a7336-290c9c93c30mr349389865ad.11.1761303037233;
        Fri, 24 Oct 2025 03:50:37 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e23e4b3sm51236775ad.103.2025.10.24.03.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 03:50:36 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: lemans: Add missing quirk for HS only USB controller
Date: Fri, 24 Oct 2025 16:20:19 +0530
Message-Id: <20251024105019.2220832-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024105019.2220832-1-krishna.kurapati@oss.qualcomm.com>
References: <20251024105019.2220832-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfXxuyzQ2pNwTa5
 VX4pruPEHuXpMt9Ewtq+orKpmaxnANVC6l2fUE+vF9RnEEKFDMzkNZXd4Q91r4fHN8fMRhfcmzb
 UpNfW4gpebQlSFvb+TG7KPhoXA0Sqv72td4GqyVQLHYJPLE2KGIV9IVWwK7Nppy5KyVw7kKNR/z
 kAVswm33U8prJA9ZkibR5udvbWX2hq8H9vwFBQT85mfjA1A5QpUSTh8TWVhxo5kvdHK2iPI24wl
 kkjgmPspKRyeoLMRAsyXOBgBhzDf5uPpNc58+8xUYhz1KcZ9eYvbQuolHIBo+I4DNW9spGGlz48
 5N5hSivaJuyoSvugzCPK091HzQYeHwHNp+M4fwWTBV+/tqhvGtagx35g8l+7V2DIOZUEGhoWJ3/
 1uGjHpXIvxgW88WZsbz0wxbwXcN1Zg==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fb59fe cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=d1616NNI0-D16vPRn74A:9 a=dwazZoRKGdePyhm7:21 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: E9Mop3SRLdEhIJ91-8kHoD7tPeTe39FV
X-Proofpoint-ORIG-GUID: E9Mop3SRLdEhIJ91-8kHoD7tPeTe39FV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

The PIPE clock is provided by the USB3 PHY, which is predictably not
connected to the HS-only controller. Add "qcom,select-utmi-as-pipe-clk"
quirk to  HS only USB controller to disable pipe clock requirement.

Fixes: de1001525c1a ("arm64: dts: qcom: sa8775p: add USB nodes")
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index cf685cb186ed..c2d2200d845b 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4106,6 +4106,7 @@ usb_2: usb@a400000 {
 					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB2 0>;
 			interconnect-names = "usb-ddr", "apps-usb";
 
+			qcom,select-utmi-as-pipe-clk;
 			wakeup-source;
 
 			iommus = <&apps_smmu 0x020 0x0>;
-- 
2.34.1


