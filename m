Return-Path: <linux-arm-msm+bounces-94594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LU5BL3oomlG8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:08:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FF11C31CE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2C9D303B4D6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 13:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785DD43DA50;
	Sat, 28 Feb 2026 13:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HUzRA9aA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CMsixIw7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358DB43C05D
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772284090; cv=none; b=RTIZUuued+yDuARFoDF1VXbgJnVBpKWHPXubvCb2FjgFENby9TYE2M5b8lYqOjnj9dlQK3h9MiC1HjENoGLe8mcchAk8AfUAdWTlYTN74gO9y+GkjD4u0UwMKImJ1giF/qJvLVv49U+x8ni51TtO8LrqLTdqSrW47yX72Uc+eUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772284090; c=relaxed/simple;
	bh=NJY0pV1M2wbLb1nUCS7E2d5p5eFL3304bkjkgwf1c38=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cDu3krIWcFSf2w7YMzCL1MjJ+nG6tD9bGJDKhlt7CcPI3xfegM8PjsRyVR00wvAywNfJJrOGBvi6k67sPcQsaKHG9Ppr+ZlF3JFTCzW78u3Ozo+4rFVXcFnnYtNKAO5kTE7rFFLIjNCRJaohK+lgQu53QddVraYvUQLNVQnISUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HUzRA9aA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CMsixIw7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S90NIr3435764
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cDVs32k9ynqEJxcjg53Eng
	DrY+pNd17ly0JDQCXesfE=; b=HUzRA9aAKDcXxMsSuMTZS010F0jfwmw54gSHtF
	oapIN5fxAwyjykGlRgO+edSABIWGUmN4k0zrNRpJPxZij1NliHL++OpK1fZjaBs8
	O4C7I6tqqIbXqL49y6ccirEViTA9e0Nsy0JjQA3NXRa/q5SP4GGs4vKMI/YNnWFt
	diMG6P8OtNgL4EiUUHGZXM7txhXxzb3fDhyVBCWwHHYCo9KQ6lsHr+7tuRlun2W4
	dl88WVsdC9mZU/2UKSpI/IqCunJzSerK1v/porgW6VLtsoOyZbE0NE6YwjJVG63X
	hpdPqjHLU/hJTMYk0DiVZrER6EHLdr+oQsf9ru6SQn/U+u6w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshch01m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:08:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2add182f21eso29937415ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 05:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772284088; x=1772888888; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cDVs32k9ynqEJxcjg53EngDrY+pNd17ly0JDQCXesfE=;
        b=CMsixIw7RRExHKYwpKvRF5sjS2+7ZUTYIbNmovTVBCSibCr+5+Mhd3Y5vZSLYQCUl4
         4rqZB4sd1ybbLSb2VN6LJn2bC8lj6ISN/4gFjpcjAaNyZBKzueWZ8Axt+EYFSB1ZHXPy
         xdsKppCHkBSSxubdLZlyjd5YC+YUFuSZvmdZLCFoRty2z0DoXkL6FSN+Jkc5PyzbWIIf
         CQzB5xwyBKIRxwt3bGeBCUMCJgsDK0T3p68/+ZfEFt/PB93G//qbSnm6Ff5PYQrtVkKa
         vgVNY1XMtiU3y1MBDefnkMKhIJoHgvDK5EBVq4qcRJmtKjOaFE22goG+pRczXo81M58V
         BgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772284088; x=1772888888;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDVs32k9ynqEJxcjg53EngDrY+pNd17ly0JDQCXesfE=;
        b=IRySunS27bMEmTVYZTvQojKWLbEXJeBv/DJ/j4cq/7/G9Ga0RRNhgXnAFjkPEh2BD1
         oK+YWhMJtwXL8joOX8G3ns85jhQ9x5oQLa4LYITP2m7DRHeOHAHjYS1Q2dXustC2koh5
         mAc5NMheX5P9ZGYwWh3w8L/cWJMX5nhD/ciwRYsZ/q+AcyQkUh2zouvJukjVaeV1s+tf
         GVFJ2EZzXPEtRAexQr9SZe8py8OYmEZOqICRnVWhl0ssGg8ciWsxylXeHPp9pWi33SFR
         YR2VWxPAJAKRZNyP6/106h/8ETYF3DWC8h8cOXoaHYauWnNilMW3ssHsQzUX8QdLdVRU
         hrRw==
X-Forwarded-Encrypted: i=1; AJvYcCVcCsB88ZcmiE9/lljrIJoV7Ybczl4+ttFJwj1IzqE74NXoxcmsiu5RL2ZJrZmzWEz3Nj9E2gcFW2w56IMn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2bnu9M4jGVojd3Sl1Ik544VRjcsXjRak9ja5ir2b3Gs74jdAc
	14DBvBGMNPaZDnwtvsbpwD0WAorFNyULKL+LsEGpBv7Bdl3imeKweTgLeWvpv+I4WMJGwHHMiz4
	LhQHMEHerc6R7vDOrGJ2GNCPBj6Pzm5mcPVQbXa0LAqr6nAUsGi0LViF21ntOtAIQHAKz
X-Gm-Gg: ATEYQzyE2o095b4RepU9HT9omkeFvTXfM2YugD7xT+Fe5wym1zfHbJnjLddhMXnWamf
	chNwxQbxhNVU/NdEpD4plPi57QEHZrcPtFW7HVQ35ajfiC2dgyARFCYpjQQafK6t9EOyDcRVHrc
	bt0PXG6ZUrFoSDEPb9ltiTd7gcRNd2IlfmmYbUBdkBGnkGiEhDn+Z8plMSWK2trGVqsQdiPGNpL
	ytoUQT+3oFB/vGUedbi7xNn5Wg7mSo8Cg5Jb3gAqvVWWZoH8TxugyscNDvy2mWUpIkYrlJ/0YaA
	tumquW8JBHpLO6tN2qCQXJYoYDEMlH0dLFuZJtRxQwOwr8fNIfSpNjy2xV0Oj+kSdCc9E5Br18k
	bG762hqq5eL4+C3M8OPpQPWDmts21RurpfxhzV3hn3SOxg03ZGJ+BdcYINd2Owi5OVbqmufi6oo
	4OC9UOgH741sU6NJOA6eLfmAohimRgPcxXB1mswFOBzt3ebMd7mdLw0wvX
X-Received: by 2002:a17:902:d48d:b0:2ae:3e43:4673 with SMTP id d9443c01a7336-2ae3e434cc0mr15564885ad.1.1772284087658;
        Sat, 28 Feb 2026 05:08:07 -0800 (PST)
X-Received: by 2002:a17:902:d48d:b0:2ae:3e43:4673 with SMTP id d9443c01a7336-2ae3e434cc0mr15564535ad.1.1772284087124;
        Sat, 28 Feb 2026 05:08:07 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69f996sm83947035ad.50.2026.02.28.05.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 05:08:06 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v3 0/6] Describe the IMEM present in Qualcomm IPQ SoC's
Date: Sat, 28 Feb 2026 18:37:59 +0530
Message-Id: <20260228-imem-v3-0-20fbcc1a9404@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALDoomkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMj3czc1FxdS3NLy8RUcwszQ3MDJaDSgqLUtMwKsDHRsbW1AAvai6J
 WAAAA
X-Change-ID: 20250702-imem-9799ae786170
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772284083; l=1941;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=NJY0pV1M2wbLb1nUCS7E2d5p5eFL3304bkjkgwf1c38=;
 b=OtIYOnOqtwtJsDUdSolaiZeTazCKsv7IQ7+/N7hkglpc/YYUZ/1OzH/fMqnE3+FblNgpYyKuJ
 kTA3k8GUZZvA1IyjNu78FMQff3icxphT+7Z5cNQ3h0XOreLPej4oZ1G
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: seSoq-Om83e42qGLFq7-cNY7vjEuxY7O
X-Proofpoint-GUID: seSoq-Om83e42qGLFq7-cNY7vjEuxY7O
X-Authority-Analysis: v=2.4 cv=SO9PlevH c=1 sm=1 tr=0 ts=69a2e8b8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Yu0Y65rDbttY8LA09AQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDEyMSBTYWx0ZWRfX56MepTWRLq3x
 mE//9H/ManuUlj1L2LfsGqTFOFk/bmH46gFcE0frcJS3Jly2a6uvRUWJk9Wb2U4KTkVWp9uujdY
 r3zZIkccpN0UhMbruoPHaWT3NpB/LzPWP3mcH/sPllXBS3idJ8NJkappuJ5ZwmI+HuNgXaaScy9
 MnIG9/HJCXn1VAHH54HrUB8UAjX8b2SPhNmIsUfv/Lfu1Jvw0BsohxY6iWF1/jxqYfkP0Y4N5X1
 V/RsepFJOW03hprITdLmq58B37zm9xa42MQc8TKcJj0yNDl3raRC0uNgKClpJl5Ht2/TBeHOCa0
 NEmOiQ4Nz3csyxNqF5CgmBvfE+r22CznbF4jYCMdWvr4U8+QwFCnMvsQvRWw7VrXcWbo3E7xB8G
 6pnABw0WFls4ubwjKoT1TBG+jlhnKW+mc75wIm2ZlXo6Pq+lDUwuB2qrJDpy5shdoZXP5j3nq/E
 1G08Ts69kocnqiCye9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280121
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94594-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 66FF11C31CE
X-Rspamd-Action: no action

Qualcomm IPQ SoCs also have the IMEM region and used for the various
debugging purposes like storing system restart reason and so on. As a
preparatory work, first describe the IMEM region and susbsequently add
the required features.

Across all SoCs, only initial 4KB can be accessed by all the masters in the
SoC, remaining regions are access protected.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v3:
- Describe the IMEM as 'mmio-sram' instead of syscon and MFD
- Dropped all the R-b tags
- Link to v2:
  https://lore.kernel.org/linux-arm-msm/20250708-imem-v2-0-692eb92b228e@oss.qualcomm.com/

Changes in v2:
- Dropped the IPQ5424 support
- Sorted the compatibles list
- Rounded off the size for IPQ8074 and IPQ6018
- In IPQ6018, use 0x0 for reg instead of 0
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com/

---
Kathiravan Thirumoorthy (6):
      dt-bindings: sram: Describe the IMEM present in Qualcomm IPQ SoCs
      arm64: dts: qcom: ipq8074: Add the IMEM node
      arm64: dts: qcom: ipq6018: Add the IMEM node
      arm64: dts: qcom: ipq5018: Add the IMEM node
      arm64: dts: qcom: ipq9574: Add the IMEM node
      arm64: dts: qcom: ipq5332: Add the IMEM node

 Documentation/devicetree/bindings/sram/sram.yaml |  5 +++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi            | 11 +++++++++++
 arch/arm64/boot/dts/qcom/ipq5332.dtsi            | 11 +++++++++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi            | 11 +++++++++++
 arch/arm64/boot/dts/qcom/ipq8074.dtsi            | 11 +++++++++++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 11 +++++++++++
 6 files changed, 60 insertions(+)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20250702-imem-9799ae786170

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


