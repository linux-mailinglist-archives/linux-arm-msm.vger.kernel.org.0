Return-Path: <linux-arm-msm+bounces-78560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3B7C00BC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D45719C8289
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7931C30F530;
	Thu, 23 Oct 2025 11:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhq5tgn0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A1B30E83A
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219003; cv=none; b=G1wmwvQri5So9CBxpn4XSFUIp8FpxUA1xc+/EqmPnL5bu+j1R0acnkCPS6h+MCm9X28Er3I+UDCZ8/P6LvTYtct5wkoLKF7pNtvghjLOgBE3C4A+ciwQ0nIllLW2g/uigLX+nMf37LYUsQE1aY1kkiKcITkx80uSx0bHe5Q0f8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219003; c=relaxed/simple;
	bh=hd0CoMo58CAUzr+VqJ+RAeH8nis97OD0oQjfGlLV2Lk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AQEInK9TE+NtC8+QQPcEyGI6qu1Knxfw31O7AQZyrv535brHflJMCyLoHrAL4fTu3w1JhVSghP8Ra+fFwdMql+Xssmz/2+3zd2pVsh1cX+4falrGSqpx7mgnf7vAJisOGgig9KJXgJAK/1FCYY7OzS1stECcaHx1bMJj3YTnBbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhq5tgn0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7CKcb006702
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fR2JDFO0Mtu
	aMMk5vsO3PZEznusuCLxw5SSeKXZkFr0=; b=hhq5tgn0qZnnv4cXLZHGCmYzHg+
	+b+OgLayWgJSb7LgMITUGIWgHmV8MvxU3+pBC/FzFolZxvX34HQtK3mknRYPLAAY
	oYDQOfT7GjzZutZyv09Waap5meyrt67wc/qobDkoLT65fgmhfyJlDmo3tNp2HJ2Y
	QCDxCWiGcwo/UmG1ggmzhDMdRw1HUpxWVZlUR1d+KLzc3rS+u/SS/QUzMdy4K1/D
	eWdcT5dlc04lRyVly7dn1M97mLqP9bnhwdSMVO9M5aiINQ9dOKebT5fzZ6ySBLxu
	TTtV9QeiLgxMsQqfLpcyZL1S2u0ID2PNrtEVnSthWo1vSN5eooNI6q/aFcA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j84gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:30:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290950e7b1bso1513775ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761218999; x=1761823799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fR2JDFO0MtuaMMk5vsO3PZEznusuCLxw5SSeKXZkFr0=;
        b=xHjE+X0x/RpOclCzwuinlLaS7G0ErXpmhbLOcKMioyX8fjDZtpW0PSNrKfjg4q8tkx
         JyvhH5ovrNvlX8DjtqAr7Ynqsa1mfxnKy3Ixm7GZaKQL8u16Yb0+uLwdfGDw4VtHbAfk
         I/pbYcCnE+AXVjaqc0xTsUq9UsEV+1O8rMnFa0n85U9vYKlHCtVHA2Cu3mFrg95a+HdL
         oiPhQgWssjj5xeP/4JzfvMOF9esmJFvsSmKh5eofYRORe1cqqxxsNU/rdeAm1VSSSLRy
         aOcQCXbs6zcIV7h4L/JugScdEyFu8DngONzhFZexZ1qBO7VmuvUHeI1x2ljSWZhK0WzP
         7s8w==
X-Forwarded-Encrypted: i=1; AJvYcCU+fPWqnJN1QyKh+hk0WS1Ojot1E04V7WymkTe2COkWpt/HhumUN+jyJJB279zDv+dmtTEOVXPjIDsSwI3H@vger.kernel.org
X-Gm-Message-State: AOJu0YyQkRNYaVBdE9L5ERZukCUr3dnfS1sKKVFciC8OGYykgOEbLQmq
	4UWBTpprG0uM6A68ddhG5O94uwfCK7FHi4Tseo35hdO1uzY+Xs0VAN0bbnrncZYbiaIG4aB8eiu
	EEgG2EnxqqiKjNxzm27UoReDlyCvlto8RUwFPY9ubPvyFLN/wu5mtKI4WfNEop10cpgY=
X-Gm-Gg: ASbGncvhqBYseZtDavdBt+itAsDo1iajlprhudyKpC3UzZyzD5c3MS3z19ttlujfzma
	6ZhweD8xdMPEvEPZFVM8ikjvIe54bUMFqZy/92LZZvUqsn6rco4jHxrU9JRFm6yuOozr6zjMo+u
	Lx01gMpeF6xTpwkhEIY0znCkyXg45Dyo2DmKxSCb5qKM9ZVnCIiXeOflCd0XSoPmKCl9jps4ged
	Mv6/HxnamRzZeKKdR0aMalJOh6BY3MVVxye40OZ5HrbiDz1UwArL4TypwFIcs2EQCK44iA3L9Yt
	viToJvtklaS1TEFtk49+QzfyTos7OP/HC77SdzRA7FJ1TYGAeRR2cyeZG+aZA3+Jz8i8kG1SmB0
	bx0o6FtGfhkxcOvgK5ql3eJ+ZGBkelQ==
X-Received: by 2002:a17:903:1746:b0:25c:9c28:b425 with SMTP id d9443c01a7336-292d3fe2f79mr65295155ad.11.1761218999183;
        Thu, 23 Oct 2025 04:29:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuXQI9VRXhnQMSIZ4xgGvAhDSywgxIFMeOu/zYuaXfGqNrmw1i1qi4dhUipSl7+nHiLMY6pw==
X-Received: by 2002:a17:903:1746:b0:25c:9c28:b425 with SMTP id d9443c01a7336-292d3fe2f79mr65294885ad.11.1761218998716;
        Thu, 23 Oct 2025 04:29:58 -0700 (PDT)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e1231b0sm20438815ad.97.2025.10.23.04.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:29:57 -0700 (PDT)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Subject: [PATCH V2 3/4] arm64: dts: qcom: sm8750-mtp: Add SDC2 node for sm8750 mtp board
Date: Thu, 23 Oct 2025 16:59:23 +0530
Message-Id: <20251023112924.1073811-4-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023112924.1073811-1-sarthak.garg@oss.qualcomm.com>
References: <20251023112924.1073811-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX0K1PbfU0pSBd
 1rCm4KvHO0G3PAUXnfdwSMSGtFUUKXp5XQIaIhgrn/YB8g4XjE+qf1dDAuS4TJgnlSZ093WO7c2
 I5U/Bp/QlN5Zo60O72boVnQ9a/VdpzDfWEg21qgexQJ9phwmPRKb+lCw9JGFWXlZX9YK51jcaJE
 NAkEutsU0i9mQPmp8KIdXNNRyjWBshu49QAxLZbQipKvIfKmpid3OUaiYAZv8q5plP+AuXPe3zc
 FVrte5DMRnPSgkVITWuBYxEZYJ10SM5hDtdF1GcWknXgjvyFC8qY/0KajlYct6s0q2F0zgHD7JY
 jprXgHRkaC1ymVzWwIW3nyynEeWLEl51SP9wxVof0uaFcgRCNo8d8VQhYryK4WiT+e5F4Uo+k8i
 Q/AJRpcD5AD9PloTtL0TLi5IU5s/Gw==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fa11b8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=QH13294MLfywbrI7NfsA:9 a=zgiPjhLxNE0A:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: S-8G4ds_9SUEorLWAJDDiZdx-AW-4fft
X-Proofpoint-ORIG-GUID: S-8G4ds_9SUEorLWAJDDiZdx-AW-4fft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

Enable SD Card host controller for sm8750 mtp board.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 3bbb53b7c71f..a8727d353b46 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1030,6 +1030,22 @@ &remoteproc_mpss {
 	status = "fail";
 };
 
+&sdhc_2 {
+	cd-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l8b_1p8>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default>;
+	pinctrl-1 = <&sdc2_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
 &swr0 {
 	status = "okay";
 
-- 
2.34.1


