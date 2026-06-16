Return-Path: <linux-arm-msm+bounces-113464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AsXvMtiuMWpgpAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:15:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F10E6951EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:15:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GjXFRdKg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HEiAnXX+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113464-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113464-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF7B231D18CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 20:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DF6386567;
	Tue, 16 Jun 2026 20:14:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016DD3859D3
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:14:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640892; cv=none; b=cE/aUiqToFs97F3rfIOsfr6wWGRwXL9P/hTVz8TZeKSzbL2yyhiELu2nAnLesduGghJbD+FGwredAUM26hZVbd5NFv9A31oUqh+zhcta9PtWAv2MCL7cMHe7NCHhEzHJXoBD7qmx2GzLxQwuZhnTygo/TjkV3R1IC+tEJd3puUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640892; c=relaxed/simple;
	bh=/UEGMwZc7K0TpFDTh6unx7m3NV5lThRr1LpgH4Pt5i4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZvH5JONXREMtqLTjKeWX2Lgqh7yBpmwlyJCFfeYNhDFCYtXL9nj3cc9/KP6hmRdIjQ1OMoF5kQYCb92bPQLBOpY07d3gwVIpljlCABbZBW//TLeoj1yWEQWUS4Ay9cNLLJfIwad6R24oAfTosusg61Ndvy6eIxVw0LroB4H0+OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GjXFRdKg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HEiAnXX+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIQ2VN4015966
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=f3PU4aei7FQDBxFDjwv7YG/ciJu4b/LVqVJ
	dzRxaFbE=; b=GjXFRdKg4zRsNoCd+gIAvyC1jev+vuuoBQAYDthf+RtJ/UnYcSJ
	l69TlMBTMQl/KaOuEykYAVKNgaAER/Bda57TxomYdXc6+GFfOxExQwIaDC46PMto
	2gpHq+YdcVHfMmmYBe/mupSLhEfVfcenXYCVvwc9DhLMmJP3YvxK4Xtk3QE2CpB5
	y+B8FRfngjCjIZYN1ytGd6YIDXsFjsnMkl9W2P+jLWqVZuD48rgpoKtJXkiDymcx
	pSRP6CQDZbVVNnPwpC8pt0CiMjclTuhKRaVkln7KI3HLoWNzeNjClsu4MzMmPLqx
	DVA8cH9Y57g+ns82ESl6XhHWmWT6/Xe1Crw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu253kh3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:14:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6a2ee8cc9so7161685ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781640889; x=1782245689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f3PU4aei7FQDBxFDjwv7YG/ciJu4b/LVqVJdzRxaFbE=;
        b=HEiAnXX+zAAoBrscfRUAqAx+f0FR9BhbEYGH7d/GgzjOGcilTz0cKuXVe3xD0+n1YJ
         GCIbzTcPgC3rBhGs4C7fr0mNYchhoCGG20zvawpJ4Fg4cnb3IHZhe9WlhNHuhXf2ZBAQ
         UM6VzFhZrfgk7kCvCdkl25y8s2s4TYE3916u5ETvHrIOfz8g1rdhQe6rVKnb726xzusz
         B5iMfhWPBfpa5jnL63DUyikRgSF96aAOvd3hpKPz6zK/g0fw57T0hMHvfXitD50ve3Ra
         ln7R5TIXdGxZKOoxLU/NUE5xmtntcNoY7XK+qTTqvKvPF+EjBPNTY21QXmXNeV3IKL/5
         zs6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781640889; x=1782245689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3PU4aei7FQDBxFDjwv7YG/ciJu4b/LVqVJdzRxaFbE=;
        b=UYEgyxXZvCt+IgMHqspW4eIYUinZ9iHuguGJ20Jts8Z5E1QR2zyF6/8eG6zM6KGW9g
         QMUpwsbxJXrtqDot2StrMfLA27Kwa1IIciu0rfReFVbX6uPAUsU90ePhWwZhDuHXxG2E
         /3EjlFl1VX/PBeQcgjnOfzBRxtSeH75LHYFpJce3HoHi8sk5zsHR6h7ijoSqekZ/40iZ
         lLgyI2FCrIjV8nh2rVdq1jGTdtYMxxwu4/9uwR00h5tsGPVREy9X3nnIvaQnt9Fxh4qV
         FcncG3C6+mt6P5TNd9ROQxOPIHkUezm0f/xNux6la83rd4BmvVWAuW2iKcuB44B9d8En
         2niw==
X-Forwarded-Encrypted: i=1; AFNElJ9j6j5uJ73Qz8G4tTq1anxysmzIpoqcENavvvf4lBPZbKCaY3ARFqwVGWa7ff2ZGNDwXynsrNnTZF5FRsEB@vger.kernel.org
X-Gm-Message-State: AOJu0YyP0h3M8ZAcMVwLWGw8o2tygtSROwNl/t77Y9+Qqks22ENV4g5j
	Thk753RdTHej6mXAFdSaQIRoymGBLX7w/WfsqE5eqIx4xlKE01SdAU1ydZEOQsHbs3T52KHEpxT
	yJAgvBFRAlaTfkfZG8WdjGlSGv73h8PaaUKhSMdki3w0ue0cqhDrrS/DyQ06xlSEaf9DH
X-Gm-Gg: Acq92OEaXJq8EP2ngLzgzNF50T4/UwhHZ6LuIoo0HMh3Gf+u2z1cmKj9vpKG06Mle08
	n24vb6uKGsQby2cqsP2KWrTmb2zn1oCLifXls65tGTSAkC/NiC7TItuzUVk5j0sLaKsImWjNXhN
	dU6bZI30ijBqww2ASn6lUrt2nxtvwe2i1tozVR1iRMQN/ULNnMDUo1/+omc9WO4j9K2XkNK7yH8
	Srbts7YTEgo/cUKQzIehEIvY8JplPaSycnDnziNdWzWM/LRUWcLslrEpmRvoMVpXKHmUf0VCXU3
	oB/fRVn0I6TgxahVvIAq90qtUCyy7tZzOkirR0NmnmN+hGCWBuEGABXnQEw7ep9eETDdgTSVQix
	egiS8xqLpBu2CwvXvx8X2nymSyhXIXRbkLLl7RkemKscUjdhj9pDac/0d7g==
X-Received: by 2002:a17:903:166e:b0:2bf:128d:f7ff with SMTP id d9443c01a7336-2c6bc0ab997mr5131255ad.16.1781640889359;
        Tue, 16 Jun 2026 13:14:49 -0700 (PDT)
X-Received: by 2002:a17:903:166e:b0:2bf:128d:f7ff with SMTP id d9443c01a7336-2c6bc0ab997mr5131055ad.16.1781640888885;
        Tue, 16 Jun 2026 13:14:48 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328abe7bsm136385985ad.49.2026.06.16.13.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:14:48 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/8] arm64: dts: qcom: shikra: Enable audio on EVK boards
Date: Wed, 17 Jun 2026 01:43:07 +0530
Message-Id: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KsdXLOQG9o8aekneOhJzQYtyaHg5zWMx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX96Spl0CsqUk9
 qGvF5EqrfyunQ1XnrFzWV6ZK7JwnU0ihaLvStevbEtIP0y3dAeNGSfV0EUCXwMqKanq82lHGYJ/
 LzJzwoyFXiLtIBAM1C3oiDYiiNZi/hQ=
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a31aeba cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=ocK6u5s1opKHhBkIzIUA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwNSBTYWx0ZWRfX9cKFgbSYVuVt
 6urrexAAutzbemkPq1ZHqVeyEBfPArbt+gYAOQZ5U7OZ+vhO0CP6sm18a2HY19RqOWaM1G4Onzp
 zeUmazyM1gCvsIFrGGjWobn76mRlpP9D4XkegoMZ+xDMtUIIYU0buCkyqcuvoqkeF5W3mdyh3HM
 qxcHGQOe0+XyeVZpjPbRYY+HIkyHPYJfTmpuNDj+9OHfaF7YZGw53Fsh5j3SIyASjwyBEUMoUEo
 mLszxKA1Y0dXapnydDIl3LH4klRe/amfX04iqXzU/w8vE5YGrfwZ+Kurr1GfUftsF1qz0tb/oUj
 +iNFH04sadKiJOi8a/nvEsnoHihl8XzxheHVtSMPZACFEsx9zAYTQbVBdD3qle0WjWhLxLjRBeR
 UNOkr6SIwEPoSP2j6SCaeMrZYEPN7IFGWfzzAARC10QH8sbXzSBbJVTHMunJ1ll5Jc/Wz6C9vVl
 k2MAHRH3jz5xyn07zTA==
X-Proofpoint-ORIG-GUID: KsdXLOQG9o8aekneOhJzQYtyaHg5zWMx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160205
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113464-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F10E6951EC

This series enables the Shikra audio path on EVK targets by adding the QAIF
CPU endpoint, GPR/APM/PRM services, SoundWire and LPASS macro nodes, and
board-level sound card wiring for CQM, CQS and IQS variants.

The series is based on linux-next plus the posted Shikra dependency stack
(clock/controller, bindings and ASoC dependencies listed in prerequisite
patches below).

Patch split:
- 1-4: SoC-level audio nodes in shikra.dtsi (kept disabled)
- 5-7: board-level enablement for CQM/CQS/IQS EVKs
- 8: arm64 defconfig updates for QAIF and WSA885X-I2C

Mohammad Rafi Shaik (8):
  ASoC: dt-bindings: qcom,apr: Add modem_apps GLINK channel for shikra
  arm64: dts: qcom: shikra: Add QAIF CPU node for audio
  arm64: dts: qcom: shikra: Add gpr node
  arm64: dts: qcom: shikra: Add soundwire and macro nodes
  arm64: dts: qcom: shikra-cqm-evk: Enable sound card support
  arm64: dts: qcom: shikra-cqs-evk: Enable sound card support
  arm64: dts: qcom: shikra-iqs-evk: Enable sound card support
  arm64: defconfig: Enable Qualcomm QAIF and WSA885X-I2C drivers

 .../bindings/soc/qcom/qcom,apr.yaml           |   4 +-
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts   | 222 +++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi  |   5 +
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts   | 149 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts   | 143 ++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi          | 256 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   2 +
 7 files changed, 780 insertions(+), 1 deletion(-)


base-commit: abe651837cb394f76d738a7a747322fca3bf17ba
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
prerequisite-patch-id: e80ea7940b9817449cec21afa6e9e443e007166f
prerequisite-patch-id: 80d8ab865b7b0663c5b2878b45b55e2e4fde9c19
prerequisite-patch-id: 8e645e1c6ad6182de4813a726c293654324de1df
prerequisite-patch-id: f6781d2cf0829ccb32f1400623c95739972f2ee2
prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
prerequisite-patch-id: 39475cddaf673b2cbbae703165a782916f199885
prerequisite-patch-id: 6f7f265abfbdffdc0a1fdc5a7e08929e4eec5b7a
prerequisite-patch-id: b5d7f75df02fde56181f576a936baf09d0a72276
prerequisite-patch-id: 3ce52e07ae57139c2e2b71a29ed7d7250f6fcc87
prerequisite-patch-id: 7d92e5a301d09616840e54dc9e4a81f30a64383c
prerequisite-patch-id: 003035cc99f02794043818256ba0ef657872d511
prerequisite-patch-id: 5d23c938843176de2a02987d2832f31fe5df7fcf
prerequisite-patch-id: 430488f50f36039338965ab1fc28d83f02dbc9fd
prerequisite-patch-id: 359ddad8a3fb36f171c96da5ce5ffacd7dd63e8f
prerequisite-patch-id: a98885b9d0e0655bb3161dc2c31fd92a844a5e4e
prerequisite-patch-id: 80aead6484e36f52cb6cc7fd7d9e0326d8296860
prerequisite-patch-id: 2f1bd3efac328030dd8efe28fb95f84603868043
prerequisite-patch-id: 047b4fb1894b92109aa7afcebd7d5c7988ec5379
prerequisite-patch-id: 99977ae9253a961b85331b9808c1feff0c2cc38e
prerequisite-patch-id: 9e3edab83e9fc008b2dc254fb3b548ddd8f8b5f8
prerequisite-patch-id: a7706e25f5951ec41e6b662c1704df8d20662d77
prerequisite-patch-id: d13035abab3ff342753f5bf87b53bbf06a02c6a1
prerequisite-patch-id: 4d40e704139dc4b0ec2529c49f096d86a4e4dc5f

-- 
2.34.1


