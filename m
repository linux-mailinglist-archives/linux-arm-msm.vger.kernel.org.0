Return-Path: <linux-arm-msm+bounces-104593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLHNH2/L7mkMxwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 04:35:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C7346C213
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 04:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EDF67300147C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 02:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CE725DB0D;
	Mon, 27 Apr 2026 02:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1No2E06";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H5TIUzoV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59744250C06
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777257324; cv=none; b=We34cxnja2KbTRdzbAddlkPJlKgaKrpYX8fuH3tqJbw3AznVLI1qfS6SeC14DD6OQ7XY/KxWavlOICXsiTfNbu4y8R8dicF4h+u5LcgVT3vkycFnWbYnD6tbBFrphF15IPq2kRECfn41ubZqG405gQJcDcqo+MXRdZd6VAyKSz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777257324; c=relaxed/simple;
	bh=WgIwEhQWBLCpSWCFtwu4ZW1y8BfE4OLiC0RqGot6eno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UCBbD2+jpNHeZG29Inb85gfHX0vwuL19auVEkpaFvJkmTkuPBoeZ52UA3aHSvzi/5FOyJ1QalVvVRfV4Lsfj0whNW/qhV2HxEiAy3PqgWGzBF3ZBZt7j05mQvDwdPd3bQSiz635RPQR2UbSpNs0fEVnyaF7NTouaLxUzvGZ2pLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k1No2E06; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H5TIUzoV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63Q9AMAd4190774
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KvyUXeaNJ/bj+E1FtiJrSA
	emMqmopoVbHlry/+nJw+c=; b=k1No2E06X+0NL4csP+P5DuWW1oZRjK/o7sJAYp
	yzljKiRu6EFwvh2ZRSmAlZ54mORLpZICWxaV8k7F22rCFm0EuF5TuYEq8uPCYu16
	zcwnDA3H7EABJXJgmpY5+K6mNSX/MZ0tCoMsfEK0Iy8cylDOLqh0CETuyT29IOs8
	Cb8BkKb54o+me/8OmjYti1aAER6I8mIzQ6wtYphcyZZsV6PRgP4gR/DyduwwE0h6
	lJm920C1EIMZMDKMBIxRQAzYrrZiRGvLJNaj28il0DrBKCqc36PjAR/6OIISOtzd
	r5liDQ5SD+RLZbnHLqEqpPbgCK/63EJmb1dRveX5ZbORNm9A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnu2v26b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:35:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so15082724eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 19:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777257322; x=1777862122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KvyUXeaNJ/bj+E1FtiJrSAemMqmopoVbHlry/+nJw+c=;
        b=H5TIUzoV3Kh8cRCHKDFTTfR8q2G4Uh7JEhc/kRd/TV7/ChwHVXxCNwTbD6q3Hs1tv9
         oZphFKPIyubWtoflH+lHFFG8i1Y57Dc3aytSkxzh/s3fx6wYzm9TJnKPviPOnAZkYy6Z
         TckRm5zhNq3Une13uMAGM7QVpJ4Z8sJQVxm94cXhRwCo1N5yLUy5j4MDxVXEEeVNLjx6
         AI6zxLMCPtSAz0TGtuJmFu+wxxmnHFHQMBdKbXBYZdkVzxGT4OQqQrXn7yXBzdrjbn8g
         7YkF0L7XZcrVQrvrRMd1MlsS4eLSmLB3ip05hvK6udHIARfYhKmSNMc5B2QDsZBrUcOC
         7vrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777257322; x=1777862122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvyUXeaNJ/bj+E1FtiJrSAemMqmopoVbHlry/+nJw+c=;
        b=Jxx2h1j6xKJujVzlZbMJQx3jvBoGpCdKl9A7x8wS04aterFz3tSyqb5LSeOdTL92Ht
         FO+M6gogjGcnG0WsloaS/tTvgwBjPuOixNX8GSBW3cSyOim01OH5oCGpIavkwsn9mK4p
         pYQlAkhq4JJJ193mTGKRtlLTtt9ei7eFHuzqMaH2WWZJeHSqwN1wYT6scqUJQDy8ebfp
         LVUu7xXiHkPMWfAaBhbSxtB0GJMI3ni7CBa0EB5cQlqVAPrnR0Vos6Gr1g0m+xa4+nDt
         gLPOxj/Qqdnon+1oBoUhrZrskjhYkoGpeic5thfEGhuUZ9sGrU/qZrwUf00o1awiJ5bI
         vKnA==
X-Forwarded-Encrypted: i=1; AFNElJ970kN7M5QwhpHMJVZdr448LcuxiShuGwBCL8YH+eMJWEn6a50czcuLyLWvqm3oSmvCbKuQwbBTv8p9Jjtw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi88BeDOxihMXwxTvrXbnV1NJx/N4zxeWwG/Vc2lXsA69BoaLz
	02bKBZXrGiyWgL1l6eV0yV3orwUX2EH8UghNbnS0wBSN05H8cdIf1nIdKxt9xrK1r1Fu4D1NKFH
	LBI/IBiXVKX2BaTfxkntAxpWDyxIE6AWYhzZSNwjxRijCo6+ZwlF6V4m703hki+ASeBqv
X-Gm-Gg: AeBDietHYrgC7O3fPHqu8GYHa7TbO8uJa22D82Vce5z7NXGLfaDw72698mDuJVHW6C+
	WXFPiiKEzOI9MrsBd8ZgAdLRE4shLVI6WPMjqqc5R1/mVKQbigDdPUAUHn/qnbB+UpE6RmNdThi
	VOl+rkk3Xm5Mt90Ql6EwgisJjaeJ94V5iXDg7mDAQGVComBI2TjOhnnUQhH+UzNKYBShYycayev
	R2ijKk6UABgR6lITw/TfjUgRJnl4XpUgJRJQzFKBpfSmvuHd+JPFr1xXPIZ2ByjFMmGUbTCQ9Na
	YJwwaMcyymZVn19G6UKu3fWJV38yLALtkJh3w4oPo9VQH5o80yDDV5z6mwaT/pfahXDzrNPRp/o
	9kXuB2OguBN2+CAUjKjiM0n2A3GoMjGID4LziLG2coQn3hs1ytfXqQeh8txFRsn42Gx6q0h9n9L
	Iy/fTJyOWlXRGZl+Eu
X-Received: by 2002:a05:7301:6402:b0:2e6:ff79:e356 with SMTP id 5a478bee46e88-2e6ff7a0423mr12870705eec.11.1777257321845;
        Sun, 26 Apr 2026 19:35:21 -0700 (PDT)
X-Received: by 2002:a05:7301:6402:b0:2e6:ff79:e356 with SMTP id 5a478bee46e88-2e6ff7a0423mr12870700eec.11.1777257321246;
        Sun, 26 Apr 2026 19:35:21 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8018sm52916316eec.8.2026.04.26.19.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 19:35:20 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/4] Add initial device trees for Nord SA8797P
Date: Mon, 27 Apr 2026 10:34:51 +0800
Message-ID: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PF3fKA59ZGiofuC97ZAhQPfg5sywOYYl
X-Authority-Analysis: v=2.4 cv=cbriaHDM c=1 sm=1 tr=0 ts=69eecb6a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RxILFXLYZUwLOxrMI-MA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: PF3fKA59ZGiofuC97ZAhQPfg5sywOYYl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAyNiBTYWx0ZWRfXxX74BQTJ/xm3
 cf4TH0BdbNDQRuBy9TfJbmoEDp82UDCUSryV7yQXSyRmdG8i7Fm0VpMeCPh3fLYSlqpkJfQcpcQ
 J4aymmT32VlAZimjJ3GcTZ0cRN1OeLK3Del9GtigzLsqLqpSyzdILzzKdPlulv95TaSR3IQ5ggT
 x9+7DKyX9eW8w73wRzdX5oq+MbZFer0wraS69ZlWmYUYkGBjbKhP5Gzwe4j4elNey4psWMuKXnn
 BmrXyetAY1XQ+439j0s8XOhyUhndRSFwHSM/BH7iHMSO5TTGyK51AFQYCbiOMbD3BT+f8OSYjWZ
 qu3lf9fnZDjpahq8I7HbRDaH3qzY+35OlUEK2J29mEgAWpsfhidA7qdayVO27dcE7Lh5Vmbb9Ea
 9ABxOCb+Q34PImLwyvllqBdCtZzPGE5iavCVGcZWjpaa43QTAB0X5lMfgKkCXnzf5OBEEThIjgS
 uozfgzUmy7y3gc5JN7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270026
X-Rspamd-Queue-Id: 15C7346C213
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104593-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This series adds initial device tree support for Qualcomm's Nord SA8797P
SoC and the SA8797P Ride reference board.

The Nord is a new generation of SoC series from Qualcomm built around
18 Oryon cores (qcom,oryon-1-5) organized in three clusters. SA8797P
is the automotive variant in the family.  The IoT variant IQ-10 will be
added later, by sharing the base nord.dtsi with SA8797P.

The series is organized as follows:

 - Patch 1/4 adds nord.dtsi, the base device tree for the Nord SoC series,
   covering CPU topology with PSCI-based power management and idle states,
   GICv3 interrupt controller with ITS, TLMM GPIO/pinctrl, 8 TSENS thermal
   sensors, 3 APPS SMMU-500 instances, 3 QUPv3 GENI SE QUP blocks, PDP
   SCMI channel and mailbox, watchdog, TRNG, TCSR, CMD-DB, firmware SCM,
   reserved memory, PSCI and architected timers.

 - Patch 2/4 adds nord-sa8797p.dtsi, the SA8797P SoC-level include on top
   of nord.dtsi. It reserves 64 SCMI shared memory regions for SMC-based
   firmware communication, enables three QUPv3 UART controllers with SCMI
   power and performance domains, the UFS host controller and GPU SMMU with
   their respective SCMI power domains. A new scmi-common.dtsi is also
   introduced to factor out the firmware-level SCMI channel nodes shared
   across SCMI-based SoCs.

 - Patch 3/4 documents the SA8797P Ride board compatible string in the
   dt-bindings.

 - Patch 4/4 adds sa8797p-ride.dts, the board-level device tree for the
   SA8797P Ride reference board, enabling UART15 as the primary console,
   UART4 as secondary serial, UFS storage, and thermal zones for PMIC dies,
   UFS and two SDRAM sensors via the SCMI sensor protocol on channel 23.

The dependent driver/binding changes:

 - SoC ID: https://lore.kernel.org/all/20260427003531.229671-1-shengchao.guo@oss.qualcomm.com/
 - CPUs: https://lore.kernel.org/all/20260427004619.229843-1-shengchao.guo@oss.qualcomm.com/
 - CPUCP mailbox: https://lore.kernel.org/all/20260427005236.230106-1-shengchao.guo@oss.qualcomm.com/
 - GENI SE QUP: https://lore.kernel.org/all/20260427005901.230237-1-shengchao.guo@oss.qualcomm.com/
 - Serial: https://lore.kernel.org/all/20260427010114.230341-1-shengchao.guo@oss.qualcomm.com/
 - ICE: https://lore.kernel.org/all/20260427010527.230473-1-shengchao.guo@oss.qualcomm.com/
 - Interconnect: https://lore.kernel.org/all/20260420021351.1239355-1-shengchao.guo@oss.qualcomm.com/
 - PDC: https://lore.kernel.org/all/20260427010922.230586-1-shengchao.guo@oss.qualcomm.com/
 - PMIC PMAU0102 model: https://lore.kernel.org/all/20260419131523.1232835-1-shengchao.guo@oss.qualcomm.com/
 - RPMH regulator: https://lore.kernel.org/all/20260427011159.230698-1-shengchao.guo@oss.qualcomm.com/
 - RPMH powerdomain: https://lore.kernel.org/all/20260414035909.652992-1-shengchao.guo@oss.qualcomm.com/
 - SCM: https://lore.kernel.org/all/20260427011346.230844-1-shengchao.guo@oss.qualcomm.com/
 - APPS SMMU: https://lore.kernel.org/all/20260427011728.231026-1-shengchao.guo@oss.qualcomm.com/
 - TCSR: https://lore.kernel.org/all/20260427012116.231226-1-shengchao.guo@oss.qualcomm.com/
 - TLMM: https://lore.kernel.org/all/20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com/
 - TRNG: https://lore.kernel.org/all/20260427012308.231350-1-shengchao.guo@oss.qualcomm.com/
 - TSENS: https://lore.kernel.org/all/20260427012511.231475-1-shengchao.guo@oss.qualcomm.com/
 - UFS PHY: https://lore.kernel.org/all/20260427012732.231611-1-shengchao.guo@oss.qualcomm.com/
 - UFS: https://lore.kernel.org/all/20260427013115.231731-1-shengchao.guo@oss.qualcomm.com/
 - Watchdog: https://lore.kernel.org/all/20260427013236.231841-1-shengchao.guo@oss.qualcomm.com/

Deepti Jaggi (2):
  arm64: dts: qcom: Add device tree for Nord SA8797P SoC
  arm64: dts: qcom: Add device tree for SA8797P Ride board

Shawn Guo (2):
  arm64: dts: qcom: Add device tree for Nord SoC series
  dt-bindings: arm: qcom: Document SA8797P Ride board

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi    |  941 ++++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 4511 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8797p-ride.dts     |  306 ++
 arch/arm64/boot/dts/qcom/scmi-common.dtsi     | 1918 +++++++
 6 files changed, 7683 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8797p-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/scmi-common.dtsi

-- 
2.43.0


