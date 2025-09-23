Return-Path: <linux-arm-msm+bounces-74529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C98B96534
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 16:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5B8A1719CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 14:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A511DE4C2;
	Tue, 23 Sep 2025 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVyagMFW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8BF23A984
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 14:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638084; cv=none; b=uVEaOJfdWNAPbPBvUYOutHf9Cg3QvwHKZcdJlUR31izfgjQrezjRILfxJUW4PYnMixX6z5/v+Q6URTvS4r5k/8obZEWgBHFnEy9JD+qEL6jaLVsK73PdTw/n+HuhPxZEWaroxehUpoOrGSsf4f02uxeiXL2zZxTK4asEHf05SdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638084; c=relaxed/simple;
	bh=/lziSapCEzH2gqTs6jMXh7MDQ4LI28NR9zhl2YHnVE4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CXITkfaBj3okEWcJCPWIAiRDAb/7MpSRqwqAjuHGjY0ya7Z6XizAE7YATn9jE4P7vSIt+NaV6q89Xd9qnwbG/mTL7hDgR+FM2CRJAQQEcz8WOxuYAR9E4bXiZjjhMVB5+SI+9LnP1WC+Hi+e0FiWR1psLuygLgblgrLXvIuaBaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aVyagMFW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N8HOwL004744
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 14:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iHjpdqs7eCb9fs9KxqbTEla33T54OtQRS2i
	QSrd1H1M=; b=aVyagMFWf7gJ3+5rtZNOb35mFxxF/ClZb+3MTCktfqcnDbHWfPK
	Vi0iUnnNjM0dUWkyR3qPx1npO/vRMd70ozViV+8s5RNqGqrmgjYptKm2LkkbrV3f
	ZFAyQ+4myrq2N6Pb+jNl/DFP8MxoAr+/01XZiO+RODF/MoEl15zz9SvWPZdVRBCl
	5z3ebEAvnX79YJ66OtXUEmMR/iJqkzf1NyH3lIgt6SaTzssCrWOW40MHYLSJLfht
	xiv2pqSt55jc98th59RotUbHAiWhbviByN0nnU0VMaTw0W0CVuGllXMxG/53+S3B
	UqKj/dfIusAfqCIvPegVGkFO7k11b31tDXg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmns822-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 14:34:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32ec67fcb88so5041010a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 07:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638080; x=1759242880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iHjpdqs7eCb9fs9KxqbTEla33T54OtQRS2iQSrd1H1M=;
        b=alRPeRLeMiCq99o4Vqavabky9IpV0GFlgRZ/4QvHS3VNhi7AX/m5O8629sW9HlIlpO
         Lr0+8CXyh55kSJY68PLNo2eEBMI11tE5v9Q5wlbyGGsoCUhbA/o+35osLDc1DCtzdXte
         34glWc77h15S47uPgMIm7aG82OOKCBNYfzaZUeFmUDUIUEo1s19pn4snsmh59W9+wMDB
         cPb7VIjCV30q+4w0x3+SrDbceqD9JqR51RkKZL2pnoBQjgioIDN2VdZfj7yAYr4mtQju
         WSBJAwCMcKAq0j5QDfdlu6nkXJ+bchr7cc2fhNdUPMq2gWmGQsJpWi2US/UYLydmH8PQ
         sEGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzS8l8Cuv54lvUziY/ENczzMme0G+ITBVO+qiCWRE2JPyLl7E9GSTOkXev53G6MXBa8UU5s3ZXgrYlGd3M@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/uTp/4KT45rv+3FUf1uRiQQtaWWtOhpvQVdL7NB0Q2QIzqS0h
	icV0NQFteKXl+On1eIrT8rnYUjyso9oSS+8sweLFkaeWtCJl4EeD22cv9SfIiLEj4qWyn/zLX1U
	SFHWUJyCj/DaSJXPaZRiwbbNXIrd5KegjipN0ISwBzVSIRbNpSu483Cr3/3chP0p8V9lP
X-Gm-Gg: ASbGncswnqTOtA0OMLQNz1OGKLwSzTpuT/9yfhDmprmmZ3wBf4uV6T2gMfjHZcaht1M
	JJaL4EVDGejps0OiRkW77gvcssjWRJQInI1Gn5cy6qnaqE6yXnlkQUSWEePNy31dyppDb5u5sVn
	M8KgRo+4/LzDoIO1p2mlCNiIOFRazM5STCAYET6jw6af/0qzIf1g0os5UIx8t54QaPE+FhfyEEh
	O5de1n1hvvmJEOhaBdnFJnAPm2UiYPZ7ryiOC/e1Rs0edXSTfGzytGckxub/SLGbKXWDYosfdgX
	YnQoYr8c+7KnQrQNyihX8lrCV7/36f+AqbqWNRcuiYNn0fVn6Ng1UATD3cYIjmpW6lK6X+q1rL2
	9
X-Received: by 2002:a17:90b:560f:b0:31f:5ebe:fa1c with SMTP id 98e67ed59e1d1-332a8d243a4mr3540117a91.0.1758638080286;
        Tue, 23 Sep 2025 07:34:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwGhl6ZWmSj85Mjuc7FJXLjxNRqQjqt729aWTla6N7ewM+DbD5u9AnCsCrlBb44Z46976trQ==
X-Received: by 2002:a17:90b:560f:b0:31f:5ebe:fa1c with SMTP id 98e67ed59e1d1-332a8d243a4mr3540084a91.0.1758638079868;
        Tue, 23 Sep 2025 07:34:39 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3306064f420sm16676047a91.11.2025.09.23.07.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:34:39 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, luca.weiss@fairphone.com
Cc: --cc=mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: qcs6490-rb3gen2: Add firmware-name to QUPv3 nodes
Date: Tue, 23 Sep 2025 20:04:31 +0530
Message-Id: <20250923143431.3490452-1-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d2b001 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=pdVGFcHJ2_4qoVWHVlUA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: vxDghFZ3zioFWPjQeqqYnxdaPrT-YyFc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX/0Nz3JopsAky
 7Gc6f02LtxXynBNRcxqmgzSgfHTY9SVRs+8kLQK/kwYMbi1vowK/i+PJqNtq1nxF3sHpl/kzv8D
 k/lfMZuPAcrm3veC4JyICLemU08T5TTxFAGmb0JIpz9im6XSFTuT3cvSNIX1zvcFYJEWCb7hNwo
 dUE7pl9O0Wt+a+LqUT095xLT0nmR02zQIZLSlyGYbP0wBUWPy8K1LHeaMFlH7FEBAF7zWtSWK8D
 MGIXET6yZjG7hBv9GayyF6vDw8WEq2Lht3P3xObMb564FsY5YEDVekaB4Qr6sgDBmof49rb/X0a
 0SrHiVGy99USlxS/fCqLUVpV7xqyJCGBo2A5mpGhCxqhvIoTEHSv1e5Ix/csZ3bzR7hy/ZMA2W/
 8RM8ENBz
X-Proofpoint-GUID: vxDghFZ3zioFWPjQeqqYnxdaPrT-YyFc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

Add firmware-name property to qupv3_id_0 and qupv3_id_1 to specify the
QUPv3 firmware ELF (qupv3fw.elf).

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 18cea8812001..4e361580ddf1 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1009,10 +1009,12 @@ &qup_uart7_tx {
 };
 
 &qupv3_id_0 {
+	firmware-name = "qcom/qcs6490/qupv3fw.elf";
 	status = "okay";
 };
 
 &qupv3_id_1 {
+	firmware-name = "qcom/qcs6490/qupv3fw.elf";
 	status = "okay";
 };
 
-- 
2.34.1


