Return-Path: <linux-arm-msm+bounces-69155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6B0B25FBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 10:55:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DFC59E72A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 08:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928DA2F3C08;
	Thu, 14 Aug 2025 08:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jyh4dR6Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61D027FD5A
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755161588; cv=none; b=UDuYWBS1eg4Ly+p6MOdS4Q2J+ce3BBFTmS5HyEHui85XYy3Liqt29PZLhbQUAWI04HXlNSTkeLPVZOXkVgfWQUcQ3sJZkM0bgPkPFLnmlPIrE6rG8XA5/JJwbkPaigV1Egj77NVDlcm+zXXRKz7Kbb7NOmvH5NtT8Q0Wp1h4BQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755161588; c=relaxed/simple;
	bh=2nrV1RGrteIGILA35JGVcooDPCw0i8l4s+Fs181xoas=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wk276wF5CHDIxGSkBVGBXmx0VCqcWmTtVu113cCTMZxLN6Wx4dkk+O6Rtc03HsMjc+RLzzvzkdPYkFkyR9fMrnL4OkigVSBnOAdxCSf6TPplNYpzx61OEhuuEe44K09JUTHTLOXuedEUz9VKksJ8MnchpSsvVKMaOzKYZDMnFbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jyh4dR6Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DN2rhH031245
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 08:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=802pdFifR+0
	7OV/Ivdq0qgpF3I8tJB99ZMyu6lvL/YU=; b=jyh4dR6Y5GqRn9yuJLvkmi6qTRV
	W1SlCzCiWosgv77Dv6xxSxN2XXcwLBJccGOtJeFIx6ysXRCPtr7fvDrbaSw83d6Z
	twIYFk7pDFIA91QYFQtLMlNbSoUqh2vNpr3I6bAT+UA33MRhN4zHwOhIn2O0eEaR
	3CjcdJYkjtXoG8Uhl/bl0GFEyyMZKsBTfuAlS14VfX3V1OKshB9LeVhbaQrjfyO3
	u3Vs0EZbcFLnWgf9c3jZseeuy2EgX+9RolWGPOcRsvqNYky+0TzfmXhPmL3nEbfr
	PB7kda6Fx4iP/K0fM56yI+csS6tCxN2hhDm7yNNQ7Z5t++0AEbWP9mPzPyA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vswxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 08:53:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a92827a70so17143826d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 01:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755161585; x=1755766385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=802pdFifR+07OV/Ivdq0qgpF3I8tJB99ZMyu6lvL/YU=;
        b=YF6NWII4npHZgUy3tWvizS41UqRA441zUebbRK2J7TXWB+vXaGuiJoXxMFAEQbpx72
         mBRP644aXrvNE6n2Wtff+U0vbvKD/WfA2ldbhGB1pToXsRPyXynbyt7jbWvXth8wte6I
         D6EkAiUSLdRisNzMI34wJTCHr9nA1kmwVpGo6htp4+LNFVLIDjTNRvTi8vF5vvYIqKZn
         gBOsa2frPmGxQ40N2sLvsXmh7FAYAx1MZAmaal9cVPUFzxLNRdCABvmglax4oMJXl7Yk
         mhCIX1qZbcOkaL8cIFImcklwpGGjWiyeXWmD7wTfWj+NctoYaGJvjOrgiEaW2hRRB/Gl
         Gtsg==
X-Forwarded-Encrypted: i=1; AJvYcCWFGa9sPbBwK0FDmQw2f2IhJ5Hwr1xsTLVu96K6YQGAHF2dveGZS0MucvLQUCAVNCJxWKWv2DtnZHJqN7vn@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyk1aardUPcG5L42qHDAYQ6Oky2mp7u2TZ90hIhmItG+c1AKqF
	uvGhcJWSy7v5Tjf7CByWGoASQ+JyWwBUJgxELeFXc8+aHHpuB/CzHkNioXHgFGtDvVhUPiq3fKE
	z8mpB/FpKMkh9iuwYEw1+DBgfPkzbzKokg7qZHmeASbKKE3Ld34ClHzTAXLC9AMSk3/En
X-Gm-Gg: ASbGnctfKF9sriK0jfwNwjj1gQ/1AqOQ7SpdKDdMFORaZenFdiihy4i6vTkOf9QYyzY
	LoTQ0bvJDc/hFWXzYUyz25oXB62eIom6SaL4UWbGYm2dvrvE6aTfRDXlbNs7uhIsac4DIL18wFX
	+I7ImWwUU69QzKacKmzpAmOKdm/iSebqZ/pbWySuPzhf6XCozKjFBsHTyFCdU5c6GmhUygwK7EI
	bY8ywgRisKgzOCut6ygcS1NMzccIYgth6OVf4jchw13ok/atkQ8+VSskkCHWzIiOaKw71Evh8Q7
	9FNudBiLUYq+D+oFFdvenAnNdZi7AL1RQhTTfcImVYGzmvcsJVkpZf/bWkj9+1FF8KpfxFKXe7D
	cqLN5wPPULjqo
X-Received: by 2002:a05:622a:81c2:b0:4b0:e934:85e5 with SMTP id d75a77b69052e-4b10a958260mr23386681cf.5.1755161585092;
        Thu, 14 Aug 2025 01:53:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDfgB8pIcLGblDgdcBbn8sEeOUMF0U28QhhTWEOvZWpvnlv7kxX3cNXjAhMSWaa/z5Xj1oDQ==
X-Received: by 2002:a05:622a:81c2:b0:4b0:e934:85e5 with SMTP id d75a77b69052e-4b10a958260mr23386401cf.5.1755161584620;
        Thu, 14 Aug 2025 01:53:04 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bc93fsm13155895e9.2.2025.08.14.01.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 01:53:04 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 8/8] arm64: dts: qcom: qrb2210-rb1: Enable Venus
Date: Thu, 14 Aug 2025 10:52:48 +0200
Message-Id: <20250814085248.2371130-9-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814085248.2371130-1-jorge.ramirez@oss.qualcomm.com>
References: <20250814085248.2371130-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX8jirPgVQaVUQ
 Fi63gmyuRykDxbfe7nuV3tcDJ0syWCTgc3Igld11F8gZUivXV7o4NP6SSPxOUboOcc5CfrDUnKv
 NB9eF0b68lubeF90/tfffHORNq85KRStvbEYO1xoUXlIbNJ0IXGzLO1meqy6GssMihAJI8U/Il7
 5i/W6ZBmUiO5FnyyyvA+fTotkuXTfi6jjiHcKuxDk+ISwxwPeA+uHWpp/voMWNsVUnGA7XRp9eQ
 wEDMZK8mYaOFNbIP4+B306c2PLyEJh220VUKLDR0WV+gorfHWQBWITTYS4lHKOa9jB+CwDKH+1r
 Cd2Iqouq6/NN9rq6mhjdsfL8uKd/p5hSkEWqIi1LVO7PtJ7RBifw7rvb9YnWOFPKh0RZbekyySc
 JBQK2Ynr
X-Proofpoint-GUID: 3qLMg6u0w8PSf6PkVD0hcc20K8SQ__RV
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689da3f1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=Qms5JgQ9tnEuTiNUcoUA:9 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3qLMg6u0w8PSf6PkVD0hcc20K8SQ__RV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107

Enable Venus on the QRB2210 RB1 development board.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index b2e0fc5501c1..e92d0d6ad1b8 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -698,6 +698,10 @@ &usb_qmpphy_out {
 	remote-endpoint = <&pm4125_ss_in>;
 };
 
+&venus {
+	status = "okay";
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
 	vdd-1.8-xo-supply = <&pm4125_l13>;
-- 
2.34.1


