Return-Path: <linux-arm-msm+bounces-83506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7162C8B62F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 19:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7674F3A3A0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 18:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F7026ED48;
	Wed, 26 Nov 2025 18:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AFylIdLf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iazlJbJI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C94279DAB
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 18:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764180587; cv=none; b=MTQ8M+HZwXe7hKTjt/4o7QsILiPtmnH4pK3sQhrXUQpbDU4MUXrpitB/s1y5l/+wNcRgPMPJifITuY11h2u2NXhrBeqwI8Ew/ZYeTrziNxc5IlJrcHZZB8YnPEUUnLOML7NP6F6Q5TMlBLMyNr5YghoyJHEiVct2SO07rlSV+OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764180587; c=relaxed/simple;
	bh=hCi2eCKxJ5E8cwkQhQsDZzhvZpag4vydnsTZaV8EP5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ceJftomMWhsjGa3DZjn8UIFUKCHG3WRGqo3HaNSBU1v5X1YChJF8CJTLviI5Hg0Gpvt5pau7o2zpr6PBN5+UM+Hfje/8rS29H5bT/OHGHmcKhmafX+knY2OZId0Oks9BeM7NXRLwmRIapmTrUEg8B1yYVJMEshJ6t0wxeBl+tJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AFylIdLf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iazlJbJI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQEVg9Z2355613
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 18:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j37MaCFjUw62cRuBDaXora
	U2a8j71cPnRU5B5JQYZZ4=; b=AFylIdLfPWQzCS6fZUe34jVzwihrA2P6RNBEmA
	avEL0IeHaInyPv86sDhpGV/cjqkXtVLh7DURvzaJg3l/ymMqqkfpSeAOIuYoi48R
	Cln9zsYsqktELk2XmL4BGwFAFAct1jCZepnvoya9XQazpmyPjJisfX+mw5eIZIH1
	vzGJxPUOxlU8pRuhMBi4QmX1NjmhmVn216jXW1MFAy5w9dgo7cGtKxh8/iKEBXif
	RJxVxcMqkH1fUcgh2tQNQaa40oXSb1//EbEJdIultm1E15PkLg8soFLz8o8kxjm8
	81JRWAJ4SvsU2kRTtVu6H0vcBfl+om1sQrRhWzkQDMyxVH2A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap3d1gp45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 18:09:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso14644a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 10:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764180583; x=1764785383; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j37MaCFjUw62cRuBDaXoraU2a8j71cPnRU5B5JQYZZ4=;
        b=iazlJbJI1z6N0XipTP+6eKrAsrrCLmHqDUa1ib/yXcUVE2LWExSGlzUKZp8AIf9j9E
         KA6laOoeAq8X/lcLgbcR83Y1NfsamktzTiok0tm2ohPZWpibslfF5vxtL0GNeQRMI3s0
         tSGmr6d3MfNTkKxFwy8pT1b4aoTq2J41Aic8SRbIOH9FYbZPKpS/qmqsgeB0MwveiWZj
         iv+FQb/sZcF5rWUtPfuAy0aKXW5w4bL6OgXhlMVQvhx3xLFadtycTMpvKhiBPpQnSNxU
         HFWHGFahUeYVfQPML9cu6voaJoF8ehsCV75WxXg36xq3SEtmSLLDGpxWWwyTDvbpxgmw
         SoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764180583; x=1764785383;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j37MaCFjUw62cRuBDaXoraU2a8j71cPnRU5B5JQYZZ4=;
        b=XfuQzBUsErMd+3v4tUGkJKFT1y6acw1XArXNx4tl0BFXFHrmvm3+q8EAAwBfOxukvN
         TI4sh/4mv8CeSS9n2ts6Wx9ElodWo0Gfpy2mNnfkeySTiW/Bi8MwYJDRzwyTDVXNbpR5
         p0UuqFVYQc+wj2n7bT9TIF5LGwpdTa19LDedJ45hq1LsWhKnv4K/T8WdmLuIe5AVSHsU
         IvCr3fXan7DGquTquHYXhkdoVnm8I0io6LA8pv27l+167mLSyerKSLaI+vQy3cwPVUXP
         CBpXOJAFYo8triFnoJXcRhwKgYWAR4icwXyhKI2BzWswOiXYO7KRDcHKkNgiimaQoPeO
         SzXg==
X-Forwarded-Encrypted: i=1; AJvYcCXmsME7qFH3BoUm4Yi+I4rQlUb5Wk+bcZ/2FCepDQEuLIUa6u6hOV1DpPtFkDzJmPpszCImYoB6hS46KB/O@vger.kernel.org
X-Gm-Message-State: AOJu0YwW0eePa+junAElErZHM6xfsIQ7IsxzqabPwdlmt/2/57lafGRK
	53xv/L/VrmCs6BKberpWk4rhBBmKyK9o6gKKu4YV4r7Oe86G+OZgVx1TbHcEN7EGATt2N4RRp5C
	BjWhzjKXDRbQVDi4kfgtjb27YE5WOi8B/q9xe8ECVOBXc2b3Y0GihtqR2iUZcRGn+X4ApqBptQj
	rE
X-Gm-Gg: ASbGncuNzVXQ22KvTCIMVV++4o7gpFd2v/QXp83jzGH0F40jLkuqXcNC/Fwe/RGJWWO
	tOJjeUwphX7938eOuUNmCGtWWaYctwS3ziJ5t8Q7d9eiwfmm+WDv3U6PCV6lAigyAs5HxnL5DCc
	3C/UinKdFOLFZizOZgtvPHnPJEjmunBjdHTnJthjgVCk51Ss2Gvwnyf4AD55N06sRs+D8t0amIb
	xYSgV6ebfiEc763hS33E+QrMC05O5Qne6FNlM9OPnucMEuOqwSq6zSd3z0GzDhkO9DJTgOIv0Sn
	SZYKKYXat7dIFyHt+n81EJ3MWoOINr7uAgNkwzJxqF89eFIYe2rzFSH26VB3x1Zuib2JU/IpdpD
	EqMio1fsXHE9j9dc+fssTtccA4LeBlY0D8Q==
X-Received: by 2002:a17:90b:4fd1:b0:340:c60b:f362 with SMTP id 98e67ed59e1d1-3475ebe6763mr7667280a91.6.1764180583417;
        Wed, 26 Nov 2025 10:09:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYcctD26R7NBEM1n+c5pe2hqEuEJUZCQA30LCjbik/c9HRTpP38oa9B0O5xveVysMMUoeQyg==
X-Received: by 2002:a17:90b:4fd1:b0:340:c60b:f362 with SMTP id 98e67ed59e1d1-3475ebe6763mr7667251a91.6.1764180582937;
        Wed, 26 Nov 2025 10:09:42 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a56b252sm3224890a91.6.2025.11.26.10.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:09:42 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 23:39:29 +0530
Subject: [PATCH] arm64: dts: qcom: sm8750: Add videocc node for SM8750 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-sm8750-videocc-dt-v1-1-a848fbfb257f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFhCJ2kC/x3MTQqAIBBA4avErBtIU7KuEi1inGoW/aARgXj3p
 OW3eC9B5CAcYagSBH4kynkUqLoC2uZjZRRfDLrRViltMe6usw0+4vkkQn+jabUjQ70jb6B0V+B
 F3v85Tjl/HaY/HWMAAAA=
X-Change-ID: 20251125-sm8750-videocc-dt-4328c4c98cd4
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: Ayq15XOsV9hUZc6q0qHmphIgJiDiCHGz
X-Authority-Analysis: v=2.4 cv=MIVtWcZl c=1 sm=1 tr=0 ts=69274268 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ylueHw9rjOQuq7YDIEsA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Ayq15XOsV9hUZc6q0qHmphIgJiDiCHGz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0OCBTYWx0ZWRfX6RUsApBnP6RD
 jasGFASJQzARJYhE/Rv9bdMZTG5uUeRb8RO4e2Miv2Hv9Qw5lq2qMT+HSnnDYAJ8398l3eFQaTD
 JtF65Hhcs8OXHDzyWkgQ91g8GF/YsjUWk6goNMlSLn9RNerhVzRL9yjBoenRpMWh69znnmmR/93
 4sJkTRwyk39FtEjEHRH963EJnsfxxM9YftZvvl/aoP/l90nSgTxwBeZks9EbtQTP3atLxv3Qqhh
 5Bj+KO0VJSRv15+AMEeE7CAlW8QvFkxGQNzpRYHyDb52t5pi/4J2qR72xkTMZOK9cUx5gfGZqYw
 +5ndnLvfXm8xySNSOGJO6xELH6NhipsYYEWXy0gsq+xtFu8FU8QMTIBcd9R9zDrDABsnUjn+tJS
 ffxhYoX4UyVusfyyz/1vrpF0yl+djg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260148

Add device node for video clock controller on Qualcomm SM8750 SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 3f0b57f428bbb388521c27d9ae96bbef3d62b2e2..18e43c509f1f24785d55113addc5cd9f96e986f1 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2740,6 +2740,20 @@ usb_dwc3_ss: endpoint {
 			};
 		};
 
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,sm8750-videocc";
+			reg = <0 0x0aaf0000 0 0x10000>;
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;

---
base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
change-id: 20251125-sm8750-videocc-dt-4328c4c98cd4

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


