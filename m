Return-Path: <linux-arm-msm+bounces-109109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDGALdIZD2qLFgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 16:42:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7B95A77F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 16:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 153FD31627B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3CB3D7A0F;
	Thu, 21 May 2026 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LduzFP48";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G0G+pSzk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD38368D4D
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372362; cv=none; b=Sihs8lm4YfWu3l/gk4KeJ+lwX61A2S1xiHJaTabrCg6n4Nn0s0upmNfolMko4t3FQK9I6/0KMgv6EBo/0Q4ZXC0MtcqrQ4grbQW6/ybGN9Q4X68hwFj9JFLHU1Pjn5hsZtTvbXyBbibLAdt+xMeE1m2Q+BSms1tDRgChyNuUgwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372362; c=relaxed/simple;
	bh=+PUY8C86/AHR1LegGnosiTSO6JwUI6Tj/AlsSyr8c6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nEvd0dBEPS3xt6bxEywF3gOKHHzOOdweYVtGzNvD7n+ooaFrIN/FZBqYWbbHz8A+moakykolVClKAUZzwvA5pDHPoL/UMHwkmAeiDhClD+9pihVIseoMnezDdadpNSta/UwCehAV5yV8x/trKXGnBrwLwHnzYBgSRz1DryvtR+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LduzFP48; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G0G+pSzk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AMD73556032
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Df604L3sWWkLbmZHp6DBBXkNhOeRLmVkLcoyM8ZbvGw=; b=LduzFP48KhPxhhYR
	p3BB5yZrTye7Vy8DUGII8U/n6F6ZI49/IzFy1MlPH3VAnd6SqoGU4Mgx4Rvct+T4
	CbpxewfWEE6DoRHitKS0dGQUqltDy0RgSYBDnhDkB5f9nGWjoIehdNQYJt4bJkMs
	DnoH643XDFF6pyI47aGlE8Ybkl0/Otp09o7+EFMeOhZk2QoQlmecCMlN3ySfImtP
	00KhFFp0jopp5+b0r8Vcm6jIFlKY5B9AUf6nmC4xmPcLUO2UvDedcGXFFsHqugwW
	/m0Qz9/Ek74NGONB8VcdgcNjMG0CsM1BhB3xuAn2zXaJ/xHVkO+AkuSs4hrh3G4a
	jw3Dog==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6mvu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:05:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2babbeff9e4so66757705ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 07:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779372359; x=1779977159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Df604L3sWWkLbmZHp6DBBXkNhOeRLmVkLcoyM8ZbvGw=;
        b=G0G+pSzkpG9MGoj3RFs8HwLRqoMMCcrXn2AXKrSsvgBM22cVJ0h91QrPvcwJA93YEA
         VMW/uKmqPu+W4s3PwV2+MIgnXYwf+FMCoXmOUavWCLAquEU9oqv9ecfCQI/D5SJcndSF
         G7V7p1iqFvCKO7267se+VpVaUs29mTipP8ynG+R+erVFoJwygpr13TWogZE/51lMpdhc
         /upzpArcIfdNoy67E1d4mOO2xDzjVaolnd9JZNY4yU+dpLNVrBpKY33Gir43WiSMmnW1
         6AyJ40BcS3PT9/OLHxOeQdPP/h/QwRGeOLOLbqDRTx9UxhVTXZMmY1QIqBaWIiW/iQXq
         +3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372359; x=1779977159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Df604L3sWWkLbmZHp6DBBXkNhOeRLmVkLcoyM8ZbvGw=;
        b=d3toEPkKI+Fwf2jQQb64H+uQnulfyFJclkDKHSSMkK50Qyi9lyJjlXWO0HraKfWEhx
         57RgTGepxM6IKYeAlbIsfi/BW4u1EV068fN7kd0WxGlxePFcfgXbowRbcO3TXIhjfy5z
         ZSVkfrCFBh+41L3chGS4abGeGGOH602CvR6+doM7h20u+DgmlwtfJY5hJzNGg0csiNV+
         7Zj8XsMypIyhOQc/ye4OtMG4gSNXHzjMJMtH18BiX4cn9yKctEjq7mU2Zpk0VthnYJRi
         0wirG5EoH4m0VnieGILzmtlFuor6KOl5tVTwNNyGKIX7yh6mNhN19E/164fh53rRpt9P
         nbqg==
X-Gm-Message-State: AOJu0YzPKYOfGVXQVg8QjIXmrcDiPHCYuVzTajSc33XGdstG3cer53YQ
	2+72bw5f4AGwrkMyVOW1Wn8kbW1v4YQLFUaDBnTTzrq5BKE/dNPRXr354fkwdb/IGzeXI5QmaZq
	dzG/+NmCvysmvv64am8uPTKThgy/itXPMgkYkTKE4A73fhuxQF0lNslC4B92kItWo73MI
X-Gm-Gg: Acq92OG1nU8B/lz7Fja016JqaDsve2EKIUzxHT6CGmGS4fBn+m/aot97dKgFujiDwUA
	SokEtxfkAHc2zZjUpY9z+k04ptB7CYqR64JWXrCzxfVBbiSCt2ZCUXisyUtaHmbZc5SPVvFlI+w
	OMen7pKZ19/TulT5CWgPRuA4xraGXSCAjmeLtzaXuDW0C3s1WcoEqZ+7xOsF+4NOfP3JEB+91un
	7xCVKZfV79/1sNz6upHQ2Nt5f+IPxdo7KlACS0Alsl2vmnogzll0Lt3kwh7h4lgZAyZYyzuxwTZ
	ko27i4HqA6lo56UD9VBveKdN9d1oVZ7pOqxqTpz5K21PoWVhcpnoSPJySGRBWH7HDl0AEw+jHFt
	cARKPhPg76fTUNRj1mWk6LkD3HAw/eAnbIzAxYxN/5sFW5tc+mlWgYhRG
X-Received: by 2002:a17:902:da90:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2bea229c2eamr34881745ad.14.1779372358853;
        Thu, 21 May 2026 07:05:58 -0700 (PDT)
X-Received: by 2002:a17:902:da90:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2bea229c2eamr34881125ad.14.1779372358334;
        Thu, 21 May 2026 07:05:58 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea9287997sm13189765ad.24.2026.05.21.07.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:05:57 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 19:35:32 +0530
Subject: [PATCH 4/4] phy: qcom: qmp-pcie: Add QMP PCIe PHY support for
 Eliza
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-eliza-v1-4-97cdbe88389d@oss.qualcomm.com>
References: <20260521-eliza-v1-0-97cdbe88389d@oss.qualcomm.com>
In-Reply-To: <20260521-eliza-v1-0-97cdbe88389d@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779372332; l=9259;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=+PUY8C86/AHR1LegGnosiTSO6JwUI6Tj/AlsSyr8c6Y=;
 b=aPZW//YhYcCrr1QKlAyQ94od/pi2MNnLNMd56R5pNCVvien8dtSTHtTh4lmeJfVTbJj8M5VKX
 5Qz+70rrA57BBw0JzCRnvfYK+j2ob9siPbuUpAG1AeW6SvtDT2OIcWz
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0f1147 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=BvlutTLlwcMiLWs3sTYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 6I9HZf9Xduo7uOorA9HqQBSEvrwB59q_
X-Proofpoint-GUID: 6I9HZf9Xduo7uOorA9HqQBSEvrwB59q_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE0MSBTYWx0ZWRfX659jDsE9t1ie
 GwZ07J7F5AQQCCc12AfOg1Ed2SmsjtOMPltqEcqPJO7uxMJ4p981fYrez+52aCPz5Hbqj6KPO/m
 maRPXYm0FJ6mhoK5r192kdzojsR5SN1E4Vg506dwqF7sB08ORXFI5Nb0riwXNikZmiENsPy5ctM
 JA0BZ7o1jB4urSnbLy1TMtqb2P5sQEM1JfdtU6nkMGVMNbj+6DFZObOtF/BHUTuzAalzyOL9MYF
 33FXYQni/g8Eg157tHjgg5czEhw+Tsf7paDNnGVtHqNSQhfdiVXd2paonJFQkcJNzYCY7eLa7Mp
 sBQZuGcULopwYUG7PxwjhiN2fx2rRLhoNei8e43ViMjvrAd6hdyyPYQnV4bghfKG9Mj6TW/AyDA
 5WdQfUQS5bLXJLvf+1UozQitH2LJUUwqiK3gr+2wjTuBYyrR3Y+yf3eefW2W7i+CwgHun9ZsXhI
 q7CTw0M/1OyJHacnGOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210141
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109109-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5E7B95A77F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add QMP PCIe PHY support for the Eliza SoC. Introduce a new Gen3x1 PHY
configuration with Eliza-specific initialization tables, and reuse the
existing sm8550 Gen3x2 configuration for the Gen3x2 PHY instance.

Also add the missing QPHY_PCIE_V6_PCS_PCIE_INT_AUX_CLK_CONFIG1 register
definition to the PCIe V6 PCS header.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c        | 139 ++++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h |   1 +
 2 files changed, 140 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index fed2fc9bb311..113c5f8f1dbc 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -198,6 +198,112 @@ static const struct qmp_phy_init_tbl msm8998_pcie_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_SIGDET_CNTRL, 0x03),
 };
 
+static const struct qmp_phy_init_tbl eliza_qmp_gen3x1_pcie_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE1, 0x93),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORECLK_DIV_MODE1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE1, 0x55),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE1, 0xB4),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE0, 0xf8),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x0d),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x41),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE0, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0xaa),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE0, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER1, 0x62),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_PER2, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CLK_ENABLE1, 0x90),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYS_CLK_CTRL, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_IVCO, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CLK_SELECT, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORE_CLK_EN, 0xA0),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_ADDITIONAL_MISC_3, 0x0F),
+};
+
+static const struct qmp_phy_init_tbl eliza_qmp_gen3x1_pcie_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_REFGEN_REQ_CONFIG1, 0x05),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_G3S2_PRE_GAIN, 0x2E),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_RX_SIGDET_LVL, 0x77),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_RATE_SLEW_CNTRL1, 0x0B),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_PCS_TX_RX_CONFIG, 0x0C),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_EQ_CONFIG2, 0x0F),
+};
+
+static const struct qmp_phy_init_tbl eliza_qmp_gen3x1_pcie_misc_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_PCS_PCIE_POWER_STATE_CONFIG2, 0x1D),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xC1),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_PCS_PCIE_INT_AUX_CLK_CONFIG1, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_PCS_PCIE_OSC_DTCT_ACTIONS, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_PCIE_V6_PCS_PCIE_RXEQEVAL_TIME, 0x27),
+};
+
+static const struct qmp_phy_init_tbl eliza_qmp_gen3x1_pcie_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_OFFSET_TX, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RES_CODE_LANE_OFFSET_RX, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_1, 0x15),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_LANE_MODE_4, 0x3F),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V6_TX_PI_QEC_CTRL, 0x02),
+};
+
+static const struct qmp_phy_init_tbl eliza_qmp_gen3x1_pcie_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_FO_GAIN, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SO_GAIN, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7F),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_PI_CONTROLS, 0xF0),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SB2_THRESH1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SB2_THRESH2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_AUX_DATA_TCOARSE_TFINE, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_TX_ADAPT_POST_THRESH, 0xF0),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_VGA_CAL_CNTRL1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_VGA_CAL_CNTRL2, 0x0F),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_GM_CAL, 0x0D),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0E),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4A),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0A),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_IDAC_TSETTLE_LOW, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_SIDGET_ENABLES, 0x0C),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_LOW, 0x3F),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_HIGH, 0xBF),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_HIGH2, 0xBF),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_HIGH3, 0xB7),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_HIGH4, 0xEA),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_LOW, 0xDC),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_HIGH, 0x5C),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_HIGH2, 0x9C),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_HIGH3, 0x1A),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_HIGH4, 0x89),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_10_HIGH, 0x94),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_10_HIGH2, 0x5B),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_10_HIGH3, 0x1A),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_10_HIGH4, 0x89),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_SIGDET_CAL_TRIM, 0x08),
+};
+
 static const struct qmp_phy_init_tbl ipq6018_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_PER1, 0x7d),
 	QMP_PHY_INIT_CFG(QSERDES_PLL_SSC_PER2, 0x01),
@@ -3532,6 +3638,33 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_50 = {
 	.txrxz      = 0xd000,
 };
 
+static const struct qmp_phy_cfg eliza_qmp_gen3x1_pciephy_cfg = {
+	.lanes = 1,
+
+	.offsets		= &qmp_pcie_offsets_v5,
+
+	.tbls = {
+		.serdes			= eliza_qmp_gen3x1_pcie_serdes_tbl,
+		.serdes_num		= ARRAY_SIZE(eliza_qmp_gen3x1_pcie_serdes_tbl),
+		.tx			= eliza_qmp_gen3x1_pcie_tx_tbl,
+		.tx_num			= ARRAY_SIZE(eliza_qmp_gen3x1_pcie_tx_tbl),
+		.rx			= eliza_qmp_gen3x1_pcie_rx_tbl,
+		.rx_num			= ARRAY_SIZE(eliza_qmp_gen3x1_pcie_rx_tbl),
+		.pcs			= eliza_qmp_gen3x1_pcie_pcs_tbl,
+		.pcs_num		= ARRAY_SIZE(eliza_qmp_gen3x1_pcie_pcs_tbl),
+		.pcs_misc		= eliza_qmp_gen3x1_pcie_misc_pcs_tbl,
+		.pcs_misc_num		= ARRAY_SIZE(eliza_qmp_gen3x1_pcie_misc_pcs_tbl),
+	},
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= pciephy_v6_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
+};
+
 static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
 	.lanes			= 1,
 
@@ -5399,6 +5532,12 @@ static int qmp_pcie_probe(struct platform_device *pdev)
 
 static const struct of_device_id qmp_pcie_of_match_table[] = {
 	{
+		.compatible = "qcom,eliza-qmp-gen3x1-pcie-phy",
+		.data = &eliza_qmp_gen3x1_pciephy_cfg,
+	}, {
+		.compatible = "qcom,eliza-qmp-gen3x2-pcie-phy",
+		.data = &sm8550_qmp_gen3x2_pciephy_cfg,
+	}, {
 		.compatible = "qcom,glymur-qmp-gen4x2-pcie-phy",
 		.data = &glymur_qmp_gen4x2_pciephy_cfg,
 	}, {
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h
index 45397cb3c0c6..17a0f9d18acf 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h
@@ -12,6 +12,7 @@
 #define QPHY_PCIE_V6_PCS_PCIE_POWER_STATE_CONFIG2	0x0c
 #define QPHY_PCIE_V6_PCS_PCIE_POWER_STATE_CONFIG4	0x14
 #define QPHY_PCIE_V6_PCS_PCIE_ENDPOINT_REFCLK_DRIVE	0x20
+#define QPHY_PCIE_V6_PCS_PCIE_INT_AUX_CLK_CONFIG1	0x54
 #define QPHY_PCIE_V6_PCS_PCIE_OSC_DTCT_ACTIONS		0x94
 
 #define QPHY_PCIE_V6_PCS_LANE1_INSIG_SW_CTRL2		0x024

-- 
2.34.1


