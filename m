Return-Path: <linux-arm-msm+bounces-109521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPy1IvBWE2oT+wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:52:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 374645C3F15
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BDC83008D11
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 19:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54BF4317177;
	Sun, 24 May 2026 19:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4Xhlcb6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OFVj2uIG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B8930E0F5
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652169; cv=none; b=AozzoviRI6VJNmESBQ2VPTgacXix1AdcaV68VODcDmhme9ngXPZhkVrtYu24B1oG4RBK2FEkqcFyZDKIk6J7nhyumlxWZjQU4d61VjodWezI4ND31PY+ylWPUlFfeNaJBEIswHXKJVfT22KFH237b4CaOuWlKyVb5So2uHr1YvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652169; c=relaxed/simple;
	bh=UZm98260Y91sD/0xzBGeVhOmEPZZGD7lKsH080IX2tI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CiDhoSqGAVteDeUESLhSBj+73ukGISw17dQPLnLrpwdsmUO1OOUb9VvNr+fkBwRl89Ce7rUMXG3VKRkKNwEeutx3b3xlU1VPDqs6X4+DzQnK58oTgTHwhIKVPGMqblKE47FAVi9i6JHlPhrGL8J5XeQ++UO0JL/pH6/lCavpA00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4Xhlcb6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OFVj2uIG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OIe8kR4083774
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=45+iCpvc5VWFUTB062UN7b
	k3k/bR33KPxgqVzcCpnmI=; b=Z4Xhlcb6z7gTxJHTFwMYrcorAWchk/lylHhZTp
	VCLpQgcLgpOHN1M2neZHZ+LciduECg/GF4Wk+G56CFtTO8dlgNOJ09z/zb8P+uFv
	TwI/U/fgDVsn+EEz4FZk1dJ1SY8tVRGqt57m0CsgS2NnKrFVViyK1E8iQDEDejiB
	/Z1QOL8lxxnTFLn6GA9W4P56JSrnG08oiCHYujB5fR0DcrmrblY0TIm7ISC7E9pJ
	a51ccp+lbFHSoz0NoWpThAo/1ByuyrEJWiPAYJ7T7PXbjKmhJ+TG6T/X2mFT4sDQ
	h7uKRdUeFIRLMWSPavqsHXLaM/ippV6KA8GJ4c6bB8To6sxQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb386m2q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:49:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365d4d2fa04so8128458a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 12:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652166; x=1780256966; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=45+iCpvc5VWFUTB062UN7bk3k/bR33KPxgqVzcCpnmI=;
        b=OFVj2uIGRJQKgjPr1Ums2d1Hqh16GSKAoLTSPJsq4RIw5ZJIrIQDb8XwxQGVhNJDpZ
         usvTTdveerZsmkHlqQp8zbAwh/u/iUeWivQTSOMvKa9wQiJhdg4KtrcG2bCeqJyIzIRV
         NzDu0UPQcGTRvqzyJRP5AOvzh73vuY8sfkxaDgsd8fv2CKu9VYorNd5tNfdp4E82r2Mn
         J7sLgR3EY+uTvHyLEfb6j/HLBr1QGGfpob1GKtOMV4mLNtSA08DMg2hIewtgRgq3VgAn
         HMdiBfJrzUOghXEoTN0/h1ku/PVjF5pLugdnVwZv7L7xRVLNkExmoKk5qO+ot2ZlFO45
         WcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652166; x=1780256966;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45+iCpvc5VWFUTB062UN7bk3k/bR33KPxgqVzcCpnmI=;
        b=gbIquCT0f/Mo1KJW22PpmIO37gCwhZR3H/t2Hsci8wuwz/yvAIKM1ESkcHR+ODPLDz
         Rl7MNIisQImcCokhd9tZYcZ6Yn3/k5n3E9vtLPj7TVJGp4d4wn/dfmqpoU6YHyEGsNj5
         6NTPGl46s6rC5HyCN86T7K7XHKkWFbAezOUZ2jH88WMQSSlGxbBuwQ0KvaE3gEntsJfd
         QplvQghVYeq1PJpwj2Y6vuzRPnGZsbFWtWJi7cLj9umCvk5BVVej4AhylLQvalD4sSJJ
         1zyhkXv6W/EGfGqy9D+l4hzVvX8VkbEFFO8r6XtXXd+hEaILUjutQ926qs/nYp+7ifpa
         /03Q==
X-Gm-Message-State: AOJu0YyZwi01VNCdDVC9t12JLWWQRRvuRCzMS8pn3xiS1VJAh/x8nhTj
	VwXxOoBy8ooAYkmKR27NazLCqfmx0ANwcy6zfH/GsZpt6uzFb1jGZ52vH53wsRg2RxGiOckIj6P
	4wkWdBfw1XN7zjmktEGMj4nCpCnUnYmRQ5vgyom390YFc1qI/K7qO7QOc0ZBhPQmlLsiP
X-Gm-Gg: Acq92OGOFJGS07eFmQ+RRXvO0eZy0cmONNgYjTs0Y0gK2SdTV5aBBvn7VJ++S1wiD9X
	89wyDVX4hSIRGT19neJb7JMQuS434Y2/+UFHxmCCiRf18nedR2BfzZK2h+P2WeUJII4MuupYPuN
	ICcySAyGjgwfU71MS8ipBz/r1mdcNJxxMlW8U4VTR6+w3tmAw+KTnWFXkboS1Ox8Hjb1kFcuykd
	ooj1CsdDu6foO6xhYziThiikfDGDZWBsdXUpkLsNHij/9VFNkzwe/AObOrbtPFKLoKSpqomn0px
	PG9/jy2l9802qB4bXY+ypxUVpKaAO/fteyfLUtcFbLB+lva6DbnDNO6/b+eHKMFEvAv1DooLkZG
	cQ5HuHxQSRzhDAy0OmR3b3Wib2Gi0WpQGwUcO
X-Received: by 2002:a17:90b:5385:b0:366:346a:6891 with SMTP id 98e67ed59e1d1-36a67836e6fmr11627659a91.16.1779652165620;
        Sun, 24 May 2026 12:49:25 -0700 (PDT)
X-Received: by 2002:a17:90b:5385:b0:366:346a:6891 with SMTP id 98e67ed59e1d1-36a67836e6fmr11627621a91.16.1779652165020;
        Sun, 24 May 2026 12:49:25 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c21d4a2sm4725849a91.1.2026.05.24.12.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:49:24 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH 00/16] arm64: dts: qcom: Extend Shikra device tree with
 peripheral and subsystem support
Date: Mon, 25 May 2026 01:19:04 +0530
Message-Id: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADFWE2oC/3WO3UrEMBBGX6Xk2kAyyaRNX0WWkp/JbtD+mNQiL
 PvuFrvqXujlGTjnmyurVDJV1jdXVmjLNc/TDvKpYeHipjPxHHdmIMAIBOT1kl+K43Hlo+Sig0h
 BdUBtYruyFEr54yv3fDq40Nv7Xl2P42+0b46klA/J2GK0rUZttOk3xR6/+BHUt1CWMgcuolOIA
 U0w9l8H+FppqoPPU8zTmVuXhEDSXgH1m/xTAn0fGmipdXhVHAFcIp18l/BueVeJh3kc89o3QVL
 woGxySqNBsE4BICq0KbSdN5a8jZ1u2el2+wR0chzCegEAAA==
X-Change-ID: 20260525-shikra-dt-m1-082dec382e7f
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Yepuri Siddu <ysiddu@qti.qualcomm.com>,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779652157; l=4127;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=UZm98260Y91sD/0xzBGeVhOmEPZZGD7lKsH080IX2tI=;
 b=djc7KEpkzBuKIiYDY3FJdJT7raiwQCvqgI0jCHnIKyp8j2e1af42aiqq192kSWKkKp4PZrffa
 dVndidU8Kt/DdHN5Kt9TKArpKDfjvx32qioknpxqKCim42k8JZwuIi0
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: GQtz4lcIn8OqpBRu-jDGcpEQ_pId46it
X-Proofpoint-GUID: GQtz4lcIn8OqpBRu-jDGcpEQ_pId46it
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfX3Ma9vRNf2Yw3
 SZqO7xwxsAC0wPAIFCzTB8gYP6ErQssB1eEBzcg5XtsVPtL+G+lXDMvzc3WpocSskeBb/goxcxL
 K9ZoFlB7EVlcUkKG82ahqJaYCS90CeNnMgrKTJh0DFdJroij4FaOUD6H1Zw3R3FtdA8g2GXZZQp
 1GiHK8G4eh77cOL50pFaUobk4SnhMlLoly07J3qP358I0Mx9VwFWwFy3mjGKZeu/V5zeqd2WToY
 u3a1tQLD/HslPTWhO98KYIpBnH4qmkUWOraq4yq0B0Dce/v4C/uzOtizpVmT4WXytJCQvAJq8Lf
 xwlUs70DfrP6fJr212rqJZRcQTcQdx2zCdUulL6adxNuvUghRq6wWcThj5lF+hxSABCBlIvmC4g
 dpLTM4tbQHuwJqvdCrbSJpR0ro5hpR1ae/afIDPlbAheA93HfQttwqX81kRO5j/J9kPoOqc+XoE
 5CKdOJmYfJoFXGqBUZA==
X-Authority-Analysis: v=2.4 cv=PJY/P/qC c=1 sm=1 tr=0 ts=6a135646 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F_wByC5qsg8vutzaSOUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240198
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-109521-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 374645C3F15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend Shikra DT with peripheral and subsystem support across all SoM
variants (CQ2390M, CQ2390S, IQ2390S) and their EVK boards.

The series adds:

- QUPv3 serial engine configuration
- cpufreq-hw node for hardware-assisted CPU frequency scaling
- DDR bandwidth monitor (BWMONv5) nodes with OPP tables for dynamic
  DDR frequency scaling
- EPSS L3 interconnect provider node for L3 cache frequency scaling
- CPU OPP tables to drive DDR and L3 scaling per frequency domain
- SMP2P nodes for CDSP, modem and LMCU inter-processor signalling
- Remoteproc PAS nodes for CDSP, LPAICP and MPSS subsystems
- TSENS instance with 14 thermal sensors and thermal zone definitions
- Bluetooth (WCN3988) node with board-specific regulator supplies on
  all three EVK variants
- WiFi node in the SoC DTSI with board-specific power supply and
  calibration variant selection on all three EVK variants

This series depends on:
- https://lore.kernel.org/all/20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com/
- https://lore.kernel.org/all/20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com/
- https://lore.kernel.org/linux-devicetree/20260513-tsens_binding-v1-1-1780c6a6caf2@oss.qualcomm.com/
- https://lore.kernel.org/all/20260524-shikra_epss_l3-v1-0-b1528a436134@oss.qualcomm.com/

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Bibek Kumar Patro (4):
      arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS remoteproc PAS nodes
      arm64: dts: qcom: shikra-cqm: Enable CDSP, LPAICP and MPSS
      arm64: dts: qcom: shikra-cqs: Enable CDSP, LPAICP and MPSS
      arm64: dts: qcom: shikra-iqs: Enable CDSP, LPAICP and MPSS

Gaurav Kohli (1):
      arm64: dts: qcom: shikra: Enable TSENS and thermal zones

Imran Shaik (1):
      arm64: dts: qcom: shikra: Add cpufreq scaling node

Miaoqing Pan (2):
      arm64: dts: qcom: shikra: add WiFi node support
      arm64: dts: qcom: shikra: enable WiFi on EVK boards

Raviteja Laggyshetty (1):
      arm64: dts: qcom: shikra: Add EPSS L3 interconnect provider node

Sayantan Chakraborty (3):
      dt-bindings: interconnect: qcom-bwmon: Add Shikra cpu-bwmon compatible
      arm64: dts: qcom: shikra: Add DDR BWMON support
      arm64: dts: qcom: shikra: Add CPU OPP tables to scale DDR/L3

Vishnu Santhosh (1):
      arm64: dts: qcom: shikra: Add SMP2P nodes

Xueyao An (2):
      dt-bindings: dma: qcom,gpi: Document GPI DMA engine for Shikra SoC
      arm64: dts: qcom: Add QUPv3 configuration for Shikra

Yepuri Siddu (1):
      arm64: dts: qcom: shikra: Enable BT support on EVK boards

 .../devicetree/bindings/dma/qcom,gpi.yaml          |    1 +
 .../bindings/interconnect/qcom,msm8998-bwmon.yaml  |    1 +
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   42 +
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   42 +
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |   58 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 1687 +++++++++++++++++++-
 6 files changed, 1810 insertions(+), 21 deletions(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260525-shikra-dt-m1-082dec382e7f
prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v3
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
prerequisite-patch-id: 391f9dffceaac9f44df7c2daffafb66fa379ca35
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 7e351b93b3a238145ca642143bd0824bb90e98ce
prerequisite-change-id: 20260513-shikra-rproc-0da355c56c69:v3
prerequisite-patch-id: 39475cddaf673b2cbbae703165a782916f199885
prerequisite-patch-id: 6f7f265abfbdffdc0a1fdc5a7e08929e4eec5b7a
prerequisite-change-id: 20260512-tsens_binding-9af005e4b32e:v1
prerequisite-patch-id: 35141047f44b4845f9d94618bcf26ec58ab4a0b2
prerequisite-change-id: 20260524-shikra_epss_l3-522afe4fb8f5:v1
prerequisite-patch-id: 9e0a3b4d7b2033b39287b4382ba3c0c856a62e77
prerequisite-patch-id: 3ce52e07ae57139c2e2b71a29ed7d7250f6fcc87

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


