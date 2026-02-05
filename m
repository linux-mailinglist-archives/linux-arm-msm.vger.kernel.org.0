Return-Path: <linux-arm-msm+bounces-91966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +F4PA1gIhWmj7gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 22:15:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2E8F7825
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 22:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3D663016927
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 21:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB6032FA3F;
	Thu,  5 Feb 2026 21:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cpm6O+cd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gqkKt7Q8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D8832F77B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 21:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770326098; cv=none; b=gb5W3QDrt8TmJQJmdiZKUj1FtAIZlLmRbIthlyYtii418iL4Zp2Yvwj5VnC8utIMTdQx9cJw3og4+mqjdSogsubU7/fqJWSuxp1lqRoVEHe7SHu+dJ7xyyYR2IKa7LV1G0Wlal05BOFAuZlrH5Tla5vFu0kchPbJ1ysOFVnmIXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770326098; c=relaxed/simple;
	bh=R28ctyRfWvYF1AcAyUM3MdJI+xYN+EibX6fe5/NpQSY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z/rDHdzBF6MeFz2jYylqRqe7PMebjaLW+hdforxUOWDRLA7gISq+2unKP2eXket9azp5+IxRYpHz26MM3Rkb1liMrmJSBErfO2ESZSK6bpm8oHlBte1hNcDT0CIX8wE2r65nzcXRrePaSx2S/DOR+astFRxpGvDIBaL6bJ67Pbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cpm6O+cd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gqkKt7Q8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615IEYVO571761
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 21:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zMAmK55w1caUuW1KuyJwzi
	CE6kDjy5Wma1Xxymy+Hw0=; b=Cpm6O+cdn1zqXu2MWl8YKiSCH3iunm/5Ljd17A
	ZLrJ6aFdfEmjabM9E5GX7kodBf0FUHQiy4d9laJwviULV+kKnFJcSAJGCpnUga8m
	Pq+qQluzgu0aIlgN2P8d6KtjSEq5AwPuDaI1jbOaOhSCwn+3Z0e2vSEBA0Yl+jAe
	hOyQ2VnybvmubNg6Ej/zgLlFhMxJU9FokMVdg4fhSXFMNqjSlFRK2wRRMqvVny9s
	lhtMTkWkzkZVNXygJNA8e1EIiu7PaZMRTMIGyzv8Ewb66vbh5nbquaGPga2tOBfx
	LiU8qgauKA+SIGkUEs9i8dhowGcG/HOyg3KIADuSRA3mnZhQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c50a98hrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 21:14:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3547cd89bcfso3266939a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 13:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770326096; x=1770930896; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zMAmK55w1caUuW1KuyJwziCE6kDjy5Wma1Xxymy+Hw0=;
        b=gqkKt7Q8jWk9keHG7HOa2jdfXPMyZV2pr9gOdJsiT23qW5/DsPLLXObF4ViYXkOmDa
         WLdIHUT/PfPlRCWpfxOQUmEHO17skQk/PdeXtdXRfA9js15mCkcJM/zrsMnM7QPuMiDZ
         pces/tGSRoJAQak6AHQRiOR5jC5tqBpNtXZO+dJPAraUI+Do2BjXJ3AByWdEDzhCtEaB
         DefcVSrSkI1Jh90aqwV+fyDWSS45OMyl2EgPFMA2hhWGEJabVxEln6mR3sATcGk2QLPH
         4UC7Zdbok2nIwSsnYnYL0iB+aC4s0nuTABv69QB7jcxkuKe7JysygapnJ7HhluSWc6f7
         iE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770326096; x=1770930896;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMAmK55w1caUuW1KuyJwziCE6kDjy5Wma1Xxymy+Hw0=;
        b=kLZFKaPwQnMBPLwPgbdd2T0/whknRCXNnxkOkgtrev4yDCOvWKQYGb5q8vyZM//yHf
         +tkR6W7IGs6q+EJJP4PsMW3MJugQgYwx3YthrDYrTkwE53QwfMKe27QI5896JA8iIAUd
         Jia9twi+nwjRGVjaun4sOh4ogf/NW9BBY71PVNuuq5sBHgag9VrlZ+3NHmH0tksjgrK/
         Q0P3KhBmYSvA4gwF0vCKou3MJsPLcilyt9c5QNifTLFRdqf9+kOCGsjBu0LWgAnkjPQ9
         eflHyqYpC0pZ3xWG1orocGNPtEnL3f+8Ylrmgq8xeJEB0pjGqJOCDMcbgT4COxyJaK4V
         R1JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjyeOjjQhlg6zXTF8okXPkmPcD2MKX6HBqps06m30f/ATuv5blZpoW5SWTAZDN+t01aNH2XPK+80pGwS8P@vger.kernel.org
X-Gm-Message-State: AOJu0YxhukU7ia5U9QYQkz1yPTjSuA3rDxXruCbLHPZDX3Dpsmz/hENc
	EPSu1lEuIl5gwJ42SrV7v2Nkw/s/XYI8Dwf+YTTVlno+lg3lHhyuC8YVHhfWvF5+JYXaR2aC2fN
	6NPimvuvkBiEEWqRNSJOCJc+wOCxx0cBOlfTr2lQZrSrTuPKtaJ8k7U4QhPjOSGdnim8o
X-Gm-Gg: AZuq6aJA6sJZYvAq2uXOSj+bViJ3GHrCkfatVPtCaYca4eYSWkhn9e5o3sPq8ZMwIx4
	a2uJqbIj8Os7V8awnh49LZbkFg2i0mtxSp1bVNMxvqrmbkjJO56LrsGp6gHxtTuYbQRjM2Ih3Ki
	nDspYVGJCy9NRT/GpYuQ/FAGM3ivbEnP/sjCqOtrGEbtj1YUg6bPdwbuOsSKhyF2Wh2n+V6dpBe
	lHqf7YzcDmbL/ic6+bnLjMU+2lltP0/6sjhXqCOuMzrCkSFsfx6gLRwbQiD4l/1wl52LuPRep0+
	bYoha5EebkfkaKWXmK9x2eyho3mY5HWLdn3O9trmqFCneg9FQZy7TC2cYuZ7kjTRjHkSt0tQ1dO
	D+5DBecp5tK3NI7p+aQJEYmu15bOhb/o+VIpUComvwTdY
X-Received: by 2002:a17:90a:f947:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-354b3e264e3mr277532a91.20.1770326095641;
        Thu, 05 Feb 2026 13:14:55 -0800 (PST)
X-Received: by 2002:a17:90a:f947:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-354b3e264e3mr277499a91.20.1770326095076;
        Thu, 05 Feb 2026 13:14:55 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b4575897sm74536a91.3.2026.02.05.13.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:14:54 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: [PATCH 0/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
Date: Fri, 06 Feb 2026 02:44:04 +0530
Message-Id: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABwIhWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwMz3cLk/FzdpOQc3Yzy3Pw8XUMTy+RUc+MUSxMTAyWgpoKi1LTMCrC
 B0bG1tQCCmTWQYAAAAA==
X-Change-ID: 20260206-qcom-bcl-hwmon-149ce73d9440
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770326090; l=2419;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=R28ctyRfWvYF1AcAyUM3MdJI+xYN+EibX6fe5/NpQSY=;
 b=LomUW48sd/c8DDC9GA+Hgmzh6Mc1dSngB0j0DKcFtgZddiNhJxqAcA2XPOx/b2TejvDLs8+L8
 sIxJEkhSkSHBzpmDVsbIfjUX327WIdVqmYQhLf9DXgbMTvtRzeLoDIQ
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: mpt8tgW58w83aecA_xQdYalKRtvc2l4W
X-Proofpoint-ORIG-GUID: mpt8tgW58w83aecA_xQdYalKRtvc2l4W
X-Authority-Analysis: v=2.4 cv=e6ALiKp/ c=1 sm=1 tr=0 ts=69850850 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=NRMeOcx5ysTwsLa4DNsA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDE2MSBTYWx0ZWRfX/8VN1UnFi6sc
 bMpGrNHv9wJgQp+DMkTOVk3heQstBOKAsaOV5ilIRe3x8iimNmOZ4KXXDhnki49i1AiyDGTgvIy
 jw5A+bDOOGCA25Cd3HV85guVlKkSQQUdNSZeyfgQasFam1IJoaBDECfiRc2LTqip4LRtuh6Qpo1
 IU+4Q2889Tr6mFj7FE8PfXxpQb2zuQWt+LMlIQ7biTmK/Z3YlYJ/Nh4VBSIa3W4fzFvd1Uv3aXa
 Z0+xEIFSqmvdhp63l68+yEL7H0BAAuJSXJW+SxIlAVsrnGrklUahvxEX9cLXEY1IBOhOnYxDbiO
 fW9r2w2x/IZcuGPG42CyE/pttQADzGMdOI9S/Yvb/NFabOy0F4NuUf0IaTecBMgpDphYNe6T4yf
 6qdOVVIzybs/rEEqnKRu+7LNqZwfr2dU0mqyci8v7B2X0d8ZmlAMgjUVRG5PewRF55Y1L9UQ8Ju
 tBP2g85pOLgjtvVcpBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050161
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91966-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A2E8F7825
X-Rspamd-Action: no action

Add support for Qualcomm PMIC Battery Current Limiting (BCL) hardware
monitor driver. The BCL peripheral is present in Qualcomm PMICs and
provides real-time monitoring battery overcurrent and under voltage
conditions.

Hardware Overview:
The BCL hardware monitors battery voltage and current through dedicated
channels with configurable thresholds. It supports different alarm
levels with independent interrupt lines:
- Level 0 (LVL0): Maximum/Minimum threshold - mapped to hwmon min/max
- Level 1 (LVL1): Critical threshold - mapped to hwmon lcrit/crit

There are 3 modes of BCL hardware
- BMX -  Both under voltage and over current monitor support
- CORE - Only under voltage monitor support
- WB -   Both under voltage and over current monitor support. It also
         supports current comparator for current monitor

The hardware uses different threshold representation schemes:
- Raw ADC values for Level 0 voltage thresholds
- Indexed values for Level 1 voltage thresholds
- Raw ADC values with variant-specific scaling for current thresholds
- Indexed value for current threshold for BCL WB modes.

Voltage and current monitoring can be independently enabled/disabled
by firmware, and the driver automatically detects the enabled features
at probe time.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
Manaf Meethalavalappu Pallikunhi (4):
      dt-bindings: hwmon: Add qcom,bcl-hwmon yaml bindings
      hwmon: Add Qualcomm PMIC BCL hardware monitor driver
      arm64: dts: qcom: pm7250b: Enable Qualcomm BCL device
      arm64: dts: qcom: pm8350c: Enable Qualcomm BCL device

 .../devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml  | 128 +++
 MAINTAINERS                                        |   9 +
 arch/arm64/boot/dts/qcom/pm7250b.dtsi              |  10 +
 arch/arm64/boot/dts/qcom/pm8350c.dtsi              |   9 +
 drivers/hwmon/Kconfig                              |   9 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/qcom-bcl-hwmon.c                     | 982 +++++++++++++++++++++
 drivers/hwmon/qcom-bcl-hwmon.h                     | 311 +++++++
 8 files changed, 1459 insertions(+)
---
base-commit: 0f8a890c4524d6e4013ff225e70de2aed7e6d726
change-id: 20260206-qcom-bcl-hwmon-149ce73d9440

Best regards,
-- 
Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>


