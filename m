Return-Path: <linux-arm-msm+bounces-95058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJdfJ9CXpmltRgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:12:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE4B1EA9CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F58B30A220B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 08:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F8F388390;
	Tue,  3 Mar 2026 08:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TEGLHK6l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WlPVr7wX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B2838839F
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 08:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772525260; cv=none; b=n+XoUyO+jTN2Ng6R7VloUaImnSXVOFngTjli/fkp9u67nN6O1cchB7ofJpz2hkgKlEbO446pzHuOu0FoeLBSSUnRhaO8et2XIqg0eoNyiQftob1HY1hMqiPDY7rzU1Ts+0v9gOXFxUKvGE3Jik6Mki85XlH5BqScCAJ2mryOw0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772525260; c=relaxed/simple;
	bh=S0AVKXrUYwqU8zbmxMyMjiT72FA9zvSCBWH217K8Mgc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YexZStVHdI7b92MD/Fo/mYxBT3dawioVTOy7h9BA4jzOkZPyDddhIJZe9RHvCmLroKVwyQD1CdQwcHrgXI1JYhHmlzJKHE8yT44O3AC0v8WSmubQO8f/KMZE6sOdJNw8M0wkLn28JjLmh3B6REBkCXgfyVINb+vD5Mg4w3372WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TEGLHK6l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WlPVr7wX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6237FiuT3614680
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 08:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=s9fy5z4lexrH1d8Yz8GFG6NLw4DMv4hECuA
	Sz+5xf4M=; b=TEGLHK6lUs/voi4UmgTcY1uq8/aE9B7MSasAedJyTqXQ4dBBHSD
	gh3BjpaZVsB5wbxEmCxwwFqXzc5so85+Dbaooht6cAnd15J0IMe0sKICYrsuSt/V
	Gj1qpSeSQDQvcN8bOJpbjSDvNMdnvh3Ef0lwRAb6X1s5iPILBKIOruAmjzwfcAKX
	EbBiOybXJFczSIBO7i3dKfUVjwaSWqqArU3Y1yal58FOJfrIzD31Xl64YYHSklnX
	vBvNnORqD1Skk+B36CA1keZAajEOgCYFqbtsXo3HEAzCClQeRO5w6ycsL32jdIiA
	8//XRz5BUFk4Jh1gs/R7AQHm8az77npXDQg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnu3n851d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 08:07:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae42659a39so188212025ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 00:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772525256; x=1773130056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s9fy5z4lexrH1d8Yz8GFG6NLw4DMv4hECuASz+5xf4M=;
        b=WlPVr7wXUITFc+zIVdW1GUO4BflrBAxm0r/4lkAuvJ+JGYHawl/fhLSZgFwMnvYiKP
         Ek4nb1+o0yvPYPR9g1N+AXbpern6BQUGFoE+4OROeqIa88v906gXJNr91t+jE7L9gv7Q
         JflusGvKrQm6Ud6XgXu5gdqZE7zeF+mhu6Y66907mAIHJu6HEjfGvCu2WxJ31hEEYEBC
         zIZ/fx7T7C41YHMPKvzadiX+JRSSidPiJAvyQW9oJeXrHT5TBG88U3/mbvLjOHqvOACi
         /u/2IALXddrD1V5cx25iZy5bozZDfqmBhBimzcUOoFqeXITnznJ3VvBfs7X7DsYy4roy
         XuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772525256; x=1773130056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9fy5z4lexrH1d8Yz8GFG6NLw4DMv4hECuASz+5xf4M=;
        b=IKj808libP4G3MHuW/Y0BGPBFsueawq0+/vXTIQzeY3FW185b1cKRbDZEfchsArSrS
         J9MNYBmc/Zu2HvwfzOStctq+nx+9a00ef2ls163gHy8WyGESVc3iuNhCF0G3y9+rVJRG
         T9TpItL0xRUyD1ZhJXeDnYkE4mY8ueQLNGBHcCkkluPc2s9r6ueZMzhGjH2I3EMYyBhO
         iZQ4Tc+qyBzC4/Pl5dH55DRkdD9raQdarqi1NTFcjkc7UwWIpkKlPlDINV67cmgfu+K1
         cg4ag17Qt2S/3YgJopM//TcCtnQRBXoudZYI2ZDnxJ5rVTVjXrdaa8eV3/X9DO6lT3fj
         5FNw==
X-Gm-Message-State: AOJu0YzHauqJE3LhMhpZwOieJg8lJC2S/oLvO0+/M2T+gs5/kPzjdGvJ
	QPlXgoF2tB1HtigMhumxNMLnBzABno71ME2EGw68SpaC5aeu/5qdYL/og0LUmJr/crNQTVZ9EUe
	+HgPL9z5L7AhMfBEXSL7Vek5S87SnzDoHs4bKGdMI6uPso26zZ1L+8We1vnGOcp4Iiw0i
X-Gm-Gg: ATEYQzzBRoEDWaXy0oiOJNXqIiUQjeS1bSrreh92lkdO2vyhc+Fj/X261aIV66SxxxQ
	tu/OwXZGANAEIr7mttX0bm2m4Fg6r1AxLc8d5GaTvcNWBfvYW9N9R0wOROqOw/z5XseH00amw21
	qcjEFJ1zdKW5YDEhz6LuvBcAT9N3i+bKgJ9dhAexBFcIWD2Gmhp1ZN8uMk4BnzmO0c0P+mAkJiI
	MWWeBrd3JdmS1cw8kTdE8iiH6eTa1XsnX3fEEJ7hqkjU4lbHYN5YpnxsDQNSqralyUC3msd2uHf
	9aSomHyW4QAv7kzSLu3Of+eIufN5wo8/S2wDNBtTXTJjhvN1w9mrIyfl6QPjL0/0643rDnXWFmu
	FB8JdD3KbajDesG72pI0K2Se/RWqhtMa0fjLQDIMkj9Qs6KVkSY31/u0=
X-Received: by 2002:a17:903:b8e:b0:2ae:4c9f:4a61 with SMTP id d9443c01a7336-2ae4c9f4e10mr67630405ad.17.1772525256273;
        Tue, 03 Mar 2026 00:07:36 -0800 (PST)
X-Received: by 2002:a17:903:b8e:b0:2ae:4c9f:4a61 with SMTP id d9443c01a7336-2ae4c9f4e10mr67630105ad.17.1772525255804;
        Tue, 03 Mar 2026 00:07:35 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c3acea3sm1445883a91.16.2026.03.03.00.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:07:35 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v5 0/4] Enable tertiary USB controller in OTG mode
Date: Tue,  3 Mar 2026 13:37:24 +0530
Message-Id: <20260303080728.479557-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JaexbEKV c=1 sm=1 tr=0 ts=69a696c9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PAEsFWfe2vKCIHFHJysA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: LS8RwOyWPN4GtqmBM3KoLJwVqcyg38X6
X-Proofpoint-GUID: LS8RwOyWPN4GtqmBM3KoLJwVqcyg38X6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA1OCBTYWx0ZWRfX8zQxbhdflk9F
 wQCdAYioDv9iJJKInJmJd05qAxRVTBAv80yBnYe3rfLJA7w7C+HqYPUrKAKfP8tHGxW7kR8QJyL
 8MlLL/ZQY5I3hugFsQFQWszBvLimS0eIVgoqaGI7z46Mox6JFqyYgseJSvKjHeleMRipJzIjQ8V
 t1FDWyylAMa697oH4PKMpvMTUho4IIsjHY/+3/zqD+ZS00ykq4D8NHYzUsbS1bm6DuImhburUZ9
 Ku4WCzthgWZ1TYHHXLVq+F71R18k/Pa5PxdHjzIK80ZfgnP6xR6CX+gOytZgCfkCW98VmIQr3Xs
 uctRqYRo9tRl1ZCf/x6gmgzlVglhvU+yeBty22OIe5TI+kx09Tyw4btnZbUZ1409EKfhUVJhz9i
 zMCTFiNazjkSd8WoMyDWYdu+goh0RMXu9iyVkX5gDUhcl4sb1CQ++YexjVQL4MKV3403NXg4Auv
 nX0KYV0ZNjS6DZLYfgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030058
X-Rspamd-Queue-Id: 0AE4B1EA9CF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95058-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable tertiary USB controller in OTG mode on lemans EVK platform.

Changes in v5:
Renaming of vbus regulator for USB primary controller as per schematics and
in sync with tertiary USB controller.

Changes in v4:
Minor renaming of regulator.

Changes in v3:
Separate patches for lemans and lemans-evk.
Minor formatting changes.

Changes in v2:
Added interrupts for all expanders.
Minor formatting changes.

Link to v4:
https://lore.kernel.org/all/20260226060835.608239-1-swati.agarwal@oss.qualcomm.com/

Link to v3:
https://lore.kernel.org/all/20260225093155.4162177-1-swati.agarwal@oss.qualcomm.com/

Link to v2:
https://lore.kernel.org/all/20260210125348.2800846-1-swati.agarwal@oss.qualcomm.com/

Link to v1:
https://lore.kernel.org/all/20260206104642.1038381-1-swati.agarwal@oss.qualcomm.com/

Swati Agarwal (4):
  arm64: dts: qcom: lemans-evk: Enable GPIO expander interrupt for
    Lemans EVK
  arm64: dts: qcom: lemans: Add role-switch support and HS endpoint for
    tertiary USB controller
  arm64: dts: qcom: lemans-evk: Enable the tertiary USB controller
  arm64: dts: qcom: lemans-evk: Rename vbus regulator for Primary USB
    controller

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 102 +++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/lemans.dtsi    |   7 ++
 2 files changed, 106 insertions(+), 3 deletions(-)

-- 
2.34.1


