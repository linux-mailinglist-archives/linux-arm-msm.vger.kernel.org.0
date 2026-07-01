Return-Path: <linux-arm-msm+bounces-115604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8LFqF43NRGqP1AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:19:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E712F6EB05D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:19:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="HphP/bdq";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Tde/JqNd";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115604-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115604-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 440EB3033AD2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 08:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84CD38E5D4;
	Wed,  1 Jul 2026 08:19:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C9E39EF39
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 08:19:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782893962; cv=none; b=FsgEPiSXcymkclh+RZix7JHMz6dUHL2lGfLjFEt78jRJEH+VtcmuRAgqPNUVJd7fYoT545sw4z0ojaledKBTT1cpVW3XJl5SPJAZ7x0X9JsMsrLnrq0D1b1QdBFHLBPpNz2sF4THCmarw9ApG3rA3n7CsO9T6R7rfPEaheZppm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782893962; c=relaxed/simple;
	bh=dtjhuvoCnXLccqWVZj6HsPRujQcujkj8TP4ZOO+PYU0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hF/m6nvQqnqKrEmPyUfB6NrOscR5IUdqVq5Z7Zyxo3kvy8GjakpPAemHc6iwmmH0DjhNGO4C2tofeaWwK3oG/WI7p8dM7lzehaSgt5GsGmcCk0kxs4qiDgyySRNvEDbDjVgoZ9K9y2bBw4JV/DQU8a4hioChtzUQvtbfY1RfLyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HphP/bdq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tde/JqNd; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618G3Di492841
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 08:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fekyR3ymPZerEgvyKr3Mkf0B8N1UanGpiHz
	+MqEQZIw=; b=HphP/bdqydqVDsiIGi+X5GSqAFAurPkyr27vfZ4QCQQCE8a2lOs
	JsmK3aEZkJZWd4XY+0mFh75b7R0syFW/XDUi8ClYsQsSgrlI/1jqwSDK4jGeRuis
	I9avpBPGe1P2cNHJVtG7pqyJsfpGTjzm16biY7/shJYRVs6zsMHbphnJz+tUxMYH
	9jrwYIKpWF4ExLJ8rI+ZNElp7er9FGNrkUtIODdtjqRkY4r5iB/7stjlGu4FK6wq
	NATGzfoxWw49CdWh80R8+2+YhcG6By0sv0zGrGeYz3fbOSMVZtfKDiL9vWspFzQf
	fm9pVk/3QbyK3sPfm4jgTUewTz/2L+K7K1g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw2x5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 08:19:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-847950bb95cso314062b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 01:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782893960; x=1783498760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fekyR3ymPZerEgvyKr3Mkf0B8N1UanGpiHz+MqEQZIw=;
        b=Tde/JqNd98JnhDOmKx7GtOOM/KnGUzB62mlXTBkggYWYWgDg76gyS4sKN+Vr5YxF/S
         D+PlcHmZyDN6tuObKOM5UC0x7mhjZNJXfAnHEBapUdWcy0t5ZvJ+s4a6Fp0wxbi4RxAv
         x21Rh9G0t4s8W1w1lAo3G0YX+jnoTpelLaBq7YMFVhfbuo+sBNlzQlVDfG8oD5GCOiR6
         Xi8Y5qEziEB70oJWAstsejN28UASV8hFUdd6A2BnEYYYL3Lzs8+BAcTY6+RM2F3EPXrK
         cLbIksM+8pybqSOzDtkif3Iyye5h9tiqTP9wBf2Vey3r8euJ1LdOT/zrLTJLq2WSPV55
         n98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782893960; x=1783498760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fekyR3ymPZerEgvyKr3Mkf0B8N1UanGpiHz+MqEQZIw=;
        b=lrdFZh5C5k82+JlRW8odFTl3Ys/LUGvqvP8azW19d4uBazoP8TLuto7LzhNvMOgz86
         nc8bP+MS8fcQA3vN9z8y1RlQ2vBBkD+W5vSkeR7QB7dKJBJiTO2Kfy+TqeEoo2P8OLej
         JydPJAZUTX68X50dX4Z9uU2V04W/zDHcI50eShCk6pdWH09e56MmVu9PnASNlQ2j3PXZ
         w46b15sm5JLKBIfK4vFC8FHku+mwyPbgSvl7Q5IXlY987Eh+6p8WaOFxLhKtGVOLwWPz
         v7AHiWyhY67VRlMiN6mFS0XE3zR4IijBlzKfu0L+BNnzob/jx4xpTT7qVLe0Mpyfkwod
         WHxA==
X-Gm-Message-State: AOJu0YxP/RJ06LT6Tr2a4bwHFH4AcG+LKUediSqpEkW29N2o7dCl9+eA
	/OWUHY1q7qoos3TcnUvqNMunIup7Qy7fu09+pIjJT4bRzaBDKr3RSczu3PnkktmnBKEtPCzpNIy
	acob7xfyUBNJOPlmEY0C+b5M7tncOwWbNGSYelRtpclJWpPDf0WoioCjf7uB/5pA4aqHs
X-Gm-Gg: AfdE7cmVODVpMNXDqMPrnyw1zAKDw987yN9QUf+n0n9KjU+VSdCYY/MotBGKROP/Sbx
	sBMx7eLTiQrykd1E04iveC7ZO452r4+i7h3fCQoITIgH7lTJCWHKAzdiScRFDCa6hP6aFj0CipU
	TCI0nFrsLVy3QBGfBYUQThC2hGvMNEpbjuz52CxSPejawuqalDdiJyOocj2j0EAkLH0cb408VK4
	4c24tYgn3tN4Nu47VQCZJkmiupCrt8ZTbVALUh1vD3VrubxmKb6ObxR8lUgBYTe5LJZxXkqAJw7
	A3e7i5dVQV07MqdkRwfBVYGzm4EGPxa8CuVuHBlvDJO5dZBvbt/ox2ooB+dY0oly4QDJ4M+sjru
	LpmOoC6+iJPf4p5dnSs6OM9o+Ui+5EoHez0XX1GMxfr8zjA==
X-Received: by 2002:a05:6a00:301a:b0:845:d286:1fbe with SMTP id d2e1a72fcca58-847c0a064b1mr520125b3a.60.1782893960369;
        Wed, 01 Jul 2026 01:19:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:301a:b0:845:d286:1fbe with SMTP id d2e1a72fcca58-847c0a064b1mr520088b3a.60.1782893959851;
        Wed, 01 Jul 2026 01:19:19 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fffa65bsm3611542b3a.21.2026.07.01.01.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:19:19 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V3 0/3] arm64: dts: qcom: Monaco: Enable SDHCI storage support
Date: Wed,  1 Jul 2026 13:47:12 +0530
Message-Id: <20260701081715.2580329-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a44cd88 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=972t8ukbrjnbrM4mtFgA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: QNOqNcMVbdLPf-uR1MZwrE3UepC2Jxtb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4MyBTYWx0ZWRfX3H4YaAYX0kOf
 oUp+2EKYOtnvx1FGIXgvZ/04AxDlJ56QjgY/PNBHUErr2zpiG5VImhnTC/7EFtnlMskDMa1ZEOp
 1Og7b0XEyFqofIMVjIybKeX4r1UnYJY=
X-Proofpoint-GUID: QNOqNcMVbdLPf-uR1MZwrE3UepC2Jxtb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4MyBTYWx0ZWRfXyBThBvNyfjIJ
 w5B8SMI3rgeX8BKkqTRP6ZFNXV6GBPNrfTEIB9mSDNB6AJsR6uYqYQ2ynMO3yaunSfBtNnJoLHy
 XQuoNEFKn0MppdI/uHYd38VOmqPUiV+8FKAX2j5erHJKxsVAlz87o53M1KXEYytkWURwt2ItPK5
 jB9ldGQjVFpHhtqNdvFGlbDW0dJEMffQEaAPs4/2806rBBwYRfSi/v/sf8Kv2dE7N8hwoAxRmbW
 /hApr0MgnzoxKj1IwjoVdKsfBOEfrCldn57EHy6bW78eTAvcZERYvW3hyDZHnzABpmFhf1zXFDN
 LbD/vNtkbk09WS2XQ3Od4gN8udi8k64KnWwzYNfJH72femvrIPQmuDHfCZ2ME4vL+JWeeVXt2tM
 xTebiV6MDr9rN6LjeBnaIHwAaYlYtdN+e9y5Os8zZzq1YTqJ/8x6uKdnRIBWYnwkK7756zdXmyG
 5NQxQ5NbTPYeu8F18oA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115604-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sarthak.garg@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:nitin.rawat@oss.qualcomm.com,m:shiraz.hashim@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E712F6EB05D

Respected Maintainers,

This is v3 of the Monaco SDHCI storage support series.

Changes in v3:
- Update the patch to handle the supports-cqe property for monaco-monza-som platform which also extends the monaco SoC DT
- Link to v2: https://lore.kernel.org/all/20260616130347.3096034-1-monish.chunara@oss.qualcomm.com/

Changes in v2:
- Avoids using the reference to direct supplies as dummy
- Updates the eMMC overlay to remove the static UFS host disablement and
  vreg_l8a voltage override, allowing DT-fixup to manage the UFS-eMMC mutual
  exclusion dynamically for flexible UFS/eMMC configurations.
- Link to v1: https://lore.kernel.org/all/20260227105055.2364348-1-monish.chunara@oss.qualcomm.com/

Validated on Qualcomm Monaco EVK with both SD card and eMMC modules.

Monish Chunara (3):
  arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
  arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
  arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay

 arch/arm64/boot/dts/qcom/Makefile             |  7 ++
 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso | 37 ++++++++++
 .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
 .../arm64/boot/dts/qcom/monaco-monza-som.dtsi |  1 +
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  1 -
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     |  1 +
 6 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso

-- 
2.34.1


