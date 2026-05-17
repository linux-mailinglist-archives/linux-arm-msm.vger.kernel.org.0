Return-Path: <linux-arm-msm+bounces-108036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NocFxjXCWoDsQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 16:56:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 905F3561C39
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 16:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47CFC30075EB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 14:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36B83A1A3C;
	Sun, 17 May 2026 14:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OxNa/O/Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dtl5XfHf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A383E328267
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779029781; cv=none; b=N1UWsHrRMLq8K8o5LMbbi714osUqEWntqzFeYgkOx9HuMq6CYc/S+yuxWqNC0TnTrHH/vIlfcW2Jcz0ep2DRkY3vgKeqNpzpO1eQiooIOwFkA4/ncFsSuPI80fHFDHehBggN9YakhTdB5/Ct96kSrKjEoCGlcxanaihEesZhwDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779029781; c=relaxed/simple;
	bh=q9B3/HxPM8LiJR7e38jupoj6d1gJ/EiYwRz0frDFIsY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pGd1E09lOGkRmPCpq+yeBszPjdAgv4gk4KJUC7ypzuQtD1jsOMfs3cxj6evs6PDTUoovqjFaj1+62+fQkOifAg4PyDRcc6fHdFYa4UZXlzEqvkE7xDCqQIvGJ79CaoELAZQrXylHMzvm2sllNiPTRfmkFieZsB3F+43bNWWsUnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OxNa/O/Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dtl5XfHf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H6w5Kx3155326
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tdx2730hCP7/lzgiJ6Hr1A
	i4NuZaqlsJ0h2QmgQUw7o=; b=OxNa/O/QTDfnl7W2/8ugSZ79v7HbuDnKn7yUC8
	VYf00A2J5wPHezeroR1ZkdT9lc6MHLfSP5Rf+HbFYdoGrGlZze8CMl5xxTWJqdAD
	SeNennfSkvGxZfgHC/c0fJ1Ro127f4mNnYsqR8fgusfgkBo1nbLV2CU9bXrooVMB
	2PIqRull6G48JhJc4oP6jhHUIDG1XV0oviYaucI+Z54u1g+bxOeKSArhQHVOY6tB
	ObrJ/jkDk8EaG4XschoseRzjVQyRZFCK2YUVvL0OjO+CPWMKRJAcaNDD798OVJDk
	XmBQEPYZ11o7sldFglmVzBgF24baC26Z89RDa3oKO5lwZ2uw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvchwgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514b5d6bb45so26581611cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 07:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779029776; x=1779634576; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tdx2730hCP7/lzgiJ6Hr1Ai4NuZaqlsJ0h2QmgQUw7o=;
        b=Dtl5XfHfJlBwyKBzUnNiOzt4yXQTJ1Zn+oLXTEwCZFcYlxjdr6W23wa/uZKJucupjX
         ZXUEOG2PqtPVpfokTDKLrCSSsDdCEuEVU3rXz2A3JpPliVoo3J2KDk8JlwMoEqn9j0lm
         WK8mqiqlt7wChMHIfK8Hk/IjWJ4hSE7fhouJAzGenSgRNHktpE2enSC19FujVjcq/CO0
         t8opWk8X8c7torB8nbc+o5RoW2NykYYSXyepH6UqvNSThNDZoFPMFoeM/pFlGkJpzY77
         68OQ9ELv985HXkkk9E22Pte8Nco5e/QBTQmir2eNIWkGxW7gUWeZT0kr0ZfWx/SGYgE3
         3daQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779029776; x=1779634576;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdx2730hCP7/lzgiJ6Hr1Ai4NuZaqlsJ0h2QmgQUw7o=;
        b=eL/xjUmkKfcQryZX3jp1Qrx/xqfn/Faht3TXoInrZ3afBCFhFYawht+nRbHdEOWr5H
         lF8nWazD+/LossKBdtdCtNiPeCMjllY3N6kcenYfnyKQk6wzijN0ya041lsOzWlgCXhf
         e88LvpNIZ5ccDxjDFYDaw8Qc99MVQzfSgtTL4kavy/lZa5RL1uYf8P5WAL1yyEvY/1CZ
         rM//8gqaEbdqUMfUFt6WotiHcp7D6PYyB3vo+nEIy/ikSJJb+L+bj5Sat8I6GzGXS2uH
         tGdOKSMdNM0G4mVZOZanbGmSOm4iB62GpOjvDSuK6P3mqyiAOufY06EZha6ggz0x09Fg
         DQxg==
X-Gm-Message-State: AOJu0YyWVJWjGFTFfwavTdZFnC4V4X1kmiBS9hCSGmsrzWYa92MEkhNN
	l5Ieu1tvvRYbmAtoW5pJQGrfJ3cYKUs8SAcAIBFTTBNDPZ6tZIyaidhwB9NH5Oog/tMiey48XIo
	zhPy8bvhY6xShFKCILsd+fhrD1386hqIlS3PHyyGM5sFxU9XaDwzTvH3j/qLx/gwbJYcK
X-Gm-Gg: Acq92OGMLy7aLGwGcVjeH5e1HEanDEI9F67bZE+JSh0vTt3EI+g4zuFjnvxrBEeAXkm
	iH67GZE9knLeHxC9q9AxTtT8/RaB5euN4AD9pKaR9hKMwsis856Ok0EIwjy+rf2b5Jr8V6eUFY1
	IZooE46PUhLxywcbXUWlxpdFDaBzgqUp5xWUv6KRU4zooKOff36JU6aBCpJE8qBP6/exZhTFM+L
	HXm+JoZbfq+AFgM4dUJpPlaS5d+IglEBnQnVGpN+JTTnZMBprC77x0XuJTCQFZOPDkhN3iedqVU
	48AKZYxqPGrr1u5xY2aWakOjprRhZubtsbTIRnXSmGi506Y7bEjgvEARJE2ku6FJZv4rDd4nN8F
	4UaO8yJkp3PIT1KHBv/K078yB33UUpOjnLa0liOIlzdKOH2erIKQSt8Tji3iFMl4oi2wtN3XO7U
	Gt9Jgm5XN8KKOy2fkBqtUs5e+N79Tmh9XSXR4=
X-Received: by 2002:a05:622a:a06:b0:50f:c36a:3826 with SMTP id d75a77b69052e-5165a0ae89emr169500931cf.16.1779029776092;
        Sun, 17 May 2026 07:56:16 -0700 (PDT)
X-Received: by 2002:a05:622a:a06:b0:50f:c36a:3826 with SMTP id d75a77b69052e-5165a0ae89emr169500581cf.16.1779029775603;
        Sun, 17 May 2026 07:56:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f118991sm2733339e87.18.2026.05.17.07.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:56:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/7] arm64: dts: qcom: consolidate IPA properties
Date: Sun, 17 May 2026 17:56:06 +0300
Message-Id: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAfXCWoC/yXMTQqAIBBA4avIrBPsz6CrRAvTqSZCRSuC6O5ZL
 b/FexdEDIQRWnZBwIMiOZuQZwz0rOyEnEwyFKKQos4lJ6/46pTBwCtR1rJRRpdGQwp8wJHOb9b
 1v+M+LKi39wD3/QCmDjH5bgAAAA==
X-Change-ID: 20260516-ipa-loader-403567adc3dc
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stanislav Zaikin <zstaseg@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3618;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=q9B3/HxPM8LiJR7e38jupoj6d1gJ/EiYwRz0frDFIsY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqCdcMXTHL+0qFr/KT0H8gZy8epAyWN2fap9/Jl
 S2qlrE8LniJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagnXDAAKCRCLPIo+Aiko
 1QRVB/9Pyi6rjMQPMtmQoKAh6RmTspEJ7YABeti2mivou3+bUoGmgmUjKSSh2nQ9zo8ncFeFa6Q
 MyLF598kcrNZafb/nrj1VsgokNU4rpeUutCBppQJ1ZfiC47IWZYtjMS5/djtyOIpiE2mUNImMTd
 7KJenFlBshp/tV2U9w687U3KEOWwTikehcLK8WaBdXHX6upglyeWYvT7K9/sohYCYzawxmdEfw/
 OcHRMaYW8t9RBC+bN0+7IwAMSg/JpWrKllruhZgsQPIL4Dqh6309W10RRn7Ey3S1cmAut2bOV3E
 ZD3M/i1ZJDCqzzVMqVxxjb3mJffM7gRPpq90H5p04Yze2aRA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: zkHROQa4T6xOcZ_QZ6-6kVkxoXYkab4k
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a09d711 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=lGjpoEL64WzembFprfwA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: zkHROQa4T6xOcZ_QZ6-6kVkxoXYkab4k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2MSBTYWx0ZWRfXxfQP/cE7dtMw
 bK5B9dmYqesjc+bT3Z9OVsXJqctQGSn//TeRd2/LMG6bL5iXd+kUdy2EDx/AUCd50/2kQrBpfjZ
 zZ67+FH3ME+41hkdmAH+o40QNFAOKX8ps6/Tp2SrA6ThREjNNxMwCw6HOCiETDADkWN9+kpTuA0
 HiJjLxz5EPBhqgaIeCRRrvlu14w0J3yzoL9kEq964d9UEn3vbhp+OTR5fEI6i7BmLn34kdrHjZE
 XmnYmyNzWGIbjtZfq16Va2YkbZ+/Y2iEBjGqVjFguzLTUz6ruSyLJa/xwORhXvwf2fF8NmA4tjc
 M/IgP/0C/ADIm533ehd7W6hqnhE3/Vd91Zf5dKaouPyKvYWENEUtUd03VPMPllabL5kYn2u8uFH
 ng6h079sS018JWMItbE8s5lQocIqm6Ox9H/jvXDFGXp7iFQjn+026sDBUvF3ZsH4bEoLpZfIJrW
 wZclK8JGKI99S9N3G4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170161
X-Rspamd-Queue-Id: 905F3561C39
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108036-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

For most of the platforms the IPA uses qcom,gsi-loader set to "self" and
requires a corresponding memory region. Move those properties to the
SoC DTSI files, handling the outcasts (mostly from the Kodiak world) on
a per-device bases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (7):
      arm64: dts: qcom: sdm845: consolidate IPA properties
      arm64: dts: qcom: sm6350: consolidate IPA properties
      arm64: dts: qcom: sm8350: consolidate IPA properties
      arm64: dts: qcom: sm8550: consolidate IPA properties
      arm64: dts: qcom: sm8650: consolidate IPA properties
      arm64: dts: qcom: kodiak: consolidate IPA properties
      ARM: dts: qcom: sdx55: consolidate IPA properties

 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts                     | 2 --
 arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts         | 2 --
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi                        | 3 +++
 arch/arm64/boot/dts/qcom/kodiak.dtsi                          | 3 +++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts            | 3 +--
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         | 2 --
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts              | 3 +--
 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts         | 4 ++++
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts | 4 ++++
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 4 ++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi        | 2 ++
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi                | 3 ---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts                       | 2 --
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi           | 2 --
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts       | 2 --
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts             | 2 --
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi  | 2 --
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts            | 2 --
 arch/arm64/boot/dts/qcom/sdm845.dtsi                          | 3 +++
 arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts    | 2 --
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts          | 2 --
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts              | 3 +--
 arch/arm64/boot/dts/qcom/sm6350.dtsi                          | 3 +++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts             | 3 +--
 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts            | 3 ---
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts          | 2 --
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts                       | 5 ++---
 arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts    | 2 --
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts                       | 2 --
 arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi       | 3 +--
 arch/arm64/boot/dts/qcom/sm8350.dtsi                          | 3 +++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                       | 3 +--
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                       | 3 +--
 arch/arm64/boot/dts/qcom/sm8550.dtsi                          | 3 +++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts                       | 3 +--
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts                       | 3 +--
 arch/arm64/boot/dts/qcom/sm8650.dtsi                          | 3 +++
 37 files changed, 46 insertions(+), 55 deletions(-)
---
base-commit: 230cbc83bec52234e456f33a01f400f78bfac0f9
change-id: 20260516-ipa-loader-403567adc3dc

Best regards,
--  
With best wishes
Dmitry


