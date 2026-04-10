Return-Path: <linux-arm-msm+bounces-102566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULiwHuVp2GkhdAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:09:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA693D1B16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 995AE3013719
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 03:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62612FF669;
	Fri, 10 Apr 2026 03:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyUe9AKd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+DjJjDf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB342DEA75
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775790560; cv=none; b=cMrE2YMPl5lD/ej8fQ0+VEu3va6b5ECwF9waXqW/UZlvw1n3cMEjxZHGq6YrIoAMfmxcm6Lw6p+S+tJsE0u9BUrE2v0wU5z0wQlxzNXNtc8ThddNqVCAjPGW3gryb2DKaKrcN4oTBLgsmNORNwuM1hExL4AJ+kl5TtOyeZy91AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775790560; c=relaxed/simple;
	bh=f4pE3Zvzu8P+DAQL5vVTUoJYEDmfp4P9T4XKe9DB7Qg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IN6AVDkT8pOYi10lUDnkBonTqI64t/a3vHWwum7EBZhGi8cSUSavB2alBFfxKETs07LGfXrBrpbNpwFBrTxpQzuiDjfnOLhGmd3LIFkIHgux7LHbHdW4mQOe5MYuFJCrU7er9Eu+WG+e8hSBvsYRMfSMOV5hRpsV1xFywOPrQSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dyUe9AKd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+DjJjDf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KSwoM1433129
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1dxvGyIYidYhvhxvl+4gTd
	su1WHR2txxNOAVJpPP3SI=; b=dyUe9AKdQ5T3fvjwxp1IOOP5xvL1pC41J8oS2h
	4Aw8kCxYMQfq/OaSW4uS2j00FfZTaQUOnrOCm5ziLu7SU30zhwpsdBcKz213rep4
	Ik/7AUcR26EB5KJ+4NWmw1t9cZ+dmxibI57JJIqRQyHm2SfVdtf7dBDYgNfVJbmV
	tQF+hyX0/QDAlzh83CqliLnTVcAD68Y9p4qDnVPaynUo1Ngmzy2INR8Z0ucezi5K
	ZvYU/y2nZovHuFqoM5ikOSqC5b4SzU/MacUpw/+u/6kmhTpl65AOzk+DZ7sLPpNM
	fDL2JQiLHCTHBDqAYxFqiIepNLmJn+IUksgTVXtr7MVCEJzQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckfagw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:09:18 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76b6db8bb2so1263785a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 20:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775790557; x=1776395357; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1dxvGyIYidYhvhxvl+4gTdsu1WHR2txxNOAVJpPP3SI=;
        b=f+DjJjDfK7c7qms3F+EWsCR6nzMEQpvM8SdX8VmVB3c5ijW5NantOxlW+wyyCS2/2+
         56FhZpTdZQRTD1Z+hRhttgC8iF1Bc+qqq7ITnQek4nWmAne/9k9G7NB/2OGVoJ1LaCXG
         cSnquL4gsnAtAFK1gWNX/PGaaTHrKVZVUYJZ4HphGV8xLx8TACG2MpxorPn9jexQ6L3K
         96JFd77RIjsAl/TQCIE9mFs/300sRiZ16TdYZltmO1ihdUPzM52GP34qdMRxxZUHZd+U
         MFOGJKC3NTaI8MVjTedugSsBo/llVGN5qCprTvVuoF4sIoRHwFgirBABl/2+bXMfG5Fb
         6kxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775790557; x=1776395357;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dxvGyIYidYhvhxvl+4gTdsu1WHR2txxNOAVJpPP3SI=;
        b=cpDiMfxNlbUkX98QN2PAJGMyvrg8wbLE3zoTIccSTwcCXMFB7pqgi9EUUrFwkTyemU
         cV/Bk/rDjoTa0vrKOcDA0vYEizkkQVK6xydt6aR6/CJ5DVKiG5R0v9p5ta9BnpDKhhf0
         PQWtsLkSDcUjYMjcF93lGpG1q+vxQkIVpnYfN4Sf33EBegGCG/btsx2rzeb1ftyCi5JD
         XxGxQgfYAL1ALB9XKQihP5L6wfVH3ZRLMpJ9sI8+ytXDv/ybYU7G+h42OPmpHt5BOsmY
         JIiabmoo/USZ8RVTDNKqVuOa0c5N+DhKMpbTRtrEFJG1HI5BahdvJxvdn1Y9KhOjUDOA
         veIA==
X-Gm-Message-State: AOJu0Yw2fNWB6np23kzC7ZJN5VXceGOPMYjtDLPrzP8uu4dAYanKlvVl
	LObbyxSIVjzEsMGvawIteGUKOZxduNwPedyDcu/TpoboEd3wn5WljqYHcY7pnBYgbk2rXzJ8A1g
	bfLHniyARbD5OVSASIUeyYPzqAu73UhSA+AGljxsfhKq2jokK29un6rjh6fTjXJ6cEDHR
X-Gm-Gg: AeBDies7FaNgK9PZsPTuFZYiKiaZETxQb0xOucCQ+muRDkAteT4czGP3/ug0DaNzJvo
	3dB4Q42NkQF5PsC5ette5mPi397ikSbNEzEJAjVnOiy+DnjaH/2iIdNX2chuikVQyqWgconx3Qf
	eQ6/AKyVBUiK1KUVLqriwJWzrIR1Qqg3D3mUtXsNxwH1TAaIUxzENycv8vhRhjBu2urWv5O9xhl
	Kncs75MODWwzcxHNTGrpxwQguukXP5sm04xVJyEOBuXa/lxEJcn+WMx+ScPZ3WUiBKZmXvZpFl1
	MmgeTx4FqC+HmEpDUwjU7drnLErOtrjTGN1jy/2c/AMDjJ2i0T0PK9Rw8KwxmZJhiBXDeFp5GSX
	WqNhkDsLORgOfBqaxVI1F1hoZO1otXuZiKES59fyTIKldp9eDv3Kc1cdKefuSxlrIvKmaymL1sM
	66y8OwecrU
X-Received: by 2002:a05:6a00:39a2:b0:82c:9cd2:fee5 with SMTP id d2e1a72fcca58-82f0c12fe3bmr1673256b3a.7.1775790557403;
        Thu, 09 Apr 2026 20:09:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:39a2:b0:82c:9cd2:fee5 with SMTP id d2e1a72fcca58-82f0c12fe3bmr1673222b3a.7.1775790556938;
        Thu, 09 Apr 2026 20:09:16 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50cd34sm987452b3a.54.2026.04.09.20.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:09:16 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH 0/7] arm64: dts: qcom: Add label properties to CoreSight
 devices
Date: Fri, 10 Apr 2026 11:08:43 +0800
Message-Id: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL1p2GkC/x3MQQqDMBBG4avIrDswRrG0V5EuJslfHRAjiZSCe
 HeDy2/x3kEF2VDo3RyU8bNiaa1oHw2FWdcJbLGanLhBenmxxsiLeiy8Jw4po9g07xxrG8C+far
 zOkgnoPrYMr72v//j5zwvAMwkAW8AAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775790552; l=1836;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=f4pE3Zvzu8P+DAQL5vVTUoJYEDmfp4P9T4XKe9DB7Qg=;
 b=c2AMBocaCgdp5XASf+9tc5jXLL25cJ4skK2xhtfr+ujQf4C0PckbLaT1PJJaEmi5es9WQIiij
 WkeK66K5wu2Bapzlim8Y3eADnkpIQ3Tpl/OPFa6Krd3e2beInRT4dqW
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=S/fpBosP c=1 sm=1 tr=0 ts=69d869de cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=l9IztEvcrmCM-arMvcYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAyNiBTYWx0ZWRfX+A3DLk6W1O9r
 WmZOr1WZvq3StdHW4TeKWdo3DwbcaJ7VH9W0vEF6TY8+agEO+E2pkxFm8Fd9RDnsw8xSY40p+G3
 ZT/FPjL8QeaBtC0QMrWeVY+a+d5R/VE4xRz9KuR4v1kAFF0oFugQ2aTfs6jO/WTrxIrFbafh9e1
 4ZOkEo/SsDA1tn38wtw24ADtV+ZUVKDJM3TEwOnIaVX9myhPk58bzAzhXOQpGAx26OTmcL56KTh
 04UVFH1CUcArRJzjlw8eY4yRQQdn6lqilp4L6V+OPHoPmBjM802I9gWIf0ZCaUTd2LaPc2ItK7e
 OUnh4GFmK+IpRdl8Gq8KA5TvI9vCWzGjs919f8qpf+vtJ8HUsyn0UODIr1TCxVgKIXDrS36gdzE
 nT6Bk6Cg8Hkif2KGxv7IyAptFYIejRrkPSVD5SEaXYCEoO9S5B5NEJrd0dXy1zJx7Ep4z2UET9c
 ZSGfMyPlgWn61uwyKOw==
X-Proofpoint-ORIG-GUID: k467gceO4fDCF692ZaBdgsMPPWUUSSdl
X-Proofpoint-GUID: k467gceO4fDCF692ZaBdgsMPPWUUSSdl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100026
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qemuarm64:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102566-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EFA693D1B16
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


