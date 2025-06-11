Return-Path: <linux-arm-msm+bounces-60898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 222AFAD4914
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 05:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84FF13A4A3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 03:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0282253FB;
	Wed, 11 Jun 2025 03:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F35BS/br"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6659218DB3D
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 03:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749610822; cv=none; b=hjW+5BQ1+FO1m3A8NswqGzGy7YbdPsmxJt4g4khSRQ4pa2HFEyiTynSuqD8oa3lNoc/Dm2QAUIIlzoQWjFuo0y/5a5UztD1j6X4FHJfcuDK5bBN9tPETgoNE9haszRjCOkiWWZD8IGrnaSag/zrvPwaZc4KB6YBeteWi0LpnnOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749610822; c=relaxed/simple;
	bh=YwimPYQo5w5oj3euFTtVkBsrZNt3dvgUqWiiSoaOPQE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KDN8zEUxOJZMcvifrnH0NQfpD+1GVE9ZvOf9xcVh7hvxI/o4i1u1wGt9N9/AIl4tEnu6rJJO08p06CRVbdUoVgxnhDrEFmrPm6K5uBfpdlMxYJBzoGaj8gQmuwuQjxsWy1yGT5qxl5C89YvFH68opwHOKS4O4sbD+97jX3gkCNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F35BS/br; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPoWE016708
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 03:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jk7S7lY42gg5pO/gSWtDrK8morqTLehUEY7
	fLQbfzbI=; b=F35BS/brsrmClxp4+G2rBV3XqdWLPv9bmzybXsfnjPCjzKsQdCW
	vRtFYLwgfgr/Crp69Tb2CBe7reir/Dej5V8PAZJv35QPs/HpYAGpp+rDe419aeYB
	COrZYxzNgCVcRgqQ8aIKWgJswlWUj5WL36KsitdhC2C40I1D0usaeg99zug1lX5e
	fstLBfHV3b9irojfEmvA+1ne3q/VjSu0gs3qJZs0DEHX2dVrjgyChbAhRb4ml7by
	1CUl4Rgm80Jj+XpWulkSKpZZO6mdEg/o0F+InzMzshusKCKoJwNMTawUYWBSPtbp
	ictmBzc/ciq5lh+NfRaibjAU8mg8rWcTr9g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmnb40h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 03:00:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2354ba59eb6so96807485ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 20:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749610819; x=1750215619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jk7S7lY42gg5pO/gSWtDrK8morqTLehUEY7fLQbfzbI=;
        b=wVySrcTOMg9M0JnzA5vymE25Rq13p0ZyljTm3HgIDFAYBIZYr6ED0jtlsUAFLMsWV/
         l+y2jNAHQN3a3XOpEzziqBXr4858A2rtfbGQaWIi60DTA/DHJNdtICNYf8EjZmxUdv2u
         eZKhVgHIDA1xY7l1uHkyFDpDwV7SekM7KQnbGcyasZCKohn6kT5rVt7zZSFZvl0mdO9v
         tS7pFWY5tk1St1GTpCTMBktfAgyiyuVt6Yxnbpdr/yu3GR07Duh+JC5smWKqrN1tOROx
         uUsx8zWQTUPWhO0mdFIRk92qW40voWS/+24JnUWDzh0bQH2CNWh/EYh4jquL4r+PjCIE
         ybGg==
X-Forwarded-Encrypted: i=1; AJvYcCVz/oBng7uHJ9SuPrZ3YuAbRXmG+XYsm7B9xJY1jYFylO5sqpD7o4CWm229SgTIH1i4KKJWeTLqE7JUcuKr@vger.kernel.org
X-Gm-Message-State: AOJu0YwK3UlZuN1QjbVSHeKFrj/q9TRlWNza5hcAJjWzch3yPmFmyYJH
	CqEGYAXXgPZo4WB4CJiWAapkNO7bUE2e/3dTTXzWq9V8vi4huXcvLXmMCWRn+kQ4dYtrGDOZaCl
	OiOsX1T+9UfhejjLcI+Q2+iXhQBOPMWsGHe7LXk4vNREoHcv+3UIGgOeLFnljh3CHcWilLhjbAf
	8OBZc=
X-Gm-Gg: ASbGnctJQhA+BskNBuEExEDkQozJoLYPVSoAAABMo0l4il/uzIedsxWgkO87pYoVgWR
	G6P3Sj23Dvbdi7eeiyqpwbgItC9s5Jc+gXUL6v/5FtQiq0rZdcqUbup788A7NT0dXLJMDmwF8hc
	YW9vCDEFQy28CNkDHP/inTlvb6yTywBdpkR6VmLcKJ4EiFZ9d8dKvZXfh80xdiD19M7wCDZQo82
	mPp79JkCp6mkxYMACCB8GhrOaJZkSVn6DXDmJu2BhKmuIOKSlTsbRPjpVyOJkVyjtHRmUZQnp2w
	+AupIH8fb4BYyglGeuKKZCZARB8qqAXMoJQUwQSut+qYsjEYnBDEIgC+jTbJLMr24fFVylda2su
	+hCM=
X-Received: by 2002:a17:903:3b8e:b0:235:f4f7:a654 with SMTP id d9443c01a7336-2364262d8c2mr17519885ad.22.1749610819290;
        Tue, 10 Jun 2025 20:00:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEm97iwcYG4U9+2Ei9ZjiYgSzh6GmTA1c+FFmow1NqLf2qf8IaBoa6JWs0uyzi5uM0TYpYH/g==
X-Received: by 2002:a17:902:ce0f:b0:234:f182:a754 with SMTP id d9443c01a7336-236426d657amr14845775ad.47.1749610807973;
        Tue, 10 Jun 2025 20:00:07 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603511b2bsm77273225ad.243.2025.06.10.20.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 20:00:07 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: qcs615: disable the CTI device of the camera block
Date: Wed, 11 Jun 2025 11:00:03 +0800
Message-Id: <20250611030003.3801-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5BxfPtCPWseUuZ5q1hdjhfLiCW8YZZru
X-Proofpoint-GUID: 5BxfPtCPWseUuZ5q1hdjhfLiCW8YZZru
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDAyNSBTYWx0ZWRfX3XAA/+yYhikm
 b3mc4ZPa52km0/wim7GbQjcRxLh6zr0KykLMlVM7lBGThcED+M7iD7bF0xj8rUxsj8wBkzA3SZx
 bR+114/xdk1QwqLuOj0dZT22rRH0C3W6cd/Veb3T3ce99HlzyonT+uV6NcVT3POR/ZmnJMgxWhf
 mn6q6iEjhgeO2skitrKOTNH2zWRKUom9eBAp4ewUo5c2cDPNN6dxLsiLUuAl5Tp1APvUsATE8JJ
 PbPT+/2ozD5mY0t85mOifl9jh/T63Q7AlUPZKqWsXpnBkmzsZXVaoBNXxSoVcxd3sMQTRvj386q
 CA/TSE5bJnWFVDFLHtS6PxAap2jcEzQm2C6Z1HgYKz7W1og/goAzEnBOayAqwZeYS2us8bRU1p3
 8m3t0hwnAQkromZTrh8QU9wVndtVnppyJNMh9sWgQOlG5mQd8HLicqmNyemgnXDy1tYCosXf
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=6848f144 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=95F7GRXi1wRhAKWngM4A:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_01,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0 mlxlogscore=648 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110025

Disable the CTI device of the camera block to prevent potential NoC errors
during AMBA bus device matching.

The clocks for the Qualcomm Debug Subsystem (QDSS) are managed by aoss_qmp
through a mailbox. However, the camera block resides outside the AP domain,
meaning its QDSS clock cannot be controlled via aoss_qmp.

Fixes: bf469630552a ("arm64: dts: qcom: qcs615: Add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index bb8b6c3ebd03..fc2ab750f2cd 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -2461,6 +2461,9 @@ cti@6c13000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+
+			/* Not all required clocks can be enabled from the OS */
+			status = "fail";
 		};
 
 		cti@6c20000 {
-- 
2.34.1


