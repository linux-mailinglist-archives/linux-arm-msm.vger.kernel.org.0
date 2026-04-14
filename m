Return-Path: <linux-arm-msm+bounces-103122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hgCfJsAm3mk7oQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:36:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7123F9696
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47F523025703
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD8938BF61;
	Tue, 14 Apr 2026 11:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Owpc5NTh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PHyzqZBF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868C1311C01
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776166588; cv=none; b=vCmr55XecSsLQ2Cz2Br0kMBIa6urv9X00Blk7DQs5JVQOgJXh4OUA4i6JCGEZnz/LMLINJJoYJSC1vSRtBfKICqWxiWTsZfLoEmmMVHlPH0woFZ2HH5nCgYfiaZxZNq8AZfJF9TKKh7Iz/Sg0MQV7v2CPZZIlhqXduWksGZif60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776166588; c=relaxed/simple;
	bh=gn+6ZNcFZc+TyxTdkl95xSQ9qtaT4u79ZWLKx+Wzhp8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ktXEEPoqvZcKC9ZcAF1pB3UJuHPsX26Z4OhLpzhbcHw/jlc5K9B4J0ZCW+KeLZ7lqxqzu3tNPS7QPTw9Tj0mJTe9aZLiTWtMvRvQJnHhxLKSeCqXOJ2fxchfhTWPVWSiRgZ73Uk40PPPyyZ0EJK3M36rHpDTbk9DY1ofy1dv8Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Owpc5NTh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PHyzqZBF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E71VJW967321
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8jmRcq0pruvJpCQECdiQ8B
	ywqUUUuCbc4PHYxeN5G74=; b=Owpc5NTh3iMb+zGSDg3o3vlPHBMIymgaQ5mS/M
	8mN0N3P9bXw1Kg/UDT58QF0UH1MKrfJLF2hAX32zC25Plomf1tzLPL7kAg/oG4O3
	DdRSvXhlK69wYwJPp8ly4ZWjUr17RpS5NOamnjWPSwKbXbQHvVOO5tWTrqbnQgLO
	5rUfdeowrb73WWa+eGyKM7xdy34FW7Oagg9c3ioYJoJ1YyX7dIrWR//nIw+M/JN8
	vssjiFWLLa/nrqy5ZSrYi82ao3hs81pCB/zWPL7+JR0bqcmPdAkvJHDWlBO/1Gvp
	fsetF2fn0EI+Xe0p3TA5M8eKyaKB9MhZiZFxD0GLphXuOlwQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v2eku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:36:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7691378914so2511330a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 04:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776166585; x=1776771385; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8jmRcq0pruvJpCQECdiQ8BywqUUUuCbc4PHYxeN5G74=;
        b=PHyzqZBFJfthU9/I6opin11Ag6qUy/gvKIlPB4GVi1Ijsz6LyFcDZ7OcwJ2832ixHu
         3yyDxy6ZRuyBOAg/oN07uC6uka3FLl6S9aJHBh/fwKaJpjBKvgOCm/AkBqKvSRwEJHaf
         hZKVSGMo48Lng5FMixZ9ljwioot60WygaA4WPRmmC77oy4QmBc2GX7DVQarF8kVx3Cy+
         0UAG8fe4XAU1F3/Zf3CUZd/v5CCInTmZVCt0OfyBQTSnXGuoAInFFYM8VPYtQL8s56hq
         t1hDcX5LN7sSJpDOI4AZyEwkB4O1KFOXXpFyDwvg+ejTbojFCLpzrfaPS68QCGl+bp4m
         I2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776166585; x=1776771385;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jmRcq0pruvJpCQECdiQ8BywqUUUuCbc4PHYxeN5G74=;
        b=m7kDrTO5vu6X0e4VJXRXRFHC2TZHybNY9gLzfwE8eRJv6ZMcFnNjjPY36OG4vaqS7h
         IsxM3WYSD6j+KnMA5cBrvcAVqrKWsOWzQ7Zwcd1Jx3TE0nfAbyeK6HjDPxDWabVioGXm
         1BHKPSlCJQjTtT4k0CiW6RazCH/kYGIsHLRzS/20tXV9PL4wTJwkgcoBILC9AY/REauq
         iK6Xiy2+cUQEOekONUTqC8RLFvzqaPmMzV8OfiF6t+Zs6p/cY8CF4lr3J2O9B2uzDQvC
         45xDB6//F/lLV5RANRgY6HrF2p+aMl704UWIjui4t6NYvjwlWbY86WhYAdWJTw7IL+5s
         74fQ==
X-Gm-Message-State: AOJu0YymuXh35t+pULF8VagbCN17mbfQnYZ1bV1bt8qcrxjvD63z6U8Y
	/aQf/64sYAKp0wUzXY4GpDD8HLBUiVMcqYFWqm970nfvR2mnTL7HqAqD1QETxUiDAFk/wTogJwb
	wEta4D1nR7urlsFIl1Q1lOotiw+xdfKnjABmjH0n4V/O6lEvJZUaCENGwigc40KrYv9qy
X-Gm-Gg: AeBDiethkf4xuq+FWyvzHXdnAqcBePidg30EEQbdZHpD+FrOvI3ddp4Svyo7JDbXNOg
	+oyLCcnaDf3yWUDqNjhJMjOqKj90c28O/vkIoO4v3TnszN0yjWy3C/NfasHHBWPRZd9ISv8bbNo
	jeggqh/sZUdbXtupCXIGwcQqTnpIX1tgR7Y5xCKs/dFp/ZklSQd+O5ML2kalChiYJmPqaao61OU
	jt2p8iCpQ93Ny9U9IyLAySDryMgpOuwo8e6DbG6h+OmcvivlGLGmwBpBQJAltbTJ/3WpMi6c6mb
	DPX6ZZD/U341LE45sTbggZTc5tEz0pNEIRUCqRZIQE7Q+W93wmYBOIDCfgQ3eK8+nJp4T7vA9WM
	RM3M1CQ1RU1uYGs/k9qC3szpu8HutsseU5U1UcUk+dwU+B5XAhu9NwOo/sOnIA+3YhVSg2Hcqdg
	okRFyiSUi3
X-Received: by 2002:a05:6300:210f:b0:39b:bee4:294e with SMTP id adf61e73a8af0-39fe40a440bmr17952161637.58.1776166585413;
        Tue, 14 Apr 2026 04:36:25 -0700 (PDT)
X-Received: by 2002:a05:6300:210f:b0:39b:bee4:294e with SMTP id adf61e73a8af0-39fe40a440bmr17952128637.58.1776166584938;
        Tue, 14 Apr 2026 04:36:24 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79486dde3esm1920024a12.11.2026.04.14.04.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:36:24 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v2 0/7] arm64: dts: qcom: Add label properties to CoreSight
 devices
Date: Tue, 14 Apr 2026 19:35:58 +0800
Message-Id: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKAm3mkC/4WNzQ6CMBCEX8Xs2SVtVQiefA/DoT8rbAJUu0g0h
 He3Eu9eJvkmmW8WEEpMAufdAolmFo5jBrPfge/s2BJyyAxGmVIdVY02BOytox6niD4mEm67CUP
 eekKnK2ucLdVBEWTHPdGNX5v/2mTuWKaY3tvdrL/tz6zVH/OsUWGotC2rUx2cN5coUjyetvdxG
 Ioc0Kzr+gGNnZMK0QAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776166579; l=2029;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=gn+6ZNcFZc+TyxTdkl95xSQ9qtaT4u79ZWLKx+Wzhp8=;
 b=9lQCNxcOm+EqjA3J1BeJlpNUNPZhHEreNht49EM4pgxXydKj8N6UihqdtIa8AXDS3nkUhJn8T
 Auk1P3n2lCnCnNUedSaO3qWCW0kdTBH8tAIX6OSvwv3brfH43lRy/Ng
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEwNiBTYWx0ZWRfX5UXofCWQ0ETx
 myLRr8PyWLCP35b13Dfl6FR9/289NO4cTn/n3chp5mIuqZEjbietRZ/5qPE624wlrO+YLNFoQPY
 fFfgOoHJBkVT1RpfJJSO9ShTFMuTndSCJJUrsy7tTOXProsawunJJk8YzA8pe/VDX653X4addA6
 V0J9J/vJmRF3k9L05gCoxzMBm4+f2hyWF1wuxWpEy7SeI6ZKlf8mNSpCRYRiGwHrAOrRJ/BvDOS
 Bw69+nwPTCYJ+NYxyf+3LR96pAPR2+kck1LNyoqz1uH5tyYndR9IJpOjUx/nZ5WtNLFFCw0yP/6
 GABrdf0EMB5B0QyORpNNzLfiU0IAsYCZTjnPhv72BH68jLGIb55CxNuCAxKm6eoiK5305W/sD40
 b5k8nCCYSMPP1IDlmvXInBkSUJB2VjMqPQz40Vdh4sUTYJvgttcj8OkFSh8GMnIIMiYizk5p8nG
 xEvVfsReOdkvvCt8upQ==
X-Proofpoint-ORIG-GUID: CO1SJUHW_IssJZUZDU_s3cX5LkpX2tgM
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69de26ba cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=l9IztEvcrmCM-arMvcYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: CO1SJUHW_IssJZUZDU_s3cX5LkpX2tgM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,qemuarm64:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103122-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EC7123F9696
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The CoreSight framework and userspace tools identify trace devices by
their base address, which is not human-readable. The label property
provides a stable, descriptive name for each TPDM and CTI device,
allowing tools to refer to devices by name rather than address.

This series adds label properties to TPDM and CTI nodes across seven
Qualcomm platforms:
lemans
talos
monaco
kodiak
kaanapali
sm8750
hamoa

With the change, we will have a sysfs node for each Coresight device:
root@qemuarm64:/sys/bus/coresight/devices/tpdm0# cat label
tpdm_spdm

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- fix the extra tab format issue in patch 6 (sm8750).
- Link to v1: https://lore.kernel.org/r/20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com

---
Jie Gan (7):
      arm64: dts: qcom: lemans: Add label properties to CoreSight devices
      arm64: dts: qcom: talos: Add label properties to CoreSight devices
      arm64: dts: qcom: monaco: Add label properties to CoreSight devices
      arm64: dts: qcom: kodiak: Add label properties to CoreSight devices
      arm64: dts: qcom: kaanapali: Add label properties to CoreSight devices
      arm64: dts: qcom: sm8750: Add label properties to CoreSight devices
      arm64: dts: qcom: hamoa: Add label properties to CoreSight devices

 arch/arm64/boot/dts/qcom/hamoa.dtsi     | 30 +++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 35 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/kodiak.dtsi    | 12 +++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    | 14 ++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi    | 29 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 27 +++++++++++++++
 arch/arm64/boot/dts/qcom/talos.dtsi     | 59 +++++++++++++++++++++++++++++++++
 7 files changed, 206 insertions(+)
---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260409-add-label-to-coresight-device-b17a2ba6030e

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


