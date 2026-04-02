Return-Path: <linux-arm-msm+bounces-101433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEAKAe0JzmkwkgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 08:17:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C393845B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 08:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6B7CB304AEC3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 06:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F04537DE85;
	Thu,  2 Apr 2026 06:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8dFjbm2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGTgsw9T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F9B37CD50
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 06:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775110591; cv=none; b=QZmR8JzbNO1p61aq4MqovZ+1Tv7bAPvtzDTyGupQwl4pCnfEHpnQzo+PJubZsSOAdHkGqFCg0whUJY85xtzgXr2rVNgVaBAPZJVVQX2G/+Jfk62WelIRIaVLfNM15fUTKovZUl35J7vw1ScY3KrE1nviQ2jD19g6o2oAdr3Ax+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775110591; c=relaxed/simple;
	bh=SnlnvFvNXltJOABCkMLBX/l5jnrfqsE/n4a8CvOEVH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HbzNECYQvn3B8CABv2d5S9O2C+YpB6AONuxkDwMUdgHAjH/bsNe9i8VnHo/E9ME/UZ0vNWhYYaGvs32f+aVAH6bPbJ2jmwOKdK4xZsoCqGPwf8zz2VwmEwnDXxm93DH5hHZKYmOoEkioUeN1pw276MFLKv5nHDhl/ksMg4/zuM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o8dFjbm2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGTgsw9T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M46wI1964809
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 06:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ptCIlP6pgcTOp7E0wbs0Bq+bVgH3nVEeZjcudJT4oFo=; b=o8dFjbm2k03WDcfI
	3QUkAjG9FXexlABQa+DeBY7YUlysHbpjm8zWxBVNRiyu1mQIMUEQvXZlSkS4nolB
	OwKoHdRuas7uXfKKtpff/uFkkFubvWLg00Xb0QIqmQz60BqExVOYHNY3UNIQdikr
	DrnSi1mmBOkGcQ1oKsJou41BLWtaoUCyBGAlVu1XeUPRoL6OYw/P0/GTGp9qaW+I
	FEVQEkJY9shSCNeYEESS8CrTWalvLsDwRk1OHNFJThKcI1iz7OjYL6KPEy5d/+u5
	DuVyn07nI4xmM8mOFYQNmWFE7txHsdOYrz8Dkzd4+uSOSNmRL8CkLNeuuhiSj7TP
	6POLTA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9b9h1gkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 06:16:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0cf396c45so5865105ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 23:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775110589; x=1775715389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptCIlP6pgcTOp7E0wbs0Bq+bVgH3nVEeZjcudJT4oFo=;
        b=CGTgsw9T094C/8PVe4PZvNyC5V+FeYWdkt/PCwCRbW6YVwuviksANrkwp/ist4oFAJ
         5unRBRoxuSYVjYaryYG+u5lrVWVxM+74OPenMOsLc8I8mqMZes4omv94Bl3PTPxq660R
         BdhBQeH5mmh2W32aCmU3J5DLn+KRGOmQ9dshkZ3Ce43g3y8lX1MGyn9k+K/aOLhJ8II0
         PQ44ueyHGmHrq80tjBDc2+0DRuRzgT6xZQneYrmCkQ2PoK1SJXmAn+MYA1/vHCiBnPyw
         /rGfqF8nvcHqxeWvfR2RBJiDTLW/fmoYhn0xPxVvHZESzuDw7PQgTVTNbSTXcBH10l9V
         ADGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775110589; x=1775715389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ptCIlP6pgcTOp7E0wbs0Bq+bVgH3nVEeZjcudJT4oFo=;
        b=PsDij70/D5zMlWNTaV8fTRYq/6L5JdiAClMBqpT8RFsdTyV/uHnRhw4w0wDVh2BR8k
         qSyiyM1zfsYcCle2ifaV5JIovOmnUzjbYoff+nHKYL9SVNgmtTj4fjAegCnKL08QI0n5
         VrfH8bIIG9g3fKeEuHiw76flvwLFrcj5AnsPFx6xBuWqePHdSEl2AuCuvRfRXO2eqkm2
         XYIN9RKS2WmS8J8vAVmTm318ZmF6ReBKqMe5mSISNGxe3SCaG+9iGsv2S9SvTyEQI3k9
         tBP12pJFdaVR6s/lpL0jZBk0/JycJ5nEChCvaH1ebhaUUkokQBT3AxyhUWQjSGD5A4z4
         Hodg==
X-Forwarded-Encrypted: i=1; AJvYcCUpOFC6RXJ8M5mfeNP3d07R5MjV6spudy4f4thvPuQ6q4fukMrm0klqw7d6NJtnL8D/ZcWWOR7ILXRUueZH@vger.kernel.org
X-Gm-Message-State: AOJu0YzpAo6q7SeaIvhKmE9As+DlEJ8XQoQWH7eV0bJJWQhdj4282k4p
	VIo2B5Gm0ENvn3bIOyNOCqElPKiFrIJE9zbn7ci3l3g9ukeSH860A39QBTNvDLx0M5iO6Pa6xgE
	6uYaQOjPHagcGT9AmgBiKCD8oGHtXe6PufY4Jx5gID6zEDGWAsMDzN1ISGcOaoT+0jjkk
X-Gm-Gg: AeBDiesqf2ZR6jLgmKA2pJ6bMN8RH9B3dFavtsEp4QDeHZMg3QSq4e55Xbm2dU2v+Ml
	uu/US4LM0VtSDvtCnN/PC1VGJFjPUcKpJqqsiBzSCTO3LWqWvZ8e8S+2pTFXHNw6cA3LFUT99UB
	iA28gbpl8NWz2j7UtD6OWhkt0hCJuwkL1w0O0A7sHofuN0lOr2zR9NTrbsI2tXpTat+bIDUQM0X
	wXChgq6W9J8VqWGLa81shsqDNCUe3OEMaTRbltZaU+OuUID8GVab/M7Q5RnNJo2jt1od78u0D7c
	uNhP7QjifCOOS1KPy2MOv1bFmkWEsON0aaT6Y0qECOEx8aB74u9Fq7rjTbcxAQ6SwOK8/F8qgfO
	jlw+KS0+jfdP372q5gUXucz4HzOvAYCU3Rmjk3tTp01n29iMY6Q86
X-Received: by 2002:a17:903:2391:b0:2b2:5857:6011 with SMTP id d9443c01a7336-2b269b066cfmr69582765ad.19.1775110588714;
        Wed, 01 Apr 2026 23:16:28 -0700 (PDT)
X-Received: by 2002:a17:903:2391:b0:2b2:5857:6011 with SMTP id d9443c01a7336-2b269b066cfmr69582575ad.19.1775110588259;
        Wed, 01 Apr 2026 23:16:28 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbc58sm16538615ad.78.2026.04.01.23.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 23:16:27 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 11:45:45 +0530
Subject: [PATCH 3/4] arm64: dts: qcom: glymur: Add camera clock controller
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-glymur_camcc-v1-3-e8da05a21da7@oss.qualcomm.com>
References: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
In-Reply-To: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=TqLrRTXh c=1 sm=1 tr=0 ts=69ce09bd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3iLwGWznUEgL9WBE7MAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: V19_-jiV5eJD9O2mzPC3rmn2U86cie6g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA1MyBTYWx0ZWRfXxwWgAN0YFOt6
 3sXFV9EXRW4gE7unpNJUeQRlET8ReAD/1I6pZs6URoPVt/Ybr+q6s+ahTN5JEjde+knUeuAlTnu
 nHqarzaks7majbSqjhWXRjJz3a03Yy8yQU9kEnYYoAxN7JTbVFE3k8+r1nB++IZQsAifmKw9C2X
 gL0Irf2Ca0dObMfVOg8Pq9wydlHiZSNYU2Hlzol505FhAl/6w+3T7gLBZoc4prGV4CscuGmxp+H
 WalTeemBz8TKuUminYmDl4CkFYODEf0KE4Nq/u+5eTR1grSBvSetornc8NLBt5RhzbhMtdT+j6A
 J8aVIvHvZeSz0F1GwM6zt0QfVbN5lw7hQm9qEF0cXxko/yVT3qjds3FdKNdg7zPDo9KAuWoQhot
 FiiUuyzkewpYMYcVyvZZ22OSpH4bJNjzhKT1kBRaTDwZ5WSOB49JYgdZsdBP0XrEPdUz9DW119v
 wTTTW0cNtNA9Lmururg==
X-Proofpoint-GUID: V19_-jiV5eJD9O2mzPC3rmn2U86cie6g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020053
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101433-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ade0000:email,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,a400000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47C393845B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for camera clock controller for camera clients to
be able to request for camera clocks on Glymur SoC's.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77a4138deeb4e00dd8b316930a2feb..c32f0b84db2f38ec567485e36e8e50529e886775 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4163,6 +4163,22 @@ usb_mp: usb@a400000 {
 			status = "disabled";
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,glymur-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,glymur-mdss";
 			reg = <0x0 0x0ae00000 0x0 0x1000>;

-- 
2.34.1


